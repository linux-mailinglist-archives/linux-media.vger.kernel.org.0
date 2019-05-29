Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1EC2E3D5
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfE2RqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:46:23 -0400
Received: from casper.infradead.org ([85.118.1.10]:44188 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfE2RqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WTChWnFrdlSwWyNUxOcrMB9Sjm8UPIf7xsXOjVVk/vs=; b=Jtx3F/9JSmmX46ec/MUjW69ymB
        anLis22bA1V6Nnrf7d5iRSRp+vCCL2Ma+lLVRyi9F91n3y21nyL9nxZqPpIy6nx1xTPUVLq3NGJCt
        tVzHvyNlwVdNhJiJdL8NxTfN+mAQLHx0AtkOavvp4ZEftZBt4sGQVaLw1uH0FEyhqyKSyBs5RBk51
        qb8t549HyD1ISWWj2UKtiEEHKz7bg0zkYrMGSfR6mmKvfjNTzR7gqJW0uPM0J9ahziLhBUJ2HIbS+
        M0IBSNmwyiQ9RneQHkzWnETCkfbPh2h8eCv3iD3A6YdQq07GJ3H9Nw5n+oGkUqTdjc8YSQfzNsJqY
        CccGE5OA==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hW2eM-0001jn-3L; Wed, 29 May 2019 17:46:06 +0000
Date:   Wed, 29 May 2019 14:45:59 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, rmfrfs@gmail.com,
        zhengsq@rock-chips.com, prabhakar.csengg@gmail.com, corbet@lwn.net,
        wenyou.yang@microchip.com, lkundrak@v3.sk,
        hverkuil-cisco@xs4all.nl, jacopo+renesas@jmondi.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: v4l2-subdev: add stubs for
 v4l2_subdev_get_try_*
Message-ID: <20190529144538.77801fbd@coco.lan>
In-Reply-To: <20190405072604.2wul74tibybdw644@pengutronix.de>
References: <20190404074002.18730-1-m.felsch@pengutronix.de>
        <20190404074002.18730-2-m.felsch@pengutronix.de>
        <20190404083933.33ejwyko4xoittux@paasikivi.fi.intel.com>
        <20190404143947.do4lmvxrvnzubtl7@uno.localdomain>
        <20190405072604.2wul74tibybdw644@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 5 Apr 2019 09:26:04 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> Hi Sakari, Jacopo,
> 
> On 19-04-04 16:39, Jacopo Mondi wrote:
> > Hi Marco, Sakari,
> > 
> > On Thu, Apr 04, 2019 at 11:39:34AM +0300, Sakari Ailus wrote:  
> > > Hi Marco,
> > >
> > > On Thu, Apr 04, 2019 at 09:39:57AM +0200, Marco Felsch wrote:  
> > > > In case of missing CONFIG_VIDEO_V4L2_SUBDEV_API those helpers aren't
> > > > available. So each driver have to add ifdefs around those helpers or
> > > > add the CONFIG_VIDEO_V4L2_SUBDEV_API as dependcy.
> > > >
> > > > Make these helpers available in case of CONFIG_VIDEO_V4L2_SUBDEV_API
> > > > isn't set to avoid ifdefs. This approach is less error prone too.
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > > The patch was previously part of series [1]. Since I want to get
> > > > series [1] merged in 5.2 I split this possible stopper out of the
> > > > serie and prepared a own series for it. I applied Jacopos comments and
> > > > switched to Lubomir's approach [2]. During discussion on series [2]
> > > > Sakari pointed out Hans approach [3] which didn't got into the kernel
> > > > due to Mauro's concerns. So I think this would be the smalles common
> > > > dennominator.
> > > >
> > > > [1] https://patchwork.kernel.org/cover/10786553/
> > > > [2] https://patchwork.kernel.org/patch/10703029/
> > > > [3] https://patchwork.linuxtv.org/patch/53370/
> > > > ---
> > > >  include/media/v4l2-subdev.h | 29 ++++++++++++++++++++++++++++-
> > > >  1 file changed, 28 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index a7fa5b80915a..eea792757426 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -984,7 +984,34 @@ static inline struct v4l2_rect
> > > >  		pad = 0;
> > > >  	return &cfg[pad].try_compose;
> > > >  }
> > > > -#endif
> > > > +
> > > > +#else /* !defined(CONFIG_VIDEO_V4L2_SUBDEV_API) */
> > > > +
> > > > +static inline struct v4l2_mbus_framefmt
> > > > +*v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
> > > > +			    struct v4l2_subdev_pad_config *cfg,
> > > > +			    unsigned int pad)
> > > > +{
> > > > +	return ERR_PTR(-ENOTTY);
> > > > +}  
> > >
> > > Almost all users of these functions directly use the struct pointer they
> > > receive from the said functions, without checks for the pointer value.

It they depends on VIDEO_V4L2_SUBDEV_API, there's no problem with that.

> > >
> > > These drivers now depend on CONFIG_VIDEO_V4L2_SUBDEV_API, but for new
> > > drivers it could be possible to miss that, leading to dereferencing
> > > ERR_PTR(-ENOTTY) as a result if the sub-device API isn't enabled.

If they require subdev API, but doesn't don't depend on such config, 
then they're already broken: they won't work, and probably will crash
the Kernel somewhere.

> > >
> > > I have to say I'm not a huge fan of such a change; it's one more such thing
> > > to remember that results in a kernel crash if you get it wrong.
> > >  
> > 
> > Unfortunately, I have to agree with Sakari here
> >  
> 
> Are those drivers depending on CONFIG_VIDEO_V4L2_SUBDEV_API used by
> usb-bridge devices? I Remember that was Mauro's concern on Hans RFC patch.
> I'm with you the "depending way" is quite better.

Neither USB or normal PCI drivers should depend on VIDEO_V4L2_SUBDEV_API.

There are, currently, 3 PCI drivers that depends on it:

1) drivers/media/pci/cobalt/Kconfig

   This is for a development board that not publicly available. So, I don't 
   care about what it depends on.

   Yet, I suspect that it depends on subdev just because of those drivers,
   with also depends on it:

	drivers/media/pci/cobalt/cobalt-driver.c:#include <media/i2c/adv7604.h>
	drivers/media/pci/cobalt/cobalt-driver.c:#include <media/i2c/adv7842.h>
	drivers/media/pci/cobalt/cobalt-driver.c:#include <media/i2c/adv7511.h>

2) drivers/media/pci/intel/ipu3/Kconfig

   This one seems to be the only valid case for the dependency: the IPU3
   hardware is actually part of an Intel SoC that depends on subdevs 
   and behave like any other platform driver: it will only work after
   setting a MC pipeline and command the sub-devices directly via the
   subdev API.

3) drivers/media/pci/sta2x11/Kconfig

   This one looks weird for me. It sounds that it uses just the
   adv7180 i2c driver. I suspect that it depends on VIDEO_V4L2_SUBDEV_API
   just because the I2C driver assumes that the subdev API is always
   there.

   IMO, adv7180 should be fixed to not depend on it anymore, and
   let sta2x11 to also build without such dependency.

Perhaps with the addition of this patch, (1) and (3) can be build and
run without depending at the subdev API.

> 
> > > I wonder if v4l2_subdev_call() could become a bit smarter about this;
> > > checking whether the try format is attempted to be obtained without the
> > > sub-device API being enabled, and returning an error in that case without
> > > passing the IOCTL to the driver at all.  
> > 
> > I'm not much excited by the idea of specializing v4l2_subdev_call(), I
> > had a try and I would be ashemed of sharing that code. If someone
> > could come up with something nice we could consider this too.
> > 
> > For the record, it is not enough to check for V4L2_SUBDEV_API and try
> > format, as a few (1?) bridge drivers calls the subdev operation providing a
> > 'v4l2_subdev_pad_config' argument, that could be used by the sensor
> > drivers in place of the one returned from v4l2_subdev_get_try_*, if
> > V4L2_SUBDEV_API is not available  
> 
> Thats true. One thing to think about your caller. This code won't work
> if you are using the existing ov* implementations too since the ceu
> don't depend on the subdev-api too.
> 
> So including your record increases the complexity.
> 
> > 
> > Caller:
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/renesas-ceu.c#L858
> > Sensor:
> > https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/mt9v111.c#L792
> > 
> > As I wrote both, they could be very well be wrong, but if they're not,
> > one other option would be to refuse NULL v4l2_subdev_pad_config arguments
> > (changing most of the bridge drivers in mainline) and move the code
> > linked above here from the mt9v111 driver to the v4l2_subdev_get_try_*
> > functions.
> >   
> > >
> > > Just an idea. It doesn't have to be in the same patchset.
> > >
> > > I'd still prefer enabling subdev API always to decrease the number of
> > > possible different kernel configurations.  
> > 
> > That would be best imho, but Hans' attempt didn't go very far because
> > of the issue Marco reported in his cover letter.  
> 
> Yes, that's also my favourite.
> 
> @Mauro
> Can you point out your concerns 'again'? Maybe we can apply Hans
> approach and will fix the 'maybe' broken usb-bridge devices.
> 

The point is: only platform drivers require the subdev API; for
USB/PCI drivers, this is not needed, and the core can be simplified
in order to give a smaller footprint. Of course, drivers that depend
on subdevs won't be compiled, but sensors can still work. The em28xx
cameras, for example, use a few sensor drivers that can optionally
export the subdev API, when the bridge driver supports it (with is not
the case of the em28xx bridge itself).

Looking at this patch, I don't see why it would cause any problems
that aren't already there.

Thanks,
Mauro
