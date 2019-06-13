Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CABE44116
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391593AbfFMQLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:11:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391587AbfFMQLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 12:11:31 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA45452B;
        Thu, 13 Jun 2019 18:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560442290;
        bh=MaF7TDloZgBgF7rWBELeUNc1VaEnB2RDm5tUeyg06EE=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=R9RMC0+/8VswNPTW7Ozc26K3zG813e59Y876RK3lY+HbNNLyKs1sDQqPDgrCo/rtB
         tTHTz/laKJPEFPwHOyioaK2hZQtxN6PH9FjxKPVzKVJMSZUcOotZwqLBu2VTfZ03Ed
         pXsiv/3RqzaBBr5D0MKdUf7K808QkN+zt0nBO0bQ=
Subject: Re: [PATCH 2/4] media: mn88472: don't check retval after our own
 assignemt
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20190613155421.16408-1-wsa+renesas@sang-engineering.com>
 <20190613155421.16408-3-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <55afdf32-68a8-c754-152a-2e80a686bde4@ideasonboard.com>
Date:   Thu, 13 Jun 2019 17:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613155421.16408-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wolfram,

Same comment in title (on all 4 patches in fact)
	s/assignemt/assignment/


On 13/06/2019 16:54, Wolfram Sang wrote:
> No need to check a retval after we assigned a constant to it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/dvb-frontends/mn88472.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-frontends/mn88472.c
> index 731b44b9b74c..0a4d0d5fb4b6 100644
> --- a/drivers/media/dvb-frontends/mn88472.c
> +++ b/drivers/media/dvb-frontends/mn88472.c
> @@ -616,8 +616,7 @@ static int mn88472_probe(struct i2c_client *client,
>  	if (!dev->client[1]) {
>  		ret = -ENODEV;
>  		dev_err(&client->dev, "I2C registration failed\n");
> -		if (ret)
> -			goto err_regmap_0_regmap_exit;
> +		goto err_regmap_0_regmap_exit;

Ack

>  	}
>  	dev->regmap[1] = regmap_init_i2c(dev->client[1], &regmap_config);
>  	if (IS_ERR(dev->regmap[1])) {
> @@ -630,8 +629,7 @@ static int mn88472_probe(struct i2c_client *client,
>  	if (!dev->client[2]) {
>  		ret = -ENODEV;
>  		dev_err(&client->dev, "2nd I2C registration failed\n");
> -		if (ret)
> -			goto err_regmap_1_regmap_exit;
> +		goto err_regmap_1_regmap_exit;

Ack.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  	}
>  	dev->regmap[2] = regmap_init_i2c(dev->client[2], &regmap_config);
>  	if (IS_ERR(dev->regmap[2])) {
> 

