Return-Path: <linux-media+bounces-9263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22758A452C
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 22:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 675ADB20F03
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 20:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA71136673;
	Sun, 14 Apr 2024 20:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="XB5geg5z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta96.mxroute.com (mail-108-mta96.mxroute.com [136.175.108.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284B136983
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713127011; cv=none; b=JR/0ioVI6wipFuQWMlxS7+85NGmNsQD+blBVwu4K4PZihUfSEkjb+f145yihyq1+ldOv8yjLHupBMyvOKKnYoZ4Iaf02fH0Vv0PGBS40Zhtjbo6ND9U0HStda2ptyIq0igU9Rma/HuWh0Qz/u3VTOxeFXIJe94+getr3/fV04xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713127011; c=relaxed/simple;
	bh=3GOmMIRHsNVhxdy69UdU/N5ldgNF0c1SP/SadcWTgmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP0m0G/trZ1QasBQg/LLPfSNEq3LJEHHN5zKa7eeV2ibrKj+AMYyIlS7Z4RNuyUlTZpMlTPkJNKrsF2HaPNTZzQklQlwMJkxoeeOjX0APD5+GmmiJeUCGPvBbW+qbbsnTrRKEj3XTC/adumQT0+CLNlp7qPspy/MR+Ag78cdXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=XB5geg5z; arc=none smtp.client-ip=136.175.108.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta96.mxroute.com (ZoneMTA) with ESMTPSA id 18ede52baa90003bea.012
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Apr 2024 20:35:47 +0000
X-Zone-Loop: 56c640fe127e701347cf812d81d6b66fd96cafe22365
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBpjW4fXJ0RL8rfhZEBmzy5bT//pxdiec10L9b4NGpg=; b=XB5geg5z05tVdyHfw7mvFFgMwn
	rZTNsXjXxoQd5uUDlP37kvm65SobGzr26LUeKQjEyh5RJ03nNvcNaVfrlYXb6tAgbsmOWxophVfBQ
	P/o+JvZjS5t6XuSuanZ5AypUg+3aGWrU/mkzGEcRZz2UopdNDAtckAC47Td4dUduKr5vBOtKdoXS0
	Z+rybjIcdhMZhzoBNVTDFC+n6bjG09K/Lv/xc0Ifg6Iw2TEENx3usd9+iaML5LNmgcnchTEOaHqtx
	TeLjdwLNWPifNjFHL3CbtwCkoN2p/Fm/eehuf4dMo+KE+Y64igfTSailM2OmDdT8tKA66sggaUhBB
	UJDZavPA==;
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
	Conor Dooley <conor.dooley@microchip.com>,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v4 17/25] dt-bindings: media: imx258: Rename to include vendor prefix
Date: Sun, 14 Apr 2024 14:34:55 -0600
Message-ID: <20240414203503.18402-18-git@luigi311.com>
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

imx258.yaml doesn't include the vendor prefix of sony, so
rename to add it.
Update the id entry and MAINTAINERS to match.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 .../bindings/media/i2c/{imx258.yaml => sony,imx258.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx258.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index 80d24220baa0..bee61a443b23 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ceb49f1b630..a8c3a531ad39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20489,7 +20489,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
 F:	drivers/media/i2c/imx258.c
 
 SONY IMX274 SENSOR DRIVER
-- 
2.44.0


