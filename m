Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D7441B369
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 18:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241559AbhI1QDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 12:03:43 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:41639 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241443AbhI1QDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 12:03:42 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 29C952000E;
        Tue, 28 Sep 2021 16:02:01 +0000 (UTC)
Date:   Tue, 28 Sep 2021 18:02:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Borut Lampe <nude.bird@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: OV5640 720p@60fps
Message-ID: <20210928160249.xcgpay5x2kaccsdi@uno.localdomain>
References: <CAHfbzRsFzunBDNPbQt=HUx+cBSHdBzzrJ-s4bjj+bEoB2sNvqw@mail.gmail.com>
 <20210928095023.ezrmeivie3yr7su5@uno.localdomain>
 <CAHfbzRuRnwijtdaE_HgBYFf25tBm1xd=Qp5Dya14TpvaYfOGSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHfbzRuRnwijtdaE_HgBYFf25tBm1xd=Qp5Dya14TpvaYfOGSQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Borut,

On Tue, Sep 28, 2021 at 04:31:11PM +0200, Borut Lampe wrote:
> Hi Jacopo,
>
> I am using MIPI CSI-2 with the Qualcomm Camera Subsystem driver on a
> custom 820 dragonboard.

2 lanes, right ?

I don't have an easy solution but I can provide a bit of context.

It started with
aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")

where we moved to compute the clock tree at runtime instead of relying
on the hardcoded configuration in the register tables:

c14d107e7417 ("media: ov5640: Remove the clocks registers initialization")

From there the ov5640_set_mipi_pclk() went in and we never really got
to a version that works for all the modes supported by the sensor.

There were a few attempts to improve it, Tomi has found a discrepancy
in the H/V TOT values, I tried to re-implement the CSI-2 clock tree
calculation, but we never get to a set of results that was globally
satisfying and I guess we all dropped the ball

You can find more about that here:
https://patchwork.linuxtv.org/project/linux-media/cover/20201028225706.110078-1-jacopo+renesas@jmondi.org/

And if you're willing to test those patches and see if the situation
improves it would be very useful.

Thanks and good luck!

>
> Kind regards,
> Borut
>
> V V tor., 28. sep. 2021 ob 11:49 je oseba Jacopo Mondi
> <jacopo@jmondi.org> napisala:
> >
> > Hi Borut,
> >    which kind of setup are you working with, parallel or CSI-2 ?
> >
> > On Thu, Sep 23, 2021 at 12:37:01PM +0200, Borut Lampe wrote:
> > > Hi,
> > >
> > > I noticed that for now only VGA resolution supports 60fps even though
> > > the documentation says that 60fps is possible also for 1280x720.
> > > Is there a reason this hasn't been implemented yet (e.g hardware
> > > restraints)? Are there any plans to implement this? Can anyone give me
> > > some pointers on what would have to be changed in the ov5640 driver to
> > > achieve this (starting point would be linaro kernel qcomlt-4.14)?
> > >
> > > Kind regards,
> > > Borut
