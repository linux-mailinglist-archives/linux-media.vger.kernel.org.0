Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9191F8BB6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgFOABl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgFOABk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:40 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42967E41;
        Mon, 15 Jun 2020 02:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179246;
        bh=SRRvM1e3px7j5Uk1tFJJVWrtldhDJ2I30UvaFzBsbdk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fzn02n1g4nFdzdgZHN/rrD0TJed/2LzvE/R1uTi2K1pbDwEFbFV/pqvn8kNoaYy1g
         Iwvzs94Ey7b/IuXW83AIgg4Fm2nYeQvdB2f2lcqpbLgNV6E0ur1Z5sSzfFBDuYUdiG
         JdX48FDka4YP23dmRmi5j6pK259YEexaiRYadCnM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 079/107] media: ti-vpe: cal: Remove unneeded phy->sensor NULL check
Date:   Mon, 15 Jun 2020 02:59:16 +0300
Message-Id: <20200614235944.17716-80-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index a11457909134..38d2fc186ba7 100644
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

