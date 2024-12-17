Return-Path: <linux-media+bounces-23523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6DE9F40F2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 03:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB12168A83
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 02:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6F3145B16;
	Tue, 17 Dec 2024 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="wR95ql9q"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5A413D891;
	Tue, 17 Dec 2024 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734403366; cv=none; b=Om1oLI3bva8PZUmaHZHU31sjhOmSFQB7dkMp3MCsphlSXUXv+W2AZbkdMwHPt9QhuXT1jRLskqH6uJwqbzjzVcQC3efyW66nMWXwA0lLGdSPJq+xTA8TamDbuoy3qTzhy8mrIX5wD008XRkiVIZQiIGamoy4oMCL1iBIJpXyJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734403366; c=relaxed/simple;
	bh=A102L0fk4A8NCVFDrVauUTQZqLxYnrqSEqC65emxM0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkaSAQRAWnQ4BqhfBrIkyTucOD6VuMWB0X0k4Vf2tNil6Mxuf1/26T0ZiC+aAJEQqqOQ3uEjJZ0YD3FJp3Ufx8fopuwP1nu97XBhytBZL4bYlbca3Rt9IwYyMF3XsuxOtba1c1vUKWNh+q49KgCixh0RF8SX8S80Tjn2fPowCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=wR95ql9q; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0CFA7160E15;
	Tue, 17 Dec 2024 03:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1734403360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KV2xbQSHKJvj/DTKYIg0pZucUjVVxC63u16azmPWVg=;
	b=wR95ql9qIuXR/kO/Sx2tUoawOYHaahfOaPX575MFHun0NvBiCFGmqMQH75AbY0kSFSdHvC
	CEmxgwFH8TDmdDbgOjjdzUmYYtpJADqDsp2mQWB0ehn8NaP8izJchk/VNpY8ScRSsv3ZMB
	d7iB030lOxyfNnvmWPFNFFfmVB5fHdg=
From: David Heidelberg <david@ixit.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
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
Subject: [PATCH 2/2] dt-bindings: media: imx219: Describe sensor address using the reg property
Date: Mon, 16 Dec 2024 21:41:51 -0500
Message-ID: <20241217024206.1700170-2-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217024206.1700170-1-david@ixit.cz>
References: <20241217024206.1700170-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the reg property instead of text in the description.
Drop useless description of reg property.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 8b23e5fc6a24..066eeb7af5e3 100644
--- ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
+++ ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -12,7 +12,7 @@ maintainers:
 description: |-
   The Sony imx219 is a 1/4.0-inch CMOS active pixel digital image sensor
   with an active array size of 3280H x 2464V. It is programmable through
-  I2C interface. The I2C address is fixed to 0x10 as per sensor data sheet.
+  I2C interface.
   Image data is sent through MIPI CSI-2, which is configured as either 2 or
   4 data lanes.
 
@@ -21,8 +21,7 @@ properties:
     const: sony,imx219
 
   reg:
-    description: I2C device address
-    maxItems: 1
+    const: 0x10
 
   clocks:
     maxItems: 1
-- 
2.45.2


