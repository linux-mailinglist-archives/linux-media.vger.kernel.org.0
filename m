Return-Path: <linux-media+bounces-51332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBLnFeX1cWmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:03:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D475D64F5D
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 756B6860A6C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2943382FE;
	Thu, 22 Jan 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iDcvUCn1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D533B6CC;
	Thu, 22 Jan 2026 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769075596; cv=none; b=Vy+jQmc5bzalpM+lVrSx8o9b82YgVZvhSdTI4HIll0eV/3iyvoayTScw5/0OWpU2jypAch4t0lh/eoZvxAFexNLEFFoEPG60ZNZvLrmP/vfkrwAQflBqGabiyBcTB18CxwEmXrQ7puIhqaiyruSV6KjfcSaOQ5CzhLPiv29RULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769075596; c=relaxed/simple;
	bh=bIh5r7cS8MUO8tOFBdIzTReCFDh2J0N4fGlfDUfmc0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+Rj6ozOPlu6S+EGStDiE+5mMFV+BlEGBAhM/KC6peM+BRi/XkAPW8Zb7SMdmJrg5bFI5tDPOD4PtzhsvHqOHPlcTNGoS2SL8zvOmb8bEf2Cs0EFbYj70EAQvTGrsa/MeGrpxAmXAsp6/YPKuNvNdMuyI1WshLu7gyVzpeMqNtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iDcvUCn1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 53B182DD;
	Thu, 22 Jan 2026 10:52:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769075557;
	bh=bIh5r7cS8MUO8tOFBdIzTReCFDh2J0N4fGlfDUfmc0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDcvUCn1b5fXqF6eTitb1SIrAu6NroX/jmsSVpBw8qio66Bu55RnOqrm2ZjJMXEBw
	 01PMuQn/mHpCRTSvKTz2Tq/jTqcp+XhYFi+N1aPpPOb49ZSCF7Myi39CrCeJo1evub
	 TSZmahiXyuYQxEDPbu/0g0IK1h3qwJEI+vz4jfbs=
Date: Thu, 22 Jan 2026 11:53:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
	vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org,
	hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com,
	jack.zhu@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, jai.luthra@linux.dev,
	mripard@kernel.org, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the
 core device
Message-ID: <20260122095308.GF209830@killaraus>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-7-r-donadkar@ti.com>
 <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
 <176845899846.9154.18009615769864845946@freya>
 <d9f3335a-d8f4-40cc-b4c4-a93b797a89fd@ideasonboard.com>
 <20260120232521.GE173080@killaraus>
 <8b8e603f-5d04-44ce-91ab-85df8fe0ae94@ideasonboard.com>
 <20260121105232.GD382676@killaraus>
 <176906483058.9154.2619844247504630480@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176906483058.9154.2619844247504630480@freya>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51332-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,ti.com,kernel.org,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: D475D64F5D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:23:50PM +0530, Jai Luthra wrote:
> Quoting Laurent Pinchart (2026-01-21 16:22:32)
> > On Wed, Jan 21, 2026 at 09:38:29AM +0200, Tomi Valkeinen wrote:
> > > On 21/01/2026 01:25, Laurent Pinchart wrote:
> > > > On Thu, Jan 15, 2026 at 02:56:21PM +0200, Tomi Valkeinen wrote:
> > > >> On 15/01/2026 08:36, Jai Luthra wrote:
> > > >>> Quoting Tomi Valkeinen (2026-01-14 20:51:49)
> > > >>>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > > >>>>> From: Jai Luthra <j-luthra@ti.com>
> > > >>>>>
> > > >>>>> With single stream capture, it was simpler to use the video device as
> > > >>>>> the media entity representing the main TI CSI2RX device. Now with multi
> > > >>>>> stream capture coming into the picture, the model has shifted to each
> > > >>>>> video device having a link to the main device's subdev. The routing
> > > >>>>> would then be set on this subdev.
> > > >>>>>
> > > >>>>> Add this subdev, link each context to this subdev's entity and link the
> > > >>>>> subdev's entity to the source. Also add an array of media pads. It will
> > > >>>>> have one sink pad and source pads equal to the number of contexts.
> > > >>>>>
> > > >>>>> Support the new enable_stream()/disable_stream() APIs in the subdev
> > > >>>>> instead of s_stream() hook.
> > > >>>>>
> > > >>>>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > >>>>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > > >>>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > >>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > > >>>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > > >>>>> ---
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>>>> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
> > > >>>>>       struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
> > > >>>>>       struct ti_csi2rx_dev *csi = ctx->csi;
> > > >>>>>       struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
> > > >>>>> -     struct v4l2_subdev_format source_fmt = {
> > > >>>>> -             .which  = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > >>>>> -             .pad    = link->source->index,
> > > >>>>> -     };
> > > >>>>> +     struct v4l2_mbus_framefmt *format;
> > > >>>>> +     struct v4l2_subdev_state *state;
> > > >>>>>       const struct ti_csi2rx_fmt *ti_fmt;
> > > >>>>> -     int ret;
> > > >>>>>  
> > > >>>>> -     ret = v4l2_subdev_call_state_active(csi->source, pad,
> > > >>>>> -                                         get_fmt, &source_fmt);
> > > >>>>> -     if (ret)
> > > >>>>> -             return ret;
> > > >>>>> +     state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> > > >>>>> +     format = v4l2_subdev_state_get_format(state, link->source->index, 0);
> > > >>>>> +     v4l2_subdev_unlock_state(state);
> > > >>>>>  
> > > >>>>> -     if (source_fmt.format.width != csi_fmt->width) {
> > > >>>>> +     if (!format) {
> > > >>>>> +             dev_dbg(csi->dev,
> > > >>>>> +                     "Skipping validation as no format present on \"%s\":%u:0\n",
> > > >>>>> +                     link->source->entity->name, link->source->index);
> > > >>>>> +             return 0;
> > > >>>>
> > > >>>> Isn't this an error?
> > > >>>
> > > >>> Well, the j7 shim subdev introduced here has immutable and active links to
> > > >>> all the video nodes, for each DMA channel (taken from DT), many of which
> > > >>> may be unused for certain setups, and thus there might not be any valid
> > > >>> format on the subdev source pad corresponding to an unused video node.
> > > >>>
> > > >>> Jacopo had a similar comment on v2, see this discussion (grep for Mali):
> > > >>> https://lore.kernel.org/linux-media/4mnlnsj4co3agvln4qsasmgvgwiyoo7yu2h5wyh4rmzzafhm5u@avhnbw7iknms/
> > > >>>
> > > >>> I know other drivers use a different approach with mutable links, so it
> > > >>> would be good if you/Laurent/Sakari can give your opinions on if only one
> > > >>> of these two approaches should be taken for multi-stream pipelines.
> > > >>
> > > >> I see.
> > > >>
> > > >> Well, I don't have a definite answer. With some thinking both options
> > > >> make certain sense. It makes sense to keep the links immutable and
> > > >> always enabled, as there's no configuration that can be done. On the
> > > >> other hand, it makes sense to require the unused links to be disabled,
> > > >> as, well, they are not used.
> > > > 
> > > > I'm not familiar with the implications this would have on this driver,
> > > > but generally speaking, if a stream is added to the media pipeline by
> > > > the pipeline build algorithm, then it is expected that applications
> > > > would have configured it correctly. Streams that are not used are
> > > > expected to be disabled if they would otherwise be added to the
> > > > pipeline.
> > > 
> > > I think the thing here is that the driver creates immutable
> > > always-enabled media links between the videodevs and the first subdev.
> > > Then, say, if only one stream is being used, only one of those links is
> > > actually used, and for every other link the above check fails as there's
> > > no stream, so no format.
> > > 
> > > In TI CAL driver the links were mutable, and unused links had to be
> > > disabled. There it made sense as the links had to be configurable (there
> > > were two PHYs). Here, there's no configuration needed, so immutable
> > > links make sense, but then they're enabled even when actually not used.
> > 
> > If the routing table in the subdev does not contain any route that goes
> > towards a video node, then that video node should not be added to the
> > pipeline by the validation code, and no validation will be attempted. At
> > least that's the theory.
> 
> Okay that sounds reasonable. I can take a look into the media pipeline
> validation code next week. @Rishikesh, given you already have a working
> setup, feel free to test if the link_validate callback is triggered on
> video nodes that don't have any streams/routes pointing to them.
> 
> > I see that this driver implements .link_validate() as a
> > media_entity_operations, not a subdev operation. I wonder if that could
> > explain the issue.
> 
> Well earlier I was partially confused, now I'm fully confused :-)
> 
> How is v4l2_subdev_pad_ops.link_validate different from
> media_entity_operations.link_validate?

media_entity_operations.link_validate() is the entry point, called by
the media pipeline validation code that is agnostic to entity types. It
is called on the sink entity of each link.

When the sink is a subdev, the common practice is to implement
media_entity_operations.link_validate() using
v4l2_subdev_link_validate(), which iterates over streams and validate
them individually with v4l2_subdev_pad_ops.link_validate(). That
operation can be left out if the default implementation
v4l2_subdev_link_validate_default() is enough, or a custom
.link_validate() operation can be provided that calls
v4l2_subdev_link_validate_default() and performs additional checks (or
implements all checks manually without calling
v4l2_subdev_link_validate_default() for very uncommon cases).

In this case, though, the sink is a video device, so
v4l2_subdev_link_validate() can't be used. I overlooked that in my
previous reply, sorry about it. As a link to a video node can only carry
a single stream, it seems that the issue here is caused by the link
being included in the media pipeline in the first place.
drivers/media/mc/mc-entity.c contains detailed debug messages that
explain how a pipeline is constructed, I would start by enabling them
and investigating what happens.

> I see mc-core.rst and v4l2-subdev.rst both talk about their own variant,
> without making it clear which should be used for a subdev.
> 
> Anyway, I'll try to dig through the framework code to understand what's
> going wrong.

-- 
Regards,

Laurent Pinchart

