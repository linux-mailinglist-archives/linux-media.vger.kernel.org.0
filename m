Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234B0215EA0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbgGFSiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729925AbgGFSiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:15 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE29D2163;
        Mon,  6 Jul 2020 20:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060679;
        bh=cunEIujID6Y0XpLhpweCfm10oErqIakoH7GqG1RNNIc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gyLtcU9Of+0C5HIjaScscSN6c657FXRsUL7YGW5kOFD+1ZIo0Kt9SOzOa2ekrx/LS
         PlZOvUQJagWl4kh/FRV8UdG3Xusdiusn54r0Itzy466gZ42n3Ttbh7XF5kXpSXMcGO
         fXVoPO4wsV2FCKT5Ufbiqqoz2t+nDonntPG2DXCE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 048/108] media: ti-vpe: cal: Rename cal_create_instance() to cal_ctx_create()
Date:   Mon,  6 Jul 2020 21:36:09 +0300
Message-Id: <20200706183709.12238-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_create_instance() function creates a CAL context. Rename it to
cal_ctx_create() to make its purpose more explicit.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 738fd7a46399..4796e211e33d 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2204,7 +2204,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 	return ret;
 }
 
-static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
+static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 {
 	struct cal_ctx *ctx;
 	struct v4l2_ctrl_handler *hdl;
@@ -2348,7 +2348,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Create contexts. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i)
-		cal->ctx[i] = cal_create_instance(cal, i);
+		cal->ctx[i] = cal_ctx_create(cal, i);
 
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
-- 
Regards,

Laurent Pinchart

