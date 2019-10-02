Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FEAC8A31
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 15:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbfJBNtf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 09:49:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38638 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfJBNtc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 09:49:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92DnQ4k118362;
        Wed, 2 Oct 2019 08:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570024166;
        bh=+Llvu0H02ru+qaMXOBenkLXZl4BEmVLregk3P6DLIxA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=P8maJmFDe20WuIE5uEJhbRHiryu5Tgj69BIiLGfoVpkrX2BA6o6FJEpVWzjyox8VH
         GT5rpPU4kPrR6hupSCy4vs7u440B97DP1Ibhn5jP2v/a0ZKjlKBjen/pw1R+YBLnMd
         beaJwKXWtu+AoAzK3oEXWBLU7dRdoNMK8X+e7nNI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92DnQpi120626
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 08:49:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 08:49:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 08:49:25 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92DnOm9035733;
        Wed, 2 Oct 2019 08:49:25 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Date:   Wed, 2 Oct 2019 08:51:32 -0500
Message-ID: <20191002135134.12273-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002135134.12273-1-bparrot@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2 controls to report the pixel rates of each mode. This is
needed by some CSI2 receiver in order to perform proper DPHY
configuration.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 500d9bbff10b..5198dc887400 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -193,6 +193,9 @@ struct ov5640_mode_info {
 
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
+	struct {
+		struct v4l2_ctrl *pixel_rate;
+	};
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
+{
+	u64 rate;
+
+	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
+	rate *= ov5640_framerates[sensor->current_fr];
+
+	return rate;
+}
+
 static int ov5640_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 			  struct v4l2_subdev_format *format)
@@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (mbus_fmt->code != sensor->fmt.code)
 		sensor->pending_fmt_change = true;
 
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+				 ov5640_calc_pixel_rate(sensor));
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	/* we can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Clock related controls */
+	ctrls->pixel_rate =
+		v4l2_ctrl_new_std(hdl, ops,
+				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
+				  ov5640_calc_pixel_rate(sensor));
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 		sensor->frame_interval = fi->interval;
 		sensor->current_mode = mode;
 		sensor->pending_mode_change = true;
+
+		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+					 ov5640_calc_pixel_rate(sensor));
 	}
 out:
 	mutex_unlock(&sensor->lock);
-- 
2.17.1

