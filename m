Return-Path: <linux-media+bounces-61925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFGOM6zgCmqR8wQAu9opvQ
	(envelope-from <linux-media+bounces-61925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:49:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7F56A0D9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D85D306B6CC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAEE3E63A6;
	Mon, 18 May 2026 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egg1n2Hh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273C61C860A
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097136; cv=none; b=cmIU67w3SmtlIyxyuXmK+I0f+Lc8IW25AmpzwlawLb/k+WotwaX+lclmxXfZNRBfLdpBlr81RMlrZX+aki2LfVdaAy6LrrCzDJIP+kykMCsgARpPnnLJEPRgmdQPA1ggG589xTkA9UpxDAwJ+YW//wtiw3ifB3Ne0oiiotVgN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097136; c=relaxed/simple;
	bh=+jgR7GBiNnLSQpMYAYIPHIDchI+h0LqkVz2zIH4qI2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up6ybfT4zyB9zj2aDNULgk2MA485tL1oC1uMuhQExlZn/3DrW8mS5PqEqP6bcFBjsFXLJy797aAobOhj0V6E/kdD3aHeL/nmDXIHL6eyQtp3JbhD2QXWBfTv6Kbui7zq83yesSIK3YpFdk+45yhTWpkEvcXtdsoUQesyVtfFNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egg1n2Hh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779097134; x=1810633134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jgR7GBiNnLSQpMYAYIPHIDchI+h0LqkVz2zIH4qI2Q=;
  b=egg1n2HhBRfEoNsjhL6noyVFkHFb0jp6sNhjo/Aay0eqCCRBps4tXfW4
   z+WGdAig4i1z2TgVgtfhvvFuRHUTYsBuzOlEkA9lVoJGT0GymnzdCz1qM
   VdcqMKdkv+mZHgQwKs+0G29hIzloA8fGWYk8R0ctQkN1q38eMR59kfzHG
   GjJUbHISqJwXSHqroZCzOYiP7L67gbt/bAevxBjHHlAFAYOz/ljs8bTS7
   HLmtfhe57q0YAeAReVrMC2/XeinB4WzIhG/EkrCDYu7vOVy80hzfXQ5uK
   RyGDGImJwLfn1uW2jfhCVpV02QPASqGa24ormoeNcoczCTgEwmnjKkXss
   A==;
X-CSE-ConnectionGUID: aIMaUh67REeHwdUmK75Beg==
X-CSE-MsgGUID: ZxJZk5I+RA6cBf4mQ1fudA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91337133"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91337133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:38:54 -0700
X-CSE-ConnectionGUID: wIeJ8zo+T9awvB/cLF6uhg==
X-CSE-MsgGUID: pp7Jkq04TcqfDZj0WFz+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="236365639"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 02:38:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A88011F70F;
	Mon, 18 May 2026 12:38:53 +0300 (EEST)
Date: Mon, 18 May 2026 12:38:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 03/17] media: v4l2-subdev: Prepare for changes in getting
 frame descriptors
Message-ID: <agreLVALburHTJ2r@kekkonen.localdomain>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-4-sakari.ailus@linux.intel.com>
 <agWctBkdQDzXAmh5@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agWctBkdQDzXAmh5@zed>
X-Rspamd-Queue-Id: D1D7F56A0D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61925-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,kekkonen.localdomain:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Jacopo,

On Thu, May 14, 2026 at 12:02:50PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, May 13, 2026 at 01:43:44PM +0300, Sakari Ailus wrote:
> > Introduce v4l2_subdev_alloc_frame_desc() and v4l2_subdev_free_frame_desc()
> > to both facilitate implementing drivers that need frame descriptors as
> > well as prepare for having a larger number of frame descriptors.
> 
> As noticed by Frank, this line doesn't seem to match the patch content

Indeed. I'll fix this for v2.

> 
> > If the remote sub-device does not support frame descriptors,
> > v4l2_subdev_get_frame_desc() creates one (with a single entry)
> > opportunistically, thus avoiding the need to add frame descriptor support
> > to sensor drivers the device for which only generates a single stream, or
> > managing the situation on the caller side.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 59 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           | 20 +++++++++
> >  2 files changed, 79 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index d93ed50255ed..b8acce8f9c33 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/version.h>
> >  #include <linux/videodev2.h>
> >
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-event.h>
> > @@ -2671,6 +2672,64 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc_passthrough);
> >
> > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_frame_desc *desc)
> > +{
> > +	struct v4l2_subdev_format subdev_fmt = {
> > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +		.pad = pad,
> > +	};
> > +	int ret;
> 
> is it worth being extra paranoid and add an
> 
>         if (WARN_ON(!desc))
>                 return -EINVAL;

In v2 the frame descriptor will be returned to the caller.

> 
> here ?
> 
> And make immediately sure that desc->type is populated by checking for
> 
>         if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_UNDEFINED)
>                 return -EINVAL;
> 
> or is passing UNDEFINED in supported ?

In fact for v4l2_subdev_get_frame_desc() we should require either of the
supported types. I'll move the descriptor type check here.

> 
> > +
> > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > +		unsigned int type = desc->type;
> > +
> > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (desc->type != type) {
> > +			dev_dbg(sd->dev,
> > +				"wrong type of frame descriptor for pad %d (got %u, expected %u)\n",
> > +				pad, desc->type, type);
> > +			return -EINVAL;
> > +		}
> > +
> > +		return ret;
> 
> You can return 0;

Yes.

> 
> > +	}
> > +
> > +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> > +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > +		return -EINVAL;
> > +
> > +	struct v4l2_subdev_state *state =
> > +		v4l2_subdev_lock_and_get_active_state(sd);
> > +	ret = v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> > +	v4l2_subdev_unlock_state(state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	struct v4l2_mbus_frame_desc_entry entry = {
> > +		.pixelcode = subdev_fmt.format.code,
> > +	};
> > +
> > +	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > +		int dt;
> > +
> > +		dt = mipi_csi2_dt_for_mbus(subdev_fmt.format.code);
> > +		if (dt < 0)
> > +			return dt;
> > +
> > +		entry.bus.csi2.dt = dt;
> > +	}
> > +
> > +	desc->entry[0] = entry;
> 
> Can't you populate desc->entry[0] directly and avoid a copy ?

That'd work, yes. I'll change this for v2.

> 
> > +	desc->num_entries = 1;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> > +
> >  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> >
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d256b7ec8f84..c9e74566c85a 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1778,6 +1778,26 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >  					   unsigned int pad,
> >  					   struct v4l2_mbus_frame_desc *fd);
> >
> > +/**
> > + * v4l2_subdev_get_frame_desc() - Get a frame descriptor for a pad
> > + * @sd: The sub-device
>            The -remote- sub-device ?

The API is meant for all sub-devices, in most cases it's remote but not
always. Getting a frame descriptor from the local sub-device likely has no
use cases but I wouldn't document that here.

> 
> > + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> > + * @desc: A pointer to a frame descriptor, with its type field set
> > + *
> > + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> > + * get_frame_desc pad operation, its result is returned, just like calling it
> > + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> > + * it, then a frame descriptor containing a single entry is created using the
> > + * information from the sub-device format for types
> > + * V4L2_MBUS_FRAME_DESC_TYPE_CSI2 and V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL.
> > + *
> > + * The caller is required to set @desc->type to the expected bus type.
> > + *
> > + * Return: %0 on success or negative error code on failure.
> > + */
> > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_frame_desc *desc);
> > +
> >  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
> >
> >  #endif /* CONFIG_MEDIA_CONTROLLER */

-- 
Kind regards,

Sakari Ailus

