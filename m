Return-Path: <linux-media+bounces-23525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D99F4138
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A499188354A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4F1146A79;
	Tue, 17 Dec 2024 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="Goh5CCtD"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17161B960;
	Tue, 17 Dec 2024 03:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734406119; cv=none; b=dhH+9l0Ya83NDXbfQ4/qAs6OFpYHx5vJWTl3MAt+YhS0rvlfp5vzoXEKIMwTnK5ByWPm+2lWWAOzutJKI/Kj1lMYeAS9O3rT4M7AgCuJ/lTc3bnwzw2L+yDRpVuMIXwNhinl4rSFqwg0ULpTEajE/L5lnUuyY+nPiMEjr83T6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734406119; c=relaxed/simple;
	bh=yBrDAAXumKw6y2JtZX/K7A8At2LpR6oDAyXEsca0iag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C56uENeXFKEvwcqihOi1FUU0lR2xwvJz9VyiuYmVg06NnTFayKxVeWLLqBNsZUiX/rBQsjDbz4DWNbM+9V6WKqmwcq9s3hUIMUcUklS5ddaK32aOve+pPG2I0WPal4LIqlsl+1qo+GfEW7GPPoN6Y8qHDcY/Tm57sfzmhh6paMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=Goh5CCtD; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 65AC5165D79;
	Tue, 17 Dec 2024 04:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734406113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=89/Ied276i9FOsoHd8vBC5qsTunh5CJ0SvVAdLuPAlg=;
	b=Goh5CCtDS0tPNf+WJafGDsjV46WvVKe3mlRhlW6LAED2fz52JcKVwm0FYXThOcm/Tn/aED
	SLg6MGyhHs+ldP9qcn3PRVdJDDUvcdQPprh/FBA5qy8sJe6mbuDkoQiMQAiyxSACOJM1pv
	+sJk2QVvBaFGOZo6RfgKXP6SGRUmjkE=
From: David Heidelberg <david@ixit.cz>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: imx283: Describe sensor address using the reg property
Date: Mon, 16 Dec 2024 22:28:17 -0500
Message-ID: <20241217032821.1712916-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the reg property instead of text in the description.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
index e4f49f1435a5..f4ee991c89a3 100644
--- ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
@@ -13,16 +13,15 @@ maintainers:
 
 description:
   IMX283 sensor is a Sony CMOS active pixel digital image sensor with an active
-  array size of 5472H x 3648V. It is programmable through I2C interface. The
-  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
-  sent through MIPI CSI-2.
+  array size of 5472H x 3648V. It is programmable through I2C interface.
+  Image data is sent through MIPI CSI-2.
 
 properties:
   compatible:
     const: sony,imx283
 
   reg:
-    maxItems: 1
+    const: 0x1a
 
   clocks:
     description: Clock frequency from 6 to 24 MHz.
-- 
2.45.2


