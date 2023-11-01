Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741957DE0F0
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 13:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343508AbjKAMYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 08:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbjKAMYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 08:24:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7736911D;
        Wed,  1 Nov 2023 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698841444; x=1730377444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cxExEeA1vdIg/CcokEDnS1S4rVbb4FTgTus4XUp88yQ=;
  b=q+sqsSZj1lUolxtXZu8aHJK8orj36/xjKfEwACD1vJ2lS07NmsK0hKRP
   JWOePLWDNrmCClpd/sp7Fk+SPhA/HV56/nPtqX1nr3wma80K0UhUaYmJG
   f+AfQYDuU6WXMVyu7pRyezNk5y+oeiSsY1aKmMQLBHEmHTxeGDKzVRoXu
   fPVD1YY6hoP/khhDApjqxVE/6p/2Vz69B27D/pvhtngIMdlfUlaKR+Obx
   bihMFvlV/tbioNFaocnO4kmZXJf+m4HSraLHyiOyxvcUGsqTKWLr+993w
   CtCaGoDawIItD6rpU73Mi1dZXlxePsc4aEp0kczdwV8khnXmWytsnN6ZS
   w==;
X-IronPort-AV: E=Sophos;i="6.03,268,1694728800"; 
   d="scan'208";a="33759525"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Nov 2023 13:23:57 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D53F828007F;
        Wed,  1 Nov 2023 13:23:56 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx290: Properly encode registers as little-endian
Date:   Wed,  1 Nov 2023 13:23:54 +0100
Message-Id: <20231101122354.270453-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

