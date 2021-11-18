Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB02945616D
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 18:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbhKRR3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 12:29:18 -0500
Received: from mga11.intel.com ([192.55.52.93]:23277 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231562AbhKRR3Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 12:29:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="231724161"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="231724161"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 09:26:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="550618531"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 09:26:14 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 523BC202B4;
        Thu, 18 Nov 2021 19:26:12 +0200 (EET)
Date:   Thu, 18 Nov 2021 19:26:12 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Eugen Hristev <eugen.hristev@microchip.com>,
        leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx274: implement enum_mbus_code
Message-ID: <YZaMtGhqaXIOLhox@paasikivi.fi.intel.com>
References: <20211118154009.307430-1-eugen.hristev@microchip.com>
 <fa26e991-9228-7ed7-833a-b296e6b32afc@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa26e991-9228-7ed7-833a-b296e6b32afc@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Thu, Nov 18, 2021 at 06:11:35PM +0100, Luca Ceresoli wrote:
> Hi Eugen,
> 
> On 18/11/21 16:40, Eugen Hristev wrote:
> > Current driver supports only SRGGB 10 bit RAW bayer format.
> > Add the enum_mbus_code implementation to report this format supported.
> > 
> >  # v4l2-ctl -d /dev/v4l-subdev3 --list-subdev-mbus-codes
> > ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0)
> >         0x300f: MEDIA_BUS_FMT_SRGGB10_1X10
> >  #
> > 
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Generally OK, but I have a few minor comments.
> 
> > ---
> >  drivers/media/i2c/imx274.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > index 2e804e3b70c4..25a4ef8f6187 100644
> > --- a/drivers/media/i2c/imx274.c
> > +++ b/drivers/media/i2c/imx274.c
> > @@ -1909,7 +1909,21 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
> >  	return err;
> >  }
> >  
> > +static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
> > +				 struct v4l2_subdev_state *sd_state,
> > +				 struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index > 0)
> > +		return -EINVAL;
> 
> Many driver do check code->pad too, so you might want to do
> 
> 	if (code->pad > 0 || code->index > 0)
> 		return -EINVAL;

The caller will have checked the pad exists, and there's a single one on
the subdev I suppose.

> 
> However I don't think it is strictly necessary, thus
> 
> > +
> > +	/* only supported format in the driver is Raw 10 bits SRGGB */
> > +	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;
> 
> Maybe better:
> 
>   code->code =  to_imx274(sd)->format.code

Good idea.

> 
> just as a little guard for future format changes.
> 
> With or without these I'm OK anyway with the patch, so:
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> -- 
> Luca

-- 
Sakari Ailus
