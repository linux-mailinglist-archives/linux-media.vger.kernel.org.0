Return-Path: <linux-media+bounces-15708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E1944AE8
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 14:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AE66282B9B
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D481219FA7A;
	Thu,  1 Aug 2024 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkFqLKbM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A817189B90;
	Thu,  1 Aug 2024 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513955; cv=none; b=LuHkms1x9okmyzv1h8gpRVYPi7OTmxuSpyC1vDQVjbsZoCnz+TAukvCjv/f743881Nz2jPN8expIWt7o+QbghUsQ10IkNZZejKn8KX8awueqySUXTGrD7eNonp8v8o6ays7wkThsoz+joNAAmyHM17RkUIh1E2JvE+j2YjDrvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513955; c=relaxed/simple;
	bh=hQGpY8tJlsjoqtAXCFjMYrygBhOgLOEkOqTm/xHQp5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bm8qMysPyYMWfp9dl7dhyopjQ3ZUFyv5STqW5vhRtxa4YP2wpXP1Jsm0I93XzRijfhjm6m/qOLEdf1LBB1V8q49fOjzbSm+uM7+DlKLNzbH6R1QXRUky/nloJN7OUqL6xIa/rwOPrO5ChzITuCCp8w4ku+0GQgXV4/tclzT2GOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkFqLKbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486FBC4AF09;
	Thu,  1 Aug 2024 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722513955;
	bh=hQGpY8tJlsjoqtAXCFjMYrygBhOgLOEkOqTm/xHQp5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkFqLKbMW+r5rbXY+wYlFUVrrnN2uG9n5mHJc1Zc7H01GWT6SVteskvcem/ET81Qo
	 slUsrPOOvMnGtEJkPCa/mztJJGjslpcmRp0jo/9Uhvk/Ks2VCKj+/V0/128YpeJySI
	 IBx9n7Sd0WBKLxwXgTFovyhfs9MeY6yXsYiNIAphBZHKNr9h/+o4qsYGqdAdBL3Khm
	 auklwnicpLITndnoXiR8Y5YZ2+AgmQsNqE0WSyVZcleQaBJtNY4Hptv1XtBCppfU6c
	 OyZ6HvBKh1MWHUox+ikwDySpyXJ2VAHSUbmIOkc9xNNwcSyXXkUakKebJzEN8wOch/
	 SKx1tiatM+q+w==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Michael Margolin <mrgolin@amazon.com>,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Selvin Xavier <selvin.xavier@broadcom.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>
Subject: [PATCH rdma-next 7/8] RDMA/mlx5: Add support for DMABUF MR registrations with Data-direct
Date: Thu,  1 Aug 2024 15:05:16 +0300
Message-ID: <1f99d8020ed540d9702b9e2252a145a439609ba6.1722512548.git.leon@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722512548.git.leon@kernel.org>
References: <cover.1722512548.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yishai Hadas <yishaih@nvidia.com>

Add support for DMABUF MR registrations with Data-direct device.

Upon userspace calling to register a DMABUF MR with the data direct bit
set, the below algorithm will be followed.

1) Obtain a pinned DMABUF umem from the IB core using the user input
parameters (FD, offset, length) and the DMA PF device.  The DMA PF
device is needed to allow the IOMMU to enable the DMA PF to access the
user buffer over PCI.

2) Create a KSM MKEY by setting its entries according to the user buffer
VA to IOVA mapping, with the MKEY being the data direct device-crossed
MKEY. This KSM MKEY is umrable and will be used as part of the MR cache.
The PD for creating it is the internal device 'data direct' kernel one.

3) Create a crossing MKEY that points to the KSM MKEY using the crossing
access mode.

4) Manage the KSM MKEY by adding it to a list of 'data direct' MKEYs
managed on the mlx5_ib device.

5) Return the crossing MKEY to the user, created with its supplied PD.

Upon DMA PF unbind flow, the driver will revoke the KSM entries.
The final deregistration will occur under the hood once the application
deregisters its MKEY.

Notes:
- This version supports only the PINNED UMEM mode, so there is no
  dependency on ODP.
- The IOVA supplied by the application must be system page aligned due to
  HW translations of KSM.
- The crossing MKEY will not be umrable or part of the MR cache, as we
  cannot change its crossed (i.e. KSM) MKEY over UMR.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/hw/mlx5/main.c         |  11 +
 drivers/infiniband/hw/mlx5/mlx5_ib.h      |   8 +
 drivers/infiniband/hw/mlx5/mr.c           | 304 +++++++++++++++++++---
 drivers/infiniband/hw/mlx5/odp.c          |   5 +-
 drivers/infiniband/hw/mlx5/umr.c          |  93 ++++---
 drivers/infiniband/hw/mlx5/umr.h          |   1 +
 include/uapi/rdma/mlx5_user_ioctl_cmds.h  |   4 +
 include/uapi/rdma/mlx5_user_ioctl_verbs.h |   4 +
 8 files changed, 358 insertions(+), 72 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index fc0562f07249..b85ad3c0bfa1 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -3490,6 +3490,7 @@ static int mlx5_ib_data_direct_init(struct mlx5_ib_dev *dev)
 	if (ret)
 		return ret;
 
+	INIT_LIST_HEAD(&dev->data_direct_mr_list);
 	ret = mlx5_data_direct_ib_reg(dev, vuid);
 	if (ret)
 		mlx5_ib_free_data_direct_resources(dev);
@@ -3882,6 +3883,14 @@ ADD_UVERBS_ATTRIBUTES_SIMPLE(
 				   dump_fill_mkey),
 		UA_MANDATORY));
 
+ADD_UVERBS_ATTRIBUTES_SIMPLE(
+	mlx5_ib_reg_dmabuf_mr,
+	UVERBS_OBJECT_MR,
+	UVERBS_METHOD_REG_DMABUF_MR,
+	UVERBS_ATTR_FLAGS_IN(MLX5_IB_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+			     enum mlx5_ib_uapi_reg_dmabuf_flags,
+			     UA_OPTIONAL));
+
 static const struct uapi_definition mlx5_ib_defs[] = {
 	UAPI_DEF_CHAIN(mlx5_ib_devx_defs),
 	UAPI_DEF_CHAIN(mlx5_ib_flow_defs),
@@ -3891,6 +3900,7 @@ static const struct uapi_definition mlx5_ib_defs[] = {
 	UAPI_DEF_CHAIN(mlx5_ib_create_cq_defs),
 
 	UAPI_DEF_CHAIN_OBJ_TREE(UVERBS_OBJECT_DEVICE, &mlx5_ib_query_context),
+	UAPI_DEF_CHAIN_OBJ_TREE(UVERBS_OBJECT_MR, &mlx5_ib_reg_dmabuf_mr),
 	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(MLX5_IB_OBJECT_VAR,
 				UAPI_DEF_IS_OBJ_SUPPORTED(var_is_supported)),
 	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(MLX5_IB_OBJECT_UAR),
@@ -4396,6 +4406,7 @@ void mlx5_ib_data_direct_bind(struct mlx5_ib_dev *ibdev,
 void mlx5_ib_data_direct_unbind(struct mlx5_ib_dev *ibdev)
 {
 	mutex_lock(&ibdev->data_direct_lock);
+	mlx5_ib_revoke_data_direct_mrs(ibdev);
 	ibdev->data_direct_dev = NULL;
 	mutex_unlock(&ibdev->data_direct_lock);
 }
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index e915a62da49c..be83a4d91a34 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -682,6 +682,8 @@ struct mlx5_ib_mr {
 	struct mlx5_ib_mkey mmkey;
 
 	struct ib_umem *umem;
+	/* The mr is data direct related */
+	u8 data_direct :1;
 
 	union {
 		/* Used only by kernel MRs (umem == NULL) */
@@ -719,6 +721,10 @@ struct mlx5_ib_mr {
 			} odp_destroy;
 			struct ib_odp_counters odp_stats;
 			bool is_odp_implicit;
+			/* The affilated data direct crossed mr */
+			struct mlx5_ib_mr *dd_crossed_mr;
+			struct list_head dd_node;
+			u8 revoked :1;
 		};
 	};
 };
@@ -1169,6 +1175,7 @@ struct mlx5_ib_dev {
 	/* protect resources needed as part of reset flow */
 	spinlock_t		reset_flow_resource_lock;
 	struct list_head	qp_list;
+	struct list_head data_direct_mr_list;
 	/* Array with num_ports elements */
 	struct mlx5_ib_port	*port;
 	struct mlx5_sq_bfreg	bfreg;
@@ -1437,6 +1444,7 @@ struct ib_mr *mlx5_ib_reg_dm_mr(struct ib_pd *pd, struct ib_dm *dm,
 void mlx5_ib_data_direct_bind(struct mlx5_ib_dev *ibdev,
 			      struct mlx5_data_direct_dev *dev);
 void mlx5_ib_data_direct_unbind(struct mlx5_ib_dev *ibdev);
+void mlx5_ib_revoke_data_direct_mrs(struct mlx5_ib_dev *dev);
 
 #ifdef CONFIG_INFINIBAND_ON_DEMAND_PAGING
 int mlx5_ib_odp_init_one(struct mlx5_ib_dev *ibdev);
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 1dfd9124bdd1..6829e3688b60 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -43,6 +43,7 @@
 #include "dm.h"
 #include "mlx5_ib.h"
 #include "umr.h"
+#include "data_direct.h"
 
 enum {
 	MAX_PENDING_REG_MR = 8,
@@ -54,7 +55,9 @@ static void
 create_mkey_callback(int status, struct mlx5_async_work *context);
 static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 				     u64 iova, int access_flags,
-				     unsigned int page_size, bool populate);
+				     unsigned int page_size, bool populate,
+				     int access_mode);
+static int __mlx5_ib_dereg_mr(struct ib_mr *ibmr);
 
 static void set_mkc_access_pd_addr_fields(void *mkc, int acc, u64 start_addr,
 					  struct ib_pd *pd)
@@ -1126,12 +1129,10 @@ static unsigned int mlx5_umem_dmabuf_default_pgsz(struct ib_umem *umem,
 
 static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 					     struct ib_umem *umem, u64 iova,
-					     int access_flags)
+					     int access_flags, int access_mode)
 {
-	struct mlx5r_cache_rb_key rb_key = {
-		.access_mode = MLX5_MKC_ACCESS_MODE_MTT,
-	};
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	struct mlx5r_cache_rb_key rb_key = {};
 	struct mlx5_cache_ent *ent;
 	struct mlx5_ib_mr *mr;
 	unsigned int page_size;
@@ -1144,6 +1145,7 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 	if (WARN_ON(!page_size))
 		return ERR_PTR(-EINVAL);
 
+	rb_key.access_mode = access_mode;
 	rb_key.ndescs = ib_umem_num_dma_blocks(umem, page_size);
 	rb_key.ats = mlx5_umem_needs_ats(dev, umem, access_flags);
 	rb_key.access_flags = get_unchangeable_access_flags(dev, access_flags);
@@ -1154,7 +1156,7 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 	 */
 	if (!ent) {
 		mutex_lock(&dev->slow_path_mutex);
-		mr = reg_create(pd, umem, iova, access_flags, page_size, false);
+		mr = reg_create(pd, umem, iova, access_flags, page_size, false, access_mode);
 		mutex_unlock(&dev->slow_path_mutex);
 		if (IS_ERR(mr))
 			return mr;
@@ -1175,13 +1177,71 @@ static struct mlx5_ib_mr *alloc_cacheable_mr(struct ib_pd *pd,
 	return mr;
 }
 
+static struct ib_mr *
+reg_create_crossing_vhca_mr(struct ib_pd *pd, u64 iova, u64 length, int access_flags,
+			    u32 crossed_lkey)
+{
+	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	int access_mode = MLX5_MKC_ACCESS_MODE_CROSSING;
+	struct mlx5_ib_mr *mr;
+	void *mkc;
+	int inlen;
+	u32 *in;
+	int err;
+
+	if (!MLX5_CAP_GEN(dev->mdev, crossing_vhca_mkey))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mr = kzalloc(sizeof(*mr), GFP_KERNEL);
+	if (!mr)
+		return ERR_PTR(-ENOMEM);
+
+	inlen = MLX5_ST_SZ_BYTES(create_mkey_in);
+	in = kvzalloc(inlen, GFP_KERNEL);
+	if (!in) {
+		err = -ENOMEM;
+		goto err_1;
+	}
+
+	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
+	MLX5_SET(mkc, mkc, crossing_target_vhca_id,
+		 MLX5_CAP_GEN(dev->mdev, vhca_id));
+	MLX5_SET(mkc, mkc, translations_octword_size, crossed_lkey);
+	MLX5_SET(mkc, mkc, access_mode_1_0, access_mode & 0x3);
+	MLX5_SET(mkc, mkc, access_mode_4_2, (access_mode >> 2) & 0x7);
+
+	/* for this crossing mkey IOVA should be 0 and len should be IOVA + len */
+	set_mkc_access_pd_addr_fields(mkc, access_flags, 0, pd);
+	MLX5_SET64(mkc, mkc, len, iova + length);
+
+	MLX5_SET(mkc, mkc, free, 0);
+	MLX5_SET(mkc, mkc, umr_en, 0);
+	err = mlx5_ib_create_mkey(dev, &mr->mmkey, in, inlen);
+	if (err)
+		goto err_2;
+
+	mr->mmkey.type = MLX5_MKEY_MR;
+	set_mr_fields(dev, mr, length, access_flags, iova);
+	mr->ibmr.pd = pd;
+	kvfree(in);
+	mlx5_ib_dbg(dev, "crossing mkey = 0x%x\n", mr->mmkey.key);
+
+	return &mr->ibmr;
+err_2:
+	kvfree(in);
+err_1:
+	kfree(mr);
+	return ERR_PTR(err);
+}
+
 /*
  * If ibmr is NULL it will be allocated by reg_create.
  * Else, the given ibmr will be used.
  */
 static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 				     u64 iova, int access_flags,
-				     unsigned int page_size, bool populate)
+				     unsigned int page_size, bool populate,
+				     int access_mode)
 {
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
 	struct mlx5_ib_mr *mr;
@@ -1190,7 +1250,9 @@ static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 	int inlen;
 	u32 *in;
 	int err;
-	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
+	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg)) &&
+		(access_mode == MLX5_MKC_ACCESS_MODE_MTT);
+	bool ksm_mode = (access_mode == MLX5_MKC_ACCESS_MODE_KSM);
 
 	if (!page_size)
 		return ERR_PTR(-EINVAL);
@@ -1213,7 +1275,7 @@ static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 	}
 	pas = (__be64 *)MLX5_ADDR_OF(create_mkey_in, in, klm_pas_mtt);
 	if (populate) {
-		if (WARN_ON(access_flags & IB_ACCESS_ON_DEMAND)) {
+		if (WARN_ON(access_flags & IB_ACCESS_ON_DEMAND || ksm_mode)) {
 			err = -EINVAL;
 			goto err_2;
 		}
@@ -1229,14 +1291,22 @@ static struct mlx5_ib_mr *reg_create(struct ib_pd *pd, struct ib_umem *umem,
 	mkc = MLX5_ADDR_OF(create_mkey_in, in, memory_key_mkey_entry);
 	set_mkc_access_pd_addr_fields(mkc, access_flags, iova,
 				      populate ? pd : dev->umrc.pd);
+	/* In case a data direct flow, overwrite the pdn field by its internal kernel PD */
+	if (umem->is_dmabuf && ksm_mode)
+		MLX5_SET(mkc, mkc, pd, dev->ddr.pdn);
+
 	MLX5_SET(mkc, mkc, free, !populate);
-	MLX5_SET(mkc, mkc, access_mode_1_0, MLX5_MKC_ACCESS_MODE_MTT);
+	MLX5_SET(mkc, mkc, access_mode_1_0, access_mode);
 	MLX5_SET(mkc, mkc, umr_en, 1);
 
 	MLX5_SET64(mkc, mkc, len, umem->length);
 	MLX5_SET(mkc, mkc, bsf_octword_size, 0);
-	MLX5_SET(mkc, mkc, translations_octword_size,
-		 get_octo_len(iova, umem->length, mr->page_shift));
+	if (ksm_mode)
+		MLX5_SET(mkc, mkc, translations_octword_size,
+			 get_octo_len(iova, umem->length, mr->page_shift) * 2);
+	else
+		MLX5_SET(mkc, mkc, translations_octword_size,
+			 get_octo_len(iova, umem->length, mr->page_shift));
 	MLX5_SET(mkc, mkc, log_page_size, mr->page_shift);
 	if (mlx5_umem_needs_ats(dev, umem, access_flags))
 		MLX5_SET(mkc, mkc, ma_translation_mode, 1);
@@ -1373,13 +1443,15 @@ static struct ib_mr *create_real_mr(struct ib_pd *pd, struct ib_umem *umem,
 
 	xlt_with_umr = mlx5r_umr_can_load_pas(dev, umem->length);
 	if (xlt_with_umr) {
-		mr = alloc_cacheable_mr(pd, umem, iova, access_flags);
+		mr = alloc_cacheable_mr(pd, umem, iova, access_flags,
+					MLX5_MKC_ACCESS_MODE_MTT);
 	} else {
 		unsigned int page_size = mlx5_umem_find_best_pgsz(
 			umem, mkc, log_page_size, 0, iova);
 
 		mutex_lock(&dev->slow_path_mutex);
-		mr = reg_create(pd, umem, iova, access_flags, page_size, true);
+		mr = reg_create(pd, umem, iova, access_flags, page_size,
+				true, MLX5_MKC_ACCESS_MODE_MTT);
 		mutex_unlock(&dev->slow_path_mutex);
 	}
 	if (IS_ERR(mr)) {
@@ -1442,7 +1514,8 @@ static struct ib_mr *create_user_odp_mr(struct ib_pd *pd, u64 start, u64 length,
 	if (IS_ERR(odp))
 		return ERR_CAST(odp);
 
-	mr = alloc_cacheable_mr(pd, &odp->umem, iova, access_flags);
+	mr = alloc_cacheable_mr(pd, &odp->umem, iova, access_flags,
+				MLX5_MKC_ACCESS_MODE_MTT);
 	if (IS_ERR(mr)) {
 		ib_umem_release(&odp->umem);
 		return ERR_CAST(mr);
@@ -1510,35 +1583,31 @@ static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
 	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
 };
 
-struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
-					 u64 length, u64 virt_addr,
-					 int fd, int access_flags,
-					 struct uverbs_attr_bundle *attrs)
+static struct ib_mr *
+reg_user_mr_dmabuf(struct ib_pd *pd, struct device *dma_device,
+		   u64 offset, u64 length, u64 virt_addr,
+		   int fd, int access_flags, int access_mode)
 {
+	bool pinned_mode = (access_mode == MLX5_MKC_ACCESS_MODE_KSM);
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
 	struct mlx5_ib_mr *mr = NULL;
 	struct ib_umem_dmabuf *umem_dmabuf;
 	int err;
 
-	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM) ||
-	    !IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING))
-		return ERR_PTR(-EOPNOTSUPP);
-
-	mlx5_ib_dbg(dev,
-		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
-		    offset, virt_addr, length, fd, access_flags);
-
 	err = mlx5r_umr_resource_init(dev);
 	if (err)
 		return ERR_PTR(err);
 
-	/* dmabuf requires xlt update via umr to work. */
-	if (!mlx5r_umr_can_load_pas(dev, length))
-		return ERR_PTR(-EINVAL);
+	if (!pinned_mode)
+		umem_dmabuf = ib_umem_dmabuf_get(&dev->ib_dev,
+						 offset, length, fd,
+						 access_flags,
+						 &mlx5_ib_dmabuf_attach_ops);
+	else
+		umem_dmabuf = ib_umem_dmabuf_get_pinned_with_dma_device(&dev->ib_dev,
+				dma_device, offset, length,
+				fd, access_flags);
 
-	umem_dmabuf = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd,
-					 access_flags,
-					 &mlx5_ib_dmabuf_attach_ops);
 	if (IS_ERR(umem_dmabuf)) {
 		mlx5_ib_dbg(dev, "umem_dmabuf get failed (%ld)\n",
 			    PTR_ERR(umem_dmabuf));
@@ -1546,7 +1615,7 @@ struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
 	}
 
 	mr = alloc_cacheable_mr(pd, &umem_dmabuf->umem, virt_addr,
-				access_flags);
+				access_flags, access_mode);
 	if (IS_ERR(mr)) {
 		ib_umem_release(&umem_dmabuf->umem);
 		return ERR_CAST(mr);
@@ -1556,9 +1625,13 @@ struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
 
 	atomic_add(ib_umem_num_pages(mr->umem), &dev->mdev->priv.reg_pages);
 	umem_dmabuf->private = mr;
-	err = mlx5r_store_odp_mkey(dev, &mr->mmkey);
-	if (err)
-		goto err_dereg_mr;
+	if (!pinned_mode) {
+		err = mlx5r_store_odp_mkey(dev, &mr->mmkey);
+		if (err)
+			goto err_dereg_mr;
+	} else {
+		mr->data_direct = true;
+	}
 
 	err = mlx5_ib_init_dmabuf_mr(mr);
 	if (err)
@@ -1566,10 +1639,101 @@ struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
 	return &mr->ibmr;
 
 err_dereg_mr:
-	mlx5_ib_dereg_mr(&mr->ibmr, NULL);
+	__mlx5_ib_dereg_mr(&mr->ibmr);
 	return ERR_PTR(err);
 }
 
+static struct ib_mr *
+reg_user_mr_dmabuf_by_data_direct(struct ib_pd *pd, u64 offset,
+				  u64 length, u64 virt_addr,
+				  int fd, int access_flags)
+{
+	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	struct mlx5_data_direct_dev *data_direct_dev;
+	struct ib_mr *crossing_mr;
+	struct ib_mr *crossed_mr;
+	int ret = 0;
+
+	/* As of HW behaviour the IOVA must be page aligned in KSM mode */
+	if (!PAGE_ALIGNED(virt_addr) || (access_flags & IB_ACCESS_ON_DEMAND))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	mutex_lock(&dev->data_direct_lock);
+	data_direct_dev = dev->data_direct_dev;
+	if (!data_direct_dev) {
+		ret = -EINVAL;
+		goto end;
+	}
+
+	/* The device's 'data direct mkey' was created without RO flags to
+	 * simplify things and allow for a single mkey per device.
+	 * Since RO is not a must, mask it out accordingly.
+	 */
+	access_flags &= ~IB_ACCESS_RELAXED_ORDERING;
+	crossed_mr = reg_user_mr_dmabuf(pd, &data_direct_dev->pdev->dev,
+					offset, length, virt_addr, fd,
+					access_flags, MLX5_MKC_ACCESS_MODE_KSM);
+	if (IS_ERR(crossed_mr)) {
+		ret = PTR_ERR(crossed_mr);
+		goto end;
+	}
+
+	mutex_lock(&dev->slow_path_mutex);
+	crossing_mr = reg_create_crossing_vhca_mr(pd, virt_addr, length, access_flags,
+						  crossed_mr->lkey);
+	mutex_unlock(&dev->slow_path_mutex);
+	if (IS_ERR(crossing_mr)) {
+		__mlx5_ib_dereg_mr(crossed_mr);
+		ret = PTR_ERR(crossing_mr);
+		goto end;
+	}
+
+	list_add_tail(&to_mmr(crossed_mr)->dd_node, &dev->data_direct_mr_list);
+	to_mmr(crossing_mr)->dd_crossed_mr = to_mmr(crossed_mr);
+	to_mmr(crossing_mr)->data_direct = true;
+end:
+	mutex_unlock(&dev->data_direct_lock);
+	return ret ? ERR_PTR(ret) : crossing_mr;
+}
+
+struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
+					 u64 length, u64 virt_addr,
+					 int fd, int access_flags,
+					 struct uverbs_attr_bundle *attrs)
+{
+	struct mlx5_ib_dev *dev = to_mdev(pd->device);
+	int mlx5_access_flags = 0;
+	int err;
+
+	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM) ||
+	    !IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (uverbs_attr_is_valid(attrs, MLX5_IB_ATTR_REG_DMABUF_MR_ACCESS_FLAGS)) {
+		err = uverbs_get_flags32(&mlx5_access_flags, attrs,
+					 MLX5_IB_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+					 MLX5_IB_UAPI_REG_DMABUF_ACCESS_DATA_DIRECT);
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	mlx5_ib_dbg(dev,
+		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x, mlx5_access_flags 0x%x\n",
+		    offset, virt_addr, length, fd, access_flags, mlx5_access_flags);
+
+	/* dmabuf requires xlt update via umr to work. */
+	if (!mlx5r_umr_can_load_pas(dev, length))
+		return ERR_PTR(-EINVAL);
+
+	if (mlx5_access_flags & MLX5_IB_UAPI_REG_DMABUF_ACCESS_DATA_DIRECT)
+		return reg_user_mr_dmabuf_by_data_direct(pd, offset, length, virt_addr,
+							 fd, access_flags);
+
+	return reg_user_mr_dmabuf(pd, pd->device->dma_device,
+				  offset, length, virt_addr,
+				  fd, access_flags, MLX5_MKC_ACCESS_MODE_MTT);
+}
+
 /*
  * True if the change in access flags can be done via UMR, only some access
  * flags can be updated.
@@ -1665,7 +1829,7 @@ struct ib_mr *mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
 	struct mlx5_ib_mr *mr = to_mmr(ib_mr);
 	int err;
 
-	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
+	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM) || mr->data_direct)
 		return ERR_PTR(-EOPNOTSUPP);
 
 	mlx5_ib_dbg(
@@ -1793,7 +1957,7 @@ mlx5_alloc_priv_descs(struct ib_device *device,
 static void
 mlx5_free_priv_descs(struct mlx5_ib_mr *mr)
 {
-	if (!mr->umem && mr->descs) {
+	if (!mr->umem && !mr->data_direct && mr->descs) {
 		struct ib_device *device = mr->ibmr.device;
 		int size = mr->max_descs * mr->desc_size;
 		struct mlx5_ib_dev *dev = to_mdev(device);
@@ -1847,6 +2011,34 @@ static int cache_ent_find_and_store(struct mlx5_ib_dev *dev,
 	return ret;
 }
 
+static int mlx5_ib_revoke_data_direct_mr(struct mlx5_ib_mr *mr)
+{
+	struct mlx5_ib_dev *dev = to_mdev(mr->ibmr.device);
+	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
+	int err;
+
+	lockdep_assert_held(&dev->data_direct_lock);
+	mr->revoked = true;
+	err = mlx5r_umr_revoke_mr(mr);
+	if (WARN_ON(err))
+		return err;
+
+	ib_umem_dmabuf_revoke(umem_dmabuf);
+	return 0;
+}
+
+void mlx5_ib_revoke_data_direct_mrs(struct mlx5_ib_dev *dev)
+{
+	struct mlx5_ib_mr *mr, *next;
+
+	lockdep_assert_held(&dev->data_direct_lock);
+
+	list_for_each_entry_safe(mr, next, &dev->data_direct_mr_list, dd_node) {
+		list_del(&mr->dd_node);
+		mlx5_ib_revoke_data_direct_mr(mr);
+	}
+}
+
 static int mlx5_revoke_mr(struct mlx5_ib_mr *mr)
 {
 	struct mlx5_ib_dev *dev = to_mdev(mr->ibmr.device);
@@ -1864,7 +2056,7 @@ static int mlx5_revoke_mr(struct mlx5_ib_mr *mr)
 	return destroy_mkey(dev, mr);
 }
 
-int mlx5_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
+static int __mlx5_ib_dereg_mr(struct ib_mr *ibmr)
 {
 	struct mlx5_ib_mr *mr = to_mmr(ibmr);
 	struct mlx5_ib_dev *dev = to_mdev(ibmr->device);
@@ -1931,6 +2123,36 @@ int mlx5_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
 	return 0;
 }
 
+static int dereg_crossing_data_direct_mr(struct mlx5_ib_dev *dev,
+					struct mlx5_ib_mr *mr)
+{
+	struct mlx5_ib_mr *dd_crossed_mr = mr->dd_crossed_mr;
+	int ret;
+
+	ret = __mlx5_ib_dereg_mr(&mr->ibmr);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->data_direct_lock);
+	if (!dd_crossed_mr->revoked)
+		list_del(&dd_crossed_mr->dd_node);
+
+	ret = __mlx5_ib_dereg_mr(&dd_crossed_mr->ibmr);
+	mutex_unlock(&dev->data_direct_lock);
+	return ret;
+}
+
+int mlx5_ib_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
+{
+	struct mlx5_ib_mr *mr = to_mmr(ibmr);
+	struct mlx5_ib_dev *dev = to_mdev(ibmr->device);
+
+	if (mr->data_direct)
+		return dereg_crossing_data_direct_mr(dev, mr);
+
+	return __mlx5_ib_dereg_mr(ibmr);
+}
+
 static void mlx5_set_umr_free_mkey(struct ib_pd *pd, u32 *in, int ndescs,
 				   int access_mode, int page_shift)
 {
diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index a524181f34df..44a3428ea342 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -710,7 +710,10 @@ static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, size_t bcnt,
 		ib_umem_dmabuf_unmap_pages(umem_dmabuf);
 		err = -EINVAL;
 	} else {
-		err = mlx5r_umr_update_mr_pas(mr, xlt_flags);
+		if (mr->data_direct)
+			err = mlx5r_umr_update_data_direct_ksm_pas(mr, xlt_flags);
+		else
+			err = mlx5r_umr_update_mr_pas(mr, xlt_flags);
 	}
 	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
 
diff --git a/drivers/infiniband/hw/mlx5/umr.c b/drivers/infiniband/hw/mlx5/umr.c
index ffc31b01f690..eb74c163fd83 100644
--- a/drivers/infiniband/hw/mlx5/umr.c
+++ b/drivers/infiniband/hw/mlx5/umr.c
@@ -632,44 +632,47 @@ static void mlx5r_umr_final_update_xlt(struct mlx5_ib_dev *dev,
 	wqe->data_seg.byte_count = cpu_to_be32(sg->length);
 }
 
-/*
- * Send the DMA list to the HW for a normal MR using UMR.
- * Dmabuf MR is handled in a similar way, except that the MLX5_IB_UPD_XLT_ZAP
- * flag may be used.
- */
-int mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
+static int
+_mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags, bool dd)
 {
+	size_t ent_size = dd ? sizeof(struct mlx5_ksm) : sizeof(struct mlx5_mtt);
 	struct mlx5_ib_dev *dev = mr_to_mdev(mr);
 	struct device *ddev = &dev->mdev->pdev->dev;
 	struct mlx5r_umr_wqe wqe = {};
 	struct ib_block_iter biter;
+	struct mlx5_ksm *cur_ksm;
 	struct mlx5_mtt *cur_mtt;
 	size_t orig_sg_length;
-	struct mlx5_mtt *mtt;
 	size_t final_size;
+	void *curr_entry;
 	struct ib_sge sg;
+	void *entry;
 	u64 offset = 0;
 	int err = 0;
 
-	if (WARN_ON(mr->umem->is_odp))
-		return -EINVAL;
-
-	mtt = mlx5r_umr_create_xlt(
-		dev, &sg, ib_umem_num_dma_blocks(mr->umem, 1 << mr->page_shift),
-		sizeof(*mtt), flags);
-	if (!mtt)
+	entry = mlx5r_umr_create_xlt(dev, &sg,
+				     ib_umem_num_dma_blocks(mr->umem, 1 << mr->page_shift),
+				     ent_size, flags);
+	if (!entry)
 		return -ENOMEM;
 
 	orig_sg_length = sg.length;
-
 	mlx5r_umr_set_update_xlt_ctrl_seg(&wqe.ctrl_seg, flags, &sg);
 	mlx5r_umr_set_update_xlt_mkey_seg(dev, &wqe.mkey_seg, mr,
 					  mr->page_shift);
+	if (dd) {
+		/* Use the data direct internal kernel PD */
+		MLX5_SET(mkc, &wqe.mkey_seg, pd, dev->ddr.pdn);
+		cur_ksm = entry;
+	} else {
+		cur_mtt = entry;
+	}
+
 	mlx5r_umr_set_update_xlt_data_seg(&wqe.data_seg, &sg);
 
-	cur_mtt = mtt;
+	curr_entry = entry;
 	rdma_umem_for_each_dma_block(mr->umem, &biter, BIT(mr->page_shift)) {
-		if (cur_mtt == (void *)mtt + sg.length) {
+		if (curr_entry == entry + sg.length) {
 			dma_sync_single_for_device(ddev, sg.addr, sg.length,
 						   DMA_TO_DEVICE);
 
@@ -681,23 +684,31 @@ int mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 						DMA_TO_DEVICE);
 			offset += sg.length;
 			mlx5r_umr_update_offset(&wqe.ctrl_seg, offset);
-
-			cur_mtt = mtt;
+			if (dd)
+				cur_ksm = entry;
+			else
+				cur_mtt = entry;
 		}
 
-		cur_mtt->ptag =
-			cpu_to_be64(rdma_block_iter_dma_address(&biter) |
-				    MLX5_IB_MTT_PRESENT);
-
-		if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP))
-			cur_mtt->ptag = 0;
-
-		cur_mtt++;
+		if (dd) {
+			cur_ksm->va = cpu_to_be64(rdma_block_iter_dma_address(&biter));
+			cur_ksm->key = cpu_to_be32(dev->ddr.mkey);
+			cur_ksm++;
+			curr_entry = cur_ksm;
+		} else {
+			cur_mtt->ptag =
+				cpu_to_be64(rdma_block_iter_dma_address(&biter) |
+					    MLX5_IB_MTT_PRESENT);
+			if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP))
+				cur_mtt->ptag = 0;
+			cur_mtt++;
+			curr_entry = cur_mtt;
+		}
 	}
 
-	final_size = (void *)cur_mtt - (void *)mtt;
+	final_size = curr_entry - entry;
 	sg.length = ALIGN(final_size, MLX5_UMR_FLEX_ALIGNMENT);
-	memset(cur_mtt, 0, sg.length - final_size);
+	memset(curr_entry, 0, sg.length - final_size);
 	mlx5r_umr_final_update_xlt(dev, &wqe, mr, &sg, flags);
 
 	dma_sync_single_for_device(ddev, sg.addr, sg.length, DMA_TO_DEVICE);
@@ -705,10 +716,32 @@ int mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
 
 err:
 	sg.length = orig_sg_length;
-	mlx5r_umr_unmap_free_xlt(dev, mtt, &sg);
+	mlx5r_umr_unmap_free_xlt(dev, entry, &sg);
 	return err;
 }
 
+int mlx5r_umr_update_data_direct_ksm_pas(struct mlx5_ib_mr *mr, unsigned int flags)
+{
+	/* No invalidation flow is expected */
+	if (WARN_ON(!mr->umem->is_dmabuf) || (flags & MLX5_IB_UPD_XLT_ZAP))
+		return -EINVAL;
+
+	return _mlx5r_umr_update_mr_pas(mr, flags, true);
+}
+
+/*
+ * Send the DMA list to the HW for a normal MR using UMR.
+ * Dmabuf MR is handled in a similar way, except that the MLX5_IB_UPD_XLT_ZAP
+ * flag may be used.
+ */
+int mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
+{
+	if (WARN_ON(mr->umem->is_odp))
+		return -EINVAL;
+
+	return _mlx5r_umr_update_mr_pas(mr, flags, false);
+}
+
 static bool umr_can_use_indirect_mkey(struct mlx5_ib_dev *dev)
 {
 	return !MLX5_CAP_GEN(dev->mdev, umr_indirect_mkey_disabled);
diff --git a/drivers/infiniband/hw/mlx5/umr.h b/drivers/infiniband/hw/mlx5/umr.h
index 5f734dc72bef..4a02c9b5aad8 100644
--- a/drivers/infiniband/hw/mlx5/umr.h
+++ b/drivers/infiniband/hw/mlx5/umr.h
@@ -95,6 +95,7 @@ int mlx5r_umr_revoke_mr(struct mlx5_ib_mr *mr);
 int mlx5r_umr_rereg_pd_access(struct mlx5_ib_mr *mr, struct ib_pd *pd,
 			      int access_flags);
 int mlx5r_umr_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags);
+int mlx5r_umr_update_data_direct_ksm_pas(struct mlx5_ib_mr *mr, unsigned int flags);
 int mlx5r_umr_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
 			 int page_shift, int flags);
 
diff --git a/include/uapi/rdma/mlx5_user_ioctl_cmds.h b/include/uapi/rdma/mlx5_user_ioctl_cmds.h
index 5b74d6534899..106276a4cce7 100644
--- a/include/uapi/rdma/mlx5_user_ioctl_cmds.h
+++ b/include/uapi/rdma/mlx5_user_ioctl_cmds.h
@@ -274,6 +274,10 @@ enum mlx5_ib_create_cq_attrs {
 	MLX5_IB_ATTR_CREATE_CQ_UAR_INDEX = UVERBS_ID_DRIVER_NS_WITH_UHW,
 };
 
+enum mlx5_ib_reg_dmabuf_mr_attrs {
+	MLX5_IB_ATTR_REG_DMABUF_MR_ACCESS_FLAGS = (1U << UVERBS_ID_NS_SHIFT),
+};
+
 #define MLX5_IB_DW_MATCH_PARAM 0xA0
 
 struct mlx5_ib_match_params {
diff --git a/include/uapi/rdma/mlx5_user_ioctl_verbs.h b/include/uapi/rdma/mlx5_user_ioctl_verbs.h
index 3189c7f08d17..7c233df475e7 100644
--- a/include/uapi/rdma/mlx5_user_ioctl_verbs.h
+++ b/include/uapi/rdma/mlx5_user_ioctl_verbs.h
@@ -54,6 +54,10 @@ enum mlx5_ib_uapi_flow_action_packet_reformat_type {
 	MLX5_IB_UAPI_FLOW_ACTION_PACKET_REFORMAT_TYPE_L2_TO_L3_TUNNEL = 0x3,
 };
 
+enum mlx5_ib_uapi_reg_dmabuf_flags {
+	MLX5_IB_UAPI_REG_DMABUF_ACCESS_DATA_DIRECT = 1 << 0,
+};
+
 struct mlx5_ib_uapi_devx_async_cmd_hdr {
 	__aligned_u64	wr_id;
 	__u8		out_data[];
-- 
2.45.2


