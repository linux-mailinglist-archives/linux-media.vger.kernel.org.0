Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF75F40CD7D
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 21:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhIOTxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 15:53:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:19949 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229732AbhIOTxT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 15:53:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="307963041"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="307963041"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 12:52:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="482468324"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 12:51:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 42E0920656; Wed, 15 Sep 2021 22:51:53 +0300 (EEST)
Date:   Wed, 15 Sep 2021 22:51:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-staging@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/22] media: sunxi: Remove the sun6i-csi driver
 implementation
Message-ID: <YUJO2cG/46vOkuBe@paasikivi.fi.intel.com>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-16-paul.kocialkowski@bootlin.com>
 <20210913081707.3pjcfuwan46pbdep@gilmour>
 <YUBXiSrQjccLoa8b@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUBXiSrQjccLoa8b@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul, Maxime,

On Tue, Sep 14, 2021 at 10:04:25AM +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Mon 13 Sep 21, 10:17, Maxime Ripard wrote:
> > On Fri, Sep 10, 2021 at 08:41:40PM +0200, Paul Kocialkowski wrote:
> > > As described in the commit adding support for the new sun6i-csi driver,
> > > a complete rewrite was necessary to support the Allwinner A31 ISP as
> > > well as fix a number of issues with the current implementation.
> > > 
> > > Farewell and thanks for all the pixels!
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > 
> > For completeness, this is what the other commit log mentions:
> > 
> > > While adapting the sun6i-csi driver for MIPI CSI-2 support was
> > > possible, it became clear that adding support for the ISP required
> > > very heavy changes to the driver which were quite hard to break down
> > > into a series of subsequent changes.
> > 
> > > The first major difficulty comes from the lack of v4l2 subdev that
> > > acts a bridge, separate from the video node representing the DMA
> > > engine. To support the ISP, only parts of the hardware must be
> > > configured (excluding aspects related to the DMA output), which made
> > > the separation a hard requirement.
> > 
> > > Another significant difficulty was the specific dance that is required
> > > to have both the ISP and CSI device be part of the same media device.
> > > Because the ISP and CSI are two different hardware blocks, they have
> > > two distinct drivers that will each try to register their own v4l2
> > > and media devices, resulting in two distinct pipelines. When the ISP
> > > is in use, we actually want the CSI driver to register with the ISP's
> > > v4l2 and media devices while keeping the ability to register its own
> > > when the ISP is not in use. This is done by:
> > > 1. Having the CSI driver check whether the ISP is available, using
> > >    sun6i_csi_isp_detect();
> > > 2. If not, it can register when its own async subdevs are ready, using
> > >    sun6i_csi_v4l2_complete();
> > > 3. If so, it will register its bridge as an async subdev which will
> > >    be picked-up by the ISP driver (from the fwnode graph link);
> > > 4. When the subdev becomes bound to the ISP's v4l2 device, we can
> > >    then access that device (and the associated media device) to
> > >    complete registration of the capture video node, using
> > >    sun6i_csi_isp_complete();
> > > Besides the logic rework, other issues were identified and resolved:
> > > - The sync mechanism for buffer flipping was based on the frame done
> > >   interrupt, which is too late (next frame is already being processed).
> > >   This lead to requiring 3 buffers to start and writing two addresses
> > >   when starting. Using vsync as a sync point seems to be the correct
> > >   approach and allows using only two buffers without tearing;
> > > - Using devm_regmap_init_mmio_clk was incorrect since the reset also
> > >   comes into play;
> > > - Some register definitions were inverted compared to their actual
> > >   effect (which was inherited from the Allwinner documentation and
> > >   code): comments were added where relevant;
> > > - The deprecated v4l2_async_notifier_parse_fwnode_endpoints() helper
> > >   is no longer used by the driver;
> > 
> > With that being said, NAK.
> > 
> > Having heavy changes to a driver is completely fine, and is kind of
> > expected really with such a big change. Breaking all possibility of
> > bisection and throwing away years of stabilization and maintenance
> > isn't.
> > 
> > And all those small bug fixes you mention at the end are just that:
> > small bug fixes that can be done on the current driver just fine too.
> 
> I understand that this looks like we're trashing all the work that was
> done previously by removing the current driver and adding the new one
> but the logic for deciding what to write into registers was carefully
> preserved from the original driver to make sure that the works of
> stabilization and maintenance are not lost.
> 
> However I would understand that my good promise on this is not enough,
> so perhaps I could provide a combinatory verification that the same set
> of mbus/pixel formats end up with the same thing being written into
> registers.
> 
> In addition I understand that it will be necessary to split the changes
> up into small commits to clarify the transition path between the two
> drivers. So I will do my best to split things up.
> 
> Does that seem like an agreeable plan or do you see other things that
> would be blockers?

Please do refactor the patches into reviewable chunks that make sense on
their own. I'd see the result being the same driver but with additional
patches fixing bugs, doing some or more refactoring and adding new
functionality. Please use -C100 -M100 if there's a need to rename files,
and preferrably do so in separate patches.

See e.g. patches to the smiapp driver that turned it into a CCS driver:

	git log 2db8166f739e75c1269d7e8afe8da68e70098810..b24cc2a18c50e4e315abc76a86b26b4c49652f79~ -- drivers/media/i2c/smiapp
	git log drivers/media/i2c/ccs

Usually bugfixes are best put first.

> 
> My initial thought was that it would be much easier to review the driver as a
> rewrite, but I'm not too surprised I was wrong. To be honest it was nearly
> impossible to actually have the initial development happen as sequential steps
> and I preferred to allocate my time on other tasks than splitting the changes
> into these sequential steps.

This isn't really unusual when you're changing an existing driver:
sometimes you have to implement what you want to achieve in whole, and only
then figure out how to split it into something that can be reviewed. Often
the end result will look different than what you arrived with on the first
time.

-- 
Kind regards,

Sakari Ailus
