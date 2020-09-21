Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9962735A4
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 00:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgIUWVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 18:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIUWVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 18:21:08 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A015AC061755;
        Mon, 21 Sep 2020 15:21:07 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x69so15815202lff.3;
        Mon, 21 Sep 2020 15:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5baCXWiV2rwhDRVIV5EJic7Mgcb5zuuk0grKytM42nU=;
        b=H5n2OyQIWiZ86R9nTBQ/CyeiSF3f8Da6Gk9onHHG8BcUhzO4l/293nBEz09UhUcgjD
         APysoQ88mps2DTGrR3SUJg1SwF/9PrX5cnG17bMUX1hDdpBGGjujUHvSjWLgGTJlSwdA
         TkjvyB3fGVEIqlE2F8sE6YIB6rxMsOLgwJCSoiijwoUYozukfps5D2bq31H6KgZBz1Hp
         JQFJHO76AvJNiN94ZiJ0vZwPrBrGYJxDlbS8RMsm1DpT2fvEw0b0RoViT4p2Zw4MGGg1
         y3MamRLVZMHqfgV26Ym++7nhgEQ3Mw8actCzviH2h4y7D0d/mVa2iNxTXY6l6OmPS9pg
         3GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5baCXWiV2rwhDRVIV5EJic7Mgcb5zuuk0grKytM42nU=;
        b=SBGiTVhBaOtmkbjoz1E5ulA7TaydJhLm/mF66fCAgcmGku1aw3CRozE29pDEHs8ev4
         3hks6FCsfuGDgkkZmt94soG85qLaiJuT4xQZL34NbURLE/18EaU4cmv+EZ7VIG7Pxf7Q
         iI2mwxZr4uZfy1yuC4I4A/BjSKw/IUjdQG+qk/ypDiUXJHrwZm+qJRsM7EPI+PAX3FWA
         CnN7Vc8D2l5Q723QLpoCxMdiIw1jLUgYAAS6jrKdVFCLdyNXzca5E0FtIa/Q5rl1tjJu
         8rf0XS21PmK17wK3e8BpAHz6wMfWC4ehAnj5o/+PA8Se9+WPB/i4n366dwpFF11PEEJH
         JO7g==
X-Gm-Message-State: AOAM530bbsJc2mpTTfP6rso2dCVlEAqzflnJc29MJEj4Bu2gSlJyYxOV
        +R9LsuCKUWE7mz/PlQ1849c=
X-Google-Smtp-Source: ABdhPJwEmzK6QntNgT2mTbx6XXS7ONNKRyw8nQRl7vqpKhynXV1QGBJA0WxrVxjWM6TbGO+xJxQFVA==
X-Received: by 2002:ac2:4203:: with SMTP id y3mr623726lfh.52.1600726865969;
        Mon, 21 Sep 2020 15:21:05 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se. [82.196.111.59])
        by smtp.gmail.com with ESMTPSA id y10sm2870617lfj.271.2020.09.21.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 15:21:05 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: dvb-frontends: tda18271c2dd: Constify static structs
Date:   Tue, 22 Sep 2020 00:13:43 +0200
Message-Id: <20200921221343.72212-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Constify a number of static structs that were not modified. In order to
be able to do that, const input arguments to a couple of functions that
not modify their argument. This allows the compiler to put them in
read-only memory, resulting in about 6k memory being read-only, and the
resulting module is 400 bytes smaller.

Before:
   text    data     bss     dec     hex filename
  15492    6873       0   22365    575d drivers/media/dvb-frontends/tda18271c2dd.ko

After:
   text    data     bss     dec     hex filename
  21021     897       0   21918    559e drivers/media/dvb-frontends/tda18271c2dd.ko

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/dvb-frontends/tda18271c2dd.c    |  8 +++----
 .../media/dvb-frontends/tda18271c2dd_maps.h   | 22 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index 43312bba1aec..661cbad76a2c 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -198,7 +198,7 @@ static void reset(struct tda_state *state)
 	state->m_bFMInput = (ulFMInput == 2);
 }
 
-static bool SearchMap1(struct SMap Map[],
+static bool SearchMap1(const struct SMap Map[],
 		       u32 Frequency, u8 *pParam)
 {
 	int i = 0;
@@ -211,7 +211,7 @@ static bool SearchMap1(struct SMap Map[],
 	return true;
 }
 
-static bool SearchMap2(struct SMapI Map[],
+static bool SearchMap2(const struct SMapI Map[],
 		       u32 Frequency, s32 *pParam)
 {
 	int i = 0;
@@ -225,7 +225,7 @@ static bool SearchMap2(struct SMapI Map[],
 	return true;
 }
 
-static bool SearchMap3(struct SMap2 Map[], u32 Frequency,
+static bool SearchMap3(const struct SMap2 Map[], u32 Frequency,
 		       u8 *pParam1, u8 *pParam2)
 {
 	int i = 0;
@@ -240,7 +240,7 @@ static bool SearchMap3(struct SMap2 Map[], u32 Frequency,
 	return true;
 }
 
-static bool SearchMap4(struct SRFBandMap Map[],
+static bool SearchMap4(const struct SRFBandMap Map[],
 		       u32 Frequency, u8 *pRFBand)
 {
 	int i = 0;
diff --git a/drivers/media/dvb-frontends/tda18271c2dd_maps.h b/drivers/media/dvb-frontends/tda18271c2dd_maps.h
index 5f75516bc0cb..82218e02d77d 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd_maps.h
+++ b/drivers/media/dvb-frontends/tda18271c2dd_maps.h
@@ -6,7 +6,7 @@ enum HF_S {
 	HF_DVBC_8MHZ, HF_DVBC
 };
 
-static struct SStandardParam m_StandardTable[] = {
+static const struct SStandardParam m_StandardTable[] = {
 	{       0,        0, 0x00, 0x00 },    /* HF_None */
 	{ 6000000,  7000000, 0x1D, 0x2C },    /* HF_B, */
 	{ 6900000,  8000000, 0x1E, 0x2C },    /* HF_DK, */
@@ -28,7 +28,7 @@ static struct SStandardParam m_StandardTable[] = {
 	{       0,        0, 0x00, 0x00 },    /* HF_DVBC (Unused) */
 };
 
-static struct SMap  m_BP_Filter_Map[] = {
+static const struct SMap  m_BP_Filter_Map[] = {
 	{   62000000,  0x00 },
 	{   84000000,  0x01 },
 	{  100000000,  0x02 },
@@ -39,7 +39,7 @@ static struct SMap  m_BP_Filter_Map[] = {
 	{          0,  0x00 },    /* Table End */
 };
 
-static struct SMapI m_RF_Cal_Map[] = {
+static const struct SMapI m_RF_Cal_Map[] = {
 	{   41000000,  0x0F },
 	{   43000000,  0x1C },
 	{   45000000,  0x2F },
@@ -481,7 +481,7 @@ static struct SMapI m_RF_Cal_Map[] = {
 };
 
 
-static struct SMap2  m_KM_Map[] = {
+static const struct SMap2  m_KM_Map[] = {
 	{   47900000,  3, 2 },
 	{   61100000,  3, 1 },
 	{  350000000,  3, 0 },
@@ -490,7 +490,7 @@ static struct SMap2  m_KM_Map[] = {
 	{          0,  0x00 },    /* Table End */
 };
 
-static struct SMap2 m_Main_PLL_Map[] = {
+static const struct SMap2 m_Main_PLL_Map[] = {
 	{  33125000, 0x57, 0xF0 },
 	{  35500000, 0x56, 0xE0 },
 	{  38188000, 0x55, 0xD0 },
@@ -534,7 +534,7 @@ static struct SMap2 m_Main_PLL_Map[] = {
 	{         0, 0x00, 0x00 },    /* Table End */
 };
 
-static struct SMap2 m_Cal_PLL_Map[] = {
+static const struct SMap2 m_Cal_PLL_Map[] = {
 	{  33813000, 0xDD, 0xD0 },
 	{  36625000, 0xDC, 0xC0 },
 	{  39938000, 0xDB, 0xB0 },
@@ -572,7 +572,7 @@ static struct SMap2 m_Cal_PLL_Map[] = {
 	{         0, 0x00, 0x00 },    /* Table End */
 };
 
-static struct SMap  m_GainTaper_Map[] = {
+static const struct SMap  m_GainTaper_Map[] = {
 	{  45400000, 0x1F },
 	{  45800000, 0x1E },
 	{  46200000, 0x1D },
@@ -661,7 +661,7 @@ static struct SMap  m_GainTaper_Map[] = {
 	{         0, 0x00 },    /* Table End */
 };
 
-static struct SMap m_RF_Cal_DC_Over_DT_Map[] = {
+static const struct SMap m_RF_Cal_DC_Over_DT_Map[] = {
 	{  47900000, 0x00 },
 	{  55000000, 0x00 },
 	{  61100000, 0x0A },
@@ -767,14 +767,14 @@ static struct SMap m_RF_Cal_DC_Over_DT_Map[] = {
 };
 
 
-static struct SMap  m_IR_Meas_Map[] = {
+static const struct SMap  m_IR_Meas_Map[] = {
 	{ 200000000, 0x05 },
 	{ 400000000, 0x06 },
 	{ 865000000, 0x07 },
 	{         0, 0x00 },    /* Table End */
 };
 
-static struct SMap2 m_CID_Target_Map[] = {
+static const struct SMap2 m_CID_Target_Map[] = {
 	{  46000000, 0x04, 18 },
 	{  52200000, 0x0A, 15 },
 	{  70100000, 0x01, 40 },
@@ -790,7 +790,7 @@ static struct SMap2 m_CID_Target_Map[] = {
 	{         0, 0x00,  0 },    /* Table End */
 };
 
-static struct SRFBandMap  m_RF_Band_Map[7] = {
+static const struct SRFBandMap  m_RF_Band_Map[7] = {
 	{   47900000,   46000000,           0,          0},
 	{   61100000,   52200000,           0,          0},
 	{  152600000,   70100000,   136800000,          0},
-- 
2.28.0

