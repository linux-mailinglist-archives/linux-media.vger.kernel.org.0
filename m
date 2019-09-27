Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA25C0B35
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbfI0SfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:35:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57808 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbfI0SfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:35:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYxRA091615;
        Fri, 27 Sep 2019 13:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609299;
        bh=krbcjClNBl5l626Tt1s8M5AXW8701NDZN1CSgPSwXmg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oUBz4L9MJhKpZCLJf4am7VldjaFQjMiI5QYJj6WrE6SPtlsTN0xAr42X524mWi5YZ
         brthPkrlKTrsSKxo2TzWLQvMhKG7DuMN86iPidgC6jsYRAgcxdmhOux516YhhQ2h9a
         g0b6hbxk8ex915quk4aSHEC00DOGyqzfVsSj3Ymk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYw54122802
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:58 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:50 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgc5073031;
        Fri, 27 Sep 2019 13:34:58 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 16/16] media: ti-vpe: vpe: don't rely on colorspace member for conversion
Date:   Fri, 27 Sep 2019 13:36:50 -0500
Message-ID: <20190927183650.31345-17-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up to now VPE was relying on the colorspace value of struct v4l2_format
as an indication to perform color space conversion from YUV to RGB or
not.

Instead we should used the source/destination fourcc codes as a more
reliable indication to perform color space conversion or not.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 41 ++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index e30981cd3e8f..d002adc6263f 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -353,6 +353,32 @@ enum {
 	Q_DATA_DST = 1,
 };
 
+static bool is_fmt_rgb(u32 fourcc)
+{
+	if (fourcc == V4L2_PIX_FMT_RGB24 ||
+	    fourcc == V4L2_PIX_FMT_BGR24 ||
+	    fourcc == V4L2_PIX_FMT_RGB32 ||
+	    fourcc == V4L2_PIX_FMT_BGR32 ||
+	    fourcc == V4L2_PIX_FMT_RGB565 ||
+	    fourcc == V4L2_PIX_FMT_RGB555)
+		return true;
+
+	return false;
+}
+
+/*
+ * This helper is only used to setup the color space converter
+ * the actual value returned is only to broadly differentiate between
+ * RGB and YUV
+ */
+static enum  v4l2_colorspace fourcc_to_colorspace(u32 fourcc)
+{
+	if (is_fmt_rgb(fourcc))
+		return V4L2_COLORSPACE_SRGB;
+
+	return V4L2_COLORSPACE_SMPTE170M;
+}
+
 /* find our format description corresponding to the passed v4l2_format */
 static struct vpe_fmt *__find_format(u32 fourcc)
 {
@@ -764,11 +790,10 @@ static void set_src_registers(struct vpe_ctx *ctx)
 static void set_dst_registers(struct vpe_ctx *ctx)
 {
 	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
-	enum v4l2_colorspace clrspc = ctx->q_data[Q_DATA_DST].colorspace;
 	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
 	u32 val = 0;
 
-	if (clrspc == V4L2_COLORSPACE_SRGB) {
+	if (is_fmt_rgb(fmt->fourcc)) {
 		val |= VPE_RGB_OUT_SELECT;
 		vpdma_set_bg_color(ctx->dev->vpdma,
 			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
@@ -912,7 +937,8 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
 	set_dei_regs(ctx);
 
 	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
-		s_q_data->colorspace, d_q_data->colorspace);
+		      fourcc_to_colorspace(s_q_data->fmt->fourcc),
+		      fourcc_to_colorspace(d_q_data->fmt->fourcc));
 
 	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
 	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
@@ -1285,7 +1311,7 @@ static void device_run(void *priv)
 	if (ctx->deinterlacing)
 		add_out_dtd(ctx, VPE_PORT_MV_OUT);
 
-	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
 		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
 	} else {
 		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
@@ -1327,7 +1353,7 @@ static void device_run(void *priv)
 	}
 
 	/* sync on channel control descriptors for output ports */
-	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
+	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
 		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
 			VPE_CHAN_RGB_OUT);
 	} else {
@@ -1682,10 +1708,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		height = pix->height;
 
 	if (!pix->colorspace) {
-		if (fmt->fourcc == V4L2_PIX_FMT_RGB24 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR24 ||
-				fmt->fourcc == V4L2_PIX_FMT_RGB32 ||
-				fmt->fourcc == V4L2_PIX_FMT_BGR32) {
+		if (is_fmt_rgb(fmt->fourcc)) {
 			pix->colorspace = V4L2_COLORSPACE_SRGB;
 		} else {
 			if (height > 1280)	/* HD */
-- 
2.17.1

