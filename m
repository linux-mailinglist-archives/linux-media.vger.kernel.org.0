Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9531D2EFF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 13:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgENL7u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 14 May 2020 07:59:50 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45233 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENL7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 07:59:49 -0400
Received: by mail-oi1-f193.google.com with SMTP id d191so3996461oib.12;
        Thu, 14 May 2020 04:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jEYL14eESp80nRZi1JF+P2foLyJj6Mx55wfqANlAKcc=;
        b=mOZzvlhKhc0E1a3RCsWPGY0HNbNz76iDOisqeGPJ9V9V4Wivspi+cQYF3H7WaxSWqr
         45uvZzoGOPfKCeDuJZNOkUTLRAux98P1OShpPNZV1K7AqsgTbv+HzEz/jIQyqhsLSZaY
         0cjxrRws5A2pt8hq0bdagJ8RVZBms4ySMuwLOaen7cz2dF42SYvuklXoDeNcd1mWFRlM
         gN03DbCaJRlnIFbC5j0ZDn0ReBFQuOe54wO5DDskCoMr4NSjjXxTeR29wCAJQaAaBOfP
         gaBRUW6YUv6mInUmSdCz6O45ubel2OOCzPZ3u3Y5nGWXAQrG1kF5RVCmoDQOXd6oFLIM
         mYLA==
X-Gm-Message-State: AOAM530ICIdY2081pi8mgQqje1ppQHO5GW7qDiuzndKaRWTVK8uS9vGd
        9EdRkhP/Rt49PEFiXrelQYMOUbh3ZZsw25X6xxU=
X-Google-Smtp-Source: ABdhPJz88z3dxpOcoyTxa6ill55+uwbWotEXoYTdXICFz750JcG4sRlNn03GSjnTbn3iwd1O8UNJSvWqVG3FrE6YzlA=
X-Received: by 2002:aca:895:: with SMTP id 143mr3197679oii.153.1589457587072;
 Thu, 14 May 2020 04:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512181706.GA21014@Mani-XPS-13-9360> <11aca587-9438-4fba-081c-b82631e96989@ideasonboard.com>
 <20200514101356.GF2877@Mani-XPS-13-9360> <d492cbcb-3b13-82b8-8e5d-0f49320170a2@ideasonboard.com>
In-Reply-To: <d492cbcb-3b13-82b8-8e5d-0f49320170a2@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 May 2020 13:59:35 +0200
Message-ID: <CAMuHMdWSEY2q1f1iobrSXHYWzweV9yjk4i1ROj2Yde7DJMiabQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Thu, May 14, 2020 at 1:47 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 14/05/2020 11:13, Manivannan Sadhasivam wrote:
> > On Thu, May 14, 2020 at 11:02:53AM +0100, Kieran Bingham wrote:
> >> On 12/05/2020 19:17, Manivannan Sadhasivam wrote:
> >>> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> >>>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
> >>>> CSI-2 output. The device supports multicamera streaming applications,
> >>>> and features the ability to synchronise the attached cameras.
> >>>>
> >>>> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
> >>>> is supported over I2C, which implements an I2C mux to facilitate
> >>>> communications with connected cameras across the reverse control
> >>>> channel.
> >>>>
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> >>>> --- /dev/null
> >>>> +++ b/drivers/media/i2c/max9286.c

> >>>> +static int max9286_register_gpio(struct max9286_priv *priv)
> >>>> +{
> >>>> +  struct device *dev = &priv->client->dev;
> >>>> +  struct gpio_chip *gpio = &priv->gpio;
> >>>> +  int ret;
> >>>> +
> >>>> +  static const char * const names[] = {
> >>>> +          "GPIO0OUT",
> >>>> +          "GPIO1OUT",
> >>>> +  };
> >>>> +
> >>>> +  /* Configure the GPIO */
> >>>> +  gpio->label = dev_name(dev);
> >>>
> >>> So if you have more than one MAX9286 in a system, all gpiochips will appear
> >>> with the same name. I'd recommend to append the index to distinguish properly.
> >>
> >> Ah yes, that's a good point, and I think I've even seen that.
> >>
> >> I'll fix it now.
>
> Oh, in fact actually this doesn't.
>
> gpiodetect prints:
>
> gpiochip10 [4-004c] (2 lines)
> gpiochip11 [4-006c] (2 lines)
>
> and mostly references them as gpiochip10 and gpiochip11.

Indeed, dev_name() should be different for each instance.

> However,
>
> > [    2.318533] gpio gpiochip11: Detected name collision for GPIO name 'GPIO0OUT'
> > [    2.325739] gpio gpiochip11: Detected name collision for GPIO name 'GPIO1OUT'
>
> That seems to be more of a problem for the gpio library, so I think I'll
> just drop the const names. I don't think they add much value.

These are the line names.  If they're not unique, a warning is printed,
but they are still registered.
So probably you want to use kasprintf("%s.%s", dev_name(dev), names[i]) to
generate names.

See "[PATCH] gpiolib: Document that GPIO line names are not globally unique"
(https://lore.kernel.org/linux-gpio/20200511101828.30046-1-geert+renesas@glider.be/)
to clear up the details.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
