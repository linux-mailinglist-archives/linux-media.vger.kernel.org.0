Return-Path: <linux-media+bounces-52862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NAMKhcGk2nF0wEAu9opvQ
	(envelope-from <linux-media+bounces-52862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:57:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C22231432D0
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A403014111
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9064306B3B;
	Mon, 16 Feb 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EGYXM8j+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FD7303CB6
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243018; cv=none; b=IMtBAQVsR7udx1WjWVJWuT79BaAkeYnd5WE9DfDNR8nEn2Eq2FTUTGVqdO+FbHSGo3WGJjQm3OGa4gtdhY/rMjnBIhOQdZGeYatn3paSKpY2eCaCKyigE5FMmS6JS+7XtC/fZHvBAC9ISaI27ViYFF0VaUqks4h6RaTPS58zOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243018; c=relaxed/simple;
	bh=6yq4ptaVinD63+xNUaLkXSkKixBBFyv6NVdiqpWkVSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCSxs1qtd+GFLCBh0hvdlvLJ/FpNOlahiX3o/GemcbYE1y/LdhrQ2bey36bxIGnNAckmfXCoJPsYuhvDXlHZ4sSBYw1NmXkt+y5meHnPeGB9u1Os4/tbp3hnHSos5afB5jJSVaYiFLQEi2gzZ4woa1M1DQqZf+3zImODltRjX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EGYXM8j+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9EACDA8;
	Mon, 16 Feb 2026 12:56:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771242961;
	bh=6yq4ptaVinD63+xNUaLkXSkKixBBFyv6NVdiqpWkVSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGYXM8j+Iog83Q3rZBIWvI0X5Rda3nB3Iz2iTzc5VIcvX839SvJq4lVBABSdKNzko
	 kg+U2jKNaWTWeWN7iDpXZIlHJZEEqtQ7BjRd3C4QpsO3EQ6E4B6ay6t3Wks0L2xv7v
	 CqA5puDa4AXajHnjWvANY684NMtuGnwiIHNjgCuo=
Date: Mon, 16 Feb 2026 12:56:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 00/14] Metadata series preparation
Message-ID: <aZL9v-GhEcdwrvHw@zed>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <aY8sq-UoKFaMNRM-@zed>
 <aY9cfEGnI0MQxH_x@kekkonen.localdomain>
 <aZLXdfGKn9XNscnd@zed>
 <aZL9LTzRgbDngtOA@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZL9LTzRgbDngtOA@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52862-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C22231432D0
X-Rspamd-Action: no action

Hi Sakari

On Mon, Feb 16, 2026 at 01:19:09PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Feb 16, 2026 at 09:50:32AM +0100, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Fri, Feb 13, 2026 at 07:16:44PM +0200, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for reviewing this!
> > >
> > > On Fri, Feb 13, 2026 at 03:36:43PM +0100, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Wed, Feb 11, 2026 at 11:09:06AM +0200, Sakari Ailus wrote:
> > > > > Hi folks,
> > > > >
> > > > > This smallish set contains patches that prepare for merging the metadata
> > > > > series.
> > > > >
> > > > > There are simple cleanups but also two noteworthy changes: the addition of
> > > > > the VALIDATE_LATE media link flag and the addition of the new struct
> > > > > v4l2_subdev_client_info struct to the get_fmt, set_fmt, get_selection and
> > > > > set_selection pad operation arguments.
> > > > >
> > > > > The VALIDATE_LATE allows using the link_validate callback as the way to
> > > > > validate the links connected to the sink pads of video nodes on pipelines
> > > > > with multiple capture video nodes. Without this flag, the entire pipeline
> > > > > will be validated at the time of the first streamon, with the V4L2 pixel
> > > > > (or other) format set on the other capture video nodes at the time,
> > > > > requiring all formats to be set before starting streaming anywhere. But
> > > > > this does generally not match with what the userspace would do, hence the
> > > >
> > > > What would userspace do instead ?
> > > >
> > > > Is there a use case for formats not being known at pipeline start time ?
> > >
> > > Yes. Try capturing from two video nodes with e.g. yavta.
> > >
> >
> > maybe yavta is not the right tool to handle streaming on a complex
> > platform, or should at least be modified to delay start stream after
> > all formats are set up.
> >
> > Anyway..
> >
> > > I recall the vsp driver does link validation as part of the streamon
> > > operation without involving the link_validate callback for this reason.
> > >
> > > >
> > > > Is the userspace expected to enable all links with the VALIDATE_LATE
> > > > flags ?
> > >
> > > It's not supposed to be a user-settable flag. The purpose is really to
> > > allow the framework to do the job it's supposed to.
> > >
> >
> > This doesn't explain me nothing.
> >
> > The only documentation patch for this in
> > [PATCH v2 07/14] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
> >
> > just reports:
> >
> > +The ``VALIDATE_LATE`` flag is used to signal that the validation of the link may
> > +be delayed until actual hardware operation even if the rest of the pipeline
> > +would be validated at an earlier point of time.
> >
> > in Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> >
> > Have I missed any other part of the documentation maybe ?
> >
> > How are drivers supposed to use it ? Create links to multiplexed
> > subdevs with this flag ?
> >
> > Again, if the problem is a userspace tool not setting up all formats
> > before calling s_stream, a driver flag to accommodate it doesn't seem
> > right.
>
> As I noted earlier, today drivers implement link validation without using
> the callback. With the flag some of the job can be done by the framework
> and also the userspace will be aware of the arrangement.
>
> I'd think all drivers supporting multiple streams should use the flag on
> video nodes.
>
> I'll improve this for v3 to describe this flag is driver-set.
>
> >
> > > >
> > > >         for_each_video_node() {
> > > >                 set_format()
> > > >                 clear_validate_late();
> > > >                 vidioc_streamon()
> > > >         }
> > > >
> > > > As I understand it, the use case is solely delay setting the format on
> > > > the video device and its sink pads ?
> > >
> > > Correct.
> > >
> >
> > Still not sure why we should allow that.
> >
> > I'll ask-again:
> >
> >  Is there a use case for formats not being known at pipeline start time ?
>
> Existing user space and general clumsiness in having to set the format
> beforehand, especially with test programs, when there is no technical need
> to do so.
>

I'm still not 100% on board with this, sorry.

If the flag is meant to be set by drivers on all media links that
connect them to a multiplexed source, then the framework could as well
do that by inspecting the number of streams on the source subdev ?

> >
> > > >
> > > > > new flag. The patches in the upcoming metadata series version adds the
> > > > > support for the flag to the IPU6 driver.
> > > > >
> > > > > Secondly, the new struct v4l2_subdev_client_info enables passing around
> > > > > file handler specific client capability information, which is used to
> > > > > differentiate UAPI between existing users and those that are aware of the
> > > > > new common raw sensor model. This is effectively required if we want to
> > > > > add support for the new model to existing raw sensor drivers: the new
> > > > > model is in a direct conflict with how things worked before the model.
> > > >
> > > > Can you elaborate a little on why a per-ioctl flag is required ?
> > > > Doesn't this open the door to possible mixups ?
> > > >
> > > > I fail to see what the advantage is over per-subdev_fh client
> > > > capabilities.
> > >
> > > It's a per-file handle flag, but the sub-device IOCTL handlers currently
> > > don't take the file handle (or information related to it) as an argument.
> >
> > Could you elaborate on the reason why the flag should be an operation
> > argument an not a per-file handle setting ?
>
> It is a per-file handle flag.
>

I initially thought this was a setting coming from userspace on a
per-ioctl base, which made no sense to me.

Now that I've groked
[PATCH v2 11/14] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops

I understand the intention is to pass to the ioctl handlers the subdev
capabilities.

However

We have a state passed to every ioctl operation already, and states
are associated to the file handles already.

Wouldn't it be easier to copy the caps flag to the state before
calling the ioctl handler instead of adding a new argument to all
ioctl handlers in the subsystem ?

Are there reasons I've missed why you consider this not possible ?


> >
> > > Therefore this needs to be added to the relevant ops -- it could also be
> > > all pad ops; it would be possible to avoid adding new functions that take
> > > client_info pointer and work on the active state (see the third-last
> > > patch).

Ah, exactly.

What did you prevent you from doing this ?

> > >
> > > >
> > > > > There still needs to be a single driver internal state, the different
> > > > > UAPIs simply offer a different view to that state. In-kernel users that do
> > > > > not deal with capabilities just use NULL when calling these ops. This also
> > > > > means that whatever client capabilities are being used, there may not be a
> > > > > change to inter-driver interfaces such as get_fmt() when dealing with
> > > > > external pads.
> > > >
> > > > Do we expect drivers that still use in-kernel operation calls to be
> > > > ported to use streams ?
> > >
> > > Those that benefit from it can be ported. But interoperability is good
> > > between those that use streams than those that don't so there's no hurry.
> > >
> > > >
> > > > I'll review the rest of the series in the meantime.
> > >
> > > Thank you. I'm down to ~ 80 patches once these are merged.
> > >
> >
> > I really hoped we could have landed the 66 patch series to start
> > building on it
>
> I'm also for merging it as soon as possible but it needs to be complete
> before that. There were missing bits in the previous version, in particular
> related to the common raw sensor model, for which I'm adding support to the
> imx219 driver.
>
> I also understand Laurent would like to see libcamera to support it before
> merging it to the kernel and I don't really disagree with that.
>

libcamera has added support for it 2 (or maybe 3) years ago. For a
version of this API that is now outdated, and now we suffer from the
fact we need a different flag to signal STREAM capabilities to
userspace otherwise libcamera will break on new platforms implementing
the model right.

So we would need to 'freeze' this version somehow without merging it,
give libcamera time to implement support properly and merge both
implementations together ??

> --
> Kind regards,
>
> Sakari Ailus

