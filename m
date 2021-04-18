Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46C736374F
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 21:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDRTYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 15:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRTYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 15:24:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B02FC06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 12:23:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B7874AB;
        Sun, 18 Apr 2021 21:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618773818;
        bh=MSzKLFbAYk8vyA+64IvP3pihZCe+hfCBGFcYKxfifmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bo5iaRtlDicq+X9dpm7rRFyl4NJdrmOtWdl1sZv/QvB2AlXoCrazLT1+fxr1krogs
         WQf57oFnrYjbWa6s1gp1TBTnN6k9qLklknA6OQvfkRxeV1vr6ifLOIHlkfmOEni7kj
         IdDFVDmaSu5hi7J8fTr8gDZL4gpeVhPJzp9FdR80=
Date:   Sun, 18 Apr 2021 22:23:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 15/24] v4l: Add bus type to frame descriptors
Message-ID: <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi and Sakari,

Thank you for the patch.

On Thu, Apr 15, 2021 at 04:04:41PM +0300, Tomi Valkeinen wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Add the media bus type to the frame descriptor. CSI-2 specific
> information will be added in next patch to the frame descriptor.

I'd squash the next patch with this one.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> - Make the bus type a named enum
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..85977abbea46 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -340,12 +340,21 @@ struct v4l2_mbus_frame_desc_entry {
>  
>  #define V4L2_FRAME_DESC_ENTRY_MAX	4
>  
> +enum v4l2_mbus_frame_desc_type {
> +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
> +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
> +	V4L2_MBUS_FRAME_DESC_TYPE_CCP2,
> +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> +};

This should be documented. In particular, I have no idea what
V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM is. I also wonder if we shouldn't
drop CCP2 (at least for now), does anyone use that anymore ?

> +
>  /**
>   * struct v4l2_mbus_frame_desc - media bus data frame description
> + * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
>   * @entry: frame descriptors array
>   * @num_entries: number of entries in @entry array
>   */
>  struct v4l2_mbus_frame_desc {
> +	enum v4l2_mbus_frame_desc_type type;
>  	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
>  	unsigned short num_entries;
>  };

-- 
Regards,

Laurent Pinchart
