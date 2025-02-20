Return-Path: <linux-media+bounces-26530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CCA3E81A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C905319C200C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7150E268FCB;
	Thu, 20 Feb 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhpKyQGn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297462673B9;
	Thu, 20 Feb 2025 23:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092937; cv=none; b=g4WGmU5Aw4pm3LaxXxbsCSncjH60CeIftu7kVJSuup91gNxT5y9Ws2MfvvYh0FQpfujEgBzsTFHqdbqpF0UtMgk8RUKaFUtFY0p2JGDM+k7tKGPS9frs/2u1KxR3Qvd9NE1CMdaQI0BhchSpeBR4wdSS6vblhYxVmTd2xlRqmF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092937; c=relaxed/simple;
	bh=EzZQSdIx5D7T5oRoBm/8fSqgGLdREtHQcr2NCdkG5fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3A8D9J872/1Jo8RaA4UWMeVmGG0Bn9l0nnR/QhySB/oDEkBH6InCBxP2nrVRj7dKHfwRFDHz+1ye0b+KMgRp2+JxdkTNBOMccCX7zBbe9wCspvxarJTVN+cb+xLvqY4JQDlhUG1aS2su4we6R8tqzusAdYjWkjdUu2RLRxF7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhpKyQGn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb86beea8cso297436366b.1;
        Thu, 20 Feb 2025 15:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092934; x=1740697734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhX43RkJeHOzyL9QEiVx31rF6Y6JmPRuPUbmR6ly4C4=;
        b=JhpKyQGnhPqI3qjFdQzZxaioSIdAJ9zjg8NHP7vpsUAzx/7oiI0MoBrLfHmhO3/vZj
         4cWg7foxXP4uG+R/ig+qGWpxFBnZ2LqLe7YM+zDTlFSxxnwQoKWf7K9P2BrFZVC009ck
         WtoTmynAHzFCnagdDTtRIvQzeSVOjOuAqIAiYAae3jZ8OdvVI24va8Ocn14DgrXGzhZn
         LP/0OfIlugcUlxgX2HRIXzYioSpRcfk0n0xjKFNLBwl93O4nmrcMhJXGfdetpTb+OyWW
         FX3sfiVgDKlrGfW6bUL+i4gTaSAO6VFJ06IYJlfMGmZgMgUB6PcwBdSeUyrcWJJUL7mA
         kdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092934; x=1740697734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhX43RkJeHOzyL9QEiVx31rF6Y6JmPRuPUbmR6ly4C4=;
        b=Gz6WdJAtP6R65zVm2LFxV5yuxJitWAbiIZwUn7i4Jm4Js5pmg2lpnWMjr0XX0uXyFv
         5j3wZRaUmoZywWK76qD62AMUpjiZ9/kFGLB1JW3WVBY9KVQxhaxyzYUV42TxHXppNZ1G
         lnfs7adHo1cFtUXhu9u7ednMfvY7qT8I+Qp8COAIExsrGCulbUyeIB1LA5/T7PBSev0K
         G5lc48+bapXx35f1fZQmL1nryGZTG4s4dj6rO3alM8b0+7V66KOgUIG7kI5TbPAN/KTI
         HWjm+2qVMx8JGbedZPfDVXPKMuYZR+uhPLs90wliYgu9PoGM4926Nk28li9qTequKLnU
         e/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUuDpXnwy4K2BmNtE+zmKjNt7i7Y0r769U0csbElMKlHe0dfQI4RaqUIstEv+OI3BEShdGjqEtVHWBB@vger.kernel.org, AJvYcCVZMDBPSMvgmjpr/7w+//W6Szv05Z48ibfLaIAW5v5/vwSuhw5b3ZG0etG+Nyf7Mzykn3R9+Zsi3pRSIgAc@vger.kernel.org, AJvYcCXK31f5Er0MjHTlo4eHzzUpX0/hJSidV0n/47SeLyTRJI4ULXU/kGkX1iFfVwBFlVhsSO1buPMKHUCGNYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/tjYdKxImdLFCnMj3GgBgAWvZ0fjhKtNSHzvsHR/0AfLYy0s
	U5XEWb/GGQkkbmmoIrWMujlDys+6eG+SLCmM2ZVJU1Oj6qOSr7/h
X-Gm-Gg: ASbGncsRseTtPDj0VS9dCx50CbRAHMzVzVioWxeR+DKMljgyQz1asgsRCWBMSTptFnx
	U7aYIxZyxs83dVjYjleSBJ0M3Y4TaYsIydmykr249CB8Ej6TwJAY/MfJRgclqYHFpHkfiRH9sQ8
	B/3pAy0pwycydeVTZYNGwdsFRaX/jug4VTBGeTl4pvKZrrSmrdvwU6jGoecUiL1q1ZUgVnUSvDD
	ICCveOKvXLJcFuAt/YP1QvwDwm0p0fSz1PSHWopWuVXSJGFcZVJU0F0dJzg+9hWYnzZcGVSE3SX
	V1QIgybuPmkrGKjt/UFAgUVj9ifa
X-Google-Smtp-Source: AGHT+IHN9q1K9iy2cJqlLoBVyZt+NIVwf4Z/pfv0pnr1nZE9X5wgZJrRlMItfXGJSo5vo2ienwvsKA==
X-Received: by 2002:a17:906:4fc7:b0:ab6:dbd2:df78 with SMTP id a640c23a62f3a-abc09d31cd2mr102596866b.35.1740092934282;
        Thu, 20 Feb 2025 15:08:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:53 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 6/6] media: i2c: imx219: implement configurable VC ID
Date: Fri, 21 Feb 2025 01:08:14 +0200
Message-ID: <20250220230818.275262-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/i2c/imx219.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4c4ebe54f191b..ae93ac2bbe367 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -38,6 +38,8 @@
 #define IMX219_MODE_STANDBY		0x00
 #define IMX219_MODE_STREAMING		0x01
 
+#define IMX219_REG_CSI_CH_ID		CCI_REG8(0x0110)
+
 #define IMX219_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX219_CSI_2_LANE_MODE		0x01
 #define IMX219_CSI_4_LANE_MODE		0x03
@@ -363,6 +365,9 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* Virtual channel ID */
+	u8 vc_id;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -724,6 +729,12 @@ static int imx219_configure_lanes(struct imx219 *imx219)
 				  ARRAY_SIZE(imx219_4lane_regs), NULL);
 };
 
+static int imx219_configure_vc(struct imx219 *imx219)
+{
+	return cci_write(imx219->regmap, IMX219_REG_CSI_CH_ID,
+			 imx219->vc_id, NULL);
+}
+
 static int imx219_start_streaming(struct imx219 *imx219,
 				  struct v4l2_subdev_state *state)
 {
@@ -749,6 +760,13 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
+	/* Configure Virtual Channel ID */
+	ret = imx219_configure_vc(imx219);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to configure vc\n", __func__);
+		goto err_rpm_put;
+	}
+
 	/* Apply format and crop settings. */
 	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
@@ -994,6 +1012,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_subdev_state *state;
 	u32 code;
 
@@ -1006,7 +1025,7 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->entry[0].pixelcode = code;
 	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.vc = imx219->vc_id;
 	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
 				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
@@ -1149,6 +1168,13 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	}
 	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
 
+	if (ep_cfg.bus.mipi_csi2.num_vc_ids > 1) {
+		dev_err_probe(dev, -EINVAL,
+			      "only 1 virtual channel id is supported\n");
+		goto error_out;
+	}
+	imx219->vc_id = ep_cfg.bus.mipi_csi2.vc_ids[0];
+
 	/* Check the link frequency set in device tree */
 	switch (imx219->lanes) {
 	case 2:
-- 
2.48.1


