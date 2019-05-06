Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06B914832
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfEFKKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:10:45 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:52885 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfEFKKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 06:10:45 -0400
Received: from [IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf] ([IPv6:2001:983:e9a7:1:94cb:c5ca:b4e:5bdf])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Naa1hMWbsNExlNaa3hy1fN; Mon, 06 May 2019 12:10:43 +0200
Subject: Re: [PATCH v6 03/13] media: v4l2-fwnode: add initial connector
 parsing support
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc:     laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-4-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <67f45a50-1eef-89d7-c008-17f085940eb2@xs4all.nl>
Date:   Mon, 6 May 2019 12:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415124413.18456-4-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG/g4lMYqu1STzpLWfJCZ3i71I2vjRGAKI7odFJ/h++tEKCmLQ0K12TMv09YLm/bG1i4QWWC+RmZJOUi4DLt4Z8DRFwrB6wLn9K85ktWiIa1BJafONAG
 /Ylj7flZtJ1Xe8J1EsitymTN5WVSh2gEldQL2nDJhPO4L37wNbnv+i+DpUs726MkMNJNl6fwtov6HPcvHdbKURcpXf4rlPdSNpdW5uRCIGQddiYrfeXapkWQ
 Q3yEp9fC3SY6r2oy5T7qkRLa0NZQFudu3of7rRorsk3qRDQx/+IMhzSHY1ALuVC/xMveuVsC5phIFwsqlvGpYsU7nuguXP1ZfU7J1Xfahtqha0AKjikSxhCc
 hGsFM5sUnihD9xeVLtC2PiWwoYw3NTYjo6+hIk0fPZpLWQv/2C6OF7FFnI7mLnz8ZvOq5zqAqFZHQVY4JBQaNCUzlVFR/kjdVLuiLZyO/tLJhDLrE6WzFJgw
 wZxhjU/r+LAMMzQu1+mxOAkwNnxGwT2Jta9WloBSqQf0pdv8/KkB/9AS3gY1ZVKY4AyLlq92pRK27S3ohrA2i/N7eKOlb/NNpcnlPCMWpuMwl6o3yQk0jTAF
 eThT9ynlubwLZtWN0a8nQSH1riX75Lo/643FdO0sD3spGA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/15/19 2:44 PM, Marco Felsch wrote:
> The patch adds the initial connector parsing code, so we can move from a
> driver specific parsing code to a generic one. Currently only the
> generic fields and the analog-connector specific fields are parsed. Parsing
> the other connector specific fields can be added by a simple callbacks.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v6:
> - use 'unsigned int' count var
> - fix comment and style issues
> - place '/* fall through */' to correct places
> - fix error handling and cleanup by releasing fwnode
> - drop vga and dvi parsing support as those connectors are rarely used
>   these days
> 
> v5:
> - s/strlcpy/strscpy/
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> 
>  drivers/media/v4l2-core/v4l2-fwnode.c | 111 ++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           |  16 ++++
>  2 files changed, 127 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 20571846e636..f1cca95c8fef 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -592,6 +592,117 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
>  
> +static const struct v4l2_fwnode_connector_conv {
> +	enum v4l2_connector_type type;
> +	const char *name;
> +} connectors[] = {
> +	{
> +		.type = V4L2_CON_COMPOSITE,
> +		.name = "composite-video-connector",
> +	}, {
> +		.type = V4L2_CON_SVIDEO,
> +		.name = "svideo-connector",
> +	}, {
> +		.type = V4L2_CON_HDMI,
> +		.name = "hdmi-connector",
> +	},
> +};
> +
> +static enum v4l2_connector_type
> +v4l2_fwnode_string_to_connector_type(const char *con_str)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> +		if (!strcmp(con_str, connectors[i].name))
> +			return connectors[i].type;
> +
> +	/* no valid connector found */
> +	return V4L2_CON_UNKNOWN;
> +}
> +
> +static int
> +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> +				   struct v4l2_fwnode_connector *vc)
> +{
> +	u32 tvnorms;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> +
> +	/* tvnorms is optional */
> +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;
> +
> +	return 0;
> +}
> +
> +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> +				struct v4l2_fwnode_connector *connector)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct fwnode_endpoint __ep;
> +	const char *c_type_str, *label;
> +	int ret;
> +
> +	memset(connector, 0, sizeof(*connector));
> +
> +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	/* parse all common properties first */
> +	/* connector-type is stored within the compatible string */
> +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);
> +	if (ret) {
> +		fwnode_handle_put(fwnode);
> +		return -EINVAL;
> +	}
> +
> +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> +
> +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> +	connector->remote_port = __ep.port;
> +	connector->remote_id = __ep.id;
> +
> +	ret = fwnode_property_read_string(fwnode, "label", &label);
> +	if (!ret) {
> +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> +	} else {
> +		/*
> +		 * labels are optional, if none is given create one:
> +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> +		 */
> +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> +			 connector->remote_id);
> +	}
> +
> +	/* now parse the connector specific properties */
> +	switch (connector->type) {
> +	case V4L2_CON_COMPOSITE:
> +		/* fall through */
> +	case V4L2_CON_SVIDEO:
> +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> +		break;
> +	case V4L2_CON_HDMI:
> +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> +			c_type_str);

Why warn? Just drop this.

> +		ret = 0;
> +		break;
> +	case V4L2_CON_UNKNOWN:
> +		/* fall through */
> +	default:
> +		pr_err("Unknown connector type\n");
> +		ret = -EINVAL;
> +	};
> +
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index f4df1b95c5ef..e072f2915ddb 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>   */
>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
>  
> +/**
> + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> + *          connected to
> + * @connector: pointer to the V4L2 fwnode connector data structure
> + *
> + * Fill the connector data structure with the connector type, label and the
> + * endpoint id and port where the connector belongs to. If no label is present
> + * a unique one will be created. Labels with more than 40 characters are cut.
> + *
> + * Return: %0 on success or a negative error code on failure:
> + *	   %-EINVAL on parsing failure
> + */
> +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> +				struct v4l2_fwnode_connector *connector);
> +
>  /**
>   * typedef parse_endpoint_func - Driver's callback function to be called on
>   *	each V4L2 fwnode endpoint.
> 

Regards,

	Hans
