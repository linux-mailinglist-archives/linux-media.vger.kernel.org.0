Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989726A1DD1
	for <lists+linux-media@lfdr.de>; Fri, 24 Feb 2023 15:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjBXOwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Feb 2023 09:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjBXOwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Feb 2023 09:52:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD0951F82
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 06:52:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D2AEB81C98
        for <linux-media@vger.kernel.org>; Fri, 24 Feb 2023 14:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F95C433D2;
        Fri, 24 Feb 2023 14:52:29 +0000 (UTC)
Message-ID: <98e7a971-4a46-8780-1bf0-eb87752af9f2@xs4all.nl>
Date:   Fri, 24 Feb 2023 15:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Fwd: [git:v4l-utils/master] v4l2-tracer: use __s64 instead of long
References: <E1pVZNx-007qor-Bf@www.linuxtv.org>
Content-Language: en-US
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <E1pVZNx-007qor-Bf@www.linuxtv.org>
X-Forwarded-Message-Id: <E1pVZNx-007qor-Bf@www.linuxtv.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

This one should probably go to a 1.24.1 stable release.

Sorry about that, we didn't try to build on a 32 bit system.

The good news is: people ARE using this, since it was reported within a day.

Regards,

	Hans

-------- Forwarded Message --------
Subject: [git:v4l-utils/master] v4l2-tracer: use __s64 instead of long
Date: Fri, 24 Feb 2023 14:49:00 +0000
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reply-To: linux-media@vger.kernel.org
To: linuxtv-commits@linuxtv.org

This is an automatic generated email to let you know that the following patch were queued at the http://git.linuxtv.org/cgit.cgi/v4l-utils.git tree:

Subject: v4l2-tracer: use __s64 instead of long
Author:  Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:    Fri Feb 24 15:42:59 2023 +0100

This fixes compiler errors when building on the 32 bit architecture.

They are all of this type:

../../include/linux/videodev2.h:2583:33: error: narrowing conversion of 3222820424 from unsigned int to long int [-Wnarrowing]
 2583 | #define VIDIOC_S_EXT_CTRLS      _IOWR('V', 72, struct v4l2_ext_controls)
      |                                 ^~~~~
v4l2-tracer-info-gen.h:2069:11: note: in expansion of macro VIDIOC_S_EXT_CTRLS
 2069 |         { VIDIOC_S_EXT_CTRLS,   "VIDIOC_S_EXT_CTRLS" },
      |           ^~~~~~~~~~~~~~~~~~

and:

../../include/linux/videodev2.h:2583:33: error: narrowing conversion of 3222820424 from unsigned int to long int [-Wnarrowing]
 2583 | #define VIDIOC_S_EXT_CTRLS      _IOWR('V', 72, struct v4l2_ext_controls)
      |                                 ^~~~~
retrace.cpp:1273:14: note: in expansion of macro VIDIOC_S_EXT_CTRLS
 1273 |         case VIDIOC_S_EXT_CTRLS:
      |              ^~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

 utils/v4l2-tracer/retrace.cpp          | 2 +-
 utils/v4l2-tracer/v4l2-tracer-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

---

http://git.linuxtv.org/cgit.cgi/v4l-utils.git/commit/?id=5ab5a0ee52d0b96f1750d32e4ed63e2f43d71439
diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 29ac4a38298a..8667826c0488 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -1166,7 +1166,7 @@ void retrace_media_ioc_request_alloc(int fd_retrace, json_object *ioctl_args)
  void retrace_ioctl(json_object *syscall_obj)
 {
-	long cmd = 0;
+	__s64 cmd = 0;
 	int fd_retrace = 0;
  	json_object *fd_trace_obj;
diff --git a/utils/v4l2-tracer/v4l2-tracer-common.h b/utils/v4l2-tracer/v4l2-tracer-common.h
index 0bdb125d2135..a8ca68bb21af 100644
--- a/utils/v4l2-tracer/v4l2-tracer-common.h
+++ b/utils/v4l2-tracer/v4l2-tracer-common.h
@@ -41,7 +41,7 @@
 #endif
  struct val_def {
-	long val;
+	__s64 val;
 	const char *str;
 };

_______________________________________________
linuxtv-commits mailing list
linuxtv-commits@linuxtv.org
https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-commits
