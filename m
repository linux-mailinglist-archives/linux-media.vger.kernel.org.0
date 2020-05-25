Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2A41E183F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 01:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387882AbgEYXcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 19:32:51 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8708 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387766AbgEYXcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 19:32:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ecc55500000>; Mon, 25 May 2020 16:31:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 25 May 2020 16:32:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 25 May 2020 16:32:50 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 May
 2020 23:32:50 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 May 2020 23:32:50 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.58.199]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ecc55a10000>; Mon, 25 May 2020 16:32:49 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     LKML <linux-kernel@vger.kernel.org>
CC:     John Hubbard <jhubbard@nvidia.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        <tee-dev@lists.linaro.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2] tee: convert get_user_pages() --> pin_user_pages()
Date:   Mon, 25 May 2020 16:32:48 -0700
Message-ID: <20200525233248.434636-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590449488; bh=VbhMJzzhtLwECOt/zkVs5tvYqSm7aKeF2zHBBFaqTGM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
         Content-Type;
        b=nUf1saWOS7mb/lnsvWb+B21oDh2NRXZqPgX4xJUgmzam4KPf9nZaCoy/X0bwzBYrY
         Zebfr779q3I/dmH4EKycVJH1ILsnuGqwlduZbjJIkWAL4XEHE8ydyNlr7S39B+3xbG
         ZmAMWdFbzBNxH+nqLUULtEyOMt9DIw11bO8iL45LdlOZi9+k1qwzmuPHBu84GIsQ0E
         OLjifKUXBRiZWydx1RMXL5WoWRtvQylgA6UrUO3JIrn8ONHbBCVcLZMv4AIHtErqV+
         5TGz4dsidr5Ay8zAHeCd69/BvWX3bveRL/gmJmMI8NyPDX8Mi+1BRtFrWTKH1TpdW7
         O+gppcemBUZag==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code was using get_user_pages*(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages*() + put_page() calls to
pin_user_pages*() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: tee-dev@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Hi,

This fixes the typo ("convert convert") in the subject line, but
otherwise no changes.

thanks,
John Hubbard
NVIDIA


 drivers/tee/tee_shm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index bd679b72bd05..7dffc42d8d5a 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -31,16 +31,13 @@ static void tee_shm_release(struct tee_shm *shm)
=20
 		poolm->ops->free(poolm, shm);
 	} else if (shm->flags & TEE_SHM_REGISTER) {
-		size_t n;
 		int rc =3D teedev->desc->ops->shm_unregister(shm->ctx, shm);
=20
 		if (rc)
 			dev_err(teedev->dev.parent,
 				"unregister shm %p failed: %d", shm, rc);
=20
-		for (n =3D 0; n < shm->num_pages; n++)
-			put_page(shm->pages[n]);
-
+		unpin_user_pages(shm->pages, shm->num_pages);
 		kfree(shm->pages);
 	}
=20
@@ -226,7 +223,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ct=
x, unsigned long addr,
 		goto err;
 	}
=20
-	rc =3D get_user_pages_fast(start, num_pages, FOLL_WRITE, shm->pages);
+	rc =3D pin_user_pages_fast(start, num_pages, FOLL_WRITE, shm->pages);
 	if (rc > 0)
 		shm->num_pages =3D rc;
 	if (rc !=3D num_pages) {
@@ -271,16 +268,13 @@ struct tee_shm *tee_shm_register(struct tee_context *=
ctx, unsigned long addr,
 	return shm;
 err:
 	if (shm) {
-		size_t n;
-
 		if (shm->id >=3D 0) {
 			mutex_lock(&teedev->mutex);
 			idr_remove(&teedev->idr, shm->id);
 			mutex_unlock(&teedev->mutex);
 		}
 		if (shm->pages) {
-			for (n =3D 0; n < shm->num_pages; n++)
-				put_page(shm->pages[n]);
+			unpin_user_pages(shm->pages, shm->num_pages);
 			kfree(shm->pages);
 		}
 	}
--=20
2.26.2

