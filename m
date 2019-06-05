Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC40836767
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 00:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfFEWXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 18:23:04 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:37916 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfFEWXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 18:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559773380; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ec0iX6C9Cbbb2emN4/mdqLlTppIrtG6LOagZde1RzLM=;
        b=YOfxpYE/DJ+i+S7utlAgro38CuxdClMh1wkEE96NtjKlTp6Uwt2K4QyqQQzlfxhoWnoNjL
        wrhmsujZ4cwehaEam/pfYjP8EQo5nZnYR6e/yaYlDoBEewHL+iRWKd7AwLQd5IgLVWwLk7
        BhpNylMz6o2/1LsFJaREOQtf3iRHhDc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v5 3/3] drm/panel: simple: Add GiantPlus GPM940B0 panel support
Date:   Thu,  6 Jun 2019 00:22:47 +0200
Message-Id: <20190605222247.25657-3-paul@crapouillou.net>
In-Reply-To: <20190605222247.25657-1-paul@crapouillou.net>
References: <20190605222247.25657-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GiantPlus GPM940B0 is a simple 3.0" 320x240 24-bit TFT panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v2: Change bus format to MEDIA_BUS_FMT_RGB888_3X8_BE
    
    v3: No change
    
    v4: Change bus format to MEDIA_BUS_FMT_RGB888_3X8
    
    v5: No change

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4edf1e4..eec9a9efcc73 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1335,6 +1335,31 @@ static const struct panel_desc giantplus_gpg482739qs5 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing giantplus_gpm940b0_timing = {
+	.pixelclock = { 13500000, 27000000, 27500000 },
+	.hactive = { 320, 320, 320 },
+	.hfront_porch = { 14, 686, 718 },
+	.hback_porch = { 50, 70, 255 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 240, 240, 240 },
+	.vfront_porch = { 1, 1, 179 },
+	.vback_porch = { 1, 21, 31 },
+	.vsync_len = { 1, 1, 6 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc giantplus_gpm940b0 = {
+	.timings = &giantplus_gpm940b0_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 60,
+		.height = 45,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_3X8,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+};
+
 static const struct display_timing hannstar_hsd070pww1_timing = {
 	.pixelclock = { 64300000, 71100000, 82000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -2882,6 +2907,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
+	}, {
+		.compatible = "giantplus,gpm940b0",
+		.data = &giantplus_gpm940b0,
 	}, {
 		.compatible = "hannstar,hsd070pww1",
 		.data = &hannstar_hsd070pww1,
-- 
2.21.0.593.g511ec345e18

