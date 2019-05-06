Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B06E9147CA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbfEFJuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 05:50:25 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49165 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726128AbfEFJuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 05:50:25 -0400
Received: from [IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf] ([IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NaGKhMLr3NExlNaGLhxrSf; Mon, 06 May 2019 11:50:23 +0200
Subject: Re: [PATCH v6 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-3-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c5c4b88d-7977-e253-1242-b9a86228a302@xs4all.nl>
Date:   Mon, 6 May 2019 11:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415124413.18456-3-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN8EA+NKF63laeSQuHN5eXfe5ymsw9Za+w9Br5sKx16nzaKm3UQQhGwi2LV27ETbP15vhCmQMrRg9Y3k1Kum2QxliGV9O6Tz4FwhLopYyhiJFTffrBzy
 6nEQ0Ls3GQf23UirXuH0oGgL+CdDgvgpm/0xhBF+6xPDVkIjuFjJN/btoCqZNe/iBfA6+4dLJm7AjCKWnk6X1j3MXqL4JYWUS0HwLpvrR0D3xP0hO4Gsp0ge
 /4BFfOS3cuZgNBqbfCHrJxCrO+wsUGRnI5nc1bQ8yQL6iMqn2jMTV5YpcLOdNA9mM/dmAHybhbS+XKHJVNUbJy4xdZx9nxiXlJ5J+d3rRoCVCLzIlvglkfiu
 obVnSinwL6aPuR9vLbqrwYHFSHlYeKvjqPKu86MaK/G3eyp/uVQkXNZmzqFEVhTJINekzPFGDtjqSCyBKK151CpfNYfqGDfB5IlfiHzW3YVBc41LUYdAEnGP
 wq+QYpVRBGl5PRS3qVOLMSn6kWcOKcMdZGsNVsXCUq1a04yhrnWlmPX3qf6wIkfPqyJBpWjXGBAGRxoN7J0xxegALSQuyxuFzVlM++TE3yiPBzJ9L7GirW9D
 hrY/IHkRvL4qJiPDZuc4EOUYYHUyAxcSb8eZ0yjQ879PAA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/15/19 2:44 PM, Marco Felsch wrote:
> Currently every driver needs to parse the connector endpoints by it self.
> This is the initial work to make this generic. The generic connector has
> some common fields and some connector specific parts. The generic one
> includes:
>   - type
>   - label
>   - remote_port (the port where the connector is connected to)
>   - remote_id   (the endpoint where the connector is connected to)
> 
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

Where does 41 come from? It's a weird number...

> +
> +/**
> + * enum v4l2_connector_type - connector type
> + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration

typo: connetor -> connector

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

Is there a reason to create a new header for this? I think it is perfectly OK to
add this define + enum for v4l2-fwnode.h.

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

Same typo. It's probably a good idea to grep for this typo in this patch series :-)

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
> 

Regards,

	Hans
