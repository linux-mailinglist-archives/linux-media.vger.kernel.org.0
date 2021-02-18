Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DFA31ECBC
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhBRQ7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:59:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbhBRQIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 11:08:18 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 580BC3E7;
        Thu, 18 Feb 2021 17:07:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613664453;
        bh=kQ8OEh/Mm+FqKi7mPHrc30jLI5eIvbGSQ8oxqED2fN8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZozBA+bNhh0ZR4Elyf2cX7TcUNNp8Hp8Hc7zaP1D1PNs7a1Pzv0cOmPyUVm21PXbz
         /4NHy66lF5BsPjaJK4LuxZEQ/DDJtaTB4q39+lVajHZH2fwcHPVUtI982JsHRD1UW5
         OqYAzbl+eOp/ZHcaDbHmXhYLWqwyIymEGACY+4ZE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 16/16] media: i2c: gmsl: Use 339Kbps I2C bit-rate
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-17-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <aa7d8a9c-93a0-8c14-4fe4-b831e7b45d88@ideasonboard.com>
Date:   Thu, 18 Feb 2021 16:07:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-17-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/02/2021 17:41, Jacopo Mondi wrote:
> With the camera modules initialization routines now running with
> the noise immunity threshold enabled, it is possible to restore
> the bit rate of the I2C transactions transported on the GMSL control
> channel to 339 Kbps.
> 
> The 339 Kbps bit rate represents the default setting for the serializer
> and the deserializer chips, and the setup/hold time and slave timeout
> time in use are calibrate to support that rate.

s/calibrate/calibrated/

Does that mean the setup/hold time and timeouts should be adjusted based
on the i2c speed? (which we have not been doing?)

With all of your other reliability improvements, does *this* change
alone have any difference or impact on reliability?

I.e. if we go slower (stay at current speed) - would we be more reliable?

Is there a reliability improvement by making this speed faster?

I presume we don't have a way to convey the i2c bus speed between the
max9286 and the max9271 currently? Seems a bit like a bus parameter....





> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 2 +-
>  drivers/media/i2c/rdacm20.c | 2 +-
>  drivers/media/i2c/rdacm21.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index aa01d5bb79ef..0b620f2f8c41 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -330,7 +330,7 @@ static int max9286_i2c_mux_init(struct max9286_priv *priv)
>  static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
>  {
>  	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
> -		    MAX9286_I2CMSTBT_105KBPS;
> +		    MAX9286_I2CMSTBT_339KBPS;
>  
>  	if (localack)
>  		config |= MAX9286_I2CLOCACK;
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 0632ef98eea7..d45e8b0e52a0 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -450,7 +450,7 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
>  	ret = max9271_configure_i2c(&dev->serializer,
>  				    MAX9271_I2CSLVSH_469NS_234NS |
>  				    MAX9271_I2CSLVTO_1024US |
> -				    MAX9271_I2CMSTBT_105KBPS);
> +				    MAX9271_I2CMSTBT_339KBPS);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 80b6f16f87a8..552985026458 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -442,7 +442,7 @@ static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
>  	ret = max9271_configure_i2c(&dev->serializer,
>  				    MAX9271_I2CSLVSH_469NS_234NS |
>  				    MAX9271_I2CSLVTO_1024US |
> -				    MAX9271_I2CMSTBT_105KBPS);
> +				    MAX9271_I2CMSTBT_339KBPS);
>  	if (ret)
>  		return ret;
>  
> 

