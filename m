Return-Path: <linux-media+bounces-58640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFEMDWKk3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:08:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707E3E8D35
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A1443014C40
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EE33A1697;
	Mon, 13 Apr 2026 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAU5HTYa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0D3A5429
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067620; cv=none; b=CZ1FgMbhh9xqAqVgo8ToKQbuR/Z9ev+8UrilrnIPoXyVby5aantaEg/d6dinI13I6ojM2CRtF3eOCDn6jwcpVCe8ENu7k7XMXd2t6heA6tRdGbSgu8HyY5Qozxdi4IZ2wkjWEEH+zSs4p1RUr0HLl6rLIre8xS5kSKGFk/aPNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067620; c=relaxed/simple;
	bh=yVLaDZTH9F2EM3MdreIPylEG4HZxJcfqer8OxUg7ff8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqzmGwzjFREFehwUTPqUSoNlTOOwJxEdANXWdQy1jHdsB0okHZMH/wBSvnubTc60hDtrPOi5js16mv6sVGHyqe135GW9zhQZHZ/9pOOqmCw2MVp0NnKID1gCi9L3/qE+Gehia8hfO0Rrnu7z7uD682K1KWC7rW/xkohcVnG045k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAU5HTYa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776067617; x=1807603617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVLaDZTH9F2EM3MdreIPylEG4HZxJcfqer8OxUg7ff8=;
  b=EAU5HTYaTdmVoe63FX0ahzdlLmXI0KZfIZJ7jfk9b+SQTk9rTcieQo9I
   Rg9rHbOnerTvG05d2ko6s2yEFgGV6ieXc9McXfYo3HfW8+5kBv1f6zWAI
   78GG0WSogXeB07KO2amCFtpFhZ9+5ICJvT7Y5fbXQK8zV+TjN52cVm9rU
   c+VSCDD8wCBrZYjpuAeZ9cXwhOuES4W367A+kGqxXlOxGZiywlQBxV7YK
   wmbC3aw2cFtn0HV+ZJqw5T9Bo/v3E4CtzV+HZsgkR3Nb3dDZ20slJQfcv
   MaYQ4hGzSORIwqM+WYIB21XX1RX5ymwW9b4NBaohFP+/xRAChUSIJOo2V
   w==;
X-CSE-ConnectionGUID: sOB5RvrOQjqIz4trDz0SIw==
X-CSE-MsgGUID: gK7w39D8QaaLcVm6WNmeVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88380970"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="88380970"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:06:56 -0700
X-CSE-ConnectionGUID: 6VGUvGFmTSKqC4T1i7QOCg==
X-CSE-MsgGUID: ea/fMNr9T5O/edghtNwhJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="228851094"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.21])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:06:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D64412053B;
	Mon, 13 Apr 2026 11:07:07 +0300 (EEST)
Date: Mon, 13 Apr 2026 11:07:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
Message-ID: <adykK0JxoIoZjWUT@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjWaqk9qO7CWM5W@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58640-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 9707E3E8D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the review.

On Fri, Apr 10, 2026 at 12:53:42PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:33PM +0300, Sakari Ailus wrote:
> > Introduce v4l2_subdev_get_frame_desc() in order to facilitate implementing
> > drivers that need frame descriptors. If the remote sub-device does not
> > support frame descriptors, v4l2_subdev_get_frame_desc() creates one (with
> > a single entry) opportunistically, thus avoiding the need to add frame
> > descriptor support to sensor drivers the device for which only generates a
> > single stream, or managing the situation on the caller side.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           | 20 ++++++
> >  2 files changed, 116 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 647587c0499a..40b28e070726 100644
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
> > @@ -2758,3 +2759,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
> >  #endif
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
> > +
> > +static int get_mipi_dt_for_mbus(u32 code)
> > +{
> > +	switch (code) {
> > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > +		return MIPI_CSI2_DT_RGB888;
> > +	case MEDIA_BUS_FMT_Y8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +		return MIPI_CSI2_DT_RAW8;
> > +	case MEDIA_BUS_FMT_Y10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +		return MIPI_CSI2_DT_RAW10;
> > +	case MEDIA_BUS_FMT_Y12_1X12:
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +		return MIPI_CSI2_DT_RAW12;
> > +	case MEDIA_BUS_FMT_Y14_1X14:
> > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +		return MIPI_CSI2_DT_RAW14;
> > +	case MEDIA_BUS_FMT_Y16_1X16:
> > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > +		return MIPI_CSI2_DT_RAW16;
> > +	case MEDIA_BUS_FMT_SBGGR20_1X20:
> > +	case MEDIA_BUS_FMT_SGBRG20_1X20:
> > +	case MEDIA_BUS_FMT_SGRBG20_1X20:
> > +	case MEDIA_BUS_FMT_SRGGB20_1X20:
> > +		return MIPI_CSI2_DT_RAW20;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_frame_desc *desc)
> > +{
> > +	struct v4l2_subdev_format subdev_fmt = {
> > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > +		.pad = pad,
> > +	};
> > +	int ret;
> > +
> > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > +		unsigned int type = desc->type;
> > +
> > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > +
> > +		if (desc->type != type)
> > +			return -EINVAL;
> > +
> > +		return ret;
> > +	}
> > +
> > +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> > +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > +		return -EINVAL;
> > +
> > +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
> > +			       &subdev_fmt);
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
> > +		dt = get_mipi_dt_for_mbus(subdev_fmt.format.code);
> > +		if (dt < 0)
> > +			return dt;
> > +
> > +		entry.bus.csi2.dt = dt;
> > +	}
> > +
> > +	desc->entry[0] = entry;
> > +	desc->num_entries = 1;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 4588992b4417..93b672edd08e 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -2058,4 +2058,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> >   */
> >  bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
> >
> > +/**
> > + * v4l2_subdev_get_frame_desc() - Get a pad's frame descriptor
> > + * @sd: The sub-device
> > + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> > + * @desc: A pointer to a frame descriptor, with its type field set
> > + *
> > + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> > + * get_frame_desc pad operation, its result is returned, just like calling it
> > + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> > + * it, then one containing a single entry is created using the information from
> > + * the sub-device active state, which this function locks for the duration of
> > + * the call to obtain it.
> 
> This doesn't seem to apply anymore...

I'll rephrase it.

> 
> > + *
> > + * The caller is required to set @desc->type to the expected bus type.
> 
> Is it worth mentioning that only V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL
> and V4L2_MBUS_FRAME_DESC_TYPE_CSI2 are supported ?

I'll add that.

> 
> 
> > + *
> > + * Return: %0 on success or negative error code on failure.
> > + */
> > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_frame_desc *desc);
> 
> With the documentation addressed
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

-- 
Kind regards,

Sakari Ailus

