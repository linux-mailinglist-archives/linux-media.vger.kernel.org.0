Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5FC365872
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbhDTMGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhDTMF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:05:59 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25DAF1254;
        Tue, 20 Apr 2021 14:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920326;
        bh=gf+bon0OI/jGftjulu0tCkHeb8u4RyyV9Ffk8v70suQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WSfH2u34itMSXDq6aSq+nbr9U61cUCLrRUIit/onw2UoOTYL8cLey+IRpHw7cxHaN
         Y7dWW9NUL+Uds7vqQo/M8n4AY6OWBrFh7Vt6L2d0FG+TEx/ejhOVNr8j+EUHWLDttI
         i+vKeRxKm8VeadJppdc3BAMIInCQwCHqTXGG3WnU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 22/35] media: ti-vpe: cal: set field always to V4L2_FIELD_NONE
Date:   Tue, 20 Apr 2021 15:04:20 +0300
Message-Id: <20210420120433.902394-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_camerarx_sd_set_fmt() accepts any value for the format field, but
there should be no reason to have any other value accepted than
V4L2_FIELD_NONE. So set the field always to V4L2_FIELD_NONE.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 5b460b3ad94c..c5b5cc4d19f5 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -704,10 +704,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	if (!fmtinfo)
 		fmtinfo = &cal_formats[0];
 
-	/*
-	 * Clamp the size, update the code. The field and colorspace are
-	 * accepted as-is.
-	 */
+	/* Clamp the size, update the code. The colorspace is accepted as-is. */
 	bpp = ALIGN(fmtinfo->bpp, 8);
 
 	format->format.width = clamp_t(unsigned int, format->format.width,
@@ -717,6 +714,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 					CAL_MIN_HEIGHT_LINES,
 					CAL_MAX_HEIGHT_LINES);
 	format->format.code = fmtinfo->code;
+	format->format.field = V4L2_FIELD_NONE;
 
 	/* Store the format and propagate it to the source pad. */
 	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
-- 
2.25.1

