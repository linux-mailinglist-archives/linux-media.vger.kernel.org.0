Return-Path: <linux-media+bounces-42902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4269B8F55F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691FD3AD8FA
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0D62F39D3;
	Mon, 22 Sep 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehOj90S/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C3182B4
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527330; cv=none; b=qNzqN1vn6Bk7rXmgZ25yFg+VBvvbekcwoKMlvHTnk7wXcEA7VdGAMtro7q+ivz5yf0yFsvoBemr7x+f8SK+vxPAf5QVBDDPXwgUsjl1TsXCSs9J03dsSNujCu1K+vUm4eYjjVO8vNy51Kdjho5anNa6TQkxgbxNWqPABakg3YZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527330; c=relaxed/simple;
	bh=AvpiV4p2BJeYXPBD0Zij94MowSn4kS6yoFJWuiGfoTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu+goUuhJ+RpD3zF8Ff+yrD5BCA91M8bssZ2TcxFbdj7MYf8IKkEw7M4UTfCtGVrN/AyKM2NxG4SsWCFsjv7WB8z5gfp1EQ3PPxu/8ZG9JGRzZtDl7QiAHUQDLOWxW/OLT8lR8noPxlKOjdmWruDqKFvXs2jAsNcO3dNrYiWtU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehOj90S/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758527329; x=1790063329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvpiV4p2BJeYXPBD0Zij94MowSn4kS6yoFJWuiGfoTI=;
  b=ehOj90S/QwQbaDowfQV2nad864Z1jWKepmaB6kOAu4ust7nh7YAKl7Lv
   qyMMh+djuswntJpWr/F5FtI+bQ/XI6njmQEndEE6Juspb/9dEebX4AO9t
   VJ8F+PPjdSskDDB8NtMpGoa/5zkNVJptwhxzu4Yau748TTsLvcmgQ3fJr
   5J9S/9h2e8KKHtiFj+1QrkSVURRGLZYEEck2NhPi+7X9/y+nM2HQ321nG
   1VZqr6sosetY8xloSgCj/+R+zOCgo202WE8Hdcix3TOj+i0iQSVejwCG2
   2PbyjDKwpDAijJrqS+4F64sXsT8k0FM0/qskSwr6GFGJ/gdJkAovDMIqd
   w==;
X-CSE-ConnectionGUID: 2i9BrQCqRYW0gHrTicXItA==
X-CSE-MsgGUID: QzrjCZ5lQ5SWBRSvHtNyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="83386899"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="83386899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:48:49 -0700
X-CSE-ConnectionGUID: xN78UYxzTDOpWRJYzkq7wA==
X-CSE-MsgGUID: ypJNpdbER3WW6X2QheM7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="213559199"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:48:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 673BD1202BC;
	Mon, 22 Sep 2025 10:48:38 +0300 (EEST)
Date: Mon, 22 Sep 2025 10:48:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
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
Subject: Re: [PATCH v11 32/66] media: ccs: Rely on sub-device state locking
Message-ID: <aND_VmKzxbkI64NV@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-33-sakari.ailus@linux.intel.com>
 <20250903205644.GX3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903205644.GX3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 10:56:44PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Aug 25, 2025 at 12:50:33PM +0300, Sakari Ailus wrote:
> > Rely on sub-device state locking to serialise access to driver's data
> > structures. The driver-provided mutex is used as the state lock for all
> > driver sub-devices.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 187 +++++++++++++------------------
> >  drivers/media/i2c/ccs/ccs.h      |   1 -
> >  2 files changed, 79 insertions(+), 109 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 0f0588e0c2da..2d2ae568739b 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -541,12 +541,13 @@ static int ccs_pll_update(struct ccs_sensor *sensor)
> >   *
> >   */
> >  
> > -static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
> > +static void __ccs_update_exposure_limits(struct ccs_sensor *sensor,
> > +					 struct v4l2_rect *pa_src)
> 
> This can be const.
> 
> >  {
> >  	struct v4l2_ctrl *ctrl = sensor->exposure;
> >  	int max;
> >  
> > -	max = sensor->pa_src.height + sensor->vblank->val -
> > +	max = pa_src->height + sensor->vblank->val -
> >  		CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
> >  
> >  	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max, ctrl->step, max);
> > @@ -649,12 +650,20 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
> >  			->sensor;
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> > +	struct v4l2_subdev_state *state;
> > +	struct v4l2_rect *pa_src;
> >  	int pm_status;
> >  	u32 orient = 0;
> >  	unsigned int i;
> >  	int exposure;
> >  	int rval;
> >  
> > +	if (ctrl->id == V4L2_CID_VBLANK || ctrl->id == V4L2_CID_HBLANK) {
> > +		state = v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> > +		pa_src = v4l2_subdev_state_get_crop(state, CCS_PA_PAD_SRC,
> > +						    CCS_STREAM_PIXEL);
> > +	}
> > +
> >  	switch (ctrl->id) {
> >  	case V4L2_CID_HFLIP:
> >  	case V4L2_CID_VFLIP:
> > @@ -673,7 +682,7 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_VBLANK:
> >  		exposure = sensor->exposure->val;
> >  
> > -		__ccs_update_exposure_limits(sensor);
> > +		__ccs_update_exposure_limits(sensor, pa_src);
> >  
> >  		if (exposure > sensor->exposure->maximum) {
> >  			sensor->exposure->val =	sensor->exposure->maximum;
> > @@ -765,12 +774,12 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	case V4L2_CID_VBLANK:
> >  		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
> > -				 sensor->pa_src.height + ctrl->val);
> > +				 pa_src->height + ctrl->val);
> >  
> >  		break;
> >  	case V4L2_CID_HBLANK:
> >  		rval = ccs_write(sensor, LINE_LENGTH_PCK,
> > -				 sensor->pa_src.width + ctrl->val);
> > +				 pa_src->width + ctrl->val);
> >  
> >  		break;
> >  	case V4L2_CID_TEST_PATTERN:
> > @@ -1242,7 +1251,8 @@ static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
> >  	return 0;
> >  }
> >  
> > -static void ccs_update_blanking(struct ccs_sensor *sensor)
> > +static void ccs_update_blanking(struct ccs_sensor *sensor,
> > +				struct v4l2_rect *pa_src)
> 
> Same here.
> 
> >  {
> >  	struct v4l2_ctrl *vblank = sensor->vblank;
> >  	struct v4l2_ctrl *hblank = sensor->hblank;
> > @@ -1265,21 +1275,26 @@ static void ccs_update_blanking(struct ccs_sensor *sensor)
> >  
> >  	min = max_t(int,
> >  		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
> > -		    min_fll - sensor->pa_src.height);
> > -	max = max_fll -	sensor->pa_src.height;
> > +		    min_fll - pa_src->height);
> > +	max = max_fll -	pa_src->height;
> >  
> >  	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
> >  
> > -	min = max_t(int, min_llp - sensor->pa_src.width, min_lbp);
> > -	max = max_llp - sensor->pa_src.width;
> > +	min = max_t(int, min_llp - pa_src->width, min_lbp);
> > +	max = max_llp - pa_src->width;
> >  
> >  	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
> >  
> > -	__ccs_update_exposure_limits(sensor);
> > +	__ccs_update_exposure_limits(sensor, pa_src);
> >  }
> >  
> >  static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
> >  {
> > +	struct v4l2_subdev_state *state =
> > +		v4l2_subdev_get_locked_active_state(&sensor->pixel_array->sd);
> 
> As one of the callers (ccs_set_compose()) already has a state pointer, I
> would pass it to this function.

It's the sub-device state of a different sub-device.

> 
> > +	struct v4l2_rect *pa_src =
> 
> const
> 
> I now realize you seem to have missed my review of v9. Please take all
> the comments from there into account for v12.

Apologies for this; I seem to have missed some patches. I'll get back to
those now.

-- 
Regards,

Sakari Ailus

