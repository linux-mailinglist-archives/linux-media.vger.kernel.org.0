Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9341F8B97
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgFOABF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgFOABF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:05 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62B3C1295;
        Mon, 15 Jun 2020 02:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179232;
        bh=2PkKvs1G8qKeGsyDDqXLAQYIEbrZdN60qbVdw+jEj1Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CNHjXFeAgangiIz+9F6LWQ4y0kVtoT2wZjTMZYkGCs5KPvsbOr6ZMgfi6jhPOa0N9
         fwRU7wC9wNHiL6kGJ+Mbb+7VTF2sCh5nnNYyBD6f7Vr8HKtJXgUtieicRwe9W57bVp
         LMpV3ELhfyQIUO5Iw3oaCN4RlrsFrZOS2HwiAd2s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 047/107] media: ti-vpe: cal: Rename cal_create_instance() to cal_ctx_create()
Date:   Mon, 15 Jun 2020 02:58:44 +0300
Message-Id: <20200614235944.17716-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_create_instance() function creates a CAL context. Rename it to
cal_ctx_create() to make its purpose more explicit.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9b116ffd6e41..52b4fa1ff7a5 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2198,7 +2198,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 	return ret;
 }
 
-static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
+static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 {
 	struct cal_ctx *ctx;
 	struct v4l2_ctrl_handler *hdl;
@@ -2347,7 +2347,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Create contexts. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
-		cal->ctx[i] = cal_create_instance(cal, i);
+		cal->ctx[i] = cal_ctx_create(cal, i);
 
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
-- 
Regards,

Laurent Pinchart

