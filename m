Return-Path: <linux-media+bounces-7894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD088D30F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 01:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0348321221
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C70017BD2;
	Wed, 27 Mar 2024 00:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Syx+ZAz5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1C179AE;
	Wed, 27 Mar 2024 00:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497936; cv=none; b=KiFBaUTX1S8cgUw398WX45ySXQDZhloLyxjsOyvg7kZxzWNESdwXINsRDjyCa4bROufOcqJ54EP5uckc23ir1AnbsJ2IOn48V1pJnpR6nVezPe68PVZXUJzSaPDbIgajxfeHWhOfWADatcl2M8+cVAVj4pSqRZ8qK8/TSzBrd3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497936; c=relaxed/simple;
	bh=ybZbbZqQ1ELODTrSxhED6Hxme53qUpP5ozWnwQo8f1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTllRn21RRJHFiltZM/D1OPSULqC3qifHsI0jnDjizvkkk2Q/ODjThwOb5mDpgljePlOa0uvAZBO06tUKDKKPvNRXOa5zTmdGvF3jq8saaMVLSajvsCNOCUFq+VjjUYUdkIsK2OhhPaF9cBkTrXRSt4R9X80FMwDi672rp4hbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Syx+ZAz5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A68A335C;
	Wed, 27 Mar 2024 01:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711497896;
	bh=ybZbbZqQ1ELODTrSxhED6Hxme53qUpP5ozWnwQo8f1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Syx+ZAz5Ue7uvkAvS7CwRIGv+3ms9sngMBw2k38wr7ZPkHQBBaAmxyv0iieNC2DbM
	 cVrBuqF/Bfx47Tkv/SbWQEcePHffoHRAjEtfC2En1CqbqW9mskAa4Dntm2l1ifV6JA
	 LSHp6VlvxtbPsI81j6nrk8kUnTSuOUXZ/b1HMRGw=
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
Subject: [PATCH v8 05/10] ARM: dts: bcm2835-rpi: Move firmware-clocks from bcm2711 to bcm2835
Date: Wed, 27 Mar 2024 02:05:03 +0200
Message-ID: <20240327000510.2541-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>
References: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi firmware handles clocks on all BCM2835-derived SoCs,
not just on the BCM2711. Move the corresponding DT node from
bcm2711-rpi.dtsi to bcm2835-rpi.dtsi.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 5 -----
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

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


