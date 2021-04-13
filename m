Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30AC35D53A
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241097AbhDMCbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238797AbhDMCb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3E7C061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 19:31:10 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3A7B8AF;
        Tue, 13 Apr 2021 04:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281068;
        bh=W1ojoZEXI6LmEnmcTHQY0FgzOu8gh0aLc6z9ENTlm8M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z1IPn2ecuA/1vkLahbYvUCxty8o9jyXO9Jv3eugaAcYmAdljuMlm52FLcl2A3UOFR
         pBL117JLbIuW22ee6lA110MX9RdlFrIvNBdHYCpleKoU29CobRVljlIHp1ZB9B5DF9
         e2/7HnV9HgcK3KGrmWIRudzQPw8M1Q2hlgBLr21s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>
Subject: [PATCH 01/23] media: imx: imx7_mipi_csis: Fix logging of only error event counters
Date:   Tue, 13 Apr 2021 05:29:52 +0300
Message-Id: <20210413023014.28797-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_events array ends with 6 non-error events, not 4. Update
mipi_csis_log_counters() accordingly. While at it, log event counters in
forward order, as there's no reason to log them backward.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 025fdc488bd6..25d0f89b2e53 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -666,13 +666,15 @@ static void mipi_csis_clear_counters(struct csi_state *state)
 
 static void mipi_csis_log_counters(struct csi_state *state, bool non_errors)
 {
-	int i = non_errors ? MIPI_CSIS_NUM_EVENTS : MIPI_CSIS_NUM_EVENTS - 4;
+	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
+				: MIPI_CSIS_NUM_EVENTS - 6;
 	struct device *dev = &state->pdev->dev;
 	unsigned long flags;
+	unsigned int i;
 
 	spin_lock_irqsave(&state->slock, flags);
 
-	for (i--; i >= 0; i--) {
+	for (i = 0; i < num_events; ++i) {
 		if (state->events[i].counter > 0 || state->debug)
 			dev_info(dev, "%s events: %d\n", state->events[i].name,
 				 state->events[i].counter);
-- 
Regards,

Laurent Pinchart

