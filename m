Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69169C1950
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 22:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbfI2UBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 16:01:15 -0400
Received: from mailoutvs59.siol.net ([185.57.226.250]:54152 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729124AbfI2UBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 16:01:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E67E75224DC;
        Sun, 29 Sep 2019 22:01:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3p6_Mfi4rNpU; Sun, 29 Sep 2019 22:01:04 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8FBF252233F;
        Sun, 29 Sep 2019 22:01:04 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 136F65224DC;
        Sun, 29 Sep 2019 22:01:02 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org
Cc:     gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se, jernej.skrabec@siol.net
Subject: [PATCH v2 5/6] media: cedrus: h264: Support multiple slices per frame
Date:   Sun, 29 Sep 2019 22:00:22 +0200
Message-Id: <20190929200023.215831-6-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929200023.215831-1-jernej.skrabec@siol.net>
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With recent changes, support for decoding multi-slice frames can be
easily added now.

Signal VPU if current slice is first in frame or not and add information
about first macroblock coordinates.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index d6a782703c9b..b7260cfeb6f4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -301,6 +301,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	dma_addr_t src_buf_addr;
 	u32 offset =3D slice->header_bit_size;
 	u32 len =3D (slice->size * 8) - offset;
+	unsigned int pic_width_in_mbs;
+	bool mbaff_pic;
 	u32 reg;
=20
 	cedrus_write(dev, VE_H264_VLD_LEN, len);
@@ -370,12 +372,19 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
 		reg |=3D VE_H264_SPS_DIRECT_8X8_INFERENCE;
 	cedrus_write(dev, VE_H264_SPS, reg);
=20
+	mbaff_pic =3D !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
+		    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+	pic_width_in_mbs =3D sps->pic_width_in_mbs_minus1 + 1;
+
 	// slice parameters
 	reg =3D 0;
+	reg |=3D ((slice->first_mb_in_slice % pic_width_in_mbs) & 0xff) << 24;
+	reg |=3D (((slice->first_mb_in_slice / pic_width_in_mbs) * (mbaff_pic +=
 1)) & 0xff) << 16;
 	reg |=3D decode->nal_ref_idc ? BIT(12) : 0;
 	reg |=3D (slice->slice_type & 0xf) << 8;
 	reg |=3D slice->cabac_init_idc & 0x3;
-	reg |=3D VE_H264_SHS_FIRST_SLICE_IN_PIC;
+	if (run->first_slice)
+		reg |=3D VE_H264_SHS_FIRST_SLICE_IN_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
 		reg |=3D VE_H264_SHS_FIELD_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
--=20
2.23.0

