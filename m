Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C468E31B5C5
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 08:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBOH4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 02:56:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:57390 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229595AbhBOH4t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 02:56:49 -0500
IronPort-SDR: OR2c4J+fmCZ6uTwHotjG3hk+YgRJSXX2umD0lQGjWfLTOe/ArOfvRBxrRIlOLm1YAD7xUwmsr7
 2sYe7R9bsR3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="201802744"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="201802744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2021 23:55:02 -0800
IronPort-SDR: 6nlQnEXC7XqA8uKaFF7TbbIwnV1mu+mqQDUWz7JHhZIgTFnkLZ16hOqezpEALWMKQZ2JZ+iRD5
 Vu5tBtSL5XGA==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="424165919"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2021 23:55:01 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id CEF0D20345;
        Mon, 15 Feb 2021 09:54:28 +0200 (EET)
Date:   Mon, 15 Feb 2021 09:54:28 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ipu3-cio2: Use v4l2_get_link_freq helper
Message-ID: <20210215075428.GF3@paasikivi.fi.intel.com>
References: <20201013153633.31022-3-sakari.ailus@linux.intel.com>
 <20201014083015.9074-1-sakari.ailus@linux.intel.com>
 <YCm8Z/8MMYv1vh4t@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCm8Z/8MMYv1vh4t@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Feb 15, 2021 at 02:12:23AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Replying to an old thread.
> 
> On Wed, Oct 14, 2020 at 11:30:15AM +0300, Sakari Ailus wrote:
> > Use v4l2_get_link_freq helper and add support for sensor drivers
> > implementing only V4L2_CID_PIXEL_RATE.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Use %lld for printing long long int
> > 
> > - Remove r (unused variable)
> > 
> >  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 34 +++++++++---------------
> >  1 file changed, 12 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > index c557d189200b..d060cfe473d8 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -33,6 +33,7 @@ struct ipu3_cio2_fmt {
> >  	u32 mbus_code;
> >  	u32 fourcc;
> >  	u8 mipicode;
> > +	u8 bpp;
> >  };
> >  
> >  /*
> > @@ -46,18 +47,22 @@ static const struct ipu3_cio2_fmt formats[] = {
> >  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
> >  		.fourcc		= V4L2_PIX_FMT_IPU3_SGRBG10,
> >  		.mipicode	= 0x2b,
> > +		.bpp		= 10,
> >  	}, {
> >  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
> >  		.fourcc		= V4L2_PIX_FMT_IPU3_SGBRG10,
> >  		.mipicode	= 0x2b,
> > +		.bpp		= 10,
> >  	}, {
> >  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
> >  		.fourcc		= V4L2_PIX_FMT_IPU3_SBGGR10,
> >  		.mipicode	= 0x2b,
> > +		.bpp		= 10,
> >  	}, {
> >  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
> >  		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
> >  		.mipicode	= 0x2b,
> > +		.bpp		= 10,
> >  	},
> >  };
> >  
> > @@ -288,35 +293,20 @@ static s32 cio2_rx_timing(s32 a, s32 b, s64 freq, int def)
> >  
> >  /* Calculate the the delay value for termination enable of clock lane HS Rx */
> >  static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
> > -				 struct cio2_csi2_timing *timing)
> > +				 struct cio2_csi2_timing *timing,
> > +				 unsigned int bpp, unsigned int lanes)
> >  {
> >  	struct device *dev = &cio2->pci_dev->dev;
> > -	struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
> > -	struct v4l2_ctrl *link_freq;
> >  	s64 freq;
> > -	int r;
> >  
> >  	if (!q->sensor)
> >  		return -ENODEV;
> >  
> > -	link_freq = v4l2_ctrl_find(q->sensor->ctrl_handler, V4L2_CID_LINK_FREQ);
> > -	if (!link_freq) {
> > -		dev_err(dev, "failed to find LINK_FREQ\n");
> > -		return -EPIPE;
> > -	}
> > -
> > -	qm.index = v4l2_ctrl_g_ctrl(link_freq);
> > -	r = v4l2_querymenu(q->sensor->ctrl_handler, &qm);
> > -	if (r) {
> > -		dev_err(dev, "failed to get menu item\n");
> > -		return r;
> > -	}
> > -
> > -	if (!qm.value) {
> > -		dev_err(dev, "error invalid link_freq\n");
> > -		return -EINVAL;
> > +	freq = v4l2_get_link_rate(q->sensor->ctrl_handler, bpp, lanes);
> 
> Shouldn't this use lanes * 2 ?

Yes, it should. Good catch!

I'll send a patch...

> 
> > +	if (freq < 0) {
> > +		dev_err(dev, "error %lld, invalid link_freq\n", freq);
> > +		return freq;
> >  	}
> > -	freq = qm.value;
> >  
> >  	timing->clk_termen = cio2_rx_timing(CIO2_CSIRX_DLY_CNT_TERMEN_CLANE_A,
> >  					    CIO2_CSIRX_DLY_CNT_TERMEN_CLANE_B,
> > @@ -364,7 +354,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
> >  
> >  	lanes = q->csi2.lanes;
> >  
> > -	r = cio2_csi2_calc_timing(cio2, q, &timing);
> > +	r = cio2_csi2_calc_timing(cio2, q, &timing, fmt->bpp, lanes);
> >  	if (r)
> >  		return r;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
