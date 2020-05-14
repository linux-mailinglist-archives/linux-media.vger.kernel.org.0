Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54911D31CA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 15:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgENNug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 09:50:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENNuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 09:50:35 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F2C0259;
        Thu, 14 May 2020 15:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589464232;
        bh=57FjFvG/SssRG+W/xhAVtBZHMRugzREFdjSdETfXt6k=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aBTl4rsPkZxZs/ah6v+P+aXuEqAFh/pNQXMb235hHpcC0NacbkpwJsXq7zijt4hIR
         qtkNVQvobueazyIxOkErh/HWKgB5HtPI15D2SsnxkJWDz3RRUMfQqOtCAAFNE+TqBz
         nD0gS4YkD4V98uHNIvUJo3NXpUXD8tyYgdTNQzyY=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512181706.GA21014@Mani-XPS-13-9360>
 <11aca587-9438-4fba-081c-b82631e96989@ideasonboard.com>
 <20200514101356.GF2877@Mani-XPS-13-9360>
 <d492cbcb-3b13-82b8-8e5d-0f49320170a2@ideasonboard.com>
 <CAMuHMdWSEY2q1f1iobrSXHYWzweV9yjk4i1ROj2Yde7DJMiabQ@mail.gmail.com>
 <20200514124831.GG2877@Mani-XPS-13-9360>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8f1b0a8a-35b2-1d00-c156-74d9ec3058d6@ideasonboard.com>
Date:   Thu, 14 May 2020 14:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514124831.GG2877@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/05/2020 13:48, Manivannan Sadhasivam wrote:
> On Thu, May 14, 2020 at 01:59:35PM +0200, Geert Uytterhoeven wrote:
>> Hi Kieran,
>>
>> On Thu, May 14, 2020 at 1:47 PM Kieran Bingham
>> <kieran.bingham+renesas@ideasonboard.com> wrote:
>>> On 14/05/2020 11:13, Manivannan Sadhasivam wrote:
>>>> On Thu, May 14, 2020 at 11:02:53AM +0100, Kieran Bingham wrote:
>>>>> On 12/05/2020 19:17, Manivannan Sadhasivam wrote:
>>>>>> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
>>>>>>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
>>>>>>> CSI-2 output. The device supports multicamera streaming applications,
>>>>>>> and features the ability to synchronise the attached cameras.
>>>>>>>
>>>>>>> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
>>>>>>> is supported over I2C, which implements an I2C mux to facilitate
>>>>>>> communications with connected cameras across the reverse control
>>>>>>> channel.
>>>>>>>
>>>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/media/i2c/max9286.c
>>
>>>>>>> +static int max9286_register_gpio(struct max9286_priv *priv)
>>>>>>> +{
>>>>>>> +  struct device *dev = &priv->client->dev;
>>>>>>> +  struct gpio_chip *gpio = &priv->gpio;
>>>>>>> +  int ret;
>>>>>>> +
>>>>>>> +  static const char * const names[] = {
>>>>>>> +          "GPIO0OUT",
>>>>>>> +          "GPIO1OUT",
>>>>>>> +  };
>>>>>>> +
>>>>>>> +  /* Configure the GPIO */
>>>>>>> +  gpio->label = dev_name(dev);
>>>>>>
>>>>>> So if you have more than one MAX9286 in a system, all gpiochips will appear
>>>>>> with the same name. I'd recommend to append the index to distinguish properly.
>>>>>
>>>>> Ah yes, that's a good point, and I think I've even seen that.
>>>>>
>>>>> I'll fix it now.
>>>
>>> Oh, in fact actually this doesn't.
>>>
>>> gpiodetect prints:
>>>
>>> gpiochip10 [4-004c] (2 lines)
>>> gpiochip11 [4-006c] (2 lines)
>>>
>>> and mostly references them as gpiochip10 and gpiochip11.
>>
>> Indeed, dev_name() should be different for each instance.
>>
> 
> Ah, my bad! Somehow I got confused that this delivers static name... Sorry for
> the noise, Kieran.
> 
>>> However,
>>>
>>>> [    2.318533] gpio gpiochip11: Detected name collision for GPIO name 'GPIO0OUT'
>>>> [    2.325739] gpio gpiochip11: Detected name collision for GPIO name 'GPIO1OUT'
>>>
>>> That seems to be more of a problem for the gpio library, so I think I'll
>>> just drop the const names. I don't think they add much value.
>>
> 
> Well, I should've pointed this instead of above...
> 
> (lack of coffee)
> 
>> These are the line names.  If they're not unique, a warning is printed,
>> but they are still registered.
>> So probably you want to use kasprintf("%s.%s", dev_name(dev), names[i]) to
>> generate names.
>>
> 
> Ack.
> 
> I think you should CC Linus W for next iteration to get review for gpiolib
> implementation.

Good idea. I think I'll drop the names though for now.

--
Kieran


> 
> Thanks,
> Mani
> 
>> See "[PATCH] gpiolib: Document that GPIO line names are not globally unique"
>> (https://lore.kernel.org/linux-gpio/20200511101828.30046-1-geert+renesas@glider.be/)
>> to clear up the details.
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                 -- Linus Torvalds

