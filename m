Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D912937C9
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391217AbgJTJQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:16:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:64813 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729363AbgJTJQh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:16:37 -0400
IronPort-SDR: YABD17Da8xNmP0L6fLENUpQz4Bh88Gy8zV0C712ZU71A3anHkzd4auf9jzsAdHHxoDNfDAA6J5
 EjjqOmsMI74A==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167299197"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="167299197"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:16:36 -0700
IronPort-SDR: cF9B0I11+xSSbUvlMgtFt7uB2U/dweDPYgf4KJP+u8XP76+ToJK/1r/7TZb2WejierqHnNV81t
 Waw6GoEYtzlA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="353272374"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:16:31 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnls-00BJoh-Vx; Tue, 20 Oct 2020 12:17:32 +0300
Date:   Tue, 20 Oct 2020 12:17:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 4/9] software_node: Add support for
 fwnode_graph*() family of functions
Message-ID: <20201020091732.GB4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-5-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:58:58PM +0100, Daniel Scally wrote:
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

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Daniel Scally <djrscally@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> changes in v3:
> 	- removed software_node_device_is_available
> 	- moved the change to software_node_get_next_child to a separate
> 	patch
> 	- switched to use fwnode_handle_put() in graph_get_next_endpoint()
> 	instead of software_node_put()
> 
> changes in v2:
> 	- added software_node_device_is_available
> 	- altered software_node_get_next_child to get references
> 	- altered software_node_get_next_endpoint to release references
> 	to ports and avoid passing invalid combinations of swnodes to
> 	software_node_get_next_child
> 	- altered swnode_graph_find_next_port to release port rather than
> 	old
>  drivers/base/swnode.c | 120 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 741149b90..3732530ce 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -536,6 +536,120 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
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
> +	fwnode_handle_put(parent);
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
> @@ -547,7 +661,11 @@ static const struct fwnode_operations software_node_ops = {
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
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


