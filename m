Return-Path: <linux-media+bounces-64198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ph+CKzTWJmrNlQIAu9opvQ
	(envelope-from <linux-media+bounces-64198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:48:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A46577DF
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EcOcqkP3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64198-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64198-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FBFC3035D73
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670C03C4B71;
	Mon,  8 Jun 2026 14:28:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F037DEAA
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:28:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928929; cv=none; b=taYePZ20CaFncvvLNSsoiWe1W6qNu/qcXSw7A0TghLntoGnC4W9maXV9utjlF5/CudGhqKLaJEFOEkejuv2eaGmyutjRrtJtFvpKm+hvWn49mFfpyWlDCNLy+Eeve9I6QTeTMwaxbNPu6SXddFhM+wpqJ5zlFGQrBYUe6cTzzMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928929; c=relaxed/simple;
	bh=isdBuVGUzycA2a+WkH7EfnC7E35xb302PEHo/nMT/Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkDcn9HlYd4hkRwXHZt7rRLf3JOmR1ahvdQHtDtUIomH8Tcga4nUxRWkAFMnGIDF4qZmZzEd5EKNJ+roOoRdjIM0/WuaoDWr4gWjXrxsXD1nWMKEa94tpTWzudIVR3cDmfj3OxnkS/pjaLSrr8obbGqB+xWxEwcZDuzdkzr+w2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcOcqkP3; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780928928; x=1812464928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isdBuVGUzycA2a+WkH7EfnC7E35xb302PEHo/nMT/Dw=;
  b=EcOcqkP3aIvEXfug7FJhZz+/H+Aw40UeGl+NE7eDWvI02KmwOikq8Xnp
   KVawmdRG0dL/LI1a2731jyx2cAy23hFZahsPnYVGALP/XdmlGNBs0tdxw
   Tzf+EYS+kFRMzYTig4Zmu94GRgZhH/gRL0aVMEoWzlc4XXYACQURd5u19
   No/sxJk6p+ZRi4NEw7u2/57eyTutPYpT7+gsCMwB2dEAI7VidbL3efJX4
   KgjEMVyCMoaHA3JafAEV/uhIXdNi6yp31iiaUX3ZSGtbe1jbQBZfU9fdS
   z4NEN9MtbhJ5e+26lCwIYuVgHeKsYYL+VhW+jB8d/xidCTKZiF5zKayss
   Q==;
X-CSE-ConnectionGUID: IToOexb+S8eADAIZAwRLeQ==
X-CSE-MsgGUID: b3DIsvZ1RrGs/q8MsSBJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="69197622"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="69197622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:28:47 -0700
X-CSE-ConnectionGUID: IBXBxtt/Scy4TwyBLy3JiQ==
X-CSE-MsgGUID: 8VTpLQgZSUOV/jY6DxyfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245426090"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.127])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:28:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 47D78121C67;
	Mon, 08 Jun 2026 17:28:37 +0300 (EEST)
Date: Mon, 8 Jun 2026 17:28:37 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 07/10] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <aibRlZ1uK5-SsO__@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-8-sakari.ailus@linux.intel.com>
 <20260608092916.GC772117@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608092916.GC772117@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64198-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,kekkonen.localdomain:mid,intel.com:dkim,intel.com:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C5A46577DF

Hi Laurent,

On Mon, Jun 08, 2026 at 12:29:16PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Jun 08, 2026 at 12:53:53AM +0300, Sakari Ailus wrote:
> > Document that enable_streams may start additional streams and
> > disable_streams may not disable requested streams if other related streams
> > are still enabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  include/media/v4l2-subdev.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 0361c8bbee38..a25234befbe9 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -828,6 +828,10 @@ struct v4l2_subdev_state {
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> >   *
> > + *	Starting the requested streams may require starting additional
> > + *	streams. Streams that are started and stopped together due to hardware
> > + *	are called a stream group.
> 
> This is too vague. "may require starting additional streams" can be
> understood as the driver starting more streams than the requested ones,
> or as the caller having to start more streams before the requests
> streams are effectively started.
> 
> Here's a proposal to clarify the documentation:
> 
>  * Due to device constraints, starting the requested streams may result in
>  * additional streams also being started by the driver. Streams that are started
>  * and stopped together due to the nature of the hardware are called a stream
>  * group.
> 
> "hardware" may be a bit restrictive, I wonder if those constraints could
> also sometimes come from the software implementation instead of being
> pure hardware constraints. I think it's fine for now though, we can
> clarify this later if needed.
> 
> > + *
> >   * @disable_streams: Disable the streams defined in streams_mask on the given
> >   *	source pad. Subdevs that implement this operation must use the active
> >   *	state management provided by the subdev core (enabled through a call to
> > @@ -837,6 +841,10 @@ struct v4l2_subdev_state {
> >   *	Drivers that support only a single stream without setting the
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> > + *
> > + *	Stopping the requested streams may be delayed due to other enabled
> > + *	streams in the stream group, where all streams are started and stopped
> > + *	together.
> 
> This is better. I would have written
> 
>  * When the requested stream are part of a stream group, they will be stopped
>  * once all streams in the group are stopped.
> 
> to make it clearer that the streams won't be stopped immediately ("may"
> in the original text implies they may or may not be stopped
> immediately), but I'm also OK with your text.

I'll use your text in v6. I presume Jacopo and Mirela agree. :-)

-- 
Regards,

Sakari Ailus

