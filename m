Return-Path: <linux-media+bounces-15610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0394274B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FF031C215C9
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF1A1A4F30;
	Wed, 31 Jul 2024 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tyo9h4ne"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730521A4F07;
	Wed, 31 Jul 2024 07:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409387; cv=none; b=F/TlmzVjLVcZaGaenNf6QewsLp5K9BRao7pgwqWy7F3OR2EN/FK+lBmGD/kzBOK19+vbyjbEi9RuQG5rHk5DqE2KCXcHmzkYuVI8Y75L7X81C3iET4yEbWBrPiiFjT2bx3PmzJr3hNRXljQYeZkbhoQTMzsdwJqoO1YAZfv/1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409387; c=relaxed/simple;
	bh=cBiZJlXkx8Xmxiz4nT0B6k8ktBei6F1rsFujvTYFtUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGxJmwM6yzH/Bavuij1/GL6b59or1t3t3dlnwT0w73BjEyBd1qoKDnNg15ffF15O6IRkaf2OoVlcHrrIdqin9+ewgAiN2n+MAPYMWZDQpb13008EpLbU7HOiFgwjp5rTrDw1Kecg3dO84wm7Ric9top5UKg7ZupimeGkNhX7BoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tyo9h4ne; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6EE3F85;
	Wed, 31 Jul 2024 09:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722409334;
	bh=cBiZJlXkx8Xmxiz4nT0B6k8ktBei6F1rsFujvTYFtUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tyo9h4neSWXbeQzktPZ0x+tEEfATrVrlSM3ErEzLvZdaFAdkHnfAH+uyzjjkQPxOl
	 yLrxdcNIKjWlELaY86S4i0P6OleV3TfYKNFSGnsCsUopB2G2tADEXdH8ZMl/3SUVPn
	 xdTkDK5bou+RoEJaSdg89vXLT9VBCAbpy3Uy5q8Q=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Wed, 31 Jul 2024 12:32:41 +0530
Subject: [PATCH v3 1/2] dt-bindings: media: imx335: Add reset-gpios to the
 DT example
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-imx335-gpio-v3-1-443bfa6ce864@ideasonboard.com>
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
 Umang Jain <umang.jain@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722409375; l=1423;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=cBiZJlXkx8Xmxiz4nT0B6k8ktBei6F1rsFujvTYFtUU=;
 b=sPqZV88nyfYCPAOxBPZSR18zsVZf7Rdt51WTlArhr3UPStdyjtjvp3x6lr+wQlovbLwb3gqWj
 2Sfr+y9M9L+BtucN6Z/bmaZGOJxnxxzYQx5Q3clvoRPWlman1QZ0eHL
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

It's easy to get the polarity of GPIOs in the device tree wrong, as
shown by a recently fixed bug in the imx335 driver. To lower the chance
of future mistakes, especially in new bindings that would take the
imx335 binding as a starting point, add the reset-gpios property to the
DT example. This showcases the correct polarity of the XCLR signal for
Sony sensors in the most common case of the signal not being inverted on
the board.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 106c36ee966d..77bf3a4ee89d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -75,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -92,6 +94,8 @@ examples:
             ovdd-supply = <&camera_vddo_1v8>;
             dvdd-supply = <&camera_vddd_1v2>;
 
+            reset-gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
+
             port {
                 imx335: endpoint {
                     remote-endpoint = <&cam>;

-- 
2.45.0


