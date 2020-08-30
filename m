Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9057E256F3D
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgH3P72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgH3P71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:59:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D914C061573;
        Sun, 30 Aug 2020 08:59:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 281F1258;
        Sun, 30 Aug 2020 17:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598803138;
        bh=/V6uJ2UaJxcf2LrkofPkuHLaZ/DO+zHrenXjUGNL5KA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HX+GJFDw2KI8ilmLOZtUtL7br3BsmXtFHmxTilbjKorOD10U3skl+k9V+HLn8r3Af
         k0Lx8Yj0cbRKnz/TQJya/84h10aqYCyW6/fNq4/MGMObVzHopFPYqSpXBcKjqBmUGq
         CJJjyevVTDTK5+YPc1ADTcx22nkwlA/KrsHc6ZUc=
Date:   Sun, 30 Aug 2020 18:58:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] media: uvcvideo: Fix race conditions
Message-ID: <20200830155833.GA6043@pendragon.ideasonboard.com>
References: <20200830150443.167286-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guenter,

Thank you for the patches.

On Sun, Aug 30, 2020 at 08:04:38AM -0700, Guenter Roeck wrote:
> The uvcvideo code has no lock protection against USB disconnects
> while video operations are ongoing. This has resulted in random
> error reports, typically pointing to a crash in usb_ifnum_to_if(),
> called from usb_hcd_alloc_bandwidth(). A typical traceback is as
> follows.
> 
> usb 1-4: USB disconnect, device number 3
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
> Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
> RIP: 0010:usb_ifnum_to_if+0x29/0x40
> Code: <...>
> RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
> RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
> RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
> R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
> R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
> FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
> Call Trace:
>  usb_hcd_alloc_bandwidth+0x1ee/0x30f
>  usb_set_interface+0x1a3/0x2b7
>  uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
>  uvc_video_start_streaming+0x91/0xdd [uvcvideo]
>  uvc_start_streaming+0x28/0x5d [uvcvideo]
>  vb2_start_streaming+0x61/0x143 [videobuf2_common]
>  vb2_core_streamon+0xf7/0x10f [videobuf2_common]
>  uvc_queue_streamon+0x2e/0x41 [uvcvideo]
>  uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
>  __video_do_ioctl+0x33d/0x42a
>  video_usercopy+0x34e/0x5ff
>  ? video_ioctl2+0x16/0x16
>  v4l2_ioctl+0x46/0x53
>  do_vfs_ioctl+0x50a/0x76f
>  ksys_ioctl+0x58/0x83
>  __x64_sys_ioctl+0x1a/0x1e
>  do_syscall_64+0x54/0xde
> 
> While this is problem rarely observed in the field, it is relatively easy
> to reproduce by adding msleep() calls into the code.
> 
> I don't presume to claim that I found every issue, but this patch series
> should fix at least the major problems.
> 
> The patch series was tested exensively on a Chromebook running chromeos-4.19
> and on a Linux system running a v5.8.y based kernel.

I'll review each patch individually, but I think 2/5, 4/5 and 5/5 should
be handled in the V4L2 core, not the uvcvideo driver. Otherwise we would
have to replicate that logic in all drivers, while I think it can easily
be implemented in a generic fashion as previously discussed.

> ----------------------------------------------------------------
> Guenter Roeck (5):
>       media: uvcvideo: Cancel async worker earlier
>       media: uvcvideo: Lock video streams and queues while unregistering
>       media: uvcvideo: Release stream queue when unregistering video device
>       media: uvcvideo: Protect uvc queue file operations against disconnect
>       media: uvcvideo: In uvc_v4l2_open, check if video device is registered
> 
>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
>  drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
>  drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  5 files changed, 93 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
