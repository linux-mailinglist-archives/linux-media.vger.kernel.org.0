Return-Path: <linux-media+bounces-53195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMk+JgCInGm7IwQAu9opvQ
	(envelope-from <linux-media+bounces-53195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:01:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2D17A42E
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 18:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3160431902AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 16:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7C2314D17;
	Mon, 23 Feb 2026 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uAUxw1+M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03871313E1D;
	Mon, 23 Feb 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865541; cv=none; b=npK9tT4AmAsTCYxItzkWtgBmzI8+hoCi1hZ6SJFAJO9ON5MUdSIcgpslJcJQbxbc95pXF2xLDI/mRj5YB4atA/KxZgq1qLOxj1dMPCYeIkb0ZedZyXAUpjbByEqPRX2FLKWgTAUPqUcMMH5cO8XiybVKEKk0JT8EqEqJVzwKsNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865541; c=relaxed/simple;
	bh=e8ttj/1JqoVNBNDjrmDaQrSC6wQkZxX55zb5GFsPzuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJpJm5dwZEauYbsLGT3K7cCpJTL10kuue1vwAqQirux+2C9HDbhKD8S+MkDlg7CgCmf1JAqUMUdoMx8cf08Riqzi74zZHTvFRIYWnWYEogKSpHgfOgEq9kYXEfcRQ5IuPoHEZKZhapDRoiz0iOS2lsYVhMD96t5UluZA36KuwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uAUxw1+M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6198F4F1;
	Mon, 23 Feb 2026 17:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771865478;
	bh=e8ttj/1JqoVNBNDjrmDaQrSC6wQkZxX55zb5GFsPzuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAUxw1+M2rnE0b8DoncxR2RD8LoWnUqm9ewIFOM8ntt2tWog7M0XdeoEamUPUsEv8
	 WBMBI/izQvZcMqnCfhG839RxPynYQXDFEUvsLS3TMHO3sA9qd1b5tZBScHLcini/qK
	 RNTnqajT4PxjPEavUXCK/hkMxs7j3DJI+o/1x7DQ=
Date: Mon, 23 Feb 2026 17:52:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Julien Vuillaumier <julien.vuillaumier@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Antoine Bouyer <antoine.bouyer@nxp.com>, Michael Riesch <michael.riesch@collabora.com>, 
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas soderlund <niklas.soderlund@ragnatech.se>, Anthony McGivern <Anthony.McGivern@arm.com>
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
Message-ID: <aZx0LJFYR44_mF7O@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
 <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed>
 <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
 <cf9c2d21-fc0e-42ad-a554-b1d47549bc54@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf9c2d21-fc0e-42ad-a554-b1d47549bc54@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53195-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,linux.intel.com,xs4all.nl,ideasonboard.com];
	RSPAMD_URIBL_FAIL(0.00)[ideasonboard.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,diagram.dot:url]
X-Rspamd-Queue-Id: 0EF2D17A42E
X-Rspamd-Action: no action

Hello Julien

On Mon, Feb 23, 2026 at 01:38:20PM +0100, Julien Vuillaumier wrote:
> Hello Jacopo,
>
> On 2/5/26 10:40, Jacopo Mondi wrote:
> > On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
> > > Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
> > > > On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
> > > > > On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
> > > > > > On 1/28/26 09:17, Antoine Bouyer wrote:
> > > > > > > On 1/26/26 10:44 AM, Michael Riesch wrote:
>
> <snip>
>
> > > > > > > >     - How many media devices are registered and which driver registers it
> > > > > > > >       or them?
> > > > > > >
> > > > > > > That will be part of the evaluation. My initial assumption is that
> > > > > > > neoisp would be the appropriate component to register the media device
> > > > > > > in this mode, since ISI is not involved, and ISI currently performs the
> > > > > > > registration in the M2M configuration.
> > > > >
> > > > > Isn't the ISP registering its own media graph ?
> > >
> > > Yes, 8 copies of ISP media graph, that can be used with the 8 output video
> > > devices of the ISI media graph.
> > >
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
> >
>
> One system use-case for the platform is the support of 8x cameras 1080p
> 30fps using m2m operation.
> Requiring a downstream patch to register multiple ISP instances in order to
> support the multi-cameras use-cases may not be the preferred option.
>
> What would be the issue with having multiple ISP instances created by the
> upstream driver?

You would be registering a media graph instance for each supported ISP
context, not per each ISP instance in the system, effectively
virtualizing access your hardware resources while losing the ability
to implement resource sharing arbitration.

By duplicating the graphs you won't be able to implement priorities
and job scheduling at the media device level. You are now time
multiplexing a single hardware resource but you've lost the single
point of control where an API to manage resources allocation can be
implemented.

As the media subsystem is also growing towards a "media device
centric" API for several reasons, including reducing the number of
ioctl required today to operate a Video4Linux2 camera, this approach
goes in the opposite direction.

Also we have today ISPs with 8 and 16 context on the market, going
forward I think it's reasonable to expect this number to grow. If we
allow 2, 8 or 16 media graphs today why not 64 or 128 tomorrow ?

> Alternatively, would it be an option to have some mean (device tree, module
> param...) to configure the number of media graph instances created by the
> driver?

Do you mean having a way to modify the driver behaviour to register
multiple media devices in case one wants to without changing the
driver code ?

If we're talking mainline, I hardly see this being accepted as a dt
property. A module parameter I'm not sure. I wouldn't like the idea
much as it would effectively allow working around a limitation instead
of trying to achieve a proper solution at the framework level, with
the result that we'll never get past the current technical debt.

You might want to check with others as well, specifically Sakari
Laurent and Hans, they might have different opinions of course.

(I've cc-ed them).

Thanks
  j

>
> Thanks,
> Julien
>
> > > > >
> > > > > Can we get a copy of all media graphs on an i.MX95 system including
> > > > > the ISI and the CSI-2 receiver ?
> > >
> > > Here is an example with multiple sensors. Or do you need it in another
> > > format ?
> >
> > No it's fine, thanks!
> >
> > >
> > >
> > > digraph board {
> > >          rankdir=TB
> > >          n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 |
> > > <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7
> > > | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}",
> > > shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000001:port5 -> n0000000f:port0 [style=bold]
> > >          n00000001:port6 -> n0000001a:port0 [style=bold]
> > >          n00000001:port7 -> n00000025:port0 [style=bold]
> > >          n00000001:port8 -> n00000030:port0 [style=bold]
> > >          n00000001:port9 -> n0000003b:port0 [style=bold]
> > >          n00000001:port10 -> n00000046:port0 [style=bold]
> > >          n00000001:port11 -> n00000051:port0 [style=bold]
> > >          n00000001:port12 -> n0000005c:port0 [style=bold]
> > >          n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000000f:port1 -> n00000012 [style=bold]
> > >          n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000001a:port1 -> n0000001d [style=bold]
> > >          n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000025:port1 -> n00000028 [style=bold]
> > >          n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000030:port1 -> n00000033 [style=bold]
> > >          n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000003b:port1 -> n0000003e [style=bold]
> > >          n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000046:port1 -> n00000049 [style=bold]
> > >          n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000051:port1 -> n00000054 [style=bold]
> > >          n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 |
> > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000005c:port1 -> n0000005f [style=bold]
> > >          n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box,
> > > style=filled, fillcolor=yellow]
> > >          n00000067 [label="mxc_isi.output\n", shape=box, style=filled,
> > > fillcolor=yellow]
> > >          n00000067 -> n00000001:port4 [style=bold]
> > >          n0000006e [label="{{<port0> 0} |
> > > 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}",
> > > shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000006e:port1 -> n00000001:port2 [style=bold]
> > >          n00000073 [label="{{<port0> 0} |
> > > csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord,
> > > style=filled, fillcolor=green]
> > >          n00000073:port1 -> n0000006e:port0 [style=bold]
> > >          n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} |
> > > max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}",
> > > shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000078:port4 -> n00000073:port0 [style=dashed]
> > >          n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 |
> > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000081:port0 -> n00000078:port0 [style=bold]
> > >          n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 |
> > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000085:port0 -> n00000078:port1 [style=bold]
> > >          n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 |
> > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n00000089:port0 -> n00000078:port2 [style=bold]
> > >          n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 |
> > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > >          n0000008d:port0 -> n00000078:port3 [style=bold]
> > > }
> > >
> > >
> > > > >
> > > > > If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
> > > > > that's exactly what we're working on with the context framework :)
> > > > >
> > >
> > > Ok. Then I should have a look to context framework too ...
> > >
> >
> > Please, I hope to be able to resume working on it sooner or later
> > given the right use case.
> >
> > > > >
> > > > > >
> > > > > > ... since it is not, your assumption seems very reasonable.
> > > > > >
> > > > > > >
> > > > > > > >     - How can the user decide whether direct (csi2isp) or indirect
> > > > > > > >       (mem2mem) streaming shall be used?
> > > > > > >
> > > > > > > That will also be part of the evaluation. From dts would be my first
> > > > > > > option, but may prevent using both modes on same platform then.
> > > > > >
> > > > > > Of course this depends what the hardware is able to do, but in case the
> > > > > > HW is reconfigurable easily, I doubt that device tree is a good choice
> > > > > > to solve that.
> > > > > > >
> > > > > > > >
> > > > > > > > While it is certainly OK to introduce this support only at a later
> > > > > > > > stage, it makes sense to consider this right from the start to avoid
> > > > > > > > some nasty changes e.g. in how this hardware is exposed to user space.
> > > > > > > >
> > > > > > > > Also, we are facing a similiar challenge with recent Rockchip ISP
> > > > > > > > hardware (RK3588, RK3576, ...) and it would be great to hear your
> > > > > > > > thoughts about that.
> > > > > > >
> > > > > > > Is there an existing discussion thread available on this topic? I would
> > > > > > > be very interested in following it.
> > > > > >
> > > > > > Not yet, I am afraid. But there should be one or two soon (TM) :-)
> > > > >
> > > > > It's probably time to have one :)
> > >
> > > Good. Please loop me in ;)
> >
> > You are in, this is the conversation ;)
> >
> > It might be a good discussion point for the media summit in Nice
> > co-located with Embedded Recipes if people with interest in the topic
> > will going the be there.
> >
> > I'm also adding Anthony from ARM as I know he's going through the same
> > inline/m2m duality you're now facing.
> >
> > Thanks
> >    j
> >
> > >
> > > BR
> > > Antoine
> > >
> > > > >
> > > > > >
> > > > > > Thanks and regards,
> > > > > > Michael
> > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > Antoine
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks in advance and best regards,
> > > > > > > > Michael
> > > > > > > >
> > > > > > > > >
> > > > > > > > > This series is posted as RFC because extending the v4l2-isp interface
> > > > > > > > > may
> > > > > > > > > overlap with ongoing work. If similar development already exists, I am
> > > > > > > > > happy to rebase or adapt the series accordingly. If preferred, the
> > > > > > > > > series
> > > > > > > > > can also be split into two parts: the v4l2-isp rework and the Neo ISP
> > > > > > > > > driver introduction.
> > > > > > > > >
> > > > > > > > > A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> > > > > > > > > consistent with the existing style in that file.
> > > > > > > > >
> > > > > > > > > Testing was performed on the i.MX95 EVK using the media/next kernel in
> > > > > > > > > standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> > > > > > > > > using the downstream NXP kernel, as some hardware dependencies are not
> > > > > > > > > yet upstreamed.
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > > Antoine
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > > Here are v4l2-compliance test results:
> > > > > > > > >
> > > > > > > > > v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> > > > > > > > > v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> > > > > > > > >
> > > > > > > > > Compliance test for neoisp device /dev/media0:
> > > > > > > > >
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MEDIA_IOC_DEVICE_INFO: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/media0 open: OK
> > > > > > > > >          test MEDIA_IOC_DEVICE_INFO: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Media Controller ioctls:
> > > > > > > > >          test MEDIA_IOC_G_TOPOLOGY: OK
> > > > > > > > >          Entities: 7 Interfaces: 7 Pads: 12 Links: 13
> > > > > > > > >          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> > > > > > > > >          test MEDIA_IOC_SETUP_LINK: OK
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video0:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x04202000
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x0300000a
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x00000008 (8)
> > > > > > > > >          Name             : neoisp-input0
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x01000009   : 0: Source
> > > > > > > > >            Link 0x0200000c: to remote pad 0x1000002 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video0 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video1:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x04202000
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x03000010
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x0000000e (14)
> > > > > > > > >          Name             : neoisp-input1
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x0100000f   : 0: Source
> > > > > > > > >            Link 0x02000012: to remote pad 0x1000003 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video1 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video2:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x0c200000
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x03000016
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x00000014 (20)
> > > > > > > > >          Name             : neoisp-params
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x01000015   : 0: Source
> > > > > > > > >            Link 0x02000018: to remote pad 0x1000004 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video2 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK (Not Supported)
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video3:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x04201000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x0300001c
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x0000001a (26)
> > > > > > > > >          Name             : neoisp-frame
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x0100001b   : 0: Sink
> > > > > > > > >            Link 0x0200001e: from remote pad 0x1000005 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video3 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK (Not Supported)
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video4:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x04201000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x03000022
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x00000020 (32)
> > > > > > > > >          Name             : neoisp-ir
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x01000021   : 0: Sink
> > > > > > > > >            Link 0x02000024: from remote pad 0x1000006 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video4 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK (Not Supported)
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/video5:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Card type        : neoisp
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x8ca03000
> > > > > > > > >                  Video Capture Multiplanar
> > > > > > > > >                  Video Output Multiplanar
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Metadata Output
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > >                  Device Capabilities
> > > > > > > > >          Device Caps      : 0x04a00000
> > > > > > > > >                  Metadata Capture
> > > > > > > > >                  Streaming
> > > > > > > > >                  Extended Pix Format
> > > > > > > > > Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x03000028
> > > > > > > > >          Type             : V4L Video
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x00000026 (38)
> > > > > > > > >          Name             : neoisp-stats
> > > > > > > > >          Function         : V4L2 I/O
> > > > > > > > >          Pad 0x01000027   : 0: Sink
> > > > > > > > >            Link 0x0200002a: from remote pad 0x1000007 of entity
> > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/video5 open: OK
> > > > > > > > >          test VIDIOC_QUERYCAP: OK
> > > > > > > > >          test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 0 Private Controls: 0
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK
> > > > > > > > >          test VIDIOC_TRY_FMT: OK
> > > > > > > > >          test VIDIOC_S_FMT: OK
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK (Not Supported)
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > Warnings: 0
> > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > Compliance test for neoisp device /dev/v4l-subdev0:
> > > > > > > > >
> > > > > > > > > Driver Info:
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > >          Capabilities     : 0x00000000
> > > > > > > > >          Client Capabilities: 0x0000000000000002
> > > > > > > > > interval-uses-which Media Driver Info:
> > > > > > > > >          Driver name      : neoisp
> > > > > > > > >          Model            : neoisp
> > > > > > > > >          Serial           :
> > > > > > > > >          Bus info         : platform:4ae00000.isp
> > > > > > > > >          Media version    : 6.19.0
> > > > > > > > >          Hardware revision: 0x00000002 (2)
> > > > > > > > >          Driver version   : 6.19.0
> > > > > > > > > Interface Info:
> > > > > > > > >          ID               : 0x0300002c
> > > > > > > > >          Type             : V4L Sub-Device
> > > > > > > > > Entity Info:
> > > > > > > > >          ID               : 0x00000001 (1)
> > > > > > > > >          Name             : neoisp
> > > > > > > > >          Function         : Image Signal Processor
> > > > > > > > >          Pad 0x01000002   : 0: Sink
> > > > > > > > >            Link 0x0200000c: from remote pad 0x1000009 of entity
> > > > > > > > > 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
> > > > > > > > >          Pad 0x01000003   : 1: Sink
> > > > > > > > >            Link 0x02000012: from remote pad 0x100000f of entity
> > > > > > > > > 'neoisp-input1' (V4L2 I/O): Data
> > > > > > > > >          Pad 0x01000004   : 2: Sink
> > > > > > > > >            Link 0x02000018: from remote pad 0x1000015 of entity
> > > > > > > > > 'neoisp-params' (V4L2 I/O): Data, Enabled
> > > > > > > > >          Pad 0x01000005   : 3: Source
> > > > > > > > >            Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
> > > > > > > > > frame' (V4L2 I/O): Data, Enabled
> > > > > > > > >          Pad 0x01000006   : 4: Source
> > > > > > > > >            Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
> > > > > > > > > ir' (V4L2 I/O): Data
> > > > > > > > >          Pad 0x01000007   : 5: Source
> > > > > > > > >            Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
> > > > > > > > > stats' (V4L2 I/O): Data, Enabled
> > > > > > > > >
> > > > > > > > > Required ioctls:
> > > > > > > > >          test MC information (see 'Media Driver Info' above): OK
> > > > > > > > >          test VIDIOC_SUDBEV_QUERYCAP: OK
> > > > > > > > >          test invalid ioctls: OK
> > > > > > > > >
> > > > > > > > > Allow for multiple opens:
> > > > > > > > >          test second /dev/v4l-subdev0 open: OK
> > > > > > > > >          test VIDIOC_SUBDEV_QUERYCAP: OK
> > > > > > > > >          test for unlimited opens: OK
> > > > > > > > >
> > > > > > > > > Debug ioctls:
> > > > > > > > >          test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Input ioctls:
> > > > > > > > >          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > >          Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > >
> > > > > > > > > Output ioctls:
> > > > > > > > >          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > >          Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > >
> > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > >          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Sink Pad 0):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Sink Pad 1):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Sink Pad 2):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Source Pad 3):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Source Pad 4):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Sub-Device ioctls (Source Pad 5):
> > > > > > > > >          Try Stream 0
> > > > > > > > >          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          Active Stream 0
> > > > > > > > >          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > >          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Control ioctls:
> > > > > > > > >          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > > > > > > >          test VIDIOC_QUERYCTRL: OK
> > > > > > > > >          test VIDIOC_G/S_CTRL: OK
> > > > > > > > >          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > > > > > > >          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > > > > > > >          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > >          Standard Controls: 1 Private Controls: 1
> > > > > > > > >
> > > > > > > > > Format ioctls:
> > > > > > > > >          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
> > > > > > > > > Supported)
> > > > > > > > >          test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_FMT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_TRY_FMT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_S_FMT: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > >          test Cropping: OK (Not Supported)
> > > > > > > > >          test Composing: OK (Not Supported)
> > > > > > > > >          test Scaling: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Codec ioctls:
> > > > > > > > >          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > >          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > >          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Buffer ioctls:
> > > > > > > > >          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > > > > > > > >          test CREATE_BUFS maximum buffers: OK
> > > > > > > > >          test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > >          test VIDIOC_EXPBUF: OK (Not Supported)
> > > > > > > > >          test Requests: OK (Not Supported)
> > > > > > > > >
> > > > > > > > > Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
> > > > > > > > > 0, Warnings: 0
> > > > > > > > >
> > > > > > > > > Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
> > > > > > > > > Failed: 0, Warnings: 0
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > > Antoine Bouyer (11):
> > > > > > > > >      media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
> > > > > > > > >      media: v4l2-isp: Add helper function to compute extended stats size
> > > > > > > > >      media: Documentation: uapi: Update V4L2 ISP for extensible stats
> > > > > > > > >      media: Documentation: Add NXP neoisp driver documentation
> > > > > > > > >      dt-bindings: media: Add nxp neoisp support
> > > > > > > > >      media: v4l2-ctrls: Add user control base for NXP neoisp controls
> > > > > > > > >      media: Add meta formats supported by NXP neoisp driver
> > > > > > > > >      media: uapi: Add NXP NEOISP user interface header file
> > > > > > > > >      media: platform: Add NXP Neoisp Image Signal Processor
> > > > > > > > >      media: platform: neoisp: Add debugfs support
> > > > > > > > >      arm64: dts: freescale: imx95: Add NXP neoisp device tree node
> > > > > > > > >
> > > > > > > > >     .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
> > > > > > > > >     .../admin-guide/media/nxp-neoisp.dot          |   16 +
> > > > > > > > >     .../admin-guide/media/nxp-neoisp.rst          |  189 ++
> > > > > > > > >     .../admin-guide/media/v4l-drivers.rst         |    1 +
> > > > > > > > >     .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
> > > > > > > > >     .../userspace-api/media/v4l/meta-formats.rst  |    1 +
> > > > > > > > >     .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
> > > > > > > > >     .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
> > > > > > > > >     MAINTAINERS                                   |    9 +
> > > > > > > > >     .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
> > > > > > > > >     arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
> > > > > > > > >     drivers/media/platform/nxp/Kconfig            |    1 +
> > > > > > > > >     drivers/media/platform/nxp/Makefile           |    1 +
> > > > > > > > >     drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
> > > > > > > > >     drivers/media/platform/nxp/neoisp/Makefile    |    8 +
> > > > > > > > >     drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
> > > > > > > > >     .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
> > > > > > > > >     drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
> > > > > > > > >     .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
> > > > > > > > >     drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
> > > > > > > > >     include/media/v4l2-isp.h                      |   13 +
> > > > > > > > >     include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
> > > > > > > > >     include/uapi/linux/media/v4l2-isp.h           |   85 +
> > > > > > > > >     include/uapi/linux/v4l2-controls.h            |    6 +
> > > > > > > > >     include/uapi/linux/videodev2.h                |    6 +
> > > > > > > > >     30 files changed, 11880 insertions(+), 3 deletions(-)
> > > > > > > > >     create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
> > > > > > > > > diagram.dot
> > > > > > > > >     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
> > > > > > > > >     create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
> > > > > > > > >     create mode 100644 Documentation/devicetree/bindings/media/
> > > > > > > > > nxp,neoisp.yaml
> > > > > > > > >     create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
> > > > > > > > > nxp-neoisp.rst
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
> > > > > > > > >     create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
> > > > > > > > >     create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > >
>

