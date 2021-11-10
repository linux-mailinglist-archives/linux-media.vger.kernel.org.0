Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D1044C583
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 17:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhKJRAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 12:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhKJRAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 12:00:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B98C061764;
        Wed, 10 Nov 2021 08:57:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 414993F6;
        Wed, 10 Nov 2021 17:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636563445;
        bh=HWCdrn+CM5R0wXsLQQBhhSRZ09eJhnXW2C2/3jxS8JM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jVCGe/0NIvQVwctHiVdlsZq2vt0c+9FY3ADpQjsTY5o9ZDeNCDb6KGsEN4en4gu+R
         +4y0Vt85mlubH2pPWe2w6hjcNB18J0tUM1Tc4wg+fsx9nzH0jJNLYu7cLpyStMxLyF
         RN35CreVH3D6rw3PI+obLae1dB1wVE9vsGSwfO/c=
Date:   Wed, 10 Nov 2021 18:57:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel
 routing per CSI-2 IP
Message-ID: <YYv54ItUXuG2sLjZ@pendragon.ideasonboard.com>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
 <YYvkglOfUwlsobAV@pendragon.ideasonboard.com>
 <YYvs20DbCoz5qY2S@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYvs20DbCoz5qY2S@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 10, 2021 at 05:01:31PM +0100, Niklas Söderlund wrote:
> Hi Laurent,
> 
> On 2021-11-10 17:25:54 +0200, Laurent Pinchart wrote:
> > Hi Niklas,
> > 
> > On Wed, Oct 20, 2021 at 10:02:22PM +0200, Niklas Söderlund wrote:
> > > Hello,
> > > 
> > > This series attempts to increase the flexibility of the R-Car VIN 
> > > capture pipeline by allowing for free form Virtual Channel routing 
> > > within the same CSI-2 IP block.
> > > 
> > > When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
> > > routing was centred around the CHSEL register which multiplex the
> > > different parallel buses that sits between the CSI-2 receivers source
> > > side and the VIN dma engines. This was a bad design as the multiplexing
> > > do allow for only a few combinations and do not play nice with many
> > > video streams in the system.
> > > 
> > > For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
> > > given CSI-2 receiver to be used together with the scaler.
> > > 
> > > Later datasheets have expanded the documentation and it is now possible
> > > to improve on this design by allowing any Virtual Channel to be routed
> > > to any R-Car VIN instance, provided that there exists a parallel bus
> > > between them. This increases the flexibility as all Virtual Channels can
> > > now be used together with the scaler for example.
> > > 
> > > The redesign is not however perfect. While the new design allows for
> > > many more routes, two constrains limit a small portion of routes that
> > > was possible in the old design but are no more.
> > > 
> > > - It is no longer possible to route the same CSI-2 and VC to more then
> > > one VIN at a time. This was theoretically possible before if the
> > > specific SoC allowed for the same CSI-2 and VC to be routed to two
> > > different VIN capture groups.
> > 
> > Does it mean we can't capture image data and embedded data from the same
> > camera sensor in separate buffers ?
> 
> On the contrary. Without this change we can't capture any embedded data.  
> With this patch we still can't capture it, unless the R-Car CSI-2 
> receiver lies. But with this applied we are closer to enable meta data 
> to reach user space.

How do you envision this being done ?

> > > - It is no longer possible to simultaneously mix links from two CSI-2 IP
> > > blocks to the same VIN capture group.
> > > 
> > > For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
> > > capture from CSI40. While VIN{4,5,6,7} is still free to capture from
> > > any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
> > > are disabled that VIN capture group is free again to capture from any
> > > other CSI-2 IP it is connected to.
> > 
> > What practical limitation does this bring, does it forbid any useful use
> > case ?
> 
> Yes and no ;-). It limits a small set of use-cases, while enabling a 
> great many more. In the old setup you are allowed to route a mix of Rx 
> to Tx intermixing a few of the modules 1:1 as an exception. With this 
> change you get routing n:to:n with a few exceptions.

That I understand, but are there any exceptions that were previously
allowed that you think map to important use cases ?

> > > At the core of the redesign is greater cooperator of the R-Car VIN and
> > > CSI-2 drivers in configuring the routing. The VIN driver is after this
> > > change only responsible to configure the full VIN capture groups
> > > parallel buses to be to a particular CSI-2 IP. While the configuration
> > > of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
> > > IP output ports is handled by the CSI-2 driver.
> > > 
> > > Before this change the CSI-2 Virtual Channel to output port was static
> > > in the CSI-2 driver and the different links only manipulated the VIN
> > > capture groups CHSEL register. With this change both the CHSEl register
> > > and the CSI-2 routing VCDT registers are modified for greater
> > > flexibility.
> > > 
> > > Patch 1/3 and 2/3 are cleanup patches moving code around preparing for 
> > > the real work in 3/3. The work is based on the latest media-tree.
> > > 
> > > Kind Regards,
> > > Niklas Söderlund
> > > 
> > > Niklas Söderlund (3):
> > >   media: rcar-vin: Refactor link notify
> > >   media: rcar-vin: Breakout media link creation
> > >   media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
> > >     IP
> > > 
> > >  drivers/media/platform/rcar-vin/rcar-core.c | 379 ++++++--------------
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
> > >  drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
> > >  drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
> > >  4 files changed, 167 insertions(+), 290 deletions(-)

-- 
Regards,

Laurent Pinchart
