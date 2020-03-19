Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603C218AD93
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgCSHvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:51:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37062 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbgCSHvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:51:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7p02a085657;
        Thu, 19 Mar 2020 02:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604260;
        bh=+2JsNYs3ag5maY0Ds0ySy+/gb1saX5yLBelqJfEJPdQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qGMoJvixktl2TePoS7oPcdhQqjZn0q9IJXkKtAOZNZ6mzNfZ9yvSTxqaWwlEGAGw7
         4GKhXjxGfIY99BcTw5dQvAy4/GiCMljkyRVSuxv/RvZyRMHrv4MGeppnUK6cSHBueK
         KT0nf9oAuuhFo+ytYimPs1wfe6oz0k3YASlESi9c=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7p0qN119224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:51:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:51:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:51:00 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqr047151;
        Thu, 19 Mar 2020 02:50:58 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 14/19] media: ti-vpe: cal: program number of lines properly
Date:   Thu, 19 Mar 2020 09:50:18 +0200
Message-ID: <20200319075023.22151-15-tomi.valkeinen@ti.com>
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
Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e6f766ba3079..a59931ba3ed7 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -962,8 +962,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
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

