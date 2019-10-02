Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BBBC4809
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 09:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfJBHDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 03:03:34 -0400
Received: from retiisi.org.uk ([95.216.213.190]:58098 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725851AbfJBHDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 03:03:33 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 39A4F634C87;
        Wed,  2 Oct 2019 10:03:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFYf9-00027o-KD; Wed, 02 Oct 2019 10:03:03 +0300
Date:   Wed, 2 Oct 2019 10:03:03 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 03/14] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20191002070303.GK896@valkosipuli.retiisi.org.uk>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830101646.6530-4-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Fri, Aug 30, 2019 at 12:16:35PM +0200, Marco Felsch wrote:
> The patch adds the initial connector parsing code, so we can move from a
> driver specific parsing code to a generic one. Currently only the
> generic fields and the analog-connector specific fields are parsed. Parsing
> the other connector specific fields can be added by a simple callbacks.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v10:
> - drop V4L2_CONN_HDMI support
> - adapt pr_err msg to reflect new state (-> connector is unkown)
> 
> v9:
> - Fix leading semicolon found by kbuild semicolon.cocci
> 
> v8:
> - V4L2_CON_* -> V4L2_CONN_*
> - tvnorms -> sdtv-standards
> - adapt to new v4l2_fwnode_connector_analog member
> - return error in case of V4L2_CONN_HDMI
> 
> v7:
> @Jacopo: I dropped your r b tag becuase of the amount of changes I
> made..
> 
> - drop unnecessary comments
> - fix commet style
> - s/v4l2_fwnode_connector_conv.name/v4l2_fwnode_connector_conv.compatible/
> - make label size variable and drop V4L2_CONNECTOR_MAX_LABEL usage
> - do not assign a default label in case of no label was specified
> - remove useless /* fall through */ comments
> - add support for N connector links
> - rename local variables to be more meaningful
> - adjust kernedoc
> - add v4l2_fwnode_connector_free()
> - improve error handling (use different error values)
> - make use of pr_warn_once()
> 
> v6:
> - use unsigned count var
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
>  drivers/media/v4l2-core/v4l2-fwnode.c | 129 ++++++++++++++++++++++++++
>  include/media/v4l2-fwnode.h           |  38 ++++++++
>  2 files changed, 167 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 3bd1888787eb..0bfa7cbf78df 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -595,6 +595,135 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
>  
> +static const struct v4l2_fwnode_connector_conv {
> +	enum v4l2_connector_type type;
> +	const char *compatible;
> +} connectors[] = {
> +	{
> +		.type = V4L2_CONN_COMPOSITE,
> +		.compatible = "composite-video-connector",
> +	}, {
> +		.type = V4L2_CONN_SVIDEO,
> +		.compatible = "svideo-connector",
> +	},
> +};
> +
> +static enum v4l2_connector_type
> +v4l2_fwnode_string_to_connector_type(const char *con_str)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> +		if (!strcmp(con_str, connectors[i].compatible))
> +			return connectors[i].type;
> +
> +	return V4L2_CONN_UNKNOWN;
> +}
> +
> +static int
> +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> +				   struct v4l2_fwnode_connector *vc)
> +{
> +	u32 stds;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "sdtv-standards", &stds);
> +
> +	/* The property is optional. */
> +	vc->connector.analog.sdtv_stds = ret ? V4L2_STD_ALL : stds;
> +
> +	return 0;
> +}
> +
> +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> +{
> +	unsigned int i;
> +
> +	if (IS_ERR_OR_NULL(connector))
> +		return;
> +
> +	for (i = 0; i < connector->nr_of_links; i++)
> +		v4l2_fwnode_put_link(&connector->links[i]);
> +	kfree(connector->links);

Please assign connector->links NULL here, and nr_of_links to zero.

> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_free);
> +
> +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> +				      struct v4l2_fwnode_connector *connector)
> +{
> +	struct fwnode_handle *remote_pp, *remote_ep;
> +	const char *type_name;
> +	unsigned int i = 0, ep_num = 0;
> +	int err;
> +
> +	memset(connector, 0, sizeof(*connector));
> +
> +	remote_pp = fwnode_graph_get_remote_port_parent(fwnode);

How do you know a remote endpoint is a connector, and not another device's
endpoint?

> +	if (!remote_pp)
> +		return -ENOLINK;
> +
> +	/* Parse all common properties first. */
> +	fwnode_graph_for_each_endpoint(remote_pp, remote_ep)
> +		ep_num++;
> +
> +	connector->nr_of_links = ep_num;
> +	connector->links = kmalloc_array(ep_num, sizeof(*connector->links),
> +					 GFP_KERNEL);
> +	if (!connector->links) {
> +		err = -ENOMEM;
> +		goto err_put_fwnode;
> +	}
> +
> +	fwnode_graph_for_each_endpoint(remote_pp, remote_ep) {
> +		err = v4l2_fwnode_parse_link(remote_ep, &connector->links[i]);
> +		if (err) {
> +			fwnode_handle_put(remote_ep);
> +			goto err_free_links;
> +		}
> +		i++;
> +	}
> +
> +	/*
> +	 * Links reference counting guarantees access -> no duplication needed
> +	 */
> +	fwnode_property_read_string(remote_pp, "label", &connector->label);
> +
> +	/* The connector-type is stored within the compatible string. */
> +	err = fwnode_property_read_string(remote_pp, "compatible", &type_name);
> +	if (err) {
> +		err = -EINVAL;
> +		goto err_free_links;
> +	}
> +	connector->type = v4l2_fwnode_string_to_connector_type(type_name);
> +
> +	/* Now parse the connector specific properties. */
> +	switch (connector->type) {
> +	case V4L2_CONN_COMPOSITE:
> +	case V4L2_CONN_SVIDEO:
> +		err = v4l2_fwnode_connector_parse_analog(remote_pp, connector);
> +		break;
> +	case V4L2_CONN_UNKNOWN:
> +	default:
> +		pr_err("Unknown connector type\n");
> +		err = -EINVAL;
> +		goto err_free_links;
> +	}
> +
> +	fwnode_handle_put(remote_pp);
> +
> +	return err;
> +
> +err_free_links:
> +	for (i = 0; i < ep_num; i++)
> +		v4l2_fwnode_put_link(&connector->links[i]);
> +	kfree(connector->links);
> +err_put_fwnode:
> +	fwnode_handle_put(remote_pp);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_alloc_parse);
> +
>  static int
>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  					  struct v4l2_async_notifier *notifier,
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 65da646b579e..800302aa84d8 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -276,6 +276,44 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
>   */
>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
>  
> +/**
> + * v4l2_fwnode_connector_free() - free the V4L2 connector acquired by
> + * v4l2_fwnode_parse_connector()
> + * @connector: the V4L2 connector the resources of which are to be released
> + *
> + * Drop references to the connection link partners and free the memory allocated
> + * by v4l2_fwnode_parse_connector() call.
> + *
> + * It is safe to call this function with NULL argument or on a V4L2 connector
> + * the parsing of which failed.
> + */
> +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector);
> +
> +/**
> + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> + *          connected to
> + * @connector: pointer to the V4L2 fwnode connector data structure
> + *
> + * Fill the connector data structure with the connector type, label, all found
> + * links between the host and the connector as well as connector specific data.
> + * Since the label is optional it can be %NULL if no one was found.
> + *
> + * A reference is taken to both the connector and the connector destination
> + * where the connector belongs to. This must be dropped when no longer needed.
> + * Also the memory it has allocated to store the variable size data must be
> + * freed. Both dropping the references and freeing the memory is done by
> + * v4l2_fwnode_connector_free().
> + *
> + * Return:
> + * * %0 on success or a negative error code on failure:
> + * * %-ENOMEM if memory allocation failed
> + * * %-ENOLINK if the connector can't be found
> + * * %-EINVAL on parsing failure
> + */
> +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> +				      struct v4l2_fwnode_connector *connector);
> +
>  /**
>   * typedef parse_endpoint_func - Driver's callback function to be called on
>   *	each V4L2 fwnode endpoint.

-- 
Kind regards,

Sakari Ailus
