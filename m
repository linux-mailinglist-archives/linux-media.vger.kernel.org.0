Return-Path: <linux-media+bounces-6270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C753386EB3E
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6754C28CC40
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02F858218;
	Fri,  1 Mar 2024 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PwLwsskv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D358AA7;
	Fri,  1 Mar 2024 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328776; cv=none; b=LynsN4X3s/cYE+Mt4dhmPZ63o/zKF2mLn5CGXla6j+gdiBYeSKhU+g1bzkJdo3UeLGRvtTYzFEevO9QYHxPQghARaiB8E8GDqoppkWcNlR4+qrUGUlbZffHS1QBDaCDfOdI7bu0Xdk01VAK4BLKJD+i3uDPB4VwkikuNgmDvouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328776; c=relaxed/simple;
	bh=j0Glb/LSOOIYN6XTTELM9wJ/Udin7LNOkcqzjtCzT6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqV5ZqC+dhI1GBdhvK6iDlCxVjjZkLYyjFktfdOjsJxKcqy1b+FUhP1ZB76UftVgSdSaMzJvT+1uwZq4n5TVdeHyDyX4v0lpbq//gMDWdaQ82/sYT9Rdp6Iavv1/nOnH4FZdPUi7kXlMnOzpYf0n1fdIfN2mE00GiZGFBVdWwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PwLwsskv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0611222D9;
	Fri,  1 Mar 2024 22:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328754;
	bh=j0Glb/LSOOIYN6XTTELM9wJ/Udin7LNOkcqzjtCzT6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwLwsskvAdoOIeD8fp0kI0nhEipXjVVtWLZrPtXdIpVWthU26Hp1dK4MwQhMKgG9N
	 +3JYrvSwlLink/8lo4etleW8NqBkFCa0si5s23TocODEorJibuSQgLPBcQrDt9rYT5
	 DUvcr+TQz+Aj4k0QsnZmlI+dF5k3uRb0IzDPtcGY=
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
Subject: [PATCH v6 13/15] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
Date: Fri,  1 Mar 2024 23:32:28 +0200
Message-ID: <20240301213231.10340-14-laurent.pinchart@ideasonboard.com>
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

The cm4-io board comes with a PCF85063 on I2C0, connected to the GPIO44
and GPIO45 pins. Add it to the device tree.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v4:

- Use the right part number in the compatible string
- Add the quartz-load-femtofarads property

Changes since v3:

- Separate addition of the RTC to a patch of its own
---
 .../boot/dts/broadcom/bcm2711-rpi-cm4-io.dts    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index d7ba02f586d3..d5ebb535afd2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -101,6 +101,23 @@ &genet {
 	status = "okay";
 };
 
+&i2c0 {
+	status = "okay";
+};
+
+&i2c0_1 {
+	rtc@51 {
+		/* Attention: An alarm resets the machine */
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <7000>;
+	};
+};
+
+&i2c0mux {
+	status = "okay";
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
Regards,

Laurent Pinchart


