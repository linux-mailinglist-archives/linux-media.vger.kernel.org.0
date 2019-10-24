Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF4A5E2765
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 02:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392853AbfJXAmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 20:42:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52428 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392851AbfJXAmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 20:42:07 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F05397D;
        Thu, 24 Oct 2019 02:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571877725;
        bh=fct2kCB0QuEcOtSb7DIkWbkqvBb8wKdLO4CaVvexYv0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bS4TIVJ479+zSDFbMgCp0xM4UJVRAr2hVKYNzH8/Ywe4f/AAOYLHdjYrvFIYGi1Ie
         XKwyAPxmmFTD4pa4STcAGu8tQacIvguyLHGBE55hmCV7YDg47tfnT8IFkGHzJ3yl1X
         fY71Y4r10feJw1TJuaLKnyAQWBvFSPIauEdFxKMI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 1/7] media: imx: imx7_mipi_csis: Power off the source when stopping streaming
Date:   Thu, 24 Oct 2019 03:41:49 +0300
Message-Id: <20191024004155.32068-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_stream() implementation incorrectly powers on the source when
stopping the stream. Power it off instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 73d8354e618c..66407b228f8e 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -577,7 +577,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 		state->flags |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
-		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
+		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
 		mipi_csis_stop_stream(state);
 		state->flags &= ~ST_STREAMING;
 		if (state->debug)
-- 
Regards,

Laurent Pinchart

