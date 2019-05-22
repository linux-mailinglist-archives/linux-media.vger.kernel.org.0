Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AE225E50
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 08:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfEVGwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 02:52:40 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:52303 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbfEVGwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 02:52:40 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TL73h27qisDWyTL76hJb1d; Wed, 22 May 2019 08:52:37 +0200
Subject: Re: [PATCH] media:usb:zr364xx:Fix KASAN:null-ptr-deref Read in
 zr364xx_vidioc_querycap
To:     Vandana BN <bnvandana@gmail.com>, royale@zerezo.com,
        mchehab@kernel.org, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190521181535.7974-1-bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c9311eeb-4cb6-e69c-8a26-7faea7e0c088@xs4all.nl>
Date:   Wed, 22 May 2019 08:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521181535.7974-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAgCbWpy3/Mf5iE6uyIh7ObpST1ZI0MlELXVDzMVOAM5s4N2waUax5FlNru1+/Av8LNMcRlwevn2yp8AUTXfT6JWENMdahG1tg7KBmzj8qYDGnX3vzE3
 Mm+eQgNaM2bAQ5zig8OtkP8f6wDRWan4EKKgCl1DWhMF/mAbAWu4rEvNuL9wrLcvRBibv85CnBvwzvHeo8vo3McSwFDEpd/no29TWWtFXiC5L74tSKnigtBC
 KRYYhWTgj/5UHdwlRpp027YgOkt6f6/6C9xsoNVFmAOvQuLk5F+g3E0L4pzAEV2Ead6GT9BFyR9+3eQnHdq68MwtQQLaqCPVfT/6ZerSdV0GGXW06bIaO+hm
 Xzq6N3RyvhGs9vMmBc3LLAMt01hFKuNIJa5ebL16+xQRHy8f+VknmDk3kBBScWvpS+/ZU8DeYBsmu0gOBGzvxOU3tt99LCqimqby/y2BIWh6p8/ddEduf1Fz
 F6ponXMjgeuIgMF8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/21/19 8:15 PM, Vandana BN wrote:
> SyzKaller hit the null pointer deref while reading from uninitialized
> udev->product in zr364xx_vidioc_querycap().
> ==================================================================
> BUG: KASAN: null-ptr-deref in read_word_at_a_time+0xe/0x20
> include/linux/compiler.h:274
> Read of size 1 at addr 0000000000000000 by task v4l_id/5287
> 
> CPU: 1 PID: 5287 Comm: v4l_id Not tainted 5.1.0-rc3-319004-g43151d6 #6
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xe8/0x16e lib/dump_stack.c:113
>   kasan_report.cold+0x5/0x3c mm/kasan/report.c:321
>   read_word_at_a_time+0xe/0x20 include/linux/compiler.h:274
>   strscpy+0x8a/0x280 lib/string.c:207
>   zr364xx_vidioc_querycap+0xb5/0x210 drivers/media/usb/zr364xx/zr364xx.c:706
>   v4l_querycap+0x12b/0x340 drivers/media/v4l2-core/v4l2-ioctl.c:1062
>   __video_do_ioctl+0x5bb/0xb40 drivers/media/v4l2-core/v4l2-ioctl.c:2874
>   video_usercopy+0x44e/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3056
>   v4l2_ioctl+0x14e/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:364
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xced/0x12f0 fs/ioctl.c:696
>   ksys_ioctl+0xa0/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x74/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xcf/0x4f0 arch/x86/entry/common.c:290
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f3b56d8b347
> Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff
> ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
> RSP: 002b:00007ffe005d5d68 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f3b56d8b347
> RDX: 00007ffe005d5d70 RSI: 0000000080685600 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000400884
> R13: 00007ffe005d5ec0 R14: 0000000000000000 R15: 0000000000000000
> ==================================================================
> 
> For this device udev->product is not initialized and accessing it causes a NULL pointer deref.
> 
> The fix is to check for NULL before strscpy() and copy empty string, if
> product is NULL
> 
> Reported-by: syzbot+66010012fd4c531a1a96@syzkaller.appspotmail.com
> 
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  drivers/media/usb/zr364xx/zr364xx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
> index 96fee8d5b865..401a1e55dbe1 100644
> --- a/drivers/media/usb/zr364xx/zr364xx.c
> +++ b/drivers/media/usb/zr364xx/zr364xx.c
> @@ -703,7 +703,10 @@ static int zr364xx_vidioc_querycap(struct file *file, void *priv,
>  	struct zr364xx_camera *cam = video_drvdata(file);
>  
>  	strscpy(cap->driver, DRIVER_DESC, sizeof(cap->driver));
> -	strscpy(cap->card, cam->udev->product, sizeof(cap->card));
> +	if (cam->udev->product)
> +		strscpy(cap->card, cam->udev->product, sizeof(cap->card));
> +	else
> +		strscpy(cap->card, "", sizeof(cap->card));

You can drop the 'else' part since cap->card is already zeroed by the
V4L2 core framework. Looks good otherwise!

Regards,

	Hans

>  	strscpy(cap->bus_info, dev_name(&cam->udev->dev),
>  		sizeof(cap->bus_info));
>  	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
> 

