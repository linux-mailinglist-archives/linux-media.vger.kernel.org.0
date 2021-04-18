Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A17363750
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 21:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhDRTZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 15:25:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32876 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbhDRTZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 15:25:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC414AB;
        Sun, 18 Apr 2021 21:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618773898;
        bh=cjOHviHz7IOugD0YJQY3JOSu+gSyWZBZA4X/mbDDvcg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dcU+AwJTKHIyivFFBTYYxq+htLj2pJaRWFnz8Oz8b4TnFbC9uNQBQiqDns+nTOmbk
         YUQwd0nrU3wonQff94m+rFZiZAJQGcrxgqWxn8airTlrhZKLjb6fyA2hP1lxNthCQO
         vnpIiTEXNdAlEzc1eRHC4kz/QPNZc/I9IhOxFUSg=
Date:   Sun, 18 Apr 2021 22:24:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 16/24] v4l: Add CSI-2 bus configuration to frame
 descriptors
Message-ID: <YHyHhqk+SoZLlA3S@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-17-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-17-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:42PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Add CSI-2 bus specific configuration to the frame descriptors. This allows
> obtaining the virtual channel and data type information for each stream
> the transmitter is sending.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 85977abbea46..30ec011d31e3 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -308,6 +308,17 @@ struct v4l2_subdev_audio_ops {
>  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
>  };
>  
> +/**
> + * struct v4l2_mbus_frame_desc_entry_csi2
> + *
> + * @channel: CSI-2 virtual channel

Maybe s/channel/virtual_channel/ ? Or vc and dt ?

> + * @data_type: CSI-2 data type ID
> + */
> +struct v4l2_mbus_frame_desc_entry_csi2 {
> +	u8 channel;
> +	u8 data_type;
> +};
> +
>  /**
>   * enum v4l2_mbus_frame_desc_flags - media bus frame description flags
>   *
> @@ -331,11 +342,16 @@ enum v4l2_mbus_frame_desc_flags {
>   *		%FRAME_DESC_FL_BLOB is not set.
>   * @length:	number of octets per frame, valid if @flags
>   *		%V4L2_MBUS_FRAME_DESC_FL_LEN_MAX is set.
> + * @bus:	Bus specific frame descriptor parameters

s/Bus specific/Bus-specific/

> + * @bus.csi2:	CSI-2 specific bus configuration

Ditto.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>   */
>  struct v4l2_mbus_frame_desc_entry {
>  	enum v4l2_mbus_frame_desc_flags flags;
>  	u32 pixelcode;
>  	u32 length;
> +	union {
> +		struct v4l2_mbus_frame_desc_entry_csi2 csi2;
> +	} bus;
>  };
>  
>  #define V4L2_FRAME_DESC_ENTRY_MAX	4

-- 
Regards,

Laurent Pinchart
