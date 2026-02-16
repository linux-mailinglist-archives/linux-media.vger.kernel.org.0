Return-Path: <linux-media+bounces-52937-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rU3vGrKNk2nN6QEAu9opvQ
	(envelope-from <linux-media+bounces-52937-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:35:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF5147C75
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C480E3003711
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FF3283FF9;
	Mon, 16 Feb 2026 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neFTG6rh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31A22D4D3
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771277738; cv=none; b=BI+T8//1s7BVAdjc290hHTVMzdncLa2Hqvke7p2THUQDasxD8V0JKwQUg6BUWKPF/vLaTgJ7yeDrQGowmfE4I/tu9wN6H0/JH5gCWnpj1/MdPMlvuIKIZ63HkBV7T3N5hue1yxQXjPROFpyNfnk3BgGi3NIKT6UnRbOZzVc1dLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771277738; c=relaxed/simple;
	bh=qdCcyAmNYNkDx9LB3r99m4U5Nb8nUFhzPXLVGoLKGIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPc0jW7o+oRB2O92B+nM1w0s3HynW9Z07OAf51iU4HlFUh12XSPvRL8vjvsXmxLNp5mBiIWhocoqUF6crpVWkFbu46RpOKZ0F7nzoqEMIByWeDAS3y/F113RV91tVVATNZaXIYCal/pzFy67LO+bQ+rUEdxIDMqcSDnxBX42ijk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neFTG6rh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771277737; x=1802813737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qdCcyAmNYNkDx9LB3r99m4U5Nb8nUFhzPXLVGoLKGIM=;
  b=neFTG6rhZevVVJ7zxBdJqrbDrv+/RWAUXv6Dll9b1cC5SzZvOgXsUYjb
   46QWMDhRyvg8aRxqOZquw8WQ6RYHz097lyCFLZ3At+4OUyuujNBZJZ1xo
   6swdYOLtk1D4dmgS0JPvFX3A64PqYrkh00S8aRYMmpRUXfMoR9q5lgi8e
   sjyf8UulEl85neIFZrWPRxed+dl1gYZwJGVPeKcFe6mGPQimFJKPJNGx0
   L8UV+1raWtcABh0mogQNTd9Z1n/a/RSTh5mjW24RV/AQPJ/znSbQSzjug
   WnVe9biSBwqXm7yFgMcxq3MXoRr8IucPvOdFBpfsuK7RmJ7okpfEkVJ4Q
   Q==;
X-CSE-ConnectionGUID: 0idb2j8GQ1GIwffziVmG+w==
X-CSE-MsgGUID: N6OmwGviRbew+zJs9S9+Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72349628"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72349628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:35:37 -0800
X-CSE-ConnectionGUID: kvVDMiiJQyCPp80HxP1crQ==
X-CSE-MsgGUID: dT5ncaBsTDGjd9Nfa4iO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212967835"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.46])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:35:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A7C6F121D2E;
	Mon, 16 Feb 2026 23:35:49 +0200 (EET)
Date: Mon, 16 Feb 2026 23:35:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 11/14] media: v4l2-subdev: Add struct
 v4l2_subdev_client_info pointer to pad ops
Message-ID: <aZONtaEmziYgJJEN@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-12-sakari.ailus@linux.intel.com>
 <c04032ab-bcc6-4644-9d00-debc124eff0f@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c04032ab-bcc6-4644-9d00-debc124eff0f@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52937-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77AF5147C75
X-Rspamd-Action: no action

Hi Mirela,

On Mon, Feb 16, 2026 at 05:40:42PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> I get build errors after applying this patch, like:
> 
> drivers/media/i2c/imx219.c:1004:20: error: initialization of ‘int (*)(struct
> v4l2_subdev *, const struct v4l2_subdev_client_info *, struct
> v4l2_subdev_state *, struct v4l2_subdev_format *)’ from incompatible pointer
> type ‘int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct
> v4l2_subdev_format *)’ [-Wincompatible-pointer-types]
>  1004 |         .set_fmt = imx219_set_pad_format,
> 
> I'm not sure if it is fixed later, but after I apply all 14 patches, I still
> get some build errors (I'm building for ARM64).

Yes; I've noticed since posting this version I missed some required
changes. I'll address this in v3.

The change here (adding the client info argument) requires merging the last
few patches in the set. I've kept the patches separate as there's one
generated by Coccinelle entirely.

> 
> See also one other issue below.
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add a pointer to const struct v4l2_subdev_client_info to the get_fmt,
> > set_fmt, get_selection and set_selection sub-device pad ops. The client
> > info struct will soon be used to differentiate UAPI based on client
> > capabilities.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 63 ++++++++++++++++++---------
> >   include/media/v4l2-subdev.h           |  9 +++-
> >   2 files changed, 51 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 79fb4643182a..76ab70a99e86 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -245,19 +245,21 @@ static inline int check_format(struct v4l2_subdev *sd,
> >   }
> > 
> >   static int call_get_fmt(struct v4l2_subdev *sd,
> > +                       const struct v4l2_subdev_client_info *ci,
> >                          struct v4l2_subdev_state *state,
> >                          struct v4l2_subdev_format *format)
> >   {
> >          return check_format(sd, state, format) ? :
> > -              sd->ops->pad->get_fmt(sd, state, format);
> > +               sd->ops->pad->get_fmt(sd, ci, state, format);
> >   }
> > 
> >   static int call_set_fmt(struct v4l2_subdev *sd,
> > +                       const struct v4l2_subdev_client_info *ci,
> >                          struct v4l2_subdev_state *state,
> >                          struct v4l2_subdev_format *format)
> >   {
> >          return check_format(sd, state, format) ? :
> > -              sd->ops->pad->set_fmt(sd, state, format);
> > +               sd->ops->pad->set_fmt(sd, ci, state, format);
> >   }
> > 
> >   static int call_enum_mbus_code(struct v4l2_subdev *sd,
> > @@ -308,19 +310,21 @@ static inline int check_selection(struct v4l2_subdev *sd,
> >   }
> > 
> >   static int call_get_selection(struct v4l2_subdev *sd,
> > +                             const struct v4l2_subdev_client_info *ci,
> >                                struct v4l2_subdev_state *state,
> >                                struct v4l2_subdev_selection *sel)
> >   {
> >          return check_selection(sd, state, sel) ? :
> > -              sd->ops->pad->get_selection(sd, state, sel);
> > +               sd->ops->pad->get_selection(sd, ci, state, sel);
> >   }
> > 
> >   static int call_set_selection(struct v4l2_subdev *sd,
> > +                             const struct v4l2_subdev_client_info *ci,
> >                                struct v4l2_subdev_state *state,
> >                                struct v4l2_subdev_selection *sel)
> >   {
> >          return check_selection(sd, state, sel) ? :
> > -              sd->ops->pad->set_selection(sd, state, sel);
> > +               sd->ops->pad->set_selection(sd, ci, state, sel);
> >   }
> > 
> >   static inline int check_frame_interval(struct v4l2_subdev *sd,
> > @@ -523,6 +527,21 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
> >                          v4l2_subdev_unlock_state(state);                   \
> >                  return ret;                                                \
> >          }
> > +#define DEFINE_STATE_WRAPPER_CI(f, arg_type)                               \
> > +       static int call_##f##_state(struct v4l2_subdev *sd,                \
> > +                                   const struct v4l2_subdev_client_info *ci, \
> > +                                   struct v4l2_subdev_state *_state,      \
> > +                                   arg_type *arg) \
> > +       {                                                                  \
> > +               struct v4l2_subdev_state *state = _state;                  \
> > +               int ret;                                                   \
> > +               if (!_state)                                               \
> > +                       state = v4l2_subdev_lock_and_get_active_state(sd); \
> > +               ret = call_##f(sd, ci, state, arg);                        \
> > +               if (!_state && state)                                      \
> > +                       v4l2_subdev_unlock_state(state);                   \
> > +               return ret;                                                \
> > +       }
> > 
> >   #else /* CONFIG_MEDIA_CONTROLLER */
> > 
> > @@ -536,13 +555,13 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
> > 
> >   #endif /* CONFIG_MEDIA_CONTROLLER */
> > 
> > -DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
> > -DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
> > +DEFINE_STATE_WRAPPER_CI(get_fmt, struct v4l2_subdev_format);
> 
> DEFINE_STATE_WRAPPER_CI is not defined when CONFIG_MEDIA_CONTROLLER is not
> defined

I'll address that for v3.

-- 
Regards,

Sakari Ailus

