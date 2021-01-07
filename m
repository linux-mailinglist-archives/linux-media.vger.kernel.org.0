Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1119C2ECE1F
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbhAGKsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727733AbhAGKsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:48:19 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7C3C0612F6
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 02:47:39 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m5so5146772wrx.9
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HEF8U1LOFMDOS1nZx7wQJSKi4/nl2du1Hlm0oy+YxHI=;
        b=xgm4666IVk3QgwOVfJ1Oks+VCUpbhpOFW3kY5vTqQ47Rrmtcir5GAJO8EtRwPSY+p3
         W0YLCe+7b8PNaQIQuPvlKA5oWBg/eVUgPBsVkOlyJmiVcSQpQ0JsjHaZyJhflpunnSph
         VjRJMoTnECOkltxG7WMOvHg9BeMZuOJ4wkeM0kedrRT6OOaJ6cx36DuJuV+La4Ly858O
         xSauSEm/apLKUnwDGTPipWwNi1/Ov/YQf4MH9E31bdE3oNG/PZ4OwBFsOw+C6eau9Eif
         bd/NlcoHgZ4qDfesckZAhYchWoX3psu5kuz0trro6zkXiKBNr+QtHzuLH1/PBCAKgcXj
         UJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HEF8U1LOFMDOS1nZx7wQJSKi4/nl2du1Hlm0oy+YxHI=;
        b=ov3bwH6cfD0OJJe9DUvwl0MuySNbNnEmrXBIu6TWgfx11x4rhNck7dpxccRgNRBb/u
         Ino65uTV4yXM5Hhz7BZD53EX7gW84diGXw/9AiNxyyY6iVmmpu89DSLgH8OkW3wyewgV
         8LJTRW+MwLOb3i6SdvLK2oo5poUVKyHTcN/RXDNnSU5Uv2rR2BlH1n4gE5E+ibSPo1UQ
         r4Pgy2q6qh0pH5HlV04jkrGex5uLVWu+eequ7SK5Bw+R4bWuAv6mxCJj+y6qSIxV33WI
         umh6DhEKiq7sDgpM+HFhTg1zJpwi88eWJ2dXEbZHlvfLh9f3BTSGAfx4pP6ArdsFjZ4h
         ejyA==
X-Gm-Message-State: AOAM531OoB97BGyhS4xA3RksX74CAp86ZHePYdfYRQgfrhw7dCdE3ndZ
        qnxR4i4whCwIEmE/561h3B6bYA==
X-Google-Smtp-Source: ABdhPJy5l0lSs7me0aW9ay6GYyxXm+OAwYTvxXTZ9ndOvNCfjpaPzTzGSJ2TmsjHxLqzqMSsDaOvoA==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr8437704wre.408.1610016457896;
        Thu, 07 Jan 2021 02:47:37 -0800 (PST)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o74sm7841449wme.36.2021.01.07.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 02:47:37 -0800 (PST)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     sakari.ailus@linux.intel.com, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 2/2] media: imx7: csi: Fix pad link validation
Date:   Thu,  7 Jan 2021 10:47:26 +0000
Message-Id: <20210107104726.1294538-3-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107104726.1294538-1-rmfrfs@gmail.com>
References: <20210107104726.1294538-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can not make the assumption that the bound subdev is always a CSI
mux, in i.MX6UL/i.MX6ULL that is not the case. So, just get the entity
selected by source directly upstream from the CSI.

Fixes: 86e02d07871c ("media: imx5/6/7: csi: Mark a bound video mux as a CSI mux")
Reported-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
Tested-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 31e36168f9d0..ac52b1daf991 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -499,6 +499,7 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct media_entity *src;
 	struct media_pad *pad;
 	int ret;
 
@@ -509,11 +510,21 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	if (!csi->src_sd)
 		return -EPIPE;
 
+	src = &csi->src_sd->entity;
+
+	/*
+	 * if the source is neither a CSI MUX or CSI-2 get the one directly
+	 * upstream from this CSI
+	 */
+	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
+	    src->function != MEDIA_ENT_F_VID_MUX)
+		src = &csi->sd.entity;
+
 	/*
-	 * find the entity that is selected by the CSI mux. This is needed
+	 * find the entity that is selected by the source. This is needed
 	 * to distinguish between a parallel or CSI-2 pipeline.
 	 */
-	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
+	pad = imx_media_pipeline_pad(src, 0, 0, true);
 	if (!pad)
 		return -ENODEV;
 
-- 
2.30.0

