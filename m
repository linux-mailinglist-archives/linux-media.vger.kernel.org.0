Return-Path: <linux-media+bounces-34221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04933AD0068
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E61F18916FD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77D528852B;
	Fri,  6 Jun 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LyobtJeS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B42882DF;
	Fri,  6 Jun 2025 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205781; cv=none; b=HARJtwyhYyEwvqr+VJDGf2WEpObqoNryIBD/k+vrpp3YIo0uSrQy0RslWSq/oRCVXAaADnttIBb78QC0irvKXK4DmY8LKJxrpOVHJIYboxGHr1OagwMlBRRMotS7f4R4U1Q1Kf0BU2pIqg0n2cJhT4pvGw9oB/KfK2QptGsYyps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205781; c=relaxed/simple;
	bh=V+Ek8KvYXVxMnGDCEA+ZZupIN9VfOzRn2A+zOM1rIFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEszg5AlObZLJjADxDWAg0DiKw0+I1UdEYlM9pMZHxwu1HmJEuRXqqts3IcBzhsy2syQVgany+TnJJmLkcU9TSX5JHCRhqWHfbsysxu3tH4dVL+G47CEJZO3GDzemFxHcaUIxzi51MuTW9zDXg4hqRST4TXBwHxBFXsLvGKhcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LyobtJeS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 910C31648;
	Fri,  6 Jun 2025 12:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205770;
	bh=V+Ek8KvYXVxMnGDCEA+ZZupIN9VfOzRn2A+zOM1rIFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LyobtJeSR70kPu/NJewF6WvjT8KSCw1gBtLv2N60eJvVep1KxdIMKo+yJFYWyLxLI
	 a/C3EctwsYf1Tl0hOPeG0s4X7T4UckFvl716UipY5Rjm9MQKVK3ssUBgVnK6l6RNVj
	 jMGOzQZDvQXnGUwkQ50NLofmFC+Q7ausn4aZS0Y8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:24 +0200
Subject: [PATCH v7 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V+Ek8KvYXVxMnGDCEA+ZZupIN9VfOzRn2A+zOM1rIFI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMJy30vmgezVQQsGohmNhEl7scj92nRO6VT+
 83ukN8V4LqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCQAKCRByNAaPFqFW
 PLwBD/4jPLV38ukgCPlmkOKp/S5DffYm09zKURW5qlvF2508WzIcSyvSUqDlH0oc1+OzTnU6uaA
 tvkt8OjmyqHCJQGsWQ/K2OSTvs/Q++BngwUkyduUk180Xc3qlpZlI9Qt9QHpsI5imCxa0vFZWzB
 7pcP9r2+k/2Npa37fxuS23zrwG9UGcwcHlZAummjU2z4eLQMHfSNgnvUJdwNcOSJMxtjCKxMAtS
 p1XUvMATHwzi2DZss2yj/PBjwQv07zIXi+oJAuaaC1vVd9lKlAT55DbxewopHQnTXsJLj52iHqd
 tVYHeuuzAuk0ACtEqEkXhJnvI77s8KbWQa0FHEvNfR2UK4TSDrIJqbE74COoyJKSJLQkS/1+x2B
 3Oo3AV6uIYMg22nFy5opWcjeDROQJkrSVJNWO4TOAFZ83lsmySSUtxFyY8JH21aLgkYQxMVaZUd
 26p6NYdGlMI0Kl9IbwefIuD9UVY62zmVmw5KoOvI8DnGcxGpLQyedyxSyLyAindzmt89jq6ilZ6
 8SOpvj/908p9v3uJem0eNt0Ow/ZrhW4PvVAtyw4QBZiAKNjPmPmjc9epAUCLR51ZGdrlIgYrcw9
 UEC7p5Q7ks5Pxm7sRpScEDFzqYqN+Nv5tk3mUzog08SKZQpGU/RFDCYAwPFMEd4ourQvHMDCMsW
 EIlxkCnCrIBAM4Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

During the probe() routine, the PiSP BE driver needs to power up the
interface in order to identify and initialize the hardware.

The driver resumes the interface by calling the
pispbe_runtime_resume() function directly, without going
through the pm_runtime helpers, but later suspends it by calling
pm_runtime_put_autosuspend().

This causes a PM usage count imbalance at probe time, notified by the
runtime_pm framework with the below message in the system log:

 pispbe 1000880000.pisp_be: Runtime PM usage count underflow!

Fix this by resuming the interface using the pm runtime helpers instead
of calling the resume function directly and use the pm_runtime framework
in the probe() error path. While at it, remove manual suspend of the
interface in the remove() function. The driver cannot be unloaded if in
use, so simply disable runtime pm.

To simplify the implementation, make the driver depend on PM as the
RPI5 platform where the ISP is integrated in uses the PM framework by
default.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

--

Cc: stable@vger.kernel.org
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 46765a2e4c4d..a9e51fd94aad 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
+++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
 	depends on V4L_PLATFORM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on PM
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index c25f7d9b404c..e49e4cc322db 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1718,7 +1718,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
@@ -1740,7 +1740,7 @@ static int pispbe_probe(struct platform_device *pdev)
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
 pm_runtime_suspend_err:
-	pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_put(pispbe->dev);
 pm_runtime_disable_err:
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
@@ -1754,7 +1754,6 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
 }

-- 
2.49.0


