Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17D1215EBC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgGFSin (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbgGFSim (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:42 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92ED2183;
        Mon,  6 Jul 2020 20:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060696;
        bh=IdfkyvxBNPb4SkYaNM5ugZLW8ogj3xlLEW1OKHlDXho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BYSik5Sk05BkOOEw1bqivzfmmUYUZ5RbQAgjBKGF+u+tKbF65L87sbkZ8EoLGOtFO
         I6pcepKn5WXRzqW/ZaBrS+zftA0SZuoHqJBOgCj4o8yE3P/PGj00HvnEp5hlVmcmLH
         MpvPOrJlrYBYVDtF7Bfa3a1yF8RgJz4yqI1mURGg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 076/108] media: ti-vpe: cal: Inline cal_camerarx_max_lanes() in its only caller
Date:   Mon,  6 Jul 2020 21:36:37 +0300
Message-Id: <20200706183709.12238-77-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_camerarx_max_lanes() function is a one-liner that has a single
caller. It doesn't improve readability. Inline it in its caller.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 31878a32f6a1..4be1fa7e8197 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -481,19 +481,13 @@ static void cal_quickdump_regs(struct cal_dev *cal)
  * ------------------------------------------------------------------
  */
 
-static u32 cal_camerarx_max_lanes(struct cal_camerarx *phy)
-{
-	return phy->cal->data->camerarx[phy->instance].num_lanes;
-}
-
 static void cal_camerarx_enable(struct cal_camerarx *phy)
 {
-	u32 max_lanes;
+	u32 num_lanes = phy->cal->data->camerarx[phy->instance].num_lanes;
 
 	regmap_field_write(phy->fields[F_CAMMODE], 0);
 	/* Always enable all lanes at the phy control level */
-	max_lanes = (1 << cal_camerarx_max_lanes(phy)) - 1;
-	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
+	regmap_field_write(phy->fields[F_LANEENABLE], (1 << num_lanes) - 1);
 	/* F_CSI_MODE is not present on every architecture */
 	if (phy->fields[F_CSI_MODE])
 		regmap_field_write(phy->fields[F_CSI_MODE], 1);
-- 
Regards,

Laurent Pinchart

