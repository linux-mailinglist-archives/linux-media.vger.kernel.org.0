Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA15D7DEF37
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 10:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345921AbjKBJvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 05:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345773AbjKBJvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 05:51:04 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7AF112;
        Thu,  2 Nov 2023 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698918658; x=1730454658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NaJ2q2zJKbE26FFfK49AlCMhE7vPGcEXpXAZjNOL0ss=;
  b=BrOpDaFtAk/KYkGrhd8AEmYVibp3OYpyYINHrHbNmlBptkjoAHQuKBRe
   ULLhhvOmSLcupQ3UuG6p+OKxGpX0OCr9nY/xhEwCb60gbLS6hqc+d+5uy
   YRq5KhODAJeVk6a44BJq/SFrhRQAjUTqV7fQswUxEQVf9fBVZiUYZ3G5u
   X5bWDDXYIEUaVRSB8xN7es7QmAYccK3/LaS5OWIViZLRkgipBqkRZBaNi
   vVmtNzYBhlqyGId20QRUc4PqVlXllxaP1H0u3Zwp0wNDgYlUOoyZhXOIJ
   bgLByCvwn/mDtzE0qVxoDEqy/3+Z92YR7a4PnSgB6W4kZnrr1FMbXwIeL
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; 
   d="scan'208";a="33774789"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Nov 2023 10:50:50 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6CDCF28007F;
        Thu,  2 Nov 2023 10:50:50 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: imx290: Properly encode registers as little-endian
Date:   Thu,  2 Nov 2023 10:50:48 +0100
Message-Id: <20231102095048.3222110-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
References: <20231102095048.3222110-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion to CCI also converted the multi-byte register access to
big-endian. Correct the register definition by using the correct
little-endian ones.

Fixes: af73323b97702 ("media: imx290: Convert to new CCI register access helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 42 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 29098612813cb..c6fea5837a19f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -41,18 +41,18 @@
 #define IMX290_WINMODE_720P				(1 << 4)
 #define IMX290_WINMODE_CROP				(4 << 4)
 #define IMX290_FR_FDG_SEL				CCI_REG8(0x3009)
-#define IMX290_BLKLEVEL					CCI_REG16(0x300a)
+#define IMX290_BLKLEVEL					CCI_REG16_LE(0x300a)
 #define IMX290_GAIN					CCI_REG8(0x3014)
-#define IMX290_VMAX					CCI_REG24(0x3018)
+#define IMX290_VMAX					CCI_REG24_LE(0x3018)
 #define IMX290_VMAX_MAX					0x3ffff
-#define IMX290_HMAX					CCI_REG16(0x301c)
+#define IMX290_HMAX					CCI_REG16_LE(0x301c)
 #define IMX290_HMAX_MAX					0xffff
-#define IMX290_SHS1					CCI_REG24(0x3020)
+#define IMX290_SHS1					CCI_REG24_LE(0x3020)
 #define IMX290_WINWV_OB					CCI_REG8(0x303a)
-#define IMX290_WINPV					CCI_REG16(0x303c)
-#define IMX290_WINWV					CCI_REG16(0x303e)
-#define IMX290_WINPH					CCI_REG16(0x3040)
-#define IMX290_WINWH					CCI_REG16(0x3042)
+#define IMX290_WINPV					CCI_REG16_LE(0x303c)
+#define IMX290_WINWV					CCI_REG16_LE(0x303e)
+#define IMX290_WINPH					CCI_REG16_LE(0x3040)
+#define IMX290_WINWH					CCI_REG16_LE(0x3042)
 #define IMX290_OUT_CTRL					CCI_REG8(0x3046)
 #define IMX290_ODBIT_10BIT				(0 << 0)
 #define IMX290_ODBIT_12BIT				(1 << 0)
@@ -78,28 +78,28 @@
 #define IMX290_ADBIT2					CCI_REG8(0x317c)
 #define IMX290_ADBIT2_10BIT				0x12
 #define IMX290_ADBIT2_12BIT				0x00
-#define IMX290_CHIP_ID					CCI_REG16(0x319a)
+#define IMX290_CHIP_ID					CCI_REG16_LE(0x319a)
 #define IMX290_ADBIT3					CCI_REG8(0x31ec)
 #define IMX290_ADBIT3_10BIT				0x37
 #define IMX290_ADBIT3_12BIT				0x0e
 #define IMX290_REPETITION				CCI_REG8(0x3405)
 #define IMX290_PHY_LANE_NUM				CCI_REG8(0x3407)
 #define IMX290_OPB_SIZE_V				CCI_REG8(0x3414)
-#define IMX290_Y_OUT_SIZE				CCI_REG16(0x3418)
-#define IMX290_CSI_DT_FMT				CCI_REG16(0x3441)
+#define IMX290_Y_OUT_SIZE				CCI_REG16_LE(0x3418)
+#define IMX290_CSI_DT_FMT				CCI_REG16_LE(0x3441)
 #define IMX290_CSI_DT_FMT_RAW10				0x0a0a
 #define IMX290_CSI_DT_FMT_RAW12				0x0c0c
 #define IMX290_CSI_LANE_MODE				CCI_REG8(0x3443)
-#define IMX290_EXTCK_FREQ				CCI_REG16(0x3444)
-#define IMX290_TCLKPOST					CCI_REG16(0x3446)
-#define IMX290_THSZERO					CCI_REG16(0x3448)
-#define IMX290_THSPREPARE				CCI_REG16(0x344a)
-#define IMX290_TCLKTRAIL				CCI_REG16(0x344c)
-#define IMX290_THSTRAIL					CCI_REG16(0x344e)
-#define IMX290_TCLKZERO					CCI_REG16(0x3450)
-#define IMX290_TCLKPREPARE				CCI_REG16(0x3452)
-#define IMX290_TLPX					CCI_REG16(0x3454)
-#define IMX290_X_OUT_SIZE				CCI_REG16(0x3472)
+#define IMX290_EXTCK_FREQ				CCI_REG16_LE(0x3444)
+#define IMX290_TCLKPOST					CCI_REG16_LE(0x3446)
+#define IMX290_THSZERO					CCI_REG16_LE(0x3448)
+#define IMX290_THSPREPARE				CCI_REG16_LE(0x344a)
+#define IMX290_TCLKTRAIL				CCI_REG16_LE(0x344c)
+#define IMX290_THSTRAIL					CCI_REG16_LE(0x344e)
+#define IMX290_TCLKZERO					CCI_REG16_LE(0x3450)
+#define IMX290_TCLKPREPARE				CCI_REG16_LE(0x3452)
+#define IMX290_TLPX					CCI_REG16_LE(0x3454)
+#define IMX290_X_OUT_SIZE				CCI_REG16_LE(0x3472)
 #define IMX290_INCKSEL7					CCI_REG8(0x3480)
 
 #define IMX290_PGCTRL_REGEN				BIT(0)
-- 
2.34.1

