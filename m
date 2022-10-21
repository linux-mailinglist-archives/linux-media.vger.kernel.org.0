Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 577316076D3
	for <lists+linux-media@lfdr.de>; Fri, 21 Oct 2022 14:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiJUMVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Oct 2022 08:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiJUMVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Oct 2022 08:21:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB5F10F886
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 05:21:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 882D5B82B1D
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 12:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1734AC433C1
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 12:21:26 +0000 (UTC)
Message-ID: <7700c23b-ceac-c6e2-d004-98469a1ddad4@xs4all.nl>
Date:   Fri, 21 Oct 2022 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v6.1] vivid: fix control handler mutex deadlock
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

vivid_update_format_cap() can be called from an s_ctrl callback.
In that case (keep_controls == true) no control framework functions
can be called that take the control handler mutex.

The new call to v4l2_ctrl_modify_dimensions() did exactly that.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 6bc7643d1b9c (media: vivid: add pixel_array test control)
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 86b158eeb2d8..8ae43da9bfba 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -460,6 +460,14 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 	tpg_s_pixel_aspect(&dev->tpg, vivid_get_pixel_aspect(dev));
 	tpg_update_mv_step(&dev->tpg);
+
+	/*
+	 * We can be called from within s_ctrl, in that case we can't
+	 * modify controls. Luckily we don't need to in that case.
+	 */
+	if (keep_controls)
+		return;
+
 	dims[0] = roundup(dev->src_rect.width, PIXEL_ARRAY_DIV);
 	dims[1] = roundup(dev->src_rect.height, PIXEL_ARRAY_DIV);
 	v4l2_ctrl_modify_dimensions(dev->pixel_array, dims);
-- 
2.35.1

