Return-Path: <linux-media+bounces-62642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I1tHW24EGqzcwYAu9opvQ
	(envelope-from <linux-media+bounces-62642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:11:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B10EA5B9EBB
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F219D3010C24
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 20:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F2236F915;
	Fri, 22 May 2026 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iBwfqPHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A02C234A
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480621; cv=none; b=VB50O7KPtToCR6XSyCrLgpmotwyV4R+Xx/Es2zA8zEmNQqdzOHIB3jy5bR1CrZstGqECrIKDVu+lXyNOKWvXoMtLtdt7GYKwyhw+XaTncXxDt56xx11IxqYZxNLwGbe6clzGsvIsafnbDZbfb6+OwLIg/CAevwDu3UiBPpc+ipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480621; c=relaxed/simple;
	bh=EhQmK/BYecWV1E8b4V+9qxaLSle7KWLO915+SCVzZuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4fieXjCvyLCz5f77qS/ozdXBieLCLKewpSYpqq6wgrhbll0s6g3gTVaVnVCvEzfE22g5M7XZvxTt5P8mQB9bJEzVaep+mLz3Jvfh7+9SUcCq8PL71HO73IAqolIyZtNF3iWbbdL9223V2r8UnG3Ehqsb2tNVTj5whybuEQQw10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iBwfqPHQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:5c65:b7b4:ebe:1e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA5CC447;
	Fri, 22 May 2026 22:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779480592;
	bh=EhQmK/BYecWV1E8b4V+9qxaLSle7KWLO915+SCVzZuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBwfqPHQgEWGewZ13qt8fbCpE3IU8c4ttTR2pE1vJg4xgE3HsEtKENQccVyi84cDQ
	 5vzC83xAHRA5ge9QxA1/OGznWIlrMHbWzwoGfgmo93D5xzOaVtVs1bJkNdmyVIn4Az
	 FlFsLIwQPtNlKpfTMRcUiQZBbTRAZ4RNzb4aWrjI=
Date: Fri, 22 May 2026 22:10:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kevin Hilman <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Hans de Goede <hansg@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Brandon Brnich <b-brnich@ti.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Devarsh Thakkar <devarsht@ti.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, "Padhi, Beleswar" <b-padhi@ti.com>, 
	"Donadkar, Rishikesh" <r-donadkar@ti.com>, Rouven Czerwinski <rouven.czerwinski@linaro.org>, 
	Nayden Kanchev <Nayden.Kanchev@arm.com>, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Anthony McGivern <Anthony.McGivern@arm.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
Message-ID: <ahC1Ec_CA0tq3PtX@zed>
References: <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
 <20260414074230.GB4061@killaraus.ideasonboard.com>
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
 <20260414084259.GC4061@killaraus.ideasonboard.com>
 <afCmQhSbQLDb6gvo@zed>
 <77ea77b9-5503-40b2-882b-e96e30028c43@kernel.org>
 <1182ce00f1c55cf28e13e6eb4f2e018b52a8f6a8.camel@collabora.com>
 <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-1pA6v7P-ZrOD+iEGfq5Dv0CZ_CLiZ5u35tutQ6zAPqWA@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62642-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B10EA5B9EBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Loic

On Fri, May 22, 2026 at 09:49:34PM +0200, Loic Poulain wrote:
> Hi Folks,
>
> On Tue, Apr 28, 2026 at 7:55 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >
> > Le mardi 28 avril 2026 à 15:00 +0200, Hans Verkuil a écrit :
> > > On 4/28/26 14:30, Jacopo Mondi wrote:
> > > > Hello
> > > >
> > > > On Tue, Apr 14, 2026 at 11:42:59AM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Apr 14, 2026 at 10:34:13AM +0200, Loic Poulain wrote:
> > > > > > On Tue, Apr 14, 2026 at 9:42 AM Laurent Pinchart wrote:
> > > > > > > On Tue, Apr 14, 2026 at 09:20:56AM +0200, Michael Riesch wrote:
> > > > > > > > On 4/14/26 08:55, Ricardo Ribalda wrote:
> > > > > > > > > On Tue, 14 Apr 2026 at 08:47, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> > > > > > > > > > On 13/04/2026 23:16, Laurent Pinchart wrote:
> > > > > > > > > > > On Mon, Apr 13, 2026 at 04:25:54PM -0400, Nicolas Dufresne wrote:
> > > > > > > > > > > > Le lundi 13 avril 2026 à 23:19 +0300, Laurent Pinchart a écrit :
> > > > > > > > > > > > > On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> > > > > > > > > > > > > > Hi Hans,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I would be happy to discuss this if a slot is available:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Title: Generic V4L2 ISP M2M framework
> > > > > > > > > > > > > > Presenter: Loic Poulain
> > > > > > > > > > > > > > Time estimate: ~20min
> > > > > > > > > > > > > > Description: During early development of a Qualcomm Offline Image
> > > > > > > > > > > > > > Processing Engine (OPE), we relied on the V4L2 memory‑to‑memory
> > > > > > > > > > > > > > (v4l2‑m2m) framework, which is widely used and provides solid support
> > > > > > > > > > > > > > for buffer management and scheduling. However, applying it to an ISP
> > > > > > > > > > > > > > use case exposes limitations: ISP engines often require a richer media
> > > > > > > > > > > > > > graph, with multiple pads and metadata flows, similar to inline ISP
> > > > > > > > > > > > > > pipelines (params, stats, outputs). This talk proposes discussing the
> > > > > > > > > > > > > > need for and design of a common V4L2 ISP M2M framework to factor out
> > > > > > > > > > > > > > shared functionality across drivers, particularly around buffer/queue
> > > > > > > > > > > > > > management and job scheduling.
> > > > > > > >
> > > > > > > > It seems that we share some pain points.. :-) :-/
> > > > > > > >
> > > > > > > > Over the last year, some ideas have been brewing in my mind. Not
> > > > > > > > necessarily *my* ideas, mind you, rather ideas that have been around in
> > > > > > > > linux-media for quite a while, actually. What I would like to prepare
> > > > > > > > for the Media Summit goes along the same lines.
> > > > > > > >
> > > > > > > > > > > > > That's well aligned with the v4l2-isp framework that Jacopo started, and
> > > > > > > > > > > > > to the multi-context and media-jobs APIs that we have proposed. I
> > > > > > > > > > > > > wonder, however, if a short session at the media summit will be enough,
> > > > > > > > > > > > > or if we should try to organize a half day brainstorming workshop at
> > > > > > > > > > > > > some point. Depending on when the people interested in this topic plan
> > > > > > > > > > > > > to arrive, Monday could be an option.
> > > > > > > > > > > >
> > > > > > > > > > > > I'm also/still interested in the multi-context for m2m decoders that have inline
> > > > > > > > > > > > post-processing capabilities (current model forces us to waste a lot of RAM). We
> > > > > > > > > > > > just restarted some design discussion with the team, with an increased
> > > > > > > > > > > > confidence that multi-context is the way. The scheduler could come handy in the
> > > > > > > > > > > > future if we get to deal with more multi-stage codecs in the future. I'll be in
> > > > > > > > > > > > Nice all day Monday.
> > > > > > > > > > >
> > > > > > > > > > > I will unfortunately be available only until 15:00 on Monday, but Jacopo
> > > > > > > > > > > should be available through the day. Let's see who would be interested
> > > > > > > > > > > and available, and try to organize something.
> > > > > > > > > >
> > > > > > > > > > I'm available on Monday as well. I think this is a topic that is well suited
> > > > > > > > > > to a brainstorm session.
> > > > > > > > >
> > > > > > > > > I am also available on Monday and would like to attend the session.
> > > > > > > >
> > > > > > > > I'd be interested too. Right now the plan is to arrive on Monday
> > > > > > > > afternoon. Depending on what time you agree on it may work out anyway.
> > > > > > > > It would be great to know the exact time this session will start (as I
> > > > > > > > might need to adjust my travel arrangements).
> > > > > >
> > > > > > I can arrive on Monday, with a preference for the afternoon.
> > > > > >
> > > > > > > We need a volunteer to organize this, as in finding and booking a
> > > > > > > meeting space. Note that Monday is a public holiday in France (Monday
> > > > > > > the 25th of May in particular, not all Mondays).
> > > > > > >
> > > > > > > If the number of attendees was small I was thinking of hosting the event
> > > > > > > in the place where the Ideas on Board team will be staying, but it looks
> > > > > > > like we're already reaching a fair number of people.
> > > > > > >
> > > >
> > > > Are we still considering this BoF session ?
> > > >
> > > > We would someone to volunteer organizing this, at @IoB we're quite
> > > > full for the week and we might have an hard time organizing this one
> > > > on top of the libcamera workshop.
> > > >
> > > > As Laurent said, that Monday is a public holiday in France, and
> > > > getting a room somewhere might be complicated.
> > > >
> > > > We can host some people in the location where we're having the yearly IoB
> > > > get-together, but you should arrange your travel there (35 minutes
> > > > from Nice by car).
> > > >
> > > > If we get a volunteer we can should maybe a dedicated mail thread as this one
> > > > was about the Media Summit ?
> > >
> > > If the number of people can be kept low (say <= 6), then it shouldn't be a
> > > problem to just find a hotel restaurant or similar, close to the place of
> > > the media summit, and just sit together.
> > >
> > > Who would be the key people for this? And who are 'nice to have'? :-)
> > > I think I probably fit more in the latter category than the first.
> >
> > I was hoping a small number of people and a simple café/lobby too. The mass of
> > people interested in the reply arrive much later, but I'm there all day, and
> > would be more then happy to be able to brainstorm the subject a bit, which is
> > easier in small group.
>
> Is this BoF side session still planned? If there’s still interest,
> perhaps the easiest option would simply be to meet at the hotel lobby
> on Monday morning.
>

I'm around Nice like many others on Monday, but I'm not sure how this
would feel for people that didn't arrange their travels accordingly
because this event was never officially announced.


> Regards,
> Loic
>

