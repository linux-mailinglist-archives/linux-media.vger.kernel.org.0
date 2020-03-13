Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BA718461F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMLmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:42:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36992 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMLmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:42:01 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfxkp041396;
        Fri, 13 Mar 2020 06:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099719;
        bh=XMQBlDyNCAqNhqP+IZ8Y4+x1suFsU0fe5xus/A8HHFA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=x2PsxbT/wlAIhmplAacWcnwS8BomVDKqMYTfLaauEfQq1vt6+39MZ09ZwmS0Q7CPz
         pKpGEkIFV4mzfs6o1yy54xvzgEc/Nw8wVvO6aUGWHua/WTwsKS8A0LE0oO0voP4O6i
         2/danlcU6X6A/YpfYwaFF4xhH9QCPqGBg6xgQlMo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfwD1040131;
        Fri, 13 Mar 2020 06:41:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:58 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcou044014;
        Fri, 13 Mar 2020 06:41:57 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 12/16] media: ti-vpe: cal: set DMA max seg size
Date:   Fri, 13 Mar 2020 13:41:17 +0200
Message-ID: <20200313114121.32182-12-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313114121.32182-1-tomi.valkeinen@ti.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set DMA max seg size correctly to get rid of warnings on 64 bit
platforms:

DMA-API: cal 6f03000.cal: mapping sg segment longer than device claims to support [len=720896] [max=65536]

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 832f37ebad0d..64ea92dbfac5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2321,6 +2321,8 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = cal_runtime_get(dev);
@@ -2335,6 +2337,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 runtime_disable:
+	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
 		ctx = dev->ctx[i];
@@ -2377,6 +2381,8 @@ static int cal_remove(struct platform_device *pdev)
 	cal_runtime_put(dev);
 	pm_runtime_disable(&pdev->dev);
 
+	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+
 	return 0;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

