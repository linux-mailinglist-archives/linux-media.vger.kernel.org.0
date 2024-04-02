Return-Path: <linux-media+bounces-8334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81423894836
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E8B21C5A
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6336C8C7;
	Tue,  2 Apr 2024 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bkWJIjeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AA7F9;
	Tue,  2 Apr 2024 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016291; cv=none; b=qGYLZnyq3fkocI89fR+IA6xRO0tf7lxV47KtjcUvdTwgtGP+AGNnDV+MTdyG2z3XIRVGSfsDq6BLeDhSkzJkEv2gy+x8FzECbagL3nc5Kx7DoApjVoKW4+LDnnVGyjT8MbzvT3F9I1tqTc1UzjAICOqOWa/Pwsh4egWpcohYIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016291; c=relaxed/simple;
	bh=nfmG66xJVQgl7ZManiXHS7ko/Ld2MVqZXQSBho/7z/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLs+j908tGOK8TWP2aPYy4piTD04q6kGKxUcmmIVmeS3/xOa/8pTVMlv+kLD8nSZr9+HPAnB/kLDVYkiJxmVX0qzfN81oCZh+RnnkU6QvHCNfnREKOkGoFXsQas6zfx7CF5FX9sVVzEIn3TCHUDEYuktTsvusV6H7U8Q7qgAB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bkWJIjeQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD2DE2A5;
	Tue,  2 Apr 2024 02:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016251;
	bh=nfmG66xJVQgl7ZManiXHS7ko/Ld2MVqZXQSBho/7z/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bkWJIjeQodGsByACNJOv1czQXE5j0x8WMsKYGXxbt6z4ipf1k1KM7cwVvRoC/5CK8
	 EESLQNTSAZE5o1HQBfs1q6+Ct+ST9W7n4H9st4leXPYywh5qaGgbAW0ZPexzo2gHb1
	 J+FIo2WGCJ7tiMn2dMmLGc3hkR91h8p1el2t6e9k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
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
Subject: [PATCH v9 08/10] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
Date: Tue,  2 Apr 2024 03:04:15 +0300
Message-ID: <20240402000424.4650-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <uwe@kleine-koenig.org>

The cm4-io board comes with a PCF85063 on I2C0, connected to the GPIO44
and GPIO45 pins. Add it to the device tree.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes since v6:

- Drop unneeded status = "okay"

Changes since v4:

- Use the right part number in the compatible string
- Add the quartz-load-femtofarads property

Changes since v3:

- Separate addition of the RTC to a patch of its own
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index d7ba02f586d3..7c6a5bdf48aa 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -101,6 +101,15 @@ &genet {
 	status = "okay";
 };
 
+&i2c0_1 {
+	rtc@51 {
+		/* Attention: An alarm resets the machine */
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <7000>;
+	};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
Regards,

Laurent Pinchart


