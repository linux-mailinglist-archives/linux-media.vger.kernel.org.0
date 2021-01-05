Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB4B2EAEE0
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbhAEPjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:39:53 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38190 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbhAEPjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:39:53 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71FE31C0D;
        Tue,  5 Jan 2021 16:30:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860621;
        bh=G3K8VzGEsDLC76cfwp3+WmdKEKRsUIc0Qb0rtl0tj+k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oPeTXyRX4jdr5GKUgU4rGpkwMBImB3CBUNfPZCK+lF08hpyFJX1+G/31yib3VPkm8
         k3rz0hB8GEk1aIPEkJS8URmePoauKUMIKIV2rFX6N9odFuf2DNqCYiCRtgimA8JgG8
         3Jseev+YSDa4OpXDlx0niua1M4Lm6vpfSBLjSzcU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 67/75] media: imx: imx7_mipi_csis: Move link setup check out of locked section
Date:   Tue,  5 Jan 2021 17:28:44 +0200
Message-Id: <20210105152852.5733-68-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Checking if the link setup operation is called for the sink or source
pad doesn't require any locking. Move it out of the section protected by
the mutex.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 4e85611fcdc6..3c68ee8b2a59 100644
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

