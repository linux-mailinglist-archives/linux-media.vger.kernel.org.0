Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD275626BB
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbiF3XKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiF3XKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:10:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11AC37A9C
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:10:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9ECB29F3;
        Fri,  1 Jul 2022 01:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630480;
        bh=vM+Q5vUk3nCD2h953d/yNGgWUWEpVhZ4V2w1vUhHO6U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EH7rexm0Wd2yv/QAYR+xWO/A+mCRWceabWjGSG+Cjcsy/qqCEoPvHgQd0YC+oWoJo
         w2tMlLHWvYsJ+Epm7X5ggtmOvJ4C8GncKY74Yo9LURkOiDw5rO9aUtOJFuTSRRbBwJ
         bwNwvfEoFrj2KlXuzwWhOPEjc1+UwqhTMKrTZB3g=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 35/55] media: rkisp1: isp: Fix whitespace issues
Date:   Fri,  1 Jul 2022 02:06:53 +0300
Message-Id: <20220630230713.10580-36-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing blank lines after variable declaration blocks, and fix
indentation issues.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 53f0516594ef..944d7bfa9b41 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -79,7 +79,8 @@ rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
 {
 	struct v4l2_subdev_state state = {
 		.pads = isp->pad_cfg
-		};
+	};
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&isp->sd, sd_state, pad);
 	else
@@ -93,7 +94,8 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
 {
 	struct v4l2_subdev_state state = {
 		.pads = isp->pad_cfg
-		};
+	};
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_crop(&isp->sd, sd_state, pad);
 	else
@@ -893,8 +895,8 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
+
 	event.u.frame_sync.frame_sequence = isp->frame_sequence;
-
 	v4l2_event_queue(isp->sd.devnode, &event);
 }
 
-- 
Regards,

Laurent Pinchart

