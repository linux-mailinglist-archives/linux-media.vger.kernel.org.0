Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD2A32EF2E
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 16:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCEPle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 10:41:34 -0500
Received: from mga12.intel.com ([192.55.52.136]:24074 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhCEPlH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 10:41:07 -0500
IronPort-SDR: q13unLIZnfMZeYWUc8DKHCmQF1kBSt32I3TPgccTF5JKRwY7F7Zm3KUdvhefyf61SfoO87gE2K
 /LiTFNO752xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9914"; a="166930372"
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; 
   d="scan'208";a="166930372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 07:41:07 -0800
IronPort-SDR: 7lOmwdvVPkYFBaJfTtbwB7PJkOAf4SQMhUF6z3W8Gti5QDFSBeft72XbjiaAQZ0gq+cpvcEMGo
 JxRQBetuKlRw==
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; 
   d="scan'208";a="401715918"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 07:41:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1E9C0202B5;
        Fri,  5 Mar 2021 17:41:03 +0200 (EET)
Date:   Fri, 5 Mar 2021 17:41:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com
Subject: Re: [RFC PATCH 4/4] staging: media: omap4iss: use
 v4l2_get_link_freq() to get the external rate
Message-ID: <20210305154103.GV3@paasikivi.fi.intel.com>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-5-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303180817.12285-5-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

Thanks for the set.

On Wed, Mar 03, 2021 at 09:08:17PM +0300, Andrey Konovalov wrote:
> This driver uses V4L2_CID_PIXEL_RATE to calculate the CSI2 link frequency,
> but this may give incorrect result in some cases. Use v4l2_get_link_freq()
> instead.
> 
> Also the driver used the external_rate field in struct iss_pipeline as a
> flag to prevent excessive v4l2_subdev_call's when processing the frames
> in single-shot mode. Replace the external_rate with external_lfreq, and
> use external_bpp and external_lfreq to call v4l2_subdev_call(get_fmt) and
> v4l2_get_link_freq() respectively only once per iss_video_streamon().
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/staging/media/omap4iss/iss.c        | 12 +-----------
>  drivers/staging/media/omap4iss/iss_csiphy.c | 19 ++++++++++++++++---
>  drivers/staging/media/omap4iss/iss_video.c  |  2 +-
>  drivers/staging/media/omap4iss/iss_video.h  |  2 +-
>  4 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index dae9073e7d3c..0eb7b1b5dcc4 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -131,7 +131,7 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
>  	if (!pipe->external)
>  		return 0;
>  
> -	if (pipe->external_rate)
> +	if (pipe->external_bpp)
>  		return 0;
>  
>  	memset(&fmt, 0, sizeof(fmt));
> @@ -145,16 +145,6 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
>  
>  	pipe->external_bpp = omap4iss_video_format_info(fmt.format.code)->bpp;
>  
> -	ctrl = v4l2_ctrl_find(pipe->external->ctrl_handler,
> -			      V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_warn(iss->dev, "no pixel rate control in subdev %s\n",
> -			 pipe->external->name);
> -		return -EPIPE;
> -	}
> -
> -	pipe->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/staging/media/omap4iss/iss_csiphy.c b/drivers/staging/media/omap4iss/iss_csiphy.c
> index 96f2ce045138..cec0cd21f7e0 100644
> --- a/drivers/staging/media/omap4iss/iss_csiphy.c
> +++ b/drivers/staging/media/omap4iss/iss_csiphy.c
> @@ -119,6 +119,7 @@ int omap4iss_csiphy_config(struct iss_device *iss,
>  	struct iss_pipeline *pipe = to_iss_pipeline(&csi2_subdev->entity);
>  	struct iss_v4l2_subdevs_group *subdevs = pipe->external->host_priv;
>  	struct iss_csiphy_dphy_cfg csi2phy;
> +	s64 link_freq;
>  	int csi2_ddrclk_khz;
>  	struct iss_csiphy_lanes_cfg *lanes;
>  	unsigned int used_lanes = 0;
> @@ -193,9 +194,21 @@ int omap4iss_csiphy_config(struct iss_device *iss,
>  	if (lanes->clk.pos == 0 || used_lanes & (1 << lanes->clk.pos))
>  		return -EINVAL;
>  
> -	csi2_ddrclk_khz = pipe->external_rate / 1000
> -		/ (2 * csi2->phy->used_data_lanes)
> -		* pipe->external_bpp;
> +	if (!pipe->external_lfreq) {
> +		link_freq = v4l2_get_link_freq(pipe->external->ctrl_handler,

I wonder if you could this unconditionally, and remove external_lfreq field
altogether. The same could be done for external_bpp but that's out of scope
for this patch.

> +					       pipe->external_bpp,
> +					       2 * csi2->phy->used_data_lanes);
> +		if (link_freq < 0) {
> +			dev_warn(iss->dev,
> +				 "failed to read the link frequency fromn subdev %s\n",
> +				 pipe->external->name);
> +			return -EINVAL;
> +		}
> +
> +		pipe->external_lfreq = link_freq;
> +	}
> +
> +	csi2_ddrclk_khz = div_s64(pipe->external_lfreq, 1000);
>  
>  	/*
>  	 * THS_TERM: Programmed value = ceil(12.5 ns/DDRClk period) - 1.
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index 66975a37dc85..a654c8d18bbc 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -872,7 +872,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	pipe = entity->pipe
>  	     ? to_iss_pipeline(entity) : &video->pipe;
>  	pipe->external = NULL;
> -	pipe->external_rate = 0;
> +	pipe->external_lfreq = 0;
>  	pipe->external_bpp = 0;
>  
>  	ret = media_entity_enum_init(&pipe->ent_enum, entity->graph_obj.mdev);
> diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
> index 526281bf0051..2ad5c8483958 100644
> --- a/drivers/staging/media/omap4iss/iss_video.h
> +++ b/drivers/staging/media/omap4iss/iss_video.h
> @@ -86,7 +86,7 @@ struct iss_pipeline {
>  	bool error;
>  	struct v4l2_fract max_timeperframe;
>  	struct v4l2_subdev *external;
> -	unsigned int external_rate;
> +	s64 external_lfreq;
>  	int external_bpp;
>  };
>  

-- 
Sakari Ailus
