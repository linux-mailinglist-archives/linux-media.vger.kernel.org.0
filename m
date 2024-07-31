Return-Path: <linux-media+bounces-15611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1694274F
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808BE1C22A2B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D3018B495;
	Wed, 31 Jul 2024 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g128npLw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8211A4F2D;
	Wed, 31 Jul 2024 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409388; cv=none; b=Id1/K2FxC67VPalmVt0xlyOUee/3Us3sYztTRMRcK3OZQB98VoOsAAg6HAoXJSfL8oJtArZe1mPDPtXLLYSmugVb8d2lzQQhM1do2J8fAwGMtJgLbOTgL0DKhgpGko4DOEKAAQggHE61CL75ibavLyDM1hjhvghlVlHM+EEy8Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409388; c=relaxed/simple;
	bh=dkOkY+B0/cyoFmPI2OdnhUFer6WrrHex+z/Q5THTpcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+OqnW2hrB9Jff8G09ykiAIvt07Z66S2PJdAguo/eeTgK5UgfeerU46SvqDzuKu3/w2du4+BV7Im1H1W0LphbPmWiaQzAvAoHmkXz+mr7SFjKCU8iifb2EtVeFKRSfiRqR81Kdcrlh79H5QtUgNDYugm2M00JjI/vL5nirStgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g128npLw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27D75144C;
	Wed, 31 Jul 2024 09:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722409338;
	bh=dkOkY+B0/cyoFmPI2OdnhUFer6WrrHex+z/Q5THTpcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g128npLwemLjujaENCfvYbZAzH0yaq505ZO47BvznBeJuY8ByKKgpQjun9DvJAH+X
	 vRsgOijAyIuACJgzSTglgunqAoinEoAOiPwwkYL23vBdztC2kUd0VJmHgcQ/NXNJiO
	 g56i0aDRPF5Vm+DijExQ3ZMg1bAUwbychKQhvy3Q=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Wed, 31 Jul 2024 12:32:42 +0530
Subject: [PATCH v3 2/2] media: imx335: Fix reset-gpio handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx335-gpio-v3-2-443bfa6ce864@ideasonboard.com>
References: <20240731-imx335-gpio-v3-0-443bfa6ce864@ideasonboard.com>
In-Reply-To: <20240731-imx335-gpio-v3-0-443bfa6ce864@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Martina Krasteva <martinax.krasteva@intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722409375; l=2193;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=dkOkY+B0/cyoFmPI2OdnhUFer6WrrHex+z/Q5THTpcg=;
 b=aHtk6nfQ3/4g+Uszq64ruRfgME2MRH39/fIvSRh1R2OI7mMpDTXr1wj+1g1Ij1Ps/Nip+4iH0
 aS/nPto3/NQCEbI6EgL2sS41b8imnpNFN7wOq4hc4zDHN9rWKclibHr
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

Rectify the logical value of reset-gpio so that it is set to
0 (disabled) during power-on and to 1 (enabled) during power-off.

Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
time to make sure it starts off in reset. Also drop the "Set XCLR"
comment which is not-so-informative.

Cc: stable@vger.kernel.org
Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index cd150606a8a9..79b6d60bf6af 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1057,7 +1057,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 	/* Request optional reset pin */
 	imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx335->reset_gpio)) {
 		dev_err(imx335->dev, "failed to get reset gpio %ld\n",
 			PTR_ERR(imx335->reset_gpio));
@@ -1170,8 +1170,7 @@ static int imx335_power_on(struct device *dev)
 
 	usleep_range(500, 550); /* Tlow */
 
-	/* Set XCLR */
-	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
 
 	ret = clk_prepare_enable(imx335->inclk);
 	if (ret) {
@@ -1184,7 +1183,7 @@ static int imx335_power_on(struct device *dev)
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 
 	return ret;
@@ -1201,7 +1200,7 @@ static int imx335_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx335 *imx335 = to_imx335(sd);
 
-	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
 	clk_disable_unprepare(imx335->inclk);
 	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
 

-- 
2.45.0


