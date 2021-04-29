Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4543F36E368
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhD2CrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhD2CrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:47:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E225C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:46:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E8CBC0;
        Thu, 29 Apr 2021 04:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619664374;
        bh=F1vAucxqPGoWnYHzF9xpU0N+SW+afLjq37bSCH1gGZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fg50812viZFqcjscl5E2rp6FlEUZ1IpS4LFAFuxNcvJNuKJd6DN5I8fVHXrmmbcBP
         CsiVftzP+hWgGUQSG6EGesCm+/NZ/VZ3Xw5Vxv+EV8m4pzfrdICPQaFSMZfWpWfRc7
         qNkf15x9InIMeOqLL23bRIX9a3W86QYw0X1a75io=
Date:   Thu, 29 Apr 2021 05:46:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 15/24] v4l: Add bus type to frame descriptors
Message-ID: <YIod8AHLW3MTW9Xe@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427124523.990938-16-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

Authorship lost here too it seems.

On Tue, Apr 27, 2021 at 03:45:14PM +0300, Tomi Valkeinen wrote:
> Add the media bus type to the frame descriptor. CSI-2 specific
> information will be added in next patch to the frame descriptor.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> - Make the bus type a named enum
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..ac531b752028 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -340,12 +340,31 @@ struct v4l2_mbus_frame_desc_entry {
>  
>  #define V4L2_FRAME_DESC_ENTRY_MAX	4
>  
> +/**
> + * enum v4l2_mbus_frame_desc_type - media bus frame description type
> + *
> + * @V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM:
> + *	Platform specific frame desc type for backwards compatibility.

I'd have named it UNKNOWN, or possibly LEGACY or something similar, to
convey the fact that it shouldn't be used, but is only there so that
drivers that don't set the field can be told apart. Maybe the
documentation could capture this more clearly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * @V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL:
> + *	Parallel media bus.
> + * @V4L2_MBUS_FRAME_DESC_TYPE_CSI2:
> + *	CSI-2 media bus. Frame desc parameters must be set in
> + *	&struct v4l2_mbus_frame_desc_entry->csi2.
> + */
> +enum v4l2_mbus_frame_desc_type {
> +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
> +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
> +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> +};
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
