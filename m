Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14480341201
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 02:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbhCSBS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 21:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhCSBST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 21:18:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C099C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 18:18:19 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78DA6883;
        Fri, 19 Mar 2021 02:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616116697;
        bh=xdGdAC5ph9+P0UBJ6OnARrnwRJE+49qscDmcOqb8vjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xl95MguJdzAb08HeXBv2YGpP4hVAU1+J1M8wWStU5JmaSCMlwyWAHJuFHGZ91V2Oo
         UlNc2JeQx+IRiZvHP1hJbairG89aIb1q5b2qsR6RNyQzHa3d144PEtGFje0gnVjeeJ
         Au5X+8SAxNQSd4E/geOLbh6LTkWd+qYXuSZaGPbI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH 1/3] media: imx: imx7_mipi_csis: Runtime suspend in .s_stream() error path
Date:   Fri, 19 Mar 2021 03:17:33 +0200
Message-Id: <20210319011735.26846-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the .s_stream() handler fails after calling pm_runtime_get_sync(),
call pm_runtime_put() in the error path.

While at it add a few blank lines to make the code more readable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index bd587e550d99..c6cd60896969 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -694,6 +694,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 			return ret;
 
 		mipi_csis_clear_counters(state);
+
 		ret = pm_runtime_get_sync(&state->pdev->dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(&state->pdev->dev);
@@ -701,10 +702,11 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 		}
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
-			return ret;
+			goto done;
 	}
 
 	mutex_lock(&state->lock);
+
 	if (enable) {
 		if (state->flags & ST_SUSPENDED) {
 			ret = -EBUSY;
@@ -732,7 +734,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 
 unlock:
 	mutex_unlock(&state->lock);
-	if (!enable)
+
+done:
+	if (!enable || ret < 0)
 		pm_runtime_put(&state->pdev->dev);
 
 	return ret;
-- 
Regards,

Laurent Pinchart

