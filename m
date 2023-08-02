Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B3976CE0E
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 15:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjHBNNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 09:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjHBNNN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 09:13:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3F4E6F
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 06:13:11 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1733E2AC;
        Wed,  2 Aug 2023 15:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690981926;
        bh=QhKnXjvwKQNU4i8mt6haALaFL4nO5u/oAtRYNkltQIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fvuN34wsCv+ZREIAryo6IEQj+VLz+9Fg7PWXKM7DCpptqGicmcB4e/U5tLcUfbtTm
         t/wULOBYhHckY2A46S0F5r7Y2q/QNXeyb+GC+159N9Fzy/EejCG6GPQDa9JLY7rS1e
         G3iCKtg7ioQRaho8KU2XIHNM8nr5ZXAM3wsLFcx8=
Date:   Wed, 2 Aug 2023 15:13:06 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jai Luthra <j-luthra@ti.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Marcel Ziswiler <marcel@ziswiler.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Francesco Dolcini <francesco@dolcini.it>,
        Aishwarya Kothari <aishwarya.kothari@toradex.com>
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Message-ID: <4kekhixn3gvz3lpsdlnvvhjam3zt6mscpywtczxem4zzothwwi@nabn5dojksmc>
References: <20230724222210.162785-1-marex@denx.de>
 <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
 <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
 <sopwu4d3sx2wjuixp4fvts5urc3lqcfywoz7fgnp5jq77qhucp@ur4gn6g2vwds>
 <24b03db9-237e-117b-b059-e719e1727177@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24b03db9-237e-117b-b059-e719e1727177@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek

On Tue, Jul 25, 2023 at 12:35:00PM +0200, Marek Vasut wrote:
> On 7/25/23 12:04, Jacopo Mondi wrote:
> > Hi Marek
>
> Hi,
>
> > On Tue, Jul 25, 2023 at 11:41:18AM +0200, Marek Vasut wrote:
> > > On 7/25/23 11:04, Jacopo Mondi wrote:
> > > > Hi Marek
> > >
> > > Hi,
> > >
> > > > On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
> > > > > Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
> > > > > MIPI CSI2 interface, while 0 means CPI parallel interface.
> > > > >
> > > > > In the ov5640_set_power_mipi() the interface should obviously be set
> > > > > to MIPI CSI2 since this functions is used to power up the sensor when
> > > > > operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
> > > > > that case.
> > > >
> > > > Does this actually help fixing your 'first frame corrupted issue' ?
> > >
> > > Yes it does.
> > >

Do you think it's worth mentioning it in the commit message ?

> > > > I think the logic here was to power up the interface here  in
> > > > ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
> > > > LP-11 mode (something some receivers like the imx6 one are
> > > > particularly sensible to).
> > >
> > > Per OV5640 datasheet.
> > >
> > > Register 0x300e bit 2 selects sensor interface mode between MIPI CSI2 and
> > > CPI (parallel), it has nothing to do with LP modes .
> > >
> > > Register 0x3019 bits [6:4] control LP00/LP11 mode on CSI2 lines.
> > >
> > > > Then at stream time the CSI-2 interface is actually enabled in
> > > > ov5640_set_stream_mipi() just before streaming is started.
> > > >
> > > > Also the register documentation is very confusing and as reported in
> > > > ov5640_set_stream_mipi() it is also probably wrong (at least in the
> > > > datasheet version I have).
> > > >
> > > > I would be particularly cautious in touching this sequence as it has
> > > > been validated to work with multiple receivers. Of course if it
> > > > actually fixes an issue for you it should be taken in, but ideally, as
> > > > this sensor is still used in a large number of evaluation boards, it
> > > > should be validated by other consumers of this driver (st, imx,
> > > > microchip and rensas to name a few).

Ok, I've been able to test on i.MX6Q which I was concerned for because
of its sensitivness to LP-11 detection.

Let alone that imx6 with ov5640 is broken on mainline because of
unrelated reasons [1] I've been able to confirm that the sensor still
works on this platform

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
[Test on imx6q]
Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Can you confirm you have tested with iMX8MP as well ?

Let me cc a few people that might be interested in testing this and
give them a bit of time to do so. After that let's collect this patch!

Thanks
  j


[1] My tree looks like:
6205990fa14e media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
91f44d7815aa media: ov5640: Fix initial RESETB state and annotate timings
015497e35950 media: i2c: ov5640: Implement get_mbus_config
cd4415af64e7 Revert "media: video-mux: update driver to active state"
d716bd480968 Revert "media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()"

> > >
> > > That's quite a tall order which effectively makes it impossible to change or
> > > fix anything in this driver.
> >
> > Really? Asking other people which use this driver to test a patch before
> > merging it to make sure it doesn't break their setup makes "impossibile to
> > change of fix anything" ?
> >
> > And it's not an order of any sort, but there are a lot of users of
> > this driver and multiple times fixing a thing on one side breaks
> > things for others, I'm just trying to coordinate between multiple
> > developers.
>
> I'm afraid my expression of skepticism to the expected amount of testing has
> been misinterpreted, and so was the message you were trying to convey, i.e.
> communication breakdown.
>
> So let me rephrase.
>
> If the expectation is that every change to this driver has to be tested by
> all aforementioned parties, then it will be very hard to get changes in,
> based on my previous experience.
>
> Maybe let's stop this part of the thread here, and focus on the upper part?
