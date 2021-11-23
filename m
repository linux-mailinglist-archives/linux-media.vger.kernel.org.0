Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E049C4598E1
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhKWAE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhKWADm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:42 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E12C06175C
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:35 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso593651wmr.4
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ek64K3SBQDEWfOp0wcNmphEXZLJLopy1OLyhPbXY4T0=;
        b=FE564jU5fLSyG7pzGaxjLNSRbj4sN7YZE6+36BDsYqyto9ZnOVNfGVoq53UnkZONkC
         eQv7cRx6CVPAEvJWZwJ2iGPFeCC6PQcxMecwE79JiuVoAkkaaKxFuOvTDhM2O9gsiju3
         KrWvB02vz1hCwn1mMWoa5gPB2fnWg/lFl3zabIJo0Qugv6VuW7x9sALKJYTjBXAToiLB
         P1ExpTMSzzbp9QisUa32h3dHY3P8gsq1BnzMvuNBvhpQOkpjtzsrXFj6ZQzYkTUZ08wO
         wBjp5IMyjQM/0EzwPCtx3EF4xrAcfXjrLGFXczVt9lqFiYbBhlProuWOdm+2kU2vQ8al
         i12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ek64K3SBQDEWfOp0wcNmphEXZLJLopy1OLyhPbXY4T0=;
        b=5ySElzuG15aUynngHAPjDM+Mw6/uuJufLp6QaHBsfisO4zljeL7zG9Sj850umN7erO
         0dWCt3vXQCanqb31Wr79L5IhDwEUYX2ygZR0fq24sp+b2LNX3nwbksovIXHkP482Yw0f
         nNut3/wR5i+jWA0yG+KD25aNP7eGzcPk6nJU0GWk342jg+5U95N/mH0cVt5RUW1zMUZP
         sl3Ytn75oWG+5ZmOMxK0LKdYFSchKWQ1bt1bKtTiEQpQHy6Qz9jHic+DhdQl2UCLiTH/
         kZvFojL0VOlXijCs8V333cJXkKkQI/pDeJk5iu9gL+UgJ7Sw0/0qqcrBtCLAVKWg+uBs
         Yylw==
X-Gm-Message-State: AOAM530ZHMzEGusmJXOmGIvrde2G0g4AMupsaMbNbw3w0zni4UAUixaR
        AdsRf30y9ShYG1GlcCMor10Zr1Q5ZIE=
X-Google-Smtp-Source: ABdhPJxF5LYZOsvBOGFBEX92yvZo3PLoKmJ5vMhwdlokP3h5nc3GCC19qrzqtaD3PS3RjUirzAdTtg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr34335057wmi.115.1637625633937;
        Mon, 22 Nov 2021 16:00:33 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:33 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 10/17] media: i2c: Add hblank control to ov8865
Date:   Tue, 23 Nov 2021 00:00:10 +0000
Message-Id: <20211123000017.43187-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_HBLANK control to the ov8865 driver. This is read only
with timing control intended to be done via vblanking alone.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 27043b9426a1..f1ee0e425adf 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -677,6 +677,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
@@ -2513,6 +2514,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = &ov8865_modes[0];
 	unsigned int vblank_max, vblank_def;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2550,6 +2552,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 				     0, 0, ov8865_test_pattern_menu);
 
 	/* Blanking */
+	hblank = mode->hts - mode->output_size_x;
+	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
+					  hblank, 1, hblank);
+
+	if (ctrls->hblank)
+		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
 	vblank_def = mode->vts - mode->output_size_y;
 	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
@@ -2696,6 +2705,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *mbus_format = &format->format;
 	const struct ov8865_mode *mode;
 	u32 mbus_code = 0;
+	unsigned int hblank;
 	unsigned int index;
 	int ret = 0;
 
@@ -2740,6 +2750,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
 				 1, mode->vts - mode->output_size_y);
 
+	hblank = mode->hts - mode->output_size_x;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
+				 hblank);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

