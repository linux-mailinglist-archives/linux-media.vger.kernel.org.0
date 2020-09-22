Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B9A2745C9
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 17:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgIVPw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 11:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgIVPw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 11:52:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B432C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 08:52:29 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF420DC4;
        Tue, 22 Sep 2020 17:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600789935;
        bh=m6ECTC+BfjIzroyxUcjWvVaCQPSImnVB0Ydo52iT5RQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TQyACBFI/p2IAdnEfDasmNfKMVAL5P9RSTpsi8SgC3238ElmOCu2KoucuklnNw86T
         /hw+voh9VQBFbFRMofOu1z75QclMjpYthZkf0vjdY2bdqxg2N8tghcTgdcmjQtHr3I
         +tNNrCNlHkCN+tiXbDm1SftG4QE6R6FLNNa02NLg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 1/2] media: i2c: max9286: Use unsigned constants
Date:   Tue, 22 Sep 2020 16:52:09 +0100
Message-Id: <20200922155210.242536-2-kieran.bingham+renesas@ideasonboard.com>
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
 drivers/media/i2c/max9286.c | 96 ++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c8212071df9..079d5d7cfc2d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -31,85 +31,85 @@
 #include <media/v4l2-subdev.h>
 
 /* Register 0x00 */
-#define MAX9286_MSTLINKSEL_AUTO		(7 << 5)
+#define MAX9286_MSTLINKSEL_AUTO		(7U << 5)
 #define MAX9286_MSTLINKSEL(n)		((n) << 5)
 #define MAX9286_EN_VS_GEN		BIT(4)
-#define MAX9286_LINKEN(n)		(1 << (n))
+#define MAX9286_LINKEN(n)		(1U << (n))
 /* Register 0x01 */
-#define MAX9286_FSYNCMODE_ECU		(3 << 6)
-#define MAX9286_FSYNCMODE_EXT		(2 << 6)
-#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
-#define MAX9286_FSYNCMODE_INT_HIZ	(0 << 6)
+#define MAX9286_FSYNCMODE_ECU		(3U << 6)
+#define MAX9286_FSYNCMODE_EXT		(2U << 6)
+#define MAX9286_FSYNCMODE_INT_OUT	(1U << 6)
+#define MAX9286_FSYNCMODE_INT_HIZ	(0U << 6)
 #define MAX9286_GPIEN			BIT(5)
 #define MAX9286_ENLMO_RSTFSYNC		BIT(2)
-#define MAX9286_FSYNCMETH_AUTO		(2 << 0)
-#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
-#define MAX9286_FSYNCMETH_MANUAL	(0 << 0)
+#define MAX9286_FSYNCMETH_AUTO		(2U << 0)
+#define MAX9286_FSYNCMETH_SEMI_AUTO	(1U << 0)
+#define MAX9286_FSYNCMETH_MANUAL	(0U << 0)
 #define MAX9286_REG_FSYNC_PERIOD_L	0x06
 #define MAX9286_REG_FSYNC_PERIOD_M	0x07
 #define MAX9286_REG_FSYNC_PERIOD_H	0x08
 /* Register 0x0a */
-#define MAX9286_FWDCCEN(n)		(1 << ((n) + 4))
-#define MAX9286_REVCCEN(n)		(1 << (n))
+#define MAX9286_FWDCCEN(n)		(1U << ((n) + 4))
+#define MAX9286_REVCCEN(n)		(1U << (n))
 /* Register 0x0c */
 #define MAX9286_HVEN			BIT(7)
-#define MAX9286_EDC_6BIT_HAMMING	(2 << 5)
-#define MAX9286_EDC_6BIT_CRC		(1 << 5)
-#define MAX9286_EDC_1BIT_PARITY		(0 << 5)
+#define MAX9286_EDC_6BIT_HAMMING	(2U << 5)
+#define MAX9286_EDC_6BIT_CRC		(1U << 5)
+#define MAX9286_EDC_1BIT_PARITY		(0U << 5)
 #define MAX9286_DESEL			BIT(4)
 #define MAX9286_INVVS			BIT(3)
 #define MAX9286_INVHS			BIT(2)
-#define MAX9286_HVSRC_D0		(2 << 0)
-#define MAX9286_HVSRC_D14		(1 << 0)
-#define MAX9286_HVSRC_D18		(0 << 0)
+#define MAX9286_HVSRC_D0		(2U << 0)
+#define MAX9286_HVSRC_D14		(1U << 0)
+#define MAX9286_HVSRC_D18		(0U << 0)
 /* Register 0x0f */
 #define MAX9286_0X0F_RESERVED		BIT(3)
 /* Register 0x12 */
 #define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
 #define MAX9286_CSIDBL			BIT(5)
 #define MAX9286_DBL			BIT(4)
-#define MAX9286_DATATYPE_USER_8BIT	(11 << 0)
-#define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
-#define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
-#define MAX9286_DATATYPE_RAW14		(8 << 0)
-#define MAX9286_DATATYPE_RAW11		(7 << 0)
-#define MAX9286_DATATYPE_RAW10		(6 << 0)
-#define MAX9286_DATATYPE_RAW8		(5 << 0)
-#define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
-#define MAX9286_DATATYPE_YUV422_8BIT	(3 << 0)
-#define MAX9286_DATATYPE_RGB555		(2 << 0)
-#define MAX9286_DATATYPE_RGB565		(1 << 0)
-#define MAX9286_DATATYPE_RGB888		(0 << 0)
+#define MAX9286_DATATYPE_USER_8BIT	(11U << 0)
+#define MAX9286_DATATYPE_USER_YUV_12BIT	(10U << 0)
+#define MAX9286_DATATYPE_USER_24BIT	(9U << 0)
+#define MAX9286_DATATYPE_RAW14		(8U << 0)
+#define MAX9286_DATATYPE_RAW11		(7U << 0)
+#define MAX9286_DATATYPE_RAW10		(6U << 0)
+#define MAX9286_DATATYPE_RAW8		(5U << 0)
+#define MAX9286_DATATYPE_YUV422_10BIT	(4U << 0)
+#define MAX9286_DATATYPE_YUV422_8BIT	(3U << 0)
+#define MAX9286_DATATYPE_RGB555		(2U << 0)
+#define MAX9286_DATATYPE_RGB565		(1U << 0)
+#define MAX9286_DATATYPE_RGB888		(0U << 0)
 /* Register 0x15 */
 #define MAX9286_VC(n)			((n) << 5)
 #define MAX9286_VCTYPE			BIT(4)
 #define MAX9286_CSIOUTEN		BIT(3)
-#define MAX9286_0X15_RESV		(3 << 0)
+#define MAX9286_0X15_RESV		(3U << 0)
 /* Register 0x1b */
-#define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
-#define MAX9286_ENEQ(n)			(1 << (n))
+#define MAX9286_SWITCHIN(n)		(1U << ((n) + 4))
+#define MAX9286_ENEQ(n)			(1U << (n))
 /* Register 0x27 */
 #define MAX9286_LOCKED			BIT(7)
 /* Register 0x31 */
 #define MAX9286_FSYNC_LOCKED		BIT(6)
 /* Register 0x34 */
 #define MAX9286_I2CLOCACK		BIT(7)
-#define MAX9286_I2CSLVSH_1046NS_469NS	(3 << 5)
-#define MAX9286_I2CSLVSH_938NS_352NS	(2 << 5)
-#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
-#define MAX9286_I2CSLVSH_352NS_117NS	(0 << 5)
-#define MAX9286_I2CMSTBT_837KBPS	(7 << 2)
-#define MAX9286_I2CMSTBT_533KBPS	(6 << 2)
-#define MAX9286_I2CMSTBT_339KBPS	(5 << 2)
-#define MAX9286_I2CMSTBT_173KBPS	(4 << 2)
-#define MAX9286_I2CMSTBT_105KBPS	(3 << 2)
-#define MAX9286_I2CMSTBT_84KBPS		(2 << 2)
-#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
-#define MAX9286_I2CMSTBT_8KBPS		(0 << 2)
-#define MAX9286_I2CSLVTO_NONE		(3 << 0)
-#define MAX9286_I2CSLVTO_1024US		(2 << 0)
-#define MAX9286_I2CSLVTO_256US		(1 << 0)
-#define MAX9286_I2CSLVTO_64US		(0 << 0)
+#define MAX9286_I2CSLVSH_1046NS_469NS	(3U << 5)
+#define MAX9286_I2CSLVSH_938NS_352NS	(2U << 5)
+#define MAX9286_I2CSLVSH_469NS_234NS	(1U << 5)
+#define MAX9286_I2CSLVSH_352NS_117NS	(0U << 5)
+#define MAX9286_I2CMSTBT_837KBPS	(7U << 2)
+#define MAX9286_I2CMSTBT_533KBPS	(6U << 2)
+#define MAX9286_I2CMSTBT_339KBPS	(5U << 2)
+#define MAX9286_I2CMSTBT_173KBPS	(4U << 2)
+#define MAX9286_I2CMSTBT_105KBPS	(3U << 2)
+#define MAX9286_I2CMSTBT_84KBPS		(2U << 2)
+#define MAX9286_I2CMSTBT_28KBPS		(1U << 2)
+#define MAX9286_I2CMSTBT_8KBPS		(0U << 2)
+#define MAX9286_I2CSLVTO_NONE		(3U << 0)
+#define MAX9286_I2CSLVTO_1024US		(2U << 0)
+#define MAX9286_I2CSLVTO_256US		(1U << 0)
+#define MAX9286_I2CSLVTO_64US		(0U << 0)
 /* Register 0x3b */
 #define MAX9286_REV_TRF(n)		((n) << 4)
 #define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
-- 
2.25.1

