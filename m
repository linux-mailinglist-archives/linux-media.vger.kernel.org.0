Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE8E1AFF99
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 03:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTBpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 21:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgDTBpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 21:45:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AF3C061A0C;
        Sun, 19 Apr 2020 18:45:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29703528;
        Mon, 20 Apr 2020 03:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587347110;
        bh=KDyvi4OkRTcQaQn+3LCFCHsc7jcha5vpO0IGsavZfTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vWq4rmVinrjw4xRY3ZxpvWB/7N9wl3zyQAElTNPBugEiBpitwQlQ2kkrmXeDJeutj
         H+HWObG5VfOTF4lAb6TUTYpVtd3cs0ahbOIem+PI6YKqvJeN5wb7Uu3Ayb9GD/XDs9
         TmFxjS4TTbMwLWhR14EmayfcOBqXmfS85wSl/WVw=
Date:   Mon, 20 Apr 2020 04:44:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: v4l2-subdv: Introduce get_mbus_config pad
 op
Message-ID: <20200420014457.GA15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 15, 2020 at 12:49:58PM +0200, Jacopo Mondi wrote:
> Introduce a new pad operation to allow retrieving the media bus
> configuration on a subdevice pad.
> 
> The newly introduced operation reassembles the s/g_mbus_config video
> operation, which have been on their way to be deprecated since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 69 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a4848de59852..fc16af578471 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -350,6 +350,71 @@ struct v4l2_mbus_frame_desc {
>  	unsigned short num_entries;
>  };
>  
> +/**
> + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> + * @hsync_active: hsync active state: 1 for high, 0 for low
> + * @vsync_active: vsync active state: 1 for high, 0 for low
> + * @pclk_rising: pixel clock active edge: 1 for rising, 0 for falling

Is this for the driving side or the sampling side ?

> + * @data_active: data lines active state: 1 for high, 0 for low

I wonder, is there any system with active low data lines ?

> + */
> +struct v4l2_mbus_parallel_config {

Is this intended to cover BT.656 too ? Either way I think it should be
documented.

> +	unsigned int hsync_active : 1;
> +	unsigned int vsync_active : 1;
> +	unsigned int pclk_rising : 1;
> +	unsigned int data_active : 1;

Shouldn't we reuse the V4L2_MBUS_* flags, given that they're also used
in v4l2_fwnode_bus_parallel ? While the v4l2_mbus_config structure is
getting deprecated, it doesn't mean we can reuse the same flags if they
make sense. Otherwise we'll have to translate between
v4l2_fwnode_bus_parallel.flags and the fields here. Ideally
v4l2_fwnode_bus_parallel should be replaced with
v4l2_mbus_parallel_config (once we add additional fields).

> +};
> +
> +/**
> + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration

s/DPHY/D-PHY/ (same below)

> + * @data_lanes: number of data lanes in use
> + * @clock_noncontinuous: non continuous clock enable flag: 1 for non
> + *			 continuous clock, 0 for continuous clock.
> + */
> +struct v4l2_mbus_csi2_dphy_config {
> +	unsigned int data_lanes : 3;
> +	unsigned int clock_noncontinuous : 1;
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

How about leaving this one out for now as it's empty ?

> +
> +/**
> + * struct v4l2_mbus_pad_config - media bus configuration
> + *
> + * Report the subdevice media bus information to inform the caller of the
> + * current bus configuration. The structure describes bus configuration
> + * parameters that might change in-between streaming sessions, in order to allow
> + * the caller to adjust its media bus configuration to match what is reported
> + * here.

I'd focus here on what the structure contains rather than how it's used,
usage belongs to the documentation of the .get_mbus_config() operation.

I think the documentation should specify clearly that this is about the
physical bus configuration (as it excludes virtual channels on CSI-2 for
instance), and should also explain that this is about usage of the
physical bus, not just its hardware configuration on the PCB (as the
intent is to report the number of CSI-2 D-PHY data lanes actually used,
not the number of data lanes present on the board for instance).

> + *
> + * TODO: add '_pad_' to the name to distinguish this from the structure
> + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> + * the bus type.

What is this TODO about ? There's a '_pad_' in the name of this
structure.

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
> @@ -670,6 +735,8 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + *
> + * @get_mbus_config: get the current mbus configuration

I was going to say that this is a bit too short, but then saw patch 3/6
:-)

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +777,8 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_pad_config *config);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
