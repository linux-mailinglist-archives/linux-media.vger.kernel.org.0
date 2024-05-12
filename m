Return-Path: <linux-media+bounces-11388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A568C38FD
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 00:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80FB71C20BDF
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2024 22:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631B755C08;
	Sun, 12 May 2024 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a5kgPWa/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63854277
	for <linux-media@vger.kernel.org>; Sun, 12 May 2024 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715552476; cv=none; b=BMMarhqZFXEZk7qd5o52I58jpLTaL6+Nsjf19/E1W47BjbSy57YL4PDTaWVy68fvJcEf68HBTW7PoAWQg9topa4SM4H+9lAQGMXSjrSIXN23ZAdp9WoJ1RIvCLLNMCXDTdzJEaU4jWBSarpVl2+P19nmAy4FKZ91Fn2IjhdQs1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715552476; c=relaxed/simple;
	bh=Lp5asCmaFPs2ZaZU1UBqonkIaCBgUdx7P46TcegKjrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyW8k18aBPoami9+QtJ9DbD6uKYUOn3EBS1YFzmzh+/tQb1YwsBLs5kQqg+EVSLYejqVh3X8Ddp3cHSsvSuYZMYdPx8UremMyB6GcS592YQxrV3sWIzQP5c9VW0dXZQlssWxxegp4KdzYUB8CpzcSq7vzgxp5ErLKpAjxA3frT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a5kgPWa/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC6E0397;
	Mon, 13 May 2024 00:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715552466;
	bh=Lp5asCmaFPs2ZaZU1UBqonkIaCBgUdx7P46TcegKjrw=;
	h=From:To:Cc:Subject:Date:From;
	b=a5kgPWa/mWp8G6m78xB1vY+V2uXOCLV2V8sPLavNxnPEdG3rMJ9yNz/0ycLlrrNTd
	 eUfxay+bcriGi2cEaT4COQfWeHaUL0PiSxoIiV+HRggKsvNk+rBkwoK2CG7fo2gnck
	 YdMrKspeEYcLbH7GjfsTSWcbVmXMOkXHFChdY/rE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: [PATCH] media: bcm2835-unicam: Depend on COMMON_CLK
Date: Mon, 13 May 2024 01:21:04 +0300
Message-ID: <20240512222104.24646-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcm2835-unicam driver calls the clk_set_min_rate() function, which
is declared but not implemented on platforms that don't provide
COMMON_CLK. This causes linkage failures with some configurations.

Fix it by depending on COMMON_CLK. This only slightly restricts
compilation testing, but not usage of the driver as all platforms on
which the hardware can be found provide COMMON_CLK.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405112243.2MLRT7li-lkp@intel.com/
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/broadcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index cc2c9afcc948..32b76ebfcd9a 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_BCM2835_UNICAM
 	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
 	depends on ARCH_BCM2835 || COMPILE_TEST
-	depends on PM
+	depends on COMMON_CLK && PM
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE

base-commit: eba63df7eb1f95df6bfb67722a35372b6994928d
-- 
Regards,

Laurent Pinchart


