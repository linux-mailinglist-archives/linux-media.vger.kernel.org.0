Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2594562C1D6
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 16:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbiKPPHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 10:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbiKPPH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 10:07:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDD21144A
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 07:07:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1F7CB81DC3
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 15:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4130AC433C1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 15:07:24 +0000 (UTC)
Message-ID: <3e6c8655-0c65-d673-a8dd-98d0a484b57f@xs4all.nl>
Date:   Wed, 16 Nov 2022 16:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.1] media: v4l2-dv-timings.c: fix too strict blanking
 sanity checks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sanity checks were added to verify the v4l2_bt_timings blanking fields
in order to avoid integer overflows when userspace passes weird values.

But that assumed that userspace would correctly fill in the front porch,
backporch and sync values, but sometimes all you know is the total
blanking, which is then assigned to just one of these fields.

And that can fail with these checks.

So instead set a maximum for the total horizontal and vertical
blanking and check that each field remains below that.

That is still sufficient to avoid integer overflows, but it also
allows for more flexibility in how userspace fills in these fields.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dv-timings.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dv-timings.c b/drivers/media/v4l2-core/v4l2-dv-timings.c
index fe50efe..3902edc 100644
--- a/drivers/media/v4l2-core/v4l2-dv-timings.c
+++ b/drivers/media/v4l2-core/v4l2-dv-timings.c
@@ -157,6 +157,8 @@ bool v4l2_valid_dv_timings(const struct v4l2_dv_timings *t,
 	const struct v4l2_bt_timings *bt = &t->bt;
 	const struct v4l2_bt_timings_cap *cap = &dvcap->bt;
 	u32 caps = cap->capabilities;
+	const u32 max_vert = 10240;
+	u32 max_hor = 3 * bt->width;

 	if (t->type != V4L2_DV_BT_656_1120)
 		return false;
@@ -178,14 +180,20 @@ bool v4l2_valid_dv_timings(const struct v4l2_dv_timings *t,
 	if (!bt->interlaced &&
 	    (bt->il_vbackporch || bt->il_vsync || bt->il_vfrontporch))
 		return false;
-	if (bt->hfrontporch > 2 * bt->width ||
-	    bt->hsync > 1024 || bt->hbackporch > 1024)
+	/*
+	 * Some video receivers cannot properly separate the frontporch,
+	 * backporch and sync values, and instead they only have the total
+	 * blanking. That can be assigned to any of these three fields.
+	 * So just check that none of these are way out of range.
+	 */
+	if (bt->hfrontporch > max_hor ||
+	    bt->hsync > max_hor || bt->hbackporch > max_hor)
 		return false;
-	if (bt->vfrontporch > 4096 ||
-	    bt->vsync > 128 || bt->vbackporch > 4096)
+	if (bt->vfrontporch > max_vert ||
+	    bt->vsync > max_vert || bt->vbackporch > max_vert)
 		return false;
-	if (bt->interlaced && (bt->il_vfrontporch > 4096 ||
-	    bt->il_vsync > 128 || bt->il_vbackporch > 4096))
+	if (bt->interlaced && (bt->il_vfrontporch > max_vert ||
+	    bt->il_vsync > max_vert || bt->il_vbackporch > max_vert))
 		return false;
 	return fnc == NULL || fnc(t, fnc_handle);
 }
-- 
2.10.2

