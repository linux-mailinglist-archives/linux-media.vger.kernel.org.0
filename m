Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7AE440C9
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731577AbfFMQJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:09:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48430 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391372AbfFMQJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 12:09:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E37D052B;
        Thu, 13 Jun 2019 18:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560442158;
        bh=1S2z8/40XlzEcH5YWVP4Pilnjo5IJKQr1Fm7+C3qfLY=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=MaYeShQXACx9Mw/ZEjRmb1d6RLXKmp9fhgZhzn3v8tiK8EnHYRq6VncvBCcJylW9F
         tviIjYCHXp0lHxd0xtrl9RhP99rUsPH3PcXU4sL3DSCjHT8u54XcBdN0E3wOlqp8Gs
         qeD04bt17uu7W/DbLWIxUN57qst50e4tKJPQ9AM4=
Subject: Re: [PATCH 1/4] media: cxd2820r: don't check retval after our own
 assignemt
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
 <20190613155421.16408-2-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <550e0dbf-1776-000b-27ca-40e40e317da2@ideasonboard.com>
Date:   Thu, 13 Jun 2019 17:09:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613155421.16408-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wolfram,


In the title/subject:

media: cxd2820r: don't check retval after our own assignemt

s/assignemt/assignment/


On 13/06/2019 16:54, Wolfram Sang wrote:
> No need to check a retval after we assigned a constant to it.

Hrm... Good spots!

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/dvb-frontends/cxd2820r_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
> index 1f006f8e8cc2..99a186ddddb2 100644
> --- a/drivers/media/dvb-frontends/cxd2820r_core.c
> +++ b/drivers/media/dvb-frontends/cxd2820r_core.c
> @@ -636,8 +636,7 @@ static int cxd2820r_probe(struct i2c_client *client,
>  	if (!priv->client[1]) {
>  		ret = -ENODEV;
>  		dev_err(&client->dev, "I2C registration failed\n");
> -		if (ret)

Can't argue with that.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> -			goto err_regmap_0_regmap_exit;
> +		goto err_regmap_0_regmap_exit;
>  	}
>  
>  	priv->regmap[1] = regmap_init_i2c(priv->client[1], &regmap_config1);
> 

