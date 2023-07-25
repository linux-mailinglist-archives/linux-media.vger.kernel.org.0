Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA21761039
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 12:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbjGYKFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 06:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbjGYKFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 06:05:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E95310FA
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 03:05:00 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE1614AD;
        Tue, 25 Jul 2023 12:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690279440;
        bh=Ei0EIUtn7SCal5YtKDPhOod+tQ9HmGlteaL7VXLGROQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rerwoZuQdb/rBWYoOD1iuUgZWj/cY8cIN/duzn8kxDEAfnRyKFJcBiDRLHZMplCvt
         arApFDcENB0cMAZ6ZwSW7gDLrS25Jsu6qdSTca42ESJqNPDtQkQZJQaVvNLtZoyCE0
         x0T6pFlkCD2EtDwQUqNFD74ICSUb5LXoQE+2MpOc=
Date:   Tue, 25 Jul 2023 12:04:55 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Message-ID: <sopwu4d3sx2wjuixp4fvts5urc3lqcfywoz7fgnp5jq77qhucp@ur4gn6g2vwds>
References: <20230724222210.162785-1-marex@denx.de>
 <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
 <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek

On Tue, Jul 25, 2023 at 11:41:18AM +0200, Marek Vasut wrote:
> On 7/25/23 11:04, Jacopo Mondi wrote:
> > Hi Marek
>
> Hi,
>
> > On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
> > > Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
> > > MIPI CSI2 interface, while 0 means CPI parallel interface.
> > >
> > > In the ov5640_set_power_mipi() the interface should obviously be set
> > > to MIPI CSI2 since this functions is used to power up the sensor when
> > > operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
> > > that case.
> >
> > Does this actually help fixing your 'first frame corrupted issue' ?
>
> Yes it does.
>
> > I think the logic here was to power up the interface here  in
> > ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
> > LP-11 mode (something some receivers like the imx6 one are
> > particularly sensible to).
>
> Per OV5640 datasheet.
>
> Register 0x300e bit 2 selects sensor interface mode between MIPI CSI2 and
> CPI (parallel), it has nothing to do with LP modes .
>
> Register 0x3019 bits [6:4] control LP00/LP11 mode on CSI2 lines.
>
> > Then at stream time the CSI-2 interface is actually enabled in
> > ov5640_set_stream_mipi() just before streaming is started.
> >
> > Also the register documentation is very confusing and as reported in
> > ov5640_set_stream_mipi() it is also probably wrong (at least in the
> > datasheet version I have).
> >
> > I would be particularly cautious in touching this sequence as it has
> > been validated to work with multiple receivers. Of course if it
> > actually fixes an issue for you it should be taken in, but ideally, as
> > this sensor is still used in a large number of evaluation boards, it
> > should be validated by other consumers of this driver (st, imx,
> > microchip and rensas to name a few).
>
> That's quite a tall order which effectively makes it impossible to change or
> fix anything in this driver.

Really? Asking other people which use this driver to test a patch before
merging it to make sure it doesn't break their setup makes "impossibile to
change of fix anything" ?

And it's not an order of any sort, but there are a lot of users of
this driver and multiple times fixing a thing on one side breaks
things for others, I'm just trying to coordinate between multiple
developers.
