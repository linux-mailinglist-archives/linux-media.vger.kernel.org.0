Return-Path: <linux-media+bounces-37344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD4B00A5D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 912A4760C6E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B7B2F0E35;
	Thu, 10 Jul 2025 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dqaQWdrO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8502F0C7D;
	Thu, 10 Jul 2025 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169726; cv=none; b=fSpFKSz+pOg7HxMcLA4zGlWOvAgoMdkI19TCn0Zeu6JaLO/pB4xeHfmpIalA23Y/T5aaH+gzJtFYd0lJx36COqCf10wBrPSoqKZZBu1xzhR/OM4hIz0rD2KaE9c1D3nfV+gf4Kp9kREB01jk0hmE37pBBopoUUUyiFBVZ8fSyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169726; c=relaxed/simple;
	bh=sT1+4gfLNdzhXKnes77ckLLc7RyXE5HtFqegjgcwyiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY3HqclgfHFkAuBvi0A+PrVyimbLG1QgbO2iTADbRF08LQDh0PkmAGwBgLi0Ws4hD+X1k9DdHgONnFIwCMR+cQ845UEd4EZJBAkmKu0qlx3N3a6u1g8LMiIysVICKCWhPOgMNHz+OXtgTqXD8L5bNOPyHPLHDr0Ch3RPKG27UAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dqaQWdrO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5D411B2B;
	Thu, 10 Jul 2025 19:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169691;
	bh=sT1+4gfLNdzhXKnes77ckLLc7RyXE5HtFqegjgcwyiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dqaQWdrOGNP7gneN8FPEmJH/8YNwEmUA3+FD6JcTV+k+cOFwFZxxu9GisII5A3B4x
	 /Ws9aB0MNbGrh31XKKW/NF9sGaSAHb0X1O9g2VZBubR7sx9nRqbgo5iiguc62ivww5
	 5ki4mCrA8ezg3mcZ6QTxpkd8/uqigFQZFRIeGtW8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 01/72] dt-bindings: media: Deprecate clock-frequency property for camera sensors
Date: Thu, 10 Jul 2025 20:46:57 +0300
Message-ID: <20250710174808.5361-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usage of the clock-frequency property for camera sensors is discouraged
in favour of using assigned-clock-rates (and assigned-clock-parents
where needed). Mark the property as deprecated.

Update the examples accordingly. In DT examples where the sensor input
clock appears to come from a programmable clock generator, replace
clock-frequency by the assigned-clocks and assigned-clock-rates
properties. Otherwise, just drop clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
 .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
 .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
 .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
 .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
 .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
 8 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index bc664a016396..217b08c8cbbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -55,6 +55,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the external clock to the sensor in Hz.
+    deprecated: true
 
   reset-gpios:
     description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
@@ -93,7 +94,6 @@ properties:
 required:
   - compatible
   - reg
-  - clock-frequency
   - clocks
 
 additionalProperties: false
@@ -114,8 +114,11 @@ examples:
             reg = <0x10>;
             reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
+
             clocks = <&omap3_isp 0>;
-            clock-frequency = <9600000>;
+            assigned-clocks = <&omap3_isp 0>;
+            assigned-clock-rates = <9600000>;
+
             port {
                 ccs_ep: endpoint {
                     data-lanes = <1 2>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
index 67c1c291327b..0e1d9c390180 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -39,6 +39,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the eclk clock in Hz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -127,7 +127,6 @@ examples:
 
             clocks = <&ov02a10_clk>;
             clock-names = "eclk";
-            clock-frequency = <24000000>;
 
             rotation = <180>;
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
index bc9b27afe3ea..a583714b1ac7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
@@ -21,6 +21,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -83,8 +84,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov5645";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov5645_vdddo_1v8>;
             vdda-supply = <&ov5645_vdda_2v8>;
             vddd-supply = <&ov5645_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
index 2e5187acbbb8..922996da59b2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -29,6 +29,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   vdda-supply:
     description: Analog voltage supply, 2.8 volts
@@ -89,8 +90,11 @@ examples:
         camera@3c {
             compatible = "ovti,ov7251";
             reg = <0x3c>;
+
             clocks = <&clks 1>;
-            clock-frequency = <24000000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <24000000>;
+
             vdddo-supply = <&ov7251_vdddo_1v8>;
             vdda-supply = <&ov7251_vdda_2v8>;
             vddd-supply = <&ov7251_vddd_1v5>;
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index 3f6f72c35485..fa71f24823f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
@@ -37,6 +37,7 @@ properties:
   clock-frequency:
     description:
       Frequency of the xvclk clock in Hertz.
+    deprecated: true
 
   dovdd-supply:
     description:
@@ -87,7 +88,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - dovdd-supply
   - avdd-supply
   - dvdd-supply
@@ -114,7 +114,6 @@ examples:
 
             clocks = <&cam_osc>;
             clock-names = "xvclk";
-            clock-frequency = <19200000>;
 
             avdd-supply = <&mt6358_vcama2_reg>;
             dvdd-supply = <&mt6358_vcamd_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
index c8f2955e0825..ebd95a8d9b2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
@@ -26,6 +26,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: mclk clock frequency
+    deprecated: true
 
   rstn-gpios:
     maxItems: 1
@@ -82,9 +83,12 @@ examples:
         sensor@2d {
             compatible = "samsung,s5k5baf";
             reg = <0x2d>;
+
             clocks = <&camera 0>;
+            assigned-clocks = <&camera 0>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "mclk";
-            clock-frequency = <24000000>;
             rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
             stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
             vdda-supply = <&cam_io_en_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
index 7e83a94124b5..e563e35920c4 100644
--- a/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
@@ -30,6 +30,7 @@ properties:
   clock-frequency:
     default: 24000000
     description: extclk clock frequency
+    deprecated: true
 
   gpios:
     maxItems: 1
@@ -80,8 +81,11 @@ examples:
         sensor@10 {
             compatible = "samsung,s5k6a3";
             reg = <0x10>;
-            clock-frequency = <24000000>;
+
             clocks = <&camera 1>;
+            assigned-clocks = <&camera 1>;
+            assigned-clock-rates = <24000000>;
+
             clock-names = "extclk";
             gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
             afvdd-supply = <&ldo19_reg>;
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 990acf89af8f..484039671cd1 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -51,6 +51,7 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz
+    deprecated: true
 
   vdda-supply:
     description: Analog power supply (2.9V)
@@ -100,7 +101,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - clock-frequency
   - vdda-supply
   - vddd-supply
   - vdddo-supply
@@ -125,7 +125,8 @@ examples:
 
             clocks = <&gcc 90>;
             clock-names = "xclk";
-            clock-frequency = <37125000>;
+            assigned-clocks = <&clks 1>;
+            assigned-clock-rates = <37125000>;
 
             vdddo-supply = <&camera_vdddo_1v8>;
             vdda-supply = <&camera_vdda_2v8>;
-- 
Regards,

Laurent Pinchart


