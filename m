Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536C7DF27
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbfD2JRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:17:14 -0400
Received: from shell.v3.sk ([90.176.6.54]:59281 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbfD2JRN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:17:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 7ABAF103687;
        Mon, 29 Apr 2019 11:17:10 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5rcYki5SZE9R; Mon, 29 Apr 2019 11:16:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 2E5AE103698;
        Mon, 29 Apr 2019 11:16:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id J6N8KQW2uEUs; Mon, 29 Apr 2019 11:16:40 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 5B24A10367D;
        Mon, 29 Apr 2019 11:16:39 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 02/10] [media] marvell-ccic: fix DMA s/g desc number calculation
Date:   Mon, 29 Apr 2019 11:16:24 +0200
Message-Id: <20190429091632.2462285-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429091632.2462285-1-lkundrak@v3.sk>
References: <20190429091632.2462285-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The commit d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
left dma_desc_nent unset. It previously contained the number of DMA
descriptors as returned from dma_map_sg().

We can now (since the commit referred to above) obtain the same value fro=
m
the sg_table and drop dma_desc_nent altogether.

Tested on OLPC XO-1.75 machine. Doesn't affect the OLPC XO-1's Cafe
driver, since that one doesn't do DMA.

Fixes: d790b7eda953df474f470169ebdf111c02fa7a2d
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/me=
dia/platform/marvell-ccic/mcam-core.c
index f1b301810260..d97f39bde9bd 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -200,7 +200,6 @@ struct mcam_vb_buffer {
 	struct list_head queue;
 	struct mcam_dma_desc *dma_desc;	/* Descriptor virtual address */
 	dma_addr_t dma_desc_pa;		/* Descriptor physical address */
-	int dma_desc_nent;		/* Number of mapped descriptors */
 };
=20
 static inline struct mcam_vb_buffer *vb_to_mvb(struct vb2_v4l2_buffer *v=
b)
@@ -608,9 +607,11 @@ static void mcam_dma_contig_done(struct mcam_camera =
*cam, int frame)
 static void mcam_sg_next_buffer(struct mcam_camera *cam)
 {
 	struct mcam_vb_buffer *buf;
+	struct sg_table *sg_table;
=20
 	buf =3D list_first_entry(&cam->buffers, struct mcam_vb_buffer, queue);
 	list_del_init(&buf->queue);
+	sg_table =3D vb2_dma_sg_plane_desc(&buf->vb_buf.vb2_buf, 0);
 	/*
 	 * Very Bad Not Good Things happen if you don't clear
 	 * C1_DESC_ENA before making any descriptor changes.
@@ -618,7 +619,7 @@ static void mcam_sg_next_buffer(struct mcam_camera *c=
am)
 	mcam_reg_clear_bit(cam, REG_CTRL1, C1_DESC_ENA);
 	mcam_reg_write(cam, REG_DMA_DESC_Y, buf->dma_desc_pa);
 	mcam_reg_write(cam, REG_DESC_LEN_Y,
-			buf->dma_desc_nent*sizeof(struct mcam_dma_desc));
+			sg_table->nents*sizeof(struct mcam_dma_desc));
 	mcam_reg_write(cam, REG_DESC_LEN_U, 0);
 	mcam_reg_write(cam, REG_DESC_LEN_V, 0);
 	mcam_reg_set_bit(cam, REG_CTRL1, C1_DESC_ENA);
--=20
2.21.0

