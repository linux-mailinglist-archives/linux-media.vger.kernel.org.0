Return-Path: <linux-media+bounces-7899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8888D319
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 01:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B4FE321300
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04761DFEB;
	Wed, 27 Mar 2024 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Csvg5a9T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D61DFC4;
	Wed, 27 Mar 2024 00:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497944; cv=none; b=I3mhpBRlWfetx0QWnk9MXFjlXTTOpyMc7cFyuJiwNeOA4/pt1nU1riIz466KXpsvng82q8J5waWpL9oFKD7Xt+GpHBznFfFN1dwkPdzW8oxkrwZKUmKTI/mzWeW4TV4G1a3CNNqj2jk/+TXN2cy4daIDO76dx5t3JmUJhKVL6Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497944; c=relaxed/simple;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwTtHWg57Y6dJOCc/YjxJDRE1n/qlmTWJEvIbQ+te61zXFv7A5RVIuJHY7oQEVsKP9cSLypr17P9mMDgPFLEfTE+RFuLnILP8L+JrUXdEewbhvmcLQI8YzeY5myypPgUegco7CcsmTVOGtPl7kd6IypBk6KV8xVARNuSIrJjJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Csvg5a9T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A60542CFB;
	Wed, 27 Mar 2024 01:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711497903;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Csvg5a9TKze1jiz6ZU/esvf9BRrYzvcf9YmCsI41VA2xopBonOABkCemxl8JCU8I5
	 CauQ/08NRkSAAmgsIPb5wcNj67qr0lEZM7T8cX+X8b3M+wvLIy+rUA6rLrwM8zUftd
	 9CmEPhS4c1LgxbLIzf1cqzU+2nkvhxB0M/U2rhrE=
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
Subject: [PATCH v8 09/10] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
Date: Wed, 27 Mar 2024 02:05:07 +0200
Message-ID: <20240327000510.2541-10-laurent.pinchart@ideasonboard.com>
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

Add a fixed regulator to model the power supply to the camera connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index d5f8823230db..cfc8cb5e10ba 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -15,6 +15,13 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
+	cam1_reg: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam1-reg";
+		enable-active-high;
+		gpio = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+	};
+
 	sd_io_1v8_reg: regulator-sd-io-1v8 {
 		compatible = "regulator-gpio";
 		regulator-name = "vdd-sd-io";
-- 
Regards,

Laurent Pinchart


