Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10E7215EC0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbgGFSir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729995AbgGFSiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6210323F7;
        Mon,  6 Jul 2020 20:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060698;
        bh=HrZ4hIdtg0tgX3ZFL3SzSgzNTPwGFfxwKhLieElz3e0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CpMa0rOOskf9eo8SCQFIKHz3sS/whkafe+xp8WGW0VnPjWWF6MXg8Hv3lNgLAcSdt
         fE8wKmzH3+GFc2/PxTL9YQfQW5A8e56AMDYTO/wXIB1yJIoEL7fey6a7jZ98ELNJXT
         KsEr5lTcEvoSO6lZ5CcVaEEPy8e11YxZqS1Sp33c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 080/108] media: ti-vpe: cal: Remove unneeded phy->sensor NULL check
Date:   Mon,  6 Jul 2020 21:36:41 +0300
Message-Id: <20200706183709.12238-81-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The phy->sensor NULL check in cal_camerarx_get_external_rate() is not
needed, as the V4L2 video devices are only registered when the sensor is
bound. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8b1815bbf1a7..ade76739de47 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -485,9 +485,6 @@ static s64 cal_camerarx_get_external_rate(struct cal_camerarx *phy)
 	struct v4l2_ctrl *ctrl;
 	s64 rate;
 
-	if (!phy->sensor)
-		return -ENODEV;
-
 	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (!ctrl) {
 		phy_err(phy, "no pixel rate control in subdev: %s\n",
-- 
Regards,

Laurent Pinchart

