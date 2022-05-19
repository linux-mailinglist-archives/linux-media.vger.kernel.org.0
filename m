Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A968F52DA41
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 18:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbiESQaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 12:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242023AbiESQ35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 12:29:57 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C69D80BB;
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id j25-20020a4ad199000000b0040e50cc687cso422433oor.9;
        Thu, 19 May 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
        b=Zy0e0jaIz3/kOZQl0yiKnsVUnNJLmZJUA3DOmJAwVwoOE/iDucxc244U+6MTtP/H1i
         sBlI1raTgMuODdiJZql81w//3SZl8N960K24YeJjjDhxcfd0O/DNiKwNPE6B6F1v1x3x
         UZG9rONkgr7M9hCuxVWUGeEpI3D9cYZI5GvWGPIxpVDkzvTwKQJRAi+M0fSCH2JiM49d
         w/7ykfu4HGBOQay4LbAkmgDsA2UNwCN5G3W7PN4hQr3SLiRDLjwXSmhqiBK7gRxeD4pC
         kKdzSSC4EsPRLdZzPuOqbItD+q2EI1ZkjDUmo1aIUJGPb7DVekKWaPSO2RA3esfpxZz0
         58bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
        b=G2MzWun95hDZRVtBGIiV3LpbY4S6gWM8CvV2Ohx/D0OAVX3Hqql/MVeyQIbR0B7SK2
         xAule/FxHHIeXLeHNJX3TDwVWnNKF6IA81xEu4fhv5WrAQ0QvLAZP4dpp4lsI+E/HKSv
         NHg6PRdwpDL2cYpHpch8gP4KtRqdlhLCAhxB4ScK+9lSEviof0RnlArEtBRxGYUUQKkl
         3QxIopgXipfS5uK9qdPeiYNNfRqkz7hGzve2yhf4xYx7Iq7iXZr8Y+BwuYtlbMQCT/qG
         6SKfHmXceWRsq6d8ssinwEd/tXU0u7AeCguTqNUWcYZ2T8Qrc1KvP8p2oUf0JviigooK
         WMaQ==
X-Gm-Message-State: AOAM531aTlmc/mM+4u4xOTuJAReMAX6kertqwadgUbObjwUacxbBzdJm
        0jdgyWyPgjY6N9r6upuFVrA=
X-Google-Smtp-Source: ABdhPJxJjU2pH6l+o2xDYzsp8fe9RBPxDDkaTo4MTaGjXFoHYtrRz/E7SW8maQfxG+inGcRuRX/oJg==
X-Received: by 2002:a4a:a6c8:0:b0:35f:7a3a:77c6 with SMTP id i8-20020a4aa6c8000000b0035f7a3a77c6mr2357115oom.11.1652977795608;
        Thu, 19 May 2022 09:29:55 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 09:29:55 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [RESEND 5/6 v2] drm/panel: simple: add Geekworm MZP280 Panel
Date:   Thu, 19 May 2022 11:29:34 -0500
Message-Id: <20220519162935.1585-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Geekworm MZP280 Panel

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e3..cbc1a4fd1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1824,6 +1824,32 @@ static const struct panel_desc friendlyarm_hd702e = {
 	},
 };
 
+static const struct drm_display_mode geekworm_mzp280_mode = {
+	.clock = 32000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 41,
+	.hsync_end = 480 + 41 + 20,
+	.htotal = 480 + 41 + 20 + 60,
+	.vdisplay = 640,
+	.vsync_start = 640 + 5,
+	.vsync_end = 640 + 5 + 10,
+	.vtotal = 640 + 5 + 10 + 10,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc geekworm_mzp280 = {
+	.modes = &geekworm_mzp280_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 47,
+		.height = 61,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X24_CPADHI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -3790,6 +3816,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "friendlyarm,hd702e",
 		.data = &friendlyarm_hd702e,
+	}, {
+		.compatible = "geekworm,mzp280",
+		.data = &geekworm_mzp280,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.25.1

