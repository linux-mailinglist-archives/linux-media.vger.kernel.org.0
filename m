Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944862AB2B4
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 09:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgKIIru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 03:47:50 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59555 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726127AbgKIIrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 03:47:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c2q0kwUcs1R0xc2q3kVuQU; Mon, 09 Nov 2020 09:47:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604911668; bh=0hAyV+UgS1S+j265q8bP06clbquB88UMruJgqex4JZ8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gNuGx6HtNb9jRu+Kxl4nJNXXVGyOIVY9/1OlIN7lJr3r7liUSA4dQLYeUKEdnNeMj
         E8ilLG4ORvtlmWn/S0Q9BKsTUM4ctinmvzRBguSeDji9Oe7AXahWTtF3u3h7yx4QaS
         E1Bby/TgJSqr/EbUHwi5tj8xqVvtoK2a19V/V/A49Fq/ocULl/dE5kjkJI7zzohTCl
         fy01uMod6tqIpW8NVQuiSq0/aaRSTC2LDasjoAfkVOoUJzKZiYwh+PNqHERwHoef7L
         fIipSk+ffIexDgWqpZmiXqBuJfeJ89kqz847uyg3euCQyCJ5X0FrDRCEB+pI2JXWvX
         aFkGQ2sE4oeZA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-compat-ioctl32.c: add missing #ifdef
 CONFIG_COMPAT_32BIT_TIMEs
Message-ID: <0c941c88-222f-8622-5eed-78bee4161aea@xs4all.nl>
Date:   Mon, 9 Nov 2020 09:47:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNNiaG4vkYMqcl4SyghmfICFmhA41LJxl+x4rqJ9M3Ix8EaaQsePR4lbxsDXzZ2h31gAriplJV4Is7Ftjrb4oAHhOze8zpQ/FoUPq5UO/j+T9r6R+E58
 JCE6Fu+RCFpa0mrnMySNFI/O2e1d/0UUWNuYTtUme+a4kY7raUOFdX67bhsJBz050wA4NfDeA08rpuVCxW7Z7xd45UtRcmSPNYyiJsQL33eU0iPiTvl9vCy1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In two places time32 structures were defined, but they are not
used if CONFIG_COMPAT_32BIT_TIME is not set. Put these two structs
under #ifdef CONFIG_COMPAT_32BIT_TIME as well to clearly indicate
that they are only used if that config option is set.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 58d29284db13..a8556c02cd50 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -304,6 +304,7 @@ struct v4l2_buffer32 {
 	__s32			request_fd;
 };

+#ifdef CONFIG_COMPAT_32BIT_TIME
 struct v4l2_buffer32_time32 {
 	__u32			index;
 	__u32			type;	/* enum v4l2_buf_type */
@@ -326,6 +327,7 @@ struct v4l2_buffer32_time32 {
 	__u32			reserved2;
 	__s32			request_fd;
 };
+#endif

 static int get_v4l2_plane32(struct v4l2_plane *p64,
 			    struct v4l2_plane32 __user *p32,
@@ -763,6 +765,7 @@ struct v4l2_event32 {
 	__u32				reserved[8];
 };

+#ifdef CONFIG_COMPAT_32BIT_TIME
 struct v4l2_event32_time32 {
 	__u32				type;
 	union {
@@ -775,6 +778,7 @@ struct v4l2_event32_time32 {
 	__u32				id;
 	__u32				reserved[8];
 };
+#endif

 static int put_v4l2_event32(struct v4l2_event *p64,
 			    struct v4l2_event32 __user *p32)
