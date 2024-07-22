Return-Path: <linux-media+bounces-15268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC159391C8
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC6DE1C20E2E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865DF16E890;
	Mon, 22 Jul 2024 15:28:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16416DEDC
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721662119; cv=none; b=HRU6HhkvCKhs4Qnkk49+PZVBc5vEGFMuvAMW/DOQjNpFpz5I5OqkIiF2uoDVF//lXjbL/NCwAHC+5fSjzOGefLr/SWPuPTTVkkzr8t/IE7smISkloosN5fA2o5O8pNczHap+UMD8XYD03V14q0TxUlM66tnyN9drveZ7JK4mGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721662119; c=relaxed/simple;
	bh=s4xSezAlNEuN7kmXzjU1dtPvUMKRnoPYZqdJ5NX9UWg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iNKKP8cT37QScaAO9uTqQ3GZ+8ScwhHIN0d0PBEMxLCCD8E2tPdgXeo62FskU1HO7UuLDH6A758ThLCNrCQ3/JYpdzEBrmgEDW20xEpoXQsurkzYyh7KY6ZYRh3VaB9Dp8FwRrAFtpFxoeSoABuboPgQJwW6YIRPDofLPiel9u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by xavier.telenet-ops.be with bizsmtp
	id qfUY2C0061wvoRx01fUYz0; Mon, 22 Jul 2024 17:28:35 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVuxR-0031QM-Gg;
	Mon, 22 Jul 2024 17:28:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVuxj-0025eF-Uh;
	Mon, 22 Jul 2024 17:28:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	David Plowman <david.plowman@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: raspberrypi: VIDEO_RASPBERRYPI_PISP_BE should depend on ARCH_BCM2835
Date: Mon, 22 Jul 2024 17:28:28 +0200
Message-Id: <8e1c6c3a32919603072bb7278c66b4d469f7e762.1721661958.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Raspberry Pi PiSP Backend (BE) ISP is only present on the
Broadcom BCM2712-based Raspberry Pi 5.  Hence add a dependency on
ARCH_BCM2835, to prevent asking the user about this driver when
configuring a kernel without Broadcom BCM2835 family support.  The
dependency can be relaxed if/when the encoder appears on other SoC
families.

Fixes: 12187bd5d4f8c128 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 38c0f8305d620d83..46765a2e4c4d1573 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
+++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
 	tristate "Raspberry Pi PiSP Backend (BE) ISP driver"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
+	depends on ARCH_BCM2835 || COMPILE_TEST
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.34.1


