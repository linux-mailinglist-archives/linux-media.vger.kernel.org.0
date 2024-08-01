Return-Path: <linux-media+bounces-15710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF7944AEF
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 14:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6111B27259
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 12:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899D41A38D1;
	Thu,  1 Aug 2024 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jV92yMrR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C0189B90;
	Thu,  1 Aug 2024 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722513963; cv=none; b=TVf6tpjsnQ0fXtkRrKzkzBkxFmpmd4bYSbNhI5Vfgm2VqsezRxgldh6ZFq46kDCdAglAh8nfAAfMGR9ejYrdscFtZN0KKOWRLETqtQYm0OYJRcJcZT9iVlDriHnFHvvRSmplMg4uhuduLymiOLn1mUXMfpt1n/LrCAhfAUGonqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722513963; c=relaxed/simple;
	bh=HNVP9vMEpgCGw1ZvFBEVtXJyQ/wcj87OJIJ4nBHuuus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERfU2c1CQN68Sc+blHi5Hn6pPxVX9AdZiNlfaGW5Vy+Wvud2WHhtr5Zkawh9nkwgg+11eAHRYEF0nwuofzQAYlhkT1ciLUFz24hA+NlMBdzSigk6+yylJyI7g4O/JB82j9ifIr/zJkzMjY+06hVPqwEL/9wV0eSJAzXl/TctIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jV92yMrR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A51C32786;
	Thu,  1 Aug 2024 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722513963;
	bh=HNVP9vMEpgCGw1ZvFBEVtXJyQ/wcj87OJIJ4nBHuuus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jV92yMrRJw6sPhUT18QCfVFYgI1RwBqV25HBO64e2xwh/paz0J66h47xW0JYgU9e3
	 0P0Dwq8v0yP6qJBSjpW54O5TSH8lQRWNXJkC6vlJrJmmIFmg+3XYGUsjSZR9riLwhE
	 v5flOgNn7Oe3Xej/rJRzQhBF2rPBxVDCGDGbG65VignzqISgMwFaJr17LvQDzoXyUH
	 BdtqqVAbBe2CF2URGnAp0I+xstnDIstNEKiieHnrUpRnJMX6N5zoCWyr46dhsmpuaJ
	 r1LBK4qvwA8X3Y+/B0ZMNUjtTahPtRi747SISrdDBdMh5W9uMVkgZ894EXRr8cXCU4
	 c5qoeuLTrXpXQ==
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
Subject: [PATCH rdma-next 6/8] RDMA: Pass uverbs_attr_bundle as part of '.reg_user_mr_dmabuf' API
Date: Thu,  1 Aug 2024 15:05:15 +0300
Message-ID: <9a25b2fc02443f7c36c2d93499ae25252b6afd40.1722512548.git.leon@kernel.org>
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

Pass uverbs_attr_bundle as part of '.reg_user_mr_dmabuf' API instead of
udata.

This enables passing some new ioctl attributes to the drivers, as will
be introduced in the next patches for mlx5 driver.

Change the involved drivers accordingly.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/infiniband/core/uverbs_std_types_mr.c | 2 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.c      | 3 ++-
 drivers/infiniband/hw/bnxt_re/ib_verbs.h      | 2 +-
 drivers/infiniband/hw/efa/efa.h               | 2 +-
 drivers/infiniband/hw/efa/efa_verbs.c         | 4 ++--
 drivers/infiniband/hw/irdma/verbs.c           | 2 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h          | 2 +-
 drivers/infiniband/hw/mlx5/mr.c               | 2 +-
 include/rdma/ib_verbs.h                       | 2 +-
 9 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
index 03e1db5d1e8c..7ebc7bd3caae 100644
--- a/drivers/infiniband/core/uverbs_std_types_mr.c
+++ b/drivers/infiniband/core/uverbs_std_types_mr.c
@@ -239,7 +239,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_REG_DMABUF_MR)(
 
 	mr = pd->device->ops.reg_user_mr_dmabuf(pd, offset, length, iova, fd,
 						access_flags,
-						&attrs->driver_udata);
+						attrs);
 	if (IS_ERR(mr))
 		return PTR_ERR(mr);
 
diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
index 7c757351a016..43a68e7de02a 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
@@ -4122,7 +4122,8 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *ib_pd, u64 start, u64 length,
 
 struct ib_mr *bnxt_re_reg_user_mr_dmabuf(struct ib_pd *ib_pd, u64 start,
 					 u64 length, u64 virt_addr, int fd,
-					 int mr_access_flags, struct ib_udata *udata)
+					 int mr_access_flags,
+					 struct uverbs_attr_bundle *attrs)
 {
 	struct bnxt_re_pd *pd = container_of(ib_pd, struct bnxt_re_pd, ib_pd);
 	struct bnxt_re_dev *rdev = pd->rdev;
diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.h b/drivers/infiniband/hw/bnxt_re/ib_verbs.h
index e98cb1717338..3ddeda312376 100644
--- a/drivers/infiniband/hw/bnxt_re/ib_verbs.h
+++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.h
@@ -242,7 +242,7 @@ struct ib_mr *bnxt_re_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 struct ib_mr *bnxt_re_reg_user_mr_dmabuf(struct ib_pd *ib_pd, u64 start,
 					 u64 length, u64 virt_addr,
 					 int fd, int mr_access_flags,
-					 struct ib_udata *udata);
+					 struct uverbs_attr_bundle *attrs);
 int bnxt_re_alloc_ucontext(struct ib_ucontext *ctx, struct ib_udata *udata);
 void bnxt_re_dealloc_ucontext(struct ib_ucontext *context);
 int bnxt_re_mmap(struct ib_ucontext *context, struct vm_area_struct *vma);
diff --git a/drivers/infiniband/hw/efa/efa.h b/drivers/infiniband/hw/efa/efa.h
index e580e087e9da..d7fc9d5eeefd 100644
--- a/drivers/infiniband/hw/efa/efa.h
+++ b/drivers/infiniband/hw/efa/efa.h
@@ -168,7 +168,7 @@ struct ib_mr *efa_reg_mr(struct ib_pd *ibpd, u64 start, u64 length,
 struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
 				     u64 length, u64 virt_addr,
 				     int fd, int access_flags,
-				     struct ib_udata *udata);
+				     struct uverbs_attr_bundle *attrs);
 int efa_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata);
 int efa_get_port_immutable(struct ib_device *ibdev, u32 port_num,
 			   struct ib_port_immutable *immutable);
diff --git a/drivers/infiniband/hw/efa/efa_verbs.c b/drivers/infiniband/hw/efa/efa_verbs.c
index b1e0a1b7c59d..cc13415ff7e7 100644
--- a/drivers/infiniband/hw/efa/efa_verbs.c
+++ b/drivers/infiniband/hw/efa/efa_verbs.c
@@ -1684,14 +1684,14 @@ static int efa_register_mr(struct ib_pd *ibpd, struct efa_mr *mr, u64 start,
 struct ib_mr *efa_reg_user_mr_dmabuf(struct ib_pd *ibpd, u64 start,
 				     u64 length, u64 virt_addr,
 				     int fd, int access_flags,
-				     struct ib_udata *udata)
+				     struct uverbs_attr_bundle *attrs)
 {
 	struct efa_dev *dev = to_edev(ibpd->device);
 	struct ib_umem_dmabuf *umem_dmabuf;
 	struct efa_mr *mr;
 	int err;
 
-	mr = efa_alloc_mr(ibpd, access_flags, udata);
+	mr = efa_alloc_mr(ibpd, access_flags, &attrs->driver_udata);
 	if (IS_ERR(mr)) {
 		err = PTR_ERR(mr);
 		goto err_out;
diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index fc0ce35da14e..6a107decb704 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -3085,7 +3085,7 @@ static struct ib_mr *irdma_reg_user_mr(struct ib_pd *pd, u64 start, u64 len,
 static struct ib_mr *irdma_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
 					      u64 len, u64 virt,
 					      int fd, int access,
-					      struct ib_udata *udata)
+					      struct uverbs_attr_bundle *attrs)
 {
 	struct irdma_device *iwdev = to_iwdev(pd->device);
 	struct ib_umem_dmabuf *umem_dmabuf;
diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index b2ebea173547..e915a62da49c 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1354,7 +1354,7 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
 struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
 					 u64 length, u64 virt_addr,
 					 int fd, int access_flags,
-					 struct ib_udata *udata);
+					 struct uverbs_attr_bundle *attrs);
 int mlx5_ib_advise_mr(struct ib_pd *pd,
 		      enum ib_uverbs_advise_mr_advice advice,
 		      u32 flags,
diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
index 98bd8eaa393e..1dfd9124bdd1 100644
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@ -1513,7 +1513,7 @@ static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
 struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
 					 u64 length, u64 virt_addr,
 					 int fd, int access_flags,
-					 struct ib_udata *udata)
+					 struct uverbs_attr_bundle *attrs)
 {
 	struct mlx5_ib_dev *dev = to_mdev(pd->device);
 	struct mlx5_ib_mr *mr = NULL;
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 6c5712ae559d..a1dcf812d787 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -2476,7 +2476,7 @@ struct ib_device_ops {
 	struct ib_mr *(*reg_user_mr_dmabuf)(struct ib_pd *pd, u64 offset,
 					    u64 length, u64 virt_addr, int fd,
 					    int mr_access_flags,
-					    struct ib_udata *udata);
+					    struct uverbs_attr_bundle *attrs);
 	struct ib_mr *(*rereg_user_mr)(struct ib_mr *mr, int flags, u64 start,
 				       u64 length, u64 virt_addr,
 				       int mr_access_flags, struct ib_pd *pd,
-- 
2.45.2


