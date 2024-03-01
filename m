Return-Path: <linux-media+bounces-6269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87A86EB3C
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 667F61C23A53
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269135821B;
	Fri,  1 Mar 2024 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wir2USqj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400858AA3;
	Fri,  1 Mar 2024 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328775; cv=none; b=aArnihDek3sUgCYpq+yykMyLyrKeTX1lczDS51YGMhd67xh2CKEQeCLrfDaOXWWXVoCYKMBpwQ7suXXqSu7j0ba+nbHBTZjQNAwZamGMlXSBA3APFM01RsOyJ9gr9/3Kykwya2VkoreFt7m6pT5MDB9U5qHbvUCbahSZC9AgmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328775; c=relaxed/simple;
	bh=03lHjz/qrPW2HXKuE0w/WASI8lFRYXU+/RcLlTr3EG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cnj/hpKwIcxsxgBxWncW40kE+yc3pl2V+K/RGXwwQhzgBJX4n6Dc2d6yDLKb8VwFTMdBSp9/p0nrvqUUe9/CrkG61TJInjTMEBo4JiWmmOlUlIMNTB+GN4xj8fjHr/zZUMRCP7OF2OpIheiaIvm4H/c7vuhkqOuUHmySnFdMsy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wir2USqj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46EAFD04;
	Fri,  1 Mar 2024 22:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328752;
	bh=03lHjz/qrPW2HXKuE0w/WASI8lFRYXU+/RcLlTr3EG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wir2USqje6apPLEOh+b4EJAVcYYAZXDmaYZkngzu1b1vvLRi0CsaQEZH1ltZQomtS
	 sLg3QkFJS0wdxZruKkKz27AbdZyRGvT66tNlGUt0r1CRcAiTbvAMYCckLw1WAAlt1O
	 nqzarjR/QS2pNZQePj3QaTxkW2Ka0rM5ZqMd5KHQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v6 12/15] ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
Date: Fri,  1 Mar 2024 23:32:27 +0200
Message-ID: <20240301213231.10340-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <uwe@kleine-koenig.org>

BCM2711-based Raspberry Pi boards (4B, CM4 and 400) multiplex the I2C0
controller over two sets of pins, GPIO0+1 and GPIO44+45. The former is
exposed on the 40-pin header, while the latter is used for the CSI and
DSI connectors.

Add a pinctrl-based I2C bus multiplexer to bcm2711-rpi.dtsi to model
this multiplexing. The two child buses are named i2c0_0 and i2c0_1.

Note that if you modified the dts before to add devices to the i2c bus
appearing on pins gpio0 + gpio1 (either directly in the dts or using an
overlay), you have to put these into the i2c0_0 node introduced here
now.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Split addition of the RTC to a separate patch
- Move the mux to bcm2711-rpi.dtsi
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 31 +++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 86188eabeb24..826ed6efa9ff 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -17,6 +17,32 @@ aliases {
 		pcie0 = &pcie0;
 		blconfig = &blconfig;
 	};
+
+	i2c0mux: i2c0mux {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c-parent = <&i2c0>;
+
+		pinctrl-names = "i2c0", "i2c0-vc";
+		pinctrl-0 = <&i2c0_gpio0>;
+		pinctrl-1 = <&i2c0_gpio44>;
+
+		status = "disabled";
+
+		i2c0_0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c0_1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &firmware {
@@ -49,6 +75,11 @@ &hvs {
 	clocks = <&firmware_clocks 4>;
 };
 
+&i2c0 {
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
 &rmem {
 	/*
 	 * RPi4's co-processor will copy the board's bootloader configuration
-- 
Regards,

Laurent Pinchart


