Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8726740D081
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 02:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhIPABc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 20:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbhIPABc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 20:01:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0245FC061574;
        Wed, 15 Sep 2021 17:00:12 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DBB22A5;
        Thu, 16 Sep 2021 02:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631750408;
        bh=zAQ9we4Wz+FoHCRAweaMpNYAOhWnZEbnIhZ4/ilAqW8=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=FBU71S/ncuLtQd5de72V2Aihbkh/gI78psOg18S56T+fBZ4585CNp0P1/X5Pnl0+S
         IN06UK7t5GgRJTsYGrAtb5O6IClrOaaMCfy5RxttKu9LdG5JxOSbGriaMRsiCxxAhC
         SaQ56Gl+bVwk10uiG9lX2ffLuIkEaWdjW2l5t8xs=
Subject: Re: [PATCH v2 2/2] media: rcar-csi2: Serialize access to set_fmt and
 get_fmt
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
References: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
 <20210915015013.3169934-3-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <607215d9-5a6f-1427-dc2e-671c8cc7e974@ideasonboard.com>
Date:   Thu, 16 Sep 2021 01:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915015013.3169934-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2021 02:50, Niklas Söderlund wrote:
> The access to the internal storage of the format rcar_csi2.mf should be
> serialized, extend the exciting lock mutex to also cover this.

Exciting, or existing ;-) I guess it depends on how much you like
mutexes ;-)


> While at it document the mutex.
> 

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index a02573dbd5da4f62..2fdfdc38de424c72 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -370,9 +370,8 @@ struct rcar_csi2 {
>  	struct v4l2_subdev *remote;
>  	unsigned int remote_pad;
>  
> +	struct mutex lock; /* Protects mf and stream_count. */
>  	struct v4l2_mbus_framefmt mf;
> -
> -	struct mutex lock;
>  	int stream_count;
>  
>  	unsigned short lanes;
> @@ -725,6 +724,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>  	struct v4l2_mbus_framefmt *framefmt;
>  
> +	mutex_lock(&priv->lock);
> +
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>  
> @@ -735,6 +736,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  		*framefmt = format->format;
>  	}
>  
> +	mutex_unlock(&priv->lock);
> +
>  	return 0;
>  }
>  
> @@ -744,11 +747,15 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>  
> +	mutex_lock(&priv->lock);
> +
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		format->format = priv->mf;
>  	else
>  		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
>  
> +	mutex_unlock(&priv->lock);
> +
>  	return 0;
>  }
>  
> 

