Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09AA8E52F
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 09:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbfHOHF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 03:05:29 -0400
Received: from mga06.intel.com ([134.134.136.31]:39293 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbfHOHF3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 03:05:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 00:05:29 -0700
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="328302004"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 00:05:27 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0718C2069D; Thu, 15 Aug 2019 10:04:21 +0300 (EEST)
Date:   Thu, 15 Aug 2019 10:04:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 4/5] media: i2c: ov5670: Report the camera location
Message-ID: <20190815070420.GL6133@paasikivi.fi.intel.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814202815.32491-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Aug 14, 2019 at 10:28:14PM +0200, Jacopo Mondi wrote:
> The camera location is retrieved from the firmware interface parsing
> the "location" device property and reported through the read-only
> V4L2_CID_LOCATION control.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 041fcbb4eebd..1446aef1fc1e 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2059,10 +2059,12 @@ static const struct v4l2_ctrl_ops ov5670_ctrl_ops = {
>  /* Initialize control handlers */
>  static int ov5670_init_controls(struct ov5670 *ov5670)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	s64 vblank_max;
>  	s64 vblank_def;
>  	s64 vblank_min;
> +	u32 location;
>  	s64 exposure_max;
>  	int ret;
>  
> @@ -2124,6 +2126,15 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
>  				     ARRAY_SIZE(ov5670_test_pattern_menu) - 1,
>  				     0, 0, ov5670_test_pattern_menu);
>  
> +	ret = device_property_read_u32(&client->dev, "location", &location);
> +	if (!ret) {
> +		v4l2_ctrl_new_std(ctrl_hdlr, &ov5670_ctrl_ops,
> +				  V4L2_CID_LOCATION, V4L2_LOCATION_FRONT,
> +				  V4L2_LOCATION_BACK, 1,
> +				  location == V4L2_LOCATION_FRONT ?

To do this, you'll need to document that the control values match DT
binding values. I don't think that's there currently.

A switch would be nicer, to check that the value that is not front is
something else meaningful. Otherwise I wouldn't create the control at all.

A helper function for drivers to use would be nice.

> +				  V4L2_LOCATION_FRONT : V4L2_LOCATION_BACK);
> +	}
> +
>  	if (ctrl_hdlr->error) {
>  		ret = ctrl_hdlr->error;
>  		goto error;

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
