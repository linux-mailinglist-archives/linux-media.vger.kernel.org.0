Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FC81F8B87
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgFOAAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgFOAAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:45 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 939BA2145;
        Mon, 15 Jun 2020 02:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179223;
        bh=fb8XtqRoNmPlllaGNJp3mdkCl5vIFYKrogjZmNF7GAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dWmfkGh6pe8vPbjcdg1AxNborZmh0QSkCLpL8bMkzR2OnN6/W6aO+MqSN5qH4fTlh
         hxz2Snw8TjW6lez6lNZu6F5/OXPOcQzFFv+jsuNXEX5W/ZbYtj8q8+EJVxcu8RtM34
         iv9l+zzoI+Bxh8X18tXtIgHUjY7VcJzoI8ECkf2o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 031/107] media: ti-vpe: cal: Add print macros for the cal_camerarx instances
Date:   Mon, 15 Jun 2020 02:58:28 +0300
Message-Id: <20200614235944.17716-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for passing the cal_camerarx pointer instead of the cal_ctx
pointer to CAMERARX-related functions by adding print macros for
cal_camerarx.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e62089832713..dd85efa89bcb 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -70,6 +70,13 @@ MODULE_PARM_DESC(debug, "activates debug info");
 #define ctx_err(ctx, fmt, arg...)	\
 	cal_err((ctx)->cal, "ctx%u: " fmt, (ctx)->csi2_port, ##arg)
 
+#define phy_dbg(level, phy, fmt, arg...)	\
+	cal_dbg(level, (phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+#define phy_info(phy, fmt, arg...)	\
+	cal_info((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+#define phy_err(phy, fmt, arg...)	\
+	cal_err((phy)->cal, "phy%u: " fmt, (phy)->instance, ##arg)
+
 #define CAL_NUM_CONTEXT 2
 
 #define reg_read(dev, offset) ioread32(dev->base + offset)
-- 
Regards,

Laurent Pinchart

