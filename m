Return-Path: <linux-media+bounces-17194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A49965769
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD851C20A39
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5511531F1;
	Fri, 30 Aug 2024 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u/91umad"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193521531CA;
	Fri, 30 Aug 2024 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724998336; cv=none; b=Pg5wWvA/v2Dz9/Fs2sIkofXLJrucuSbA3ZyDKnbkDYkcfvsM6ZmpZCrLuici35lC7EciBqLYHpuApxE1LFmZKcXmLT4XS9HfqHEQyEH6YJPe2RwfTVOj0bdYKyIa5hSGunJZS2oKM9/EdhdogRl0l09bvnEujHM9EZ1jdQaCkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724998336; c=relaxed/simple;
	bh=A5lJjAthj7edefbpVSZ1vxzA9GwnHb4ZMwTPz2YGRBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jO4OfyA69uY7fALY3287d84od66yf6IIW4o1bk0rfLqnMN49AR67Res+2v97plGmaXVmIwRacnGNERvmcxQQ4ZXh59qB266wxrQF4+XuoUADK/MHxNCa5u+teg8h9P7fu0IccUzBE4v3K/Lulxgke2EQYGHaKgMIRZMXhxyqgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u/91umad; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.29.25] (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 324FF524;
	Fri, 30 Aug 2024 08:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724998262;
	bh=A5lJjAthj7edefbpVSZ1vxzA9GwnHb4ZMwTPz2YGRBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u/91umadaVk2kcMeThKWsNphlUtZpHhxeMCHXESH97tGfZImcRsu52Rv7d9BWVTar
	 +qRcnajlS1en5BEMRQSAr07uZyAS9lIQAfKgaxEtsvLFHNBoDjWt4SI8Ydw0udnps/
	 FmzqMMQ1IQXDPvVP4xuUAikcEM5oNvFQasrmEztY=
From: Umang Jain <umang.jain@ideasonboard.com>
Date: Fri, 30 Aug 2024 11:41:51 +0530
Subject: [PATCH v4 1/2] dt-bindings: media: imx335: Add reset-gpios to the
 DT example
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-imx335-vflip-v4-1-cb9f20fc7b87@ideasonboard.com>
References: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
In-Reply-To: <20240830-imx335-vflip-v4-0-cb9f20fc7b87@ideasonboard.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724998323; l=1487;
 i=umang.jain@ideasonboard.com; s=20240731; h=from:subject:message-id;
 bh=A5lJjAthj7edefbpVSZ1vxzA9GwnHb4ZMwTPz2YGRBY=;
 b=222YGFQbzKPw/p+ZhX2x9k1K8y+nLZd0q1+lOMFuTcH/52XeXGFUImn45SBUJ3HINrtRdwAFo
 YyaKhvM+HKwCm2q2GsAgqenDszct3DJFtSJFQcB5t4aYlH0mQt2JIXa
X-Developer-Key: i=umang.jain@ideasonboard.com; a=ed25519;
 pk=7pvnIBNsDpFUMiph0Vlhrr01+rAn5fSIn/QtDeLeXL0=

It's easy to get the polarity of GPIOs in the device tree wrong, as
shown by a recently fixed bug in the imx335 driver. To lower the chance
of future mistakes, especially in new bindings that would take the
imx335 binding as a starting point, add the reset-gpios property to the
DT example. This showcases the correct polarity of the XCLR signal for
Sony sensors in the most common case of the signal not being inverted on
the board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


