Return-Path: <linux-media+bounces-9278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743738A4558
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 22:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B141C20E77
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 20:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63F11386C9;
	Sun, 14 Apr 2024 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="E2ReMS2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta249.mxroute.com (mail-108-mta249.mxroute.com [136.175.108.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE921386A0
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 20:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713127308; cv=none; b=dqC36zvIBYGmGgMOke0WDZhAwVlUU38dW+7INwlVLSLfF3Rtwb+ixCrh0TNC5X6sVec6MSne9ytBXj8k82G9wPEVbnK4LYxWZqFzwdukKOtDxnFDt4wE0Z902m+MNpnFmdARbNDBxEMhw6QwPvNFhprjSe+bsypXhq3XpSn3Cik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713127308; c=relaxed/simple;
	bh=oCSJBQE3aiwqbmfu1EJ9a36gJDCKL6HMUjBrjCIJ3ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cecxA4y9ibxQCLTdXBGHFVdUYqO3GOb2CtMUx3HIwd9tnKuGCNGkzn4WxzJfvKmDyLRk7yYwkPyZLgEJMhHYrLI3QM6JFHkDeq94Uj+JR7FwFWBbrDLQiMQ/J9nJtyVwUfokWvG7zP26ZuKnXM2tK0pzqYMQbZEX+7ADkBoTbUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=E2ReMS2Q; arc=none smtp.client-ip=136.175.108.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta249.mxroute.com (ZoneMTA) with ESMTPSA id 18ede5298af0003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Apr 2024 20:35:38 +0000
X-Zone-Loop: 5d204cc38e1abe4ce937e358ed8cca12a2450d32d331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eDZZF6N9fGs2w7erh1JS+Jobb378vgl6f0WBmuxrApM=; b=E2ReMS2QZiq57wS/HGDJv5IqqF
	LjtzALl4EKJP4Yu+wndo4l7jpPv99ukXrFKdXgGlrETEteuB7HJ1TVJ06qeB6MurGy6FUA2gCbW8W
	Pm0MwzkdBgqexuy9X3xvcOXp1DgqJlMqTWoc3DroFWp92Gmh/6N6ejqVjpWUk9NTcoDO3f8zXbz95
	rCLVDPAPDwf2epx3FCp7YcMqKcLmqIanP6HG00ahtGpbidaKZSAOYDguY18QNHu9G10wtUPcy1Dm/
	alTsGTbQMDzztQGsrPmd9A+ERWCShngK7lWpkxPPaep/UN6om9nB1Q+CGnCADrAf06LbY1WtQLRSN
	zmz+FlLQ==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v4 13/25] media: i2c: imx258: Correct max FRM_LENGTH_LINES value
Date: Sun, 14 Apr 2024 14:34:51 -0600
Message-ID: <20240414203503.18402-14-git@luigi311.com>
In-Reply-To: <20240414203503.18402-1-git@luigi311.com>
References: <20240414203503.18402-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The data sheet states that the maximum value for registers
0x0340/0x0341 FRM_LENGTH_LINES is 65525(decimal), not the
0xFFFF defined in this driver. Correct this limit.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 2429eb7b55c6..c1a2c2406aaa 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -28,7 +28,7 @@
 #define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
-#define IMX258_VTS_MAX			0xffff
+#define IMX258_VTS_MAX			65525
 
 #define IMX258_REG_VTS			0x0340
 
-- 
2.44.0


