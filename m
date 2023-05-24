Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E9870F5F2
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbjEXMMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjEXML7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:11:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D3795
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:11:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC9C163C9A
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93560C4339B;
        Wed, 24 May 2023 12:11:56 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 4/8] media: platform: renesas-ceu: drop buf NULL check
Date:   Wed, 24 May 2023 14:11:46 +0200
Message-Id: <20230524121150.435736-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since start_streaming is only called if there are at least two
buffers queued, the ceudev->capture list will never be empty, so
the check whether there are no buffers can be dropped.

Note that the '!buf' check was wrong in any case, if we wanted to
check for an empty list it should have used list_empty().

This fixes this smatch warning:

drivers/media/platform/renesas/renesas-ceu.c:705 ceu_start_streaming() warn: can 'buf' even be NULL?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/platform/renesas/renesas-ceu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
index 56b9c59cfda8..5c9e27f8c94b 100644
--- a/drivers/media/platform/renesas/renesas-ceu.c
+++ b/drivers/media/platform/renesas/renesas-ceu.c
@@ -702,12 +702,6 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 	/* Grab the first available buffer and trigger the first capture. */
 	buf = list_first_entry(&ceudev->capture, struct ceu_buffer,
 			       queue);
-	if (!buf) {
-		spin_unlock_irqrestore(&ceudev->lock, irqflags);
-		dev_dbg(ceudev->dev,
-			"No buffer available for capture.\n");
-		goto error_stop_sensor;
-	}
 
 	list_del(&buf->queue);
 	ceudev->active = &buf->vb;
@@ -722,9 +716,6 @@ static int ceu_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	return 0;
 
-error_stop_sensor:
-	v4l2_subdev_call(v4l2_sd, video, s_stream, 0);
-
 error_return_bufs:
 	spin_lock_irqsave(&ceudev->lock, irqflags);
 	list_for_each_entry(buf, &ceudev->capture, queue)
-- 
2.39.2

