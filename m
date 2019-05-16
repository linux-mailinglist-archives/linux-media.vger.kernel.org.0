Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC320D24
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 18:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfEPQgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 12:36:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfEPQgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 12:36:50 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 833B22FD;
        Thu, 16 May 2019 18:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558024608;
        bh=LxW83Mua8pznRY6+w88tAZIf4/Uu/aMvPBDE/10yr18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBlZHxeCaXHPE4eJL6pQ4wIDXUl2u1t+yKmHPN1Ozm+POVa9zlAZLGERaPO3U3h1W
         q15Jhjgu9tYCm1mFY7EXDRi0SffYu1Ah0mPZUZ2VJnInoGDdSWuyM2XSVFOKZCpcJs
         SbHlmCfs+/cDtpmEoZY4lzG8o9GLT4zkukV6m850=
Date:   Thu, 16 May 2019 19:36:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190516163632.GO14820@pendragon.ideasonboard.com>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Thank you for the patch.

On Mon, Apr 15, 2019 at 02:44:02PM +0200, Marco Felsch wrote:
> Currently every driver needs to parse the connector endpoints by it self.

s/it self/itself/

> This is the initial work to make this generic. The generic connector has
> some common fields and some connector specific parts. The generic one
> includes:
>   - type
>   - label
>   - remote_port (the port where the connector is connected to)
>   - remote_id   (the endpoint where the connector is connected to)

This assumes a single connection between a connector and a remote port,
and a single port on the connector side. Is this guaranteed ? For the
mini-DIN-4 connectors (often used for S-Video) for instance, I recall
from the extensive discussions we had in the past that they should be
modeled with two pins, one for the Y component and one for C components.
The rationale for this is to support systems where such a connector
could be used to carry S-Video, but also two composite video signals
(usually through an external adapter from 2 RCA female connectors to one
S-Video male connector) that would be routed to two separate video
decoders (or two different inputs of the same video decoder). Other
topologies may be possible too.

> The specific fields are within a union, since only one of them can be
> available at the time. Since this is the initial support the patch adds
> only the analog-connector specific ones.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v6:
> - fix some spelling and style issues
> - rm unnecessary comments
> - drop vga and dvi connector
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> 
>  include/media/v4l2-connector.h | 30 ++++++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h    | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 include/media/v4l2-connector.h
> 
> diff --git a/include/media/v4l2-connector.h b/include/media/v4l2-connector.h
> new file mode 100644
> index 000000000000..3a951c54f50e
> --- /dev/null
> +++ b/include/media/v4l2-connector.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * v4l2-connector.h
> + *
> + * V4L2 connector types.
> + *
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef V4L2_CONNECTOR_H
> +#define V4L2_CONNECTOR_H
> +
> +#define V4L2_CONNECTOR_MAX_LABEL 41

Hans pointed out this was a weird number. Should you turn the label
field into a pointer to make this more generic (with a
v4l2_fwnode_connector_cleanup() function then) ?

> +
> +/**
> + * enum v4l2_connector_type - connector type
> + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration
> + * @V4L2_CON_COMPOSITE: analog composite connector
> + * @V4L2_CON_SVIDEO:    analog svideo connector
> + * @V4L2_CON_HDMI:      digital hdmi connector
> + */
> +enum v4l2_connector_type {
> +	V4L2_CON_UNKNOWN,
> +	V4L2_CON_COMPOSITE,
> +	V4L2_CON_SVIDEO,
> +	V4L2_CON_HDMI,
> +};
> +
> +#endif /* V4L2_CONNECTOR_H */
> +
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 6c07825e18b9..f4df1b95c5ef 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -22,6 +22,7 @@
>  #include <linux/list.h>
>  #include <linux/types.h>
>  
> +#include <media/v4l2-connector.h>
>  #include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -126,6 +127,38 @@ struct v4l2_fwnode_link {
>  	unsigned int remote_port;
>  };
>  
> +/**
> + * struct v4l2_fwnode_connector_analog - analog connector data structure
> + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> + *                     if no restrictions are specified.
> + */
> +struct v4l2_fwnode_connector_analog {
> +	v4l2_std_id supported_tvnorms;
> +};
> +
> +/**
> + * struct v4l2_fwnode_connector - the connector data structure
> + * @remote_port: identifier of the remote endpoint port the connector connects
> + *		 to
> + * @remote_id: identifier of the remote endpoint the connector connects to
> + * @label: connetor label
> + * @type: connector type
> + * @connector: connector configuration
> + * @connector.analog: analog connector configuration
> + *                    &struct v4l2_fwnode_connector_analog
> + */
> +struct v4l2_fwnode_connector {
> +	unsigned int remote_port;
> +	unsigned int remote_id;
> +	char label[V4L2_CONNECTOR_MAX_LABEL];
> +	enum v4l2_connector_type type;
> +
> +	union {
> +		struct v4l2_fwnode_connector_analog analog;
> +		/* future connectors */
> +	} connector;
> +};
> +
>  /**
>   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
>   * @fwnode: pointer to the endpoint's fwnode handle

-- 
Regards,

Laurent Pinchart
