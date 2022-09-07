Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 254795B04CA
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 15:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiIGNL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 09:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiIGNL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 09:11:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6DC2E688
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 06:11:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F326DD;
        Wed,  7 Sep 2022 15:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662556280;
        bh=vH7ecl4u+qIuuH3YGH3VFOqhN0/7dkV3RE3coFDVbGc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wmuLdkhfggwXiRS4h2bj0R+/8RhOzRMS/kKbTtWZis02CH1r+kzc9Vpz7dfZLxYXe
         c5mUbxydIihEpUo1/wtUVxZdfOo/kYMOgGLFY1StgmQXwXpFn6/UjpWTmjoCfI8jbf
         rOCFkYHFkYBSbopSBZpvaZQtnESv9isA2m9noRD0=
Date:   Wed, 7 Sep 2022 16:11:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [Media Summit] Imaging Sensor functionality
Message-ID: <YxiYaVAkjFCCcLlj@pendragon.ideasonboard.com>
References: <CAPY8ntBGKkg=KOXaP9bBv6Y8c7Mgut0=w-LTsvKHZac=zzdJDQ@mail.gmail.com>
 <YxeJI8Fwf0ExkMTI@pendragon.ideasonboard.com>
 <CAPY8ntDdgWaFt3DkMHq_V3Uh3XT=smMH3Esgnj9eoiaE4Q+S-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDdgWaFt3DkMHq_V3Uh3XT=smMH3Esgnj9eoiaE4Q+S-Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 01:42:16PM +0100, Dave Stevenson wrote:
> On Tue, 6 Sept 2022 at 18:53, Laurent Pinchart wrote:
> > On Tue, Sep 06, 2022 at 05:14:30PM +0100, Dave Stevenson wrote:
> > > Hi All.
> > >
> > > I realise that I'm in a slightly different position from many mainline
> > > Linux-media developers in that I see multiple use cases for the same
> > > sensor, rather than a driver predominantly being for one
> > > product/platform. I'm therefore wanting to look at generic solutions
> > > and fully featured drivers. Users get to decide the use cases, not the
> > > hardware designers.
> >
> > Could you clarify here what you mean by users and hardware designers ?
> > Users can be understood as
> >
> > - Users of the camera sensor, i.e. OEMs designing a product
> > - Users of the hardware platform , i.e. software developers writing
> >   applications
> > - Users of the software, i.e. end-users
> 
> Users of the software.
> 
> Particularly on the Pi you have people using libcamera apps or Python
> bindings that want to be able to choose modes of operation without
> having to make kernel driver modifications.
> I generally don't mind if that is through userspace or DT, but the
> functionality should be exposed.
> 
> As an example, when the strobe signals were exposed for IMX477 we had
> people hooking up various high intensity strobe devices and other
> weird contraptions for synchronised events [1]. Can we replicate that
> sort of open-ended functionality in a standardised way within sensor
> kernel drivers so that the drivers are not constraining the use cases?

We have the same goal, so let's see if we can find a way to make it
happen :-)

> > Hardware designers could then equally mean
> >
> > - Sensor vendors
> > - SoC vendors
> > - Board vendors
> > - Product vendors
> 
> All of the above.
> 
> For those Product Vendors designing specific products based on an SoC
> and imaging sensor, if there is a defined mechanism that end users can
> get to, then they can also use it to configure their specific use
> case. Both cases therefore win. Hard coding their product's use case
> in a mainline driver limits other use cases.
> 
>   Dave
> 
> [1] https://forums.raspberrypi.com/viewtopic.php?t=281913
> 
> > > The issues I've raised are things that I've encountered and would
> > > benefit from a discussion to get views as to the direction that is
> > > perceived to be workable. I appreciate that some can not be solved
> > > immediately, but want to avoid too much bikeshedding in the first
> > > round of patches.
> > > What's realistic, and what pitfalls/limitations immediately jump out at people.
> > >
> > > Slides are at https://drive.google.com/file/d/1vjYJjTNRL1P3j6G4Nx2ZpjFtTBTNdeFG/view?usp=sharing
> >
> > Thank you, I will review that ASAP.
> >
> > > See you on Monday.

-- 
Regards,

Laurent Pinchart
