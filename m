Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8B2215E8F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgGFSh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729788AbgGFSh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:58 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5049C214F;
        Mon,  6 Jul 2020 20:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060667;
        bh=nPjKq6r4d+9MxHqFfcboixuyvxarOGd01mNSzjHoleE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qK4+jVEVX1NB435H+q/ZOE/x/ytoauKLn6igikmcx4uwxksIqA9b+FJkHndCmXQqm
         bDUp5FZZYvr7rqL7cahD//PxY+JTau6b1gPv9v6F1GImuXN+fBnyP/JR4k1J+YVAn0
         8XcAolPfhJen7tG3uVuPK+7b1ichvmZSxpMSO3As=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 031/108] media: ti-vpe: cal: Add print macros for the cal_camerarx instances
Date:   Mon,  6 Jul 2020 21:35:52 +0300
Message-Id: <20200706183709.12238-32-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 4b718b4a79c9..7ec2b6febf71 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -71,6 +71,13 @@ MODULE_PARM_DESC(debug, "activates debug info");
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

