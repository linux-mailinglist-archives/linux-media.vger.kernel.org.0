Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C07256FFC2
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 13:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiGKLMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 07:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiGKLMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 07:12:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD5C32D96
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 03:21:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2726061375
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 10:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F0C341C0;
        Mon, 11 Jul 2022 10:21:24 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 7/8] v4l2-ctrls: add change flag for when dimensions change
Date:   Mon, 11 Jul 2022 12:21:10 +0200
Message-Id: <20220711102111.2688139-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711102111.2688139-1-hverkuil-cisco@xs4all.nl>
References: <20220711102111.2688139-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new V4L2_EVENT_CTRL_CH_DIMENSIONS change flag that is issued
when the dimensions of an array change as a result of a
__v4l2_ctrl_modify_dimensions() call.

This will inform userspace that there are new dimensions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/vidioc-dqevent.rst     | 5 +++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c                     | 3 ++-
 include/uapi/linux/videodev2.h                               | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
index 6eb40073c906..8db103760930 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
@@ -332,6 +332,11 @@ call.
       - 0x0004
       - This control event was triggered because the minimum, maximum,
 	step or the default value of the control changed.
+    * - ``V4L2_EVENT_CTRL_CH_DIMENSIONS``
+      - 0x0008
+      - This control event was triggered because the dimensions of the
+	control changed. Note that the number of dimensions remains the
+	same.
 
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.5cm}|
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0b91200776f8..274474425b05 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -506,6 +506,7 @@ replace define V4L2_EVENT_PRIVATE_START event-type
 replace define V4L2_EVENT_CTRL_CH_VALUE ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_FLAGS ctrl-changes-flags
 replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
+replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
 
 replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 878da8592106..67fbdccda2d8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1020,7 +1020,8 @@ int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
 	for (i = 0; i < elems; i++)
 		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
 	cur_to_new(ctrl);
-	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
+	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE |
+			       V4L2_EVENT_CTRL_CH_DIMENSIONS);
 	return 0;
 }
 EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9018aa984db3..3971af623c56 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -2398,6 +2398,7 @@ struct v4l2_event_vsync {
 #define V4L2_EVENT_CTRL_CH_VALUE		(1 << 0)
 #define V4L2_EVENT_CTRL_CH_FLAGS		(1 << 1)
 #define V4L2_EVENT_CTRL_CH_RANGE		(1 << 2)
+#define V4L2_EVENT_CTRL_CH_DIMENSIONS		(1 << 3)
 
 struct v4l2_event_ctrl {
 	__u32 changes;
-- 
2.35.1

