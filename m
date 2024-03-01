Return-Path: <linux-media+bounces-6271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA286EB40
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E701C23E17
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263F65821A;
	Fri,  1 Mar 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NXxkbZpn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B3959B4E;
	Fri,  1 Mar 2024 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328778; cv=none; b=Cwe8CcztmDNmUtPrXmuHTiTH2YoNeQ3XHelI4MPu9Da1obuQEqsinv+AMjzcLlz358oJfNefikggEj44VxnuEmW6zmvfSaGz/aJYH/uCiiYKgzzRwthvegJ/e77DIyQxO2lRl7SKPSuvg5FakFfCO+8XFlt51E5f9C6KX+o7u4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328778; c=relaxed/simple;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvOjrKHNi6nSH8uYmfd9FQmDDarHMD6Rw+9abYKVQ7hZnE0ZoGRmhKDZobdzwWeZULgzxnqi5Cq7K4mIzVJxGbEIUOxjiN6oswJdEBYyz5Isro8RTdtEwastuoNR8bHvz7niDNu/2bOZF487EgendR7LaEfCOUfscw9Q2iIH2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NXxkbZpn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B4E631B4;
	Fri,  1 Mar 2024 22:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328755;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NXxkbZpnOHFSUq3awWkVy6ljzeCkt6CqLtb2ZWXvRvvGmOIi1cGiAwhjT1EtO6v1n
	 o3RJv+FJteILLxLJrFuRkpiG/c/BXs0bt+ITjFIxXEvndIhIzSu2iv0s3Zwa+LJsPb
	 AVKQwMoKEFJbs8XPtjII7mAhbjE58f1KFEg4unrs=
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
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v6 14/15] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
Date: Fri,  1 Mar 2024 23:32:29 +0200
Message-ID: <20240301213231.10340-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
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


