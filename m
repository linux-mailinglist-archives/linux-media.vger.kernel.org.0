Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53AF3A6155
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbhFNKqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:46:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234077AbhFNKoE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:44:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E1316143D;
        Mon, 14 Jun 2021 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623666970;
        bh=h6jahKwcgZr9GHnO++ojYKPMb/hANxKqOaLsulGV0cw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hdmw+RaWDAUtg6WB+y1SEBsQw8RvUG7CDnj/Rdx1iZyeadzC7rxHI9ULY0QLD2qb0
         MqIVvQG9wNxrSTyixKIj/FwMreZPd2rXiFf36pyzF8jfbaiSHKDI45GemmJUz6ri3Q
         NdUbkmrpwbECHcSBeN3p9Xf4UjWjDd9rtBudb9FNkLoAmjwLiU6Fa28IUE5Ny5OWkr
         jNg4ws15d3SZ244Jhy3DeYqPdqYCgjvPBcv0msWRtBCPu5sLrOzzQFKRq/LY+mkQes
         WKt//xYix/oygERhfUrQAZeYfNcqklEJ9OVsxy50Kw1IXReN68IZt5mBobgRfPD6AP
         h3SNMx0m9bH4Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com
Subject: [PATCH v3 1/8] media: v4l2-core: ignore native time32 ioctls on 64-bit
Date:   Mon, 14 Jun 2021 12:34:02 +0200
Message-Id: <20210614103409.3154127-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210614103409.3154127-1-arnd@kernel.org>
References: <20210614103409.3154127-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Syzbot found that passing ioctl command 0xc0505609 into a 64-bit
kernel from a 32-bit process causes uninitialized kernel memory to
get passed to drivers instead of the user space data:

BUG: KMSAN: uninit-value in check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
BUG: KMSAN: uninit-value in video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
CPU: 0 PID: 19595 Comm: syz-executor.4 Not tainted 5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
 video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
 video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
 v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
 v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
 __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
 __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
 __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
 do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

The time32 commands are defined but were never meant to be called on
64-bit machines, as those have always used time64 interfaces.  I missed
this in my patch that introduced the time64 handling on 32-bit platforms.

The problem in this case is the mismatch of one function checking for
the numeric value of the command and another function checking for the
type of process (native vs compat) instead, with the result being that
for this combination, nothing gets copied into the buffer at all.

Avoid this by only trying to convert the time32 commands when running
on a 32-bit kernel where these are defined in a meaningful way.

Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for time64 ABI")
Reported-by: syzbot+142888ffec98ab194028@syzkaller.appspotmail.com
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This patch adds two more changes than the version that Hans tested
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..58df927aec7e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3073,7 +3073,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 static unsigned int video_translate_cmd(unsigned int cmd)
 {
 	switch (cmd) {
-#ifdef CONFIG_COMPAT_32BIT_TIME
+#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	case VIDIOC_DQEVENT_TIME32:
 		return VIDIOC_DQEVENT;
 	case VIDIOC_QUERYBUF_TIME32:
@@ -3127,7 +3127,7 @@ static int video_get_user(void __user *arg, void *parg,
 		err = v4l2_compat_get_user(arg, parg, cmd);
 	} else {
 		switch (cmd) {
-#ifdef CONFIG_COMPAT_32BIT_TIME
+#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 		case VIDIOC_QUERYBUF_TIME32:
 		case VIDIOC_QBUF_TIME32:
 		case VIDIOC_DQBUF_TIME32:
@@ -3182,7 +3182,7 @@ static int video_put_user(void __user *arg, void *parg,
 		return v4l2_compat_put_user(arg, parg, cmd);
 
 	switch (cmd) {
-#ifdef CONFIG_COMPAT_32BIT_TIME
+#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
 	case VIDIOC_DQEVENT_TIME32: {
 		struct v4l2_event *ev = parg;
 		struct v4l2_event_time32 ev32;
-- 
2.29.2

