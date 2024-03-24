Return-Path: <linux-media+bounces-7704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E0887F68
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 23:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECF47B21097
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 22:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2AD433DD;
	Sun, 24 Mar 2024 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e4EVZQx7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE6429437;
	Sun, 24 Mar 2024 22:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318175; cv=none; b=a/LlJxAj4soQIvyUjHZW0Jn8Lv7HPxkr5EODIuMuz7+2AAO5kxXCvXO0VyO/TvXaNkiZLTlLqt+OF8VCrc2ACQt/MSN4rhdJ4JfDcqVE3mIVkEFzXqdaA7z09nDbPT+Fhkiz2wYMiz1mENhYS+yjCtdmn1xORVjNDk3SoHSdj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318175; c=relaxed/simple;
	bh=nfmG66xJVQgl7ZManiXHS7ko/Ld2MVqZXQSBho/7z/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3YCcvzpRJWcydn0LGoGB1kZclsYGZ8C5wpwqGnTtZyltvbQxgsdsjBF0H7yXepFDogMLNf9jfsmqKCCvxHUs9e2pKVvwT3YE9B4cFZAecWlYdt+HK/RunKeBlI1dfKLo4f042B8OPeItNhLyCKjbeS/gRs/dFsPkUusYNgqMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e4EVZQx7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E8A2D63;
	Sun, 24 Mar 2024 23:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711318138;
	bh=nfmG66xJVQgl7ZManiXHS7ko/Ld2MVqZXQSBho/7z/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e4EVZQx7+pnXMJ/eY8gdU+BFRJStz2MdxLZfDoTt6+nLwLuMaRxwnGnPMeyJIn6NF
	 YIKgnCza4UPSrD9wQf8688SL7CIT2QGqjbXKSoPJ9VJQziEZxi4sSLXhklV2OtIMwK
	 x5fjs3pW9ARlTRNTh825RUqnJwANEKrnEPi7i39A=
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
Subject: [PATCH v7 13/15] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
Date: Mon, 25 Mar 2024 00:08:49 +0200
Message-ID: <20240324220854.15010-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
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


