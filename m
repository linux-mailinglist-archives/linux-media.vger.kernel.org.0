Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9671D953A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 13:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgESLYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 07:24:10 -0400
Received: from mga11.intel.com ([192.55.52.93]:19307 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgESLYJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 07:24:09 -0400
IronPort-SDR: 2xWwAKQsABQaIgQP/t/nG8nuRoHdBE6qLIN6LapMjWui62JYeWQWCFLUSmGz5Fn6LMx+Ly9fY/
 ZzTGX4p9ZJiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:24:09 -0700
IronPort-SDR: oaZ8nk8yTbKOxBkv8QTVzCSAKKDxb40mum2qLj2Mjp5rgKJYNpXxQFX1l6Gbr6kVZ8lyGMZuO5
 soybODBCSujA==
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="300076326"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 04:24:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 322D720CEF; Tue, 19 May 2020 14:24:03 +0300 (EEST)
Date:   Tue, 19 May 2020 14:24:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH v2 1/6] media: ov5647: Add set_fmt and get_fmt calls.
Message-ID: <20200519112403.GG20066@paasikivi.fi.intel.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
 <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1589850165.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1589850165.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thanks for the patchset.

On Tue, May 19, 2020 at 04:16:16AM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> There's no way to query the subdevice for the supported
> resolutions. Add set_fmt and get_fmt implementations. Since there's
> only one format supported set_fmt does nothing and get returns single
> format.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e7d2e5b4ad4b..3e587eb0a30e 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -463,8 +463,30 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt = &format->format;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;

No need to check the pad, the caller already has checked for it.

> +
> +	/* Only one format is supported, so return that */
> +	memset(fmt, 0, sizeof(*fmt));
> +	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> +	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	fmt->field = V4L2_FIELD_NONE;
> +	fmt->width = 640;
> +	fmt->height = 480;
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>  	.enum_mbus_code = ov5647_enum_mbus_code,
> +	.set_fmt =	  ov5647_set_get_fmt,
> +	.get_fmt =	  ov5647_set_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops ov5647_subdev_ops = {

-- 
Kind regards,

Sakari Ailus
