Return-Path: <linux-media+bounces-59297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5EKROI6Gk6LgIAu9opvQ
	(envelope-from <linux-media+bounces-59297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:34:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25403443824
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 10:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F08A93051AA3
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBA637F8BC;
	Wed, 22 Apr 2026 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtKQ7id3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82871370D5D
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846440; cv=none; b=X+r4XjP6CZJwUCjaFKO49Mvgg9n6z7RZHv/+hAW0RCup09mlh5vR8HsRgGC7Vem8an5yQy9a2zlFJKTfAFe7Gl7FHjrpckSPuGAzfp+PjGCpL8jGRR2le16Nei3gqBIaPPWVdIr/xmmtrVLbvFq+MJKBHJiUk1GOFGzwK64VA2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846440; c=relaxed/simple;
	bh=8lDpGAK+0py4sEHpJYmH5FeCuStF8lV+39n6SZVHtb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cytJVP0MvBpT6vNwzvPiIq8X3kfbWYFTOBicVnY992K3kPGO29UoA+r8+WKLkQ4qM8l3RSmIoiFX9wIt53zuaTOtmYtulimIdNXwxDppjafVArD/bF9cCQ+NvEZcvXNGSxRDvknw6BP6iO5E/dTFAbd4BX+b+ROv5ep8hAMeqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtKQ7id3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776846439; x=1808382439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8lDpGAK+0py4sEHpJYmH5FeCuStF8lV+39n6SZVHtb8=;
  b=UtKQ7id3BnXwTKqSkItRxH0qrkK0e6SstmTwR9N7OeDIVejN2jbhZKy2
   /0tQ4+iiMpLfAtJg8CpCRZ4BFpl9tMwEXekTK4od3bMpvUUli+RoyNN9O
   2E5SMs/Odtuj/D4jBtQM/LZrJJGcE5c3nzDHf1qkGNz+6JZpD4t/vkLbj
   poLFd/YXkEsRW54KHk8+ceQJNi1mOadI3y/pbhjgh8RlT6KlNT9ww3MQS
   0oN8r/nNkXyM3jXNDRnrq+tc8HhyDwydGqF/ut0LZSOI1CkztG3IyqMB8
   tLP1I84MHuDZvkeAaL+Wg/psI5e6L+sMk0gj0Zt1Ta8CIHfp2ZSy5bgjR
   g==;
X-CSE-ConnectionGUID: XiT/1N8sQaaIzwbOZ0xZfg==
X-CSE-MsgGUID: mceBXfLkT52o3EiKWVcw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88869638"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88869638"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:27:19 -0700
X-CSE-ConnectionGUID: MeVQhNuJSN6/3mZgRlJtOw==
X-CSE-MsgGUID: 0Pcsqm4EQfSmf8jEAcsrhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="225802970"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:26:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 038E5120D05;
	Wed, 22 Apr 2026 11:26:57 +0300 (EEST)
Date: Wed, 22 Apr 2026 11:26:56 +0300
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
Message-ID: <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
 <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
 <20260421221817.GF2315844@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421221817.GF2315844@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59297-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25403443824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Wed, Apr 22, 2026 at 01:18:17AM +0300, Laurent Pinchart wrote:
> > > > > > +static int get_mipi_dt_for_mbus(u32 code)
> > > 
> > > v4l2_subdev_get_mipi_dt_for_mbus()
> > > 
> > > Or move the function to v4l2-common.c, name it mipi_csi2_dt_for_mbus()
> > > and declare it in include/media/mipi-csi2.h.
> > 
> > How about calling it mipi_csi2_dt_for_mbus()? I think it can be located in
> > v4l2-common.c for now, no need to add a separate file just for this; all
> > users would effectively be related to V4L2 anyway.
> 
> Yes, that's what I proposed :-)

Well, that's good then. :-)

...

> > > > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > > > +{
> > > > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > > +		.pad = pad,
> > > > > > +	};
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > > > +		unsigned int type = desc->type;
> > > > > > +
> > > > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > > > +
> > > > > > +		if (desc->type != type)
> > > > > > +			return -EINVAL;
> > > 
> > > I'd add a dev_err() here. There are .get_frame_desc() callers that check
> > > if the returned type matches what they expect and log an error
> > > otherwise. When using this helper the check can't be performed in the
> > > callera any more, leading to possibly hard to debug issues if no message
> > > is printed.
> > 
> > dev_err_once()?
> 
> Is there a need to limit it to printing the message once only ? It will
> only occur if an incompatible source is connected, which shouldn't
> happen in normal circumstances.

Yes, but still enables filling logs with that message. A single one in this
case should be enough.

-- 
Regards,

Sakari Ailus

