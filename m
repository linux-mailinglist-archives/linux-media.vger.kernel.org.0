Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 426005869F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 18:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfF0QFY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 12:05:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:63541 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0QFY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 12:05:24 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,424,1557212400"; 
   d="scan'208";a="162685843"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2019 09:05:20 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 31F872064B; Thu, 27 Jun 2019 19:05:19 +0300 (EEST)
Date:   Thu, 27 Jun 2019 19:05:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Message-ID: <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
> Add support of V4L2_CID_LINK_FREQ, this is needed
> by some CSI-2 receivers.
> 
> 384MHz is exposed for the time being, corresponding
> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
> 
> This setup has been tested successfully with ST MIPID02
> CSI-2 to parallel bridge.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---

Thanks for the patch.

The driver calculates the sensor configuration based on its configuration,
and this needs to be reflected in the link frequency: it's not a static
value. See e.g. ov5640_calc_sys_clk().

> version 2:
>   - do not set control read only as per Hans' comment:
>     See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
> 
>  drivers/media/i2c/ov5640.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 82d4ce9..e6307f3 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
>  	struct v4l2_ctrl *test_pattern;
>  	struct v4l2_ctrl *hflip;
>  	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *link_freq;
>  };
>  
>  struct ov5640_dev {
> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static const s64 link_freq_menu_items[] = {
> +	384000000,
> +};
> +
>  static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_pad_config *cfg,
>  			  struct v4l2_subdev_format *format)
> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_VFLIP:
>  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>  		break;
> +	case V4L2_CID_LINK_FREQ:
> +		return 0;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
>  				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
>  
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> +						  0, 0, link_freq_menu_items);
> +
>  	if (hdl->error) {
>  		ret = hdl->error;
>  		goto free_ctrls;
> -- 
> 2.7.4
> 

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
