Return-Path: <linux-media+bounces-52775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vRxvIo9fj2nNQgEAu9opvQ
	(envelope-from <linux-media+bounces-52775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:29:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8F138A3D
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 18:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D0A930398B5
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 17:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699E13659E5;
	Fri, 13 Feb 2026 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQdTxx4S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B024677A
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003784; cv=none; b=d5I/Nh6PeH8o184CxyWdvLbTnx38pdBrSooZbdjMwYtDFN+/LhOmkCrBySHs1ryCVwqgZlOaGXa79RQHq9npgEaklSufnEowYjXxDk0Fjz8Inbjkv93CbC+74Va6vQiUJj8S9bosxJr/HRpho07nAsaTa71FEatZ6YbD8xCQhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003784; c=relaxed/simple;
	bh=nGMYitrSA2YZKGezKYQAtv7r6oLTX/Wt6DrEx7UMWAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXexvZr5xSaj79DTgQsFfc14X9VCnmjHLrLXXNzkGzbfd9FEg4ZoOD79ZEMwbKhI0i5LHViXFpFfxAvSQyL3cwLzpbx3peJJBHPYJfQMmSSOInAhlK1pwPu/Cn5uFBZDPtlMpPPHjevCgGHqtc0oR8al9ommyxBfmK4PfcAK5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQdTxx4S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771003784; x=1802539784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nGMYitrSA2YZKGezKYQAtv7r6oLTX/Wt6DrEx7UMWAg=;
  b=dQdTxx4SdP90rPWNaFviGPBGRI1mZs/KVAa1xu04nkXrdMf/9FMSWMEY
   Ykw2dlwNkjUtfwfqsu7j0xx0scLrnrKs9Z2oi8ejsenLjfp6boSGxVhxF
   Qdfxtk0I3kPFGBJihwWeIrPaNfKW7mnz8TOwkbFefktFHwMCIN87YDlFy
   rDHi+fJ1W9Z5XbHIczsnpQKHlejUeA9k9ndxV1XOwuZZCK43SE/6VqSqZ
   SgZOj2uVgPZWhjjixbu1wyPoGcynmTtFsg1mRfSvOK5iEFjztdp1kudxJ
   PVWL4Pgp5sQSU7uSPr6AVggJhUYiKLr467WCVeuAw6xABuGEh2rOy6Vse
   Q==;
X-CSE-ConnectionGUID: hAbChIQkRu+x5t3vffCWdQ==
X-CSE-MsgGUID: liceJVYDRnSczNl6HXo5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76036418"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76036418"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:29:43 -0800
X-CSE-ConnectionGUID: iCwvB8b6TDejYOghjOx1ng==
X-CSE-MsgGUID: /jqdOyPwRMChcstNia56hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212075221"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.102])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:29:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5394C1205A4;
	Fri, 13 Feb 2026 19:29:49 +0200 (EET)
Date: Fri, 13 Feb 2026 19:29:49 +0200
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
Subject: Re: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning routes
Message-ID: <aY9fjUCIUxBcA36X@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
 <aY87XgH0avmszN3-@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY87XgH0avmszN3-@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52775-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDE8F138A3D
X-Rspamd-Action: no action

Hi Jacopo,

On Fri, Feb 13, 2026 at 04:01:41PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Feb 11, 2026 at 11:09:11AM +0200, Sakari Ailus wrote:
> > Refactor returning the routes by adding a new function that essentially
> > does a memcopy and sets the number of the number of the routes in the
> > routing table.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++------------
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index b2105c34478e..8a433d074587 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
> >  			     v4l2_subdev_get_unlocked_active_state(sd);
> >  }
> >
> > +static void subdev_copy_fix_routes(struct v4l2_subdev_routing *routing,
> 
> or just subdev_copy_routes()
> 
> > +				   const struct v4l2_subdev_route *src,
> > +				   u32 copy_routes, u32 num_routes)
> > +{
> > +	struct v4l2_subdev_route *routes =
> > +		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
> > +
> > +	for (u32 i = 0; i < copy_routes; i++)
> 
> Shouldn't this copy the min(copy_routes, num_routes) as the callers
> used to do ?

Indeed. I'll fix that for v3.

> 
> Even better, shouldn't we just accept one 'dest' and one 'source'
> v4l2_subdev_routing arguments and make sure we don't copy more than
> min(dest->num_routes, source->num_routes) ?
> 
> Having the number of routes being passed in by the caller opens the
> door for memory errors.

The arguments indeed appear to be the same for all callers; I'll refactor
this for v3.

> 
> 
> > +		routes[i] = src[i];
> > +
> > +	routing->num_routes = num_routes;
> > +}
> > +
> >  static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  			    struct v4l2_subdev_state *state)
> >  {
> > @@ -1000,7 +1013,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >
> >  	case VIDIOC_SUBDEV_G_ROUTING: {
> >  		struct v4l2_subdev_routing *routing = arg;
> > -		struct v4l2_subdev_krouting *krouting;
> >
> >  		if (!v4l2_subdev_enable_streams_api)
> >  			return -ENOIOCTLCMD;
> > @@ -1013,13 +1025,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >
> >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> >
> > -		krouting = &state->routing;
> > -
> > -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > -		       krouting->routes,
> > -		       min(krouting->num_routes, routing->len_routes) *
> > -		       sizeof(*krouting->routes));
> > -		routing->num_routes = krouting->num_routes;
> > +		subdev_copy_fix_routes(routing, state->routing.routes,
> > +				       routing->len_routes,
> > +				       state->routing.num_routes);
> >
> >  		return 0;
> >  	}
> > @@ -1090,11 +1098,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		 * the routing table.
> >  		 */
> >  		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> > -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > -			       state->routing.routes,
> > -			       min(state->routing.num_routes, routing->len_routes) *
> > -			       sizeof(*state->routing.routes));
> > -			routing->num_routes = state->routing.num_routes;
> > +			subdev_copy_fix_routes(routing, state->routing.routes,
> > +					       routing->len_routes,
> > +					       state->routing.num_routes);
> >
> >  			return 0;
> >  		}
> > @@ -1108,11 +1114,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		if (rval < 0)
> >  			return rval;
> >
> > -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > -		       state->routing.routes,
> > -		       min(state->routing.num_routes, routing->len_routes) *
> > -		       sizeof(*state->routing.routes));
> > -		routing->num_routes = state->routing.num_routes;
> > +		subdev_copy_fix_routes(routing, state->routing.routes,
> > +				       routing->len_routes,
> > +				       state->routing.num_routes);
> >
> >  		return 0;
> >  	}

-- 
Regards,

Sakari Ailus

