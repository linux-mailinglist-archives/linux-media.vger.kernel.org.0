Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88748498562
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243970AbiAXQzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243976AbiAXQzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:55:39 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B17C06173D;
        Mon, 24 Jan 2022 08:55:39 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id e81so26400423oia.6;
        Mon, 24 Jan 2022 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
        b=AdjzeW2NDnDC0LsefwAyfMQPHKasi2WEsO/Fefl4/xmruL2S70ZVcO0ICKaF2j3ad5
         zxakJOxR/nCjqfVB5oN10DTfcc3h/Ti9kbJeMNW84IdozV05vwt7h48xPImgwrtbsmNq
         hofA3N783T12xmP8MKxUGCBYm9epa8YSRlI6pdQlrUtKkUkFS/w74Ft0X2D7nRE3B5Gf
         v54YRnWxCfejH7LMSiog3wRcWG20w83Q29e6bGub0+rtmkA/Hfu5EyNbLQ9gtOIKv1a+
         dnW5V7NCK+snzroEchC7oZKymciYuz0iaO7HfidWYnvYlOImtCt7bC3ZPzM9quIX2M0C
         RGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJZWCWBHIS8OyZEeA82nz/0fHFZSXZpGhVz4hbd1tCU=;
        b=Uy6GqUPjoJck/dFL1MZ7+LDwdAE5eCBFHDJrRy6wrYUg1utPGEUZ2JHKUMIbjMplGY
         28PE+Z/LDhfOpuF6ArOzrDw7uh+9nmIHmMfO1RqZvieq2Q5Zs1LpkWEhXkVKznwlm7Bc
         5cC1E+gvi7qdsQJ3ooype5LxV5HJPfuJQKjECE6VR7wpwjtjjKqBNjKyQr05rNHJ/EIK
         7sGpgG7dS/o55jriAQpvsTDSYZGqVRy08hE949wu1LA03Pirypk0GHiQbjXf//TcP4N0
         6dMhG8wOZbm0NPvvvzPLL7Af/MWT4yQhXSIbuZ9ysCmWI6sNhbNcYCv/ik96OS2HY7Pa
         SzTg==
X-Gm-Message-State: AOAM533uSmnsJeFDpNb8rXDK9bGijXm4KtHoc2TxWwGe/O5dN/K5jcqr
        Xye3iWE1V1xGKEAttg9iWms=
X-Google-Smtp-Source: ABdhPJz3j3jrbbEsLcEQEhcnERE5c/L4/UpNrt93QVraysUjeWTOPquNrIwVpJofBqzw/3L+Yj9G9A==
X-Received: by 2002:aca:dac3:: with SMTP id r186mr2148216oig.163.1643043338580;
        Mon, 24 Jan 2022 08:55:38 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:55:37 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 5/6 v2] drm/panel: simple: add Geekworm MZP280 Panel
Date:   Mon, 24 Jan 2022 10:55:25 -0600
Message-Id: <20220124165526.1104-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

