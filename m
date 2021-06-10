Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC3D3A3217
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 19:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFJRbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 13:31:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFJRbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 13:31:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42A4E8D4;
        Thu, 10 Jun 2021 19:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623346190;
        bh=cZQIFk8YpbbL4ULk6qHhuB1oz8HLYuTilOZ34lpbSNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RXfwJXK9YLwtsV1Nh4tKqxmV/RDka5glJhQKpvegKKC6iGJXllsjvbDw/DQd5WFhw
         2imuTiYlSxwwrAsxBD2H+xEsQ38RmR5Km0LdqNBGzPj1kZhhzVwOs8t4nTwSBb9WM3
         DjI1pgwZdb11oCJUYkbqGL0xbIbquNxKcdGDVEJc=
Date:   Thu, 10 Jun 2021 20:29:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Mike Isely <isely@pobox.com>
Subject: Re: [PATCH v9 02/22] media: pvrusb2: Do not check for
 V4L2_CTRL_WHICH_DEF_VAL
Message-ID: <YMJL+2U8pRQDvw4C@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-3-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-3-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:20AM +0100, Ricardo Ribalda wrote:
> The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
> written.
> 
> Cc: Mike Isely <isely@pobox.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index 9657c1883311..c04ab7258d64 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -640,10 +640,6 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
>  	unsigned int idx;
>  	int ret;
>  
> -	/* Default value cannot be changed */
> -	if (ctls->which == V4L2_CTRL_WHICH_DEF_VAL)
> -		return -EINVAL;
> -
>  	ret = 0;
>  	for (idx = 0; idx < ctls->count; idx++) {
>  		ctrl = ctls->controls + idx;

-- 
Regards,

Laurent Pinchart
