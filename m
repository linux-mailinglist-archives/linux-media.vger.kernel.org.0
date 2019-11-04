Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C27EE089
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 13:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfKDM6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 07:58:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53314 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfKDM6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 07:58:39 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2D8B52C;
        Mon,  4 Nov 2019 13:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572872316;
        bh=fmCV2UX8nWPcsCfJd6YC1Mg8Z0MLa3pWSVXfjonQNGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=laUfAuCJravUPBu2KYDf1l4VBi2KpoWrU+VodG54MZ1wchXk0n0e/erqSFpKpdGyf
         u5g/66GLwPpI//WGIycLsnEgWvzaaLfu0ssLHSCx64RqIN6tbEKld3cOdWwdtUc8AQ
         jCfQdPTG1yNTzIT4Jdo1KV67Cor+YF0GX0wB8cUI=
Date:   Mon, 4 Nov 2019 14:58:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: Overlay support in the i.MX7 display
Message-ID: <20191104125829.GA4913@pendragon.ideasonboard.com>
References: <20191101084318.GA8428@pendragon.ideasonboard.com>
 <67057f1082886726268f346f49c23051@agner.ch>
 <20191104100947.4e198e72@eldfell.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191104100947.4e198e72@eldfell.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Nov 04, 2019 at 10:09:47AM +0200, Pekka Paalanen wrote:
> On Sun, 03 Nov 2019 19:15:49 +0100 Stefan Agner wrote:
> > On 2019-11-01 09:43, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > I'm looking at the available options to support overlays in the display
> > > pipeline of the i.MX7. The LCDIF itself unfortunaltey doesn't support
> > > overlays, the feature being implemented in the PXP. A driver for the PXP
> > > is available but only supports older SoCs whose PXP doesn't support
> > > overlays. This driver is implemented as a V4L2 mem2mem driver, which
> > > makes support of additional input channels impossible.  
> > 
> > Thanks for bringing this up, it is a topic I have wondered too:
> > Interaction between PXP and mxsfb.
> > 
> > I am not very familiar with the V4L2 subsystem so take my opinions with
> > a grain of salt.
> > 
> > > Here are the options I can envision:
> > > 
> > > - Extend the existing PXP driver to support multiple channels. This is
> > >   technically feasible, but will require moving away from the V4L2
> > >   mem2mem framework, which would break userspace. I don't think this
> > >   path could lead anywhere.
> > > 
> > > - Write a new PXP driver for the i.MX7, still using V4L2, but with
> > >   multiple video nodes. This would allow blending multiple layers, but
> > >   would require writing the output to memory, while the PXP has support
> > >   for direct connections to the LCDIF (through small SRAM buffers).
> > >   Performances would thus be suboptimal. The API would also be awkward,
> > >   as using the PXP for display would require usage of V4L2 in
> > >   applications.  
> > 
> > So the video nodes would be sinks? I would expect overlays to be usable
> > through KMS, I guess that would then not work, correct?

There would be sink video nodes for the PXP inputs, and one source video
node for the PXP output. The PXP can be used stand-alone, in
memory-to-memory mode, and V4L2 is a good fit for that.

> > > 
> > > - Extend the mxsfb driver with PXP support, and expose the PXP inputs as
> > >   KMS planes. The PXP would only be used when available, and would be
> > >   transparent to applications. This would however prevent using it
> > >   separately from the display (to perform multi-pass alpha blending for
> > >   instance).  
> > 
> > KMS planes are well defined and are well integrated with the KMS API, so
> > I prefer this option. But is this compatible with the currently
> > supported video use-case? E.g. could we make PXP available through V4L2
> > and through DRM/mxsfb?

That's the issue, it's not easily doable. I think we could do so, but
how to ensure mutual exclusion between the two APIs needs to be
researched. I fear it will result in an awkward solution with fuzzy
semantics. A module parameter could be an option, but wouldn't be very
flexible.

> > Not sure what your use case is exactly, but when playing a video I
> > wonder where is the higher value using PXP: Color conversion and scaling
> > or compositing...? I would expect higher value in the former use case.

I think it's highly use-case-dependent.

> mind, with Wayland architecture, color conversion and scaling could be
> at the same level/step as compositing, in the display server instead of
> an application. Hence if the PXP capabilities were advertised as KMS
> planes, there should be nothing to patch in Wayland-designed
> applications to make use of them, assuming the applications did not
> already rely on V4L2 M2M devices.
> 
> Would it not be possible to expose PXP through both uAPI interfaces? At
> least KMS atomic's TEST_ONLY feature would make it easy to say "no" to
> userspace if another bit of userspace already reserved the device via
> e.g. V4L2.

We would also need to figure out how to do it the other way around,
reporting properly through V4L2 that the device is busy. I think it's
feasible, but I doubt it would result in anything usable for userspace.
If the KMS device exposes multiple planes unconditionally and fails the
atomic commit if the PXP is used through V4L2, I think it would be hard
for Wayland to use this consistently. Given that I expect the PXP to be
mostly used for display purpose I'm tempted to allocate it for display
unconditionally, or, possibly, decide how to expose it through a module
parameter.

We have a similar situation on Renesas R-Car Gen3 platforms, with a
memory-to-memory compositor called VSP. Some VSP instances are connected
to the display controller, and we allocate them for display
unconditionally. Other VSP instances are exposed as V4L2 devices. We
haven't heard of anyone who wanted to use the display VSP instances for
unrelated purposes. If such a use case arose, exposing those instances
through V4L2 would just be a matter of flipping one bit in the driver
(all the infrastructure is in place), which we would likely expose as a
module parameter.

-- 
Regards,

Laurent Pinchart
