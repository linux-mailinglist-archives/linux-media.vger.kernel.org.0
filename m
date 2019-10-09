Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDFBD0ED4
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731183AbfJIMcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:32:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38008 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfJIMco (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 08:32:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99CWcmR078367;
        Wed, 9 Oct 2019 07:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570624358;
        bh=0qKzBdXqB1Y5415oJEapjmDF/1xOO/DjBM2lHReI6hc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=B04y+UnfsI+XIbC+djTq/mP55oSlkzVUwDbh0sAjLLReI3mN2B7r70JZo2wBPR6Sd
         Ibi4iBSXcw6QXUo60tOwZccA4iB/IFNYuoHU6X/kSM+oSTK2GaOPwmhUOtRXLNrSII
         P3nfO7MkGc4aKZB9ZgyF6Cx6m//Z99UILo9NCHNU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99CWcQ6090486
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 07:32:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 07:32:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 07:32:35 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99CWbNQ081004;
        Wed, 9 Oct 2019 07:32:38 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Jacopo Mondi <jacopo@jmondi.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v4 1/3] media: ov5640: add PIXEL_RATE control
Date:   Wed, 9 Oct 2019 07:35:08 -0500
Message-ID: <20191009123510.19106-2-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009123510.19106-1-bparrot@ti.com>
References: <20191009123510.19106-1-bparrot@ti.com>
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
 drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 500d9bbff10b..b93b61baace5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -193,6 +193,7 @@ struct ov5640_mode_info {
 
 struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *pixel_rate;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -1614,6 +1615,16 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	return mode;
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
 /*
  * sensor changes between scaling and subsampling, go through
  * exposure calculation
@@ -1818,8 +1829,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	 * All the formats we support have 16 bits per pixel, seems to require
 	 * the same rate than YUV, so we can just use 16 bpp all the time.
 	 */
-	rate = mode->vtot * mode->htot * 16;
-	rate *= ov5640_framerates[sensor->current_fr];
+	rate = ov5640_calc_pixel_rate(sensor) * 16;
 	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
 		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
 		ret = ov5640_set_mipi_pclk(sensor, rate);
@@ -2233,6 +2243,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	if (mbus_fmt->code != sensor->fmt.code)
 		sensor->pending_fmt_change = true;
 
+	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
+				 ov5640_calc_pixel_rate(sensor));
 out:
 	mutex_unlock(&sensor->lock);
 	return ret;
@@ -2657,6 +2669,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	/* we can use our own mutex for the ctrl lock */
 	hdl->lock = &sensor->lock;
 
+	/* Clock related controls */
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+					      0, INT_MAX, 1,
+					      ov5640_calc_pixel_rate(sensor));
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -2704,6 +2721,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 		goto free_ctrls;
 	}
 
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
@@ -2816,6 +2834,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
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

