Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158582F2E83
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbhALL6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:58:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbhALL6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:58:48 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64EB83E;
        Tue, 12 Jan 2021 12:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610452686;
        bh=mLDeM5JK2U+Cqu5JzAss8UQMs71epKmUAuHs1GCDLWw=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=JvAs+447Uw6Tc4r331n+6ZF/ZPPWCexdrDyKk6QW8aY3zqVYvGrHKmophDtmm141U
         YmQSgbHozr8L5Ao/tZmEc7TUy8plKrVSxeUZ/VILXChAtmDUvObmYTcpsKQLUZpsvz
         3uEJ2wmLxIYMp/hFRGCULtg2uXgPtQuPl++ZNuWo=
Subject: Re: [PATCH 1/9] media: ipu3-cio2: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <8d2ed1cd-ce4d-258c-942e-b0ba1677ea1a@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:58:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 11/01/2021 14:54, Ricardo Ribalda wrote:
> Core code already clears reserved fields of struct
> v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
> v4l2_plane_pix_format reserved fields").
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 36e354ecf71e..c5376de8cb8a 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1094,12 +1094,9 @@ static int cio2_v4l2_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  	mpix->pixelformat = fmt->fourcc;
>  	mpix->colorspace = V4L2_COLORSPACE_RAW;
>  	mpix->field = V4L2_FIELD_NONE;
> -	memset(mpix->reserved, 0, sizeof(mpix->reserved));
>  	mpix->plane_fmt[0].bytesperline = cio2_bytesperline(mpix->width);
>  	mpix->plane_fmt[0].sizeimage = mpix->plane_fmt[0].bytesperline *
>  							mpix->height;
> -	memset(mpix->plane_fmt[0].reserved, 0,
> -	       sizeof(mpix->plane_fmt[0].reserved));
>  
>  	/* use default */
>  	mpix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> 

