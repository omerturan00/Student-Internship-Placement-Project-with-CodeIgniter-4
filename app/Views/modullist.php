<div class="card">
    <div class="card-header">
        <div class="card-header">
            <div class="row">
                <div class="col-lg-8">
                    <i class="fa fa-list"></i> Modül Listesi
                </div>
                <div class="col-lg-4 text-right">
                    <a class="btn btn-primary" href="<?=base_url('modul/add')?>"><i class="fa fa-plus"></i> Yeni Kayıt</a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Modül</th>
                        <th class="text-center">Güncelle</th>
                        <th class="text-center">Sil</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Modül</th>
                        <th class="text-center">Güncelle</th>
                        <th class="text-center">Sil</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <?php for ($i = 0; $i < count($datas); $i++) {?>
                        <tr>
                            <td><?=$datas[$i]->Id?></td>
                            <td><?=$datas[$i]->Name?></td>
                            <td class="text-center">
                                <?php
                                foreach ($authorities as $item) {
                                    if ($item->Modul_Id == $datas[$i]->Id) {
                                        if ($item->Updating == 1){
                                            ?>
                                            <a href="#" class="btn btn-primary"><i class="fa fa-pencil"></i> Güncelle</a>
                                            <?php
                                        }else{
                                            ?>
                                            <span class="text-danger"><i class="fa fa-times"></i></span>
                                            <?php
                                        }
                                    }
                                }
                                ?>
                            </td>
                            <td class="text-center">
                                <?php
                                foreach ($authorities as $item) {
                                    if ($item->Modul_Id == $datas[$i]->Id) {
                                        if ($item->Deletion == 1){
                                            ?>
                                            <a href="#" class="btn btn-danger"><i class="fa fa-trash-alt"></i> Sil</a>
                                            <?php
                                        }else{
                                            ?>
                                            <span class="text-danger"><i class="fa fa-times"></i></span>
                                            <?php
                                        }
                                    }
                                }
                                ?>
                            </td>
                        </tr>
                    <?php }?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>