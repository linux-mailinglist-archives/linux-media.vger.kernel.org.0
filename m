Return-Path: <linux-media+bounces-36064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A6AEAEBC
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 08:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499293ACAFF
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 06:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040BD1E3DF2;
	Fri, 27 Jun 2025 06:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPbMN4uK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581EE2A8D0
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004582; cv=none; b=puLHyeVlyqGLrgbPuPt+JfJX0E+C2HFnauyZW0yxhnWAz9CN3joODBS9RzKlsiqsWL9nJy3CRrlWzZvIDpZSVkzXTVTIYSHh4yelL/hiz2O8KwwDuEUzZ1p+tnpHdDTkh3o0LhJGJG2QFunydolGn8G6XiphIW4yuJHCeYOG1P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004582; c=relaxed/simple;
	bh=svKY+S2D0HtkWWikWXgzFmDBjV4W/T0LQlP9p/0liFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA3vfHIq1qCyIv19zzr9dZinTLa1ejINVwexX15u2Amch+1zNw6QKw1f4l5o61MxF/XpQfOPifUqCsfSEI7E5kqMDPqba8Pju/lzN7zaMu1erPUe1YE4Wxo3EPL/oXTv2MGnvW+n2v8bNWzDw8opFFMBh2Hljr3iLAPAFIqhhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPbMN4uK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751004581; x=1782540581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svKY+S2D0HtkWWikWXgzFmDBjV4W/T0LQlP9p/0liFU=;
  b=GPbMN4uKYYJ8vUyv2HKbHI5QFT+bjEerAHZwMHlMx+q++b90EwCCy2Nd
   Aarr/xPf3c5dKCmduSqGFD/BnKVCqv2dOKHUe/dX9cgv5FqWW9klw4SSp
   Ed/QP9n8VjJSGp0olL5ygxj2dHsJDXBpm8Hs7ndfCYeXxAYUMM20Z5OpN
   /oA+W1f7qJimqVpmhN9MNo8rxqRCcBprciAS63eENO1f4IqeC6AQqPeoP
   Y+32eU9LQmIn6fph9TdRR+0RtQlW9aWIp3VwXsx6+aYyqqcnFdoqAbQ5j
   K4Un23jxCERPJ0JHgx0gBVZaFyvoCeWdMV3/Dh9gUutIN9XbyYpIFxpVr
   A==;
X-CSE-ConnectionGUID: j7jnAEAGQyCPKOsiMF0sBg==
X-CSE-MsgGUID: 7dz5g0tSQ1O7unnOPK9dRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63570433"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="63570433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:09:40 -0700
X-CSE-ConnectionGUID: w/+oPsBDTGyCLNt6qh41VA==
X-CSE-MsgGUID: ZDV6AKqdR9WDgZRJSrSK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157011140"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:09:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 558D712072E;
	Fri, 27 Jun 2025 09:09:35 +0300 (EEST)
Date: Fri, 27 Jun 2025 06:09:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <aF41n2Y3Rf6HneiD@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <15ed5a72-8c0d-4e94-90e6-dc3ea6e39e89@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15ed5a72-8c0d-4e94-90e6-dc3ea6e39e89@ideasonboard.com>

Moi,

On Thu, Jun 26, 2025 at 06:17:13PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/06/2025 11:15, Sakari Ailus wrote:
> > Streams are stored in sink-source pairs in sub-device state. When a stream
> > was marked enabled (or disabled), only the state of one end of the stream
> > was modified, leaving the stream in an incoherent state. Mark both ends of
> > the stream enabled (or disabled).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 60b8febd3339..5afdd9d548b5 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2254,9 +2254,11 @@ static void v4l2_subdev_set_streams_enabled(struct v4l2_subdev *sd,
> >  	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
> >  		struct v4l2_subdev_stream_config *cfg =
> >  			&state->stream_configs.configs[i];
> > +		struct v4l2_subdev_stream_config *cfg2 =
> > +			&state->stream_configs.configs[i ^ 1U];
> 
> I don't think this is correct. There's no specific rule that the stream
> configs would be in a particular order. Or that there even are a pair.
> 
> You should look for the other end of the stream from the routing table.

Currently the code managing the streams stores them in this array in pairs,
the sink followed by the source for each route. As noted in the commit
message, this patch also fixes a bug.

I can change the patch to use routes to find the other end, but over time
we might want to use a different data structure to store this information
(a linked list perhaps). The number of routes and stream configurations is
presumably fairly small in most cases so right now I presume there's no
noteworthy effect on performance.

-- 
Terveisin,

Sakari Ailus

