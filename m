Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF20192800
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 13:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgCYMQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 08:16:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41834 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbgCYMQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 08:16:21 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCGIi0062703;
        Wed, 25 Mar 2020 07:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585138578;
        bh=nbfTUQUvktbKpcf8vazyXRnI93nulzbSZhaCW+d90fc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=L8EIH1GmDe9Xbe0ylJpSgPTBLBZ8+4PZ5uVs8/m1uiuK4n/fdI6G6AaBrVyEQ8/MJ
         vY4vci8zB38NbjZHQ3VV8//jpNGqgcHsqIE9jI+FXjeYIuvhpvPZtyU808wpFKvN/M
         JY9wctaFFO+n6gwFZJ413RW5rQxL1ECMG1aInWXo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCGIms014302
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:16:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:16:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:16:17 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCFm5E085323;
        Wed, 25 Mar 2020 07:16:16 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 15/19] media: ti-vpe: cal: set DMA max seg size
Date:   Wed, 25 Mar 2020 14:15:06 +0200
Message-ID: <20200325121510.25923-16-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325121510.25923-1-tomi.valkeinen@ti.com>
References: <20200325121510.25923-1-tomi.valkeinen@ti.com>
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
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index c124f28435d1..67954754ffff 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2315,6 +2315,8 @@ static int cal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = pm_runtime_get_sync(&pdev->dev);
@@ -2329,6 +2331,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 runtime_disable:
+	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
 		ctx = dev->ctx[i];
@@ -2371,6 +2375,8 @@ static int cal_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
+	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+
 	return 0;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

