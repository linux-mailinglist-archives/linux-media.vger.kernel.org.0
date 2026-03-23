Return-Path: <linux-media+bounces-56701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKmJNPIowWmbRAQAu9opvQ
	(envelope-from <linux-media+bounces-56701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:50:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56F2F1727
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CE3F3051ABC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620BB396591;
	Mon, 23 Mar 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMYneVXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13B39890A
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774266259; cv=none; b=Od5Vb63WJItNMRScAs8Id4nZ4YVMWnkIZH4HmPB+JDn0keV9xxEw1r8CbgNM6I4KBeiVh0BGgunqB/wb3P5uZ7Hf56uRdaHU3ft7ZcAd8ci3nixD3f44bZVMNHq7+spzFQC7fmXKhk5BPmtcx38SeuBcLuZJ8B5bNdN8aYP3PYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774266259; c=relaxed/simple;
	bh=XDdVRby4Ovbl1DZRNaiAp4N5Mllbos1PvjxRhyFPGWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5ypDW0V7Ev8kzEWAr9CeIz0Flg2Y+/hpfHefHr/je9prLrpNf3AsGSt3Y70HGXUp5PUQmw3NtjzmjMqi0I8lOtfhhD+AQVjigRCF4yOI412R3bNlV4ZX+u4U3DEyZAxLdDtoqXRj5dIsYA/pVqfyhYPcMoaM5hHHAEZn5iIFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMYneVXT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774266254; x=1805802254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XDdVRby4Ovbl1DZRNaiAp4N5Mllbos1PvjxRhyFPGWk=;
  b=PMYneVXTET6wv9H0pTZcd2Rl3o20dMd+9CwZCL5E2WvleybToU844KQq
   80GFXF1wlzXgeIXWQlNfOqow0LFXVBfDg7Qe9kbB0rkarD7jo83tKQfXW
   2Zbdn1XdlwRxaUzF4fgQgOkXZI6umVybpCrvD083k72jgfUFOSjd5HX3C
   04IIjRx5wtPA23Pog09OYyQrlh86oFVwpUm2Kz+/285YQW0PhlmP+BbCi
   Njn/PBupl4q3DibCRw4j7ocZLDhQMFteMBNQ4ve1o5O5CMD2CBkUTlMQl
   d/0ryNui1JjfwS4pOOUMoZICqyys+hx0mvqISjljNiNgWoPk0gN6Ygc4H
   w==;
X-CSE-ConnectionGUID: 0alsK/qGRCGlDjYzYGd5Iw==
X-CSE-MsgGUID: m2Ew7g/qQZi24K2GdxbGGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74278741"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74278741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:44:13 -0700
X-CSE-ConnectionGUID: QyRLbj/MT9icd8LjzUml0g==
X-CSE-MsgGUID: /ugb15MZR6O30mAKhSWS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219183885"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 04:44:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BAA0F120832;
	Mon, 23 Mar 2026 13:44:14 +0200 (EET)
Date: Mon, 23 Mar 2026 13:44:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <acEnjvwjW0QNu_1u@kekkonen.localdomain>
References: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
 <20260323111042.GC1514659@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323111042.GC1514659@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56701-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2A56F2F1727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Mon, Mar 23, 2026 at 01:10:42PM +0200, Laurent Pinchart wrote:
> On Mon, Mar 23, 2026 at 12:56:55PM +0200, Sakari Ailus wrote:
> > If a sub-device does not set enable_streams() and disable_streams() pad
> > ops while it sets the s_stream() video op to
> > v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
> > on the sub-device will result calling v4l2_subdev_s_stream_helper() and
> > v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> > Return -ENOIOCTLCMD in this case to handle the situation gracefully.
> 
> This is not a valid use case, right ? Can we WARN() ?

Partly yes, and partly it requires a driver bug.

The CCS driver soon will differentiate its ops for source (scaler/binner
and CSI-2 receiver) sub-device, but only pad ops, not video ops. This means
that on non-source sub-devices the s_stream pad op is set to
v4l2_subdev_s_stream_helper() while {enable,disable}_streams() pad ops are
NULL.

It also takes a bug in the camss driver to trigger this -- it enables
streaming on all sub-devices of the pipeline instead of the next upstream
sub-device. That bug should be fixed but it's a separate issue.

> 
> > Reported-by: David Heidelberg <david@ixit.cz>
> > Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Better patch description.
> > 
> >  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 831c69c958b8..f8ea4afc6cbb 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> >  
> >  	/* Fallback on .s_stream() if .enable_streams() isn't available. */
> >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
> > -
> > -	if (!use_s_stream)
> > +	if (!use_s_stream) {
> >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > -	else
> > +	} else {
> > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > +			return -ENOIOCTLCMD;
> >  		state = NULL;
> > +	}
> >  
> >  	/*
> >  	 * Verify that the requested streams exist and that they are not
> > @@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> >  
> >  	/* Fallback on .s_stream() if .disable_streams() isn't available. */
> >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
> > -
> > -	if (!use_s_stream)
> > +	if (!use_s_stream) {
> >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > -	else
> > +	} else {
> > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > +			return -ENOIOCTLCMD;
> >  		state = NULL;
> > +	}
> >  
> >  	/*
> >  	 * Verify that the requested streams exist and that they are not
> 

-- 
Regards,

Sakari Ailus

