Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8844A22E30B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgGZWLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgGZWLG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:11:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20780C0619D2;
        Sun, 26 Jul 2020 15:11:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F85051D;
        Mon, 27 Jul 2020 00:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595801464;
        bh=RjRackuP7ppvbWcf8GQqwdpQm304xRlLj+BnHq8KwrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWX7qbUtDABljqUxc29jNYY6LFIWwzzNovCteIYAyrBJ22N89q+e2GzcIQpzHfP2T
         oZ6HFGXANO1MerJUPuk6YwCymvy94eVW5a0mujqkvrPBTn8Fiy2x+K5rIOxThhKaxQ
         mLu3LMMbHJLGkOzwDKP2TVG4oK8KmEVNcUnYJtCI=
Date:   Mon, 27 Jul 2020 01:10:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726221056.GJ28704@pendragon.ideasonboard.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726220557.102300-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200726220557.102300-1-yepeilin.cs@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peilin,

Thank you for the patch.

On Sun, Jul 26, 2020 at 06:05:57PM -0400, Peilin Ye wrote:
> video_put_user() is copying uninitialized stack memory to userspace. Fix
> it by initializing `ev32` and `vb32` using memset().

How about mentioning that this is caused by the compiler not
initializing the holes ? Maybe something along the lines of

video_put_user() is copying uninitialized stack memory to userspace due
to the compiler not initializing holes in the structures declared on the
stack. Fix it by initializing the structures using memset().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Change in v2:
>     - Do the same thing for `case VIDIOC_DQEVENT_TIME32`.
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 50 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a556880f225a..e3a25ea913ac 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3189,14 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  #ifdef CONFIG_COMPAT_32BIT_TIME
>  	case VIDIOC_DQEVENT_TIME32: {
>  		struct v4l2_event *ev = parg;
> -		struct v4l2_event_time32 ev32 = {
> -			.type		= ev->type,
> -			.pending	= ev->pending,
> -			.sequence	= ev->sequence,
> -			.timestamp.tv_sec  = ev->timestamp.tv_sec,
> -			.timestamp.tv_nsec = ev->timestamp.tv_nsec,
> -			.id		= ev->id,
> -		};
> +		struct v4l2_event_time32 ev32;
> +
> +		memset(&ev32, 0, sizeof(ev32));
> +
> +		ev32.type	= ev->type;
> +		ev32.pending	= ev->pending;
> +		ev32.sequence	= ev->sequence;
> +		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec;
> +		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec;
> +		ev32.id		= ev->id;
>  
>  		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
>  		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
> @@ -3210,21 +3212,23 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
>  	case VIDIOC_DQBUF_TIME32:
>  	case VIDIOC_PREPARE_BUF_TIME32: {
>  		struct v4l2_buffer *vb = parg;
> -		struct v4l2_buffer_time32 vb32 = {
> -			.index		= vb->index,
> -			.type		= vb->type,
> -			.bytesused	= vb->bytesused,
> -			.flags		= vb->flags,
> -			.field		= vb->field,
> -			.timestamp.tv_sec	= vb->timestamp.tv_sec,
> -			.timestamp.tv_usec	= vb->timestamp.tv_usec,
> -			.timecode	= vb->timecode,
> -			.sequence	= vb->sequence,
> -			.memory		= vb->memory,
> -			.m.userptr	= vb->m.userptr,
> -			.length		= vb->length,
> -			.request_fd	= vb->request_fd,
> -		};
> +		struct v4l2_buffer_time32 vb32;
> +
> +		memset(&vb32, 0, sizeof(vb32));
> +
> +		vb32.index	= vb->index;
> +		vb32.type	= vb->type;
> +		vb32.bytesused	= vb->bytesused;
> +		vb32.flags	= vb->flags;
> +		vb32.field	= vb->field;
> +		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec;
> +		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec;
> +		vb32.timecode	= vb->timecode;
> +		vb32.sequence	= vb->sequence;
> +		vb32.memory	= vb->memory;
> +		vb32.m.userptr	= vb->m.userptr;
> +		vb32.length	= vb->length;
> +		vb32.request_fd	= vb->request_fd;
>  
>  		if (copy_to_user(arg, &vb32, sizeof(vb32)))
>  			return -EFAULT;

-- 
Regards,

Laurent Pinchart
