Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471EA183D8F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgCLXrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:47:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgCLXrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:47:40 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FF02134B;
        Fri, 13 Mar 2020 00:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584056857;
        bh=Z297vDytqdP9lkVnl7CgvG3IzCVlQAabrm6SIcDcmL4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eSDycGCXAGFmY4kf0cj6Vp9sTdq301lkN563CLn0RbfG89jMSbE8LEzY3D4L4iaUS
         CPTPbvtwW6p4Lu9zd71nJN6dPhZnWM07iv1I339abDDLAYkVgucrsVTVzXyNRS8rBA
         QihgfRAt9GFT+lr59M77kGu1anDPjhpjU6NdrUBo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 11/14] media: imx: imx7-mipi-csis: Remove link setup on source pad
Date:   Fri, 13 Mar 2020 01:47:19 +0200
Message-Id: <20200312234722.23483-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver rejects enablement of multiple links on its source pad. This
isn't needed, as the CSIS doesn't care. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 40004a98f801..7112969d1cf4 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -254,7 +254,6 @@ struct csi_state {
 
 	struct csis_hw_reset hw_reset;
 	struct regulator *mipi_phy_regulator;
-	bool sink_linked;
 };
 
 struct csis_pix_format {
@@ -675,17 +674,7 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 
 	mutex_lock(&state->lock);
 
-	if (local_pad->flags & MEDIA_PAD_FL_SOURCE) {
-		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (state->sink_linked) {
-				ret = -EBUSY;
-				goto out;
-			}
-			state->sink_linked = true;
-		} else {
-			state->sink_linked = false;
-		}
-	} else {
+	if (local_pad->flags & MEDIA_PAD_FL_SINK) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
 			if (state->src_sd) {
 				ret = -EBUSY;
-- 
Regards,

Laurent Pinchart

