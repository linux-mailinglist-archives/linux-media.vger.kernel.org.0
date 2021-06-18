Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4167F3AC8ED
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhFRKhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:37:15 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:57209 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbhFRKhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:37:13 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 15IAYJqk033979;
        Fri, 18 Jun 2021 19:34:19 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Fri, 18 Jun 2021 19:34:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 15IAYJgI033976
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Jun 2021 19:34:19 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: [PATCH] media: v4l2-ioctl: explicitly initialize argument buffer
To:     mchehab@kernel.org, linux-media@vger.kernel.org
References: <0000000000005ace4405bda4af71@google.com>
Cc:     syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>,
        arnd@arndb.de, glider@google.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com, sergey.senozhatsky@gmail.com,
        syzkaller-bugs@googlegroups.com, yepeilin.cs@gmail.com
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <9c393beb-c45b-6dc3-9955-867c6abffdc4@I-love.SAKURA.ne.jp>
Date:   Fri, 18 Jun 2021 19:34:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0000000000005ace4405bda4af71@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KMSAN complains that ioctl(VIDIOC_QUERYBUF_TIME32) copies uninitialized
kernel stack memory to userspace [1], for video_usercopy() calls
copy_to_user() even if __video_do_ioctl() returned -EINVAL error.

Generally, copy_to_user() needn't be called when there was an error.
But video_usercopy() has always_copy logic which forces copy_to_user().
Therefore, instead of not calling copy_to_user(), explicitly initialize
argument buffer.

  ----------
  /* Compile for 32bit userspace and run on 64bit kernel. */
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <sys/ioctl.h>
  #define VIDIOC_QUERYBUF_TIME32 0xc0505609

  int main(int argc, char *argv[])
  {
          char buf[128] = { };

          ioctl(open("/dev/video0", O_RDONLY), VIDIOC_QUERYBUF_TIME32, &buf);
          return 0;
  }
  ----------

Link: https://syzkaller.appspot.com/bug?id=eb945b02a7b3060a8a60dab673c02f3ab20a048b [1]
Reported-by: syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..ba204e0200d3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3240,7 +3240,7 @@ long
 video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	       v4l2_kioctl func)
 {
-	char	sbuf[128];
+	char	sbuf[128] = { };
 	void    *mbuf = NULL, *array_buf = NULL;
 	void	*parg = (void *)arg;
 	long	err  = -EINVAL;
@@ -3258,7 +3258,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 			parg = sbuf;
 		} else {
 			/* too big to allocate from stack */
-			mbuf = kmalloc(ioc_size, GFP_KERNEL);
+			mbuf = kzalloc(ioc_size, GFP_KERNEL);
 			if (NULL == mbuf)
 				return -ENOMEM;
 			parg = mbuf;
-- 
2.18.4


