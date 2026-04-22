Return-Path: <linux-media+bounces-59307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAPlAoGo6GnEOQIAu9opvQ
	(envelope-from <linux-media+bounces-59307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:52:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFC444FD3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7E82302F0F2
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2063CD8CA;
	Wed, 22 Apr 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bsjvn1Fi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E216372EC0
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854948; cv=none; b=Rci/JDVSzcyE/eniYG7dII6aVBljwreXUtM7rm9LGPuzCsdpxg6aBsFihL10m1PNnzwn2X+0dP4HXmJ8HwILnz7EekbWkUOhA3MqLB5lssac1J3Ob1r2ASRHuKhYIyx5qfAaB/NS1RXj8UyTeCcO4RsB6XcCNNhzzSnSr3ziFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854948; c=relaxed/simple;
	bh=S+qysDVdDLBoJuoH9hptyzcPpNAJxVbS4ii8q2v6OFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmoEjrg+HUK8tWSefjhsfYjyDLs5rRF9f9Zxd6jjxejXc1LdSHSpniWYL2oevAmjpYe/kYDuzJqBLnVxgP+NSymoNdA+2J2X3flefUK6wBbjp/te3dNWNtAFgdibS7BWBOyCbTemokNdemA7ix4kK0bsTaoE2mtNqe6sP/qGux8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bsjvn1Fi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776854947; x=1808390947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S+qysDVdDLBoJuoH9hptyzcPpNAJxVbS4ii8q2v6OFk=;
  b=Bsjvn1FixEyfHVqvIUAa9AASfplYeS6e8WgeMCH/rc8Uxu9/38Fe68Oc
   tOhdoKgoAWHoxntHplVmux+gO4s6feHhxdYaI7uDHLFGp4kwfI7sm+d+9
   0Cogqu0NOW8OzeUiEozXghlAJ9V7N+m6RTQlzkz8C3L2zTJ/NIjyLlvhc
   bitb47Tb1wvhlSXVG3r8rAbNb/eQA1FkP60SCTKk1ByMrjM1GFjiMzowp
   dd8jpJZfDZ3NO5je17myqe5j44H7nywNzFhpJTIlTdGztqrjY+0pi3n3C
   H86JG3VljEytg9036lAWwo3svHju1o1m00bdVXRp7ZuvKBZvJAF63AypK
   w==;
X-CSE-ConnectionGUID: 8hvbhrpdR2muYFkCmywjEA==
X-CSE-MsgGUID: n7yENSI8Su2w4HViTph2Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="103264088"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="103264088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:49:06 -0700
X-CSE-ConnectionGUID: g5P2hfo+R3KBRNrQsTg51w==
X-CSE-MsgGUID: 3uzvWn+gRbGv/Vrxn6s1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="270427200"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:48:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 79898120D05;
	Wed, 22 Apr 2026 13:48:58 +0300 (EEST)
Date: Wed, 22 Apr 2026 13:48:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 24/29] media: v4l2-subdev: Introduce
 v4l2_subdev_get_frame_desc()
Message-ID: <aeinmhXvBnVMvpQS@kekkonen.localdomain>
References: <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
 <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
 <20260421221817.GF2315844@killaraus.ideasonboard.com>
 <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
 <20260422090256.GA2807981@killaraus.ideasonboard.com>
 <aeicuM9S6_x1zNpb@kekkonen.localdomain>
 <20260422104729.GG2315844@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422104729.GG2315844@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59307-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 20AFC444FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 01:47:29PM +0300, Laurent Pinchart wrote:
> On Wed, Apr 22, 2026 at 01:02:32PM +0300, Sakari Ailus wrote:
> > On Wed, Apr 22, 2026 at 12:02:56PM +0300, Laurent Pinchart wrote:
> > > > > > > > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > > > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > > > > > > > +{
> > > > > > > > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > > > > > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > > > > > > +		.pad = pad,
> > > > > > > > > > +	};
> > > > > > > > > > +	int ret;
> > > > > > > > > > +
> > > > > > > > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > > > > > > > +		unsigned int type = desc->type;
> > > > > > > > > > +
> > > > > > > > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > > > > > > > +
> > > > > > > > > > +		if (desc->type != type)
> > > > > > > > > > +			return -EINVAL;
> > > > > > > 
> > > > > > > I'd add a dev_err() here. There are .get_frame_desc() callers that check
> > > > > > > if the returned type matches what they expect and log an error
> > > > > > > otherwise. When using this helper the check can't be performed in the
> > > > > > > callera any more, leading to possibly hard to debug issues if no message
> > > > > > > is printed.
> > > > > > 
> > > > > > dev_err_once()?
> > > > > 
> > > > > Is there a need to limit it to printing the message once only ? It will
> > > > > only occur if an incompatible source is connected, which shouldn't
> > > > > happen in normal circumstances.
> > > > 
> > > > Yes, but still enables filling logs with that message. A single one in this
> > > > case should be enough.
> > > 
> > > Is it user-triggerable without a serious bug in drivers ?
> > 
> > No. But one message still tells about the problem, doesn't it?
> 
> Yes, but it then means a reboot is necessary during development every
> time this error occurs. It also means that if two errors originate from
> different callers only one message will be printed, which is also not
> optimal for development.
> 
> If this error was triggerable by userspace in normal circumstances then
> I'd still avoid _once() but go for dev_dbg().

Presumably anyone debugging this would have dynamic debug enabled here.

So dev_dbg()?

-- 
Sakari Ailus

