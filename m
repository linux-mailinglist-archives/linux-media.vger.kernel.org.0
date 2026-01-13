Return-Path: <linux-media+bounces-50523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B8D17822
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C95E30089AB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EE33815F1;
	Tue, 13 Jan 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdgR5R+i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD053815FB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295276; cv=none; b=NUYakZ5HNqwtrwTaTTn/stYr4rbcz5bGo7sayZT0JVnBPvcQNMvbzqaut2Ei0sK53G0mzWJ4djAMst81ABGFOvfE9cjuhRwq973iZaoH5mPSQn69yfccE1+BpbjkAsBhq7P49M2fya6n8FAN0Ign1bXYVobC2qRLZHOirViR8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295276; c=relaxed/simple;
	bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVE1F/TnOGCElnjcRDU4KLysM8HpeSPBwDB2NOtGFD7NIbPuPQMFmj2DeHhV9X0ip5P8NnfU1EojmqUPzhxoCtJ+jEe0kBFowaH4ZSSmGhdsMaimzitoFY/5bJqxlgpnFAEFjokZYTCMnEDq87HX7MhPYJ7oUAh5SY7cEYdqguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdgR5R+i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37F462E0;
	Tue, 13 Jan 2026 10:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295247;
	bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdgR5R+ia87a0N8L0nDCfg9aHft7I1PYvzp9NPCaP2rxuMFsw6hLpNrMXsuEag7ox
	 KOdWVcHUF50L0CpBJ4YEkiWPNp4A3pFZx/I90FCQhHsaWHGkPNomAg0N95Fy5fotjR
	 fIT53FKmyEJO8nUw3UxQAe+8tQED8ZRd1EIWl5Io=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:24 +0530
Subject: [PATCH 04/10] platform/raspberrypi: vchiq: Add helpers for vchiq
 driver data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-4-ea0b300bffc8@ideasonboard.com>
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
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtGmZOjclOCJK85U9Q+xLbI3zQbMCWvKU34L
 xfgBhq4mq+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRgAKCRBD3pH5JJpx
 RVwxD/9NI1SbAADbi6B5DofPysMgqbZqohGe5vEtV93olv8Ghr9B7MsHWK/yFXpgCjg7yroiEKT
 8PcTJ8/WwnMCo2iWOZrnXUt28RSqw0LsQ2p/hn4H/koebZRGlk/W61yMu6oDY8sACl4GTbPnn+w
 M0NwGv4C1WUQ7G66mGdYiHPg+FpKmpGU4vsD8/8ONlN4hyLMq1B0A37s+oGHNbCop07cr3TDPrd
 RY6cbV1iQhj2cCosVfmiwXsQXiTKlrUr4HjLEoeTRoY2FNfeajurFGUesNL2J4Ra07yVz4lWBBt
 FTHQx504z5nJYT5lIDhdmA7DdaWqGu/nFomBgeeyL79bs23VrXeuhn1I0U32C8XFBf3wUm2roJQ
 GQmWOu5caxlD2WF/jqhrdnOa1sfZar+g7da2X/Nn08RHuujaSG+OykLG4xdWmYnSdThZIvZpQju
 WZaU/RI3TLBoeF9LSJAcTJBRtJYjGvnhLGuUiP/N0P12yX1cMQu4+ENyKq0IenS5qX6rtG4wqfP
 Z3vKtY/Peg+vdajJ0bkfPgLV0OpDoGghTGRwi81rQ8v52gusaxZuLiTAVMex1IUmLrOKvR8iwpr
 5LmqPaQ8wcpg2AlXBxzHHHYY+W9va3YrAh1zdB/7x2K6saFC73cDjG4LO7jVoosoZDoFRf2tWZ2
 OOx5jNNB1Jyy5jg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index 9de179b39f85e5e94c1e948030fccf0c52a00fcd..6eff6b0bf5995683ef0468bc811334b7ff4f8c19 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.52.0


