Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2C726CC1D
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbgIPUjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgIPRHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:07:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E79AC0F26C5;
        Wed, 16 Sep 2020 08:07:38 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5059526B;
        Wed, 16 Sep 2020 17:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600268798;
        bh=Cbu96yTk2GMmDDkQgP47VdHwccoYIojezzJ58v7nDVM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HEzlh3VLKOrf6OfDf/lwORExX5lPNQQy1mm0dmyMhudzcDf3UPpQj8Ojoxv1fF3re
         gWAtRXG+fNfbeCzBbu3uzn9e2Pp+vhiz1PrGv0qbRsNJJD6B7gQ95Xwg1DcIOY0ksm
         uo12/xrbARqiRh8LjCL3/NRylvjWN288dRtgB1JM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
To:     Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <4a355889-6e65-70e0-1646-bb832579fd91@ideasonboard.com>
Date:   Wed, 16 Sep 2020 16:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 16/09/2020 14:22, Dan Scally wrote:
> Hi Sakari - thanks for the comments
> 
> On 16/09/2020 10:17, Sakari Ailus wrote:
>> Moi Daniel and Heikki,
>>
>> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>
>>> This implements the remaining .graph_* callbacks in the
>>> fwnode operations vector for the software nodes. That makes
>>> the fwnode_graph*() functions available in the drivers also
>>> when software nodes are used.
>>>
>>> The implementation tries to mimic the "OF graph" as much as
>>> possible, but there is no support for the "reg" device
>>> property. The ports will need to have the index in their
>>> name which starts with "port" (for example "port0", "port1",
>>> ...) and endpoints will use the index of the software node
>>> that is given to them during creation. The port nodes can
>>> also be grouped under a specially named "ports" subnode,
>>> just like in DT, if necessary.
>>>
>>> The remote-endpoints are reference properties under the
>>> endpoint nodes that are named "remote-endpoint". 
>>>
>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>> changes in v2:
>>> 	- added software_node_device_is_available
>>> 	- altered software_node_get_next_child to get references
>>> 	- altered software_node_get_next_endpoint to release references
>>> 	to ports and avoid passing invalid combinations of swnodes to
>>> 	software_node_get_next_child
>>> 	- altered swnode_graph_find_next_port to release port rather than
>>> 	old
>>> 	
>>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 127 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>>> index 010828fc785b..d69034b807e3 100644
>>> --- a/drivers/base/swnode.c
>>> +++ b/drivers/base/swnode.c
>>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>>>  	kobject_put(&swnode->kobj);
>>>  }
>>>  
>>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
>>> +{
>>> +	return is_software_node(fwnode);
>> This basically tells whether the device is there. Are there software node
>> based devices, i.e. do you need this?
>>
>> If you do really need this, then I guess this could just return true for
>> now as if you somehow get here, the node is a software node anyway.
> 
> I do think its better to include it; I'm targeting using this with
> ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
> FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
> this function does need to exist to be found by that call (or else
> cio2_parse_firmware() would need to pass that flag...but I don't know
> the effect of doing that on devices that aren't using software nodes so
> it didn't seem like a good idea). I can change it to return true though sure
> 
>>> +}
>>> +
>>>  static bool software_node_property_present(const struct fwnode_handle *fwnode,
>>>  					   const char *propname)
>>>  {
>>> @@ -450,7 +455,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>>>  		c = list_next_entry(c, entry);
>>>  	else
>>>  		c = list_first_entry(&p->children, struct swnode, entry);
>>> -	return &c->fwnode;
>>> +	return software_node_get(&c->fwnode);
>> This looks like a bugfix that probably should or could be backported. Could
>> you make it a separate patch, with a Fixes: tag?
> Yes, sure. That does change how some of the other code would need to
> work though if this patch were applied but not the separated one. Sorry;
> not sure what's the best way to proceed in that case. Should I just note
> that this patch depends on the prior application of the separated one?

I think the assumption is that this individual change to
software_node_property_present() should be in a patch on it's own
preceeding 'this' one.

Running git-blame on drivers/base/swnode.c identifies this line as
previously being added by: 59abd83672f70, so you would add the tag:

Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the
firmware node framework")

to the 'fixing' patch, and that can be backported accordingly.

When patches are sent in a series, the dependency becomes implicit.
You can do this by specifying a range when you do `git format-patch`

If you want to save off the last '2' patches, you can use a range
shorthand of '-2':

for example:

  git format-patch -2 -v3 --cover-letter -o patches/swnode

As it's a 'series' we add a cover letter to group them, and that gives a
location to add some free-form text as you wish too.

--
Kieran


>>
>>>  }
>>>  
>>>  static struct fwnode_handle *
>>> @@ -536,9 +541,125 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>>>  	return 0;
>>>  }
>>>  
>>> +static struct fwnode_handle *
>>> +swnode_graph_find_next_port(const struct fwnode_handle *parent,
>>> +			    struct fwnode_handle *port)
>>> +{
>>> +	struct fwnode_handle *old = port;
>>> +
>>> +	while ((port = software_node_get_next_child(parent, old))) {
>>> +		if (!strncmp(to_swnode(port)->node->name, "port", 4))
>>> +			return port;
>>> +		fwnode_handle_put(port);
>>> +		old = port;
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static struct fwnode_handle *
>>> +software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
>>> +				      struct fwnode_handle *endpoint)
>>> +{
>>> +	struct swnode *swnode = to_swnode(fwnode);
>>> +	struct fwnode_handle *old = endpoint;
>>> +	struct fwnode_handle *parent_of_old;
>>> +	struct fwnode_handle *parent;
>>> +	struct fwnode_handle *port;
>>> +
>>> +	if (!swnode)
>>> +		return NULL;
>>> +
>>> +	if (endpoint) {
>>> +		port = software_node_get_parent(endpoint);
>>> +		parent = software_node_get_parent(port);
>>> +	} else {
>>> +		parent = software_node_get_named_child_node(fwnode, "ports");
>>> +		if (!parent)
>>> +			parent = software_node_get(&swnode->fwnode);
>>> +
>>> +		port = swnode_graph_find_next_port(parent, NULL);
>>> +	}
>>> +
>>> +	for (; port; port = swnode_graph_find_next_port(parent, port)) {
>>> +
>>> +		if (old) {
>>> +			parent_of_old = software_node_get_parent(old);
>>> +
>>> +			if (parent_of_old != port)
>>> +				old = NULL;
>>> +
>>> +			fwnode_handle_put(parent_of_old);
>>> +		}
>>> +
>>> +		endpoint = software_node_get_next_child(port, old);
>>> +		fwnode_handle_put(old);
>>> +		if (endpoint)
>>> +			break;
>>> +
>>> +		fwnode_handle_put(port);
>>> +	}
>>> +
>>> +	fwnode_handle_put(port);
>>> +	software_node_put(parent);
>> This probably should be fwnode_handle_put() as well as this is basically
>> corresponding the device (i.e. likely not a software node).
> Yep good point, fwnode_handle_put() it is.
>>> +
>>> +	return endpoint;
>>> +}
>>> +
>>> +static struct fwnode_handle *
>>> +software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
>>> +{
>>> +	struct swnode *swnode = to_swnode(fwnode);
>>> +	const struct software_node_ref_args *ref;
>>> +	const struct property_entry *prop;
>>> +
>>> +	if (!swnode)
>>> +		return NULL;
>>> +
>>> +	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
>>> +	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
>>> +		return NULL;
>>> +
>>> +	ref = prop->pointer;
>>> +
>>> +	return software_node_get(software_node_fwnode(ref[0].node));
>>> +}
>>> +
>>> +static struct fwnode_handle *
>>> +software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
>>> +{
>>> +	struct swnode *swnode = to_swnode(fwnode);
>>> +	struct fwnode_handle *parent;
>>> +
>>> +	if (!strcmp(swnode->parent->node->name, "ports"))
>>> +		parent = &swnode->parent->parent->fwnode;
>>> +	else
>>> +		parent = &swnode->parent->fwnode;
>>> +
>>> +	return software_node_get(parent);
>>> +}
>>> +
>>> +static int
>>> +software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>>> +				   struct fwnode_endpoint *endpoint)
>>> +{
>>> +	struct swnode *swnode = to_swnode(fwnode);
>>> +	int ret;
>>> +
>>> +	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	endpoint->id = swnode->id;
>>> +	endpoint->local_fwnode = fwnode;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static const struct fwnode_operations software_node_ops = {
>>>  	.get = software_node_get,
>>>  	.put = software_node_put,
>>> +	.device_is_available = software_node_device_is_available,
>>>  	.property_present = software_node_property_present,
>>>  	.property_read_int_array = software_node_read_int_array,
>>>  	.property_read_string_array = software_node_read_string_array,
>>> @@ -547,7 +668,11 @@ static const struct fwnode_operations software_node_ops = {
>>>  	.get_parent = software_node_get_parent,
>>>  	.get_next_child_node = software_node_get_next_child,
>>>  	.get_named_child_node = software_node_get_named_child_node,
>>> -	.get_reference_args = software_node_get_reference_args
>>> +	.get_reference_args = software_node_get_reference_args,
>>> +	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
>>> +	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
>>> +	.graph_get_port_parent = software_node_graph_get_port_parent,
>>> +	.graph_parse_endpoint = software_node_graph_parse_endpoint,
>>>  };
>>>  
>>>  /* -------------------------------------------------------------------------- */
