Return-Path: <linux-media+bounces-65829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JmTNrMtQWrilwkAu9opvQ
	(envelope-from <linux-media+bounces-65829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 16:20:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 722616D40BC
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 16:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="R/wjzMu/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65829-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65829-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AF073010146
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 14:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55E93ACF1C;
	Sun, 28 Jun 2026 14:20:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA736492A
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 14:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782656429; cv=none; b=aR1zZV5NYpXYMR61Q7d2+LFycwDuP6WKRDSRqM9t+pxvaFNOaSN/ZY/Fy/7O8EM2uMwC/v6PO0vg8FO2GCMXtz7fgmk9Jrwo9dag675QFfnfyGBS8cI/0BMCQwnCgSaUANV+Mk159lUvILMGioCv2+pPULgUn0YUWRN3+IczyK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782656429; c=relaxed/simple;
	bh=Tva/Zv//mjVNd56OtxynItcDMzHqKxwXPpz1n97t1ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdYShHK86G+Q2Sxozanu1dGku+Tw30r/XnZbNC5l9AAg154OKV1D+n/NBwLlvpdL+AGv9P7q9evR4J2vFUfeU+pIHCko1LV1SJDwPBTHAPFFcM8mdaFpYEgdJLg9PEQh8TBezdzKoqHVKzd2t3mjJkZ+C6VH0nv2GUmY4tjy4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/wjzMu/; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782656426; x=1814192426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tva/Zv//mjVNd56OtxynItcDMzHqKxwXPpz1n97t1ew=;
  b=R/wjzMu/759xVaDkZ2nYO+vpcdfWwj6/Xd4liFoD6nIA7R0Zxn9IpFye
   jBaMI15axI//mQxkuUwaZkdJ6EVxJg6daIxfjChb/S9/WeSyNAQlxT8z2
   3IAgRIVapBpg4pLDGZjkvvim80eKlzLOtWFncrStOZcuJgxvJZ9tQ2XRZ
   TTwzbqlvY+v2WOZiKUzy7O4wlRsbJ0ktzG/AWYeL7zeikDp7+EOIZQxzT
   S53G6DcvOXQghPOqb2cYP4mAewQwV1cm8wUpwbYHNLS8KO3f/ZPYWXWRl
   EJRSPfkyr4ITuYoTe+taW6kuWnW+RAWuzv+kMIxfbKoRx2AqQN8I45+vS
   A==;
X-CSE-ConnectionGUID: hKxzNK/uTT2us45bnCvdPA==
X-CSE-MsgGUID: 8F7ZV1xcSVKYESGTNk7bxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="93948447"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="93948447"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 07:20:24 -0700
X-CSE-ConnectionGUID: K3ods0ttQgCKLX8M2V3MPA==
X-CSE-MsgGUID: gq+abQ7USrq4dCwnWm7YdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="274956816"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.181])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 07:20:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8ED821204E0;
	Sun, 28 Jun 2026 17:20:18 +0300 (EEST)
Date: Sun, 28 Jun 2026 17:20:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/10] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <akEtov7zdEDaPe15@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-11-sakari.ailus@linux.intel.com>
 <20260608101652.GE772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608101652.GE772117@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65829-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,kekkonen.localdomain:mid,crop.target:url,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 722616D40BC

Hi Laurent,

Thanks for the review.

On Mon, Jun 08, 2026 at 01:16:52PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> CC'ing Bryan, Vladimir and Loic for the camss driver (please see below
> for a dedicated comment).
> 
> On Mon, Jun 08, 2026 at 12:53:56AM +0300, Sakari Ailus wrote:
> > Add a pointer to const struct v4l2_subdev_client_info to the set_fmt,
> > get_selection and set_selection sub-device pad ops. The client info struct
> > will soon be used to differentiate UAPI based on client capabilities.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/adv7170.c                   |  1 +
> 
> [snip] 
> 
> >  include/media/v4l2-subdev.h                   |  3 +
> >  246 files changed, 539 insertions(+), 151 deletions(-)
> 
> Ouch :-/
> 
> [snip]
> 
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index e5d11a6e6766..79a592f1831d 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -771,6 +771,7 @@ static int adv7180_get_pad_format(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int adv7180_set_pad_format(struct v4l2_subdev *sd,
> > +				  const struct v4l2_subdev_client_info *ci,
> >  				  struct v4l2_subdev_state *sd_state,
> >  				  struct v4l2_subdev_format *format)
> >  {
> > @@ -808,7 +809,7 @@ static int adv7180_init_state(struct v4l2_subdev *sd,
> >  		: V4L2_SUBDEV_FORMAT_ACTIVE,
> >  	};
> >  
> > -	return adv7180_set_pad_format(sd, sd_state, &fmt);
> > +	return adv7180_set_pad_format(sd, NULL, sd_state, &fmt);
> 
> I'm a bit concerned about setting the pointer to NULL blindly. I suppose
> it's fine in drivers that don't use the client info at all (and that's
> all drivers today, so this series doesn't cause any immediate issue),
> but I fear we will later regret not having thought out a migration
> strategy.

In the case above the call comes through init_state() pad op within the
driver; it's not uncommon for drivers to initialise the pad state that way.
The driver needs to be able to manage with NULL client capabilities going
forward. I presume it'd be hard to miss such an issue as you get a NULL
pointer exception by just probing the driver.

> 
> What should happen to drivers that need the client info when their
> .set_fmt(), .get_selection() or .set_selection() operations are called
> by another driver (as opposed to being called by userspace through
> subdev ioctls) ? Will they need to be able to handle a NULL client info
> ? Or can be forbid usage of those drivers in non-MC pipelines ? This is
> an important question to answer now, as it could hinder migration of
> sensor drivers used by the non-MC bridges.

In principle any sensor driver could be used by a non-MC-centric parallel
or CSI-2 receiver driver.

I'd say the drivers needs to cope with NULL client capabilities as within
the kernel there are no client capabilities as such. I can add it to the
documentation.

> 
> Calling .set_fmt() from within the kernel is a common pattern to
> implement .init_state(). Will we deprecate that ? And if so, what will
> be the recommended pattern for .init_state() ?

I don't think it's a problem because of NULL client capabilities but I'd
avoid it for other reasons: it's bug-prone. In many cases submitters use
the ACTIVE state for init_state and that has side effects. That being said,
there may be benefits in terms of lines of code saved by that approach. One
just needs to be careful.

> 
> >  }
> >  
> >  static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
> > diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
> > index a04a1a205fe0..9e4cbebe6e5a 100644
> > --- a/drivers/media/i2c/adv7183.c
> > +++ b/drivers/media/i2c/adv7183.c
> > @@ -420,6 +420,7 @@ static int adv7183_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int adv7183_set_fmt(struct v4l2_subdev *sd,
> > +		const struct v4l2_subdev_client_info *ci,
> >  		struct v4l2_subdev_state *sd_state,
> >  		struct v4l2_subdev_format *format)
> >  {
> > @@ -598,7 +599,7 @@ static int adv7183_probe(struct i2c_client *client)
> >  	adv7183_s_std(sd, decoder->std);
> >  	fmt.format.width = 720;
> >  	fmt.format.height = 576;
> > -	adv7183_set_fmt(sd, NULL, &fmt);
> > +	adv7183_set_fmt(sd, NULL, NULL, &fmt);
> 
> When the status is already NULL we have a bigger issue anyway, so I'm
> less concerned here :-)

It's an old driver that doesn't use the sub-device state.

> 
> >  
> >  	/* initialize the hardware to the default control values */
> >  	ret = v4l2_ctrl_handler_setup(hdl);
> 
> [snip]
> 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 8e25f970fd12..9f3c5f00b37c 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -2189,6 +2189,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
> >  }
> >  
> >  static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > +				 const struct v4l2_subdev_client_info *ci,
> >  				 struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_format *fmt)
> >  {
> > @@ -2242,6 +2243,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> >  }
> >  
> >  static int ccs_set_format(struct v4l2_subdev *subdev,
> > +			  const struct v4l2_subdev_client_info *ci,
> >  			  struct v4l2_subdev_state *sd_state,
> >  			  struct v4l2_subdev_format *fmt)
> >  {
> > @@ -2252,7 +2254,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
> >  	if (fmt->pad == ssd->source_pad) {
> >  		int rval;
> >  
> > -		rval = ccs_set_format_source(subdev, sd_state, fmt);
> > +		rval = ccs_set_format_source(subdev, NULL, sd_state, fmt);
> 
> Here you get a client info structure from the caller, you should pass it
> to ccs_set_format_source().

I can change this for v6 but there's no effect: the CCS driver doesn't use
client capabilities.

> 
> >  
> >  		return rval;
> >  	}
> > @@ -2467,6 +2469,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
> >  }
> >  /* We're only called on source pads. This function sets scaling. */
> >  static int ccs_set_compose(struct v4l2_subdev *subdev,
> > +			   const struct v4l2_subdev_client_info *ci,
> >  			   struct v4l2_subdev_state *sd_state,
> >  			   struct v4l2_subdev_selection *sel)
> >  {
> > @@ -2536,6 +2539,7 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
> >  }
> >  
> >  static int ccs_set_crop(struct v4l2_subdev *subdev,
> > +			const struct v4l2_subdev_client_info *ci,
> >  			struct v4l2_subdev_state *sd_state,
> >  			struct v4l2_subdev_selection *sel)
> >  {
> > @@ -2587,6 +2591,7 @@ static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
> >  }
> >  
> >  static int ccs_get_selection(struct v4l2_subdev *subdev,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_selection *sel)
> >  {
> > @@ -2633,6 +2638,7 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
> >  }
> >  
> >  static int ccs_set_selection(struct v4l2_subdev *subdev,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_selection *sel)
> >  {
> > @@ -2655,10 +2661,10 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
> >  
> >  	switch (sel->target) {
> >  	case V4L2_SEL_TGT_CROP:
> > -		ret = ccs_set_crop(subdev, sd_state, sel);
> > +		ret = ccs_set_crop(subdev, NULL, sd_state, sel);
> >  		break;
> >  	case V4L2_SEL_TGT_COMPOSE:
> > -		ret = ccs_set_compose(subdev, sd_state, sel);
> > +		ret = ccs_set_compose(subdev, NULL, sd_state, sel);
> 
> Same here. There are other drivers touched by this series that can also
> forward the client info.

Ditto.

> 
> >  		break;
> >  	default:
> >  		ret = -EINVAL;
> 
> [snip]
> 
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index 0ade967b357b..c7d2e05ed6ed 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -248,6 +248,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> >  }
> >  
> >  static int mt9m001_set_selection(struct v4l2_subdev *sd,
> > +		const struct v4l2_subdev_client_info *ci,
> >  		struct v4l2_subdev_state *sd_state,
> >  		struct v4l2_subdev_selection *sel)
> >  {
> > @@ -289,6 +290,7 @@ static int mt9m001_set_selection(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mt9m001_get_selection(struct v4l2_subdev *sd,
> > +		const struct v4l2_subdev_client_info *ci,
> >  		struct v4l2_subdev_state *sd_state,
> >  		struct v4l2_subdev_selection *sel)
> >  {
> > @@ -359,7 +361,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
> >  	int ret;
> >  
> >  	/* No support for scaling so far, just crop. TODO: use skipping */
> > -	ret = mt9m001_set_selection(sd, NULL, &sel);
> > +	ret = mt9m001_set_selection(sd, NULL, NULL, &sel);
> 
> Here for instance, you could pass the client info to mt9m001_s_fmt()
> (although the driver's logic seems wrong, but that's a different
> matter). While at it you could also forward the state pointer.

I'll add a separate patch for the latter.

> 
> >  	if (!ret) {
> >  		mf->width	= mt9m001->rect.width;
> >  		mf->height	= mt9m001->rect.height;
> > @@ -371,6 +373,7 @@ static int mt9m001_s_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mt9m001_set_fmt(struct v4l2_subdev *sd,
> > +		const struct v4l2_subdev_client_info *ci,
> >  		struct v4l2_subdev_state *sd_state,
> >  		struct v4l2_subdev_format *format)
> >  {
> 
> [snip]
> 
> >  static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
> > diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
> > index 9b9f69ff4016..2053849c9b4c 100644
> > --- a/drivers/media/pci/cobalt/cobalt-driver.c
> > +++ b/drivers/media/pci/cobalt/cobalt-driver.c
> > @@ -525,8 +525,8 @@ static int cobalt_subdevs_init(struct cobalt *cobalt)
> >  				&cobalt_edid);
> >  		if (err)
> >  			return err;
> > -		err = v4l2_subdev_call(s[i].sd, pad, set_fmt, NULL,
> > -				&sd_fmt);
> > +		err = v4l2_subdev_call(s[i].sd, pad, set_fmt, NULL, NULL,
> > +				       &sd_fmt);
> 
> Another case of an in-kernel caller that doesn't pass a state. This one
> is a cross-driver call, it will already break with subdev drivers that
> require a state, so not passing a client info isn't a big issue (I
> assume we will require drivers that use client info to be state-based).
> 
> >  		if (err)
> >  			return err;
> >  		/* Reset channel video module */
> > @@ -609,8 +609,8 @@ static int cobalt_subdevs_hsma_init(struct cobalt *cobalt)
> >  
> >  		if (err)
> >  			return err;
> > -		err = v4l2_subdev_call(s->sd, pad, set_fmt, NULL,
> > -				&sd_fmt);
> > +		err = v4l2_subdev_call(s->sd, pad, set_fmt, NULL, NULL,
> > +				       &sd_fmt);
> >  		if (err)
> >  			return err;
> >  		cobalt->have_hsma_rx = true;
> 
> [snip]
> 
> > diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
> > index 8c4f70e4177d..d04a68bb05d8 100644
> > --- a/drivers/media/pci/saa7134/saa7134-empress.c
> > +++ b/drivers/media/pci/saa7134/saa7134-empress.c
> > @@ -122,7 +122,7 @@ static int empress_s_fmt_vid_cap(struct file *file, void *priv,
> >  	};
> >  
> >  	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
> > -	saa_call_all(dev, pad, set_fmt, NULL, &format);
> > +	saa_call_all(dev, pad, set_fmt, NULL, NULL, &format);
> >  	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
> >  
> >  	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
> > @@ -145,7 +145,7 @@ static int empress_try_fmt_vid_cap(struct file *file, void *priv,
> >  	};
> >  
> >  	v4l2_fill_mbus_format(&format.format, &f->fmt.pix, MEDIA_BUS_FMT_FIXED);
> > -	saa_call_all(dev, pad, set_fmt, &pad_state, &format);
> > +	saa_call_all(dev, pad, set_fmt, NULL, &pad_state, &format);
> 
> Fake states are really a hack, so I'm not worried here either (except by
> the amount of legacy code we have, but that's again a separate issue).
> 
> >  	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
> >  
> >  	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > index 48deea79ce6c..03752d88c0b6 100644
> > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > @@ -890,6 +890,7 @@ static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
> >  };
> >  
> >  static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
> > +				 const struct v4l2_subdev_client_info *ci,
> >  				 struct v4l2_subdev_state *sd_state,
> >  				 struct v4l2_subdev_format *format)
> >  {
> > diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> > index 0cebb39f98e1..856a2a0b4a12 100644
> > --- a/drivers/media/platform/amd/isp4/isp4_video.c
> > +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> > @@ -240,7 +240,7 @@ static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev,
> >  	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
> >  	fmt.format.width = pix_fmt->width;
> >  	fmt.format.height = pix_fmt->height;
> > -	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
> > +	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, NULL, &fmt);
> >  }
> >  
> >  static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv,
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
> > index ff6413fff889..553c808f8f3b 100644
> > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-core.c
> > @@ -461,6 +461,7 @@ static void c3_isp_core_set_source_fmt(struct v4l2_subdev_state *state,
> >  }
> >  
> >  static int c3_isp_core_set_fmt(struct v4l2_subdev *sd,
> > +			       const struct v4l2_subdev_client_info *ci,
> >  			       struct v4l2_subdev_state *state,
> >  			       struct v4l2_subdev_format *format)
> >  {
> > diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
> > index 453a889e0b27..1f9c16eb0842 100644
> > --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
> > +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-resizer.c
> > @@ -621,6 +621,7 @@ static void c3_isp_rsz_set_source_fmt(struct v4l2_subdev_state *state,
> >  }
> >  
> >  static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
> > +			      const struct v4l2_subdev_client_info *ci,
> >  			      struct v4l2_subdev_state *state,
> >  			      struct v4l2_subdev_format *format)
> >  {
> > @@ -633,6 +634,7 @@ static int c3_isp_rsz_set_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int c3_isp_rsz_get_selection(struct v4l2_subdev *sd,
> > +				    const struct v4l2_subdev_client_info *ci,
> >  				    struct v4l2_subdev_state *state,
> >  				    struct v4l2_subdev_selection *sel)
> >  {
> > @@ -674,6 +676,7 @@ static int c3_isp_rsz_get_selection(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int c3_isp_rsz_set_selection(struct v4l2_subdev *sd,
> > +				    const struct v4l2_subdev_client_info *ci,
> >  				    struct v4l2_subdev_state *state,
> >  				    struct v4l2_subdev_selection *sel)
> >  {
> > diff --git a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> > index 4bd98fb9c7e9..6f75112723b5 100644
> > --- a/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> > +++ b/drivers/media/platform/amlogic/c3/mipi-adapter/c3-mipi-adap.c
> > @@ -521,6 +521,7 @@ static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
> > +				const struct v4l2_subdev_client_info *ci,
> >  				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> > diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > index b9e4ef3fc308..0c399665f7fa 100644
> > --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> > @@ -491,6 +491,7 @@ static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> > +			       const struct v4l2_subdev_client_info *ci,
> >  			       struct v4l2_subdev_state *state,
> >  			       struct v4l2_subdev_format *format)
> >  {
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > index e128adf6ee37..c8464dec9a21 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> > @@ -203,6 +203,7 @@ static int mali_c55_isp_enum_frame_size(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
> > +				const struct v4l2_subdev_client_info *ci,
> >  				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *format)
> >  {
> > @@ -265,6 +266,7 @@ static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
> > +				      const struct v4l2_subdev_client_info *ci,
> >  				      struct v4l2_subdev_state *state,
> >  				      struct v4l2_subdev_selection *sel)
> >  {
> > @@ -278,6 +280,7 @@ static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mali_c55_isp_set_selection(struct v4l2_subdev *sd,
> > +				      const struct v4l2_subdev_client_info *ci,
> >  				      struct v4l2_subdev_state *state,
> >  				      struct v4l2_subdev_selection *sel)
> >  {
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > index c4f46651dcee..b1351f053b87 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> 
> [snip]
> 
> > @@ -826,12 +829,13 @@ static int mali_c55_rsz_set_fmt(struct v4l2_subdev *sd,
> >  
> >  	if (format->pad == MALI_C55_RSZ_SINK_PAD ||
> >  	    format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
> > -		return mali_c55_rsz_set_sink_fmt(sd, state, format);
> > +		return mali_c55_rsz_set_sink_fmt(sd, NULL, state, format);
> >  
> > -	return mali_c55_rsz_set_source_fmt(sd, state, format);
> > +	return mali_c55_rsz_set_source_fmt(sd, NULL, state, format);
> 
> You can forward the client info here too.

Yes.

> 
> >  }
> >  
> >  static int mali_c55_rsz_get_selection(struct v4l2_subdev *sd,
> > +				      const struct v4l2_subdev_client_info *ci,
> >  				      struct v4l2_subdev_state *state,
> >  				      struct v4l2_subdev_selection *sel)
> >  {
> 
> [snip]
> 
> > @@ -963,10 +970,10 @@ static int mali_c55_rsz_set_selection(struct v4l2_subdev *sd,
> >  		return -EINVAL;
> >  
> >  	if (sel->target == V4L2_SEL_TGT_CROP)
> > -		return mali_c55_rsz_set_crop(sd, state, sel);
> > +		return mali_c55_rsz_set_crop(sd, NULL, state, sel);
> >  
> >  	if (sel->target == V4L2_SEL_TGT_COMPOSE)
> > -		return mali_c55_rsz_set_compose(sd, state, sel);
> > +		return mali_c55_rsz_set_compose(sd, NULL, state, sel);
> 
> And here.
> 
> >  
> >  	return -EINVAL;
> >  }
> 
> [snip
> 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 5f9691d76434..1b9012dbae39 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1104,6 +1104,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *state,
> >  			     struct v4l2_subdev_format *sdformat)
> >  {
> > @@ -1225,7 +1226,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
> >  		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
> >  					      fmt.format.ycbcr_enc);
> >  
> > -	return mipi_csis_set_fmt(sd, state, &fmt);
> > +	return mipi_csis_set_fmt(sd, NULL, state, &fmt);
> >  }
> >  
> >  static int mipi_csis_log_status(struct v4l2_subdev *sd)
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > index 7ddc7ba06e3d..0b2ee4dfdcbb 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1890,6 +1890,7 @@ static void imx7_csi_try_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
> > +			    const struct v4l2_subdev_client_info *ci,
> >  			    struct v4l2_subdev_state *sd_state,
> >  			    struct v4l2_subdev_format *sdformat)
> >  {
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index a1cd1e159468..37c147f00038 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -249,6 +249,7 @@ static int mxc_isi_crossbar_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
> > +				    const struct v4l2_subdev_client_info *ci,
> >  				    struct v4l2_subdev_state *state,
> >  				    struct v4l2_subdev_format *fmt)
> >  {
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > index 2d0843c86534..e4ec2bc4fd96 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > @@ -448,6 +448,7 @@ static int mxc_isi_pipe_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mxc_isi_pipe_set_fmt(struct v4l2_subdev *sd,
> > +				const struct v4l2_subdev_client_info *ci,
> >  				struct v4l2_subdev_state *state,
> >  				struct v4l2_subdev_format *fmt)
> >  {
> > @@ -543,6 +544,7 @@ static int mxc_isi_pipe_set_fmt(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mxc_isi_pipe_get_selection(struct v4l2_subdev *sd,
> > +				      const struct v4l2_subdev_client_info *ci,
> >  				      struct v4l2_subdev_state *state,
> >  				      struct v4l2_subdev_selection *sel)
> >  {
> > @@ -602,6 +604,7 @@ static int mxc_isi_pipe_get_selection(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
> > +				      const struct v4l2_subdev_client_info *ci,
> >  				      struct v4l2_subdev_state *state,
> >  				      struct v4l2_subdev_selection *sel)
> >  {
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 04ebed8a0493..17756b7fe1dd 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -597,6 +597,7 @@ static int imx8mq_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> > +				   const struct v4l2_subdev_client_info *ci,
> >  				   struct v4l2_subdev_state *sd_state,
> >  				   struct v4l2_subdev_format *sdformat)
> >  {
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> > index 48459b46a981..a00791b00feb 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> > @@ -987,6 +987,7 @@ static int csid_get_format(struct v4l2_subdev *sd,
> >   * Return -EINVAL or zero on success
> >   */
> >  static int csid_set_format(struct v4l2_subdev *sd,
> > +			   const struct v4l2_subdev_client_info *ci,
> >  			   struct v4l2_subdev_state *sd_state,
> >  			   struct v4l2_subdev_format *fmt)
> >  {
> > @@ -1036,7 +1037,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  		}
> >  	};
> >  
> > -	return csid_set_format(sd, fh ? fh->state : NULL, &format);
> > +	return csid_set_format(sd, NULL, fh ? fh->state : NULL, &format);
> 
> The driver really needs to be converted to the active state API. Bryan,
> would you be able to address this (or work with someone else to do so, I
> know you have a few other cleanup tasks for camss that you'd like to see
> being addressed) ? Same for the rest of the camss driver, .open() needs
> to go and be replaced with .init_state().
> 
> >  }
> >  
> >  /*
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> > index 319d19158988..0ba5bf3abeda 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -1562,6 +1562,7 @@ static int vfe_get_format(struct v4l2_subdev *sd,
> >  }
> >  
> >  static int vfe_set_selection(struct v4l2_subdev *sd,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_selection *sel);
> >  
> > @@ -1574,6 +1575,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
> >   * Return -EINVAL or zero on success
> >   */
> >  static int vfe_set_format(struct v4l2_subdev *sd,
> > +			  const struct v4l2_subdev_client_info *ci,
> >  			  struct v4l2_subdev_state *sd_state,
> >  			  struct v4l2_subdev_format *fmt)
> >  {
> > @@ -1608,7 +1610,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
> >  		sel.target = V4L2_SEL_TGT_COMPOSE;
> >  		sel.r.width = fmt->format.width;
> >  		sel.r.height = fmt->format.height;
> > -		ret = vfe_set_selection(sd, sd_state, &sel);
> > +		ret = vfe_set_selection(sd, NULL, sd_state, &sel);
> 
> Forward client info here too. Same below in vfe_set_selection().

Yes.

> 
> >  		if (ret < 0)
> >  			return ret;
> >  	}
> > @@ -1625,6 +1627,7 @@ static int vfe_set_format(struct v4l2_subdev *sd,
> >   * Return -EINVAL or zero on success
> >   */
> >  static int vfe_get_selection(struct v4l2_subdev *sd,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_selection *sel)
> >  {
> > @@ -1695,6 +1698,7 @@ static int vfe_get_selection(struct v4l2_subdev *sd,
> >   * Return -EINVAL or zero on success
> >   */
> >  static int vfe_set_selection(struct v4l2_subdev *sd,
> > +			     const struct v4l2_subdev_client_info *ci,
> >  			     struct v4l2_subdev_state *sd_state,
> >  			     struct v4l2_subdev_selection *sel)
> >  {
> > @@ -1721,7 +1725,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
> >  		crop.pad = MSM_VFE_PAD_SRC;
> >  		crop.target = V4L2_SEL_TGT_CROP;
> >  		crop.r = *rect;
> > -		ret = vfe_set_selection(sd, sd_state, &crop);
> > +		ret = vfe_set_selection(sd, NULL, sd_state, &crop);
> >  	} else if (sel->target == V4L2_SEL_TGT_CROP &&
> >  		sel->pad == MSM_VFE_PAD_SRC) {
> >  		struct v4l2_subdev_format fmt = { 0 };
> > @@ -1742,7 +1746,7 @@ static int vfe_set_selection(struct v4l2_subdev *sd,
> >  
> >  		fmt.format.width = rect->width;
> >  		fmt.format.height = rect->height;
> > -		ret = vfe_set_format(sd, sd_state, &fmt);
> > +		ret = vfe_set_format(sd, NULL, sd_state, &fmt);
> >  	} else {
> >  		ret = -EINVAL;
> >  	}
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index f6fbd3475329..5eb262a88f9f 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -137,7 +137,8 @@ static int vsp1_du_insert_uif(struct vsp1_device *vsp1,
> >  
> >  	format.pad = UIF_PAD_SINK;
> >  
> > -	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, &format);
> > +	ret = v4l2_subdev_call(&uif->subdev, pad, set_fmt, NULL, NULL,
> 
> This one is on me to handle later if/when the vsp1 driver switches to
> the active state API.
> 
> > +			       &format);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > @@ -184,7 +185,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
> >  	format.format.ycbcr_enc = input->ycbcr_enc;
> >  	format.format.quantization = input->quantization;
> >  
> > -	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
> > +	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL, NULL,
> >  			       &format);
> >  	if (ret < 0)
> >  		return ret;
> > @@ -199,6 +200,7 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
> >  	sel.r = input->crop;
> >  
> >  	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_selection, NULL,
> > +			       NULL,
> >  			       &sel);
> 
> Drop that line break.

Yes.

> 
> >  	if (ret < 0)
> >  		return ret;
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> > index b5749f9cba39..61200c1e9681 100644
> > --- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> > +++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
> > @@ -797,7 +797,8 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
> >  			sd = media_entity_to_v4l2_subdev(me);
> >  
> >  			sfmt.pad = 0;
> > -			ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sfmt);
> > +			ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, NULL,
> > +					       &sfmt);
> >  			if (ret)
> >  				return ret;
> >  
> > @@ -805,6 +806,7 @@ static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
> >  				sfmt.pad = me->num_pads - 1;
> >  				mf->code = tfmt->code;
> >  				ret = v4l2_subdev_call(sd, pad, set_fmt, NULL,
> > +									NULL,
> >  									&sfmt);
> 
> 				ret = v4l2_subdev_call(sd, pad, set_fmt, NULL,
> 						       NULL, &sfmt);

Agreed.

> 
> >  				if (ret)
> >  					return ret;
> 
> [snip]
> 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index c1e1fb9d6773..b384c338940b 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> 
> [snip]
> 
> > @@ -1938,7 +1966,8 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
> >  	return 0;
> >  }
> >  
> > -int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> > +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd,
> > +			struct v4l2_subdev_state *state,
> 
> Unrelated change (probably from a previous version where you added a
> client_info argument to .get_fmt() too ?

Yes, I'll drop it.

> 
> >  			struct v4l2_subdev_format *format)
> >  {
> >  	struct v4l2_mbus_framefmt *fmt;
> 
> [snip]
> 

-- 
Regards,

Sakari Ailus

