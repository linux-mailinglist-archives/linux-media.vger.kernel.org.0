Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C28686B3B
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbjBAQMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjBAQMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:12:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F289F6A735
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:11:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9022D6185D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413AEC433EF;
        Wed,  1 Feb 2023 16:11:57 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 2/8] v4l2-dev.c: check for V4L2_CAP_STREAMING to enable streaming ioctls
Date:   Wed,  1 Feb 2023 17:11:47 +0100
Message-Id: <20230201161153.883376-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
References: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Rather than checking which device type it is, just check the STREAMING
cap since that indicates support for streaming ioctls.

Some drivers only support READWRITE (typically MPEG encoders).

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 397d553177fa..f81279492682 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -556,6 +556,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
+	bool has_streaming = vdev->device_caps & V4L2_CAP_STREAMING;
 
 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
@@ -708,8 +709,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
 	}
 
-	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
-		/* ioctls valid for video, vbi, sdr, touch and metadata */
+	if (has_streaming) {
+		/* ioctls valid for streaming I/O */
 		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
 		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
 		SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
-- 
2.39.0

