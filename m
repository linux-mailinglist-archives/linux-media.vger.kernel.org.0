Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C271E9ABC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 00:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgEaWsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 18:48:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4854 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgEaWsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 18:48:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed434320000>; Sun, 31 May 2020 15:48:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 31 May 2020 15:48:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 31 May 2020 15:48:30 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 31 May
 2020 22:48:29 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 31 May 2020 22:48:29 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.56.10]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ed4343d0001>; Sun, 31 May 2020 15:48:29 -0700
From:   John Hubbard <jhubbard@nvidia.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 2/2] ivtv: convert get_user_pages() --> pin_user_pages()
Date:   Sun, 31 May 2020 15:48:27 -0700
Message-ID: <20200531224827.769427-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531224827.769427-1-jhubbard@nvidia.com>
References: <20200531224827.769427-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590965298; bh=xH5C6dG4bePEiW5mi0F4Wccp6bZO0ppe4EGiUHwyKL4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=EPYECVgKWlvBx7tKYa81xMDO35Ip6n41Q8Q3Db4HXLPfCm3EYZO9rz9Ob/ieJmp6/
         66OnusV+qlnv37ZNAoFdRqkxNjXZFwGwQKABQwbRECaPIjmHCsCX5ojsM3NP5CzFkq
         lKxje8mwJugXFM1noM0aFme0oWXvHLn0rd5q1sQ8nxAsBive1ELKTDydUYE0QRnEae
         QrD5CXPO2SYEaISjKo96Ac3D+gpJC0cOweclCpoXKzocWoKFiRWcqn5lz27hh+EAJD
         wQYUUQSISX3zPOpM3IglFGGImq9pfCTItPHlqlR6gcfviCjfsH+4wLRgVhKjKY3xVx
         vgw5Jpq02Iazg==
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

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/media/pci/ivtv/ivtv-udma.c | 19 ++++++-------------
 drivers/media/pci/ivtv/ivtv-yuv.c  | 17 ++++++-----------
 drivers/media/pci/ivtv/ivtvfb.c    |  4 ++--
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-udma.c b/drivers/media/pci/ivtv/iv=
tv-udma.c
index 5f8883031c9c..0d8372cc364a 100644
--- a/drivers/media/pci/ivtv/ivtv-udma.c
+++ b/drivers/media/pci/ivtv/ivtv-udma.c
@@ -92,7 +92,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_=
dest_addr,
 {
 	struct ivtv_dma_page_info user_dma;
 	struct ivtv_user_dma *dma =3D &itv->udma;
-	int i, err;
+	int err;
=20
 	IVTV_DEBUG_DMA("ivtv_udma_setup, dst: 0x%08x\n", (unsigned int)ivtv_dest_=
addr);
=20
@@ -111,16 +111,15 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long i=
vtv_dest_addr,
 		return -EINVAL;
 	}
=20
-	/* Get user pages for DMA Xfer */
-	err =3D get_user_pages_unlocked(user_dma.uaddr, user_dma.page_count,
+	/* Pin user pages for DMA Xfer */
+	err =3D pin_user_pages_unlocked(user_dma.uaddr, user_dma.page_count,
 			dma->map, FOLL_FORCE);
=20
 	if (user_dma.page_count !=3D err) {
 		IVTV_DEBUG_WARN("failed to map user pages, returned %d instead of %d\n",
 			   err, user_dma.page_count);
 		if (err >=3D 0) {
-			for (i =3D 0; i < err; i++)
-				put_page(dma->map[i]);
+			unpin_user_pages(dma->map, err);
 			return -EINVAL;
 		}
 		return err;
@@ -130,9 +129,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivt=
v_dest_addr,
=20
 	/* Fill SG List with new values */
 	if (ivtv_udma_fill_sg_list(dma, &user_dma, 0) < 0) {
-		for (i =3D 0; i < dma->page_count; i++) {
-			put_page(dma->map[i]);
-		}
+		unpin_user_pages(dma->map, dma->page_count);
 		dma->page_count =3D 0;
 		return -ENOMEM;
 	}
@@ -153,7 +150,6 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivt=
v_dest_addr,
 void ivtv_udma_unmap(struct ivtv *itv)
 {
 	struct ivtv_user_dma *dma =3D &itv->udma;
-	int i;
=20
 	IVTV_DEBUG_INFO("ivtv_unmap_user_dma\n");
=20
@@ -169,10 +165,7 @@ void ivtv_udma_unmap(struct ivtv *itv)
 	/* sync DMA */
 	ivtv_udma_sync_for_cpu(itv);
=20
-	/* Release User Pages */
-	for (i =3D 0; i < dma->page_count; i++) {
-		put_page(dma->map[i]);
-	}
+	unpin_user_pages(dma->map, dma->page_count);
 	dma->page_count =3D 0;
 }
=20
diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivt=
v-yuv.c
index cd2fe2d444c0..5f7dc9771f8d 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -30,7 +30,6 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struc=
t ivtv_user_dma *dma,
 	struct yuv_playback_info *yi =3D &itv->yuv_info;
 	u8 frame =3D yi->draw_frame;
 	struct yuv_frame_info *f =3D &yi->new_frame_info[frame];
-	int i;
 	int y_pages, uv_pages;
 	unsigned long y_buffer_offset, uv_buffer_offset;
 	int y_decode_height, uv_decode_height, y_size;
@@ -62,12 +61,12 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, str=
uct ivtv_user_dma *dma,
 	ivtv_udma_get_page_info (&y_dma, (unsigned long)args->y_source, 720 * y_d=
ecode_height);
 	ivtv_udma_get_page_info (&uv_dma, (unsigned long)args->uv_source, 360 * u=
v_decode_height);
=20
-	/* Get user pages for DMA Xfer */
-	y_pages =3D get_user_pages_unlocked(y_dma.uaddr,
+	/* Pin user pages for DMA Xfer */
+	y_pages =3D pin_user_pages_unlocked(y_dma.uaddr,
 			y_dma.page_count, &dma->map[0], FOLL_FORCE);
 	uv_pages =3D 0; /* silence gcc. value is set and consumed only if: */
 	if (y_pages =3D=3D y_dma.page_count) {
-		uv_pages =3D get_user_pages_unlocked(uv_dma.uaddr,
+		uv_pages =3D pin_user_pages_unlocked(uv_dma.uaddr,
 				uv_dma.page_count, &dma->map[y_pages],
 				FOLL_FORCE);
 	}
@@ -81,8 +80,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struc=
t ivtv_user_dma *dma,
 				 uv_pages, uv_dma.page_count);
=20
 			if (uv_pages >=3D 0) {
-				for (i =3D 0; i < uv_pages; i++)
-					put_page(dma->map[y_pages + i]);
+				unpin_user_pages(&dma->map[y_pages], uv_pages);
 				rc =3D -EFAULT;
 			} else {
 				rc =3D uv_pages;
@@ -93,8 +91,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struc=
t ivtv_user_dma *dma,
 				 y_pages, y_dma.page_count);
 		}
 		if (y_pages >=3D 0) {
-			for (i =3D 0; i < y_pages; i++)
-				put_page(dma->map[i]);
+			unpin_user_pages(dma->map, y_pages);
 			/*
 			 * Inherit the -EFAULT from rc's
 			 * initialization, but allow it to be
@@ -112,9 +109,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, str=
uct ivtv_user_dma *dma,
 	/* Fill & map SG List */
 	if (ivtv_udma_fill_sg_list (dma, &uv_dma, ivtv_udma_fill_sg_list (dma, &y=
_dma, 0)) < 0) {
 		IVTV_DEBUG_WARN("could not allocate bounce buffers for highmem userspace=
 buffers\n");
-		for (i =3D 0; i < dma->page_count; i++) {
-			put_page(dma->map[i]);
-		}
+		unpin_user_pages(dma->map, dma->page_count);
 		dma->page_count =3D 0;
 		return -ENOMEM;
 	}
diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvf=
b.c
index 0c2859844081..e2d56dca5be4 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -281,10 +281,10 @@ static int ivtvfb_prep_dec_dma_to_device(struct ivtv =
*itv,
 	/* Map User DMA */
 	if (ivtv_udma_setup(itv, ivtv_dest_addr, userbuf, size_in_bytes) <=3D 0) =
{
 		mutex_unlock(&itv->udma.lock);
-		IVTVFB_WARN("ivtvfb_prep_dec_dma_to_device, Error with get_user_pages: %=
d bytes, %d pages returned\n",
+		IVTVFB_WARN("ivtvfb_prep_dec_dma_to_device, Error with pin_user_pages: %=
d bytes, %d pages returned\n",
 			       size_in_bytes, itv->udma.page_count);
=20
-		/* get_user_pages must have failed completely */
+		/* pin_user_pages must have failed completely */
 		return -EIO;
 	}
=20
--=20
2.26.2

