Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3FFCC094
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 18:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387452AbfJDQ2g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 12:28:36 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40546 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731021AbfJDQ2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 12:28:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94GS3wX076928;
        Fri, 4 Oct 2019 11:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570206483;
        bh=FSYboD3JqHG1wzgmeZLkIKXYQEnzeuEpUNa4uQ9WH1Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wxHouhG/00xWwnzGrlTJBscj27IBLmCTWvbo90ZswHlcpMZJT1EvTI8lqYpYymT5I
         ep23icFt2nj5b04m6dUwGYgotwSqJdtVC2hh7j97D+U7xjbJehqHEbbwNbfCx7jE1I
         uljjeJQOQnHmYkEs563Hfrq7J30ROLbtS22JpBy8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x94GS3ok056192
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Oct 2019 11:28:03 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 11:28:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 11:28:02 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94GRgAH028904;
        Fri, 4 Oct 2019 11:28:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 15/21] media: ti-vpe: Set the DMA mask and coherent mask
Date:   Fri, 4 Oct 2019 11:29:46 -0500
Message-ID: <20191004162952.4963-16-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VPE uses VPDMA (built-in dma engine) to transfer data to and from the IP
and memory. VPDMA expect 32 bits addresses. To make sure that is always
the case set the DMA mask and coherent mask for the device.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index ad9d8b559cad..d7f8eb901475 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2517,6 +2517,13 @@ static int vpe_probe(struct platform_device *pdev)
 	struct vpe_dev *dev;
 	int ret, irq, func;
 
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev,
+			"32-bit consistent DMA enable failed\n");
+		return ret;
+	}
+
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-- 
2.17.1

