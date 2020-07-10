Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C8B21B3F6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 13:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgGJL3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 07:29:44 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44017 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726757AbgGJL3m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 07:29:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id trDljmvzkJcNHtrDojrrDn; Fri, 10 Jul 2020 13:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594380580; bh=hPu59T3bGk39gpr6OSDWbTVQe4dHp0G2uQXOubxCgEc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YUK/s8i0YksvdCGimMSQisKstjsgVzGKbcsQKAq7P4CTyelK6EycQbkZoHYFKdJmo
         jKdlEILpUFxkPNxfpgazyEV/B7dPeZlr3aCdsIx07i8Z7JH0MRcFSRymCPd3S6mcWf
         CotMRX7vvx1MxKn1kVnXfbKipKxuu9PxUayBlxiMhvuvVgL82zzHDDByGMy9f3OOM+
         688BD5/8bUkV7ki8xyHNIEw7Ech4GYeJNWkyZvuT9F6vYaStpdDv2Zgzfma9YWKJvA
         JhY7aEFcaLPfsnWfADxuWrvcO6N2MvZxTQ7xeJ7vBFdDdBpPVA6610O09+domsOgzT
         Z23LEJBVI4v6g==
Subject: Re: [PATCH v2 100/108] media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
 <20200706183709.12238-101-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <350f2c8a-045d-3ee4-0ecf-67660590ccba@xs4all.nl>
Date:   Fri, 10 Jul 2020 13:29:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706183709.12238-101-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEZbskLdF5lvrT5gwlUAVOFJzc/RVopS4Xv373xU3BYoQ2iDII7b+pPuCjLcExUuWUBXwcKWGtGXT7OoExXZfMZW0gDrfARZ9rniLYRonqTezk3CwQ11
 nib/3An8Yi9K2KMHvxjr7veXGfyWYEccfK2vxdbJMaDNbeAChpTSOmlkHxw5WZ2fPZg/SCi8AO0xgyajG2qbuiepqFtC9TpgAVh2Tb/Sh/HQco5uPFPzDiWv
 2+wEGw5OBv4FD18N5rpCSJP1SmIw43n3OI/MwNM7KeC/qVPzRV0CbjWojJA+bWyr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/07/2020 20:37, Laurent Pinchart wrote:
> The V4L2 read/write API is inefficient and makes little sense for
> devices that handle frame-based formats. Applications shouldn't use it,
> drop its support from the driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 7eec0a57b141..775ed2fd9f1e 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -595,8 +595,7 @@ static const struct video_device cal_videodev = {
>  	.ioctl_ops	= &cal_ioctl_ops,
>  	.minor		= -1,
>  	.release	= video_device_release_empty,
> -	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> -			  V4L2_CAP_READWRITE,
> +	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
>  };
>  
>  static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
> @@ -731,7 +730,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
>  
>  	/* Initialize the vb2 queue. */
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
>  	q->drv_priv = ctx;
>  	q->buf_struct_size = sizeof(struct cal_buffer);
>  	q->ops = &cal_video_qops;
> 

You need to remove the '.read = vb2_fop_read,' as well.

Regards,

	Hans
