Return-Path: <linux-media+bounces-9489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE08A659A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 10:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17C11F229E1
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 08:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA3113956A;
	Tue, 16 Apr 2024 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAPn1q+H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847A1804A
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713254498; cv=none; b=s5nF9aZ6dbxykoPBB3kZJOdutRB4Zn7d923iWTl9GN3pDQUuOATAXiQqDILOtgtAeCfKs49HuPK4Hotrb3m9TQSAKcte08eiKtbCUi7UxRzF72J/H8sqoVZ+m67sQGUDEBiuzLvt4jqFcFOR9kRh+AmGKrKXoYmTl9dVeWGrfJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713254498; c=relaxed/simple;
	bh=LHXXusQpRHa9PGArbV1pY7FY5GGV64qaK6jdcWS0JiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEufbvShKFw8qrl7kayPz0QIS/TRjNmOqk/nRTXQGLl5xahjdcuqS8/RV9xDEBc8wdUxmWiNgUxQwXw3WvAj8DVNnEikUg9XMiV2oImFZnn4LQiFI757mfU+XQcHFubJ9C4JA97hid6iuBg9r/5sELoHSfKHzpOWgYJaGLbF2E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAPn1q+H; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713254492; x=1744790492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHXXusQpRHa9PGArbV1pY7FY5GGV64qaK6jdcWS0JiM=;
  b=HAPn1q+HpqH3cfKeRTJ+WFj5RhpIzRCL+BvCfejs3KVVmnv8Jtd2gz4/
   eoltMYJiBlLHFBg8W/wMs3PysJAuRSM+G9kWRchC2yoyC573bDbaA+YCG
   4Dg3lm1urMl7zWPVp5C41H5YwYEagYAX7I1OVNCUaRwLeA7MaRJI5QzTz
   QZG1U5XBiXHi9eFHsQcQKI+yrBeCLl6P5kjYnNcVmcGMWHIXNYvIdIggI
   ZkEIEFliRKGK80FmFjHZoevVRfzAkgJ3RM24rm1PDS30lCb3IhaTtvBrA
   rb8Dp6CbjH4eSaq+h3a5z+TjFXVHR54sd/z7o3zj2ocN1FrEzYofgeavm
   w==;
X-CSE-ConnectionGUID: Uv/el07iTamggVZJKkZqNA==
X-CSE-MsgGUID: 6/LvbTYfThSTQwPVzRaczQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8538924"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8538924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 01:01:12 -0700
X-CSE-ConnectionGUID: 6tKq8YBGQUO5EDcaBW8O6Q==
X-CSE-MsgGUID: JmV6sBZ2TNShVyutl4ZBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22259230"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 01:01:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 44B5211FAB0;
	Tue, 16 Apr 2024 11:01:07 +0300 (EEST)
Date: Tue, 16 Apr 2024 08:01:07 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 27/38] media: ccs: Compute binning configuration from
 sub-device state
Message-ID: <Zh4wQ25i7dRQeVEJ@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-28-sakari.ailus@linux.intel.com>
 <20240321175707.GT9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321175707.GT9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 07:57:07PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:25:05AM +0200, Sakari Ailus wrote:
> > Calculate binning configuration from sub-device state so the state related
> > configuration can be removed from the driver's device context struct.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 72 ++++++++++++++++++++++----------
> >  drivers/media/i2c/ccs/ccs.h      |  3 --
> >  2 files changed, 49 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index a8c48abd2e30..3b80c54453cc 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -511,13 +511,52 @@ static int ccs_pll_try(struct ccs_sensor *sensor, struct ccs_pll *pll)
> >  	return ccs_pll_calculate(&client->dev, &lim, pll);
> >  }
> >  
> > +static void
> > +ccs_get_binning(struct ccs_sensor *sensor, u8 *binning_mode, u8 *binh, u8 *binv)
> > +{
> > +	struct v4l2_subdev_state *binner_state =
> > +		v4l2_subdev_get_locked_active_state(&sensor->binner->sd);
> > +	struct v4l2_rect *binner_sink_crop =
> > +		v4l2_subdev_state_get_crop(binner_state, CCS_PAD_SINK,
> > +					   CCS_STREAM_PIXEL);
> > +	struct v4l2_rect *binner_sink_comp =
> > +		v4l2_subdev_state_get_compose(binner_state, CCS_PAD_SINK,
> > +					      CCS_STREAM_PIXEL);
> 
> I like this patch very much :-) The comments I made to 28/28 apply there
> too.

I agree.

> 
> > +
> > +	if (binner_sink_crop->width == binner_sink_comp->width &&
> > +	    binner_sink_crop->height == binner_sink_comp->height) {
> > +		if (binning_mode)
> > +			*binning_mode = 0;
> > +
> > +		if (binh)
> > +			*binh = 1;
> > +
> > +		if (binv)
> > +			*binv = 1;
> > +
> > +		return;
> > +	}
> > +
> > +	if (binning_mode)
> > +		*binning_mode = 1;
> > +
> > +	if (binh)
> > +		*binh = binner_sink_crop->width / binner_sink_comp->width;
> > +
> > +	if (binv)
> > +		*binv = binner_sink_crop->height / binner_sink_comp->height;
> 
> binh and binv are never NULL. How about the following ?
> 
> 	if (binning_mode)
> 		*binning_mode = sink_crop->width != sink_comp->width ||
> 				sink_crop->height != sink_comp->height;

The binning mode should use CCS register macros which for some reason
appear to be absent on the binning registers. The others have them.

> 
> 	*binh = sink_crop->width / sink_comp->width;
> 	*binv = sink_crop->height / sink_comp->height;

Yes.

> 
> > +}
> > +
> >  static int ccs_pll_update(struct ccs_sensor *sensor)
> >  {
> >  	struct ccs_pll *pll = &sensor->pll;
> > +	u8 binh, binv;
> >  	int rval;
> >  
> > -	pll->binning_horizontal = sensor->binning_horizontal;
> > -	pll->binning_vertical = sensor->binning_vertical;
> > +	ccs_get_binning(sensor, NULL, &binh, &binv);
> > +
> > +	pll->binning_horizontal = binh;
> > +	pll->binning_vertical = binv;
> >  	pll->link_freq =
> >  		sensor->link_freq->qmenu_int[sensor->link_freq->val];
> >  	pll->scale_m = sensor->scale_m;
> > @@ -1241,8 +1280,11 @@ static void ccs_update_blanking(struct ccs_sensor *sensor,
> >  	struct v4l2_ctrl *hblank = sensor->hblank;
> >  	u16 min_fll, max_fll, min_llp, max_llp, min_lbp;
> >  	int min, max;
> > +	u8 binh, binv;
> > +
> > +	ccs_get_binning(sensor, NULL, &binh, &binv);
> >  
> > -	if (sensor->binning_vertical > 1 || sensor->binning_horizontal > 1) {
> > +	if (binv > 1 || binh > 1) {
> >  		min_fll = CCS_LIM(sensor, MIN_FRAME_LENGTH_LINES_BIN);
> >  		max_fll = CCS_LIM(sensor, MAX_FRAME_LENGTH_LINES_BIN);
> >  		min_llp = CCS_LIM(sensor, MIN_LINE_LENGTH_PCK_BIN);
> > @@ -1813,7 +1855,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  		v4l2_subdev_state_get_crop(src_state, CCS_PAD_SRC,
> >  					   CCS_STREAM_PIXEL);
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > -	unsigned int binning_mode;
> > +	u8 binning_mode, binh, binv;
> >  	int rval;
> >  
> >  	if (pad != CCS_PAD_SRC)
> > @@ -1835,19 +1877,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
> >  		goto err_pm_put;
> >  
> >  	/* Binning configuration */
> > -	if (sensor->binning_horizontal == 1 &&
> > -	    sensor->binning_vertical == 1) {
> > -		binning_mode = 0;
> > -	} else {
> > -		u8 binning_type =
> > -			(sensor->binning_horizontal << 4)
> > -			| sensor->binning_vertical;
> > +	ccs_get_binning(sensor,	&binning_mode, &binh, &binv);
> >  
> > -		rval = ccs_write(sensor, BINNING_TYPE, binning_type);
> > +	if (binning_mode) {
> > +		rval = ccs_write(sensor, BINNING_TYPE, (binh << 4) | binv);
> >  		if (rval < 0)
> >  			goto err_pm_put;
> > -
> > -		binning_mode = 1;
> >  	}
> >  	rval = ccs_write(sensor, BINNING_MODE, binning_mode);
> >  	if (rval < 0)
> > @@ -2253,9 +2288,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
> >  				sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
> >  				sensor->scaling_mode =
> >  					CCS_SCALING_MODE_NO_SCALING;
> > -			} else if (ssd == sensor->binner) {
> > -				sensor->binning_horizontal = 1;
> > -				sensor->binning_vertical = 1;
> >  			}
> >  		}
> >  		fallthrough;
> > @@ -2529,10 +2561,6 @@ static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
> >  			best = this;
> >  		}
> >  	}
> > -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -		sensor->binning_vertical = binv;
> > -		sensor->binning_horizontal = binh;
> > -	}
> >  
> >  	sel->r.width = (sink_crop->width / binh) & ~1;
> >  	sel->r.height = (sink_crop->height / binv) & ~1;
> > @@ -3721,8 +3749,6 @@ static int ccs_probe(struct i2c_client *client)
> >  				sensor->binning_subtypes[i].vertical);
> >  		}
> >  	}
> > -	sensor->binning_horizontal = 1;
> > -	sensor->binning_vertical = 1;
> >  
> >  	if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
> >  		dev_err(&client->dev, "sysfs ident entry creation failed\n");
> > diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> > index a2a461cda338..e6fc00a9fa11 100644
> > --- a/drivers/media/i2c/ccs/ccs.h
> > +++ b/drivers/media/i2c/ccs/ccs.h
> > @@ -237,9 +237,6 @@ struct ccs_sensor {
> >  	u32 embedded_mbus_code;
> >  	u8 emb_data_ctrl;
> >  
> > -	u8 binning_horizontal;
> > -	u8 binning_vertical;
> > -
> >  	u8 scale_m;
> >  	u8 scaling_mode;
> >  
> 

-- 
Regards,

Sakari Ailus

