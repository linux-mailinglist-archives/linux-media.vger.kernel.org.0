Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE3F483656
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 18:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbiACRlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 12:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbiACRlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 12:41:16 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BD6C061785;
        Mon,  3 Jan 2022 09:41:16 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id j185so55822107oif.8;
        Mon, 03 Jan 2022 09:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdtXppYqsetXpW/uTb4lADvDktzu31SRTwb5UgROFro=;
        b=HTvd/0eoSMO64/CqOjjXMwPDjVWr7Pvf5LW/l14oLAP8b8DlP5d9hOfHwxP9uCDaVT
         cFQitwzw+5L/HxCe0FD8sn68DeaRCGmbgHXhVht81Y0+0jsBecg5DYKp6R3TXRkaTFcc
         b70BzZqYIw7z7sw19Yk56uI3LrJdoRDYKqHy4cOIJLiArV3jaDM+Mk7HtiiXXXOuC4ME
         Y2H6OOBGfLUwE/UtwwLfB9rLfmP4/ysRSVSOFHsDgrjX6afFd/Zy7CRnR74d7p9pe721
         ceb3lcxDDsEDWq/WepVbLjj2MUIpAZ4PH8rP/eZlc76Xgv4NX8nnzEdtvCxr82aDd4Wf
         2cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdtXppYqsetXpW/uTb4lADvDktzu31SRTwb5UgROFro=;
        b=jsr8lsfx1AnVCGPnDXiFR/3sRdserkvUQ7rvcI5wVAKiaBazsI6X4G/d/uauHq5gkz
         4NXB2OUtq7pkNFZqlo0Qs07CYaCeTRaGlLb85OI2zZRc6VmxnQzxJs/ePart++AhwhnJ
         H0gqHtkcR1KbylO9tg3GN2LKonOG7uY1BV0Qaazwr2NSXpsSIzvvBUx31L18uPAf365C
         RrSKPfPQAfzpMmDJpL/TPhshS6aaD00Zgg8KhpCsEvYQAusrRzsOD11GPMa8BFiFHCSe
         /cFPY81uMcNEdQ7dhrQKPMtAIgzIy0Ly+Q7fKH3JqpTH6KYnQ+q9cXuWN6usprkCmLb6
         CR3g==
X-Gm-Message-State: AOAM5333N2TUMfZbM3ZOkmkFyXJ0c0MAzDa0jYKIOLuz+dhC9QF5pUG2
        8z+ehi2RRnzj8IgSZt90e9k=
X-Google-Smtp-Source: ABdhPJxv12SBhIQegsP8WBo7Udu7BUNWbG0MjTL0nrGxkn9RYsLEGc8l03LxlMyDJxQzvpOH/Ag5Vw==
X-Received: by 2002:a05:6808:1202:: with SMTP id a2mr36469392oil.57.1641231675781;
        Mon, 03 Jan 2022 09:41:15 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 09:41:15 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mchehab@kernel.org, emma@anholt.net,
        mripard@kernel.org, linux-media@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/5] drm/panel: simple: add Geekworm MZP280 Panel
Date:   Mon,  3 Jan 2022 11:41:05 -0600
Message-Id: <20220103174106.907-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Geekworm MZP280 Panel

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..f40f4e9a0e08 100644
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
@@ -3713,6 +3739,9 @@ static const struct of_device_id platform_of_match[] = {
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

