Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC2334085B
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 16:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhCRPBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 11:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbhCRPB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 11:01:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0C1C06174A;
        Thu, 18 Mar 2021 08:01:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CF78E6;
        Thu, 18 Mar 2021 16:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616079677;
        bh=ewgOcC8vQRcX5sjpoUb5TcgjDLnQNUCYxbvY2N7vYcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNukSGLMu8aWeM8pf/K4UQaTz4i0wM4T0Xl9N/eOzm01m5jy1FotcLFK3JyMvKdfk
         YOPo2hmfYZOytk8WU1UTLg0UkJWRi8ON8MxAMoUbfVfy4gwmBR2GC8F28xRab+OyIQ
         KmCv7tdYUaPMrHgoztS9lLCrfnGz0L/vspJ6yt3E=
Date:   Thu, 18 Mar 2021 17:00:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: v4l2-core: ignore native time32 ioctls on
 64-bit
Message-ID: <YFNrF5ebp9QUvKQh@pendragon.ideasonboard.com>
References: <20210318134334.2933141-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210318134334.2933141-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Thu, Mar 18, 2021 at 02:43:18PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Syzbot found that passing ioctl command 0xc0505609 into a 64-bit
> kernel from a 32-bit process causes uninitialized kernel memory to
> get passed to drivers instead of the user space data:
> 
> BUG: KMSAN: uninit-value in check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
> BUG: KMSAN: uninit-value in video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
> CPU: 0 PID: 19595 Comm: syz-executor.4 Not tainted 5.11.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:120
>  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
>  check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
>  video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
>  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
>  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
>  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
>  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
>  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
>  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
>  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
>  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> 
> The time32 commands are defined but were never meant to be called on
> 64-bit machines, as those have always used time64 interfaces.  I missed
> this in my patch that introduced the time64 handling on 32-bit platforms.
> 
> The problem in this case is the mismatch of one function checking for
> the numeric value of the command and another function checking for the
> type of process (native vs compat) instead, with the result being that
> for this combination, nothing gets copied into the buffer at all.
> 
> Avoid this by only trying to convert the time32 commands when running
> on a 32-bit kernel where these are defined in a meaningful way.
> 
> Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for time64 ABI")
> Reported-by: syzbot+142888ffec98ab194028@syzkaller.appspotmail.com
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

v4l2_event vs. v4l2_event32 vs. v4l2_event_time32 vs.
v4l2_event32_time32 is a bit confusing. Do I understand correctly that
the code below runs for the non-compat path, thus native userspace
(32-bit on 32-bit machines, 64-bit on 64-bit machines), and handles the
case of a native userspace using a 32-bit time ? If so it indeed doesn't
make sense for 64-bit machines.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This patch adds two more changes than the version that Hans tested
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 6 +++---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 31d1342e61e8..2b1bb68dc27f 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3115,7 +3115,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  static unsigned int video_translate_cmd(unsigned int cmd)
>  {
>  	switch (cmd) {
> -#ifdef CONFIG_COMPAT_32BIT_TIME
> +#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  	case VIDIOC_DQEVENT_TIME32:
>  		return VIDIOC_DQEVENT;
>  	case VIDIOC_QUERYBUF_TIME32:
> @@ -3169,7 +3169,7 @@ static int video_get_user(void __user *arg, void *parg,
>  		err = v4l2_compat_get_user(arg, parg, cmd);
>  	} else {
>  		switch (cmd) {
> -#ifdef CONFIG_COMPAT_32BIT_TIME
> +#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  		case VIDIOC_QUERYBUF_TIME32:
>  		case VIDIOC_QBUF_TIME32:
>  		case VIDIOC_DQBUF_TIME32:
> @@ -3224,7 +3224,7 @@ static int video_put_user(void __user *arg, void *parg,
>  		return v4l2_compat_put_user(arg, parg, cmd);
>  
>  	switch (cmd) {
> -#ifdef CONFIG_COMPAT_32BIT_TIME
> +#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  	case VIDIOC_DQEVENT_TIME32: {
>  		struct v4l2_event *ev = parg;
>  		struct v4l2_event_time32 ev32;
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 336133dbc759..9f5573d3b857 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -428,7 +428,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
>  
> -#ifdef CONFIG_COMPAT_32BIT_TIME
> +#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  	case VIDIOC_DQEVENT_TIME32: {
>  		struct v4l2_event_time32 *ev32 = arg;
>  		struct v4l2_event ev = { };

-- 
Regards,

Laurent Pinchart
