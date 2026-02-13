Return-Path: <linux-media+bounces-52773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMSCCaFcj2mSQgEAu9opvQ
	(envelope-from <linux-media+bounces-52773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:17:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF713890C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 969E930293FC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 17:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B1F2080C1;
	Fri, 13 Feb 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMefoDO9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4970324B30
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002995; cv=none; b=s5GioPtFbrVL/sv1oN/U3flwrxQlPsysNqMajRHwktiFG5Lp2JMBiCqtgZ9AncccjFIC7UoSAgW6/KdIePF3aljZWM+RITqx2w3K3pZdOd00MOnAqDZ8rVLyDYyCJnPMeey0ycS6GoYSoyYDYDBMdOVtkamTlpGlC8oh58C3rRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002995; c=relaxed/simple;
	bh=zU+qwuYTdHZN1X9fQja2IZA9K0m2lC2TSBITDAxymt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAvbhwiWNc/aPSOAsI8gmGq2nLPMoZY4grFAAk3bNzkwdvcMNIl04MbWF0BWIGgzDswApf7D+E6XT8ejEzQP1qmpZA9etOxEjajk+7sYuxcuY3hrasuPmKbaELNTD7oEcXJvtXl1OTUZt9aE1QI/CCvgZ+lR2bcm8/GDoFR5+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMefoDO9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771002994; x=1802538994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zU+qwuYTdHZN1X9fQja2IZA9K0m2lC2TSBITDAxymt4=;
  b=ZMefoDO96vqdooOoHbB9N3ADBrzlyWkcIJ15IhJSF8JqM6/2vPbN6jGE
   pGPztuIkf88oZol5mJ5nJbLfE7UfQ/punVPnT7vrFgW4nmyXvGaXkrTYe
   Jgtrr4vLG30pWY1Lsr481qaCD1OdOSQym3t9emYIAE9Tc+WpEDYNt4D8/
   MGt/ULm2I+bWD9OT3izD7iy/v37vWbAdXAOwKuxh7kDRIB/4ffA9nf9A3
   YF8xPbmZsfOyKkYAhUsELpHiWzwIbSrPsPAaTHxOBtQk7AJCkeaIGCq1i
   8I7ajeyASbluHxE1ipbHbpbLBc3vhSWS2135cKXmwTfPrBBr6IHN9gu2k
   w==;
X-CSE-ConnectionGUID: BB8M/7auR6m63vUyNLxoUQ==
X-CSE-MsgGUID: GrZjXj2uSJOCe01NpMq59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72095395"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="72095395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:16:33 -0800
X-CSE-ConnectionGUID: ekrD+Q7PSAOoz7seujQSYw==
X-CSE-MsgGUID: qfSDYqVCS9OJOUeD+ssziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="235951259"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.102])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:16:27 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EF0261205A4;
	Fri, 13 Feb 2026 19:16:44 +0200 (EET)
Date: Fri, 13 Feb 2026 19:16:44 +0200
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
Message-ID: <aY9cfEGnI0MQxH_x@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <aY8sq-UoKFaMNRM-@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY8sq-UoKFaMNRM-@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52773-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FEF713890C
X-Rspamd-Action: no action

Hi Jacopo,

Thank you for reviewing this!

On Fri, Feb 13, 2026 at 03:36:43PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Feb 11, 2026 at 11:09:06AM +0200, Sakari Ailus wrote:
> > Hi folks,
> >
> > This smallish set contains patches that prepare for merging the metadata
> > series.
> >
> > There are simple cleanups but also two noteworthy changes: the addition of
> > the VALIDATE_LATE media link flag and the addition of the new struct
> > v4l2_subdev_client_info struct to the get_fmt, set_fmt, get_selection and
> > set_selection pad operation arguments.
> >
> > The VALIDATE_LATE allows using the link_validate callback as the way to
> > validate the links connected to the sink pads of video nodes on pipelines
> > with multiple capture video nodes. Without this flag, the entire pipeline
> > will be validated at the time of the first streamon, with the V4L2 pixel
> > (or other) format set on the other capture video nodes at the time,
> > requiring all formats to be set before starting streaming anywhere. But
> > this does generally not match with what the userspace would do, hence the
> 
> What would userspace do instead ?
> 
> Is there a use case for formats not being known at pipeline start time ?

Yes. Try capturing from two video nodes with e.g. yavta.

I recall the vsp driver does link validation as part of the streamon
operation without involving the link_validate callback for this reason.

> 
> Is the userspace expected to enable all links with the VALIDATE_LATE
> flags ?

It's not supposed to be a user-settable flag. The purpose is really to
allow the framework to do the job it's supposed to.

> 
>         for_each_video_node() {
>                 set_format()
>                 clear_validate_late();
>                 vidioc_streamon()
>         }
> 
> As I understand it, the use case is solely delay setting the format on
> the video device and its sink pads ?

Correct.

> 
> > new flag. The patches in the upcoming metadata series version adds the
> > support for the flag to the IPU6 driver.
> >
> > Secondly, the new struct v4l2_subdev_client_info enables passing around
> > file handler specific client capability information, which is used to
> > differentiate UAPI between existing users and those that are aware of the
> > new common raw sensor model. This is effectively required if we want to
> > add support for the new model to existing raw sensor drivers: the new
> > model is in a direct conflict with how things worked before the model.
> 
> Can you elaborate a little on why a per-ioctl flag is required ?
> Doesn't this open the door to possible mixups ?
> 
> I fail to see what the advantage is over per-subdev_fh client
> capabilities.

It's a per-file handle flag, but the sub-device IOCTL handlers currently
don't take the file handle (or information related to it) as an argument.
Therefore this needs to be added to the relevant ops -- it could also be
all pad ops; it would be possible to avoid adding new functions that take
client_info pointer and work on the active state (see the third-last
patch).

> 
> > There still needs to be a single driver internal state, the different
> > UAPIs simply offer a different view to that state. In-kernel users that do
> > not deal with capabilities just use NULL when calling these ops. This also
> > means that whatever client capabilities are being used, there may not be a
> > change to inter-driver interfaces such as get_fmt() when dealing with
> > external pads.
> 
> Do we expect drivers that still use in-kernel operation calls to be
> ported to use streams ?

Those that benefit from it can be ported. But interoperability is good
between those that use streams than those that don't so there's no hurry.

> 
> I'll review the rest of the series in the meantime.

Thank you. I'm down to ~ 80 patches once these are merged.

-- 
Kind regards,

Sakari Ailus

