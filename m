Return-Path: <linux-media+bounces-9088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 656418A0B66
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 10:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1F3285CB0
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 08:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553901448D0;
	Thu, 11 Apr 2024 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiOod2CZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214813CF92
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712824437; cv=none; b=pmlxh9yzNH2jMSXZow9tpNoO7F0+CtmmWAqzs53OlVd44RJdcCTVXPCIw9emsJBw6yjLVGNmaR9JPcfzE2uG4pKyfggZn7akuh7Itg9aunuNfCNhxYzTkHkac/D+SYpJ72bDz012rL9C1F75dhhoBIigaf33AQ6YZDdqIiOMmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712824437; c=relaxed/simple;
	bh=BByt8eipEHuQjwgg7ug7c5NbP6csN7WTabwodV6Cyqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AniIEvs/QdwQjNR8NLZty/P4KxLvwGR6J0O+5M7Rxfa31zN0cIn2Xh2dFEReQ6KHTv+yLR1eCvxWh+NE2kokkGxzNSR4WJ/RUiSuKoIkre/HhHGjbJAuT9zpPRmHD4vn5YktBo5tYK4WAG3/Nmiu91Ag15FZS4G4Hm5rdk3pblE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiOod2CZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712824436; x=1744360436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BByt8eipEHuQjwgg7ug7c5NbP6csN7WTabwodV6Cyqc=;
  b=fiOod2CZwjJRLjYUt+xXANksWY8X23rUHLG7i8X2oN+sOblatnhEzsBg
   Jc9RmVviKQrHKqqtVdNdlkflwm0C3z4LdJ3OycTNHUFS4u42KLq1UmgQw
   XiWt8652sDennYHfPt0GmMdR9LYlQBIYo1O3jDsE/MrarYiazyEkW4GvC
   vZiXmfcsM5HOAiYb+zulKzEXIDYQtac1YhP2rO1XEdE0rqmKN+iFjBZAq
   PH2a06Vdow8TOzRHrdyUvFkf/Dq197hta4Zw+NoxYmg5IbtOz3mkgWRdz
   doUcgeo8paFlXqgGxoIbRntDOEMSacgyf2woXjmAhbpnmYCxg9Y1ZfrVM
   A==;
X-CSE-ConnectionGUID: BcjZKQf2Ql+PPCw9j17MLQ==
X-CSE-MsgGUID: 2gSEM7rNTVy/eGw+xbPPYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8348366"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8348366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:33:56 -0700
X-CSE-ConnectionGUID: RMVEO68MQoGNy/GJUONWig==
X-CSE-MsgGUID: ycxU+cYrRhaaJDHkU7BLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25314324"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:33:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6776912035C;
	Thu, 11 Apr 2024 11:33:50 +0300 (EEST)
Date: Thu, 11 Apr 2024 08:33:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 22/38] media: ccs: Support frame descriptors
Message-ID: <Zhegbln1EfUEKROU@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-23-sakari.ailus@linux.intel.com>
 <20240321164448.GC9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321164448.GC9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 06:44:48PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> On Wed, Mar 13, 2024 at 09:25:00AM +0200, Sakari Ailus wrote:
> > Provide information on the frame layout using frame descriptors.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c  | 60 +++++++++++++++++++++++++++++++
> >  drivers/media/i2c/ccs/ccs-quirk.h |  7 ++++
> >  drivers/media/i2c/ccs/ccs.h       |  4 +++
> >  3 files changed, 71 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 0efbc63534bc..9cc2080b73ec 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/smiapp.h>
> >  #include <linux/v4l2-mediabus.h>
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-cci.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -245,6 +246,33 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
> >  	return ret;
> >  }
> >  
> > +static u8 ccs_mipi_csi2_data_type(unsigned int bpp)
> > +{
> > +	switch (bpp) {
> > +	case 6:
> > +		return MIPI_CSI2_DT_RAW6;
> > +	case 7:
> > +		return MIPI_CSI2_DT_RAW7;
> > +	case 8:
> > +		return MIPI_CSI2_DT_RAW8;
> > +	case 10:
> > +		return MIPI_CSI2_DT_RAW10;
> > +	case 12:
> > +		return MIPI_CSI2_DT_RAW12;
> > +	case 14:
> > +		return MIPI_CSI2_DT_RAW14;
> > +	case 16:
> > +		return MIPI_CSI2_DT_RAW16;
> > +	case 20:
> > +		return MIPI_CSI2_DT_RAW20;
> > +	case 24:
> > +		return MIPI_CSI2_DT_RAW24;
> > +	default:
> > +		WARN_ON(1);
> > +		return 0;
> > +	}
> > +}
> > +
> >  static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > @@ -2632,6 +2660,37 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
> >  	return ret;
> >  }
> >  
> > +static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> > +				 struct v4l2_mbus_frame_desc *desc)
> > +{
> > +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> > +
> > +	if (ccs_has_quirk(sensor, frame_desc))
> > +		return ccs_call_quirk(sensor, frame_desc, desc);
> 
> I would introduce the quirk later, along with the patch that will use
> it.

There is no user for this quirk in the series. It's been added for quirk
infrastructure completeness, I guess I can move it in a separate patch and
postpone that.

> 
> > +
> > +	switch (sensor->hwcfg.csi_signalling_mode) {
> > +	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
> > +	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
> > +		desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +		break;
> > +	default:
> > +		/* FIXME: CCP2 support */
> > +		return -EINVAL;
> > +	}
> > +
> > +	entry->pixelcode = sensor->csi_format->code;
> > +	entry->stream = CCS_STREAM_PIXEL;
> > +	entry->bus.csi2.dt =
> > +		sensor->csi_format->width == sensor->csi_format->compressed ?
> > +		ccs_mipi_csi2_data_type(sensor->csi_format->compressed) :
> 
> Functionally equivalent,
> 
> 		ccs_mipi_csi2_data_type(sensor->csi_format->width) :
> 
> would be clearer I think. The way it's written today made me wonder why
> you want the DT for the compressed format, which is not what you're
> doing.

Sounds good.

> 
> > +		CCS_DEFAULT_COMPRESSED_DT;
> > +	entry++;
> > +	desc->num_entries++;
> > +
> > +	return 0;
> > +}
> > +
> >  static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
> >  {
> >  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> > @@ -3054,6 +3113,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
> >  	.set_selection = ccs_set_selection,
> >  	.enable_streams = ccs_enable_streams,
> >  	.disable_streams = ccs_disable_streams,
> > +	.get_frame_desc = ccs_get_frame_desc,
> >  };
> >  
> >  static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
> > diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
> > index 392c97109617..3e1d9eaa33fa 100644
> > --- a/drivers/media/i2c/ccs/ccs-quirk.h
> > +++ b/drivers/media/i2c/ccs/ccs-quirk.h
> > @@ -36,6 +36,7 @@ struct ccs_sensor;
> >   *			 access may be done by the caller (default read
> >   *			 value is zero), else negative error code on error
> >   * @flags: Quirk flags
> > + * @frame_desc: Obtain the frame descriptor
> >   */
> >  struct ccs_quirk {
> >  	int (*limits)(struct ccs_sensor *sensor);
> > @@ -46,6 +47,8 @@ struct ccs_quirk {
> >  	int (*init)(struct ccs_sensor *sensor);
> >  	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
> >  			  u32 *val);
> > +	int (*frame_desc)(struct ccs_sensor *sensor,
> > +			  struct v4l2_mbus_frame_desc *desc);
> >  	unsigned long flags;
> >  };
> >  
> > @@ -62,6 +65,10 @@ struct ccs_reg_8 {
> >  		.val = _val,		\
> >  	}
> >  
> > +#define ccs_has_quirk(sensor, _quirk)					\
> > +	((sensor)->minfo.quirk &&					\
> > +	 (sensor)->minfo.quirk->_quirk)
> > +
> >  #define ccs_call_quirk(sensor, _quirk, ...)				\
> >  	((sensor)->minfo.quirk &&					\
> >  	 (sensor)->minfo.quirk->_quirk ?				\
> > diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> > index 4725e6eca8d0..adb152366ea2 100644
> > --- a/drivers/media/i2c/ccs/ccs.h
> > +++ b/drivers/media/i2c/ccs/ccs.h
> > @@ -46,6 +46,8 @@
> >  
> >  #define CCS_COLOUR_COMPONENTS		4
> >  
> > +#define CCS_DEFAULT_COMPRESSED_DT	0x30
> 
> I'd write
> 
> #define CCS_DEFAULT_COMPRESSED_DT	MIPI_CSI2_DT_USER_DEFINED(0)

Yes.

> 
> > +
> >  #define SMIAPP_NAME			"smiapp"
> >  #define CCS_NAME			"ccs"
> >  
> > @@ -175,6 +177,8 @@ struct ccs_csi_data_format {
> >  #define CCS_PAD_SRC			1
> >  #define CCS_PADS			2
> >  
> > +#define CCS_STREAM_PIXEL		0
> > +
> >  struct ccs_binning_subtype {
> >  	u8 horizontal:4;
> >  	u8 vertical:4;
> 

-- 
Sakari Ailus

