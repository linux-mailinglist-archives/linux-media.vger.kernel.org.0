Return-Path: <linux-media+bounces-26476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585DEA3DC7E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF4A2189485B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72130212B00;
	Thu, 20 Feb 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvrcDLxs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A35211A2B;
	Thu, 20 Feb 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061084; cv=none; b=lZm4wrlfh6dcD/zcY9VRVZxvaY4TgEsXQ+/spBIi1p/ZK6M1Up93DlnpgtqtLzy/ofWRVYOofTNmLXI3z0QeJeao5cQdYzh2zDKfAVCas1bWLHcAnKSfT1oSsAFgVGT+1fWIfZ/fafcGybYRprx0GxUCdGHiLWxPKeQ1gx24o2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061084; c=relaxed/simple;
	bh=02meRziosCIj5XMgGS3fhZ0M79JRqzLS+o9FESCTLZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZReCJCFpdgqjDSluPbwILS+i7svkJ4on4FBj2OZTUgtG61qEEniNsbp9WMonnuYJbAyVfCeJhpHoKXpZbjMGHOk3Km/u4167DBCBHFiw95DpZCnM7SnrpXJqbmMO2Jx+4HNh0RrLgJ1ZHwKIHPzbx5hSH43YwQCaFfIQkwFKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvrcDLxs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so1950135a12.0;
        Thu, 20 Feb 2025 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061081; x=1740665881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=NvrcDLxsJ8pJJ1dsN57U7u+EMZK2lvin7Drs9os3aLF0knAdGH3oOHCcv/Gc5ww3V6
         EwVO3hVNrGaovijtV+MzZR8bBpwiLH5DmRsJFAsRZ0Ryak8OkapGfJYmTQrQLNzO4JIP
         a1WP3wzbRwrFPNqxVc06frGG41K9wq+zIRWmk/Hsp+pG9bhmZAhLtSdZff2cklqrjzCc
         xboG3Y1ni1FsPeDpwbWitHy6Phzb+n3N1FYI5gEe2qYoehQAGXjsH5vlw47T3JMI1i5q
         addD0rhYpwSjLCGhJwNGFzlCGknIgauM8HOh3m3OLUWVg4q18OXcgvvLxYHUVlJXvSn6
         PSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061081; x=1740665881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrD6Cu+ma2ey5dVvO2q4VCmeyk9hPbaJ87jyuD084/E=;
        b=UYP5xNjxHv4DiIkiMyvPJN5CbEmPk94oIg8PmlVi+E8/FSabQ16UE5fv1vZYNju08L
         /ki8vV/B4LiOUy6/s9JhyuGV4sO5XF2qKpJMgFSHIp0l/x6Nr8E6AuWaCYUnly6MEC0+
         9jGLtOiY9ab0a8UVDvN1p84izDoCoO6TTPS3ISOvZe8j38CtgR3Iz4VRf1HFi0dO26YQ
         67uztvYtgwZlKvlMjpAFDarDWXGdPSoW5zB0ao44cmgI7RO0+w5kzIRfkVzDyvqtAz4t
         5ZBjrCXuTY/6maRFWCKWOzyblMaxrm9+baU+CsY4hkqfbFWfYDYVtHLpySPPAtpbt5gS
         EzgA==
X-Forwarded-Encrypted: i=1; AJvYcCUAX5ZDsnoQpFmxovwUkSctEAqawEixc89Tah6whY3R0jPWVjG0rtMBZsuLIjCZjXESDhm2OwVFzDBx1Ys=@vger.kernel.org, AJvYcCW0EXlHYHGMa+okUPUNJB7SMK2IkHUI/EuMaNpNqOLFV2s5WYwYk7zNCewK5G86UAW9T52IcAfDZ63iDUW6@vger.kernel.org, AJvYcCXY+AN4GkflOumThMa/I1Rl3aC53dxlpmdzCfjUu5z0fwK2TAeAzHg+69Aby2u9FpqKKld1l0eSvCh/@vger.kernel.org
X-Gm-Message-State: AOJu0YxxokrqSzJc0hztdVj21u+bn5N886pFOEt38iUdElrSlZ7zB0Nm
	5KS8Wo2MPAsMsIiVRgjT08j+XdOhwa37Qu8oHkm1n3uY7kWKzc1q
X-Gm-Gg: ASbGncsUI+sHudKEIqSYVvQG0X8eVw2SeVbg9N4C8Q28I1Mc+en77fG52tsJRiKF6ch
	vB60kqlovyg3XvGeDEIAP6NwE+5i7j5PkJA9hbxbNNSmbxyRStQ7zxFHxDnH6JYkR3pOfTHfsp5
	y3XDjN1FvqTnyuNnfn1YPw5Dmtht75jNYD2NJtkivR5QoN2VXmbZSQBivptd1REzfTeZmbZVZmk
	MqpwDmSeiXW/9y75o3Az+eq2bXSD3Vp1Z0SEyklsbabCmMyVDdMRlCks/4sbNpxR55HZumSuE08
	qSu+4oBP0GSeBiUJwD1ZyNT8dRsX
X-Google-Smtp-Source: AGHT+IEI5BjiSueHGowWB7V0AX0jphOzOkC+hVJDCuWo2okxV45XHcKYucaW0FwCHe0/kc3RlhAM1g==
X-Received: by 2002:a05:6402:35c1:b0:5e0:3f83:92ab with SMTP id 4fb4d7f45d1cf-5e0a4bcbb50mr2539326a12.30.1740061081463;
        Thu, 20 Feb 2025 06:18:01 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:18:00 -0800 (PST)
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
Subject: [PATCH 6/6] media: i2c: imx219: implement configurable VC ID
Date: Thu, 20 Feb 2025 16:17:28 +0200
Message-ID: <20250220141739.228714-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
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
 drivers/media/i2c/imx219.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4c4ebe54f191b..5790106b35936 100644
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
@@ -749,6 +760,11 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
+	/* Configure Virtual Channel ID */
+	ret = imx219_configure_vc(imx219);
+	if (ret)
+		return ret;
+
 	/* Apply format and crop settings. */
 	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
@@ -994,6 +1010,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
+	struct imx219 *imx219 = to_imx219(sd);
 	struct v4l2_subdev_state *state;
 	u32 code;
 
@@ -1006,7 +1023,7 @@ static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->entry[0].pixelcode = code;
 	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.vc = imx219->vc_id;
 	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
 				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
@@ -1149,6 +1166,13 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
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


