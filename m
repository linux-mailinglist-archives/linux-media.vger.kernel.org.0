Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D4518461A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCMLly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33224 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMLlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:53 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfpxN122261;
        Fri, 13 Mar 2020 06:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099711;
        bh=9dW9X92obWt7TFZca4GSxN+j8pHYjmJAVvOfKcFU52g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uYRv3OQJF+OazOBqhA66YKw81XrWt+JFvEQQy32a/wX0EUfBL+z0detTTkR7ICVzZ
         dUbqZ6uZCG1ac/wMbIT5GVPMDbPPnGK/iFFs/7DrymnLYI5yuXHENxFfCJKXCFodbn
         eRDKYm1JPH0lRSD4yzKdXEZ6vOlbPiM2hwPazj9g=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfpV4120348
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:50 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcop044014;
        Fri, 13 Mar 2020 06:41:49 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 07/16] media: ti-vpe: cal: remove unused defines
Date:   Fri, 13 Mar 2020 13:41:12 +0200
Message-ID: <20200313114121.32182-7-tomi.valkeinen@ti.com>
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

Remove a bunch of IRQ defines that are never used.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal_regs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
index 532d4a95740a..b27c0445b8d5 100644
--- a/drivers/media/platform/ti-vpe/cal_regs.h
+++ b/drivers/media/platform/ti-vpe/cal_regs.h
@@ -142,12 +142,6 @@
 #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
 
 #define CAL_HL_IRQ_MASK(m)			BIT((m) - 1)
-#define CAL_HL_IRQ_NOACTION				0x0
-#define CAL_HL_IRQ_ENABLE				0x1
-#define CAL_HL_IRQ_CLEAR				0x1
-#define CAL_HL_IRQ_DISABLED				0x0
-#define CAL_HL_IRQ_ENABLED				0x1
-#define CAL_HL_IRQ_PENDING				0x1
 
 #define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)
 #define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

