Return-Path: <linux-media+bounces-50529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E03D178D9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D0BF3056755
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71A7369213;
	Tue, 13 Jan 2026 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b9kj9ujh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED6538170F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295313; cv=none; b=f9N/PEo9XSTlMkNvAwOZWoYneUjZ1Zaiu73z2im1qL6KgD68SmWvGefOdrj8e6kmFABYCqmnvWUQuysyEjb3zF3swcV+8xraO/OsLqetdROtDdRAzrJf8SRPDqRLejCD0PT/0qr8Vwpc8/2/DOqyKpOrs8RCZXGO/6kUCn8SrTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295313; c=relaxed/simple;
	bh=xmJwrHf4q2IDWFmUdj1fcF9TnssMBp/VNjUuGh/3isk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvcLLJC3boLIm1KSFS4vOojIM+T6VrnXtd7VZOaIQ081kGo1ovIUUQ3HCO0sRymbEAksaKUDwZzEiSJxeD8YP0T22w/9lj2ao7ba2s5I+hcIvn8TWnTmEdee3OeNaSQVkWH43vZeWd0BtfVznd2I6q2O/lYDYzbo6rQEvy0y/G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b9kj9ujh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16A3117D8;
	Tue, 13 Jan 2026 10:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295279;
	bh=xmJwrHf4q2IDWFmUdj1fcF9TnssMBp/VNjUuGh/3isk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b9kj9ujho0ykhVDkP0S0pdmncSlBA4a2C6TTQgRC5EoRSYRlTJg0Vr/icyiFQaPaC
	 LsqqreBQ7D+30UZOEeUIcNPzBupT5aMKoMcaiwUofFK4LmpgT779X30w5tjDKN+d2W
	 cc0oPjikesgHeQPMHpi8wg8UtLobl28X1AtQz5FY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:30 +0530
Subject: [PATCH 10/10] platform/raspberrypi: vchiq: Load bcm2835_isp driver
 from vchiq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-10-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=eCv09Mqfnqp7/pBKKBSALZWW1w+B4jVcEjaPNOpfR1M=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtM8Io5KQ86hzFpdf9di4bsIKka9CQE06FDc
 XmlsCsnybKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLTAAKCRBD3pH5JJpx
 RbHwEACgTujZNs9ZxjKfYVFhttjbCstHBwY0w6WsbCj6y2OX4AxugO0OWX9aZeI/w8njRxQLaid
 G5TPoAROIIO2q/facKFkI1aOn9novutvCx+FDPiGLyOG3H6sJNuprnWwdND9Z+MUB1z9PgiCiXQ
 TqsQywdDyXww2QntwGTX9QpsCGjzxzWipwzh4AcExh7R77ksc8HrSzmMvYsqC4WqFouW/n608Fe
 r2U5n9iXQRitY1iSZXU3hHSMAl/Uh9+6fuHAt0/PmOsJdctd9vWjD1IngMDousGI6mbe+/GpXlV
 OBw1k0cTEXk4maVhYjPE/S6t7mKmHrZkkuBWVh1ea0RSMM4mOFtgi+V8vALgvnVFOsqjqCG/3iP
 nfd9+tarYqxBbqAIDnff/FlxbyPAbBogaY8iNEbCJTTXxjCdGgTgdW3CrIngTWZhbagWTMXzF91
 +uavRE664sf8YaKzxS1rurr61NnaKQRiIgRvVWSq8UM0RzKnEw0hoGZOzvndt9pE6mlSfW8QguO
 zn1V7pH0+2I4OQ6gRPFagHsaEqGk1iM1iwZrlf4GQcR+B/IS7EnCTTh/MDpsCgLcN+n8V5GHqXZ
 GPFuiKOoB4k92WmWzxcD8UR01SxiLHPCQw4HCrxoLRNrSYU2RMOTCUNVkv4b1WVvpz035h4B60c
 vrSIacoZHT7i8Vg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index 00c31f18bb69fa8f21a2a048393ea76615eb926b..fe841c13677bd9cb63a825a7f99d45470d457c18 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1416,6 +1416,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1424,6 +1425,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c0e699575897c01d17359a58b0e62..ea1bd419e471cf3c8e66445ca6b6c706458657bd 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.52.0


