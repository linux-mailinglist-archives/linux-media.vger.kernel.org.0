Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53AC650775
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 07:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiLSGP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 01:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbiLSGPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 01:15:54 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0B6394;
        Sun, 18 Dec 2022 22:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1671430548; x=1702966548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J+Pa5idsEsF21ZZmOnUuVtv+9iQnHLggG8V2rnsPm0I=;
  b=u/nt+iAMCs4U2NqNL1tNn37DOcjsn3Jm/X9ahAGcTes3bfSvdlBFC8Ye
   fpYXdypB6MRqVVLP7bAmJldDLHMqJ2wjRAPqVXaggDq/S3CSwaAyGsR5s
   Lc8CySjedHYr4bCIXoemQbjJSkV5j0ky8C2pymU4H0aQJgY/NKsScdEDl
   lpd7UXt/H2DSlcOUBhxMQgVq/jv2rGl1QQ7/Mue4AoRauycn7fKlAfiBY
   RhNSIsgXKkLeUkWNNbw1cD0JXZcrIKAzjvsYda/QWWmCGNkEnYre1/THf
   Fihu5BwRbwnwiZVyWwTQRXHn9UplZCbTxverne9S4xh2sOBDmqqxxUxCJ
   w==;
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="192277817"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Dec 2022 23:15:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 18 Dec 2022 23:15:43 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sun, 18 Dec 2022 23:15:41 -0700
From:   shravan kumar <shravan.chippa@microchip.com>
To:     <paul.j.murphy@intel.com>, <daniele.alessandrelli@intel.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "shravan kumar" <shravan.chippa@microchip.com>
Subject: [PATCH v7 3/5] media: i2c: imx334: add missing reset values for mode 3840x2160_regs[]
Date:   Mon, 19 Dec 2022 11:45:24 +0530
Message-ID: <20221219061526.3169369-4-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219061526.3169369-1-shravan.chippa@microchip.com>
References: <20221219061526.3169369-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shravan Chippa <shravan.chippa@microchip.com>

There are some missing reset reg_mode values for the 3840x2160@60
resolution. The camera sensor still works in 3840x2160@60 resolution mode
because of the register reset values. This is an issue when we change the
modes dynamically. As an example, when we change the mode from 1920x1080@30
 resolution to 3840x2160@60 resoultion then the mode values will be written
to the registers from the array mode_3840x2160_regs[] which gives the wrong
output which is incorrect resolution.

So add the missing reset values to the mode_3840x2160_regs[].

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a742b60ea3b0..1fa7e3711c3d 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -166,6 +166,7 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x3288, 0x21},
 	{0x328a, 0x02},
 	{0x302c, 0x3c},
+	{0x302d, 0x00},
 	{0x302e, 0x00},
 	{0x302f, 0x0f},
 	{0x3076, 0x70},
@@ -240,7 +241,26 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x3794, 0x7a},
 	{0x3796, 0xa1},
 	{0x3e04, 0x0e},
+	{0x319e, 0x00},
 	{0x3a00, 0x01},
+	{0x3A18, 0xBF},
+	{0x3A19, 0x00},
+	{0x3A1A, 0x67},
+	{0x3A1B, 0x00},
+	{0x3A1C, 0x6F},
+	{0x3A1D, 0x00},
+	{0x3A1E, 0xD7},
+	{0x3A1F, 0x01},
+	{0x3A20, 0x6F},
+	{0x3A21, 0x00},
+	{0x3A22, 0xCF},
+	{0x3A23, 0x00},
+	{0x3A24, 0x6F},
+	{0x3A25, 0x00},
+	{0x3A26, 0xB7},
+	{0x3A27, 0x00},
+	{0x3A28, 0x5F},
+	{0x3A29, 0x00},
 };
 
 /* Supported sensor mode configurations */
-- 
2.34.1

