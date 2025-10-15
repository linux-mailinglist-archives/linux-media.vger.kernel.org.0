Return-Path: <linux-media+bounces-44513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B405BDC9F2
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3ED1635242F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A33E30CD83;
	Wed, 15 Oct 2025 05:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wAl4a4ye"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1248305055;
	Wed, 15 Oct 2025 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506853; cv=none; b=ElWVJc0HSvtmRCayMoMyU/cXTK5RqRJEHqPWaM/lpXANZPkHRgROTxnfcOjHrmHrpvWlx/uaEDD6njeQxtHYyZNDxfFTStaaP+20BaOPl/JQ+T1rJznP/I2J5uQ6noBs1MtKUf12mHsOHUz4cGMiAn7DX/2z0T34v8+e/SvEL+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506853; c=relaxed/simple;
	bh=cVx7atmHtPvg8dKzH3g4atr5NjXtz5VOAFhwQdAsO3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPwScet9tlIJm3FMUR93z7YHAZ4NAkPa8QL4M0zq3Qk8GnrYYXmdtmzYsrte/kvKCS+pKUIt01RwFClVjTHofwgJZOncF/Xs4sF//VtH7P+y6IaXcsaww9gnNf+httEHsaWsOpgRHPgJ/UPtfuEKDYcH6GE/HXKkE9Sr1GECEZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wAl4a4ye; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F5eWog1679796;
	Wed, 15 Oct 2025 00:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760506832;
	bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wAl4a4yeIIW9sDWMDuWRAMaHSS2KTd/dV8haa78gdUa/L7XPwPpNf71xcTGzfURCP
	 OkkdNZ6hwwLGIvDcLiUmudgT4BDf05aK9tWNzpLqz8g/IBdg8VS/KCCHr1NJRk4fmS
	 Vn56puEzEaomweWlIsbEOyd/X6T3WNo9XoQySIaw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F5eWu3994547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 15 Oct 2025 00:40:32 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 15
 Oct 2025 00:40:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:40:31 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F5eGdo1402458;
	Wed, 15 Oct 2025 00:40:27 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V4 2/4] media: ti: vpe: Export vpdma_load_firmware() function
Date: Wed, 15 Oct 2025 11:10:08 +0530
Message-ID: <20251015054010.3594423-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Export vpdma_load_firmware() function which is needed by TI VIP to load
the VPDMA firmware.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 3 ++-
 drivers/media/platform/ti/vpe/vpdma.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index 29ee1918bc1c..573aa83f62eb 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -1135,7 +1135,7 @@ static void vpdma_firmware_cb(const struct firmware *f, void *context)
 	release_firmware(f);
 }
 
-static int vpdma_load_firmware(struct vpdma_data *vpdma)
+int vpdma_load_firmware(struct vpdma_data *vpdma)
 {
 	int r;
 	struct device *dev = &vpdma->pdev->dev;
@@ -1152,6 +1152,7 @@ static int vpdma_load_firmware(struct vpdma_data *vpdma)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vpdma_load_firmware);
 
 int vpdma_create(struct platform_device *pdev, struct vpdma_data *vpdma,
 		void (*cb)(struct platform_device *pdev))
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index 5b3a0cd49a3c..1fc53fb33497 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -281,4 +281,7 @@ void vpdma_dump_regs(struct vpdma_data *vpdma);
 int vpdma_create(struct platform_device *pdev, struct vpdma_data *vpdma,
 		void (*cb)(struct platform_device *pdev));
 
+/* load vpdma firmware*/
+int vpdma_load_firmware(struct vpdma_data *vpdma);
+
 #endif
-- 
2.34.1


