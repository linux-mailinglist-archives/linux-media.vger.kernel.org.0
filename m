Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8682A7F26
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgKEM4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:56:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:7001 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730519AbgKEM4K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:56:10 -0500
IronPort-SDR: 1xcVq2zYwBmExXhGnrL4sK6kHBeTvmi/osucP3405jlkKnBOw4Jla38NGgpuWU3N1ESCeq3JOC
 Y9mxwNKZb9yA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="149228430"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="149228430"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 04:55:51 -0800
IronPort-SDR: 9N6ctu8bGgZ1fi0PRSAkoH2F4UnsZJWsPpVghBdEsbQxkrgFeFJK7zQhn2MdhryGn6yE6yx6Wj
 jw0TPIZsvPRg==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="527952629"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 04:55:50 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CAB6F20901; Thu,  5 Nov 2020 14:55:48 +0200 (EET)
Date:   Thu, 5 Nov 2020 14:55:48 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 100/106] ccs: Add support for analogue gain
 coefficient controls
Message-ID: <20201105125548.GG26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-91-sakari.ailus@linux.intel.com>
 <074fd0e4-f16c-c2cd-1d30-f55a1993ad36@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074fd0e4-f16c-c2cd-1d30-f55a1993ad36@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the review!

On Thu, Nov 05, 2020 at 01:46:46PM +0100, Hans Verkuil wrote:
> On 07/10/2020 10:45, Sakari Ailus wrote:
> > Add four controls for reading CCS analogue gain coefficients. The
> > values are constants that are device specific.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 38 ++++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index d6d6aeceb415..2a507b63bafc 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/v4l2-mediabus.h>
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-device.h>
> > +#include <uapi/linux/ccs.h>
> >  
> >  #include "ccs.h"
> >  
> > @@ -772,14 +773,46 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> >  	int rval;
> >  
> > -	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 13);
> > +	rval = v4l2_ctrl_handler_init(&sensor->pixel_array->ctrl_handler, 17);
> >  	if (rval)
> >  		return rval;
> >  
> >  	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
> >  
> >  	switch (CCS_LIM(sensor, ANALOG_GAIN_CAPABILITY)) {
> > -	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL:
> > +	case CCS_ANALOG_GAIN_CAPABILITY_GLOBAL: {
> > +		struct {
> 
> Can this be static?

CCS_LIM(sensor, ...) translates to a value that is specific to a given
model of a camera sensor, it's not a constant.

> 
> > +			const char *name;
> > +			u32 id;
> > +			s32 value;
> > +		} const gain_ctrls[] = {
> > +			{ "Analogue Gain m0", V4L2_CID_CCS_ANALOGUE_GAIN_M0,
> 
> Why lower case 'm0/1' and 'c0/1'? It looks odd.

The spec uses lower case to refer to [cm][01].

I can use upper case if you prefer though.

> 
> > +			  CCS_LIM(sensor, ANALOG_GAIN_M0), },
> > +			{ "Analogue Gain c0", V4L2_CID_CCS_ANALOGUE_GAIN_C0,
> > +			  CCS_LIM(sensor, ANALOG_GAIN_C0), },
> > +			{ "Analogue Gain m1", V4L2_CID_CCS_ANALOGUE_GAIN_M1,
> > +			  CCS_LIM(sensor, ANALOG_GAIN_M1), },
> > +			{ "Analogue Gain c1", V4L2_CID_CCS_ANALOGUE_GAIN_C1,
> > +			  CCS_LIM(sensor, ANALOG_GAIN_C1), },
> > +		};
> > +		struct v4l2_ctrl_config ctrl_cfg = {
> > +			.type = V4L2_CTRL_TYPE_INTEGER,
> > +			.ops = &ccs_ctrl_ops,
> > +			.flags = V4L2_CTRL_FLAG_READ_ONLY,
> > +			.step = 1,
> > +		};
> 
> This looks a bit weird. Most drivers just define each control separately in
> a static const struct v4l2_ctrl_config, then add them with v4l2_ctrl_new_custom.
> 
> Now the control definition data is split up in two data structures.
> 
> It's not wrong, it is just non-standard, and a bit harder to review.
> 
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < ARRAY_SIZE(gain_ctrls); i++) {
> > +			ctrl_cfg.name = gain_ctrls[i].name;
> > +			ctrl_cfg.id = gain_ctrls[i].id;
> > +			ctrl_cfg.min = ctrl_cfg.max = ctrl_cfg.def =
> > +				gain_ctrls[i].value;
> > +
> > +			v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> > +					     &ctrl_cfg, NULL);
> > +		}
> > +
> >  		v4l2_ctrl_new_std(&sensor->pixel_array->ctrl_handler,
> >  				  &ccs_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> >  				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
> > @@ -788,6 +821,7 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
> >  				      1U),
> >  				  CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN));
> >  	}
> > +	}
> >  
> >  	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
> >  	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
> > 
> 

-- 
Regards,

Sakari Ailus
