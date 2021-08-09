Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE3A3E4FA4
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236958AbhHIW7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbhHIW73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF4EC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h13so23495040wrp.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sh2Qb+qpeQv9UKOTm6x4bxUXxIvNDNUgK/mc3R2l494=;
        b=eQIL+hWPUpjpZMHgx8Cd2sPsBp/SNPlDOQB6LFYERtsD7bBIS8wIuPhTJU9cEaPqNA
         16SJ2a8ngW5XdLbklI1Pttms30ePw5JLF9XAmwNgnE8ddAuOoaXqhrt5YSbCtBrJNcgN
         scxtLuRJJnVBZQ9UUaNMe4spPsdaIQcmO0Sc09uEbUU9PMdEGm+xSrAx1MrzpwA21D3m
         idU0SnDCW+nRwhzqhlLh6/vkdxBMnZmLX8scnBWpFg4CyPV8xJaMJnAAjVHrL8v+wEyL
         4W8QiUADML9yye1mBOQKtSCEvc89wPNJHOkKgGGSOOzurkhjrytB/TfdlAucss+hrbBy
         ZvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sh2Qb+qpeQv9UKOTm6x4bxUXxIvNDNUgK/mc3R2l494=;
        b=epW5/Qdulzr0uMvpJRjVRd/hTkDPYOhYhZxYmC0uqnZ+19MCZsQ4LWRhjjvCBCY973
         c68bShU+tvviYgB7kBlLrSgWlzsTAhg/jsKSmc6lGAY3I4Z6L68WdNETlcZscdgPn30N
         1r0pXpzmjGHfoppFZ1+IDHt+5C4KuqdD3NtZCQZchulTV5Ll4PutYL1fwJfpv2iBwElN
         OjI/mWYA+gp6iZv9g9kz5hTuLNhodwDA9B5dzBzPy3/ePK3YCWddzHQbGXdrbjH2jgOK
         PMziWYVkggzKgq1uzFw7sauqn3SfxcPJogS2q0CVwkf5aiT/rqYcxr1mbqMeWfPM/M4i
         Ecew==
X-Gm-Message-State: AOAM530irL2BlHRqRLTSY6b//VV69nvHzYZGAYszSjTob5sdXFLkX69r
        JS1AikxqDfqPdVuVmnuITvgqOG+wBls=
X-Google-Smtp-Source: ABdhPJyfHmsERimdIrzuEtNscycFpFt0BXZZgEBC/yOvHMLZvNm3Q5ZB3LAz48AYLFPiJuQ+Mfy6eA==
X-Received: by 2002:adf:cd91:: with SMTP id q17mr13690903wrj.122.1628549947159;
        Mon, 09 Aug 2021 15:59:07 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:06 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 09/12] media: i2c: cap exposure at height + vblank in ov8865
Date:   Mon,  9 Aug 2021 23:58:42 +0100
Message-Id: <20210809225845.916430-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exposure limits depend on the total height; when vblank is altered (and
thus the total height is altered), change the exposure limits to reflect
the new cap.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index db84294b7a03..70747552e32a 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -675,6 +675,7 @@ struct ov8865_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2461,6 +2462,18 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int index;
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = sensor->state.mode->output_size_y + ctrl->val;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exposure_max,
+					 sensor->ctrls.exposure->step,
+					 min(sensor->ctrls.exposure->val, exposure_max));
+	}
+
 	/* Wait for the sensor to be on before setting controls. */
 	if (pm_runtime_suspended(sensor->dev))
 		return 0;
@@ -2517,8 +2530,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
-			  512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
+					    1048575, 16, 512);
 
 	/* Gain */
 
@@ -2699,6 +2712,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	u32 mbus_code = 0;
 	unsigned int hblank;
 	unsigned int index;
+	int exposure_max;
 	int ret = 0;
 
 	mutex_lock(&sensor->mutex);
@@ -2746,6 +2760,12 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
 				 hblank);
 
+	exposure_max = mode->vts;
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum, exposure_max,
+				 sensor->ctrls.exposure->step,
+				 min(sensor->ctrls.exposure->val, exposure_max));
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

