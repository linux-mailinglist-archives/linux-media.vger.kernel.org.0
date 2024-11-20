Return-Path: <linux-media+bounces-21692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C29D427D
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 20:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEC36B29691
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75C51C7B8F;
	Wed, 20 Nov 2024 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LQlhjbbI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9248C1B0105
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130256; cv=none; b=lVOO39jegLYa1XKC3Gx3CrO6SPhgHO1gJ8TPH5of94JniZh4Va3cV2Q9t7MN+Sgo8yVqV6diJAAVgJY8+fYMw6RwMHwn1WemAVT2XMDYsY665Pnig3EoXtMoxPn1Ja8wDmv5zlYo+S2qpLYZ44rRSquY+lGcgVIRUtJFvi2WBNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130256; c=relaxed/simple;
	bh=pSrWTgrJyoEYtFZT+idvxCJkveJQEy5pITbzjTk4dy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg1nf6w6oh67bk9MPLNA2iAotZMTEGOa1QdWXXJ8CluMKqIJDed3/WOl2z63ldP+zFdB1HQNVOoIvr7VZkIwUSCHbxvzaJywAN4buFuF3O1F0OjCAfTMnYnOEM7LfhMx4NU2Cgd5BJ6G6hqlOl1hfc7oci2m+aaC77ZoXitj6Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LQlhjbbI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso7524055e9.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130250; x=1732735050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=LQlhjbbIRRv4uBPVN3h5HbQl7MQzQXVILVwvV47ZEBDZSV1b57g0ReSluDgZaN9+RP
         bNhxWSjpkSr7q7EDmR+267jaYaVYX57kSGwLOxZE0rctZo2XYygPa+eDjmsPRmTW0f7l
         uUUY1ouzQhERvgKLrHznoRFJqqRaRpYxLFzpePS5i5afyDgyYuazDmvknoaWrynqP1Fw
         iGYaieEBT8alRf0IUz+7pfixbM83dEgZZhtSqG3zXHH75NIgWg0ZFV5RZbAJgFIs+AU/
         nfJ+28krXU/zflUmpZR5h5y2ev5hHHAONxB9GUKiXnuO12Sf4WeloBCmCWnA/MEPupWW
         wRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130250; x=1732735050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=I+SCkIW0Cp8fnWAP5qp6JFK1yAotiD6zeB76dVQ0K0jTgMkwKPTSy6DXaAq1Qp11W5
         Eeoo42c9e1s71oWHHYT+QluodqBERDc0DXEh3NSAifMjtjhJAn6htKyyM0DFlbnyjqJs
         OScDC/P5dqVC5Eh4F9g9eybFA9c7ejCFdVdGDu5f/yuLN60vdxE3Qn9IQOSFr1REYFD/
         v00VNTPsyBD43Q5ye/po402TwQUDlp5kej1tMf8pjjI9klguGwJ93BdrLJeQyVBEjMuX
         QvaNsGGLdwiz64xJXjbKkhtzTHPYezxvdzR64rRyH3qopUzILhfKt7QdVZb0puu0x8VW
         V1Zw==
X-Gm-Message-State: AOJu0Yz7L8kkZLXSeFNkmDV/OSGh4zmw7hUXEnVANkibwTQTeKEBiWSL
	MOY1U0FXfopnsVxMT7gwvY8TuqGGLOOn58xgKFmiF/ZNKNlDTW2+bvq8kig5jgs=
X-Google-Smtp-Source: AGHT+IGRjU3aR6hDFtQjH3HQ8wJcv1fdKmnNHnvgyBmRdYlp1FR7+auWuZyFrR8i92B4uErsUqc05A==
X-Received: by 2002:a5d:584f:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-38259ccea2fmr432108f8f.10.1732130249896;
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:03 +0000
Subject: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according
 to module
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The imx327 only supports up to 29.4dB of analogue gain, vs
the imx290 going up to 30dB. Both are in 0.3dB steps.

As we now have model specific config, fix this mismatch,
and delete the comment referencing it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ee698c99001d..da654deb444a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -176,6 +176,7 @@ struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
 	const struct cci_reg_sequence *init_regs;
 	size_t init_regs_num;
+	unsigned int max_analog_gain;
 	const char *name;
 };
 
@@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	 * up to 72.0dB (240) add further digital gain. Limit the range to
 	 * analog gain only, support for digital gain can be added separately
 	 * if needed.
-	 *
-	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
-	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
-	 * gain. When support for those sensors gets added to the driver, the
-	 * gain control should be adjusted accordingly.
 	 */
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
+			  V4L2_CID_ANALOGUE_GAIN, 0,
+			  imx290->model->max_analog_gain, 1, 0);
 
 	/*
 	 * Correct range will be determined through imx290_ctrl_update setting
@@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX290LLR] = {
 		.colour_variant = IMX290_VARIANT_MONO,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX327LQR] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_327,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
+		.max_analog_gain = 98,
 		.name = "imx327",
 	},
 };

-- 
2.34.1


