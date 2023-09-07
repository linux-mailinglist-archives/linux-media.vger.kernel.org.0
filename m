Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97115797A62
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 19:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245180AbjIGRjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 13:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245183AbjIGRjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 13:39:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F5692
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 10:38:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E13FC433A9;
        Thu,  7 Sep 2023 08:54:33 +0000 (UTC)
Message-ID: <e16699e5-dc65-4f59-9c88-a1990c4375bb@xs4all.nl>
Date:   Thu, 7 Sep 2023 10:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: Documentation: dv-timings.rst: explain basic approach
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Explain how the DV Timings API and the V4L2_EVENT_SOURCE_CHANGE
event work together to handle video source changes.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/dv-timings.rst b/Documentation/userspace-api/media/v4l/dv-timings.rst
index e17f056b129f..4b19bcb4bd80 100644
--- a/Documentation/userspace-api/media/v4l/dv-timings.rst
+++ b/Documentation/userspace-api/media/v4l/dv-timings.rst
@@ -33,6 +33,27 @@ current DV timings they use the
 the DV timings as seen by the video receiver applications use the
 :ref:`VIDIOC_QUERY_DV_TIMINGS` ioctl.

+When the hardware detects a video source change (e.g. the video
+signal appears or disappears, or the video resolution changes), then
+it will issue a `V4L2_EVENT_SOURCE_CHANGE` event. Use the
+:ref:`ioctl VIDIOC_SUBSCRIBE_EVENT <VIDIOC_SUBSCRIBE_EVENT>` and the
+:ref:`VIDIOC_DQEVENT` to check if this event was reported.
+
+If the video signal changed, then the application has to stop
+streaming, free all buffers, and call the :ref:`VIDIOC_QUERY_DV_TIMINGS`
+to obtain the new video timings, and if they are valid, it can set
+those by calling the :ref:`ioctl VIDIOC_S_DV_TIMINGS <VIDIOC_G_DV_TIMINGS>`.
+This will also update the format, so use the :ref:`ioctl VIDIOC_G_FMT <VIDIOC_G_FMT>`
+to obtain the new format. Now the application can allocate new buffers
+and start streaming again.
+
+The :ref:`VIDIOC_QUERY_DV_TIMINGS` will just report what the
+hardware detects, it will never change the configuration. If the
+currently set timings and the actually detected timings differ, then
+typically this will mean that you will not be able to capture any
+video. The correct approach is to rely on the `V4L2_EVENT_SOURCE_CHANGE`
+event so you know when something changed.
+
 Applications can make use of the :ref:`input-capabilities` and
 :ref:`output-capabilities` flags to determine whether the digital
 video ioctls can be used with the given input or output.
