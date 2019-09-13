Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C70B2081
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391077AbfIMNWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:22:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390973AbfIMNWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:22:15 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4300B33A;
        Fri, 13 Sep 2019 15:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568380933;
        bh=9gUwoysnC3sI56b/+7CXuRddFhVU5l43f19uyNV6ulM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rmH3liThfXkD1hQ5EmPoL29pRPHwRWip0TQ9ZnbF1YUoYhec7PHDtE2EXrUegYGF+
         8oIkeDwmvnZqrVq1E+7PsycDtyWBSHiGu8EvO4ovBUn6nTtU9sy9GpAGHkXo0kUaj5
         LBKUd1Q96y57LXSVI+Jd7MQDxpwGT5ecVI7s3HjA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 2/6] rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED()
 macro
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
 <20190904215409.30136-3-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e931fb13-5c37-6b63-11a6-2d4bf60ccbc2@ideasonboard.com>
Date:   Fri, 13 Sep 2019 14:22:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904215409.30136-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/09/2019 22:54, Niklas Söderlund wrote:
> The V4L2_FIELD_IS_INTERLACED() can be used to make the code more
> readable, use it.

Definitely!

> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 3cb29b2e0b2b18a9..7d40d71c863265c9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -557,16 +557,11 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
>  	rvin_write(vin, 0, VNSPPOC_REG);
>  	rvin_write(vin, 0, VNSLPOC_REG);
>  	rvin_write(vin, vin->format.width - 1, VNEPPOC_REG);
> -	switch (vin->format.field) {
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> +
> +	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
>  		rvin_write(vin, vin->format.height / 2 - 1, VNELPOC_REG);
> -		break;
> -	default:
> +	else
>  		rvin_write(vin, vin->format.height - 1, VNELPOC_REG);
> -		break;
> -	}
>  
>  	vin_dbg(vin,
>  		"Pre-Clip: %ux%u@%u:%u YS: %d XS: %d Post-Clip: %ux%u@%u:%u\n",
> 

