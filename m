Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BF826C047
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 11:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgIPJR4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 05:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgIPJRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 05:17:55 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97D0C06174A;
        Wed, 16 Sep 2020 02:17:54 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 36E46634C8C;
        Wed, 16 Sep 2020 12:17:07 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kITYp-0001lS-C0; Wed, 16 Sep 2020 12:17:07 +0300
Date:   Wed, 16 Sep 2020 12:17:07 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
Message-ID: <20200916091707.GL834@valkosipuli.retiisi.org.uk>
References: <20200915232827.3416-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915232827.3416-1-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi Daniel and Heikki,

On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> This implements the remaining .graph_* callbacks in the
> fwnode operations vector for the software nodes. That makes
> the fwnode_graph*() functions available in the drivers also
> when software nodes are used.
> 
> The implementation tries to mimic the "OF graph" as much as
> possible, but there is no support for the "reg" device
> property. The ports will need to have the index in their
> name which starts with "port" (for example "port0", "port1",
> ...) and endpoints will use the index of the software node
> that is given to them during creation. The port nodes can
> also be grouped under a specially named "ports" subnode,
> just like in DT, if necessary.
> 
> The remote-endpoints are reference properties under the
> endpoint nodes that are named "remote-endpoint". 
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Daniel Scally <djrscally@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> changes in v2:
> 	- added software_node_device_is_available
> 	- altered software_node_get_next_child to get references
> 	- altered software_node_get_next_endpoint to release references
> 	to ports and avoid passing invalid combinations of swnodes to
> 	software_node_get_next_child
> 	- altered swnode_graph_find_next_port to release port rather than
> 	old
> 	
>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 127 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 010828fc785b..d69034b807e3 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>  	kobject_put(&swnode->kobj);
>  }
>  
> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
> +{
> +	return is_software_node(fwnode);

This basically tells whether the device is there. Are there software node
based devices, i.e. do you need this?

If you do really need this, then I guess this could just return true for
now as if you somehow get here, the node is a software node anyway.

> +}
> +
>  static bool software_node_property_present(const struct fwnode_handle *fwnode,
>  					   const char *propname)
>  {
> @@ -450,7 +455,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>  		c = list_next_entry(c, entry);
>  	else
>  		c = list_first_entry(&p->children, struct swnode, entry);
> -	return &c->fwnode;
> +	return software_node_get(&c->fwnode);

This looks like a bugfix that probably should or could be backported. Could
you make it a separate patch, with a Fixes: tag?

>  }
>  
>  static struct fwnode_handle *
> @@ -536,9 +541,125 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  	return 0;
>  }
>  
> +static struct fwnode_handle *
> +swnode_graph_find_next_port(const struct fwnode_handle *parent,
> +			    struct fwnode_handle *port)
> +{
> +	struct fwnode_handle *old = port;
> +
> +	while ((port = software_node_get_next_child(parent, old))) {
> +		if (!strncmp(to_swnode(port)->node->name, "port", 4))
> +			return port;
> +		fwnode_handle_put(port);
> +		old = port;
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
> +				      struct fwnode_handle *endpoint)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	struct fwnode_handle *old = endpoint;
> +	struct fwnode_handle *parent_of_old;
> +	struct fwnode_handle *parent;
> +	struct fwnode_handle *port;
> +
> +	if (!swnode)
> +		return NULL;
> +
> +	if (endpoint) {
> +		port = software_node_get_parent(endpoint);
> +		parent = software_node_get_parent(port);
> +	} else {
> +		parent = software_node_get_named_child_node(fwnode, "ports");
> +		if (!parent)
> +			parent = software_node_get(&swnode->fwnode);
> +
> +		port = swnode_graph_find_next_port(parent, NULL);
> +	}
> +
> +	for (; port; port = swnode_graph_find_next_port(parent, port)) {
> +
> +		if (old) {
> +			parent_of_old = software_node_get_parent(old);
> +
> +			if (parent_of_old != port)
> +				old = NULL;
> +
> +			fwnode_handle_put(parent_of_old);
> +		}
> +
> +		endpoint = software_node_get_next_child(port, old);
> +		fwnode_handle_put(old);
> +		if (endpoint)
> +			break;
> +
> +		fwnode_handle_put(port);
> +	}
> +
> +	fwnode_handle_put(port);
> +	software_node_put(parent);

This probably should be fwnode_handle_put() as well as this is basically
corresponding the device (i.e. likely not a software node).

> +
> +	return endpoint;
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	const struct software_node_ref_args *ref;
> +	const struct property_entry *prop;
> +
> +	if (!swnode)
> +		return NULL;
> +
> +	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
> +	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
> +		return NULL;
> +
> +	ref = prop->pointer;
> +
> +	return software_node_get(software_node_fwnode(ref[0].node));
> +}
> +
> +static struct fwnode_handle *
> +software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	struct fwnode_handle *parent;
> +
> +	if (!strcmp(swnode->parent->node->name, "ports"))
> +		parent = &swnode->parent->parent->fwnode;
> +	else
> +		parent = &swnode->parent->fwnode;
> +
> +	return software_node_get(parent);
> +}
> +
> +static int
> +software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
> +				   struct fwnode_endpoint *endpoint)
> +{
> +	struct swnode *swnode = to_swnode(fwnode);
> +	int ret;
> +
> +	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);
> +	if (ret)
> +		return ret;
> +
> +	endpoint->id = swnode->id;
> +	endpoint->local_fwnode = fwnode;
> +
> +	return 0;
> +}
> +
>  static const struct fwnode_operations software_node_ops = {
>  	.get = software_node_get,
>  	.put = software_node_put,
> +	.device_is_available = software_node_device_is_available,
>  	.property_present = software_node_property_present,
>  	.property_read_int_array = software_node_read_int_array,
>  	.property_read_string_array = software_node_read_string_array,
> @@ -547,7 +668,11 @@ static const struct fwnode_operations software_node_ops = {
>  	.get_parent = software_node_get_parent,
>  	.get_next_child_node = software_node_get_next_child,
>  	.get_named_child_node = software_node_get_named_child_node,
> -	.get_reference_args = software_node_get_reference_args
> +	.get_reference_args = software_node_get_reference_args,
> +	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
> +	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
> +	.graph_get_port_parent = software_node_graph_get_port_parent,
> +	.graph_parse_endpoint = software_node_graph_parse_endpoint,
>  };
>  
>  /* -------------------------------------------------------------------------- */

-- 
Kind regards,

Sakari Ailus
