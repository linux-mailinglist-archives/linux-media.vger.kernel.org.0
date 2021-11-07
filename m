Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C2244745D
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbhKGRSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36186 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235918AbhKGRSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dGSvvr9ix576I1a7Ujvg1bDF0KcvkvIRz076If3X540=;
        b=bQARd6FcDWXX0qwAeUjJ3Hm0/lDscldgDO96RzyWUlTNy1aXfH3/1TeYCYiVmlslEIWJ9d
        qv2D+F7PlQAFZom9YBkyMZmjqFH2am2VRQ8GTVfhIN/SHqdyBgn5TcB00w+1AkUIaQDAJq
        z1g2TtJaYRam/EpF2RC5D/bUsPY3WfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-xGyWAghSPTSYEcq3uNQ9cw-1; Sun, 07 Nov 2021 12:15:56 -0500
X-MC-Unique: xGyWAghSPTSYEcq3uNQ9cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE3AF802C8F;
        Sun,  7 Nov 2021 17:15:54 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A38A457CD3;
        Sun,  7 Nov 2021 17:15:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 01/11] media: atomisp-ov2680: Remove a bunch of unused vars from ov2680_device
Date:   Sun,  7 Nov 2021 18:15:39 +0100
Message-Id: <20211107171549.267583-2-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a couple of variables which where either completely unused,
or only ever got a value assigned to them but were never read.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 25 -------------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  4 ---
 2 files changed, 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index ef439937717b..56f95e44316d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -166,8 +166,6 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
 				  struct camera_mipi_info *info,
 				  const struct ov2680_resolution *res)
 {
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct atomisp_sensor_mode_data *buf = &info->data;
 	unsigned int pix_clk_freq_hz;
 	u16 reg_val;
@@ -180,7 +178,6 @@ static int ov2680_get_intg_factor(struct i2c_client *client,
 	/* pixel clock */
 	pix_clk_freq_hz = res->pix_clk_freq * 1000000;
 
-	dev->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
 	buf->vt_pix_clk_freq_mhz = pix_clk_freq_hz;
 
 	/* get integration time */
@@ -434,24 +431,8 @@ static int ov2680_q_exposure(struct v4l2_subdev *sd, s32 *value)
 	return ret;
 }
 
-static u32 ov2680_translate_bayer_order(enum atomisp_bayer_order code)
-{
-	switch (code) {
-	case atomisp_bayer_order_rggb:
-		return MEDIA_BUS_FMT_SRGGB10_1X10;
-	case atomisp_bayer_order_grbg:
-		return MEDIA_BUS_FMT_SGRBG10_1X10;
-	case atomisp_bayer_order_bggr:
-		return MEDIA_BUS_FMT_SBGGR10_1X10;
-	case atomisp_bayer_order_gbrg:
-		return MEDIA_BUS_FMT_SGBRG10_1X10;
-	}
-	return 0;
-}
-
 static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct camera_mipi_info *ov2680_info = NULL;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
@@ -476,15 +457,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	ov2680_info = v4l2_get_subdev_hostdata(sd);
 	if (ov2680_info) {
 		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[index];
-		dev->format.code = ov2680_translate_bayer_order(
-				       ov2680_info->raw_bayer_order);
 	}
 	return ret;
 }
 
 static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	struct camera_mipi_info *ov2680_info = NULL;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
@@ -510,8 +488,6 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s32 value)
 	ov2680_info = v4l2_get_subdev_hostdata(sd);
 	if (ov2680_info) {
 		ov2680_info->raw_bayer_order = ov2680_bayer_order_mapping[index];
-		dev->format.code = ov2680_translate_bayer_order(
-				       ov2680_info->raw_bayer_order);
 	}
 	return ret;
 }
@@ -1199,7 +1175,6 @@ static int ov2680_probe(struct i2c_client *client)
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 535440ed14d7..9f9f6695eed9 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -169,14 +169,10 @@ struct ov2680_format {
 struct ov2680_device {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct v4l2_mbus_framefmt format;
 	struct mutex input_lock;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct ov2680_resolution *res;
 	struct camera_sensor_platform_data *platform_data;
-	int vt_pix_clk_freq_mhz;
-	int run_mode;
-	u8 type;
 };
 
 /**
-- 
2.31.1

