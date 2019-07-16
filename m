Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963F96AAFF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387941AbfGPOvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 10:51:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46554 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfGPOvo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 10:51:44 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C69A3564;
        Tue, 16 Jul 2019 16:51:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563288703;
        bh=ltP+NLz1rZAeDYerr2IaeWUfXd9XL0tFj8ShbIJnafM=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=TSAWK8Agsd/DxyBFTgi9r9H+Fd2QHw7FljPF+JZHXlClomFtlD239n4OEYkFpL9J+
         LHAXHxa/bA3Z9BGABog4Gx0b4N/btsmOpyofasts4dTDIbmfEHIUGqV3P593CEqWjX
         rPmLE5ChNYcn+RdYCIqMf0aheR2R8+HUrEJJ3t6o=
Subject: Re: [PATCH 2/4] rcar-vin: Do not reset the crop and compose
 rectangles in s_fmt
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
 <20190705045557.25463-3-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <632ecb38-4e85-ad10-84c7-028b6419a717@ideasonboard.com>
Date:   Tue, 16 Jul 2019 15:51:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705045557.25463-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas

On 05/07/2019 05:55, Niklas Söderlund wrote:
> The crop and compose rectangles where reset when s_fmt was called

s/where reset/are reset/
s/was called/is called/

> resulting in potentially valid rectangles where lost when updating the

s/where lost/being lost/

> format. Fix this by instead trying to map the rectangles inside the new

I don't think there's any 'trying' here - just doing.

  "Fix this by mapping the rectangles inside ..."

> format.
> 

It could be worth expanding on the consequences of this patch here:

"This may result in the crop and compose windows being modified from the
original setting to ensure that they are valid within the dimensions of
the new format."

But perhaps that's just too much repetition. It's just the point about
making it clear that the existing cropping and compose rectangles may be
different after this call that might be worth expressing somehow.


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Does this deserve a fixes tag? Or is this more of a solitary change.

With the wordings fixed, and expanded if you desire:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 2d94e700a473572c..d5e860ba6d9a2409 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -271,8 +271,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -	vin->crop = crop;
> -	vin->compose = compose;
> +	v4l2_rect_map_inside(&vin->crop, &crop);
> +	v4l2_rect_map_inside(&vin->compose, &compose);
>  	vin->src_rect = crop;
>  
>  	return 0;
> 

