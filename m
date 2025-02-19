Return-Path: <linux-media+bounces-26342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C593A3BAEE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0AA73B8122
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13E91CEEBE;
	Wed, 19 Feb 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R74XcfYE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702631CD213
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958422; cv=none; b=HQ0oSIBAlDwaV9Z4LCSYHNKIai6ydoXGkXbmxWKMliBFrye2hKvrFLGp6UNhcBOKwmHMwjVcxzMpg7EJENQ+Z0QxCTqNrhYWX3ZAV0TcXTUPK1uAB3etUgB0Ews/dChduGDl5dtW2tLTsqClKyFEThL1h27ED3L/CxToYKsdXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958422; c=relaxed/simple;
	bh=+tfQBP7HPvNr3+sASUOCG71uCpixrJhk1qNNSeFGQ1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHWvqGWPHZtnxHOSxZL+J/h6XWjCRV7McBMCzNyWaup6EqxTOduW3xmCIDvhp/k2nIpXakbTDdAxVP29BsXepfbfJMk2JSGZm2LaFtjRkWeuN/UM/9ikj/1CgFzrdhh09sOvY57BWzd/3B9xwB2g1PSlUNELDVnyvwEemJc8f1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R74XcfYE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3076262bfc6so68586581fa.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958418; x=1740563218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOeaYwoypX2Yk9dXqBFQfEbH2pm3V3Vk2f7EBAkfQ0I=;
        b=R74XcfYEIj8sMpV0AKN10JmjVzGZNWIyGcM4frJUTSDbyukXkPbfUY8h8/6KrfQ8m7
         8fPOCB6DAkZ6x8zYBKyHtiSSaqY8hOi1wH5w4vR/O17WwPCC5g8fVDIKIsaAA/7J06kH
         oJUWCbxpcH90LKsZqi7klKckicBSIoiiq5hEQlSMRIUrCjRkqdz5vmhy13aiIggy81wk
         UCNm6tNRaLRtYuZq9P34yU7TapldjSh6qErPSThIdBsHTPZhHaxsVgdmI7tvb4UPs8Ps
         zalQCjFXwBqbUy6ISd5SUyi3r6pcH1qtHs02INoqzMo3/WvGieAP9kf3qI6D2LvuYNR0
         b1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958418; x=1740563218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOeaYwoypX2Yk9dXqBFQfEbH2pm3V3Vk2f7EBAkfQ0I=;
        b=H5HCVm998JIAWKctpncibzfRwVLhwaoNKpKw+j/KWyX7XXD7H7IJOSQhdpnaML6+uI
         JHbMZUpRBSVeuhvgtEjfNcZNq4OCPx/1GgqWlgu4VuRLtTQK7WoGC82NTQJumISk6Kpa
         HdD8KTRnrG0YILUpGVpcPZk/NNHycTLuZfm7SGXjLphq45BluStnCg9ZXTIMT55UK7h6
         piP9NGXl9Em2v7rLmdi8XQ6/q/i4YhGjOuh9KWlmH3NGX09z6xjmqhQSQifKnfZftHvJ
         qyvWsc4aMwSBOnBzqaPkLfaq0CAZQ8DIj7Z10sezARpgIKJYcARTTCQ36irN8jr7/eqJ
         DZMw==
X-Gm-Message-State: AOJu0Yyu1OynSjOrEoq3vAaheQJjftiQNMNNfRlrTH4Hof2x3Ltj+IgO
	JwVu6MAxq2jbFI4IoKFHWvzQe/2TE6EEW+ItjtpGTuNuz7LMWvTdf1GJHg==
X-Gm-Gg: ASbGncsFbMEWqjMxVVu0fKWIk+XIFrXgg/k5Z8mX0NdUjQE8Rzlhc9l4mqSHj76Arks
	ChNSCOmcBfRErpwiRuKBrEUvlLc5perPLRZgMsb1SKW2N6N1pOTQ0k44OSY5QMRF8Sfu4yla8jH
	xnpmhILTecXmF5AeQ5riabWclWxrZ1TzeaZxbQdmq1R2mA5kwZMzCpy9KNS1ibA/x9jH0STd9ds
	P8GRid/eM+pDkPC89yLDFnTGg7SU1vq8ZsVmHuciLRSqaR1MsO2uVTXoOB9igcT2beIGVR85GS5
	xlpPxvM5+xAPlfljZu/H27BhPRI/sZFE9QmloA==
X-Google-Smtp-Source: AGHT+IF2QJUV89hbOoKlLDMOKgRy+snFfDIGONA9Ro1hw2s3WtD7C03YJuTXsRL2dpbWCLFlEWkFgQ==
X-Received: by 2002:a05:6512:4019:b0:545:bda:f10 with SMTP id 2adb3069b0e04-5452fe5bebbmr5661923e87.21.1739958417757;
        Wed, 19 Feb 2025 01:46:57 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105fe5sm2095131e87.138.2025.02.19.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:46:57 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 4/4] media: i2c: imx415: Add missing 4-lane CSI configurations
Date: Wed, 19 Feb 2025 12:46:37 +0300
Message-Id: <20250219094637.607615-4-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250219094637.607615-1-eagle.alexander923@gmail.com>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all CSI configurations are suitable for both 2-lane and 4-lane mode.
To solve this, let's use a zero value in the hmax_min[] field of the
supported_modes[] structure to indicate which CSI configuration can not
be used for 2-lane or 4-lane mode.
Now that we have done that, let's add the remaining CSI configurations
that can be used for 4-lane mode.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 46 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 83b7929455b2..5f18d3f38ded 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -505,6 +505,19 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
+/* 1485 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_1485mbps[] = {
+	{ IMX415_TCLKPOST, 0x00A7 },
+	{ IMX415_TCLKPREPARE, 0x0057 },
+	{ IMX415_TCLKTRAIL, 0x005F },
+	{ IMX415_TCLKZERO, 0x0197 },
+	{ IMX415_THSPREPARE, 0x005F },
+	{ IMX415_THSZERO, 0x00AF },
+	{ IMX415_THSTRAIL, 0x005F },
+	{ IMX415_THSEXIT, 0x009F },
+	{ IMX415_TLPX, 0x004F },
+};
+
 /* 1782 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
 	{ IMX415_TCLKPOST, 0x00B7 },
@@ -531,6 +544,19 @@ static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
 	{ IMX415_TLPX, 0x006F },
 };
 
+/* 2376 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_2376mbps[] = {
+	{ IMX415_TCLKPOST, 0x00E7 },
+	{ IMX415_TCLKPREPARE, 0x008F },
+	{ IMX415_TCLKTRAIL, 0x008F },
+	{ IMX415_TCLKZERO, 0x027F },
+	{ IMX415_THSPREPARE, 0x0097 },
+	{ IMX415_THSZERO, 0x010F },
+	{ IMX415_THSTRAIL, 0x0097 },
+	{ IMX415_THSEXIT, 0x00F7 },
+	{ IMX415_TLPX, 0x007F },
+};
+
 struct imx415_mode_reg_list {
 	u32 num_of_regs;
 	const struct cci_reg_sequence *regs;
@@ -576,6 +602,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_1440mbps,
 		},
 	},
+	{
+		.lane_rate = 1485000000,
+		.hmax_min = { 0, 550 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_1485mbps),
+			.regs = imx415_linkrate_1485mbps,
+		},
+	},
 	{
 		.lane_rate = 1782000000,
 		.hmax_min = { 1100, 550 },
@@ -592,6 +626,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_2079mbps,
 		},
 	},
+	{
+		.lane_rate = 2376000000,
+		.hmax_min = { 0, 366 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_2376mbps),
+			.regs = imx415_linkrate_2376mbps,
+		},
+	},
 };
 
 static const char *const imx415_test_pattern_menu[] = {
@@ -1375,9 +1417,13 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		}
 
 		for (j = 0; j < ARRAY_SIZE(supported_modes); ++j) {
+			int lanes_idx = sensor->num_data_lanes == 2 ? 0 : 1;
+
 			if (bus_cfg.link_frequencies[i] * 2 !=
 			    supported_modes[j].lane_rate)
 				continue;
+			if (!supported_modes[j].hmax_min[lanes_idx])
+				continue;
 			sensor->cur_mode = j;
 			break;
 		}
-- 
2.39.1


