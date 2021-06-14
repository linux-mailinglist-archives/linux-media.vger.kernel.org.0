Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CE43A65C3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbhFNLmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237118AbhFNLky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:40:54 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 663235EAB;
        Mon, 14 Jun 2021 13:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669851;
        bh=+PfYjgNC9p7OqF2SMuIj/vcmZa8yF8YSlPOmW3V9S5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i+vCo/NsGLScKVUyVODJOzE/c23pNjNXhVfX3Sza8zBWr8bhCCUN0tVJaPOh2fYi3
         GDj8vPcDa7mQK2RHDZuw2cvWR0kUSRTlu8eKIoCmHgJX0BjwiVQwT/7wUDg2Dm0AbL
         7NMsh39IlqYTEwFFd+np76Idn9j5vz6UiJtD3q2o=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 22/35] media: ti-vpe: cal: set field always to V4L2_FIELD_NONE
Date:   Mon, 14 Jun 2021 14:23:32 +0300
Message-Id: <20210614112345.2032435-23-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

cal_camerarx_sd_set_fmt() accepts any value for the format field, but
there should be no reason to have any other value accepted than
V4L2_FIELD_NONE. So set the field always to V4L2_FIELD_NONE.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index a8cca30f3f51..f2ea2bdb9ea3 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -705,10 +705,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	if (!fmtinfo)
 		fmtinfo = &cal_formats[0];
 
-	/*
-	 * Clamp the size, update the code. The field and colorspace are
-	 * accepted as-is.
-	 */
+	/* Clamp the size, update the code. The colorspace is accepted as-is. */
 	bpp = ALIGN(fmtinfo->bpp, 8);
 
 	format->format.width = clamp_t(unsigned int, format->format.width,
@@ -718,6 +715,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 					CAL_MIN_HEIGHT_LINES,
 					CAL_MAX_HEIGHT_LINES);
 	format->format.code = fmtinfo->code;
+	format->format.field = V4L2_FIELD_NONE;
 
 	/* Store the format and propagate it to the source pad. */
 	fmt = cal_camerarx_get_pad_format(phy, sd_state,
-- 
2.25.1

