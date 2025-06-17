Return-Path: <linux-media+bounces-35087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1FADCE68
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49A831890B96
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF2F2E92A5;
	Tue, 17 Jun 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HZx1zX53"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A452E8881;
	Tue, 17 Jun 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168464; cv=none; b=Jjx6tdpnWLnnn7Uvbnsg9YNRJ/v7a+u0Uv5JkAlWvPL/THvGfR03nxsydJMY0+pvxeJuEaF1AZiFCuvBNZWlS6CKpj5JrlVbo7zAqY+J6oJBGZTcqmGvXxMp3wN1lvp/Gxj37r62NHgX/xnRY4ToWUk0MXzyulM46fGZ4IPNt5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168464; c=relaxed/simple;
	bh=+zqqmKIUftUfrElMykNoEhWSaAdLvXt5iznvaoygcTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUu4ZOjCbrud3m6PH5QPI5V9Epe2t0Sh0xEqpbS7hbw7YX0bQl57VUl5xchY6jzeIEBYmhcTJwvnATi+dQPwYSQuhpAKeACOMdMQwH+79zBr2Chabu8QwdpA6La0wjNmbwZeDeTvtWThFofGP++wng+LF2erwPEWOEf5dpgfAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HZx1zX53; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE7BA4371;
	Tue, 17 Jun 2025 15:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750168445;
	bh=+zqqmKIUftUfrElMykNoEhWSaAdLvXt5iznvaoygcTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HZx1zX53qc58axyY+buCnKjSNgBYyNb281iQ+d8JoeKYrFZZWX3+Uq7/tc9kqNKlx
	 a1/Qcm2aoy5sOg+iSbY+pNP1HmmG87SmilEjPDO3A0IytziFsH+5ccIqEEf/s2TiPZ
	 22rJvmVLKMOIunr402Td3u51fw2mZjU5VIXmY+WI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Jun 2025 15:54:02 +0200
Subject: [PATCH v8 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-4-e58ae199c17d@ideasonboard.com>
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3265;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=+zqqmKIUftUfrElMykNoEhWSaAdLvXt5iznvaoygcTU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUXOEbA+dXnVyiD4fxG8s5bJd//kD7Vj5ntMJc
 MB1aGNB5uSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFFzhAAKCRByNAaPFqFW
 PO2QD/9FWbjUfguHOEg9Va0TjkdMBLIiy4tT32D8DssRg/qq2p4rWJPSjE1Hjabozj8wAgpJ8Br
 puM+Lgw2lxhq1t5DSJvKQkkEirD3uedtCHet2vwU95CswdHsnqljKsytl67N623aNIgE9cVBEYF
 APlOPUuY81umvgcQeYmTVdvOHGXphD5IRSuJPDiXb+FcxZWozgMIkkM3Mc5muYq6RImez9DGOKT
 iT9C/A1isjiYMu3nYac3kMWods8nBeibf/nsrblNt3dvEo0mRqwUf/S+YunHLZMH1+8GZasW1SB
 H5Uh4zeUlPKLBChdkjBJDZBMCUAlPPcfMxb46pYfmw/iZvZ3yU16Q5o9r9uwVBztwBGkdOK2yGQ
 K2vmzZMSPFPzaxKPfXkb77G2QVOBxFId3FwBaXQwcviPRoEyPvonGhpb/Zs3BzsDr0RH0eo407D
 CjRtH6tQo/KXPI14oFJGBY4JczLbJjK6zxtTtVM4baqlfZxakT6zXDS7qsE6+iQJM3JqYTDR2sr
 PNY2qS9g8jZ5AkyURyU7s5FeHytuA8Qd/pJhqXaCFGQWiel6O2DR33bBjXww6HGkQ+WxWTo4ucL
 Fw0sAxJZyaETE+CFXpcjIrtDpwelnpBxtr2B90KZs4joHTNuCJcFaUgPDdrEZFBP8jr6XjzubjE
 1rp2/O83LtcxvZw==
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
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
index 46765a2e4c4d1573757ff842f208834216e582cb..a9e51fd94aadc6add70f883bfcea0c9fa91f0c4b 100644
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
index ccc6cb99868b842ac0d295f9ec28470303e60788..be794a12362020f42b3cf5bd291b4a1625543b5f 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1725,7 +1725,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(pispbe->dev);
 	pm_runtime_enable(pispbe->dev);
 
-	ret = pispbe_runtime_resume(pispbe->dev);
+	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret)
 		goto pm_runtime_disable_err;
 
@@ -1747,7 +1747,7 @@ static int pispbe_probe(struct platform_device *pdev)
 disable_devs_err:
 	pispbe_destroy_devices(pispbe);
 pm_runtime_suspend_err:
-	pispbe_runtime_suspend(pispbe->dev);
+	pm_runtime_put(pispbe->dev);
 pm_runtime_disable_err:
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
@@ -1761,7 +1761,6 @@ static void pispbe_remove(struct platform_device *pdev)
 
 	pispbe_destroy_devices(pispbe);
 
-	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
 }

-- 
2.49.0


