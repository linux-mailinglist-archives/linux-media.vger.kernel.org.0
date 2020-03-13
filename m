Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D8718461E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgCMLmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:42:00 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47962 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMLmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:42:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfvM6034307;
        Fri, 13 Mar 2020 06:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099717;
        bh=7IxLm6Pr4P/wxrJAK8Gx9L6uFBvqrouQ4QOVlef4rew=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Drte4KKKNbJ0lEaqE8QBVirDK5x0qsCvatK3YrJlCI2pgSajSu5akaWlsZKKvNw4p
         7/qKJ59mutj/wtC0Qdd+s7da4MPHBFj5gLOMYUOj9EFY9yj0Gz1vkJxF3Vpt/psxfk
         gAnPM8kNshN1/mhTMLvVvq/5pvxxfMZsJqvojqtg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfvQR074687
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:57 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcot044014;
        Fri, 13 Mar 2020 06:41:55 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 11/16] media: ti-vpe: cal: program number of lines properly
Date:   Fri, 13 Mar 2020 13:41:16 +0200
Message-ID: <20200313114121.32182-11-tomi.valkeinen@ti.com>
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

CAL_CSI2_CTX register has LINES field, which, according to the
documentation, should be programmed to the number of lines transmitted
by the camera. If the number of lines is unknown, it can be set to 0.
The driver sets the field to 0 for some reason, even if we know the
number of lines.

This patch sets the number of lines properly, which will allow the HW to
discard extra lines (if the sensor would send such for some reason),
and, according to documentation: "This leads to regular video timings
and avoids potential artifacts".

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index b5fd90a1ec09..832f37ebad0d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -961,8 +961,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 	set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
 	/* Virtual Channel from the CSI2 sensor usually 0! */
 	set_field(&val, ctx->virtual_channel, CAL_CSI2_CTX_VC_MASK);
-	/* NUM_LINES_PER_FRAME => 0 means auto detect */
-	set_field(&val, 0, CAL_CSI2_CTX_LINES_MASK);
+	set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
 	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
 		  CAL_CSI2_CTX_PACK_MODE_MASK);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

