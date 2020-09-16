Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C7326C885
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 20:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgIPSvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 14:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgIPSJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 14:09:11 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E5DC014B0A;
        Wed, 16 Sep 2020 06:22:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l9so3017866wme.3;
        Wed, 16 Sep 2020 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pZIuGtg8ndElc6lTHl35ZSWkRYj/mGSbp5U5gzAABiQ=;
        b=bDg0CDZDwcRlSYeelPOTiT0FEhVTGG10jRe6geoEt/LqOAoAHuSt2ahL1A9CZCTZnF
         OqGWKqxK5PCIz6iPfUf+4v9h4Orlltx2ND24uuakGxCFDuULIlNC2Xybool4Ae4xj52U
         MBYHi+x8OeofYusyWXWlg8GQzWS+wks4hRICLZDQveXgeGnFBHsh3ghHTipqAG1lCP/Z
         U5regNaMdpE6o+C5D0X6zmOvbU2Mh+FJ226gH7Fts7dHLXuO2poNXRzyfjTAINZ2Qqfr
         ueQmRuTkufWHhXuPr1s02q6sPjIVfkgOfBN3ABevLaDYqdfDo+Uhv/8DLUwLznst9Lya
         Y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pZIuGtg8ndElc6lTHl35ZSWkRYj/mGSbp5U5gzAABiQ=;
        b=TDOXwh9COSYuljx5VgQYxFxDnDk5Tu06IFnkhJn7WwaCXjh+rny2+Tj0GWfpkVHjS0
         WNbbOjgsjj5Ed+1LfL4zW62RHcmRoqJpCNKbwob1sp/rgLiz/J/bWD1CsAxOFH41C8bP
         Y736QyewMC1NgzXc9wKjJkwsIhb62aHYkI8kj63WqdpJjNq91wPKECW7TsGn2c1FdTja
         4VClRkdBQLTO0VUEBSv9fbXRIMkApMX9MRNI7VlVvuQU32Mv/IMCzVacuNf/0JuI1sS9
         Yt3cs1bysV1gZLRg4EyFUaWemb0eOaO27WKMmADV//By+dqbCjCG6KmdrJjAgPq2bjKZ
         eyGw==
X-Gm-Message-State: AOAM533EaVb1AoCO9UynTb/ZkQmXR77GLtN3lBR5HMNCtkYexhN57fTR
        4VsYZU1jIlfO8hlYqLdk1KIXOLLuNkK6wEMo
X-Google-Smtp-Source: ABdhPJwiuyc/02V9BaQmHUoc+u0ewDrMdqrTKmfqdfswDpCVJC6aPrBFkJ8lMZkOFzh2d3qVxKHIVQ==
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr4625473wme.140.1600262531970;
        Wed, 16 Sep 2020 06:22:11 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id a17sm35590262wra.24.2020.09.16.06.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 06:22:11 -0700 (PDT)
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
Date:   Wed, 16 Sep 2020 14:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916091707.GL834@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - thanks for the comments

On 16/09/2020 10:17, Sakari Ailus wrote:
> Moi Daniel and Heikki,
>
> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> This implements the remaining .graph_* callbacks in the
>> fwnode operations vector for the software nodes. That makes
>> the fwnode_graph*() functions available in the drivers also
>> when software nodes are used.
>>
>> The implementation tries to mimic the "OF graph" as much as
>> possible, but there is no support for the "reg" device
>> property. The ports will need to have the index in their
>> name which starts with "port" (for example "port0", "port1",
>> ...) and endpoints will use the index of the software node
>> that is given to them during creation. The port nodes can
>> also be grouped under a specially named "ports" subnode,
>> just like in DT, if necessary.
>>
>> The remote-endpoints are reference properties under the
>> endpoint nodes that are named "remote-endpoint". 
>>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> changes in v2:
>> 	- added software_node_device_is_available
>> 	- altered software_node_get_next_child to get references
>> 	- altered software_node_get_next_endpoint to release references
>> 	to ports and avoid passing invalid combinations of swnodes to
>> 	software_node_get_next_child
>> 	- altered swnode_graph_find_next_port to release port rather than
>> 	old
>> 	
>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 127 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>> index 010828fc785b..d69034b807e3 100644
>> --- a/drivers/base/swnode.c
>> +++ b/drivers/base/swnode.c
>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
>>  	kobject_put(&swnode->kobj);
>>  }
>>  
>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
>> +{
>> +	return is_software_node(fwnode);
> This basically tells whether the device is there. Are there software node
> based devices, i.e. do you need this?
>
> If you do really need this, then I guess this could just return true for
> now as if you somehow get here, the node is a software node anyway.

I do think its better to include it; I'm targeting using this with
ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
this function does need to exist to be found by that call (or else
cio2_parse_firmware() would need to pass that flag...but I don't know
the effect of doing that on devices that aren't using software nodes so
it didn't seem like a good idea). I can change it to return true though sure

>> +}
>> +
>>  static bool software_node_property_present(const struct fwnode_handle *fwnode,
>>  					   const char *propname)
>>  {
>> @@ -450,7 +455,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>>  		c = list_next_entry(c, entry);
>>  	else
>>  		c = list_first_entry(&p->children, struct swnode, entry);
>> -	return &c->fwnode;
>> +	return software_node_get(&c->fwnode);
> This looks like a bugfix that probably should or could be backported. Could
> you make it a separate patch, with a Fixes: tag?
Yes, sure. That does change how some of the other code would need to
work though if this patch were applied but not the separated one. Sorry;
not sure what's the best way to proceed in that case. Should I just note
that this patch depends on the prior application of the separated one?
>
>>  }
>>  
>>  static struct fwnode_handle *
>> @@ -536,9 +541,125 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>>  	return 0;
>>  }
>>  
>> +static struct fwnode_handle *
>> +swnode_graph_find_next_port(const struct fwnode_handle *parent,
>> +			    struct fwnode_handle *port)
>> +{
>> +	struct fwnode_handle *old = port;
>> +
>> +	while ((port = software_node_get_next_child(parent, old))) {
>> +		if (!strncmp(to_swnode(port)->node->name, "port", 4))
>> +			return port;
>> +		fwnode_handle_put(port);
>> +		old = port;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct fwnode_handle *
>> +software_node_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
>> +				      struct fwnode_handle *endpoint)
>> +{
>> +	struct swnode *swnode = to_swnode(fwnode);
>> +	struct fwnode_handle *old = endpoint;
>> +	struct fwnode_handle *parent_of_old;
>> +	struct fwnode_handle *parent;
>> +	struct fwnode_handle *port;
>> +
>> +	if (!swnode)
>> +		return NULL;
>> +
>> +	if (endpoint) {
>> +		port = software_node_get_parent(endpoint);
>> +		parent = software_node_get_parent(port);
>> +	} else {
>> +		parent = software_node_get_named_child_node(fwnode, "ports");
>> +		if (!parent)
>> +			parent = software_node_get(&swnode->fwnode);
>> +
>> +		port = swnode_graph_find_next_port(parent, NULL);
>> +	}
>> +
>> +	for (; port; port = swnode_graph_find_next_port(parent, port)) {
>> +
>> +		if (old) {
>> +			parent_of_old = software_node_get_parent(old);
>> +
>> +			if (parent_of_old != port)
>> +				old = NULL;
>> +
>> +			fwnode_handle_put(parent_of_old);
>> +		}
>> +
>> +		endpoint = software_node_get_next_child(port, old);
>> +		fwnode_handle_put(old);
>> +		if (endpoint)
>> +			break;
>> +
>> +		fwnode_handle_put(port);
>> +	}
>> +
>> +	fwnode_handle_put(port);
>> +	software_node_put(parent);
> This probably should be fwnode_handle_put() as well as this is basically
> corresponding the device (i.e. likely not a software node).
Yep good point, fwnode_handle_put() it is.
>> +
>> +	return endpoint;
>> +}
>> +
>> +static struct fwnode_handle *
>> +software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
>> +{
>> +	struct swnode *swnode = to_swnode(fwnode);
>> +	const struct software_node_ref_args *ref;
>> +	const struct property_entry *prop;
>> +
>> +	if (!swnode)
>> +		return NULL;
>> +
>> +	prop = property_entry_get(swnode->node->properties, "remote-endpoint");
>> +	if (!prop || prop->type != DEV_PROP_REF || prop->is_inline)
>> +		return NULL;
>> +
>> +	ref = prop->pointer;
>> +
>> +	return software_node_get(software_node_fwnode(ref[0].node));
>> +}
>> +
>> +static struct fwnode_handle *
>> +software_node_graph_get_port_parent(struct fwnode_handle *fwnode)
>> +{
>> +	struct swnode *swnode = to_swnode(fwnode);
>> +	struct fwnode_handle *parent;
>> +
>> +	if (!strcmp(swnode->parent->node->name, "ports"))
>> +		parent = &swnode->parent->parent->fwnode;
>> +	else
>> +		parent = &swnode->parent->fwnode;
>> +
>> +	return software_node_get(parent);
>> +}
>> +
>> +static int
>> +software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>> +				   struct fwnode_endpoint *endpoint)
>> +{
>> +	struct swnode *swnode = to_swnode(fwnode);
>> +	int ret;
>> +
>> +	ret = kstrtou32(swnode->parent->node->name + 4, 10, &endpoint->port);
>> +	if (ret)
>> +		return ret;
>> +
>> +	endpoint->id = swnode->id;
>> +	endpoint->local_fwnode = fwnode;
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct fwnode_operations software_node_ops = {
>>  	.get = software_node_get,
>>  	.put = software_node_put,
>> +	.device_is_available = software_node_device_is_available,
>>  	.property_present = software_node_property_present,
>>  	.property_read_int_array = software_node_read_int_array,
>>  	.property_read_string_array = software_node_read_string_array,
>> @@ -547,7 +668,11 @@ static const struct fwnode_operations software_node_ops = {
>>  	.get_parent = software_node_get_parent,
>>  	.get_next_child_node = software_node_get_next_child,
>>  	.get_named_child_node = software_node_get_named_child_node,
>> -	.get_reference_args = software_node_get_reference_args
>> +	.get_reference_args = software_node_get_reference_args,
>> +	.graph_get_next_endpoint = software_node_graph_get_next_endpoint,
>> +	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
>> +	.graph_get_port_parent = software_node_graph_get_port_parent,
>> +	.graph_parse_endpoint = software_node_graph_parse_endpoint,
>>  };
>>  
>>  /* -------------------------------------------------------------------------- */
