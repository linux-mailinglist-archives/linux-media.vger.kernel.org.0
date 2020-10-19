Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92CD293023
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 23:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732457AbgJSVAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 17:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732455AbgJSVAF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 17:00:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DFCC0613D0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 14:00:05 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf435b00546912335c7d1654.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:5469:1233:5c7d:1654])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E41A1F44FBF;
        Mon, 19 Oct 2020 22:00:04 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 1/4] media: staging: rkisp1: fix coding style issues
Date:   Mon, 19 Oct 2020 22:59:53 +0200
Message-Id: <20201019205956.6980-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix checkpatch issues:
Blank lines aren't necessary before a close brace '}'
Alignment should match open parenthesis

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c     | 4 ++--
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 1 -
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 91584695804b..4f6ae1a01253 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -254,8 +254,8 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 		struct rkisp1_sensor_async *rk_asd = NULL;
 		struct fwnode_handle *ep;
 
-		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
-			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev), 0, next_id,
+						     FWNODE_GRAPH_ENDPOINT_NEXT);
 		if (!ep)
 			break;
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index a9715b0b7264..fb23461d865c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -1157,5 +1157,4 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
 		 */
 		rkisp1_params_isr(rkisp1);
 	}
-
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 1687d82e6c68..a9d537c11ecb 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -610,8 +610,8 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 				  RKISP1_ISP_MIN_WIDTH,
 				  RKISP1_ISP_MAX_WIDTH);
 	sink_fmt->height = clamp_t(u32, format->height,
-				  RKISP1_ISP_MIN_HEIGHT,
-				  RKISP1_ISP_MAX_HEIGHT);
+				   RKISP1_ISP_MIN_HEIGHT,
+				   RKISP1_ISP_MAX_HEIGHT);
 
 	*format = *sink_fmt;
 
-- 
2.17.1

