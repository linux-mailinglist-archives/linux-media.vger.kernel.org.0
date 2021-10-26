Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6F743B27C
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 14:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbhJZMeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 08:34:24 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38981 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhJZMeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 08:34:22 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 76919FF804;
        Tue, 26 Oct 2021 12:31:55 +0000 (UTC)
Date:   Tue, 26 Oct 2021 14:32:46 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v9 00/36] v4l: subdev internal routing and streams
Message-ID: <20211026123246.3rv7yiavf7vycx2s@uno.localdomain>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <6c1dfc4d-ec8a-6643-b768-5fe507da495d@xs4all.nl>
 <60c9509b-6f39-8492-065d-72918670d49f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60c9509b-6f39-8492-065d-72918670d49f@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Oct 26, 2021 at 02:54:45PM +0300, Tomi Valkeinen wrote:
> Hi Hans,
>
> On 11/10/2021 18:29, Hans Verkuil wrote:
> > Hi Tomi,
> >
> > On 05/10/2021 10:57, Tomi Valkeinen wrote:
> > > Hi,
> > >
> > > This is v9 of the multiplexed streams series. v8 can be found from:
> > >
> > > https://lore.kernel.org/all/20210830110116.488338-1-tomi.valkeinen@ideasonboard.com/
> > >
> > > I have pushed my work branch to:
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v9
> > >
> > > which contains the patches in this series, along with subdev drivers
> > > using multiplexed streams.
> > >
> > > As can be guessed from the work branch, I have been testing this series
> > > with TI's FPDLink setup. I have also done a "backwards compatibility"
> > > test by dropping all multiplexed streams patches from the CAL driver
> > > (the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
> > > single-stream configuration.
> >
> > I hope to look at this series this week (fingers crossed), but I was asked to
> > give some input w.r.t. testing of this series:
>
> Thanks for the reviews! I'll start updating the series accordingly.
>
> > I think before this can be merged we need:
> >
> > 1) libcamera tests. Since libcamera would probably be the most active user of this
> > API, and you have HW for it, it makes a lot of sense that there are decent tests
> > for the supported HW in libcamera. That takes care of the real-world tests.
>
> I agree, libcamera would be a good userspace test. Laurent has been working
> on that.
>
> > 2) obviously the existing utils in v4l-utils need to be adapted to understand any
> > new API elements.
>
> Yes. I think it's "just" two things that are needed: ability to set a
> routing table (that might be quite messy via the cmdline for larger routing
> tables) and ability to set format and other parameters with a (pad,stream)
> tuple, instead of just pad.
>

For testing my series I have sketeched out
https://git.sr.ht/~jmondi_/v4l2-utils

I can work to make the patches there upstreamable

Thanks
   j


> > 3) compliance tests in v4l2-compliance for the new API. After I did a review of the
> > series we can see to what extent this is possible.
>
> One thing we have to fix are the problems caused by adding the 'stream'
> field to many structs, but I think fixing that is trivial.
>
> Actually testing routing and streams is a bit more difficult.
>
> > 4) optionally (for now at least, I reserve the right to change my mind): it would
> > be very helpful if this can be added to vimc (or something similar), allowing for
> > testing the API without having real hardware, which is useful both for writing
> > the tests and for running regression tests regularly on a simple VM, without needing
> > special hardware.
>
> I haven't studied the vimc code, but maybe a metadata stream would be an
> easy addition.
>
>  Tomi
>
