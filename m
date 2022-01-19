Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8477493968
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354126AbiASLTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 06:19:36 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:38979 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354098AbiASLTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 06:19:32 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 71135100003;
        Wed, 19 Jan 2022 11:19:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/2] staging: media: imx: imx7-mipi-csic: Resume on debug
Date:   Wed, 19 Jan 2022 12:20:23 +0100
Message-Id: <20220119112024.11339-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119112024.11339-1-jacopo@jmondi.org>
References: <20220119112024.11339-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mipi_csis_dump_regs() function reads and printout the interface
registers for debugging purposes.

Trying to access the registers without proper powering up the interface
causes the chip to hang.

Fix that by increasing the pm runtime usage count which, if necessary,
resumes the interface.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 2b73fa55c938..cb54bb7491d9 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -780,11 +780,15 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 
 	dev_info(state->dev, "--- REGISTERS ---\n");
 
+	pm_runtime_resume_and_get(state->dev);
+
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(state, registers[i].offset);
 		dev_info(state->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
 	}
 
+	pm_runtime_put(state->dev);
+
 	return 0;
 }
 
-- 
2.34.1

