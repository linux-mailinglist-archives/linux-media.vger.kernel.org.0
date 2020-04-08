Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D551A239A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgDHNtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 09:49:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:5529 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgDHNtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 09:49:39 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 20F1C240009;
        Wed,  8 Apr 2020 13:49:33 +0000 (UTC)
Date:   Wed, 8 Apr 2020 15:52:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hyun Kwon <hyunk@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
Message-ID: <20200408135237.tmqiqjogokj5kcbb@uno.localdomain>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
 <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
 <68a0cc3d-083b-8907-5b66-5f576f4be464@ideasonboard.com>
 <20200228181303.GA21745@smtp.xilinx.com>
 <20200315231517.d3e2fcvcwkmxds5g@uno.localdomain>
 <20200319010734.GA27556@smtp.xilinx.com>
 <20200319084557.v5hw54mmw4swzwly@uno.localdomain>
 <20200319232003.GA20549@smtp.xilinx.com>
 <20200326011251.GA9997@smtp.xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326011251.GA9997@smtp.xilinx.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hyun,
   sorry for the very late reply :(

On Wed, Mar 25, 2020 at 06:12:53PM -0700, Hyun Kwon wrote:
> Hi Jacopo,
>
> On Thu, 2020-03-19 at 16:20:05 -0700, Hyun Kwon wrote:
> > Hi Jacopo,
> >
> > On Thu, 2020-03-19 at 01:45:57 -0700, Jacopo Mondi wrote:
> > > Hi Hyun,
> > >
> > > On Wed, Mar 18, 2020 at 06:07:35PM -0700, Hyun Kwon wrote:
> > > > Hi Jacobo,
> > > >
> > > > On Sun, 2020-03-15 at 16:15:17 -0700, Jacopo Mondi wrote:
> > > > > Hello Hyun, Kieran,
> > > > >    it's great you are looking into this!
> > > > >
> > > > > On Fri, Feb 28, 2020 at 10:13:04AM -0800, Hyun Kwon wrote:
> > > > > > Hi Kieran,
> > > > > >
> > > > > > Thanks for sharing a patch.
> > > > > >

[snip]

> > > Which case are you trying to address ?
> > >
> >
> > My case is simpler in fact :-), hence the executive summary is,
> > The sensor vsync signal is active high, and it passes through the serializer.
> > Since the vsync is already inverted in de-serializer by this patch, expecting
> > active low, I'm inverting it again in serializer to match.
> >
> > 	sensor -- (vsync active high) --> serializer -- (vsync active low) --> de-serializer
> >
> > If the vsync inversion becomes a device tree property of max9286, the property
> > value will have to align with polarity of vsync source. In my case, I can
> > disable the inversion knowing the sensor vsync is active high. But in other
> > cases, such chain can be quite deep and may be inconvinient for users to check.
> >
> > Another one is the BWS setting, which is just between ser and de-ser.
> >
> > With mbus_get_config() operation, the problem can be isolated nicely in
> > my opinion, and the solution handles all above and scales better.
> > - The de-serializer checks the vsync polarity of all channels using GMSL
> >   config. If all are active low, invert the vsync (if it can)
> >
> > 	vsync_bitmap = 0;
> > 	for(chan : channels) {
> > 		config = get_mbus_config(chan);
> > 		if (config->type != gmsl)
> > 			error;
> >
> > 		if (config->gmsl.vsync == +)
> > 			vsync_bitmap |= << chan->chan_id;
> > 	}
> >
> > 	if (vsync_bitmap == (1 << channels.size() - 1))
> > 		nop(); // all active high. don't invert
> > 	else if (vsync_bitmap == 0)
> > 		invert_vsync(ser);
> > 	else
> > 		error;
> >
> > - The serializer checks vsync polarity in the parallel port config, and
> >   if it's active low (and if it can), invert to make it active high.
> >   Otherwise mark it in GMSL config, so the de-serializer can hanle.
> >
> > 	max96705_get_mbus_config()
> > 	{
> > 		config = get_mbus_config(sensor);
> > 		if (config->type != parallel)
> > 			error;
> >
> > 		if (config->parallel.vsync == -) {
> > 			if (invert_vsync(ser))
> > 				ser_config->gmsl.vsync = +;
> > 			else
> > 				ser_config->gmsl.vsync = -;
> > 		}
> >
> > 		return ser_config;
> > 	}
> >
> > The same can be used for bandwidth setting. The max96705 driver sets 24 bit
> > mode only as supported bandwidth. The deserializer driver can pick it up from
> > mbus_get_config(), and adjust its own config accordingly. It will need some
> > remote node handling in each driver, but seems worth to me.
> >
> > This became too lengthy! Hope it explains better and aligns with your thought,
> > described in other thread. I will give it a try too!
> >
>
> And I got a chance to try.

Thank you!

> - used the mbus config for sync between devices. Ex, vsync inversion in [1]
> [1] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/a1d812c0452905a644d83f715c43e91ade11b266


So, I understand this works well in practice and I'm happy about it,
but I wonder if, now that we have clarified this controls is a static[1]
settings between serializer and deserializer, this should not be
better expressed with the standard DT property 'vsync-active'. It has
to be specified to the same value in both remote and local sides, but
that's nothing new..

I know you're in favor of having them as dynamic configurations
retrieved through get_mbus_config(), and since we know there are more
gmsl specific parameter to negotiate I'm not opposed to that. This would
ease use cases as in [1] also.

I know Sakari might have different opinions, and looking at you patch
in 3) I understand why: we might end up replicating most dt-properties
in get_mbus_config(). Sincerely it's not a show-stopper to me, but
I'll cc him and ask for his opinion first.

[1] With "static" I mean "it does not change at runtime". Of course in
cases you have to change the remote serializer at run-time, having it
retrieved through a pad operation is much easier, but that's a very
advanced and tricky use case which also involves dt-overlay loading
and other funny things. Luca has a use case, I'll cc him here for
reference.

> - made the overlap window of max9286 as a control in [2]
> [2] https://github.com/xlnx-hyunkwon/linux-xlnx/commit/c3d55a9e0a8d2b67f27996529582bb7cfa551b6a


Nice! My idea of having it coming from DT was bit moot, if this should
be configured dynamically, a control is probably better.

What do you think if we try to merge max9286 driver with overlap window
defaulted to 0 (we're testing this configuration with our cameras, we
know for your cameras is ok) and then you could send this patch on top
?

> - some other configs using the mbus config in [3]
> [3] https://github.com/xlnx-hyunkwon/linux-xlnx/commits/hyunk/vision-wip-5.4-next

Great work, but I feel like I have the same questions as I have for
vsync. Are these dynamic properties worth negotiating at run-time, or
are those better expressed as DT properties ?

This is indeed a GMSL property the could be specified in both the
deserializer and serializer device nodes:
https://github.com/xlnx-hyunkwon/linux-xlnx/commit/016ade9a500b30bbd58571c47a94e95ccc40ec0a

This is indeed the bit endianess of the parallel bus
ie [b0 b1 b2 b3 b4 b5 b6 b7] vs [b7 b6 b5 b4 b3 b2 b1 b0]
and I'm surprised we don't have it already as a standard DT property
https://github.com/xlnx-hyunkwon/linux-xlnx/commit/1f0fd7bf0c5149b1d735b795818f5812d4959d9a

I have a use cases for the reverse channel amplitude that could be add
there and I already tried to express it through a DT property:
https://patchwork.kernel.org/patch/11441269/
https://patchwork.kernel.org/patch/11441273/

Something more to think about...

> Let me know if this aligns with your thought.

My thoughts are confused :)

going for dynamic configuration through get_mbus_config() could help
use cases where the serializer are changed at run-time.

Although, abusing it might end up replicating most DT properties
like in the vsync case.

Let's see if we get Sakari's input.

Thanks for your work and sorry for the long delay

