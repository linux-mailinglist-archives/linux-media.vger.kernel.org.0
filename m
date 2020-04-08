Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEFA1A1D8E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 10:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgDHIrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 04:47:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:16260 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgDHIrK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 04:47:10 -0400
IronPort-SDR: W59ukdF1DxS8zydZy82vAq0bUamb+jR2nJvg2YFdFN0YodV//hjBI3CalMuYq0nAOfJ8r6KCAl
 EpAkZwkXOrDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 01:47:08 -0700
IronPort-SDR: jj5v/uj4/T5iyEbzt7ZxRj6t6OoglxlpuM55Wx7eHqJKi5NQpz4O7xibDvzf+jHoXuMNEqVqDF
 qt+VRkUX4UlA==
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="286481112"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 01:47:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A927120502; Wed,  8 Apr 2020 11:47:04 +0300 (EEST)
Date:   Wed, 8 Apr 2020 11:47:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200408084704.GE5206@paasikivi.fi.intel.com>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313144035.401430-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patchset.

"subdev" in the subject.

On Fri, Mar 13, 2020 at 03:40:33PM +0100, Jacopo Mondi wrote:
> Introduce a new pad operation to allow retrieving the media bus
> configuration on a subdevice pad.
> 
> The newly introduced operation reassembles the s/g_mbus_config video
> operation, which have been on their way to be deprecated since a long
> time.

How is this expected to work with existing drivers that just get their
configuration from DT/ACPI? Update to use this API driver by driver as
needed basis, or something else?

Have you thought about setting the configuration as well?

Where is this expected to be implemented? Transmitters only, and to be
called by receiver drivers?

I think ideally the g_mbus_config video op should go with this patchset,
and drivers using it converted. Given the likely small intersection of the
two (drivers usign the old video op), this might be possible to do later on
as well. But in that case g_mbus_config should be deprecated in
documentation.

> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 761aa83a3f3c..3a1afc00e094 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
>  	unsigned short num_entries;
>  };
>  
> +/**
> + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> + * @hsync_active: hsync active state: true for high, false for low
> + * @vsync_active: vsync active state: true for high, false for low
> + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> + * @data_active: data lines active state: true for high, false for low
> + */
> +struct v4l2_mbus_parallel_config {
> +	bool hsync_active : 1;
> +	bool vsync_active : 1;
> +	bool pclk_rising : 1;
> +	bool data_active : 1;

unsigned int, please.

> +};
> +
> +/**
> + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> + * @data_lanes: number of data lanes in use
> + * @clock_noncontinuous: non continuous clock enable flag
> + */
> +struct v4l2_mbus_csi2_dphy_config {
> +	unsigned int data_lanes : 3;
> +	bool clock_noncontinuous : 1;

This should be unsigned int as well.

> +};
> +
> +/**
> + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> + *
> + * TODO
> + */
> +struct v4l2_mbus_csi2_cphy_config {
> +	/* TODO */
> +};
> +
> +/**
> + * struct v4l2_mbus_pad_config - media bus configuration
> + *
> + * Report the subdevice media bus information to inform the caller of the
> + * current bus configuration. The structure describes bus configuration
> + * parameters that might change in-between streaming sessions, in order to allow
> + * the caller to adjust its media bus configuration to match what is reported
> + * here.
> + *
> + * TODO: add '_pad_' to the name to distinguish this from the structure
> + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> + * the bus type.
> + *
> + * @type: mbus type. See &enum v4l2_mbus_type
> + * @parallel: parallel bus configuration parameters.
> + *	      See &struct v4l2_mbus_parallel_config
> + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> + *	       See &struct v4l2_mbus_csi2_dphy_config
> + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> + *	       See &struct v4l2_mbus_csi2_cphy_config
> + */
> +struct v4l2_mbus_pad_config {
> +	enum v4l2_mbus_type type;
> +	union {
> +		struct v4l2_mbus_parallel_config parallel;
> +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> +	};
> +};
> +
>  /**
>   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
>   *				  in video mode.
> @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + * @get_mbus_config: get the current mbus configuration
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_pad_config *config);
>  };
>  
>  /**

-- 
Kind regards,

Sakari Ailus
