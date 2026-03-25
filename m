Return-Path: <linux-media+bounces-57041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDXvIVHkw2lvugQAu9opvQ
	(envelope-from <linux-media+bounces-57041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:34:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E962E325DB3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 834E13096063
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6593DA7C9;
	Wed, 25 Mar 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xn5tmECD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08239B971;
	Wed, 25 Mar 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445030; cv=none; b=ARN4G9GUJYbv1v1l/SkBRxTP6snrJXCBEmcJ2Z5zUTf7l8kFt0vSWzeEFGpa2joauXBbBS+8r2Ogopyal3F6pF3DNpoTNKTk/WQxxcV1ye34Z2qeGGo/UsQt50LxbL4s1Tgv8hjNc3qQ+nilMSz8cpiU8R2UzGLr0q4lI4zw0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445030; c=relaxed/simple;
	bh=taHWZm3ShJLtrqxCP9x7ehkR/AB83RMAdcC9kgC9ZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdwJyIeGxr0gw3l1sWahnVrjEQPYspEAb2lB1Swlvh2I4JRCYS5uth0wON9FUEfdNCJlpwl1AAxSqnn8aAh4+2pcomSJt98ANnMWdWNq2E4Np3wbJt8cn41+QDVvgE0KJs0eH/+4oaWrO/OlotJeu43TgWZgbTsOxeMd3nIOeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xn5tmECD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2383810BE;
	Wed, 25 Mar 2026 14:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774444945;
	bh=taHWZm3ShJLtrqxCP9x7ehkR/AB83RMAdcC9kgC9ZBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xn5tmECDZ1ORVxYuxFNvO9i8fNM/9fuMpc5serH5JDRHX4dc4JxRe3od4IUnLVqJB
	 A7aFPMFlDUlEg+krlT8a+9cqoSb3JEkOPtnfQPs/fXGoYG00uGeCb0g9DtVlb/vN9w
	 O8/U6yhQvRGVnf5NEdW7GRhxLy1AQ46UWeptYjGQ=
Date: Wed, 25 Mar 2026 14:23:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, 
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas soderlund <niklas.soderlund@ragnatech.se>, Anthony McGivern <Anthony.McGivern@arm.com>
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
Message-ID: <acPhDUPKtm1KuzHz@zed>
References: <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
 <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed>
 <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed>
 <1d1b20e9-48da-45c4-82b9-8671959522ab@nxp.com>
 <acE0_8C8WL3crVMm@zed>
 <68cd7c6c-d914-4ea8-9a95-4764f372265a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68cd7c6c-d914-4ea8-9a95-4764f372265a@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57041-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,collabora.com,nxp.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url,diagram.dot:url,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: E962E325DB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Antoine

On Tue, Mar 24, 2026 at 06:44:50PM +0100, Antoine Bouyer wrote:
>
> Hi Jacopo
>
> On 3/23/26 2:18 PM, Jacopo Mondi wrote:
> >
> >
> > Hi Antoine
> >
> > On Fri, Mar 20, 2026 at 05:29:44PM +0100, Antoine Bouyer wrote:
> > > Hi Jacopo
> > >
> > > Quite some updates regarding this RFC after further analysis.
> > >
> > > Le 05/02/2026 à 10:40, Jacopo Mondi a écrit :
> > > >
> > > >
> > > > Hi Antoine
> > > >
> > > > On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
> > > > > Hi Jacopo
> > > > >
> > > > > Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
> > > > > > > Hello
> > > > > > >
> > > > > > > On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
> > > > > > > > Hi Antoine,
> > > > > > > >
> > > > > > > > Thanks for your response.
> > > > > > > >
> > > > > > > > On 1/28/26 09:17, Antoine Bouyer wrote:
> > > > > > > > > Hi Michael
> > > > > > > > >
> > > > > > > > > On 1/26/26 10:44 AM, Michael Riesch wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Hi Antoine,
> > > > > > > > > >
> > > > > > > > > > On 1/23/26 09:09, Antoine Bouyer wrote:
> > > > > > > > > > > Hi all,
> > > > > > > > > > >
> > > > > > > > > > > This RFC patch series introduces the NXP Neo Image Signal Processor
> > > > > > > > > > > (ISP)
> > > > > > > > > > > driver, used in the NXP i.MX95 SoC and future devices in the i.MX9
> > > > > > > > > > > family.
> > > > > > > > > > > The series also includes updates to the generic v4l2-isp interface to
> > > > > > > > > > > support extended statistics required by the Neo ISP.
> > > > > > > > > > >
> > > > > > > > > > > The Neo ISP processes one or more camera streams, converting RAW formats
> > > > > > > > > > > into YUV or RGB outputs. Its architecture is largely influenced by the
> > > > > > > > > > > PISP driver. The hardware supports up to eight contexts, with three sink
> > > > > > > > > > > pads (main input, HDR input, and parameter buffers) and three source
> > > > > > > > > > > pads
> > > > > > > > > > > (RGB output, IR output, and statistics metadata).
> > > > > > > > > > >
> > > > > > > > > > > At this stage, both legacy (fixed-size) and extensible (dynamic-size)
> > > > > > > > > > > parameter/statistics buffers are supported through the generic v4l2-isp
> > > > > > > > > > > framework, similar to rkisp1 and Mali-C55. The driver currently supports
> > > > > > > > > > > M2M operation; direct CSI-to-ISP streaming is not yet implemented.
> > > > > > > > > >
> > > > > > > > > > How do you envisage the direct CSI-to-ISP streaming shall be supported?
> > > > > > > > >
> > > > > > > > > At this stage, this streaming mode still needs to be evaluated on
> > > > > > > > > neoisp. We should follow the integration model used by existing ISP
> > > > > > > > > drivers to avoid duplicating solutions.
> > > > > > > >
> > > > > > > > Fair point, but I have had the impression that there are not many
> > > > > > > > examples (if any). The rkisp1 driver, for instance, only supports inline
> > > > > > > > mode although the HW should be able to do both.
> > > > > > > >
> > > > > > > > But any pointers most welcome, I won't claim I have the full overview.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Below are my initial thoughts on the specific points you raised:
> > > > > > > > >
> > > > > > > > > >      - How shall the final media graph(s) look like?
> > > > > > > > >
> > > > > > > > > The media entities would remain mostly identical, except for the absence
> > > > > > > > > of ISI. The topology would be a direct linkg from sensor->csi-
> > > > > > > > > > formatter->neoisp.
> > > > > > >
> > > > > > > If support for inline mode has to be added later, the ISP will need to
> > > > > > > be registered in the same media graph of the CSI-2 receiver to be able
> > > > > > > to link the two, right ?
> > > > >
> > > > > yes correct.
> > > > >
> > > > > > >
> > > > > > > How do you envision to control the ISP operating mode, because I'm
> > > > > > > afraid if you register the ISP in its own media graph, you're locking
> > > > > > > yourself there as implementing inline mode would require a different
> > > > > > > media topology with all the implications on the rest of the userspace
> > > > > > > stack.
> > > > > > >
> > > > > > > This might not be a problem if you know that the inline vs m2m mode is
> > > > > > > SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
> > > > > > > other as m2m. In this case you'll likely need two pipeline handlers
> > > > > > > in libcamera, but if that's per SoC-line maybe is acceptable. The fact
> > > > > > > you suggests in inline mode there won't be an ISI makes me think this
> > > > > > > actually depends on the SoC design ?
> > > > >
> > > > > Actually, this is not really at SoC synthesis time, neoisp HW does support
> > > > > both modes, that is configurable. But ISP HW can run in a single mode only
> > > >
> > > > > once it is configured. Streaming mode is tightly coupled with CSI HW, then
> > > > > ISP cannot be used in M2M mode with another sensor simultaneously.
> > > > >
> > > >
> > > > Yes, my point is trying to understand "how it is configured" and what
> > > > your expectations are.
> > > >
> > > > Will the board .dts (or a camera .dtso) decide how the ISP is operated
> > > > by defining its endpoint connections ? Assuming with the same SoC both
> > > > inline and m2m modes are possible, without differences in the SoC
> > > > design/integration, will users of the same board have to modify the
> > > > .dts or load ad-hoc .dtso to decide what mode is in use ?
> > > >
> > > > Then, the question of how the media topology will look and which
> > > > components registers what has to be clarified.
> > > >
> > > > Let's try to make a taxonomy of the cases we have in mainline (or on
> > > > their way to mainline).
> > > >
> > > > In the mali example I mentioned, the operating mode is selected by the
> > > > .dtsi as Mali can be integrated either inline or in m2m mode in
> > > > different SoCs. RZ/V2H in example, will always be m2m as it doesn't
> > > > interface the CSI-2 receiver with the ISP but rather interfaces the
> > > > ISP with a companion chip the performs memory access on its behalf
> > > > (the IVC). A different design that incorporates Mali inline will
> > > > instead have to interface the CSI-2 receiver with the ISP with
> > > > internal busses/glue logic and will then have to described this in dts.
> > > >
> > > > This is fine as the ISP integration is different and then having the
> > > > description in dts is legit.
> > > >
> > > > The ISP driver unconditionally registers an async notifier and the
> > > > downstream component (csi-2 or IVC) will register its async subdev(s)
> > > > which will all appear in the ISP media graph. This is possible because
> > > > the assumption is that the CSI-2 receiver (or the companion chip)
> > > > won't register their own media graph.
> > > >
> > > > The Renesas V4H example I mentioned is instead different. The ISP can
> > > > be operated in inline and m2m, on the same SoC without any
> > > > modification to hardware and to the dts/dtsi. It's basically a user
> > > > choice we defer to runtime.
> > > >
> > > > The V4H already has a component that registers a media graph: the
> > > > CSI-2/VIN block which is found in many SoCs of the same (and older)
> > > > generations. The ISP is present only in some SoC, but the CSI-2/VIN is
> > > > always there. In this case, to support both inline and m2m modes, the
> > > > VIN registers the media device and, with the trick I pointed you to in
> > > > Niklas' code, the ISP registers a subdev in the VIN media graph. Then
> > > > the inline/m2m mode can be selected by media link enablement at
> > > > run-time. Now, inline mode is not yet supported on V4H and there might
> > > > be dragons there, but at least, both modes should be possible on the same
> > > > SoC.
> > > >
> > > > On the other extremes we have the RaspberryPi PiSP BE and RkISP1.
> > > >
> > > > RPi knows the only SoC where the PiPS will be found is their one. The
> > > > ISP cannot function inline and will always be m2m. In this case, a
> > > > dedicated media graph for the ISP is the simplest and cleanest
> > > > solution.
> > > >
> > > > RkISP1 instead will always be inline only. It registers a media device
> > > > and an async notifier, the connected CSI-2 receiver will register an
> > > > async subdev and will be connected to the device tree endpoint of the
> > > > ISP device node.
> > > >
> > > > What model is the closest one to the neoisp integration that you
> > > > envision on NXP SoCs ?
> > >
> > > Then the closest model is the V4H one I believe: we both support m2m and
> > > streaming (inline) modes on the same SoC. I tested the trick you pointed
> > > out, and let the formatter sharing the media device (owned by ISI) to the
> > > neo ISP, like renesas csisp does. It registers as expected, thanks for the
> > > proposal !
> > >
> > > I think formatter is a good candidate since it is physically connected to
> > > ISP through a pixel link for streaming mode. Moreover, I propose to create a
> > > dedicated pad b/w formatter and ISP and keep the one b/w formatter and ISI
> > > as it is, so that in future we can configure the stream format which is sent
> > > to ISP, and the one sent to ISI.
> >
> > So, if I look at the ISI media graph you shared earlier in the thread,
> > the formatter will gain one source pad to be optionally connected to
> > the ISP, while the existing one that connectes to the crossbar will
> > stay as it is today ?
>
> Yes exactly. However, I don't plan to push the pad changes on the M2M patch
> series yet. I would rather create the pads (formatter and ISP) together with
> the introduction of the inline mode.
>

As long as introducing the two new pads doesn't change the enumeration
of the other ones I think it's fine. The only requirement is that
userspace that used to work with the m2m-only implementation should
continue working once the media graph is modified to support inline.

> >
> > >
> > > I also tested the streaming path can be added in device tree with endpoint
> > > connections between the nodes, so that ISP can create the media link when it
> > > registers itself to the media device.
> >
> > I think this is fine if there actually is a data path between the
> > formatter and the ISP as you have suggested.
>
> Yes there is a pixel link between formatter and ISP (at least on i.MX95
> SoC).
>
> >
> > >
> > > Thus at runtime, if userspace enables this link, then neo runs in streaming
> > > mode, otherwise m2m is used.
> >
> > So if we have an ISI, the ISP can be operated in m2m or inline based
> > on run-time link enablement, right ?
>
> Yes. And as per my understanding, ISI could still be used with inline-ISP,
> to capture raw frame.
>
> >
> > >
> > > If another SoC in future doesn't support streaming path, the endpoints can
> > > be removed from device tree, the ISP would stay in media graph anyway with
> > > m2m mode only.
> >
> > Nice!
> >
> > Do you envision a streaming mode only design, where there is no ISI
> > and the ISP has to register the media device itself ?
>
> AFAIK, there is no such design, ISI is always there.

Ok, that's good

>
> However, I initially though about adding an ISP "standalone" mode, where ISP
> could register its own media device (as it was done before). That could ease
> standalone test I believe, and limit dependency with other drivers. But I
> don't know how this can cohabit with the phandle registration approach,
> except by adding a new optional property on neoisp node to force standalone
> registration, or a module parameter.
>
> Do you think it's worth adding such standalone mode ? and if yes, how can we
> enable it in a proper way ?
>

I don't think it's something that should be mainlined. If it's useful
for your testing please go ahead, but I'm not sure this can be
mainlined...

> >
> > >
> > > Do you think this is good approach ?
> > >
> >
> > Certainly so! Thanks for the effort!
> >
> > > >
> > > > > >
> > > > > > One small correction after some more research:
> > > > > >
> > > > > > we actually already have a pipeline in libcamera that supports inline
> > > > > > and (will soon) support m2m: the mali c55 one. My take on "probably
> > > > > > need two pipeline handlers" was not correct then.
> > > > >
> > > > > Yes, I saw your patchwork on libcamera about this coming upgrade. Spent some
> > > > > time analyzing it ':) Seems we are quite aligned as per my understanding:
> > > > > inline mode (i.e. streaming mode with neoisp) _or_ M2M mode using IVC video
> > > > > device from Mali. Is that right ?
> > > > >
> > > > > >
> > > > > > As said, Mali-C55 can be integrated inline or in m2m mode and this is
> > > > > > decided based on the device tree endpoint connections.
> > > > >
> > > > > Good. Do you have an example available ?
> > > >
> > > > It's in mainline, but there's nothing exciting there as the assumption
> > > > is that there will always be a connection on the first endpoint and
> > > > the driver simply registers a notifier for the connected async subdev. If
> > > > it's a CSI-2 receiver then we're inline. If it's a companion chip
> > > > we're m2m.
> > > >
> > > > The libcamera pipeline (not upstream yet) inspects the media entity
> > > > function of the entity connected to the ISP sink pad#0. If it's a
> > > > CSI-2 reciver we're inline. If it's not, we're m2m. Based on that it
> > > > operated the pipeline differently.
> > > >
> > > > >
> > > > > >
> > > > > > So, if you know neoisp will be integrated either inline or m2m in
> > > > > > different SoC lines, maybe deferring it to device tree is good enough
> > > > > > at the expense of a slightly more complicated pipeline ?
> > > > >
> > > > > As said, SoC/ISP HW does support both modes. But I think that the selection
> > > > > can be done in device tree too. So that after bootup, a camera will be used
> > > > > only in 1 mode.
> > > > >
> > > > > >
> > > > > > I guess this has implications on the bindings definition as well..
> > > > >
> > > > > Most probably yes. Can this be done as second phase once evaluation is
> > > > > completed ?
> > > > >
> > > >
> > > > I think you should asses from the very beginning what is the planned
> > > > integration model of the ISP in order not to corner yourself in a
> > > > place where it will be hard to support inline without re-writing
> > > > the driver's media device registration logic.
> > > >
> > > > Looking at the below media graph of CSI/ISI you should ask the question "how
> > > > will I register the ISP subdev in the CSI-2 media graph when inline"
> > > > and "how will I describe inline vs m2m mode if the underlying hardware
> > > > design doesn't change?" as deferring it to the .dts might not be the
> > > > most correct way to go in that case ?
> > >
> > > So I think we are aligned now: one media graph from the beginning for
> > > supporting both modes, even if first mainline version only supports m2m.
> > > Would that be ok ?
> > >
> >
> > Yes!
> >
> > Let's only just clarify if there will ever be a mode where there is no
> > ISI as in that case I think we need to clarify who will register the
> > media graph and the async notifiers..
>
> Fine. Let me prepare a patchset with all changes already discussed then. I
> keep standalone mode out for the moment.

Fine with me!

Thanks
  j

>
> BR
> Antoine
>
> >
> > > >
> > > > > >
> > > > > > >
> > > > > > > However, if you plan to allow deferring inline/m2m mode selection to
> > > > > > > the system integrators or even have it as a run-time parameter, then
> > > > > > > you should really consider having the ISP in the same media graph as
> > > > > > > the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
> > > > > > > media graph, where you could select the operating mode through media link
> > > > > > > enablement or dts endpoint connections
> > > > > > >
> > > > > > > Niklas (in cc) has addressed a similar situation, where inline and m2m
> > > > > > > mode can be selected by link enablement at runtime here
> > > > > > > https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
> > > > > > > (see risp_cs_internal_ops)
> > > > > > >
> > > > > > > >
> > > > > > > > OK, I thought that ISI was still around...
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >      - How many media devices are registered and which driver registers it
> > > > > > > > > >        or them?
> > > > > > > > >
> > > > > > > > > That will be part of the evaluation. My initial assumption is that
> > > > > > > > > neoisp would be the appropriate component to register the media device
> > > > > > > > > in this mode, since ISI is not involved, and ISI currently performs the
> > > > > > > > > registration in the M2M configuration.
> > > > > > >
> > > > > > > Isn't the ISP registering its own media graph ?
> > > > >
> > > > > Yes, 8 copies of ISP media graph, that can be used with the 8 output video
> > > > > devices of the ISI media graph.
> > > > >
> > > >
> > > > I suggest you do what RPi does. The mainline driver only registers one
> > > > instance and they carry a little patch downstream that implements the
> > > > for() loop where multiple instances are registered. Duplicating media graphs
> > > > is not desirable (at least in mainline) as we can have ISPs with 256
> > > > contexts, we don't want 256 media graphs.
> > >
> > > Ok. Will do same approach then: 1 neoisp instance on mainline + downstream
> > > patch to create other instances (x8), all in same media graph.
> >
> > Thank you. Let's work on a proper solution and then the downstream
> > patch will be dropped!
> >
> > >
> > > >
> > > > A framework level solution with proper priority handling and job
> > > > scheduling is what is required and that's what the context work should
> > > > end up being.>
> > > >
> > > > > > >
> > > > > > > Can we get a copy of all media graphs on an i.MX95 system including
> > > > > > > the ISI and the CSI-2 receiver ?
> > > > >
> > > > > Here is an example with multiple sensors. Or do you need it in another
> > > > > format ?
> > > >
> > > > No it's fine, thanks!
> > > >
> > > > >
> > > > >
> > > > > digraph board {
> > > > >           rankdir=TB
> > > > >           n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 |
> > > > > <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7
> > > > > | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}",
> > > > > shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000001:port5 -> n0000000f:port0 [style=bold]
> > > > >           n00000001:port6 -> n0000001a:port0 [style=bold]
> > > > >           n00000001:port7 -> n00000025:port0 [style=bold]
> > > > >           n00000001:port8 -> n00000030:port0 [style=bold]
> > > > >           n00000001:port9 -> n0000003b:port0 [style=bold]
> > > > >           n00000001:port10 -> n00000046:port0 [style=bold]
> > > > >           n00000001:port11 -> n00000051:port0 [style=bold]
> > > > >           n00000001:port12 -> n0000005c:port0 [style=bold]
> > > > >           n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000000f:port1 -> n00000012 [style=bold]
> > > > >           n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000001a:port1 -> n0000001d [style=bold]
> > > > >           n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000025:port1 -> n00000028 [style=bold]
> > > > >           n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000030:port1 -> n00000033 [style=bold]
> > > > >           n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000003b:port1 -> n0000003e [style=bold]
> > > > >           n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000046:port1 -> n00000049 [style=bold]
> > > > >           n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000051:port1 -> n00000054 [style=bold]
> > > > >           n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 |
> > > > > {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000005c:port1 -> n0000005f [style=bold]
> > > > >           n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box,
> > > > > style=filled, fillcolor=yellow]
> > > > >           n00000067 [label="mxc_isi.output\n", shape=box, style=filled,
> > > > > fillcolor=yellow]
> > > > >           n00000067 -> n00000001:port4 [style=bold]
> > > > >           n0000006e [label="{{<port0> 0} |
> > > > > 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}",
> > > > > shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000006e:port1 -> n00000001:port2 [style=bold]
> > > > >           n00000073 [label="{{<port0> 0} |
> > > > > csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord,
> > > > > style=filled, fillcolor=green]
> > > > >           n00000073:port1 -> n0000006e:port0 [style=bold]
> > > > >           n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} |
> > > > > max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}",
> > > > > shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000078:port4 -> n00000073:port0 [style=dashed]
> > > > >           n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 |
> > > > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000081:port0 -> n00000078:port0 [style=bold]
> > > > >           n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 |
> > > > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000085:port0 -> n00000078:port1 [style=bold]
> > > > >           n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 |
> > > > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n00000089:port0 -> n00000078:port2 [style=bold]
> > > > >           n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 |
> > > > > {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> > > > >           n0000008d:port0 -> n00000078:port3 [style=bold]
> > > > > }
> > > > >
> > > > >
> > > > > > >
> > > > > > > If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
> > > > > > > that's exactly what we're working on with the context framework :)
> > > > > > >
> > > > >
> > > > > Ok. Then I should have a look to context framework too ...
> > > > >
> > > >
> > > > Please, I hope to be able to resume working on it sooner or later
> > > > given the right use case.
> > >
> > > Ok. Will continue monitoring the multi context work. Seems to be a nice
> > > feature indeed. But as impact on userspace is more significant, that can be
> > > done as a second step I guess, and will keep the multi instance downstream
> > > patch meanwhile.
> > >
> > > >
> > > > > > >
> > > > > > > >
> > > > > > > > ... since it is not, your assumption seems very reasonable.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >      - How can the user decide whether direct (csi2isp) or indirect
> > > > > > > > > >        (mem2mem) streaming shall be used?
> > > > > > > > >
> > > > > > > > > That will also be part of the evaluation. From dts would be my first
> > > > > > > > > option, but may prevent using both modes on same platform then.
> > > > > > > >
> > > > > > > > Of course this depends what the hardware is able to do, but in case the
> > > > > > > > HW is reconfigurable easily, I doubt that device tree is a good choice
> > > > > > > > to solve that.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > While it is certainly OK to introduce this support only at a later
> > > > > > > > > > stage, it makes sense to consider this right from the start to avoid
> > > > > > > > > > some nasty changes e.g. in how this hardware is exposed to user space.
> > > > > > > > > >
> > > > > > > > > > Also, we are facing a similiar challenge with recent Rockchip ISP
> > > > > > > > > > hardware (RK3588, RK3576, ...) and it would be great to hear your
> > > > > > > > > > thoughts about that.
> > > > > > > > >
> > > > > > > > > Is there an existing discussion thread available on this topic? I would
> > > > > > > > > be very interested in following it.
> > > > > > > >
> > > > > > > > Not yet, I am afraid. But there should be one or two soon (TM) :-)
> > > > > > >
> > > > > > > It's probably time to have one :)
> > > > >
> > > > > Good. Please loop me in ;)
> > > >
> > > > You are in, this is the conversation ;)
> > > >
> > > > It might be a good discussion point for the media summit in Nice
> > > > co-located with Embedded Recipes if people with interest in the topic
> > > > will going the be there.
> > >
> > > Great ! Will try to join then.
> > >
> >
> > I'm not sure yet how many interested parties will be in Nice and if it
> > would make sense to organize an "ISP design day" there or should we
> > plan a devroom for Plumbers in Prague ?
> >
> >
> > > BR
> > > Antoine
> > >
> > > >
> > > > I'm also adding Anthony from ARM as I know he's going through the same
> > > > inline/m2m duality you're now facing.
> > > >
> > > > Thanks
> > > >     j
> > > >
> > > > >
> > > > > BR
> > > > > Antoine
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks and regards,
> > > > > > > > Michael
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > Antoine
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thanks in advance and best regards,
> > > > > > > > > > Michael
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > This series is posted as RFC because extending the v4l2-isp interface
> > > > > > > > > > > may
> > > > > > > > > > > overlap with ongoing work. If similar development already exists, I am
> > > > > > > > > > > happy to rebase or adapt the series accordingly. If preferred, the
> > > > > > > > > > > series
> > > > > > > > > > > can also be split into two parts: the v4l2-isp rework and the Neo ISP
> > > > > > > > > > > driver introduction.
> > > > > > > > > > >
> > > > > > > > > > > A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> > > > > > > > > > > consistent with the existing style in that file.
> > > > > > > > > > >
> > > > > > > > > > > Testing was performed on the i.MX95 EVK using the media/next kernel in
> > > > > > > > > > > standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> > > > > > > > > > > using the downstream NXP kernel, as some hardware dependencies are not
> > > > > > > > > > > yet upstreamed.
> > > > > > > > > > >
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Antoine
> > > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > > Here are v4l2-compliance test results:
> > > > > > > > > > >
> > > > > > > > > > > v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> > > > > > > > > > > v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> > > > > > > > > > >
> > > > > > > > > > > Compliance test for neoisp device /dev/media0:
> > > > > > > > > > >
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MEDIA_IOC_DEVICE_INFO: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/media0 open: OK
> > > > > > > > > > >           test MEDIA_IOC_DEVICE_INFO: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Media Controller ioctls:
> > > > > > > > > > >           test MEDIA_IOC_G_TOPOLOGY: OK
> > > > > > > > > > >           Entities: 7 Interfaces: 7 Pads: 12 Links: 13
> > > > > > > > > > >           test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> > > > > > > > > > >           test MEDIA_IOC_SETUP_LINK: OK
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video0:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x04202000
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x0300000a
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x00000008 (8)
> > > > > > > > > > >           Name             : neoisp-input0
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x01000009   : 0: Source
> > > > > > > > > > >             Link 0x0200000c: to remote pad 0x1000002 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video0 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video1:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x04202000
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x03000010
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x0000000e (14)
> > > > > > > > > > >           Name             : neoisp-input1
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x0100000f   : 0: Source
> > > > > > > > > > >             Link 0x02000012: to remote pad 0x1000003 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video1 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video2:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x0c200000
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x03000016
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x00000014 (20)
> > > > > > > > > > >           Name             : neoisp-params
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x01000015   : 0: Source
> > > > > > > > > > >             Link 0x02000018: to remote pad 0x1000004 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video2 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK (Not Supported)
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video3:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x04201000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x0300001c
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x0000001a (26)
> > > > > > > > > > >           Name             : neoisp-frame
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x0100001b   : 0: Sink
> > > > > > > > > > >             Link 0x0200001e: from remote pad 0x1000005 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video3 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK (Not Supported)
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video4:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x04201000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x03000022
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x00000020 (32)
> > > > > > > > > > >           Name             : neoisp-ir
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x01000021   : 0: Sink
> > > > > > > > > > >             Link 0x02000024: from remote pad 0x1000006 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video4 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK (Not Supported)
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/video5:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Card type        : neoisp
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x8ca03000
> > > > > > > > > > >                   Video Capture Multiplanar
> > > > > > > > > > >                   Video Output Multiplanar
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Metadata Output
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > >                   Device Capabilities
> > > > > > > > > > >           Device Caps      : 0x04a00000
> > > > > > > > > > >                   Metadata Capture
> > > > > > > > > > >                   Streaming
> > > > > > > > > > >                   Extended Pix Format
> > > > > > > > > > > Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x03000028
> > > > > > > > > > >           Type             : V4L Video
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x00000026 (38)
> > > > > > > > > > >           Name             : neoisp-stats
> > > > > > > > > > >           Function         : V4L2 I/O
> > > > > > > > > > >           Pad 0x01000027   : 0: Sink
> > > > > > > > > > >             Link 0x0200002a: from remote pad 0x1000007 of entity
> > > > > > > > > > > 'neoisp' (Image Signal Processor): Data, Enabled
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/video5 open: OK
> > > > > > > > > > >           test VIDIOC_QUERYCAP: OK
> > > > > > > > > > >           test VIDIOC_G/S_PRIORITY: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 0 Private Controls: 0
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK
> > > > > > > > > > >           test VIDIOC_S_FMT: OK
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK (Not Supported)
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
> > > > > > > > > > > Warnings: 0
> > > > > > > > > > > --------------------------------------------------------------------------------
> > > > > > > > > > > Compliance test for neoisp device /dev/v4l-subdev0:
> > > > > > > > > > >
> > > > > > > > > > > Driver Info:
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > >           Capabilities     : 0x00000000
> > > > > > > > > > >           Client Capabilities: 0x0000000000000002
> > > > > > > > > > > interval-uses-which Media Driver Info:
> > > > > > > > > > >           Driver name      : neoisp
> > > > > > > > > > >           Model            : neoisp
> > > > > > > > > > >           Serial           :
> > > > > > > > > > >           Bus info         : platform:4ae00000.isp
> > > > > > > > > > >           Media version    : 6.19.0
> > > > > > > > > > >           Hardware revision: 0x00000002 (2)
> > > > > > > > > > >           Driver version   : 6.19.0
> > > > > > > > > > > Interface Info:
> > > > > > > > > > >           ID               : 0x0300002c
> > > > > > > > > > >           Type             : V4L Sub-Device
> > > > > > > > > > > Entity Info:
> > > > > > > > > > >           ID               : 0x00000001 (1)
> > > > > > > > > > >           Name             : neoisp
> > > > > > > > > > >           Function         : Image Signal Processor
> > > > > > > > > > >           Pad 0x01000002   : 0: Sink
> > > > > > > > > > >             Link 0x0200000c: from remote pad 0x1000009 of entity
> > > > > > > > > > > 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
> > > > > > > > > > >           Pad 0x01000003   : 1: Sink
> > > > > > > > > > >             Link 0x02000012: from remote pad 0x100000f of entity
> > > > > > > > > > > 'neoisp-input1' (V4L2 I/O): Data
> > > > > > > > > > >           Pad 0x01000004   : 2: Sink
> > > > > > > > > > >             Link 0x02000018: from remote pad 0x1000015 of entity
> > > > > > > > > > > 'neoisp-params' (V4L2 I/O): Data, Enabled
> > > > > > > > > > >           Pad 0x01000005   : 3: Source
> > > > > > > > > > >             Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
> > > > > > > > > > > frame' (V4L2 I/O): Data, Enabled
> > > > > > > > > > >           Pad 0x01000006   : 4: Source
> > > > > > > > > > >             Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
> > > > > > > > > > > ir' (V4L2 I/O): Data
> > > > > > > > > > >           Pad 0x01000007   : 5: Source
> > > > > > > > > > >             Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
> > > > > > > > > > > stats' (V4L2 I/O): Data, Enabled
> > > > > > > > > > >
> > > > > > > > > > > Required ioctls:
> > > > > > > > > > >           test MC information (see 'Media Driver Info' above): OK
> > > > > > > > > > >           test VIDIOC_SUDBEV_QUERYCAP: OK
> > > > > > > > > > >           test invalid ioctls: OK
> > > > > > > > > > >
> > > > > > > > > > > Allow for multiple opens:
> > > > > > > > > > >           test second /dev/v4l-subdev0 open: OK
> > > > > > > > > > >           test VIDIOC_SUBDEV_QUERYCAP: OK
> > > > > > > > > > >           test for unlimited opens: OK
> > > > > > > > > > >
> > > > > > > > > > > Debug ioctls:
> > > > > > > > > > >           test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Input ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > > > > > > > >           Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > > > > > > > >
> > > > > > > > > > > Output ioctls:
> > > > > > > > > > >           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > > > > > > > >           Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > > > > > > > >
> > > > > > > > > > > Input/Output configuration ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Sink Pad 0):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Sink Pad 1):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Sink Pad 2):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Source Pad 3):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Source Pad 4):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Sub-Device ioctls (Source Pad 5):
> > > > > > > > > > >           Try Stream 0
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           Active Stream 0
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> > > > > > > > > > > FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > > > > > > > > > >           test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Control ioctls:
> > > > > > > > > > >           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > > > > > > > > >           test VIDIOC_QUERYCTRL: OK
> > > > > > > > > > >           test VIDIOC_G/S_CTRL: OK
> > > > > > > > > > >           test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > > > > > > > > >           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > > > > > > > > >           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > > > > > > > >           Standard Controls: 1 Private Controls: 1
> > > > > > > > > > >
> > > > > > > > > > > Format ioctls:
> > > > > > > > > > >           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
> > > > > > > > > > > Supported)
> > > > > > > > > > >           test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FBUF: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_FMT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_TRY_FMT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_S_FMT: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > > > > > > > >           test Cropping: OK (Not Supported)
> > > > > > > > > > >           test Composing: OK (Not Supported)
> > > > > > > > > > >           test Scaling: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Codec ioctls:
> > > > > > > > > > >           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > > > > > > > >           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Buffer ioctls:
> > > > > > > > > > >           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > > > > > > > > > >           test CREATE_BUFS maximum buffers: OK
> > > > > > > > > > >           test VIDIOC_REMOVE_BUFS: OK
> > > > > > > > > > >           test VIDIOC_EXPBUF: OK (Not Supported)
> > > > > > > > > > >           test Requests: OK (Not Supported)
> > > > > > > > > > >
> > > > > > > > > > > Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
> > > > > > > > > > > 0, Warnings: 0
> > > > > > > > > > >
> > > > > > > > > > > Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
> > > > > > > > > > > Failed: 0, Warnings: 0
> > > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > > Antoine Bouyer (11):
> > > > > > > > > > >       media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
> > > > > > > > > > >       media: v4l2-isp: Add helper function to compute extended stats size
> > > > > > > > > > >       media: Documentation: uapi: Update V4L2 ISP for extensible stats
> > > > > > > > > > >       media: Documentation: Add NXP neoisp driver documentation
> > > > > > > > > > >       dt-bindings: media: Add nxp neoisp support
> > > > > > > > > > >       media: v4l2-ctrls: Add user control base for NXP neoisp controls
> > > > > > > > > > >       media: Add meta formats supported by NXP neoisp driver
> > > > > > > > > > >       media: uapi: Add NXP NEOISP user interface header file
> > > > > > > > > > >       media: platform: Add NXP Neoisp Image Signal Processor
> > > > > > > > > > >       media: platform: neoisp: Add debugfs support
> > > > > > > > > > >       arm64: dts: freescale: imx95: Add NXP neoisp device tree node
> > > > > > > > > > >
> > > > > > > > > > >      .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
> > > > > > > > > > >      .../admin-guide/media/nxp-neoisp.dot          |   16 +
> > > > > > > > > > >      .../admin-guide/media/nxp-neoisp.rst          |  189 ++
> > > > > > > > > > >      .../admin-guide/media/v4l-drivers.rst         |    1 +
> > > > > > > > > > >      .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
> > > > > > > > > > >      .../userspace-api/media/v4l/meta-formats.rst  |    1 +
> > > > > > > > > > >      .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
> > > > > > > > > > >      .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
> > > > > > > > > > >      MAINTAINERS                                   |    9 +
> > > > > > > > > > >      .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
> > > > > > > > > > >      arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
> > > > > > > > > > >      drivers/media/platform/nxp/Kconfig            |    1 +
> > > > > > > > > > >      drivers/media/platform/nxp/Makefile           |    1 +
> > > > > > > > > > >      drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
> > > > > > > > > > >      drivers/media/platform/nxp/neoisp/Makefile    |    8 +
> > > > > > > > > > >      drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
> > > > > > > > > > >      .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
> > > > > > > > > > >      drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
> > > > > > > > > > >      .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
> > > > > > > > > > >      drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
> > > > > > > > > > >      include/media/v4l2-isp.h                      |   13 +
> > > > > > > > > > >      include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
> > > > > > > > > > >      include/uapi/linux/media/v4l2-isp.h           |   85 +
> > > > > > > > > > >      include/uapi/linux/v4l2-controls.h            |    6 +
> > > > > > > > > > >      include/uapi/linux/videodev2.h                |    6 +
> > > > > > > > > > >      30 files changed, 11880 insertions(+), 3 deletions(-)
> > > > > > > > > > >      create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
> > > > > > > > > > > diagram.dot
> > > > > > > > > > >      create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
> > > > > > > > > > >      create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
> > > > > > > > > > >      create mode 100644 Documentation/devicetree/bindings/media/
> > > > > > > > > > > nxp,neoisp.yaml
> > > > > > > > > > >      create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
> > > > > > > > > > > nxp-neoisp.rst
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
> > > > > > > > > > >      create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
> > > > > > > > > > >      create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > >
> > >
>
>

