Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C94341202
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 02:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhCSBS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 21:18:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49458 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbhCSBST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 21:18:19 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BBCB8EF;
        Fri, 19 Mar 2021 02:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616116698;
        bh=8wobHnLU0tU9h4tXnR1eyGDtpiX5NaW061VlqAl/XC8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RvNcJ/qUYzk5+/dlAg8qKGAPEQCifoI/xuyiDqFfsMudSvl7E3ywCRNL6uFxgaHh1
         byQmU7xNlyl4KHmbuJbGNx9HSjqo882BYEsHly07g0A5BOPJFEhjyONCSgNQO0CdmI
         PmkIIAI3FE8wPoWS9zFFqfb4sGxXAIBRSD36qss4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH 2/3] media: imx: imx7_mipi_csis: Don't take state->lock in .link_setup()
Date:   Fri, 19 Mar 2021 03:17:34 +0200
Message-Id: <20210319011735.26846-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .link_setup() handler uses state->lock to protect the src_sd field.
This is only used in mipi_csis_s_stream(), which can't race
.link_setup() as the MC core prevents link setup when the pipeline is
streaming. Drop the lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index c6cd60896969..21774f3e66e0 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -749,7 +749,6 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	struct v4l2_subdev *mipi_sd = media_entity_to_v4l2_subdev(entity);
 	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
 	struct v4l2_subdev *remote_sd;
-	int ret = 0;
 
 	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
 		local_pad->entity->name);
@@ -760,22 +759,16 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mutex_lock(&state->lock);
-
 	if (flags & MEDIA_LNK_FL_ENABLED) {
-		if (state->src_sd) {
-			ret = -EBUSY;
-			goto out;
-		}
+		if (state->src_sd)
+			return -EBUSY;
 
 		state->src_sd = remote_sd;
 	} else {
 		state->src_sd = NULL;
 	}
 
-out:
-	mutex_unlock(&state->lock);
-	return ret;
+	return 0;
 }
 
 static struct v4l2_mbus_framefmt *
-- 
Regards,

Laurent Pinchart

