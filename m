Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F9E2EAEE4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbhAEPkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:40:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbhAEPkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:40:09 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FE346EF;
        Tue,  5 Jan 2021 16:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860623;
        bh=Bbiy1oO1FU4UKvystFTI6ciQ6tZpfGd8tQF0c/m+LJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lG826612VFyppxaDwixT7Pr7HGoP5iVWiRnD/z81JP6+iXx6LyCJeRp4brv739NHy
         cGtTFVG+r4SaAT/YN1f0bX39MD9xYQlaQaxuZYGcmc9cIQsBNTBeZWVqvlCeBC4reh
         Qf20deRC3BNDJWL0+Cv6hfnkDdZIpUnC7oq2Zuw0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 69/75] media: imx: imx7_mipi_csis: Turn register access macros into functions
Date:   Tue,  5 Jan 2021 17:28:46 +0200
Message-Id: <20210105152852.5733-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make it easier to instrument register access (for instance with
printk-based logging) by turning the macros into inline functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index c83450ac37fa..63424a81c800 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -362,8 +362,15 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	}
 };
 
-#define mipi_csis_write(__csis, __r, __v) writel(__v, (__csis)->regs + (__r))
-#define mipi_csis_read(__csis, __r) readl((__csis)->regs + (__r))
+static inline void mipi_csis_write(struct csi_state *state, u32 reg, u32 val)
+{
+	writel(val, state->regs + reg);
+}
+
+static inline u32 mipi_csis_read(struct csi_state *state, u32 reg)
+{
+	return readl(state->regs + reg);
+}
 
 static int mipi_csis_dump_regs(struct csi_state *state)
 {
-- 
Regards,

Laurent Pinchart

