Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C4E18AD83
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgCSHuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33268 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCSHun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7ofkd114035;
        Thu, 19 Mar 2020 02:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604241;
        bh=OYoh55qtmfyODFvPJ89VFKI4w8Oz23RJFVZbbMTzlYw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=f/cUcBGeiKXcCvwAiZgHx0WFld+89CyRDXI5IsM+uAoJFu2efKA89BCm2SWsdLZFH
         U8PPa44BN/MOm/4OTooTFNk3MS1A1XT4Yn0rAXY0fgu1UoawVdUJlMKF5szmiO67L/
         tIwHlDQOO5dD7PN9rcjGphCOtusmltSdzHMuhCUs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7of0Q026383;
        Thu, 19 Mar 2020 02:50:41 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:40 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqg047151;
        Thu, 19 Mar 2020 02:50:39 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 03/19] media: ti-vpe: cal: fix use of wrong macro
Date:   Thu, 19 Mar 2020 09:50:07 +0200
Message-ID: <20200319075023.22151-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319075023.22151-1-tomi.valkeinen@ti.com>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i913_errata() sets a bit to 1 in PHY_REG10, but for some reason uses
CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE for the bit value. The value of
that macro is 1, so it works, but is still wrong.

Fix this to 1.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 76d55c76d938..c418296df0f8 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -645,8 +645,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
 {
 	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
 
-	set_field(&reg10, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
-		  CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
+	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
 
 	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
 	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

