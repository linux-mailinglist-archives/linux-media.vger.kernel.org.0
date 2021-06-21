Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64E53AE8C8
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 14:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhFUMLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 08:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhFUMLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 08:11:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B030EC061574;
        Mon, 21 Jun 2021 05:09:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 980B75A1;
        Mon, 21 Jun 2021 14:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624277376;
        bh=D5aMC3nKs6AeN78dem+9AycwhE8/FV0A4CCif5//bLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A5p81FfzQAS3GzxbMk60HCHztOPPEQYeUAg638qc0fDSphfWmsKkwWpZuIP9+i5GX
         ONT+PpHelDvOqS1Cvlc5GIPLYT58AqdpEV3h9KRK4YBcrmJbI8uY6py75oR/HfTCji
         Q0kr/wMdYpIIG0HsQujKv39L8PWrV9Hx1epin5+I=
Date:   Mon, 21 Jun 2021 15:09:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] media: uvc: don't do DMA on stack
Message-ID: <YNCBZtuewVrAoaVu@pendragon.ideasonboard.com>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
 <d9d3b95daf726f3d4dc09477b1f61669763e301a.1624276138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d9d3b95daf726f3d4dc09477b1f61669763e301a.1624276138.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Mon, Jun 21, 2021 at 01:56:46PM +0200, Mauro Carvalho Chehab wrote:
> As warned by smatch:
> 	drivers/media/usb/uvc/uvc_v4l2.c:911 uvc_ioctl_g_input() error: doing dma on the stack (&i)
> 	drivers/media/usb/uvc/uvc_v4l2.c:943 uvc_ioctl_s_input() error: doing dma on the stack (&i)
> 
> those two functions call uvc_query_ctrl passing a pointer to
> a data at the DMA stack. those are used to send URBs via
> usb_control_msg(). Using DMA stack is not supported and should
> not work anymore on modern Linux versions.
> 
> So, use a temporary buffer, allocated together with
> struct uvc_video_chain.

DMA in a memory location that may share a cache line with something else
isn't a great idea either. The buffer should be kmalloc()ed in
uvc_ioctl_g_input() and uvc_ioctl_s_input().

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 10 ++++------
>  drivers/media/usb/uvc/uvcvideo.h |  3 +++
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 252136cc885c..e60d4675881a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -900,7 +900,6 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
>  	struct uvc_fh *handle = fh;
>  	struct uvc_video_chain *chain = handle->chain;
>  	int ret;
> -	u8 i;
>  
>  	if (chain->selector == NULL ||
>  	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
> @@ -910,11 +909,11 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
>  
>  	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, chain->selector->id,
>  			     chain->dev->intfnum,  UVC_SU_INPUT_SELECT_CONTROL,
> -			     &i, 1);
> +			     &chain->input, 1);
>  	if (ret < 0)
>  		return ret;
>  
> -	*input = i - 1;
> +	*input = chain->input - 1;
>  	return 0;
>  }
>  
> @@ -923,7 +922,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>  	struct uvc_fh *handle = fh;
>  	struct uvc_video_chain *chain = handle->chain;
>  	int ret;
> -	u32 i;
>  
>  	ret = uvc_acquire_privileges(handle);
>  	if (ret < 0)
> @@ -939,10 +937,10 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>  	if (input >= chain->selector->bNrInPins)
>  		return -EINVAL;
>  
> -	i = input + 1;
> +	chain->input = input + 1;
>  	return uvc_query_ctrl(chain->dev, UVC_SET_CUR, chain->selector->id,
>  			      chain->dev->intfnum, UVC_SU_INPUT_SELECT_CONTROL,
> -			      &i, 1);
> +			      &chain->input, 1);
>  }
>  
>  static int uvc_ioctl_queryctrl(struct file *file, void *fh,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index cce5e38133cd..3c0ed90d6912 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -475,6 +475,9 @@ struct uvc_video_chain {
>  	struct mutex ctrl_mutex;		/* Protects ctrl.info */
>  
>  	struct v4l2_prio_state prio;		/* V4L2 priority state */
> +
> +	u8 input;				/* buffer for set/get input */
> +
>  	u32 caps;				/* V4L2 chain-wide caps */
>  };
>  

-- 
Regards,

Laurent Pinchart
