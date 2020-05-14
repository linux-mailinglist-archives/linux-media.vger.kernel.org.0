Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD921D304A
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 14:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgENMsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 08:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726088AbgENMsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 08:48:46 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D8AC061A0E
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:48:46 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n15so983349pjt.4
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HH9s1RO49ZtqpXezfn4WcfsL3Wu1eFjXG3a4er9M5VM=;
        b=osEpHVY3rjAZwkvGBQY6IZcjr+rWAvBBT3RR2pRCeF8WQqqjBUcFijQ2A1iO4kddqZ
         cGXn0Vybzjm5R+LuztSsPhQouakQyqEMsBeXFhyv+6rf8lg3reNxZFCiW3/eqQKp0IlF
         fMLZ/2w4qfZDRCenzSetTk/2Kx3ILp8b+M4mObysfC7J+jcb0hOWINsIOuPU+qwiU+/4
         6opd3ZsAdTqC/4MboMI3ou9/eUjY+hOx2QbPa3m25L/2PB1ifPfqBNR4hlwD1nKqTwHJ
         L8ln7mINjlXveb0G4HGo32bwGC81ztYrCjy6GdOqWHRnfVJxWwsQIevDwAZrk3VKCWOA
         3C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HH9s1RO49ZtqpXezfn4WcfsL3Wu1eFjXG3a4er9M5VM=;
        b=C8C59ijhMCrr4Hpibz81OO7eY/wqzUObsfi12TRQN+JihfENpifsMj+R6WFzcsyQ10
         oZ0aauGB+KyaRJc4kfUvMZlaoGSYrYoUZO6IMXy9qibLJLLudiBz+OEvmNEVZJ3tdZ/F
         r01rZeFudp+UMTsEeR3t56brfJ4m5and3Jor59jRcW8LGwUbomjk4ShVscLovMbai/Xm
         qIErl06Ka03/J/OMK7LhFsFVevJZCtL5YTrYOnS5cvu3W/6EhDkD7iZebDd9cYura/JO
         jVqsBeezDKTv/Ra5fF22s0nqSuvsOTZTRdrLbYHokHXUpqqVXkuu1Bqtzl/xHtZgQXZA
         eNgQ==
X-Gm-Message-State: AOAM533WfKemLxut/Jnv51e5R//Pd6N4HuMmVekcQLGAPutN61SdReao
        iQ3GR9S0j14D9LNO46BNBmBo
X-Google-Smtp-Source: ABdhPJxdddKbpOXRE7WZ+kpkkncGEFB3l+dgPbB0dnOaYGPN7BHIpGk9Y0Z1bXstUpFiVvx4TZRSqQ==
X-Received: by 2002:a17:902:d70f:: with SMTP id w15mr4121397ply.55.1589460525640;
        Thu, 14 May 2020 05:48:45 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:406:efde:ac17:556c:1ce3:639f])
        by smtp.gmail.com with ESMTPSA id t21sm2126873pgu.39.2020.05.14.05.48.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:48:44 -0700 (PDT)
Date:   Thu, 14 May 2020 18:18:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 2/4] media: i2c: Add MAX9286 driver
Message-ID: <20200514124831.GG2877@Mani-XPS-13-9360>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-3-kieran.bingham+renesas@ideasonboard.com>
 <20200512181706.GA21014@Mani-XPS-13-9360>
 <11aca587-9438-4fba-081c-b82631e96989@ideasonboard.com>
 <20200514101356.GF2877@Mani-XPS-13-9360>
 <d492cbcb-3b13-82b8-8e5d-0f49320170a2@ideasonboard.com>
 <CAMuHMdWSEY2q1f1iobrSXHYWzweV9yjk4i1ROj2Yde7DJMiabQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWSEY2q1f1iobrSXHYWzweV9yjk4i1ROj2Yde7DJMiabQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 14, 2020 at 01:59:35PM +0200, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, May 14, 2020 at 1:47 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > On 14/05/2020 11:13, Manivannan Sadhasivam wrote:
> > > On Thu, May 14, 2020 at 11:02:53AM +0100, Kieran Bingham wrote:
> > >> On 12/05/2020 19:17, Manivannan Sadhasivam wrote:
> > >>> On Tue, May 12, 2020 at 04:51:03PM +0100, Kieran Bingham wrote:
> > >>>> The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
> > >>>> CSI-2 output. The device supports multicamera streaming applications,
> > >>>> and features the ability to synchronise the attached cameras.
> > >>>>
> > >>>> CSI-2 output can be configured with 1 to 4 lanes, and a control channel
> > >>>> is supported over I2C, which implements an I2C mux to facilitate
> > >>>> communications with connected cameras across the reverse control
> > >>>> channel.
> > >>>>
> > >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > >>>> --- /dev/null
> > >>>> +++ b/drivers/media/i2c/max9286.c
> 
> > >>>> +static int max9286_register_gpio(struct max9286_priv *priv)
> > >>>> +{
> > >>>> +  struct device *dev = &priv->client->dev;
> > >>>> +  struct gpio_chip *gpio = &priv->gpio;
> > >>>> +  int ret;
> > >>>> +
> > >>>> +  static const char * const names[] = {
> > >>>> +          "GPIO0OUT",
> > >>>> +          "GPIO1OUT",
> > >>>> +  };
> > >>>> +
> > >>>> +  /* Configure the GPIO */
> > >>>> +  gpio->label = dev_name(dev);
> > >>>
> > >>> So if you have more than one MAX9286 in a system, all gpiochips will appear
> > >>> with the same name. I'd recommend to append the index to distinguish properly.
> > >>
> > >> Ah yes, that's a good point, and I think I've even seen that.
> > >>
> > >> I'll fix it now.
> >
> > Oh, in fact actually this doesn't.
> >
> > gpiodetect prints:
> >
> > gpiochip10 [4-004c] (2 lines)
> > gpiochip11 [4-006c] (2 lines)
> >
> > and mostly references them as gpiochip10 and gpiochip11.
> 
> Indeed, dev_name() should be different for each instance.
> 

Ah, my bad! Somehow I got confused that this delivers static name... Sorry for
the noise, Kieran.

> > However,
> >
> > > [    2.318533] gpio gpiochip11: Detected name collision for GPIO name 'GPIO0OUT'
> > > [    2.325739] gpio gpiochip11: Detected name collision for GPIO name 'GPIO1OUT'
> >
> > That seems to be more of a problem for the gpio library, so I think I'll
> > just drop the const names. I don't think they add much value.
> 

Well, I should've pointed this instead of above...

(lack of coffee)

> These are the line names.  If they're not unique, a warning is printed,
> but they are still registered.
> So probably you want to use kasprintf("%s.%s", dev_name(dev), names[i]) to
> generate names.
> 

Ack.

I think you should CC Linus W for next iteration to get review for gpiolib
implementation.

Thanks,
Mani

> See "[PATCH] gpiolib: Document that GPIO line names are not globally unique"
> (https://lore.kernel.org/linux-gpio/20200511101828.30046-1-geert+renesas@glider.be/)
> to clear up the details.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
