Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70715B204E
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 16:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbiIHOPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 10:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbiIHOPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 10:15:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE9958091
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 07:15:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B960888;
        Thu,  8 Sep 2022 16:14:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662646498;
        bh=/mqKp9YHIbyV4ilHbr0+HkPE7DR+mrBcCI6MzAkWppc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OyOyW6vVt3T5hMsB0+7d6BAOosOqRGvYzQC3PPhoNTXDfmgUxoqS+6E6V69CskQ6r
         nTLPdQljr7IAyzTGR9XnnFoY2ddE9/fz/X9sk0ue8Yt/v3Q1f1xOYJn3XVApLuPClM
         BSFQItWLnaIAcIk6FUzyiz0hqNpq1rHvWEktcI68=
Date:   Thu, 8 Sep 2022 17:14:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
Message-ID: <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908080846.wursajjtc3mbja4u@houat>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> Hi Ricardo,
> 
> On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> > >   IP. What is not possible is upstreaming a driver. I don't see this as
> > >   significantly different between V4L2 and the new API proposal. I
> > >   expect this to be discussed on Monday.
> > 
> > I am only considering upstream drivers. There is not much to discuss
> > for downstream or closed drivers :)
> 
> Are we really discussing upstream *drivers*? If anything, it looks like
> the Kcam proposal moves most of the drivers out of upstream.

Given that the API proposal sets at a significant lower level than V4L2
in the stack, the concept of "userspace driver" (I meant it in the sense
of GPU support in mesa) plays a bigger role. It would be good to clarify
what is meant by "driver" and maybe use the term "kernel driver" when
only the kernel part is covered, to avoid misunderstandings.

> > > - Slide 31 mentions that entities can send operations internally and
> > >   listen to each other events. I'd like to better understand how that
> > >   will work without any abstraction in the API (as that is one of the
> > >   main design decision behind this new API) when those entities are from
> > >   different vendors, and handled by different drivers that are developed
> > >   independently (for instance, the camera sensor and the CSI-2 receiver,
> > >   or even the CSI-2 receiver and the ISP).
> > 
> > It is still under work.
> > 
> > Hardware, specially for standard buses,  should be resilient (not
> > crash) to format mismatches. Otherwise a mal-functionling sensor or
> > too much noise could crash the system (with or without kcam).
> > 
> > Drivers developed together should know about the rest of the system,
> > so that is not the issue here.
> > 
> > For drivers developed by different vendors for a standard bus, on
> > hardware that is not resilient (that was a mouthful), then we need to
> > prepare a set of read-only standard registers.
> 
> I'm not even sure that read-only registers would be enough. I've
> experienced first-hand DMA controllers that, when the camera has its
> timings completely off, end up completely confused and write way outside
> of its assigned buffer creating big chunks of corrupted memory in the
> system.
> 
> And that was by writing fairly legit values to registers that were meant
> for that, so we wouldn't be able to defend against it even with the
> smartest whitelist.
> 
> And we were in a "good faith" situation. Giving an attacker basically
> programmable access to DMA engines that might not be sitting behind an
> IOMMU seems like a very dangerous idea to me.

Do we need to preassign a range of CVE numbers ? :-)

> > > - Does the bike on slide 32 illustrate the difficult discussions we've
> > >   had in the past and how progress was hindered ? :-)
> > 
> > This is how we do code review at Google when two developers do not
> > want to work together. We take the bike to the rooftop and the two
> > developers that disagree tries to push the other developer to the edge
> > of the building.
> > 
> > The first second, when you see your colleague falling you think that
> > you have won.... then you realise that you are falling with them.
> 
> So the optimal solution would be that both stop pushing, or push the
> other just as hard without bulging? That doesn't seem like a good way to
> end up with a compromise ;)

-- 
Regards,

Laurent Pinchart
