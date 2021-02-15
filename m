Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E814D31B4D6
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBOEkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhBOEkM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:40:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DBBC061786
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:39:32 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473822CD9;
        Mon, 15 Feb 2021 05:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363345;
        bh=ZzW0TeUFrFij/GkDSGtvkKeRfDC4OM8QA3hpLWM9p48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KZ5q8CWStdmg+0F4UVjatorpKDjr1irYOOcurP/M/COxmLNnqZaMgmjzfnn109OR8
         hlLAcQbhaaIId+vjbG5s5dBFShneBPfHWozjvl42j07/rFP/kcqCseqTz7SsXg5bjU
         MG8WRQEuC9wOvRsYOZldvXYmW+HXJ1VrTQL4qyuE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 69/77] media: imx: imx7_mipi_csis: Move link setup check out of locked section
Date:   Mon, 15 Feb 2021 06:27:33 +0200
Message-Id: <20210215042741.28850-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checking if the link setup operation is called for the sink or source
pad doesn't require any locking. Move it out of the section protected by
the mutex.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a5f00983bd92..333ab3966b5b 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -668,20 +668,23 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	dev_dbg(state->dev, "link setup %s -> %s", remote_pad->entity->name,
 		local_pad->entity->name);
 
+	/* We only care about the link to the source. */
+	if (!(local_pad->flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	mutex_lock(&state->lock);
 
-	if (local_pad->flags & MEDIA_PAD_FL_SINK) {
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (state->src_sd) {
-				ret = -EBUSY;
-				goto out;
-			}
-			state->src_sd = remote_sd;
-		} else {
-			state->src_sd = NULL;
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		if (state->src_sd) {
+			ret = -EBUSY;
+			goto out;
 		}
+
+		state->src_sd = remote_sd;
+	} else {
+		state->src_sd = NULL;
 	}
 
 out:
-- 
Regards,

Laurent Pinchart

