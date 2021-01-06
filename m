Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3F52EBFA7
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbhAFOgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:36:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFOgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:36:07 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C16D49DF;
        Wed,  6 Jan 2021 15:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609943726;
        bh=XMEDmFFpKgNbi4vKGlRrkbSvU3PIJ+LUsABhcDYJ6lY=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=ETJWh+c/H5Ph+/6fnxIjo8XFqmZKw7zkudL+sWG3jsUHAu5aTM0iDbJyGqueiZf18
         d4tLwSv5Lhm0A3lkOATnnJIFaM55iOcq/fk5XumS0VhLI4lp2suWE1kZNzzpmDXXUE
         qTEoCV6SsfuLyzHOCWR6d8UxdAz95cPsCx76iXHo=
Subject: Re: [PATCH] Revert "media: videobuf2: Fix length check for single
 plane dmabuf queueing"
To:     Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20210106135210.12337-1-naush@raspberrypi.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c63d6797-d3f7-3e6d-b760-d05291dbc0ed@ideasonboard.com>
Date:   Wed, 6 Jan 2021 14:35:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106135210.12337-1-naush@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Naush,

On 06/01/2021 13:52, Naushir Patuck wrote:
> The updated length check for dmabuf types broke existing usage in v4l2
> userland clients.

Indeed, my tests have indeed been failing since 5.8 or such it seems.

Thank you for this - it fixes the tests again for me.

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dmabuf queueing")
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 96d3b2b2aa31..3f61f5863bf7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -118,8 +118,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>  				return -EINVAL;
>  		}
>  	} else {
> -		length = (b->memory == VB2_MEMORY_USERPTR ||
> -			  b->memory == VB2_MEMORY_DMABUF)
> +		length = (b->memory == VB2_MEMORY_USERPTR)
>  			? b->length : vb->planes[0].length;
>  
>  		if (b->bytesused > length)
> 

