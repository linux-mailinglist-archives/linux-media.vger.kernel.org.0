Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24A2247F8C
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHRHdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:33:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:23268 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbgHRHdl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:33:41 -0400
IronPort-SDR: vGthGPswUw8s6aIbrW8yTvruyOASTs2vICIqiOUWhTrKqEtUXC7avP+HW/o0W5HuEHPsWK/HOr
 QXt4aI59d9iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152266330"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="152266330"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:33:40 -0700
IronPort-SDR: aJjcCgea7onE7UrERdJbEXaYnBnIhEV60KW61TLRSyq/1PIcF9PPmH+St335cdr7ziFGsgQlZD
 b/I/ZAsuga+w==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="370817579"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:33:35 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 240B12064F; Tue, 18 Aug 2020 10:33:33 +0300 (EEST)
Date:   Tue, 18 Aug 2020 10:33:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 11/25] media: ov5647: Implement enum_frame_size()
Message-ID: <20200818073332.GM24582@paasikivi.fi.intel.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623164224.44476-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623164224.44476-1-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jun 23, 2020 at 06:42:20PM +0200, Jacopo Mondi wrote:
> Implement the .enum_frame_size subdev pad operation.
> 
> As the driver only supports one format and one resolution at the moment
> the implementation is trivial.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index bb9ff77f49fe0..859cc5b0d14a3 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -482,6 +482,24 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index)
> +		return -EINVAL;
> +
> +	if (fse->code != MEDIA_BUS_FMT_SBGGR8_1X8)
> +		return -EINVAL;
> +
> +	fse->min_width = 640;
> +	fse->max_width = 640;
> +	fse->min_height = 480;
> +	fse->max_height = 480;

Could this be somehow connected to the mode used? Or at least use a macro
defined close to the mode? This seems to be a 1,3 MP sensor and the driver
only supports VGA...

> +
> +	return 0;
> +}
> +
>  static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_pad_config *cfg,
>  			      struct v4l2_subdev_format *format)
> @@ -500,9 +518,10 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
> -	.enum_mbus_code = ov5647_enum_mbus_code,
> -	.set_fmt =	  ov5647_set_get_fmt,
> -	.get_fmt =	  ov5647_set_get_fmt,
> +	.enum_mbus_code		= ov5647_enum_mbus_code,
> +	.enum_frame_size	= ov5647_enum_frame_size,
> +	.set_fmt		= ov5647_set_get_fmt,
> +	.get_fmt		= ov5647_set_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops ov5647_subdev_ops = {
> -- 
> 2.27.0
> 

-- 
Sakari Ailus
