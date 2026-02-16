Return-Path: <linux-media+bounces-52861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PilKSf9kmkn0wEAu9opvQ
	(envelope-from <linux-media+bounces-52861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:19:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03191142CAC
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F90300FEE4
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444B2D4816;
	Mon, 16 Feb 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H89WvLkV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FB3EBF24
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240736; cv=none; b=MG8WF+pk0gVGDB4zlovth8+Wb4gNAEp2dKLQZbrefG2bsudMwTENDPqrYRaZyHEe3pIDATulfz/0CBnjRPpikWgXTfrqkWN2DqEyxylxMvaQII9j4jsVSNQkAC7jUKJMcEXqMoVui1dKloj6w2tBNmMdcI+uFUWyuYujo8yHaB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240736; c=relaxed/simple;
	bh=KgoSjw5yHljbw4a8U5YSkkXfs1CDC2UuSgJFsgfj02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqcfsOEhtaO1vXq/tQ//GuvmVcJ4DgBrrybzjrHIWL6j1MA8UHOnohJDJDnKPfBe4fxyfKP/uTOjOq9IQn04CYzgQkXYK69l8+t2izulcrugKx5gc4ZVwzjwWRRXca2DxHsw5poUTHJkv/asJgyyJiCtKtMkphAH48bksJZ1gGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H89WvLkV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771240735; x=1802776735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KgoSjw5yHljbw4a8U5YSkkXfs1CDC2UuSgJFsgfj02Y=;
  b=H89WvLkVm6D9tiQcdat8hpdMb05O8YJt733gaZhNL3Bg6UywOmWoOLfk
   sxtX+Dx4i6Eh9xzU4Z7IjOLL5FbNAC9pwUheH5nREQuIlkFBBPdEDWGyg
   rIiLwv5tWvx7LoxM6eUmtP0qIIhPpnKwOa0AWkWJSCzzxoZMog+qoUsHD
   or0d9uvUUoQ7eYV8AWtePlk9M29dBdRKUfpFdD18fvbIgJYE/40A6noS5
   IKGHGTH0Q9QVxZLPzWP0CyJPGY05avUANoz3T7b3u/cN7Tnh70HkM4SZh
   sU/PUhEkWnh7Uy41cXhfg8Y7SRyRxao0PKSeTTyA3Jg9YCgXLPs+BgwB2
   Q==;
X-CSE-ConnectionGUID: WcAQbGFpT/6c0Wmpmc4JaQ==
X-CSE-MsgGUID: cZ0T8YgITfyDLPa3tQb9Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="76171889"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="76171889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:18:55 -0800
X-CSE-ConnectionGUID: RI0M6XpTTKyz12NQXSQOFA==
X-CSE-MsgGUID: bjFkNAiKQIeRxe4Wm5jdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="236591408"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:18:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1A125121D2E;
	Mon, 16 Feb 2026 13:19:09 +0200 (EET)
Date: Mon, 16 Feb 2026 13:19:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 00/14] Metadata series preparation
Message-ID: <aZL9LTzRgbDngtOA@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <aY8sq-UoKFaMNRM-@zed>
 <aY9cfEGnI0MQxH_x@kekkonen.localdomain>
 <aZLXdfGKn9XNscnd@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZLXdfGKn9XNscnd@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52861-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 03191142CAC
X-Rspamd-Action: no action

Hi Jacopo,

On Mon, Feb 16, 2026 at 09:50:32AM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Feb 13, 2026 at 07:16:44PM +0200, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > Thank you for reviewing this!
> >
> > On Fri, Feb 13, 2026 at 03:36:43PM +0100, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Wed, Feb 11, 2026 at 11:09:06AM +0200, Sakari Ailus wrote:
> > > > Hi folks,
> > > >
> > > > This smallish set contains patches that prepare for merging the metadata
> > > > series.
> > > >
> > > > There are simple cleanups but also two noteworthy changes: the addition of
> > > > the VALIDATE_LATE media link flag and the addition of the new struct
> > > > v4l2_subdev_client_info struct to the get_fmt, set_fmt, get_selection and
> > > > set_selection pad operation arguments.
> > > >
> > > > The VALIDATE_LATE allows using the link_validate callback as the way to
> > > > validate the links connected to the sink pads of video nodes on pipelines
> > > > with multiple capture video nodes. Without this flag, the entire pipeline
> > > > will be validated at the time of the first streamon, with the V4L2 pixel
> > > > (or other) format set on the other capture video nodes at the time,
> > > > requiring all formats to be set before starting streaming anywhere. But
> > > > this does generally not match with what the userspace would do, hence the
> > >
> > > What would userspace do instead ?
> > >
> > > Is there a use case for formats not being known at pipeline start time ?
> >
> > Yes. Try capturing from two video nodes with e.g. yavta.
> >
> 
> maybe yavta is not the right tool to handle streaming on a complex
> platform, or should at least be modified to delay start stream after
> all formats are set up.
> 
> Anyway..
> 
> > I recall the vsp driver does link validation as part of the streamon
> > operation without involving the link_validate callback for this reason.
> >
> > >
> > > Is the userspace expected to enable all links with the VALIDATE_LATE
> > > flags ?
> >
> > It's not supposed to be a user-settable flag. The purpose is really to
> > allow the framework to do the job it's supposed to.
> >
> 
> This doesn't explain me nothing.
> 
> The only documentation patch for this in
> [PATCH v2 07/14] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
> 
> just reports:
> 
> +The ``VALIDATE_LATE`` flag is used to signal that the validation of the link may
> +be delayed until actual hardware operation even if the rest of the pipeline
> +would be validated at an earlier point of time.
> 
> in Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
> 
> Have I missed any other part of the documentation maybe ?
> 
> How are drivers supposed to use it ? Create links to multiplexed
> subdevs with this flag ?
> 
> Again, if the problem is a userspace tool not setting up all formats
> before calling s_stream, a driver flag to accommodate it doesn't seem
> right.

As I noted earlier, today drivers implement link validation without using
the callback. With the flag some of the job can be done by the framework
and also the userspace will be aware of the arrangement.

I'd think all drivers supporting multiple streams should use the flag on
video nodes.

I'll improve this for v3 to describe this flag is driver-set.

> 
> > >
> > >         for_each_video_node() {
> > >                 set_format()
> > >                 clear_validate_late();
> > >                 vidioc_streamon()
> > >         }
> > >
> > > As I understand it, the use case is solely delay setting the format on
> > > the video device and its sink pads ?
> >
> > Correct.
> >
> 
> Still not sure why we should allow that.
> 
> I'll ask-again:
> 
>  Is there a use case for formats not being known at pipeline start time ?

Existing user space and general clumsiness in having to set the format
beforehand, especially with test programs, when there is no technical need
to do so.

> 
> > >
> > > > new flag. The patches in the upcoming metadata series version adds the
> > > > support for the flag to the IPU6 driver.
> > > >
> > > > Secondly, the new struct v4l2_subdev_client_info enables passing around
> > > > file handler specific client capability information, which is used to
> > > > differentiate UAPI between existing users and those that are aware of the
> > > > new common raw sensor model. This is effectively required if we want to
> > > > add support for the new model to existing raw sensor drivers: the new
> > > > model is in a direct conflict with how things worked before the model.
> > >
> > > Can you elaborate a little on why a per-ioctl flag is required ?
> > > Doesn't this open the door to possible mixups ?
> > >
> > > I fail to see what the advantage is over per-subdev_fh client
> > > capabilities.
> >
> > It's a per-file handle flag, but the sub-device IOCTL handlers currently
> > don't take the file handle (or information related to it) as an argument.
> 
> Could you elaborate on the reason why the flag should be an operation
> argument an not a per-file handle setting ?

It is a per-file handle flag.

> 
> > Therefore this needs to be added to the relevant ops -- it could also be
> > all pad ops; it would be possible to avoid adding new functions that take
> > client_info pointer and work on the active state (see the third-last
> > patch).
> >
> > >
> > > > There still needs to be a single driver internal state, the different
> > > > UAPIs simply offer a different view to that state. In-kernel users that do
> > > > not deal with capabilities just use NULL when calling these ops. This also
> > > > means that whatever client capabilities are being used, there may not be a
> > > > change to inter-driver interfaces such as get_fmt() when dealing with
> > > > external pads.
> > >
> > > Do we expect drivers that still use in-kernel operation calls to be
> > > ported to use streams ?
> >
> > Those that benefit from it can be ported. But interoperability is good
> > between those that use streams than those that don't so there's no hurry.
> >
> > >
> > > I'll review the rest of the series in the meantime.
> >
> > Thank you. I'm down to ~ 80 patches once these are merged.
> >
> 
> I really hoped we could have landed the 66 patch series to start
> building on it

I'm also for merging it as soon as possible but it needs to be complete
before that. There were missing bits in the previous version, in particular
related to the common raw sensor model, for which I'm adding support to the
imx219 driver.

I also understand Laurent would like to see libcamera to support it before
merging it to the kernel and I don't really disagree with that.

-- 
Kind regards,

Sakari Ailus

