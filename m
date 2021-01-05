Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEE82EAED9
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbhAEPjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAEPjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:08 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80A1F1BFB;
        Tue,  5 Jan 2021 16:30:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860618;
        bh=H5jLRW3l74OmCzE0bpxyz4xPv1yPE1QLlX+TpTPbd6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zc6bmMnKVDbYhjQ6cpsIlkNyX1oGVHyH91eyBYXM8TzchhVlqOdNRB9CaTJP8TYjf
         h6bECs0h/4Xh6gkpVap07aY2HVmsh7OvrYqGHcMq1UN2EP3wsfgpCbBpX0mh+H/izj
         yd/dRrriA/m0mstmwSYcnwUyO+QFpyIB0kDbYTnI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 62/75] media: imx: imx7_mipi_csis: Make source .s_power() optional
Date:   Tue,  5 Jan 2021 17:28:39 +0200
Message-Id: <20210105152852.5733-63-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_power() subdev operation is optional, don't error out when the
source doesn't implement it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index fe8f3fdab832..75facfc85dde 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -627,7 +627,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 			return ret;
 		}
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
-		if (ret < 0)
+		if (ret < 0 && ret != -ENOIOCTLCMD)
 			return ret;
 	}
 
@@ -649,6 +649,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
 		mipi_csis_stop_stream(state);
 		state->flags &= ~ST_STREAMING;
 		if (state->debug)
-- 
Regards,

Laurent Pinchart

