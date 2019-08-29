Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85048A1545
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 11:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfH2J7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 05:59:19 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54283 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfH2J7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 05:59:19 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3HCziQfPqDqPe3HD2iNMG9; Thu, 29 Aug 2019 11:59:16 +0200
Subject: Re: [PATCH v9 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-3-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c868ab4e-206b-bf66-a276-a9901b9fc41a@xs4all.nl>
Date:   Thu, 29 Aug 2019 11:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822080556.17109-3-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFF9Ss5B2QVJBvPyAwSWoVoNFtMCZUEsUfFSadZxrXviBCHWG2AvXYuDW7WzG2++M1Glov0NyC2hoVgy+/a4n9KlshAa8g3aUF4Tg/yHt4zkucTfVEBv
 IvuFQIknpSHee187MZyM6D1WIF8sB+lqZqaQxmon6YCua4Sdz5iQaHjDWCR4ezo8WyjbzNrqHQ03aXqS16IYEhkTfPChhVbTXOVPVfEWqpmvceQlUSUYGIzX
 nhRknOn6mL/HM5r45f1OmexSQp14wydKtnSkQlSxH/LYMZsJHJAiLh2KdueOpWHu4YaAXzFit3Acvb+1b8zx2dW0xRpK4MB3SfauN9TzC2lSVd7p55nxFSLU
 T2O5jWtjrXTnCYedo/7vJhCgMvV9HfRPpjkgagNG2KrmJQFy7rtihA8Q+hy+qp/FH8/KhSzeYiEHaQ8Bspa/cqsS9TfEPGtpC+hBqXWpHkuq6abRMPl4fumn
 enB1yCH/AU427oMNHguU27xmrDeTAM60vxAE0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 10:05 AM, Marco Felsch wrote:
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
> v8:
> - rename CON -> CONN
> - supported_tvnorms_stds -> sdtv_stds and adapt description
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
> index f6a7bcd13197..7ca5669ef6fa 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -123,6 +123,51 @@ struct v4l2_fwnode_link {
>  	unsigned int remote_port;
>  };
>  
> +/**
> + * enum v4l2_connector_type - connector type
> + * @V4L2_CONN_UNKNOWN:   unknown connector type, no V4L2 connector configuration
> + * @V4L2_CONN_COMPOSITE: analog composite connector
> + * @V4L2_CONN_SVIDEO:    analog svideo connector
> + * @V4L2_CONN_HDMI:      digital hdmi connector

Why exactly is CONN_HDMI added if there is no V4L2 driver that uses it?

I would just drop it from this series.

Regards,

	Hans

> + */
> +enum v4l2_connector_type {
> +	V4L2_CONN_UNKNOWN,
> +	V4L2_CONN_COMPOSITE,
> +	V4L2_CONN_SVIDEO,
> +	V4L2_CONN_HDMI,
> +};
> +
> +/**
> + * struct v4l2_fwnode_connector_analog - analog connector data structure
> + * @sdtv_stds: sdtv standards this connector supports, set to V4L2_STD_ALL
> + *             if no restrictions are specified.
> + */
> +struct v4l2_fwnode_connector_analog {
> +	v4l2_std_id sdtv_stds;
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

