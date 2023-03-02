Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0A316A8329
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjCBNDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjCBNDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC49199CB
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5FFE3B811F3
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FABFC4339B;
        Thu,  2 Mar 2023 13:03:47 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 15/17] media: common: saa7146: allow AUDIO ioctls for the vbi stream
Date:   Thu,  2 Mar 2023 14:03:28 +0100
Message-Id: <20230302130330.1125172-16-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The audio ioctls are just as valid for the vbi stream as
for the video stream. The saa7146 driver removed the AUDIO
capability, but that's wrong. Keep it.

This fixes a V4L2 compliance issue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 89cba6b36372..8771b31e1166 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -355,7 +355,7 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 		vfd->device_caps &=
 			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
 	else
-		vfd->device_caps &= ~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO);
+		vfd->device_caps &= ~V4L2_CAP_VIDEO_CAPTURE;
 	q->type = type == VFL_TYPE_VIDEO ? V4L2_BUF_TYPE_VIDEO_CAPTURE : V4L2_BUF_TYPE_VBI_CAPTURE;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
-- 
2.39.1

