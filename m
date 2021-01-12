Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6713B2F2E8B
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 13:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbhALMAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 07:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729900AbhALMAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 07:00:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A7C061575;
        Tue, 12 Jan 2021 03:59:30 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04E243E;
        Tue, 12 Jan 2021 12:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610452769;
        bh=zOssxOpkeUMTlwbLdYNIifUpUesWf4n3+Gvn9koF1ec=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=t9YGRg+2dyCVWcELBS4KiqwTAIz2Sw17UmlgKRh85j9vc9bAfGzYdv637rCaCzN5S
         cqrjEQq2bs7xcC7WA/IfZsALB/2LpD2Zt74g1zOM3mW7D3zZ2BFOQz7ptzRQocSJsM
         MWiPxHZi+5W8YVsP1z17ld7ivo9C2b1qSe91g1oM=
Subject: Re: [PATCH] media: staging/intel-ipu3 : Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-2-ribalda@chromium.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8fb0c69c-bf17-328e-1b08-ab6316b65b83@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:59:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-2-ribalda@chromium.org>
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

This is just 9/9 of the series right ? ;-)
--
Kieran

> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 4dc8d9165f63..60aa02eb7d2a 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -773,9 +773,6 @@ static int imgu_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  
>  	pixm->pixelformat = fmt->fourcc;
>  
> -	memset(pixm->plane_fmt[0].reserved, 0,
> -	       sizeof(pixm->plane_fmt[0].reserved));
> -
>  	return 0;
>  }
>  
> 

