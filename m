Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D32340873
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 16:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhCRPIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 11:08:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43144 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbhCRPI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 11:08:26 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2276899;
        Thu, 18 Mar 2021 16:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616080105;
        bh=Ch0l5FkDguHb7adSZxme0bdghLPKWjb9D7WqzZLN1SQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wFLHeyFbD6svgeBM/gT+kjwK0iJlfFGqPzQw9GRverl68RCrsALpRTpEfTObbXvVX
         O8sqPnXXUM3rdHjA7s21wB62N30QQc1/JVPAYsCz6z9rjVL1Vkd9GVQBN6Vs4fi7xx
         yuoF5NVMiNkGqXShjEYNQ8gHeQYmPe1msLfmJUDM=
Date:   Thu, 18 Mar 2021 17:07:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        syzbot+142888ffec98ab194028@syzkaller.appspotmail.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l2-core: explicitly clear ioctl input data
Message-ID: <YFNswT3+488rC5Tl@pendragon.ideasonboard.com>
References: <20210318134334.2933141-1-arnd@kernel.org>
 <20210318134334.2933141-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210318134334.2933141-2-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Thu, Mar 18, 2021 at 02:43:19PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As seen from a recent syzbot bug report, mistakes in the compat ioctl
> implementation can lead to uninitialized kernel stack data getting used
> as input for driver ioctl handlers.
> 
> The reported bug is now fixed, but it's possible that other related
> bugs are still present or get added in the future. As the drivers need
> to check user input already, the possible impact is fairly low, but it
> might still cause an information leak.
> 
> To be on the safe side, always clear the entire ioctl buffer before
> calling the conversion handler functions that are meant to initialize
> them.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 51 ++++++++++++++++------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2b1bb68dc27f..6cec92d0972c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3164,12 +3164,23 @@ static int video_get_user(void __user *arg, void *parg,
>  
>  	if (cmd == real_cmd) {
>  		if (copy_from_user(parg, (void __user *)arg, n))
> -			err = -EFAULT;
> -	} else if (in_compat_syscall()) {
> -		err = v4l2_compat_get_user(arg, parg, cmd);
> -	} else {
> -		switch (cmd) {
> +			return -EFAULT;
> +
> +		/* zero out anything we don't copy from userspace */
> +		if (n < _IOC_SIZE(real_cmd))
> +			memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
> +
> +		return 0;
> +	}
> +
> +	/* zero out whole buffer first to deal with missing emulation */
> +	memset(parg, 0, _IOC_SIZE(real_cmd));
> +
> +	if (in_compat_syscall())
> +		return v4l2_compat_get_user(arg, parg, cmd);
> +
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
> +	switch (cmd) {
>  		case VIDIOC_QUERYBUF_TIME32:
>  		case VIDIOC_QBUF_TIME32:
>  		case VIDIOC_DQBUF_TIME32:
> @@ -3182,28 +3193,24 @@ static int video_get_user(void __user *arg, void *parg,
>  
>  			*vb = (struct v4l2_buffer) {
>  				.index		= vb32.index,
> -					.type		= vb32.type,
> -					.bytesused	= vb32.bytesused,
> -					.flags		= vb32.flags,
> -					.field		= vb32.field,
> -					.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> -					.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> -					.timecode	= vb32.timecode,
> -					.sequence	= vb32.sequence,
> -					.memory		= vb32.memory,
> -					.m.userptr	= vb32.m.userptr,
> -					.length		= vb32.length,
> -					.request_fd	= vb32.request_fd,
> +				.type		= vb32.type,
> +				.bytesused	= vb32.bytesused,
> +				.flags		= vb32.flags,
> +				.field		= vb32.field,
> +				.timestamp.tv_sec	= vb32.timestamp.tv_sec,
> +				.timestamp.tv_usec	= vb32.timestamp.tv_usec,
> +				.timecode	= vb32.timecode,
> +				.sequence	= vb32.sequence,
> +				.memory		= vb32.memory,
> +				.m.userptr	= vb32.m.userptr,
> +				.length		= vb32.length,
> +				.request_fd	= vb32.request_fd,
>  			};
>  			break;
>  		}
> -#endif
> -		}
>  	}
> +#endif
>  
> -	/* zero out anything we don't copy from userspace */
> -	if (!err && n < _IOC_SIZE(real_cmd))
> -		memset((u8 *)parg + n, 0, _IOC_SIZE(real_cmd) - n);
>  	return err;
>  }
>  

-- 
Regards,

Laurent Pinchart
