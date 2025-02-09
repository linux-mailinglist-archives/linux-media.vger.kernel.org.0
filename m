Return-Path: <linux-media+bounces-25853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8BA2DFC2
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 19:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98EF87A2890
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 18:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137BC1E1A2B;
	Sun,  9 Feb 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="H3AvhGqA"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53821E0E13;
	Sun,  9 Feb 2025 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739124453; cv=none; b=kJ+dxyOGD0Jy/cU0ysL1ExrubnCcw4KLkUKKUTEj4Ri7tNfbw5/kDEeVN3Xny/ZsvuAuqd6n/ivpCOv81s9242q8zB63kbBPmoxT65vG7Nm04tuwxGDEcP4Hpj7Wn/OXx2GdcVt0m/b0ufYpGxoZ25QqAlALUj9zMHNtdZ/rIyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739124453; c=relaxed/simple;
	bh=zhncfnji+Tm+bC5dixQqONPSqSD3uCa23Ip2Qk3J9Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXCTwoaAxldwvblCA7qWtsM79HdynSPa9/F3tudCFWEyAc0NQyPfXPeLUTGlhlE1RN8pA/kLGr3zhAD3phPDgVo5X+VqmX5XIrGnRcDbECM+Jv3a+pKxDuhA5xjSMLeo7rRCDb7nn2/wRmDP1xs52kqwNg76VM2yJpK3xVzw7Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=H3AvhGqA; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id E1658166658;
	Sun,  9 Feb 2025 19:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1739124448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAJ0ZCR2tcOgwq9g8/GvzS1LJenfL9N1eV8L//kvUWs=;
	b=H3AvhGqA/ncngbIBGFv2XYjvVER0cX7gGHHw1bPfMZVg0yLTEfW223OTHpnqCzQGudB01p
	aYct8sOc8iIMJhumtSvTrCvNGbFpGtgUA7AGds5cIw2sIOsnsdzFxou61wnL4WFMOv3ceh
	zNNqNxohrQ8c9VtDWvVsTb172Gi6QTI=
From: David Heidelberg <david@ixit.cz>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: media: i2c: align IMX219 filename format with others
Date: Sun,  9 Feb 2025 19:07:08 +0100
Message-ID: <20250209180718.126462-1-david@ixit.cz>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Append missing vendor and align with other sony definitions.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/media/i2c/{imx219.yaml => sony,imx219.yaml}        | 2 +-
 MAINTAINERS                                                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (97%)

diff --git ./Documentation/devicetree/bindings/media/i2c/imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 07d088cf66e0b..8b23e5fc6a24f 100644
--- ./Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
+$id: http://devicetree.org/schemas/media/i2c/sony,imx219.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sony 1/4.0-Inch 8Mpixel CMOS Digital Image Sensor
diff --git ./MAINTAINERS ./MAINTAINERS
index df1ecd2c7c3d3..2a63f5f640b9a 100644
--- ./MAINTAINERS
+++ ./MAINTAINERS
@@ -21992,7 +21992,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
-- 
2.47.2


