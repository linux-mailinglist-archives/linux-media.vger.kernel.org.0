Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35504DD99C
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 13:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236196AbiCRMUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 08:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236177AbiCRMUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 08:20:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A582E1AA0
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 05:18:56 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.137])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF9C42A5;
        Fri, 18 Mar 2022 13:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647605934;
        bh=L89NUtuPW7aTO7Qju1xmKrCMY/rwBdY1euV75Y2YBsA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pw3TWffQF6fbHEdctlvCK5D7mjM5g/1VLsYXnIhplnhlOmT3XYs7UDACiJyGhyYw2
         9BZSgNkp1sYnKo63PN/vqhjk8A8yBEKIRjDTVT/U4W7Mb6OM/62wTlzvflQMYlPyQ5
         MrSWlJBQHb0BkiXWQyNBdMX1dxEUtqWag9E1y1lg=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        libcamera-devel@lists.libcamera.org,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] media: staging/intel-ipu3: Reset imgu_video_device sequence
Date:   Fri, 18 Mar 2022 17:48:25 +0530
Message-Id: <20220318121826.877187-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318121826.877187-1-umang.jain@ideasonboard.com>
References: <20220318121826.877187-1-umang.jain@ideasonboard.com>
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

Reset the sequence number of imgu_video_device on stream start.
Failing to do so results in sequence number getting incremented
for consecutive stream on/off cycles.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 0473457b4e64..d1c539cefba8 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -485,6 +485,7 @@ static int imgu_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	pipe = node->pipe;
 	imgu_pipe = &imgu->imgu_pipe[pipe];
+	atomic_set(&node->sequence, 0);
 	r = media_pipeline_start(&node->vdev.entity, &imgu_pipe->pipeline);
 	if (r < 0)
 		goto fail_return_bufs;
-- 
2.31.1

