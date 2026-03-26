Return-Path: <linux-media+bounces-57168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH2AFHpoxWl1+AQAu9opvQ
	(envelope-from <linux-media+bounces-57168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:10:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A8338EF5
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BA2D302C35B
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09813988E6;
	Thu, 26 Mar 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAzK5A3x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB51EEBB
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 16:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774544049; cv=none; b=fPp3/eovtjchgEnMPr9LjGoyXrxcwZhxzaKqjPldfRiKw69e13L9P40vMHrrh7v7XcQHHZrqOuKCbU/Js7iMW5IGyoUA35wjHCvfuczz9Izo4JNm1jl5VxrZHa/otaT1EYthykyeAhR7vqnL4RadfRN31xgbOr6xzZZCwlXiugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774544049; c=relaxed/simple;
	bh=2xDs3GE37lGTRVJvYeqPTmoWBhxGeddEiaYnrXUuE+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTWDYl1A7s7A8coAt1dVHlykeVN5YbHXKshOCS5EUw0tv9Me4hpVOtEKrTxetjRejEyWCZVE6UqFaX1U/UTXnVaj5/oXrAXpdLRBElDSDpZI7FGTNpq86NdD/yOIFp/j54oK9xCgK7EzzknmEtvAaYbxN48Sv5oFJHsJLuxmCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAzK5A3x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774544047; x=1806080047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2xDs3GE37lGTRVJvYeqPTmoWBhxGeddEiaYnrXUuE+E=;
  b=aAzK5A3xdXnFfd78m5c1CEqcEYu73s4amCFA3nYpz1ipwPEjDpcHOwOM
   GTZHas2aPH2QVWGFE0s0/YS6lmUiyF9TwEV25LPjutCngvjQdnhjVtQxE
   PeqFDydCUA+Ds6nG3P33IruIaEMmYCA+1ZsE7OCN1Xdw3ifgfB3NWXY5i
   eHKa0UezvrYvzE1r+Px1B3LaH5m8Z2OBu4BwO7i6j6MfS9/6SnUsFg0Wt
   NqiiYhRu5fN4hrAWX3kauxGSwjnd27L2935Ns1JjAi2Cc4ejWqfZyfA2F
   Cwj0WvS5IKEqBTY6P4ztHsKD02ubOCjYmPuM+cMBz/gh4SF7QbcgKaBAR
   g==;
X-CSE-ConnectionGUID: tFViY+0mTJmHsrbbktiESA==
X-CSE-MsgGUID: wicnJeWcS26h3pvbgTc6Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75324952"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75324952"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 09:54:06 -0700
X-CSE-ConnectionGUID: XptwycAOSfGoDDcn+sk/Og==
X-CSE-MsgGUID: yRPnBJKLRR6qnVa4X/0B5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="262971632"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 09:54:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4033120AF5;
	Thu, 26 Mar 2026 18:54:02 +0200 (EET)
Date: Thu, 26 Mar 2026 18:54:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
Message-ID: <acVkqiSPLAWrOv4A@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
 <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-57168-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: BB8A8338EF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Benjamin,

On Thu, Mar 26, 2026 at 05:05:47PM +0100, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> I'm so late to the party I'm afraid the door might already be closed :)

The patches aren't merged so it's still possible to change things...

> 
> Le 25/08/2025 à 11:50, Sakari Ailus a écrit :
> > Sub-sampling is a way to decrease the data rates after the pixel array by
> > systematically discarding some samples, either vertically or horizontally
> > or both. Add two controls for the purpose and document them. The
> > sub-sampling configuration is taken into account in the compose rectangle.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
> >  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
> >  include/uapi/linux/v4l2-controls.h               |  2 ++
> >  4 files changed, 28 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index ef1f51862980..b0ad0d778396 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >  
> > -Binning
> > --------
> > +Binning and sub-sampling
> > +------------------------
> >  
> >  Binning has traditionally been configured using :ref:`the compose selection
> >  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
> >  also support the compose rectangle, albeit the rectangle may be read-only when
> >  the control is present.
> >  
> > -Binning isn't affected by flipping.
> > +Sub-sampling is often supported as part of a camera sensor's binning
> > +functionality and performed after the binning operation. Sub-sampling typically
> > +produces quality-wise worse results than binning. Sub-sampling factors are
> > +independent horizontally and vertically and they are controlled using two
> > +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
> > +sub-sampling, the image size before sub-sampling is horizontally and vertically
> > +divided by the respective sub-sampling factors. Drivers supporting the control shall
> > +also reflect the sub-sampling configuration in the compose rectangle.
> > +
> > +Binning and sub-sampling aren't affected by flipping.
> >  
> >  .. _media_using_camera_sensor_drivers_embedded_data:
> >  
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index 18b484ff5d75..577b73045bee 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
> >  
> >  For instance, a value of ``0x0001000300020003`` indicates binning by 3
> >  (horizontally) * 3/2 (vertically).
> > +
> > +.. _v4l2-cid-camera-sensor-subsampling:
> > +
> > +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
> > +(integer)
> > +
> > +    Horizontal and vertical subsampling factors.
> > +
> > +    Sub-sampling is used to downscale an image, horizontally and vertically, by
> > +    discarding a part of the image data. Typically sub-sampling produces lower
> > +    quality images than binning.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 5e1c28850e87..9f8816bfffbe 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> >  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> >  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> > +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
> > +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
> 
> I applied this patch in my tree and I'm currently implementing binning
> and sub-sampling support for the vd55g1. First of all, thank you for
> your work.
> 
> The vd55g1 camera sensor only performs sub-sampling in both horizontal
> and vertical axes at the same time, no decoupling. For now I  modified
> the patch to have a single control handling sub-sampling as a whole.
> Maybe there is a more idiomatic way to approach this kind of problem
> that I might have missed ? Kind of 'linking' controls together if that
> make sense.
> 
> I'm unusure if having both sub-sampling axes tied together is common
> behavior among camera sensors or not. Do you think this is something
> worth addressing in the serie ?

The reason a single control was added for the purpose was that it does
allow for implementations that tie horizontal and vertical binning factors.
I'm not sure which one is more common but both can be supported this way.
Untied factors typically means having a large number of options though.

In CCS horizontal and vertical binning are related, too.

How many options do you have for each?

-- 
Kind regards,

Sakari Ailus

