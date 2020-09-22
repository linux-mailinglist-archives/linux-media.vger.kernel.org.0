Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B074B2745CA
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 17:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIVPw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 11:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgIVPw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 11:52:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E82EC0613CF
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 08:52:29 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 907751163;
        Tue, 22 Sep 2020 17:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600789942;
        bh=ZMWI4OGRZAATPh8nZBl53jCBoeI4nHhwrebs6Ygh4aw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cpSyGAGpfLDxIjH/dNpj8oUJPJ6pGPBUJHhF3w8keTA+trEg7mqkui9HeqKktB3PQ
         06xjaFiF1Hne6207GKKVRgzXU14M8Zpy0WpFfqndF6acX7N8Fp+9DPL9Zl3yhoNvFm
         sxMbFlw6uYO8+wMauXbayPKuIfqpqcfraPpKvyFA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/2] media: i2c: max9271: Use unsigned constants
Date:   Tue, 22 Sep 2020 16:52:10 +0100
Message-Id: <20200922155210.242536-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert the bitfield definitions to use unsigned integers.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9271.h | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
index d78fb21441e9..4ef36a90c746 100644
--- a/drivers/media/i2c/max9271.h
+++ b/drivers/media/i2c/max9271.h
@@ -13,24 +13,24 @@
 #define MAX9271_DEFAULT_ADDR	0x40
 
 /* Register 0x02 */
-#define MAX9271_SPREAD_SPECT_0		(0 << 5)
-#define MAX9271_SPREAD_SPECT_05		(1 << 5)
-#define MAX9271_SPREAD_SPECT_15		(2 << 5)
-#define MAX9271_SPREAD_SPECT_1		(5 << 5)
-#define MAX9271_SPREAD_SPECT_2		(3 << 5)
-#define MAX9271_SPREAD_SPECT_3		(6 << 5)
-#define MAX9271_SPREAD_SPECT_4		(7 << 5)
+#define MAX9271_SPREAD_SPECT_0		(0U << 5)
+#define MAX9271_SPREAD_SPECT_05		(1U << 5)
+#define MAX9271_SPREAD_SPECT_15		(2U << 5)
+#define MAX9271_SPREAD_SPECT_1		(5U << 5)
+#define MAX9271_SPREAD_SPECT_2		(3U << 5)
+#define MAX9271_SPREAD_SPECT_3		(6U << 5)
+#define MAX9271_SPREAD_SPECT_4		(7U << 5)
 #define MAX9271_R02_RES			BIT(4)
-#define MAX9271_PCLK_AUTODETECT		(3 << 2)
+#define MAX9271_PCLK_AUTODETECT		(3U << 2)
 #define MAX9271_SERIAL_AUTODETECT	(0x03)
 /* Register 0x04 */
 #define MAX9271_SEREN			BIT(7)
 #define MAX9271_CLINKEN			BIT(6)
 #define MAX9271_PRBSEN			BIT(5)
 #define MAX9271_SLEEP			BIT(4)
-#define MAX9271_INTTYPE_I2C		(0 << 2)
-#define MAX9271_INTTYPE_UART		(1 << 2)
-#define MAX9271_INTTYPE_NONE		(2 << 2)
+#define MAX9271_INTTYPE_I2C		(0U << 2)
+#define MAX9271_INTTYPE_UART		(1U << 2)
+#define MAX9271_INTTYPE_NONE		(2U << 2)
 #define MAX9271_REVCCEN			BIT(1)
 #define MAX9271_FWDCCEN			BIT(0)
 /* Register 0x07 */
@@ -39,9 +39,9 @@
 #define MAX9271_BWS			BIT(5)
 #define MAX9271_ES			BIT(4)
 #define MAX9271_HVEN			BIT(2)
-#define MAX9271_EDC_1BIT_PARITY		(0 << 0)
-#define MAX9271_EDC_6BIT_CRC		(1 << 0)
-#define MAX9271_EDC_6BIT_HAMMING	(2 << 0)
+#define MAX9271_EDC_1BIT_PARITY		(0U << 0)
+#define MAX9271_EDC_6BIT_CRC		(1U << 0)
+#define MAX9271_EDC_6BIT_HAMMING	(2U << 0)
 /* Register 0x08 */
 #define MAX9271_INVVS			BIT(7)
 #define MAX9271_INVHS			BIT(6)
@@ -51,22 +51,22 @@
 #define MAX9271_ID			0x09
 /* Register 0x0d */
 #define MAX9271_I2CLOCACK		BIT(7)
-#define MAX9271_I2CSLVSH_1046NS_469NS	(3 << 5)
-#define MAX9271_I2CSLVSH_938NS_352NS	(2 << 5)
-#define MAX9271_I2CSLVSH_469NS_234NS	(1 << 5)
-#define MAX9271_I2CSLVSH_352NS_117NS	(0 << 5)
-#define MAX9271_I2CMSTBT_837KBPS	(7 << 2)
-#define MAX9271_I2CMSTBT_533KBPS	(6 << 2)
-#define MAX9271_I2CMSTBT_339KBPS	(5 << 2)
-#define MAX9271_I2CMSTBT_173KBPS	(4 << 2)
-#define MAX9271_I2CMSTBT_105KBPS	(3 << 2)
-#define MAX9271_I2CMSTBT_84KBPS		(2 << 2)
-#define MAX9271_I2CMSTBT_28KBPS		(1 << 2)
-#define MAX9271_I2CMSTBT_8KBPS		(0 << 2)
-#define MAX9271_I2CSLVTO_NONE		(3 << 0)
-#define MAX9271_I2CSLVTO_1024US		(2 << 0)
-#define MAX9271_I2CSLVTO_256US		(1 << 0)
-#define MAX9271_I2CSLVTO_64US		(0 << 0)
+#define MAX9271_I2CSLVSH_1046NS_469NS	(3U << 5)
+#define MAX9271_I2CSLVSH_938NS_352NS	(2U << 5)
+#define MAX9271_I2CSLVSH_469NS_234NS	(1U << 5)
+#define MAX9271_I2CSLVSH_352NS_117NS	(0U << 5)
+#define MAX9271_I2CMSTBT_837KBPS	(7U << 2)
+#define MAX9271_I2CMSTBT_533KBPS	(6U << 2)
+#define MAX9271_I2CMSTBT_339KBPS	(5U << 2)
+#define MAX9271_I2CMSTBT_173KBPS	(4U << 2)
+#define MAX9271_I2CMSTBT_105KBPS	(3U << 2)
+#define MAX9271_I2CMSTBT_84KBPS		(2U << 2)
+#define MAX9271_I2CMSTBT_28KBPS		(1U << 2)
+#define MAX9271_I2CMSTBT_8KBPS		(0U << 2)
+#define MAX9271_I2CSLVTO_NONE		(3U << 0)
+#define MAX9271_I2CSLVTO_1024US		(2U << 0)
+#define MAX9271_I2CSLVTO_256US		(1U << 0)
+#define MAX9271_I2CSLVTO_64US		(0U << 0)
 /* Register 0x0f */
 #define MAX9271_GPIO5OUT		BIT(5)
 #define MAX9271_GPIO4OUT		BIT(4)
-- 
2.25.1

