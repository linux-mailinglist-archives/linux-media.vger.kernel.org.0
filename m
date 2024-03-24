Return-Path: <linux-media+bounces-7705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91084887F69
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 23:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB6728163B
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 22:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F8943AB7;
	Sun, 24 Mar 2024 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vm4bEw72"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACE433D4;
	Sun, 24 Mar 2024 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318177; cv=none; b=KNNGp8OEVUhU+mPBBQkkLezXQKB4hmXBKRXzwp5NsEBq0e833mAl1/j0Uorq/x1lXCCd3CnehON9P+X0IluugOK2WfWsYIZWmO30tDJHnW8viNbwBs/G08q3A0t4UQK00B5fDEEhnY3Jlh+N6POtJl7CCtVaOBaPTQag96e/4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318177; c=relaxed/simple;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBYR9MoY0uTtFQPzmG7gt5SXkmdUkhAuZmuUi71M8iWiSzH88HcmLgO8AsprRAk6O2/DW/uhaPXIdWhPY9DEOe+fIcYCRFhGaWHmovPrmPMwafjjL/YEfdBxXmkF6Y4/KEjZTA926d+uUnkn9wwLJmstdAbT72VJfw9LAC7iafI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vm4bEw72; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4610989;
	Sun, 24 Mar 2024 23:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711318140;
	bh=bTlomEbFEaMjNB1os7nE/kUPnTy1me7NtAgvAHE/ilc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vm4bEw72P3aFqd7zKwk1RXwDrVfRzX7PocTTuATE0dzwMMlcDSNeL/OZrWe8hXsxI
	 obqxw+QvXlvBmvWFyQ+Z7iEeo5/V3hSbQmDrMeyj4rQOenY6VZKYacPrN8Qccyy0YH
	 hDMERp9D8wjgzJAa4P6l6ppmyTcxi+HhPByNN2QE=
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
Subject: [PATCH v7 14/15] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
Date: Mon, 25 Mar 2024 00:08:50 +0200
Message-ID: <20240324220854.15010-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
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


