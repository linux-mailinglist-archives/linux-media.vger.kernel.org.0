Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B69826A17A
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIOJFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:05:10 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:41797 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgIOJFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600160708; x=1631696708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DH9KRJzkxhuMNPBchnQyI12kl0tRUGhcYDUgZ1rYYe0=;
  b=A+F2K0kfvY0Jar6j+x50euNwZH6B75E2ESxf+g2JoG/HGqAk5ociO3la
   /JR1My8OIzWm1iNP2iCLWGjjO/zG10VUYDcV5HEH8e39fvZ/uwC9MvmPw
   XsFlzjFBSXBSzqk2hZ42YrKikzVnZ/y1obzfdZuIJCobn2S5U+7c/DECl
   YIqB1mKlpAh7pChTgn9toel3e1CB9F0VAdETaQdXP0qgrut0a/JEXesbf
   R8isoWhKCrJ69x5EoDcXkgsdbLtlfKPT7sH0M5Gie8uhimyY2QfQv9AlD
   y9w5GZjH+zYnx2qNYt8QIzWDJ7QVu6wzeEsZn7SGk5KYsjr2Csc0yh122
   Q==;
IronPort-SDR: 8H0qUWzygEg56JrtTL6VVtOIxnCOFNR/q4aaB3MpoPKvsArAcqDjOIwrd4ccDl2RikxUl/ONvx
 qaxKWbJQudxV2/3WlUVbWFgNGD0c+uWB+t8XISD4ZhkDlc3M9xBUYdVaWv0ysNIzq8m4uBjvMH
 VkrE610alwoofUkyZiOjZJ6/OMFXQKeYcIog6/TzUeq5mMG9b6YbtR4sESO2+wMIQ7ILY2YjX/
 8H1eiAn+JvAcFXzvM7itIl9M17yz4rIS6XwDKuHIvbUDy31StTy19c/wmAwsjGtKLZylRYduR4
 UiI=
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="86900386"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2020 02:05:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 02:05:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 15 Sep 2020 02:04:39 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <sakari.ailus@iki.fi>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Eugen Hristev" <eugen.hristev@microchip.com>,
        Sakari Ailus <sakari.ailus@ifi.fi>
Subject: [PATCH v2 1/2] media: imx274: remove binning enum
Date:   Tue, 15 Sep 2020 12:04:41 +0300
Message-ID: <20200915090442.52322-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Binning enum is unused. Remove from driver.

Suggested-by: Sakari Ailus <sakari.ailus@ifi.fi>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- new patch

 drivers/media/i2c/imx274.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index e6aa9f32b6a8..69221c2c192c 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -65,7 +65,6 @@
  */
 #define IMX274_MIN_EXPOSURE_TIME		(4 * 260 / 72)
 
-#define IMX274_DEFAULT_BINNING			IMX274_BINNING_OFF
 #define IMX274_MAX_WIDTH			(3840)
 #define IMX274_MAX_HEIGHT			(2160)
 #define IMX274_MAX_FRAME_RATE			(120)
@@ -145,12 +144,6 @@ static const struct regmap_config imx274_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-enum imx274_binning {
-	IMX274_BINNING_OFF,
-	IMX274_BINNING_2_1,
-	IMX274_BINNING_3_1,
-};
-
 /*
  * Parameters for each imx274 readout mode.
  *
@@ -1837,7 +1830,7 @@ static int imx274_probe(struct i2c_client *client)
 	mutex_init(&imx274->lock);
 
 	/* initialize format */
-	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
+	imx274->mode = &imx274_modes[0];
 	imx274->crop.width = IMX274_MAX_WIDTH;
 	imx274->crop.height = IMX274_MAX_HEIGHT;
 	imx274->format.width = imx274->crop.width / imx274->mode->bin_ratio;
-- 
2.25.1

