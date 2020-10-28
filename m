Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C1D29D995
	for <lists+linux-media@lfdr.de>; Wed, 28 Oct 2020 23:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389873AbgJ1W5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 18:57:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43341 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389867AbgJ1W5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 18:57:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AC2106000B;
        Wed, 28 Oct 2020 22:57:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     hugues.fruchet@st.com, tomi.valkeinen@ti.com,
        sam@elite-embedded.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 1/3] media: i2c: ov5640: Adjust htot
Date:   Wed, 28 Oct 2020 23:57:04 +0100
Message-Id: <20201028225706.110078-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

Adjust htot for most of the modes. The numbers are from the OV5640
datasheet, and with these the driver works more reliably on DRA76 EVM +
OV5640, using 2 datalanes.

Without the patch, I see often ComplexIO (i.e. PHY) errors when
starting the streaming, and 1280x720 does not work at all without this
change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 8d0254d0e5ea..117ac22683ad 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -553,42 +553,42 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
 static const struct ov5640_mode_info
 ov5640_mode_data[OV5640_NUM_MODES] = {
 	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
-	 176, 1896, 144, 984,
+	 176, 2844, 144, 984,
 	 ov5640_setting_QCIF_176_144,
 	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
 	 OV5640_30_FPS},
 	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
-	 320, 1896, 240, 984,
+	 320, 2844, 240, 984,
 	 ov5640_setting_QVGA_320_240,
 	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
 	 OV5640_30_FPS},
 	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
-	 640, 1896, 480, 1080,
+	 640, 2844, 480, 1080,
 	 ov5640_setting_VGA_640_480,
 	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
 	 OV5640_60_FPS},
 	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
-	 720, 1896, 480, 984,
+	 720, 2844, 480, 984,
 	 ov5640_setting_NTSC_720_480,
 	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
 	OV5640_30_FPS},
 	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
-	 720, 1896, 576, 984,
+	 720, 2844, 576, 984,
 	 ov5640_setting_PAL_720_576,
 	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
 	 OV5640_30_FPS},
 	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
-	 1024, 1896, 768, 1080,
+	 1024, 2844, 768, 1080,
 	 ov5640_setting_XGA_1024_768,
 	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
 	 OV5640_30_FPS},
 	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
-	 1280, 1892, 720, 740,
+	 1280, 2844, 720, 740,
 	 ov5640_setting_720P_1280_720,
 	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
 	 OV5640_30_FPS},
 	{OV5640_MODE_1080P_1920_1080, SCALING,
-	 1920, 2500, 1080, 1120,
+	 1920, 2844, 1080, 1120,
 	 ov5640_setting_1080P_1920_1080,
 	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
 	 OV5640_30_FPS},
-- 
2.28.0

