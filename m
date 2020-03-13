Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8564184613
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgCMLlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:41:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33208 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgCMLlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:41:44 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfeXN122241;
        Fri, 13 Mar 2020 06:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584099700;
        bh=b30f/crIVkwspBNcnEmy7/Rr3Fn+GwWBINRrmnZEH0A=;
        h=From:To:CC:Subject:Date;
        b=V8BRjOEAufehUPFG1d1DPs3Hhkmon9TLC/FY8NKMpnu1ysSGvaKVZ9NIbe+VDh0S+
         7jFb2ySm4Gc6yQThy1fpqS7wI9L4i4YkN+sIYLdrbjjpj8fFYBolCyj7CZvdJhDg9S
         SUcsJrz8u3FHp4cQnTsj095f2v2yzI0rDTVUjNpQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBfex6120251
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:41:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:41:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:41:40 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBfcoj044014;
        Fri, 13 Mar 2020 06:41:39 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 01/16] media: ti-vpe: cal: fix use of wrong macro
Date:   Fri, 13 Mar 2020 13:41:06 +0200
Message-ID: <20200313114121.32182-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
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
---
 drivers/media/platform/ti-vpe/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e44b34dfac1a..4b584c419e98 100644
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

