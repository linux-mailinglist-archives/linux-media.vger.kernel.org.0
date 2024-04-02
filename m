Return-Path: <linux-media+bounces-8330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861589482E
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00AEDB212DA
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C936FB1;
	Tue,  2 Apr 2024 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GMcor9+u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0114C8F;
	Tue,  2 Apr 2024 00:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016284; cv=none; b=XKKfhZAdglICPgb00fWWm5UmNGhRWON7+iH49XojfBNYJ++mVY/8NmhXJ9X+o01sKsiR0A75q0SJKFtazDf109vQV5I9p4cBpZ8hKZfqGwHgdgLwyh4rxyz83JHJ5lUS7z0bTUFeJ/GSGgvzfD42QUi70pl0iJN/wuHmMIOZrVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016284; c=relaxed/simple;
	bh=DiRu+RizG3fAcoIjxPRMNwhB5FdTYEOFsBReorp/G90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoMTmbrKeExX7Z8sdM6gSabxOzv9iw7tACs3ddp5b8wi8X4urP/xDtlmeGDtkDW9zM57mnvoPJKv2ztDje2ofzMCZwRKp0JMXp8EoTFJj/tZd7oiQj/29x4A2UHKkgp5w72D2iWXXWrJ2rsfLi8LwDMrYM/qwYqzwE9fT8BH988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GMcor9+u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87316CE3;
	Tue,  2 Apr 2024 02:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016245;
	bh=DiRu+RizG3fAcoIjxPRMNwhB5FdTYEOFsBReorp/G90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMcor9+ugNsHzw9IyaFeVCPo/rviXWfSoI4YYBN5ZVs6Vb1dMFuUcolWfSUc9Ohdr
	 qXHTIvZMRq5z544bzlEawOiKp4pqHl583ipPa0in+E4pRSy/6QAYn8eEPPvgavI5LJ
	 XAGQdZLU8aEv2iyQ2r0ZdwQYrKGlbs2VG1BphgWQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v9 05/10] ARM: dts: bcm2835-rpi: Move duplicate firmware-clocks to bcm2835-rpi.dtsi
Date: Tue,  2 Apr 2024 03:04:12 +0300
Message-ID: <20240402000424.4650-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi firmware handles clocks on all BCM2835-derived SoCs. It
is currently defined identically in both bcm2711-rpi.dtsi and
bcm2835-rpi-common.dtsi. Move the definitions to the common
bcm2835-rpi.dtsi file.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes since v8:

- Drop firmware_clocks from bcm2835-rpi-common.dtsi
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        | 5 -----
 arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi | 7 -------
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        | 5 +++++
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index d233a191c139..86188eabeb24 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -20,11 +20,6 @@ aliases {
 };
 
 &firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
 		gpio-controller;
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
index 4e7b4a592da7..8b3c21d9f333 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
@@ -7,13 +7,6 @@
 
 #include <dt-bindings/power/raspberrypi-power.h>
 
-&firmware {
-	firmware_clocks: clocks {
-		compatible = "raspberrypi,firmware-clocks";
-		#clock-cells = <1>;
-	};
-};
-
 &hdmi {
 	clocks = <&firmware_clocks 9>,
 		 <&firmware_clocks 13>;
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 761a9da97bd0..6e6dc109f0c2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -5,6 +5,11 @@ soc {
 		firmware: firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
+
+			firmware_clocks: clocks {
+				compatible = "raspberrypi,firmware-clocks";
+				#clock-cells = <1>;
+			};
 		};
 
 		power: power {
-- 
Regards,

Laurent Pinchart


