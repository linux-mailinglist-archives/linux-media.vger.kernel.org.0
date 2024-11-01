Return-Path: <linux-media+bounces-20692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A429B90BD
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 12:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BA68281F96
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 11:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDB319D8B7;
	Fri,  1 Nov 2024 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a/eEwnea"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5219D081;
	Fri,  1 Nov 2024 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462136; cv=none; b=EQiZ4RwjdpJPUSK5XH8G5r5H1NyJ1YJZGTrXSbBR8vdCkb500UhzA9Wmvd8uMjkeLaGW2UpqE8UHGNIvkQBXZN4SdDs5XfRIXoPuw+gFwPSe4LiB+5GghLU1I943K8saFudOlJ7CQa7IZgpitkFQCNW/tKOU0+ZohmNcPlJCAn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462136; c=relaxed/simple;
	bh=YgheqCGz5W29kaXksMwAsSLSItD+uZ0Eo9BVpZbhL50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mZzJZDqXWHyYjOeVbAsa1mr1MK8piIwbStqMREVIJK5iquCxidg9E1RfA6sKZSI2wERYFLlcedDyRd+K7rT6ugCjiLalRoVV7HvHR5XEMEsFWA5WJpNCyFEBZLaDO/ix6IiO/BcHNhWN7yfrxnRhnhVK32YUesk11bpPoLbC1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a/eEwnea; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318CF3D4;
	Fri,  1 Nov 2024 12:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730462127;
	bh=YgheqCGz5W29kaXksMwAsSLSItD+uZ0Eo9BVpZbhL50=;
	h=From:Date:Subject:To:Cc:From;
	b=a/eEwneaxNk6oWJRPCLor+aANObSNwjnxnCP5bGCka8VI1i6CkzFeM0EHlitOfikF
	 DrXyhjgAtZ4BRYeVmDbVKUfok90oK0QRxoQOIGAdbAf2bvpt+i8tqzuUr8JDij80yx
	 cjkOSWmopNw1Ke6rdPicWBKWbigbQwMPwoMsyoYI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 01 Nov 2024 13:55:15 +0200
Subject: [PATCH] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAKLBJGcC/x3L0QpAQBBG4VfRXJvaWUq8ilwsfswN2inJ5t1tL
 r86J5EhKoy6IlHEpabHniFlQdMW9hWsczZ552sRJxxP4WkBL3rD2LCy6QMeG1e5dg5NHTzl+Yz
 4i/z2w/t+QRV3oWgAAAA=
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YgheqCGz5W29kaXksMwAsSLSItD+uZ0Eo9BVpZbhL50=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnJMGvFaCtuDuyf61e0vv8PqzSJB/xa17jDfwQW
 NGrimnq/deJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyTBrwAKCRD6PaqMvJYe
 9eNFD/9DUTfzgMBvDuE/F3k405rVzyAORyhjBXr0Duc/OrM9lBlDIG/ONRSY0o6qO/4ZQC5YsDU
 EwrZtGSBoz64NZuYl7Z6a+MocK2A3izCAeObWSj8tIIKme6zvEFxfMQxhpLeJOLFfdJpOzPOHKO
 VpEloIccudNFJzZ4akkWJBuiq37JAhMefysGdA6gJFmW5rKZLIFgydYEeo+R8W7oQsocbVB8utG
 z9BgmQ+wPMuiyUSDh+VFyv1H3wEdHgvOs+9kPQokhg/TqD5nrzYUezENUp8PpupZA/TMdEkcfqA
 BFXTabQDmNBykvtMKrmtsbzRGaVryu6w4wSUoM6h71LWpANIFjtlca4vFk3GclDBLdO+ejA7B/1
 cY8ecpBA5bR6CBX6hqx88bnxo4j6+o9l2neZMCMoCo2jr2jgnReOejI0jT4sWn698D7lWg6DhZH
 vZkAunYNcOJG+gjTYyN7k5rDKSGA85d/ZvDU8wONpMdDAnSowioKwd3nwFXXUrxLKNVyX0WkWPc
 /wcb9mTKebDrnQlOI34cVGpiJ8fXRI0IQFIMCz4SmmmcfJkeooldFLcduo9uYVdEwF48Kdbz98Q
 1OtjfkalIC1ZmXO7+TyAvpx4TS1Dp5RdGDdavLXDGFLQQg4Dd6zhx8eOPdBAJkUuTG3z+AQDoMS
 Sskai3Yq9FFlqTA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When using buffers from DRM, DMA-API gives a warning about: "mapping sg
segment longer than device claims to support [len=307200] [max=65536]"

Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
about the supported segment size (which is UINT_MAX).

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..e52d8b20df40 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2341,6 +2341,12 @@ static int cfe_probe(struct platform_device *pdev)
 		goto err_cfe_put;
 	}
 
+	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to set max_seg_size\n");
+		goto err_cfe_put;
+	}
+
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(cfe->clk))

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


