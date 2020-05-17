Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DFF1D6E2A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 01:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgEQX4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 May 2020 19:56:23 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14874 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgEQX4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 May 2020 19:56:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec1ce990000>; Sun, 17 May 2020 16:54:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 17 May 2020 16:56:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 17 May 2020 16:56:22 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 17 May
 2020 23:56:21 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 17 May 2020 23:56:21 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.175]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ec1cf250002>; Sun, 17 May 2020 16:56:21 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     LKML <linux-kernel@vger.kernel.org>
CC:     John Hubbard <jhubbard@nvidia.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-media@vger.kernel.org>
Subject: [PATCH 2/2] rapidio: convert get_user_pages() --> pin_user_pages()
Date:   Sun, 17 May 2020 16:56:20 -0700
Message-ID: <20200517235620.205225-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517235620.205225-1-jhubbard@nvidia.com>
References: <20200517235620.205225-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589759641; bh=1wgn12AWQHh+n8Ik8V+oMQO1GgxealPMnHQxdOTBnaU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=fVCVl9HUNG9yewBS2KSFPFKxUt1JQAAfzivpkSmPaIHDeo35XEQMqHFHLbWcaijgw
         HUe7cAxFgGXflz5/f+DCweZGXOq0y6eB4TyfTsgAnTOSQbDJl/A+OVS9IbtcPF3+0N
         0w4r7MJu9bw9bN5TNxEDcKMD98TeZZCxcfIWZtuqOOymRC/duq/o3q1sIZvHq2xoaQ
         NRYlQuTafRQDGQIYvk5stk9Z78fJYZsKoh25K8EgSET10oJjWiV2hHc2GpRdJ8B5Cp
         VhUHszWvEOSUsqWRdgFBnjSq8NrIyoCq7wYmpHy63SNP7wVO/cKtHfCjfNS0rVQpID
         H45kcclZ4clgw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code was using get_user_pages_fast(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages_fast() + put_page() calls to
pin_user_pages_fast() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Cc: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alex.bou9@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/dev=
ices/rio_mport_cdev.c
index 10af330153b5..0ddd94d6f1e9 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -572,14 +572,12 @@ static void dma_req_free(struct kref *ref)
 	struct mport_dma_req *req =3D container_of(ref, struct mport_dma_req,
 			refcount);
 	struct mport_cdev_priv *priv =3D req->priv;
-	unsigned int i;
=20
 	dma_unmap_sg(req->dmach->device->dev,
 		     req->sgt.sgl, req->sgt.nents, req->dir);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
-		for (i =3D 0; i < req->nr_pages; i++)
-			put_page(req->page_list[i]);
+		unpin_user_pages(req->page_list, req->nr_pages);
 		kfree(req->page_list);
 	}
=20
@@ -815,7 +813,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 	struct mport_dma_req *req;
 	struct mport_dev *md =3D priv->md;
 	struct dma_chan *chan;
-	int i, ret;
+	int ret;
 	int nents;
=20
 	if (xfer->length =3D=3D 0)
@@ -862,7 +860,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 			goto err_req;
 		}
=20
-		pinned =3D get_user_pages_fast(
+		pinned =3D pin_user_pages_fast(
 				(unsigned long)xfer->loc_addr & PAGE_MASK,
 				nr_pages,
 				dir =3D=3D DMA_FROM_DEVICE ? FOLL_WRITE : 0,
@@ -870,7 +868,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
=20
 		if (pinned !=3D nr_pages) {
 			if (pinned < 0) {
-				rmcd_error("get_user_pages_unlocked err=3D%ld",
+				rmcd_error("pin_user_pages_fast err=3D%ld",
 					   pinned);
 				nr_pages =3D 0;
 			} else
@@ -951,8 +949,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
=20
 err_pg:
 	if (!req->page_list) {
-		for (i =3D 0; i < nr_pages; i++)
-			put_page(page_list[i]);
+		unpin_user_pages(page_list, nr_pages);
 		kfree(page_list);
 	}
 err_req:
--=20
2.26.2

