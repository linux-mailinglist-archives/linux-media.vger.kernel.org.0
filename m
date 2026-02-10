Return-Path: <linux-media+bounces-52475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPJmIt91immmKgAAu9opvQ
	(envelope-from <linux-media+bounces-52475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:03:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C011583E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F4D1301F31A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6114B950;
	Tue, 10 Feb 2026 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SsQi7SUb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B14A3EBF39;
	Tue, 10 Feb 2026 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681810; cv=none; b=EXtwQj42TkYy3msvH0f3a5JNeEGFTc80yyfDl2dAFpHTHsTJIdQ1Q3R5t0gsJzOGdYIIDRI4izo8xOJNvk5dtBZRK0g+Vesgk55T97NnVUkvfdtWUv/KtGs2IU9ZajNoOCTKpW33X0dcn7fqZS0905oPar74Xn3gOz1WFOF85vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681810; c=relaxed/simple;
	bh=JRKASqldLpnc7k3zIIPLpocJ70R/evD6V5G+B96AWt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQHBn+SjiDpvo+h02xnFyzCzQVmG3rC9AjKP2zmWNpQEXf/LB2u22Hv85au41NEbCQd6Fyk19GA44IBrSlm6DqsqpFF9LT2+xjnvorF0mpGsIN2HtsRstq+PMUR6VRwPp22sTUEZ+jMKbpItAfaQzeTKeEws5TDDyoY04bwKBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SsQi7SUb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F3810E47;
	Tue, 10 Feb 2026 01:02:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770681753;
	bh=JRKASqldLpnc7k3zIIPLpocJ70R/evD6V5G+B96AWt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SsQi7SUbie643dr4mOsp0uKFB7SFpp002ZdKz5vIe2bsY6u5kW4mUlBB9F/qU/YP6
	 ezclTbH236biB8lkiyCdrMh/AsNYDpLuOfEmycf0HQPJAdDJm94WaB0oStpfvsyXjG
	 RZP8+3rYT9QDbhzzgEdqUNuR0IyPOm9td084BqQ0=
Date: Tue, 10 Feb 2026 02:03:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	niklas soderlund <niklas.soderlund@ragnatech.se>,
	Anthony McGivern <Anthony.McGivern@arm.com>
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
Message-ID: <20260210000317.GI2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
 <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed>
 <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYRSMXHjFC0M_DM_@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52475-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C28C011583E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:40:12AM +0100, Jacopo Mondi wrote:
> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
> > Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
> > > On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
> > > > On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
> > > > > On 1/28/26 09:17, Antoine Bouyer wrote:
> > > > > > On 1/26/26 10:44 AM, Michael Riesch wrote:
> > > > > > > On 1/23/26 09:09, Antoine Bouyer wrote:
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > This RFC patch series introduces the NXP Neo Image Signal Processor (ISP)
> > > > > > > > driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
> > > > > > > > The series also includes updates to the generic v4l2-isp interface to
> > > > > > > > support extended statistics required by the Neo ISP.
> > > > > > > >
> > > > > > > > The Neo ISP processes one or more camera streams, converting RAW formats
> > > > > > > > into YUV or RGB outputs. Its architecture is largely influenced by the
> > > > > > > > PISP driver. The hardware supports up to eight contexts, with three sink
> > > > > > > > pads (main input, HDR input, and parameter buffers) and three source pads
> > > > > > > > (RGB output, IR output, and statistics metadata).
> > > > > > > >
> > > > > > > > At this stage, both legacy (fixed-size) and extensible (dynamic-size)
> > > > > > > > parameter/statistics buffers are supported through the generic v4l2-isp
> > > > > > > > framework, similar to rkisp1 and Mali-C55. The driver currently supports
> > > > > > > > M2M operation; direct CSI-to-ISP streaming is not yet implemented.
> > > > > > >
> > > > > > > How do you envisage the direct CSI-to-ISP streaming shall be supported?
> > > > > >
> > > > > > At this stage, this streaming mode still needs to be evaluated on
> > > > > > neoisp. We should follow the integration model used by existing ISP
> > > > > > drivers to avoid duplicating solutions.
> > > > >
> > > > > Fair point, but I have had the impression that there are not many
> > > > > examples (if any). The rkisp1 driver, for instance, only supports inline
> > > > > mode although the HW should be able to do both.
> > > > >
> > > > > But any pointers most welcome, I won't claim I have the full overview.
> > > > >
> > > > > > Below are my initial thoughts on the specific points you raised:
> > > > > >
> > > > > > >    - How shall the final media graph(s) look like?
> > > > > >
> > > > > > The media entities would remain mostly identical, except for the absence
> > > > > > of ISI. The topology would be a direct linkg from sensor->csi-
> > > > > > > formatter->neoisp.
> > > >
> > > > If support for inline mode has to be added later, the ISP will need to
> > > > be registered in the same media graph of the CSI-2 receiver to be able
> > > > to link the two, right ?
> >
> > yes correct.
> >
> > > > How do you envision to control the ISP operating mode, because I'm
> > > > afraid if you register the ISP in its own media graph, you're locking
> > > > yourself there as implementing inline mode would require a different
> > > > media topology with all the implications on the rest of the userspace
> > > > stack.
> > > >
> > > > This might not be a problem if you know that the inline vs m2m mode is
> > > > SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
> > > > other as m2m. In this case you'll likely need two pipeline handlers
> > > > in libcamera, but if that's per SoC-line maybe is acceptable. The fact
> > > > you suggests in inline mode there won't be an ISI makes me think this
> > > > actually depends on the SoC design ?
> >
> > Actually, this is not really at SoC synthesis time, neoisp HW does support
> > both modes, that is configurable. But ISP HW can run in a single mode only
> > once it is configured. Streaming mode is tightly coupled with CSI HW, then
> > ISP cannot be used in M2M mode with another sensor simultaneously.
> 
> Yes, my point is trying to understand "how it is configured" and what
> your expectations are.
> 
> Will the board .dts (or a camera .dtso) decide how the ISP is operated
> by defining its endpoint connections ? Assuming with the same SoC both
> inline and m2m modes are possible, without differences in the SoC
> design/integration, will users of the same board have to modify the
> .dts or load ad-hoc .dtso to decide what mode is in use ?

That's what we do on i.MX8MP, to route the CSI-2 receiver output to
either the ISI or the ISP. And it was a really bad design mistake. Let's
not repeat it: if the hardware allows both inline and offline operation,
then selecting between the two modes should be possible without changing
the device tree, without rebooting and without reloading modules. All
components must be in the same media graph. This includes the CSI-2
receiver, ISI and ISP.

> Then, the question of how the media topology will look and which
> components registers what has to be clarified.
> 
> Let's try to make a taxonomy of the cases we have in mainline (or on
> their way to mainline).
> 
> In the mali example I mentioned, the operating mode is selected by the
> .dtsi as Mali can be integrated either inline or in m2m mode in
> different SoCs. RZ/V2H in example, will always be m2m as it doesn't
> interface the CSI-2 receiver with the ISP but rather interfaces the
> ISP with a companion chip the performs memory access on its behalf
> (the IVC). A different design that incorporates Mali inline will
> instead have to interface the CSI-2 receiver with the ISP with
> internal busses/glue logic and will then have to described this in dts.
> 
> This is fine as the ISP integration is different and then having the
> description in dts is legit.

Note that the C55 could be integrated in an SoC in a way that would
support both inline and offline modes. In that case selection of the
operation mode must be done by userspace, without changing DT.

> The ISP driver unconditionally registers an async notifier and the
> downstream component (csi-2 or IVC) will register its async subdev(s)
> which will all appear in the ISP media graph. This is possible because
> the assumption is that the CSI-2 receiver (or the companion chip)
> won't register their own media graph.
> 
> The Renesas V4H example I mentioned is instead different. The ISP can
> be operated in inline and m2m, on the same SoC without any
> modification to hardware and to the dts/dtsi. It's basically a user
> choice we defer to runtime.
> 
> The V4H already has a component that registers a media graph: the
> CSI-2/VIN block which is found in many SoCs of the same (and older)
> generations. The ISP is present only in some SoC, but the CSI-2/VIN is
> always there. In this case, to support both inline and m2m modes, the
> VIN registers the media device and, with the trick I pointed you to in
> Niklas' code, the ISP registers a subdev in the VIN media graph. Then
> the inline/m2m mode can be selected by media link enablement at
> run-time. Now, inline mode is not yet supported on V4H and there might
> be dragons there, but at least, both modes should be possible on the same
> SoC.
> 
> On the other extremes we have the RaspberryPi PiSP BE and RkISP1.
> 
> RPi knows the only SoC where the PiPS will be found is their one. The
> ISP cannot function inline and will always be m2m. In this case, a
> dedicated media graph for the ISP is the simplest and cleanest
> solution.
> 
> RkISP1 instead will always be inline only. It registers a media device
> and an async notifier, the connected CSI-2 receiver will register an
> async subdev and will be connected to the device tree endpoint of the
> ISP device node.
> 
> What model is the closest one to the neoisp integration that you
> envision on NXP SoCs ?
> 
> > > One small correction after some more research:
> > >
> > > we actually already have a pipeline in libcamera that supports inline
> > > and (will soon) support m2m: the mali c55 one. My take on "probably
> > > need two pipeline handlers" was not correct then.
> >
> > Yes, I saw your patchwork on libcamera about this coming upgrade. Spent some
> > time analyzing it ':) Seems we are quite aligned as per my understanding:
> > inline mode (i.e. streaming mode with neoisp) _or_ M2M mode using IVC video
> > device from Mali. Is that right ?
> >
> > > As said, Mali-C55 can be integrated inline or in m2m mode and this is
> > > decided based on the device tree endpoint connections.
> >
> > Good. Do you have an example available ?
> 
> It's in mainline, but there's nothing exciting there as the assumption
> is that there will always be a connection on the first endpoint and
> the driver simply registers a notifier for the connected async subdev. If
> it's a CSI-2 receiver then we're inline. If it's a companion chip
> we're m2m.
> 
> The libcamera pipeline (not upstream yet) inspects the media entity
> function of the entity connected to the ISP sink pad#0. If it's a
> CSI-2 reciver we're inline. If it's not, we're m2m. Based on that it
> operated the pipeline differently.
> 
> > > So, if you know neoisp will be integrated either inline or m2m in
> > > different SoC lines, maybe deferring it to device tree is good enough
> > > at the expense of a slightly more complicated pipeline ?
> >
> > As said, SoC/ISP HW does support both modes. But I think that the selection
> > can be done in device tree too. So that after bootup, a camera will be used
> > only in 1 mode.
> >
> > > I guess this has implications on the bindings definition as well..
> >
> > Most probably yes. Can this be done as second phase once evaluation is
> > completed ?
> 
> I think you should asses from the very beginning what is the planned
> integration model of the ISP in order not to corner yourself in a
> place where it will be hard to support inline without re-writing
> the driver's media device registration logic.
> 
> Looking at the below media graph of CSI/ISI you should ask the question "how
> will I register the ISP subdev in the CSI-2 media graph when inline"
> and "how will I describe inline vs m2m mode if the underlying hardware
> design doesn't change?" as deferring it to the .dts might not be the
> most correct way to go in that case ?

The driver doesn't need to support all modes right away, but we need to
design the DT bindings and media graph to ensure that additional modes
can be added later without breaking backward compatibility.

> > > > However, if you plan to allow deferring inline/m2m mode selection to
> > > > the system integrators or even have it as a run-time parameter, then
> > > > you should really consider having the ISP in the same media graph as
> > > > the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
> > > > media graph, where you could select the operating mode through media link
> > > > enablement or dts endpoint connections
> > > >
> > > > Niklas (in cc) has addressed a similar situation, where inline and m2m
> > > > mode can be selected by link enablement at runtime here
> > > > https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
> > > > (see risp_cs_internal_ops)
> > > >
> > > > > OK, I thought that ISI was still around...
> > > > >
> > > > > > >    - How many media devices are registered and which driver registers it
> > > > > > >      or them?
> > > > > >
> > > > > > That will be part of the evaluation. My initial assumption is that
> > > > > > neoisp would be the appropriate component to register the media device
> > > > > > in this mode, since ISI is not involved, and ISI currently performs the
> > > > > > registration in the M2M configuration.
> > > >
> > > > Isn't the ISP registering its own media graph ?
> >
> > Yes, 8 copies of ISP media graph, that can be used with the 8 output video
> > devices of the ISI media graph.
> 
> I suggest you do what RPi does. The mainline driver only registers one
> instance and they carry a little patch downstream that implements the
> for() loop where multiple instances are registered. Duplicating media graphs
> is not desirable (at least in mainline) as we can have ISPs with 256
> contexts, we don't want 256 media graphs.
> 
> A framework level solution with proper priority handling and job
> scheduling is what is required and that's what the context work should
> end up being.
> 
> > > > Can we get a copy of all media graphs on an i.MX95 system including
> > > > the ISI and the CSI-2 receiver ?
> >
> > Here is an example with multiple sensors. Or do you need it in another
> > format ?
> 
> No it's fine, thanks!
> 
> > digraph board {
> >         rankdir=TB
> >         n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000001:port5 -> n0000000f:port0 [style=bold]
> >         n00000001:port6 -> n0000001a:port0 [style=bold]
> >         n00000001:port7 -> n00000025:port0 [style=bold]
> >         n00000001:port8 -> n00000030:port0 [style=bold]
> >         n00000001:port9 -> n0000003b:port0 [style=bold]
> >         n00000001:port10 -> n00000046:port0 [style=bold]
> >         n00000001:port11 -> n00000051:port0 [style=bold]
> >         n00000001:port12 -> n0000005c:port0 [style=bold]
> >         n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000000f:port1 -> n00000012 [style=bold]
> >         n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
> >         n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000001a:port1 -> n0000001d [style=bold]
> >         n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
> >         n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000025:port1 -> n00000028 [style=bold]
> >         n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
> >         n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000030:port1 -> n00000033 [style=bold]
> >         n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
> >         n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000003b:port1 -> n0000003e [style=bold]
> >         n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
> >         n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000046:port1 -> n00000049 [style=bold]
> >         n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, style=filled, fillcolor=yellow]
> >         n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000051:port1 -> n00000054 [style=bold]
> >         n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, style=filled, fillcolor=yellow]
> >         n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000005c:port1 -> n0000005f [style=bold]
> >         n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, style=filled, fillcolor=yellow]
> >         n00000067 [label="mxc_isi.output\n", shape=box, style=filled, fillcolor=yellow]
> >         n00000067 -> n00000001:port4 [style=bold]
> >         n0000006e [label="{{<port0> 0} | 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000006e:port1 -> n00000001:port2 [style=bold]
> >         n00000073 [label="{{<port0> 0} | csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000073:port1 -> n0000006e:port0 [style=bold]
> >         n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000078:port4 -> n00000073:port0 [style=dashed]
> >         n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000081:port0 -> n00000078:port0 [style=bold]
> >         n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000085:port0 -> n00000078:port1 [style=bold]
> >         n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n00000089:port0 -> n00000078:port2 [style=bold]
> >         n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> >         n0000008d:port0 -> n00000078:port3 [style=bold]
> > }
> >
> > > > If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
> > > > that's exactly what we're working on with the context framework :)
> > > >
> >
> > Ok. Then I should have a look to context framework too ...
> 
> Please, I hope to be able to resume working on it sooner or later
> given the right use case.
> 
> > > > > ... since it is not, your assumption seems very reasonable.
> > > > >
> > > > > >
> > > > > > >    - How can the user decide whether direct (csi2isp) or indirect
> > > > > > >      (mem2mem) streaming shall be used?
> > > > > >
> > > > > > That will also be part of the evaluation. From dts would be my first
> > > > > > option, but may prevent using both modes on same platform then.
> > > > >
> > > > > Of course this depends what the hardware is able to do, but in case the
> > > > > HW is reconfigurable easily, I doubt that device tree is a good choice
> > > > > to solve that.
> > > > > 
> > > > > > > While it is certainly OK to introduce this support only at a later
> > > > > > > stage, it makes sense to consider this right from the start to avoid
> > > > > > > some nasty changes e.g. in how this hardware is exposed to user space.
> > > > > > >
> > > > > > > Also, we are facing a similiar challenge with recent Rockchip ISP
> > > > > > > hardware (RK3588, RK3576, ...) and it would be great to hear your
> > > > > > > thoughts about that.
> > > > > >
> > > > > > Is there an existing discussion thread available on this topic? I would
> > > > > > be very interested in following it.
> > > > >
> > > > > Not yet, I am afraid. But there should be one or two soon (TM) :-)
> > > >
> > > > It's probably time to have one :)
> >
> > Good. Please loop me in ;)
> 
> You are in, this is the conversation ;)
> 
> It might be a good discussion point for the media summit in Nice
> co-located with Embedded Recipes if people with interest in the topic
> will going the be there.

Possibly even for a whole day workshop on Monday before the media
summit.

> I'm also adding Anthony from ARM as I know he's going through the same
> inline/m2m duality you're now facing.
> 
> > > > > > > > This series is posted as RFC because extending the v4l2-isp interface may
> > > > > > > > overlap with ongoing work. If similar development already exists, I am
> > > > > > > > happy to rebase or adapt the series accordingly. If preferred, the series
> > > > > > > > can also be split into two parts: the v4l2-isp rework and the Neo ISP
> > > > > > > > driver introduction.
> > > > > > > >
> > > > > > > > A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> > > > > > > > consistent with the existing style in that file.
> > > > > > > >
> > > > > > > > Testing was performed on the i.MX95 EVK using the media/next kernel in
> > > > > > > > standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> > > > > > > > using the downstream NXP kernel, as some hardware dependencies are not
> > > > > > > > yet upstreamed.

[snip]

-- 
Regards,

Laurent Pinchart

