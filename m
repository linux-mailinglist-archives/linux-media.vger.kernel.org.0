Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B7131B4D0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBOEj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:39:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBOEjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:39:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C76B1BC8;
        Mon, 15 Feb 2021 05:29:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363340;
        bh=weSjlHfdjqAzCikLeUvESKBfgWFtYo7eGUqvaTaPbzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KEDqYaXv98gDEI+3ErQbTAHRMPaHghqD8U59vZZDkHup26OSlmKip78MbHrY7zYRM
         xTGwJ7XWBBMXP/M8e6xSxXQQpaPIATymZDmzRQZTAc/LGKLqnGwnMVPso4oIfuGYBC
         bKc/GqR0n2kEYCyeDE5kZ8QSACwdJIZTqiqfZrvE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 64/77] media: imx: imx7_mipi_csis: Make source .s_power() optional
Date:   Mon, 15 Feb 2021 06:27:28 +0200
Message-Id: <20210215042741.28850-65-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_power() subdev operation is optional, don't error out when the
source doesn't implement it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 381eda94398a..c153a77c3784 100644
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

