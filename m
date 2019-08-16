Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B28D90061
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 12:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfHPK7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 06:59:47 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56085 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726261AbfHPK7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 06:59:47 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id yZxKhmt3tThuuyZxNhK6U1; Fri, 16 Aug 2019 12:59:45 +0200
Subject: Re: [PATCH v7 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-3-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eb395727-c1d1-685f-623a-aebf7ba474ea@xs4all.nl>
Date:   Fri, 16 Aug 2019 12:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815115747.24018-3-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJFesj2vHkvgEKm0D0WN4hvIZp7sBLpXN5WTOiYXAMHSg7JkLZIa1P0Njjpjzg4eUW/ChOLZlCVpzKeWhrDVTcLjvbTUVrIzJBwZgZsr8+SM2NO7JUdO
 p6D75dyWk5i7hCqSTxGoUsIec4OesEWakDh1bAuziOdJ6axGww3HrA4oyvUrsaPyrPxVyr5oM1H9e7Q4h0iBy9OZS4txJ53HJGOjV7NvCj9Ak4VpD9+OSWZy
 uX0pSHTAwXf2S2u/CarT+CuVyHd6RFixEI3uqp4rWAhlHkipUQHe0MM2ec8DLRiHs4WmOENYPhTX5qIx4jPBvO0Wr6cphnVr3iBEv9wEmecgArj+f1XuxWMC
 KTTqEKnM54JE2LKNCPvXsJDEUcCYBtuKPhx9GYxyWK+dpoOPEZ5ID6AX5ptPxsGQtzxf3xZgUWMmgEprajElCkWqR2DRHbcPAV5GEk0IBIQTuCjuo0nwcL0Z
 trVcke6ocGOP9oD1xM/H0caHLnlnJGwbZSkHPwrmL2QhnzpCZIoLbiX+MZWWyXz0IdzQE46cQ2Ozjbb3P8Dn4uB4jFTuqBIvgeGoRH9M90D9TSVlq/QfNODS
 1ziF06nIGn5UMcgAfs5r1VPaCAPY7nZb/4PF2UU/KUHlIg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 1:57 PM, Marco Felsch wrote:
> Currently every driver needs to parse the connector endpoints by it self.
> This is the initial work to make this generic. A generic connector has
> common members and connector specific members. The common members are:
>   - type
>   - label (optional)
>   - links
>   - nr_of_links
> 
> The specific members are stored within a union, since only one of them
> can be available at the time. Since this is the initial support the
> patch adds only the analog-connector specific ones.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v7:
> - fix spelling issues
> - constify label
> - support variable label size
> - replace single remote_port/id members by links member of variable
>   size
> - squash v4l2-connector into v4l2-fwnode
> 
> @Jacopo: I dropped your r b tag because I changed the port/id logic.
> 
> v6:
> - fix some spelling and style issues
> - rm unnecessary comments
> - drop vga and dvi connector
> - fix misspelt connector
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> ---
>  include/media/v4l2-fwnode.h | 45 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f6a7bcd13197..e39c198882fc 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -123,6 +123,51 @@ struct v4l2_fwnode_link {
>  	unsigned int remote_port;
>  };
>  
> +/**
> + * enum v4l2_connector_type - connector type
> + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connector configuration
> + * @V4L2_CON_COMPOSITE: analog composite connector
> + * @V4L2_CON_SVIDEO:    analog svideo connector
> + * @V4L2_CON_HDMI:      digital hdmi connector
> + */
> +enum v4l2_connector_type {
> +	V4L2_CON_UNKNOWN,
> +	V4L2_CON_COMPOSITE,
> +	V4L2_CON_SVIDEO,
> +	V4L2_CON_HDMI,

Please use CONN instead of CON. CONN is the traditional abbreviation
used for connectors. 'CON' is too generic (there are many words that
start with 'con').

Regards,

	Hans

> +};
> +
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
> + * @label: optional connector label
> + * @type: connector type
> + * @links: list of &struct v4l2_fwnode_link links the connector is connected to
> + * @nr_of_links: total number of links
> + * @connector: connector configuration
> + * @connector.analog: analog connector configuration
> + *                    &struct v4l2_fwnode_connector_analog
> + */
> +struct v4l2_fwnode_connector {
> +	const char *label;
> +	enum v4l2_connector_type type;
> +	struct v4l2_fwnode_link *links;
> +	unsigned int nr_of_links;
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

