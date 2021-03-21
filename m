Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2B3431C7
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 09:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCUIvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 04:51:18 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:42983 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229901AbhCUIvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 04:51:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NtnRllsEYDUxpNtnUloFWM; Sun, 21 Mar 2021 09:50:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616316657; bh=Bs2cDGmobbHXygQeILxzsOnBSLy+rh+Yupo2oXq9AAM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GsME9/od1alivJhjmmiDoFJJlgEQ5aacoagvWNcqTW84B+sCgDdkMi4K9zjRATFeG
         fylgq0V1Mdyp26Obo8G4BSC2OmCsTIkThrw77iyhfCLMgS5BLxVEtsznlFFki8gYHp
         sWvI45J+miPeG4Hous+gPCyjVT7zZR3P0L3UtuxBhVqOzpmzy9lTwdRbVvs2O/zr1g
         LzJHi9yH/Ae8RROzqcDFBId8dn2nB116CjxxGQX50M8fY/E2V/Mv2p78yVcVF92sJU
         Ay2H5vN5sqCVLon8c9mrvmZaDKr2aONEXYRJtHb9MzO+J8mdfT+xxNBlw+iEwR+ATM
         Ip3YF2VBHgpQg==
Subject: Re: [PATCH 1/2] media: v4l2-core: ignore native time32 ioctls on
 64-bit
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318134334.2933141-1-arnd@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <72a923ff-dc5c-a505-3f45-6fd935b4c6bf@xs4all.nl>
Date:   Sun, 21 Mar 2021 09:50:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318134334.2933141-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNZrmVCjVOHe+i1jDpEAo1dtv3vaU5lzBPrmPcFmqkD6JqGbICuSGk90lmKghUpQjigK53kplADQw0LKyklk8ykDEvNNScnYTUsyRa0ZkOS7zwuwJV9z
 ccME8fWPKLoyOBXpMZC2u5rH/dYqwkIRgz9muib6TtaiTAInlSZfKVDnY1NTSEy8Oapd52oiznAky2B+qsQ3oRF2Ry/r3sXPAqsjOzpP0NIROeAuq6HgUscv
 2KSbIBW9RONrwlRSudryPudb0ghQ/ZXJGhJOgnY1o8VJKTBNxIWLUzhlrnRfxSOD76njwrxmtgPDC+pvXQ2B3jxc3+8ZyPUBohhGXYFg4OASVPYZMLBh7/a/
 iYqktiaghShFSDKrjk7OmZ/bIM45XTCYhadUmLAGEcF0min3+nz9cidxue7xQOsrhV+bos67+bqZC8RCaovL9Am2qvYNa2IYfu+0JqIBbVHkphkAQSId0vma
 YNns7Emlvx6mKFOR2d0MAsI4eRowBnkkm2ZPr2mP2R07Vcl/WHWgSIFucvc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 18/03/2021 14:43, Arnd Bergmann wrote:
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
> 

This chunk doesn't apply since there is no '#ifdef CONFIG_COMPAT_32BIT_TIME' in
either the mainline kernel or the media_tree master branch.

Are we missing a patch for v4l2-subdev.c?

Regards,

	Hans
