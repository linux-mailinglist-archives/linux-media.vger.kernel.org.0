Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13E42D0640
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 18:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgLFRTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 12:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgLFRTZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 12:19:25 -0500
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7DCC0613D1;
        Sun,  6 Dec 2020 09:18:39 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc25a.ng.seznam.cz (email-smtpc25a.ng.seznam.cz [10.23.18.34])
        id 1bebbfac40e5ebc51a4273f2;
        Sun, 06 Dec 2020 18:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607275101; bh=hNpVWi7xybD7pNQIgL7OSBGGIcO5ZoO5YUxC5+BpAJI=;
        h=Received:Subject:To:Cc:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=hpMWLqdXJzPpUjwhhevquRpuYvrPROGViISXrFVSBFfZF3x24MJJSbXmA1qQah/Ks
         SuzX9o1zvMwC0y6HG3jCYqbfbVX0qoutn22pGhEOWeUz2bnMn7UI1aHYfuA2ydsAjg
         /v5yMtWcFH22wZVUiaSXIZnq2Agwr6n7I3HKV6Ag=
Received: from [192.168.1.213] (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay2.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sun, 06 Dec 2020 18:18:19 +0100 (CET)  
Subject: Re: [PATCH 1/3] media: i2c: imx219: add support for specifying
 clock-frequencies
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
 <CAMuHMdXLQeTWGmAk9a3uE0VgPmTUsjbNn36q9-228eZufuYZ6w@mail.gmail.com>
From:   Michael Srba <Michael.Srba@seznam.cz>
Message-ID: <e87727ea-8cb4-9d68-22de-cb9aea080c34@seznam.cz>
Date:   Sun, 6 Dec 2020 18:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXLQeTWGmAk9a3uE0VgPmTUsjbNn36q9-228eZufuYZ6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05. 12. 20 19:54, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sat, Dec 5, 2020 at 7:36 PM <michael.srba@seznam.cz> wrote:
>> From: Michael Srba <Michael.Srba@seznam.cz>
>>
>> This patch adds 1% tolerance on input clock, similar to other camera sensor
>> drivers. It also allows for specifying the actual clock in the device tree,
>> instead of relying on it being already set to the right frequency (which is
>> often not the case).
>>
>> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> Thanks for your patch!
>
>> --- a/drivers/media/i2c/imx219.c
>> +++ b/drivers/media/i2c/imx219.c
>> @@ -1443,13 +1443,26 @@ static int imx219_probe(struct i2c_client *client)
>>                 return PTR_ERR(imx219->xclk);
>>         }
>>
>> -       imx219->xclk_freq = clk_get_rate(imx219->xclk);
>> -       if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
>> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
>> +       if (ret) {
>> +               dev_err(dev, "could not get xclk frequency\n");
>> +               return ret;
> This breaks compatibility with existing DTBs, which do not have the
> clock-frequency property.
> For backwards compatibility, you should assume the default 24 MHz
> instead of returning an error.
Good point, will do.

>> +       }
>> +
>> +       /* this driver currently expects 24MHz; allow 1% tolerance */
>> +       if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>>                 dev_err(dev, "xclk frequency not supported: %d Hz\n",
>>                         imx219->xclk_freq);
>>                 return -EINVAL;
>>         }
>>
>> +       ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
>> +       if (ret) {
>> +               dev_err(dev, "could not set xclk frequency\n");
>> +               return ret;
>> +       }
>> +
>> +
>>         ret = imx219_get_regulators(imx219);
>>         if (ret) {
>>                 dev_err(dev, "failed to get regulators\n");
> Gr{oetje,eeting}s,
>
>                         Geert
>

Michael
