Return-Path: <linux-media+bounces-52476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOuOOu95immKKwAAu9opvQ
	(envelope-from <linux-media+bounces-52476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:21:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986311593E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECB82300C001
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93F3209F43;
	Tue, 10 Feb 2026 00:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PnK2skM+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25361F4611;
	Tue, 10 Feb 2026 00:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682858; cv=none; b=ZRn514iNv6msXynF7ywGWmnwyPdOsShZ/I5tch36wDJKnE5IhjmEvTnU3B92HSAxyKcgqWoGYOVGUEfglqNIC/8jEGUTuCA/U/GWwbGccFVS4G33Mbt6UMz7aXwKRoddsjl/DhRCKsfA3LPVeCARgxR6WYKlaFbSycHM7XLlyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682858; c=relaxed/simple;
	bh=f95+uH5bTNK0r8FlOQpOeWn18Ddk20khW9WML0+w/jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5OBk6xFyhP/McGxoJF2oIxGzLqBmncLXk1RQXC2ufguzGapHJoQtLWQrfwolOrXfkEl2NJxo5AibI7CwidOYzn/cUZdb5hj9T6m5nZo1913x94qfcDTvmCB13nM0Sb+zUEPeh85ubCFZqiPUa4ADtqJWTVWCuyHBSxI32uQOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PnK2skM+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB837E47;
	Tue, 10 Feb 2026 01:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770682809;
	bh=f95+uH5bTNK0r8FlOQpOeWn18Ddk20khW9WML0+w/jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnK2skM+fzjbCer30ingvc2E1O3wfq+UPsu4mJxGGX5TQnhJJsvV0uFvwfg4kQupx
	 yJtqsZA8hfR8rykTR5192YcispXKB9G+kiIeTIToDitAFIwoVn7MozqHCWaC3ouYmD
	 2YQfdy6aBi1GvYcsoeY5vxvjSRoytjmUnoQIoNKA=
Date: Tue, 10 Feb 2026 02:20:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	niklas soderlund <niklas.soderlund@ragnatech.se>
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
Message-ID: <20260210002053.GJ2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
 <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed>
 <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
 <a4c62fb8-51f5-47eb-a1aa-ec0e4f6a9707@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4c62fb8-51f5-47eb-a1aa-ec0e4f6a9707@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52476-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 8986311593E
X-Rspamd-Action: no action

Hi Anthony,

On Mon, Feb 09, 2026 at 01:19:43PM +0000, Anthony McGivern wrote:
> On 05/02/2026 09:40, Jacopo Mondi wrote:
> > On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
> >> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
> >>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
> >>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
> >>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
> >>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
> >>>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:

[snip]

> >>>>>>>    - How many media devices are registered and which driver registers it
> >>>>>>>      or them?
> >>>>>> 
> >>>>>> That will be part of the evaluation. My initial assumption is that
> >>>>>> neoisp would be the appropriate component to register the media device
> >>>>>> in this mode, since ISI is not involved, and ISI currently performs the
> >>>>>> registration in the M2M configuration.
> >>>> 
> >>>> Isn't the ISP registering its own media graph ?
> >> 
> >> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
> >> devices of the ISI media graph.
> > 
> > I suggest you do what RPi does. The mainline driver only registers one
> > instance and they carry a little patch downstream that implements the
> > for() loop where multiple instances are registered. Duplicating media graphs
> > is not desirable (at least in mainline) as we can have ISPs with 256
> > contexts, we don't want 256 media graphs.
> >
> > A framework level solution with proper priority handling and job
> > scheduling is what is required and that's what the context work should
> > end up being.
> 
> Our Mali-C720 ISP can support up to 16 contexts, each with over a dozen
> subdevs and capture nodes. As we imagine this will not be feasible for
> upstreaming :) So using  this framework is definitely the way we would
> like to go. We are mainly limited by the lack of per-context graph/streams
> configuration at this point.
> 
> >>>> Can we get a copy of all media graphs on an i.MX95 system including
> >>>> the ISI and the CSI-2 receiver ?
> >> 
> >> Here is an example with multiple sensors. Or do you need it in another
> >> format ?
> > 
> > No it's fine, thanks!
> >
> >> digraph board {
> >>         rankdir=TB
> >>         n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000001:port5 -> n0000000f:port0 [style=bold]
> >>         n00000001:port6 -> n0000001a:port0 [style=bold]
> >>         n00000001:port7 -> n00000025:port0 [style=bold]
> >>         n00000001:port8 -> n00000030:port0 [style=bold]
> >>         n00000001:port9 -> n0000003b:port0 [style=bold]
> >>         n00000001:port10 -> n00000046:port0 [style=bold]
> >>         n00000001:port11 -> n00000051:port0 [style=bold]
> >>         n00000001:port12 -> n0000005c:port0 [style=bold]
> >>         n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000000f:port1 -> n00000012 [style=bold]
> >>         n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
> >>         n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000001a:port1 -> n0000001d [style=bold]
> >>         n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
> >>         n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000025:port1 -> n00000028 [style=bold]
> >>         n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
> >>         n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000030:port1 -> n00000033 [style=bold]
> >>         n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
> >>         n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000003b:port1 -> n0000003e [style=bold]
> >>         n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
> >>         n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000046:port1 -> n00000049 [style=bold]
> >>         n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, style=filled, fillcolor=yellow]
> >>         n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000051:port1 -> n00000054 [style=bold]
> >>         n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, style=filled, fillcolor=yellow]
> >>         n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000005c:port1 -> n0000005f [style=bold]
> >>         n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, style=filled, fillcolor=yellow]
> >>         n00000067 [label="mxc_isi.output\n", shape=box, style=filled, fillcolor=yellow]
> >>         n00000067 -> n00000001:port4 [style=bold]
> >>         n0000006e [label="{{<port0> 0} | 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000006e:port1 -> n00000001:port2 [style=bold]
> >>         n00000073 [label="{{<port0> 0} | csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000073:port1 -> n0000006e:port0 [style=bold]
> >>         n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000078:port4 -> n00000073:port0 [style=dashed]
> >>         n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000081:port0 -> n00000078:port0 [style=bold]
> >>         n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000085:port0 -> n00000078:port1 [style=bold]
> >>         n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n00000089:port0 -> n00000078:port2 [style=bold]
> >>         n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >>         n0000008d:port0 -> n00000078:port3 [style=bold]
> >> }
> 
> This was an interesting point from our sides too regarding the context framework,
> how would shared inputs be linked to independent contexts? For example, one input
> port with 4 sensors where each is processed by a separate context.

If the multi-context ISP operates in M2M mode, the capture and ISP
pipelines will be disjoint (even if they're in the same media graphs).
Linking the two will be done by userspace, through memory buffers shared
between the pipelines.

> As a test of multi-context with duplicated media graphs, we would segregate our
> inputs between media devices, though this is less flexible as it strictly ties
> one sensor to a particular context.
> 
> >>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
> >>>> that's exactly what we're working on with the context framework :)
> >> 
> >> Ok. Then I should have a look to context framework too ...
> > 
> > Please, I hope to be able to resume working on it sooner or later
> > given the right use case.
> >
> >>>>> ... since it is not, your assumption seems very reasonable.
> >>>>>
> >>>>>>>    - How can the user decide whether direct (csi2isp) or indirect
> >>>>>>>      (mem2mem) streaming shall be used?
> >>>>>> 
> >>>>>> That will also be part of the evaluation. From dts would be my first
> >>>>>> option, but may prevent using both modes on same platform then.
> >>>>> 
> >>>>> Of course this depends what the hardware is able to do, but in case the
> >>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
> >>>>> to solve that.
> >>>>> 
> >>>>>>> While it is certainly OK to introduce this support only at a later
> >>>>>>> stage, it makes sense to consider this right from the start to avoid
> >>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
> >>>>>>>
> >>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
> >>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
> >>>>>>> thoughts about that.
> >>>>>> 
> >>>>>> Is there an existing discussion thread available on this topic? I would
> >>>>>> be very interested in following it.
> >>>>> 
> >>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
> >>>> 
> >>>> It's probably time to have one :)
> >> 
> >> Good. Please loop me in ;)
> > 
> > You are in, this is the conversation ;)
> >
> > It might be a good discussion point for the media summit in Nice
> > co-located with Embedded Recipes if people with interest in the topic
> > will going the be there.
> >
> > I'm also adding Anthony from ARM as I know he's going through the same
> > inline/m2m duality you're now facing.
> 
> We make the issue even more complex as individual contexts can run in either
> inline or m2m mode simultaneously... Though in our case the ISP does not
> have any external dependencies for this like with Mali-C55 + IVC.

Simultaneously ? Can a single ISP instance run in inline and offline
mode simultaneously ? How does that work ?

> As a side note, was there any thought into how Libcamera may support a pure m2m
> usecase, say by passing user provided frames rather than indirectly coming from
> a sensor? Perhaps there is already something for this that I've missed.

https://lists.libcamera.org/pipermail/libcamera-devel/2025-December/055627.html

I expect more work to be needed before we can finalize an API, as I
think different people will have very different ideas of how this should
work.

> >>>>>>>> This series is posted as RFC because extending the v4l2-isp interface may
> >>>>>>>> overlap with ongoing work. If similar development already exists, I am
> >>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the series
> >>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
> >>>>>>>> driver introduction.
> >>>>>>>>
> >>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> >>>>>>>> consistent with the existing style in that file.
> >>>>>>>>
> >>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
> >>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> >>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
> >>>>>>>> yet upstreamed.

[snip]

-- 
Regards,

Laurent Pinchart

