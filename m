Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F8C25B19B
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgIBQ07 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbgIBQ0r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 12:26:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F49C061251;
        Wed,  2 Sep 2020 09:26:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F6A9CC;
        Wed,  2 Sep 2020 18:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599063994;
        bh=dSqMUpaG7AZd72yHZ7rra4x5/rnP+cdxisE4rS3WLF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R/H9/zNKRLV1P/im2JUQebtvSib8OJGz2Bah5T8TVlj54JF/xpDAlGXs3WREGe3mV
         Wrjl/89a8N+W/4v6xcGrOiiBV9eSVUGx9cXsj62t70tPPMbI1THtRBLrTZgSMzcreP
         qoY6zlud8WJmN/H73ANWh0WIV4eK+qhzGf/KdIOY=
Date:   Wed, 2 Sep 2020 19:26:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/38] media: v4l2-ioctl: avoid memory leaks on some
 time32 compat functions
Message-ID: <20200902162612.GB16811@pendragon.ideasonboard.com>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
 <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27254f9780e7ec8502761826c2888dbd51a536a8.1599062230.git.mchehab+huawei@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Wed, Sep 02, 2020 at 06:10:05PM +0200, Mauro Carvalho Chehab wrote:
> There are some reports about possible memory leaks:
> 
> 	drivers/media/v4l2-core//v4l2-ioctl.c:3203 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
> 	drivers/media/v4l2-core//v4l2-ioctl.c:3230 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
> 
> While smatch seems to be reporting a false positive (line 3203),
> there's indeed a possible leak with reserved2 at vb32.
> 
> We might have fixed just that one, but smatch checks won't
> be able to check leaks at ev32. So, re-work the code in a way
> that will ensure that the var contents will be zeroed before
> filling it.
> 
> With that, we don't need anymore to touch reserved fields.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 48 ++++++++++++++--------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a556880f225a..6f3fe9c4b64a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3189,17 +3189,16 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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
>  
> +		memset(&ev32, 0, sizeof(ev32));
> +		ev32.type		= ev->type,

The lines should end with ';', not ','.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		ev32.pending		= ev->pending,
> +		ev32.sequence		= ev->sequence,
> +		ev32.timestamp.tv_sec	= ev->timestamp.tv_sec,
> +		ev32.timestamp.tv_nsec	= ev->timestamp.tv_nsec,
> +		ev32.id			= ev->id,
>  		memcpy(&ev32.u, &ev->u, sizeof(ev->u));
> -		memcpy(&ev32.reserved, &ev->reserved, sizeof(ev->reserved));
>  
>  		if (copy_to_user(arg, &ev32, sizeof(ev32)))
>  			return -EFAULT;
> @@ -3210,21 +3209,22 @@ static int video_put_user(void __user *arg, void *parg, unsigned int cmd)
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
> +		vb32.index		= vb->index,
> +		vb32.type		= vb->type,
> +		vb32.bytesused		= vb->bytesused,
> +		vb32.flags		= vb->flags,
> +		vb32.field		= vb->field,
> +		vb32.timestamp.tv_sec	= vb->timestamp.tv_sec,
> +		vb32.timestamp.tv_usec	= vb->timestamp.tv_usec,
> +		vb32.timecode		= vb->timecode,
> +		vb32.sequence		= vb->sequence,
> +		vb32.memory		= vb->memory,
> +		vb32.length		= vb->length,
> +		vb32.request_fd		= vb->request_fd,
> +		memcpy(&vb32.m, &vb->m, sizeof(vb->m));
>  
>  		if (copy_to_user(arg, &vb32, sizeof(vb32)))
>  			return -EFAULT;

-- 
Regards,

Laurent Pinchart
