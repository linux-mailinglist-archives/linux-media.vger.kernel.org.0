Return-Path: <linux-media+bounces-59215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ9YAI5r52ke8AEAu9opvQ
	(envelope-from <linux-media+bounces-59215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:20:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632043A8E1
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 14:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE2630238F5
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4783A3BD651;
	Tue, 21 Apr 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJFjY9Ol"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154672C234E
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773918; cv=none; b=nb7mCb4+r7G/POu5Ce4T797CUUdh3PzBGDAmtk7gcwfT8D2lsQWiWB2qriFbKhFy9+3/9V6qOXrc6gFVMRu8Maw6ah0SCjFv/2Rh1HQMhs8Vrds/+06Fq7v+/dHzCFF5OfBv7GPmtjixXIrOq/qQMPR9rfkGI/gkDVKBCcBMUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773918; c=relaxed/simple;
	bh=HWqKQ6wDM6ivxgyLgvtqPTO78kh+Ylt0E6l7nSWDR80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjghPaEwmZj/RkhVZU43N4U0WbDglYmM8aVdtrw6XSg4GIoV5B/Z1X9EtvPQBCBdwGWOpiniH4tUokzrgSxv0t6vFPSYUL7tcJAkZ352omrJXgQAao4tBSsY67goTQK3cjUsEA9G8Qq5sZxIhKESdSr1gznanq+aUiiSa9RerRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJFjY9Ol; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776773916; x=1808309916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HWqKQ6wDM6ivxgyLgvtqPTO78kh+Ylt0E6l7nSWDR80=;
  b=fJFjY9OlFGmM325OIPzcmUT7C2wqLLLyFdhZ79DaJNpx15mRoX3xCOEL
   LgewFteSY2qF8kFEsSZq7rxECD0FP9cAbqtUTd+azqxKUxvV6NyKgVMYT
   6x8IoHCCgCC86qv5EZ1Jlg59r2fVOtrkygbiSkUKTl9vka+J3x5RiYuX2
   FBCKCcisttDHzrZFS3yxW7JDS7P7nFy4eS6JhCBVILJGOxwivmTPY1IIU
   vqW62eqGbD/vVm4pppAZw/kxpRx95ihrht3fFwe77BnAFj308HUxP1Ryf
   kRLopHB/wU8Frl2TWtzN450aZSpEEI6UzWIAPP3ci4KlGFFi8d+nkQtyj
   g==;
X-CSE-ConnectionGUID: g5TNRh1WQVi60xhrYkkFbg==
X-CSE-MsgGUID: IrgaLFg+S/2ni2na+sHRPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77718689"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77718689"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:18:35 -0700
X-CSE-ConnectionGUID: brtWEtFFQyGB6OYqfDX+4A==
X-CSE-MsgGUID: B13aF3YqSCeu8T9M0qtTtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255285982"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:18:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D425C120D05;
	Tue, 21 Apr 2026 15:18:26 +0300 (EEST)
Date: Tue, 21 Apr 2026 15:18:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
Message-ID: <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416161654.GC1823068@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-59215-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 3632043A8E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Thu, Apr 16, 2026 at 07:16:54PM +0300, Laurent Pinchart wrote:
> On Mon, Apr 13, 2026 at 11:07:07AM +0300, Sakari Ailus wrote:
> > On Fri, Apr 10, 2026 at 12:53:42PM +0200, Jacopo Mondi wrote:
> > > On Wed, Apr 08, 2026 at 06:39:33PM +0300, Sakari Ailus wrote:
> > > > Introduce v4l2_subdev_get_frame_desc() in order to facilitate implementing
> > > > drivers that need frame descriptors. If the remote sub-device does not
> > > > support frame descriptors, v4l2_subdev_get_frame_desc() creates one (with
> > > > a single entry) opportunistically, thus avoiding the need to add frame
> > > > descriptor support to sensor drivers the device for which only generates a
> 
> s/the device for which/whose device/

I guess that'd work, too.

> 
> I think all sensor drivers should implement .get_frame_desc(), possibly
> with a helper.

Is there a need to? It's largely just extra churn for more than 80 drivers
-- this can also be extended to cover routes so few of these drivers would
in the end need anything driver-specific. But the option for that needs to
remain.

> 
> > > > single stream, or managing the situation on the caller side.
> 
> That part I agree with, we currently need to manage the situation on the
> caller side because not all subdevs implement the operation. That will
> still be the case for a while, so this helper is useful.
> 
> Can you also replace manual calls to .get_frame_desc() with the helper ?
> Some of the existing callers implement fallbacks, I fonud them at least
> in
> 
> drivers/media/platform/broadcom/bcm2835-unicam.c
> drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> drivers/media/platform/ti/cal/cal.c
> 
> (directly in the function that calls .get_frame_desc(), or in its
> caller)
> 
> Replacing those will ensure the helper works as expected.

Sure. I'll add more patches for that.

> 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++
> > > >  include/media/v4l2-subdev.h           | 20 ++++++
> > > >  2 files changed, 116 insertions(+)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index 647587c0499a..40b28e070726 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -20,6 +20,7 @@
> > > >  #include <linux/version.h>
> > > >  #include <linux/videodev2.h>
> > > >
> > > > +#include <media/mipi-csi2.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > >  #include <media/v4l2-device.h>
> > > >  #include <media/v4l2-event.h>
> > > > @@ -2758,3 +2759,98 @@ void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
> > > >  #endif
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
> > > > +
> > > > +static int get_mipi_dt_for_mbus(u32 code)
> 
> v4l2_subdev_get_mipi_dt_for_mbus()
> 
> Or move the function to v4l2-common.c, name it mipi_csi2_dt_for_mbus()
> and declare it in include/media/mipi-csi2.h.

How about calling it mipi_csi2_dt_for_mbus()? I think it can be located in
v4l2-common.c for now, no need to add a separate file just for this; all
users would effectively be related to V4L2 anyway.

> 
> > > > +{
> > > > +	switch (code) {
> > > > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > > > +		return MIPI_CSI2_DT_RGB888;
> > > > +	case MEDIA_BUS_FMT_Y8_1X8:
> > > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > +		return MIPI_CSI2_DT_RAW8;
> > > > +	case MEDIA_BUS_FMT_Y10_1X10:
> > > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > +		return MIPI_CSI2_DT_RAW10;
> > > > +	case MEDIA_BUS_FMT_Y12_1X12:
> > > > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > > > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > > > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > > > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > > +		return MIPI_CSI2_DT_RAW12;
> > > > +	case MEDIA_BUS_FMT_Y14_1X14:
> > > > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > > > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > > > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > > > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > > > +		return MIPI_CSI2_DT_RAW14;
> > > > +	case MEDIA_BUS_FMT_Y16_1X16:
> > > > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> > > > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > > > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > > > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > > > +		return MIPI_CSI2_DT_RAW16;
> > > > +	case MEDIA_BUS_FMT_SBGGR20_1X20:
> > > > +	case MEDIA_BUS_FMT_SGBRG20_1X20:
> > > > +	case MEDIA_BUS_FMT_SGRBG20_1X20:
> > > > +	case MEDIA_BUS_FMT_SRGGB20_1X20:
> > > > +		return MIPI_CSI2_DT_RAW20;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +}
> > > > +
> > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > +{
> > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > +		.pad = pad,
> > > > +	};
> > > > +	int ret;
> > > > +
> > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > +		unsigned int type = desc->type;
> > > > +
> > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > +
> > > > +		if (desc->type != type)
> > > > +			return -EINVAL;
> 
> I'd add a dev_err() here. There are .get_frame_desc() callers that check
> if the returned type matches what they expect and log an error
> otherwise. When using this helper the check can't be performed in the
> callera any more, leading to possibly hard to debug issues if no message
> is printed.

dev_err_once()?

> 
> > > > +
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (desc->type != V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> > > > +	    desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> > > > +		return -EINVAL;
> > > > +
> > > > +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, NULL,
> > > > +			       &subdev_fmt);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	struct v4l2_mbus_frame_desc_entry entry = {
> > > > +		.pixelcode = subdev_fmt.format.code,
> > > > +	};
> > > > +
> > > > +	if (desc->type == V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
> > > > +		int dt;
> > > > +
> > > > +		dt = get_mipi_dt_for_mbus(subdev_fmt.format.code);
> > > > +		if (dt < 0)
> > > > +			return dt;
> > > > +
> > > > +		entry.bus.csi2.dt = dt;
> > > > +	}
> > > > +
> > > > +	desc->entry[0] = entry;
> > > > +	desc->num_entries = 1;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(v4l2_subdev_get_frame_desc);
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index 4588992b4417..93b672edd08e 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -2058,4 +2058,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
> > > >   */
> > > >  bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
> > > >
> > > > +/**
> > > > + * v4l2_subdev_get_frame_desc() - Get a pad's frame descriptor
> > > > + * @sd: The sub-device
> > > > + * @pad: The number of the pad in @sd from which to obtain the frame descriptor
> > > > + * @desc: A pointer to a frame descriptor, with its type field set
> > > > + *
> > > > + * Obtain a frame descriptor from a sub-device. If the sub-device supports the
> > > > + * get_frame_desc pad operation, its result is returned, just like calling it
> > > > + * directly using v4l2_subdev_call(). If the sub-device driver does not support
> > > > + * it, then one containing a single entry is created using the information from
> 
> s/one /a frame descriptor/

Yes.

> 
> > > > + * the sub-device active state, which this function locks for the duration of
> > > > + * the call to obtain it.
> > > 
> > > This doesn't seem to apply anymore...
> > 
> > I'll rephrase it.
> > 
> > > > + *
> > > > + * The caller is required to set @desc->type to the expected bus type.
> > > 
> > > Is it worth mentioning that only V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL
> > > and V4L2_MBUS_FRAME_DESC_TYPE_CSI2 are supported ?
> > 
> > I'll add that.
> > 
> > > > + *
> > > > + * Return: %0 on success or negative error code on failure.
> > > > + */
> > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > +			       struct v4l2_mbus_frame_desc *desc);
> > > 
> > > With the documentation addressed
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 

-- 
Kind regards,

Sakari Ailus

