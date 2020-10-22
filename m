Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DD2295EB4
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 14:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440871AbgJVMj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 08:39:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:41659 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440792AbgJVMj4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 08:39:56 -0400
IronPort-SDR: dST7pBc0S6EKmaaHGxnc7kAutmphnaBMnaTMNTxF6K74bKbDJYreL0ys7e7gRkoCvqNSGNm4Zr
 qjVPp0M1VhSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164923848"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="164923848"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 05:39:55 -0700
IronPort-SDR: y/25GphroSa4SDGsYKhiwu3aDnnvBHUhY1Y3pGNZVKR1Tq/IOPnvCrgYbGFHxcijF6YuGARLYw
 p337S+2pnysw==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
   d="scan'208";a="302415126"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2020 05:39:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 735D72073D; Thu, 22 Oct 2020 15:39:52 +0300 (EEST)
Date:   Thu, 22 Oct 2020 15:39:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC PATCH] media: new driver mt9m02x for Onsemi MT9M024 and
 AR0141CS
Message-ID: <20201022123952.GM2703@paasikivi.fi.intel.com>
References: <20201020092732.GA30983@laureti-dev>
 <20201021095023.GE2703@paasikivi.fi.intel.com>
 <20201021112127.GA20160@laureti-dev>
 <20201021123747.GG2703@paasikivi.fi.intel.com>
 <20201022121720.GA16345@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022121720.GA16345@laureti-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 02:17:20PM +0200, Helmut Grohne wrote:
> On Wed, Oct 21, 2020 at 02:37:47PM +0200, Sakari Ailus wrote:
> > I guess this indeed might be more a question of what is the purpose of a
> > PLL calculator. The SMIA PLL calculator was first merged with the SMIAPP
> > driver back in 2012, and the Aptina PLL calculator soon followed. I think
> > it is somewhat based on the SMIAPP PLL calculator.
> 
> I don't have an answer to that question. I originally started hard
> coding the PLL parameters and then noticed that there is a calculator.
> So I attempted using it and figured that "it didn't work" (for my use
> case). That's how I ended up here.
> 
> > The SMIA PLL configuration depends also on e.g. binning and format
> > configurations on the sensor, so there's also the runtime aspect that needs
> > to be taken into account. There are other factors such as the number of
> > lanes as well. It's not a static configuration.
> 
> If the PLL calculator needs to run at another time than probing, your
> concerns about performance (in the earlier thread) make a lot more sense
> to me. I had previously assumed that it was only ever used during probe.
> 
> > Then again, CCS PLL allows for a lot more variability than SMIA. This
> > includes, but is _not limited to_, to number of physical lanes, lane vs.
> > system speed model, sensor's internal lanes in OP and VT domains, whether
> > OP domain SYS and PIX clocks are DDR, whether certain configurations can
> > have only legacy values or if extended values are supported and which PHY
> > is in use. Feel free to look at it here, it's not yet merged:
> > 
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/ccs-pll.c?h=ccs>
> > 
> > There, the configuration heavily depends on sensor's properties as well.
> 
> You have succeeded at demonstrating the complexity.
> 
> > The computational complexity of searching a "closest matching" frequency
> > there would be vastly higher than aiming for a specific frequency. The
> > former shouldn't be done at runtime IMHO.
> >
> > A PLL calculator that comes up with a closest frequency to something, given
> > some input parameters, could be certainly useful when deciding what to put
> > to DT source (while taking EMI considerations into account), but I think
> > that's different from what a driver would use.
> 
> A consequence of that would be not using the PLL calculator for this
> driver and instead hard coding pre-computed PLL values in the device
> tree.  Do you agree with that?

I have no objections in principle, but there should be a good reason for
doing so.

Does the device support e.g. binning, and are there dependencies between
PLL configuration and binning configuration?

> 
> I actually implemented my PLL approximator in Python first and converted
> it to kernel C afterwards. What would be a good place to put a PLL
> approximator to be used by DT authors?

Perhaps another repository somewhere would be a better place than the
kernel? We don't have them at the moment. Finding the desired frequency
hasn't been the complicated part in the past and admittedly in general not
a problem driver developers need to solve.

> 
> > Does aptina-pll come up with a valid configuration if you specify the
> > precise link frequency?
> 
> Given that my PLL approximator has the same type signature as
> aptina_pll_calculate, this was easy to check. It does not find a valid
> configuration and both of us should have noticed that without having to
> run the code.

I'm not quite sure what you mean. The frequency needs to be precise, but I
believe one Hz accuracy is enough. In practice, the external clock
frequency is not infinitely precise either.

> 
> The resulting frequency of the PLL approximator is not exactly 74242424.
> That's a rounded value. A more precise representation would be
> 74242424.24242424 and it is not a whole number. aptina_pll_calculate
> only deals with frequencies that are whole numbers though. It cannot do
> the job.

What does need to be documented how frequencies that aren't precise integer
values are rounded. This isn't there at the moment. Rounding down would be
very simple and probably good enough.

If the PLL calculator does not lose information too early in its job,
there's no reason why it couldn't produce a result at precision of 1 Hz.

> 
> The actual error message is "pll: no valid combined N*P1 divisor." and
> that's quite expected given the above.
> 
> In retrospect, it was a good decision to defer the discussion on my PLL
> approximator until there is a driver that uses it. We've now quickly
> discovered the mismatch in assumptions.
> 
> > ISO sensitivity control is a bit higher level control than the analogue
> > gain but it mostly does the same thing. I wonder what others think. This is
> > probably more user friendly but I guess it doesn't cover all values the
> > hardware is capable of, or does it?
> 
> All values supported by the hardware are precisely representable in the
> ISO sensitivity menu. That applies to both imagers even though their
> analogue gain handling is completely different.

Ack. Sounds good.

> 
> > This leads to an interesting question regarding runtime PM --- how does the
> > driver determine the sensor needs to be powered on if it gets no s_stream
> > command? One option could be to add a control for external streaming
> > trigger.
> 
> I have no clue. This seems to be a show-stopper for runtime PM as is.

Why? Adding one control, that is?

> 
> > How do you stop streaming? Is it level triggered, or how?
> 
> We permanently put the imager into externally triggered mode. You could
> also say that we start streaming on probe and never stop. We suppress
> the trigger signal during reconfiguration.

The driver should probably enforce that in general case to avoid broken
frames, if hardware allows.

> 
> > Which receiver driver are you using this btw.?
> 
> I cannot give any details on this. Maybe the closest description would
> be "custom hardware". Getting legal to sign off on this driver was hard
> enough.

Ack.

-- 
Kind regards,

Sakari Ailus
