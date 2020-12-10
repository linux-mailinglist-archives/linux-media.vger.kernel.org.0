Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AD82D692A
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 21:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404570AbgLJUwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 15:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393558AbgLJUwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 15:52:31 -0500
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2175CC0613D3;
        Thu, 10 Dec 2020 12:51:43 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc25a.ng.seznam.cz (email-smtpc25a.ng.seznam.cz [10.23.18.34])
        id 14be179e4fb043f71517dbc0;
        Thu, 10 Dec 2020 21:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607633484; bh=uVI8DKBCKgq5GbOjTJGcesmmho5CB7T5xPqxJqxGoBE=;
        h=Received:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=DOYrZsTuj6+Aw2wzWcKSqSn9uJkohGDyC9xOPjcz+C5aW4+WFNJOczbkqq7yO41ty
         z/KL1uT5kID1YIXNgJBcKw3DoQS/76hQt971mvjJvBdT2CoGTqus6RkqB9qTRVUlwv
         Qlb3UI9DdCTtMFsKQMk3lupp1vtDU05HpOrxs97M=
Received: from [192.168.1.213] (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay6.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Thu, 10 Dec 2020 21:51:22 +0100 (CET)  
Subject: Re: [PATCH v2 1/3] media: i2c: imx219: add support for specifying
 clock-frequencies
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20201206172720.9406-1-michael.srba@seznam.cz>
 <20201207055952.GB14307@pengutronix.de>
From:   Michael Srba <Michael.Srba@seznam.cz>
Message-ID: <222f5118-72ac-d291-f8d9-743d5c45c4ea@seznam.cz>
Date:   Thu, 10 Dec 2020 21:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201207055952.GB14307@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

sorry for late reply.

I copied this approach from looking at other camera sensor drivers,
and it seemed less "ugly" to me than using assigned-rates (I will be
upstreaming required dts changes for Samsung Galaxy A3 (2015), so the
dts feeling "proper" is important to me).

I however am not qualified to make that decision, so if you believe
that the assigned-rates approach is cleaner and more suitable for mainline,
I will try to adjust my internal filter for what is "more proper" :)

As for rounding, the issue is that it seems to like to round up, instead
of trying to find the closest possible value. I *guess* trying to set
the lower barrier might work out in practice, but it seems kind of ugly.

All in all, what I did seemed like the cleanest option to me, and it was
an approach that other drivers also use. But if you believe there is
a cleaner approach, I will be more than happy to do something else,
though I would appreciate an explanation of why it is cleaner so that
I can make better decisions in the future.

Best regards,
Michael

On 07. 12. 20 6:59, Sascha Hauer wrote:
> Hi Michael,
>
> On Sun, Dec 06, 2020 at 06:27:18PM +0100, michael.srba@seznam.cz wrote:
>> From: Michael Srba <Michael.Srba@seznam.cz>
>>
>> This patch adds 1% tolerance on input clock, similar to other camera sensor
>> drivers. It also allows for specifying the actual clock in the device tree,
>> instead of relying on it being already set to the right frequency (which is
>> often not the case).
>>
>> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
>>
>> ---
>>
>> changes since v1: default to exactly 24MHz when `clock-frequency` is not present
>>
>> ---
>>  drivers/media/i2c/imx219.c | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>> index f64c0ef7a897..b6500e2ab19e 100644
>> --- a/drivers/media/i2c/imx219.c
>> +++ b/drivers/media/i2c/imx219.c
>> @@ -1443,13 +1443,28 @@ static int imx219_probe(struct i2c_client *client)
>>  		return PTR_ERR(imx219->xclk);
>>  	}
>>  
>> -	imx219->xclk_freq = clk_get_rate(imx219->xclk);
>> -	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
>> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
>> +	if (ret) {
>> +		dev_warn(dev, "could not get xclk frequency\n");
>> +
>> +		/* default to 24MHz */
>> +		imx219->xclk_freq = 24000000;
>> +	}
>> +
>> +	/* this driver currently expects 24MHz; allow 1% tolerance */
>> +	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>>  		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>>  			imx219->xclk_freq);
>>  		return -EINVAL;
>>  	}
>>  
>> +	ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
>> +	if (ret) {
>> +		dev_err(dev, "could not set xclk frequency\n");
>> +		return ret;
>> +	}
> clk_set_rate() returns successfully when the rate change has succeeded.
> It tells you nothing about the actual rate that has been set. The rate
> could be very different from what you want to get, depending on what the
> hardware is able to archieve. There's clk_round_rate() that tells you
> which rate you'll get when you call clk_set_rate() with that value.
> You would have to call clk_round_rate() first and see if you are happy
> with the result, afterwards set the rate. From that view it doesn't make
> much sense to check the device tree if a number between 23760000 and
> 24240000 is specified there, the clk api will do rounding anyway.
>
> Also there's the assigned-clocks device tree binding, see
> Documentation/devicetree/bindings/clock/clock-bindings.txt. This allows
> you to set the desired clock rate directly in the device tree. All
> that's left to do in the driver is to replace the check for the exact
> rate with a check which allows a certain tolerance.
>
> Sascha
>

