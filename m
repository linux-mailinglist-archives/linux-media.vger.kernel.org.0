Return-Path: <linux-media+bounces-8335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A8894837
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A44D28263E
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA113D518;
	Tue,  2 Apr 2024 00:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gFtuLrWZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DDD2E5;
	Tue,  2 Apr 2024 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016293; cv=none; b=LMzPT5tiWK3B1/Yba+KWHEt7ruBuiIi3P9M+fDw+PaLkp2yMEMvA9SEnSZQcxSnee/NSy9dk+LraaOzS+/nwbdwC6KzjCC+ITsRGMJSFZBMsiabuQz6AxJJcevlP9A9smCLutBNXkllEUl5KkHpCWuSjYHIQvqdrhrIY+dtINzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016293; c=relaxed/simple;
	bh=JzNhrPE2ygnGOf2RVYX4zbDCDsoyThWYLPSzQobyf7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGa2UYGovZCWLLWJgOmxcfjheV1o0++0rSYTXjbDGS99KrZKaMqMIYyh83FLmDCi0Kt5hazba0PoRWsuCMQbrpcUKRbqowE+uLf3dtHP/X1JmZNgO9zA8aMSNxIO/2+a8RiUpimSkPz/rMr7zpVUX0qPy/NEojgH3QmjW2Vi0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gFtuLrWZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A02DB53;
	Tue,  2 Apr 2024 02:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016252;
	bh=JzNhrPE2ygnGOf2RVYX4zbDCDsoyThWYLPSzQobyf7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFtuLrWZ5Nw2NfvYjEWFGCRsFwlUna48gyauhqWwgADNfhzZCAiF7XZvEfdI09a6A
	 kii4NHByNTwkI69tkL/ftf1vmPLVR6S8LxNiRPrEbmNxoUnPu3PQA7MB+Gb3Omu7SC
	 cDGL0yne+KwvHtNo43ittiUak6S1yx+M4Tq5eY0U=
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
Subject: [PATCH v9 09/10] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
Date: Tue,  2 Apr 2024 03:04:16 +0300
Message-ID: <20240402000424.4650-10-laurent.pinchart@ideasonboard.com>
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

Add a fixed regulator to model the power supply to the camera connector.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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


