Return-Path: <linux-media+bounces-45474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31DC05674
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1D8E835913E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0855430CD80;
	Fri, 24 Oct 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SzwYlJEq"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684C530DEA0;
	Fri, 24 Oct 2025 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299124; cv=none; b=I8RMdgpO0FCL9l12InxSDGI83EouaAGp4rLpHqy+KpLi9pG76L3Hu1SpM9b73CtZL249KTH4E7MGZ47EqkV44QxhsmStvLdnaIn7OeiCT+iGYssx6knNQyuVs3XJ8zP/lzeji3KRhzmvc+sh5fJja8zFGg2gcFURqxkTbedIA7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299124; c=relaxed/simple;
	bh=cVx7atmHtPvg8dKzH3g4atr5NjXtz5VOAFhwQdAsO3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rCqbq4G0ubSardna1s8wEQinGvx8jkwm3eLdmkZdnmJCJdMAXprkTYeELuQclvU6FBRSjRw9vUA7C4yqUkH8YZN8zALTTdjlIbkQkRs88JffnfhScqUwxuKOf+mrJTU7y/UhkEVz5anIjhO166nWjyI0U3W7c43Dpz6MUxi17bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SzwYlJEq; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59O9j9W1726933;
	Fri, 24 Oct 2025 04:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761299109;
	bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SzwYlJEqg7pZv8CMXW+6p18Ps/+HwSELVAwFldtkqW2svv9y+Y5QLxnajZ0yUaJ0u
	 z3fQsTfstsELdRjOaQBYYukYTnq5nE03wa0Y4godW4sBmjezXJoYdWC/IYhPAngnvb
	 GBfkpOub+v5DVbgcNaTzYB4uEzNnYQPbAL60dcA8=
Received: from DFLE201.ent.ti.com (dfle201.ent.ti.com [10.64.6.59])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59O9j9Ih3378299
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 04:45:09 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 04:45:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 04:45:08 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59O9isvl148409;
	Fri, 24 Oct 2025 04:45:05 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V5 2/4] media: ti: vpe: Export vpdma_load_firmware() function
Date: Fri, 24 Oct 2025 15:14:50 +0530
Message-ID: <20251024094452.549186-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024094452.549186-1-y-abhilashchandra@ti.com>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
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


