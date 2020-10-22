Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4A3295E26
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 14:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898003AbgJVMRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 08:17:33 -0400
Received: from mail.intenta.de ([178.249.25.132]:30253 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898000AbgJVMRd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 08:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=d+KbJ06AtrptkjfTvqUWZIAz7ghY5jopqxtQ3JO735o=;
        b=inWpncUNgmUsRX+m8uOrI7gQRPhaF6ziZcLP2Mu4n7YC3Vw5h68tvP8dbe2S/mCqZPegsZoph5X8nh82GzVrppC6iIHZCERLCy/XzYqZxnZCu9ZtuDhDWbepsfJ0LITAnR2fC+rZPV3u7o+j85xokjUxl118am8o9Cuq/5vOvYFU06Kgna+jG7ezNxMOwY633qlsjijvdqEbbp6YuAzvmt3Cs0Be/PpVefAR/M7OgI/9Q6/w8s0/qRToAV04dHMJPtmvbGUSpKpqUpFmIxE+Sx8aysDh6o8d18/rPKH49aPgGgIXJ7aUh2s1yzPmQ575dKm0An0GDgMyiw7lmGrRaQ==;
Date:   Thu, 22 Oct 2020 14:17:20 +0200
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC PATCH] media: new driver mt9m02x for Onsemi MT9M024 and
 AR0141CS
Message-ID: <20201022121720.GA16345@laureti-dev>
References: <20201020092732.GA30983@laureti-dev>
 <20201021095023.GE2703@paasikivi.fi.intel.com>
 <20201021112127.GA20160@laureti-dev>
 <20201021123747.GG2703@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201021123747.GG2703@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 02:37:47PM +0200, Sakari Ailus wrote:
> I guess this indeed might be more a question of what is the purpose of a
> PLL calculator. The SMIA PLL calculator was first merged with the SMIAPP
> driver back in 2012, and the Aptina PLL calculator soon followed. I think
> it is somewhat based on the SMIAPP PLL calculator.

I don't have an answer to that question. I originally started hard
coding the PLL parameters and then noticed that there is a calculator.
So I attempted using it and figured that "it didn't work" (for my use
case). That's how I ended up here.

> The SMIA PLL configuration depends also on e.g. binning and format
> configurations on the sensor, so there's also the runtime aspect that needs
> to be taken into account. There are other factors such as the number of
> lanes as well. It's not a static configuration.

If the PLL calculator needs to run at another time than probing, your
concerns about performance (in the earlier thread) make a lot more sense
to me. I had previously assumed that it was only ever used during probe.

> Then again, CCS PLL allows for a lot more variability than SMIA. This
> includes, but is _not limited to_, to number of physical lanes, lane vs.
> system speed model, sensor's internal lanes in OP and VT domains, whether
> OP domain SYS and PIX clocks are DDR, whether certain configurations can
> have only legacy values or if extended values are supported and which PHY
> is in use. Feel free to look at it here, it's not yet merged:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/ccs-pll.c?h=ccs>
> 
> There, the configuration heavily depends on sensor's properties as well.

You have succeeded at demonstrating the complexity.

> The computational complexity of searching a "closest matching" frequency
> there would be vastly higher than aiming for a specific frequency. The
> former shouldn't be done at runtime IMHO.
>
> A PLL calculator that comes up with a closest frequency to something, given
> some input parameters, could be certainly useful when deciding what to put
> to DT source (while taking EMI considerations into account), but I think
> that's different from what a driver would use.

A consequence of that would be not using the PLL calculator for this
driver and instead hard coding pre-computed PLL values in the device
tree.  Do you agree with that?

I actually implemented my PLL approximator in Python first and converted
it to kernel C afterwards. What would be a good place to put a PLL
approximator to be used by DT authors?

> Does aptina-pll come up with a valid configuration if you specify the
> precise link frequency?

Given that my PLL approximator has the same type signature as
aptina_pll_calculate, this was easy to check. It does not find a valid
configuration and both of us should have noticed that without having to
run the code.

The resulting frequency of the PLL approximator is not exactly 74242424.
That's a rounded value. A more precise representation would be
74242424.24242424 and it is not a whole number. aptina_pll_calculate
only deals with frequencies that are whole numbers though. It cannot do
the job.

The actual error message is "pll: no valid combined N*P1 divisor." and
that's quite expected given the above.

In retrospect, it was a good decision to defer the discussion on my PLL
approximator until there is a driver that uses it. We've now quickly
discovered the mismatch in assumptions.

> ISO sensitivity control is a bit higher level control than the analogue
> gain but it mostly does the same thing. I wonder what others think. This is
> probably more user friendly but I guess it doesn't cover all values the
> hardware is capable of, or does it?

All values supported by the hardware are precisely representable in the
ISO sensitivity menu. That applies to both imagers even though their
analogue gain handling is completely different.

> This leads to an interesting question regarding runtime PM --- how does the
> driver determine the sensor needs to be powered on if it gets no s_stream
> command? One option could be to add a control for external streaming
> trigger.

I have no clue. This seems to be a show-stopper for runtime PM as is.

> How do you stop streaming? Is it level triggered, or how?

We permanently put the imager into externally triggered mode. You could
also say that we start streaming on probe and never stop. We suppress
the trigger signal during reconfiguration.

> Which receiver driver are you using this btw.?

I cannot give any details on this. Maybe the closest description would
be "custom hardware". Getting legal to sign off on this driver was hard
enough.

Helmut
