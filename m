Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C1532C799
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355652AbhCDAcT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243248AbhCCSJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 13:09:53 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF29C061762
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:09:02 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id m11so29029911lji.10
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xxk8JtWsPIvnPUa+voyuwfGcQ4VnLMHJ8+rTKyv165c=;
        b=UadRMHZr2fw5MNl2lDFD/4n6o8LOE//f5BH71a2PiMAVc7ozfKsIHIS3GLGXyRLD/5
         gNBqhUyNONiASCfkjfHtg0D9z+pXtapqqzzH0iq4C88c1GiB2WamvUwyDxiPQmHl6ntK
         2ET0pd4uQwvREl9xCPsR8k9N3pn9AAcnEoPb0ff6DLSYraYgLp//FoAlPnybg7HjObWs
         aM0eFqXLnPZn5sh8pdWwp1W1Z3mBZC9RXlijs+f0MDivhejOCRFbTaW2LdcQLZPBasgY
         yvWPWUrvMm/ntzg0y2duTEeRmeuQeWOL+dWmVTdUgB1a6p/E6z96xUDYnaISNCDR6OQJ
         NTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xxk8JtWsPIvnPUa+voyuwfGcQ4VnLMHJ8+rTKyv165c=;
        b=rjPuWk7ZP9CuZFQtsIf7G5z3UN5evnTiOgqdcqx2VM8uj2yXWhsX7RzAxQnxLrOGHE
         clRz9X68bfhJRGSf29syk5Uk32e9FFd3i2vREz3CGMH+rKVg49ptTBuaYNJtH+9CWQro
         FdR7X7cEgvRQK8ZYwfWHopDBD2L+wUQcWRuEdrusFCBpl8dcxjX+bPpZ4QM3pmWzcany
         IE2XWD8R3HwmnJr8dtyt+X6hqA+chslGKtiGLD26yN5bBj+HlPu0TnvIhz37GOhwJy7W
         dXdlobsUGef4Jmzo70HgQyE3xx9QjJLLqSVgHNiyIUafMF3j/GDScBagVdm+GLw+3Kmr
         lGwA==
X-Gm-Message-State: AOAM533fZuW7JbqPyva3eEJPzOR8Lx+Su5mgHm6pLc09v5VBOeWXWThJ
        uKj36j0Z2Hrp4yoChoBGAMSjJw==
X-Google-Smtp-Source: ABdhPJwGL9YKYbfg2gul2Xiq8vaIK8x/iJxDM1pgAHq8WnOSUc1D3HurZw2/CskzJbr7tD2bWre/jQ==
X-Received: by 2002:a2e:509:: with SMTP id 9mr104342ljf.170.1614794940579;
        Wed, 03 Mar 2021 10:09:00 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j15sm2220990lfm.138.2021.03.03.10.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:08:59 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC PATCH 4/4] staging: media: omap4iss: use v4l2_get_link_freq() to get the external rate
Date:   Wed,  3 Mar 2021 21:08:17 +0300
Message-Id: <20210303180817.12285-5-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303180817.12285-1-andrey.konovalov@linaro.org>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver uses V4L2_CID_PIXEL_RATE to calculate the CSI2 link frequency,
but this may give incorrect result in some cases. Use v4l2_get_link_freq()
instead.

Also the driver used the external_rate field in struct iss_pipeline as a
flag to prevent excessive v4l2_subdev_call's when processing the frames
in single-shot mode. Replace the external_rate with external_lfreq, and
use external_bpp and external_lfreq to call v4l2_subdev_call(get_fmt) and
v4l2_get_link_freq() respectively only once per iss_video_streamon().

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/staging/media/omap4iss/iss.c        | 12 +-----------
 drivers/staging/media/omap4iss/iss_csiphy.c | 19 ++++++++++++++++---
 drivers/staging/media/omap4iss/iss_video.c  |  2 +-
 drivers/staging/media/omap4iss/iss_video.h  |  2 +-
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index dae9073e7d3c..0eb7b1b5dcc4 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -131,7 +131,7 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
 	if (!pipe->external)
 		return 0;
 
-	if (pipe->external_rate)
+	if (pipe->external_bpp)
 		return 0;
 
 	memset(&fmt, 0, sizeof(fmt));
@@ -145,16 +145,6 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
 
 	pipe->external_bpp = omap4iss_video_format_info(fmt.format.code)->bpp;
 
-	ctrl = v4l2_ctrl_find(pipe->external->ctrl_handler,
-			      V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_warn(iss->dev, "no pixel rate control in subdev %s\n",
-			 pipe->external->name);
-		return -EPIPE;
-	}
-
-	pipe->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-
 	return 0;
 }
 
diff --git a/drivers/staging/media/omap4iss/iss_csiphy.c b/drivers/staging/media/omap4iss/iss_csiphy.c
index 96f2ce045138..cec0cd21f7e0 100644
--- a/drivers/staging/media/omap4iss/iss_csiphy.c
+++ b/drivers/staging/media/omap4iss/iss_csiphy.c
@@ -119,6 +119,7 @@ int omap4iss_csiphy_config(struct iss_device *iss,
 	struct iss_pipeline *pipe = to_iss_pipeline(&csi2_subdev->entity);
 	struct iss_v4l2_subdevs_group *subdevs = pipe->external->host_priv;
 	struct iss_csiphy_dphy_cfg csi2phy;
+	s64 link_freq;
 	int csi2_ddrclk_khz;
 	struct iss_csiphy_lanes_cfg *lanes;
 	unsigned int used_lanes = 0;
@@ -193,9 +194,21 @@ int omap4iss_csiphy_config(struct iss_device *iss,
 	if (lanes->clk.pos == 0 || used_lanes & (1 << lanes->clk.pos))
 		return -EINVAL;
 
-	csi2_ddrclk_khz = pipe->external_rate / 1000
-		/ (2 * csi2->phy->used_data_lanes)
-		* pipe->external_bpp;
+	if (!pipe->external_lfreq) {
+		link_freq = v4l2_get_link_freq(pipe->external->ctrl_handler,
+					       pipe->external_bpp,
+					       2 * csi2->phy->used_data_lanes);
+		if (link_freq < 0) {
+			dev_warn(iss->dev,
+				 "failed to read the link frequency fromn subdev %s\n",
+				 pipe->external->name);
+			return -EINVAL;
+		}
+
+		pipe->external_lfreq = link_freq;
+	}
+
+	csi2_ddrclk_khz = div_s64(pipe->external_lfreq, 1000);
 
 	/*
 	 * THS_TERM: Programmed value = ceil(12.5 ns/DDRClk period) - 1.
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 66975a37dc85..a654c8d18bbc 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -872,7 +872,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	pipe = entity->pipe
 	     ? to_iss_pipeline(entity) : &video->pipe;
 	pipe->external = NULL;
-	pipe->external_rate = 0;
+	pipe->external_lfreq = 0;
 	pipe->external_bpp = 0;
 
 	ret = media_entity_enum_init(&pipe->ent_enum, entity->graph_obj.mdev);
diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
index 526281bf0051..2ad5c8483958 100644
--- a/drivers/staging/media/omap4iss/iss_video.h
+++ b/drivers/staging/media/omap4iss/iss_video.h
@@ -86,7 +86,7 @@ struct iss_pipeline {
 	bool error;
 	struct v4l2_fract max_timeperframe;
 	struct v4l2_subdev *external;
-	unsigned int external_rate;
+	s64 external_lfreq;
 	int external_bpp;
 };
 
-- 
2.17.1

