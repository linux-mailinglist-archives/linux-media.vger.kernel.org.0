Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB89B1F83
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390512AbfIMNUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:20:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44690 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390494AbfIMNUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:20:05 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2C8633A;
        Fri, 13 Sep 2019 15:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568380803;
        bh=4kRbhFg+9dUSHPO2GVJj0visaweYygNMgySoV4SSvX4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OfPtFBP+wH6GVblOBvvVZ9xG15W6TioNJwcBj2gpGChsbCIbNldX0EB0FyXvDRyEN
         X4tXk3IdGtz+Z2EErFXzhwT1i1i957MeOiC9N3GbVNCSp/zbG/78OU+YjxZlZdZINk
         wC9TX9SFNFgoHHf9BplrBeOiSWJdf7A9pkHjHfFQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 1/6] rcar-vin: Fix incorrect return statement in
 rvin_try_format()
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
 <20190904215409.30136-2-niklas.soderlund+renesas@ragnatech.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <48208a9b-d92b-d0bf-7c62-7225b154f315@ideasonboard.com>
Date:   Fri, 13 Sep 2019 14:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904215409.30136-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 04/09/2019 22:54, Niklas Söderlund wrote:
> While refactoring code the return statement became corrupted, fix it by
> returning the correct return code.
> 
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 897e371389e77514 ("media: rcar-vin: simplify how formats are set and reset"
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> 
> * Changes since v2
> - Set ret to 0 if the subdevice do not implement set_fmt and returns
>   -ENOIOCTLCMD instead of returning the not implemented error.
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index cbc1c07f0a9631a4..ec2796413e26822d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -208,6 +208,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	ret = v4l2_subdev_call(sd, pad, set_fmt, pad_cfg, &format);
>  	if (ret < 0 && ret != -ENOIOCTLCMD)
>  		goto done;
> +	ret = 0;
>  
>  	v4l2_fill_pix_format(pix, &format.format);
>  
> @@ -242,7 +243,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  done:
>  	v4l2_subdev_free_pad_config(pad_cfg);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rvin_querycap(struct file *file, void *priv,
> 

