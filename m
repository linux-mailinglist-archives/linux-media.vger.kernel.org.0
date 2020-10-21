Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA4A294CD1
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 14:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440455AbgJUMhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 08:37:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:64811 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440395AbgJUMhv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 08:37:51 -0400
IronPort-SDR: xyPOAPwsxk8MF9TVCmMi7u9D3kQJWSMObxgo6NoYogCibTjksPR7zCu+sSPJKJtMvvYXK2qrry
 l/sbWcc16CQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="163867651"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="163867651"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 05:37:51 -0700
IronPort-SDR: zySr8QdSXkmtyKNNgEHVJLhB6p7MiUfbh8yKKpoC71VhFIa6aoSf79MC5Xp7kM4AeRRuiTpCVh
 tnIxtb9u6gjQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="302003561"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 05:37:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EA1CF20815; Wed, 21 Oct 2020 15:37:47 +0300 (EEST)
Date:   Wed, 21 Oct 2020 15:37:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC PATCH] media: new driver mt9m02x for Onsemi MT9M024 and
 AR0141CS
Message-ID: <20201021123747.GG2703@paasikivi.fi.intel.com>
References: <20201020092732.GA30983@laureti-dev>
 <20201021095023.GE2703@paasikivi.fi.intel.com>
 <20201021112127.GA20160@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201021112127.GA20160@laureti-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helmut,

On Wed, Oct 21, 2020 at 01:21:27PM +0200, Helmut Grohne wrote:
> Hi,
> 
> On Wed, Oct 21, 2020 at 11:50:23AM +0200, Sakari Ailus wrote:
> > Thanks for the patch.
> > 
> > In general it seems fairly clean and it's nice to see PLL calculators being
> > used instead of hard-coding configuration, plus having support for multiple
> > devices. There's also obviously some work to be done still.
> 
> Thank you for the quick review.
> 
> I'm replying to topics that need feedback here. Those where there is
> agreement are simply trimmed from the reply to keep it short.
> 
> > On Tue, Oct 20, 2020 at 11:27:33AM +0200, Helmut Grohne wrote:
> > > This goes as far back as 2018, where I proposed[1] changing the
> > > aptina_pll_calculate function to solve the pix_clock approximately
> > > instead of giving up.
> > 
> > Yes, I remember this discussion. Perhaps we should get back to that, if
> > issues remain.
> 
> Yes, we deferred it, because it was difficult to see the practical issue
> without a public driver. That situation has just changed.
> 
> > I can't answer for aptina-pll, but in general, if the link frequency is
> > achievable (as within hardware specific limits) with a given external clock
> > frequency and the PLL calculator doesn't give you a valid PLL
> > configuration, it's a bug.
> > 
> > If so, another question is then how to fix it.
> 
> Let me give concrete numbers such that you can see where this breaks. In
> our main use case we have:
> 
> |         input-clock-frequency = < 50000000 >;
> |         pixel-clock-frequency = < 74250000 >;
> 
> For reference, the pll_limits for MT9M024 are:
> |         .ext_clock_min = 6000000,
> |         .ext_clock_max = 50000000,
> |         .int_clock_min = 2000000,
> |         .int_clock_max = 24000000,
> |         .out_clock_min = 384000000,
> |         .out_clock_max = 768000000,
> |         .pix_clock_max = 74250000,
> | 
> |         .n_min = 1,
> |         .n_max = 63,
> |         .m_min = 32,
> |         .m_max = 255,
> |         /* We fix p1 = 1 and control p2 here. */
> |         .p1_min = 4,
> |         .p1_max = 16,
> 
> For this configuration, the exact pixel clock is not achievable. It's
> not a bug in the sense that aptina-pll fails to find a solution where an
> exact one exists. Our algorithm yields:
> 
> | pll: 3 <= N <= 25
> | pll: 32 <= M <= 255
> | pll: 6 <= P1 <= 10
> 
> These are boundary reductions based on the input values. They're used to
> reduce the brute-force search space.
> 
> | pll: N 11 M 98 P1 6 pix_clock 74242424 Hz error 7576 Hz
> 
> These are the selected values and they approximate the target frequency
> quite well.
> 
> I guess, we could write this pixel clock into the device tree. Doing so
> is very inconvenient however. In essence, we'd have to do the
> computation offline and select the appropriate parameters for
> approximating our desired clock frequency and then insert the solution.
> At that point, it would be easier to skip the computation in the kernel
> entirely and just hard code the parameters.

I guess this indeed might be more a question of what is the purpose of a
PLL calculator. The SMIA PLL calculator was first merged with the SMIAPP
driver back in 2012, and the Aptina PLL calculator soon followed. I think
it is somewhat based on the SMIAPP PLL calculator.

The SMIA PLL configuration depends also on e.g. binning and format
configurations on the sensor, so there's also the runtime aspect that needs
to be taken into account. There are other factors such as the number of
lanes as well. It's not a static configuration.

Then again, CCS PLL allows for a lot more variability than SMIA. This
includes, but is _not limited to_, to number of physical lanes, lane vs.
system speed model, sensor's internal lanes in OP and VT domains, whether
OP domain SYS and PIX clocks are DDR, whether certain configurations can
have only legacy values or if extended values are supported and which PHY
is in use. Feel free to look at it here, it's not yet merged:

<URL:https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/ccs-pll.c?h=ccs>

There, the configuration heavily depends on sensor's properties as well.

The computational complexity of searching a "closest matching" frequency
there would be vastly higher than aiming for a specific frequency. The
former shouldn't be done at runtime IMHO.

A PLL calculator that comes up with a closest frequency to something, given
some input parameters, could be certainly useful when deciding what to put
to DT source (while taking EMI considerations into account), but I think
that's different from what a driver would use.

Does aptina-pll come up with a valid configuration if you specify the
precise link frequency?

> 
> > > The driver is in practical use. It mostly passes checkpatch.pl. Known
> > > issues:
> > >  * It presently defines 3 custom V4L2 CIDs inside the .c file. Those
> > >    will need a proper place. Possibly, there is some standard CID that
> > >    could replace them. Suggestions welcome.
> > 
> > I suppose the HDR ratios are the ratios between exposure times?
> 
> That is correct. In HDR mode, the imager performs three exposures where
> the exposure times are varied according to these ratios. The final image
> is blended together inside the imager. A possible consequence is motion
> blur.
> 
> > > +static const s64 mt9m02x_again_menu[] = {
> > > +	100000, /* 1x */
> > > +	125000, /* 1.25x */
> > > +	200000, /* 2x */
> > > +	250000, /* 2.5x */
> > > +	400000, /* 4x */
> > > +	500000, /* 5x */
> > > +	800000, /* 8x */
> > > +	1000000, /* 10x */
> > 
> > I guess you could remove three zeros from right as they're the same for
> > all.
> 
> Why do you think we can delete them? V4L2_CID_ISO_SENSITIVITY has a
> scale and that says that 100000 is to be used for "normal". Without the
> zeroes, those values loose meaning.

Ah, please ignore the comment then.

ISO sensitivity control is a bit higher level control than the analogue
gain but it mostly does the same thing. I wonder what others think. This is
probably more user friendly but I guess it doesn't cover all values the
hardware is capable of, or does it?

> 
> > A reverse Christmas tree form would be nicer.
> 
> There was a patch for checkpatch.pl adding support for reverse Christmas
> trees at https://lore.kernel.org/patchwork/patch/732076/.
> 
> > /* comment, please */
> 
> I think most SPDX-License-Identifier comments use // comments even in
> drivers/media/i2c. Is that an exception to the rule?

Yes.

> 
> > > +static const struct i2c_device_id mt9m02x_id[] = {
> > 
> > Could you use of_device_id table instead? I suppose you don't really need
> > platform data?
> 
> I posed the question of whether platform data support is needed in my
> previous mail. I can tell that I don't need platform data and rely on OF
> exclusively. I added support for it to mirror what other drivers do, but
> I can easily remove that.

I don't think there have been new sensor drivers that would include
platform data support for a few years. So please remove it.

> 
> This review went into detail a little more than I expected. The requests
> for structural changes are few. One of the bigger ones might be adding
> pm_runtime support. Overall that suggests the driver is closer to
> mainline than I expected.

Well, admittedly, there could be further comments on areas I didn't comment
on, but I think these were probably the main ones.

> 
> Beyond your reply, I also received a quick reply from Laurent Pinchart
> asking why there is no s_stream. The answer to that is that our
> application triggers the imager externally, so we didn't need it thus
> far. That also means that testing an implementation of s_stream is not
> easy for me. Is it ok to leave that for others to add as needed?

I'd probably add it now, possibly with a comment it wasn't tested.

> 
> A few open questions from my side remain. Both from the submission and
> from this mail. I'd hope to see some more conclusions here before
> sending another iteration. The most notable ones are:
>  * Is there a need for platform_data?
>  * Is streaming support required for new drivers?

No-one has submitted a sensor driver previously without streaming control
support. :-)

On most hardware it works just over I²C commands.

This leads to an interesting question regarding runtime PM --- how does the
driver determine the sensor needs to be powered on if it gets no s_stream
command? One option could be to add a control for external streaming
trigger.

How do you stop streaming? Is it level triggered, or how?

Which receiver driver are you using this btw.?

>  * What to do about the three extra V4L2 CIDs?

I need to think about this a little.

-- 
Kind regards,

Sakari Ailus
