Return-Path: <linux-media+bounces-62285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGu2CbixDWpy1gUAu9opvQ
	(envelope-from <linux-media+bounces-62285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:06:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2D58E747
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EACD308A51A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B593DA5A5;
	Wed, 20 May 2026 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHkczzTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B535200C2
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281954; cv=none; b=tjzbmX8R4FKPxVtv5rguPzfktK+WjwPtUzT2fuq9PSyd73zy8+tXnwaikJT72vCOwRsqxVYGHj9t8RSkzdUQnIvY1XflIkSGPEmh85L9ejj525QiwgclsOyORksUfp/j6s9LHdre/c7vTpLlLCAHfK68FDki8ZkkT1qRyZvnrgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281954; c=relaxed/simple;
	bh=CM+6YijgNdslLgZNy1ZZWA1pEweNTF8aqgr81G152zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGvF159c4w4lXpzKnjXP16ahdBNHUFTJBSl1SyeJ2+Xun7CLrBlF7BqdxkWSNkOZeumhOch2Ks18i9JMFbbeguPe4/f2YNVMu24iSYZR8xDRTuOuVkpXDwKURvNUxRXySmxUuGpJWUP03eet2RJBbKOgAXFZFVJp51SY3F4kdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHkczzTy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779281953; x=1810817953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CM+6YijgNdslLgZNy1ZZWA1pEweNTF8aqgr81G152zw=;
  b=MHkczzTyCUnH1kvXPAapnsfTnOsKON1Jl/f4Rsq7vb6sV18sYNdc+4kD
   Mvy308L2dhoosXo30nm5IpPM+N5TuVgEcEuLpn8gxhy7obQZwpm4odaoD
   QLDkGYA6Y/6WfHOxDVJmC01WWL/eqbi6BUhn2t1SU946GkqZl3U70AK2G
   ug9ugRsByeNVseKtysZfks/aqVlrxHDxdABV7TGKpuH2lpCoRLDtiAbQf
   oTV1ZcCrapDMOKhSSiclGwk8U+6MrD9FNrPqUFltPAWf7wPD6n1eH2wE9
   9CGxmX2RbvB9xKT1Ze2O1AT25sE5EGGuQVBvWrECAjIHHNCcOxeRlPqjn
   g==;
X-CSE-ConnectionGUID: z33YPv2pTPSOPy7iEz6XgQ==
X-CSE-MsgGUID: GOYsnmSxSiiehBQGP3XPyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97748351"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="97748351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:59:13 -0700
X-CSE-ConnectionGUID: 8ySoU1EOQyubPmIepEJInw==
X-CSE-MsgGUID: DmMvLekJSuyWFnkLZk/i2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="237573009"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 05:59:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50B5011F851;
	Wed, 20 May 2026 15:59:08 +0300 (EEST)
Date: Wed, 20 May 2026 15:59:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 07/17] media: v4l2-subdev: Return dynamically
 allocated pass-through routes
Message-ID: <ag2wHOxGJhPTAoel@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-8-sakari.ailus@linux.intel.com>
 <agzlHYL_H4Qv9u3u@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agzlHYL_H4Qv9u3u@lizhi-Precision-Tower-5810>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62285-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 90F2D58E747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On Tue, May 19, 2026 at 06:33:01PM -0400, Frank Li wrote:
> On Mon, May 18, 2026 at 07:43:07PM +0300, Sakari Ailus wrote:
> > Count the number of pass-through routes and then return the full table
> > once enough memory is available for it.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ebcc0b40fac1..b5eef0baa237 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2653,20 +2653,22 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  				return -EPIPE;
> >  			}
> >
> > -			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> > +			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
> >  				dev_dbg(dev, "Frame desc entry limit reached\n");
> >  				return -E2BIG;
> >  			}
> >
> > -			fd->entry[fd->num_entries] = *source_entry;
> > -
> > -			fd->entry[fd->num_entries].stream = route->source_stream;
> > +			if (fd->num_entries < fd->len_entries) {
> 
> Peasonally, I prefer use an explicit method to get total entries number
> instead of mix these.

That might be a little cleaner but seemed overkill to me while implementing
this. I wonder what others think.

> 
> we can use the get_frame_desc(), but use fd->entry == NULL means get
> total entries number.

The existing implementations expect the entry field is valid.

> 
> bad thing is that always call twice compared to current method.

-- 
Regards,

Sakari Ailus

