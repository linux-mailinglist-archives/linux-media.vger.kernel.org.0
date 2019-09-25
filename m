Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62FEBDF2F
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 15:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406748AbfIYNlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 09:41:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47806 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406357AbfIYNlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 09:41:25 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CF9E97A;
        Wed, 25 Sep 2019 15:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569418883;
        bh=cwNQUzCGZs8/Q3xrI6YJCR4zvxu6oRMAuhrmYXpPSMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KxtqPyW5gHG4qUdLEDzn+08wMoAUbHR2RpY/A6TVIAIRpfFzp9gGH+s45f+B7yiSX
         GBc4cbLumBIRFil8YCvVigtC84pEL0IEM4/IgdegcDOmDeAVZ10F6/Nw3kYztZwmLt
         +dztHaN3ZgDnYPiegXh0THgW2T8pj4hSkiJGx/Bo=
Date:   Wed, 25 Sep 2019 16:41:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        kernel@pengutronix.de, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v4 1/3] media: v4l2-subdev: add g_csi_active_lanes() op
Message-ID: <20190925134113.GA19093@pendragon.ideasonboard.com>
References: <20190924114955.13132-1-p.zabel@pengutronix.de>
 <20190924114955.13132-2-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190924114955.13132-2-p.zabel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

(CC'ing Sakari, Jacopo, Kieran and Niklas)

Thank you for the patch.

On Tue, Sep 24, 2019 at 01:49:53PM +0200, Philipp Zabel wrote:
> Add a subdevice video operation that allows to query the number
> of data lanes a MIPI CSI-2 TX is actively transmitting on.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> New in v4.
> ---
>  include/media/v4l2-subdev.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 71f1f2f0da53..bb71eedc38f6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -411,6 +411,8 @@ struct v4l2_mbus_frame_desc {
>   * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
>   *	can adjust @size to a lower value and must not write more data to the
>   *	buffer starting at @data than the original value of @size.
> + *
> + * @g_csi_active_lanes: Get number of currently active MIPI CSI-2 data lanes.
>   */
>  struct v4l2_subdev_video_ops {
>  	int (*s_routing)(struct v4l2_subdev *sd, u32 input, u32 output, u32 config);
> @@ -441,6 +443,7 @@ struct v4l2_subdev_video_ops {
>  			     const struct v4l2_mbus_config *cfg);
>  	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
>  			   unsigned int *size);
> +	int (*g_csi_active_lanes)(struct v4l2_subdev *sd, u32 *lanes);

This shouldn't be a video operation but a pad operation, as a subdev
could have multiple CSI-2 pads.

Furthermore, you need to define the semantics of this operation more
precisely. When can it be called, when is the information valid ? Can
the subdev change the number of lanes it supports at runtime ? If so,
how are race conditions avoided ? All this needs to be documented.

Finally, the number of lanes is far from being the only information
about a physical bus that could be interesting for a remote subdev. I
would much prefer a more generic operation to retrieve bus
information/configuration, with a data structure that we will be able to
extend later.

>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
