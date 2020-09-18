Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C1826F78B
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgIRH6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 03:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgIRH6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 03:58:34 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C94C06174A;
        Fri, 18 Sep 2020 00:58:34 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3CDAC634C89;
        Fri, 18 Sep 2020 10:57:41 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kJBH3-00024x-Dp; Fri, 18 Sep 2020 10:57:41 +0300
Date:   Fri, 18 Sep 2020 10:57:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dan Scally <djrscally@gmail.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
Message-ID: <20200918075741.GS834@valkosipuli.retiisi.org.uk>
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
 <20200918062237.GP834@valkosipuli.retiisi.org.uk>
 <294db5cf-4c95-d56c-0a42-60ca95393c06@gmail.com>
 <20200918073433.GR834@valkosipuli.retiisi.org.uk>
 <9cdd8073-430b-773a-6aa7-4698110a5416@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cdd8073-430b-773a-6aa7-4698110a5416@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 18, 2020 at 08:46:52AM +0100, Dan Scally wrote:
> On 18/09/2020 08:34, Sakari Ailus wrote:
> > On Fri, Sep 18, 2020 at 07:49:31AM +0100, Dan Scally wrote:
> >> Good morning
> >>
> >> On 18/09/2020 07:22, Sakari Ailus wrote:
> >>> Hi Dan,
> >>>
> >>> On Wed, Sep 16, 2020 at 02:22:10PM +0100, Dan Scally wrote:
> >>>> Hi Sakari - thanks for the comments
> >>>>
> >>>> On 16/09/2020 10:17, Sakari Ailus wrote:
> >>>>> Moi Daniel and Heikki,
> >>>>>
> >>>>> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:
> >>>>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >>>>>>
> >>>>>> This implements the remaining .graph_* callbacks in the
> >>>>>> fwnode operations vector for the software nodes. That makes
> >>>>>> the fwnode_graph*() functions available in the drivers also
> >>>>>> when software nodes are used.
> >>>>>>
> >>>>>> The implementation tries to mimic the "OF graph" as much as
> >>>>>> possible, but there is no support for the "reg" device
> >>>>>> property. The ports will need to have the index in their
> >>>>>> name which starts with "port" (for example "port0", "port1",
> >>>>>> ...) and endpoints will use the index of the software node
> >>>>>> that is given to them during creation. The port nodes can
> >>>>>> also be grouped under a specially named "ports" subnode,
> >>>>>> just like in DT, if necessary.
> >>>>>>
> >>>>>> The remote-endpoints are reference properties under the
> >>>>>> endpoint nodes that are named "remote-endpoint". 
> >>>>>>
> >>>>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >>>>>> Co-developed-by: Daniel Scally <djrscally@gmail.com>
> >>>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >>>>>> ---
> >>>>>> changes in v2:
> >>>>>> 	- added software_node_device_is_available
> >>>>>> 	- altered software_node_get_next_child to get references
> >>>>>> 	- altered software_node_get_next_endpoint to release references
> >>>>>> 	to ports and avoid passing invalid combinations of swnodes to
> >>>>>> 	software_node_get_next_child
> >>>>>> 	- altered swnode_graph_find_next_port to release port rather than
> >>>>>> 	old
> >>>>>> 	
> >>>>>>  drivers/base/swnode.c | 129 +++++++++++++++++++++++++++++++++++++++++-
> >>>>>>  1 file changed, 127 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> >>>>>> index 010828fc785b..d69034b807e3 100644
> >>>>>> --- a/drivers/base/swnode.c
> >>>>>> +++ b/drivers/base/swnode.c
> >>>>>> @@ -363,6 +363,11 @@ static void software_node_put(struct fwnode_handle *fwnode)
> >>>>>>  	kobject_put(&swnode->kobj);
> >>>>>>  }
> >>>>>>  
> >>>>>> +static bool software_node_device_is_available(const struct fwnode_handle *fwnode)
> >>>>>> +{
> >>>>>> +	return is_software_node(fwnode);
> >>>>> This basically tells whether the device is there. Are there software node
> >>>>> based devices, i.e. do you need this?
> >>>>>
> >>>>> If you do really need this, then I guess this could just return true for
> >>>>> now as if you somehow get here, the node is a software node anyway.
> >>>> I do think its better to include it; I'm targeting using this with
> >>>> ipu3-cio2; the cio2_parse_firmware() call there doesn't pass
> >>>> FWNODE_GRAPH_DEVICE_DISABLED to fwnode_graph_get_endpoint_by_id() so
> >>> I wonder if this has something to do with replacing the device's fwnode
> >>> in the cio2-bridge patch.
> >>>
> >>> It's the device that needs to be enabled, and it's not a software node.
> >>>
> >> I think it is because of that yes, but I don't see a way around it at
> >> the moment - unless there's a way to attach the software_node port and
> >> endpoints that cio2-bridge creates to the device's existing firmware
> >> instead.
> > I thought this was how it was meant to be used?
> >
> > The secondary field is there for this purpose. But it may be not all fwnode
> > interface functions operate on fwnode->secondary?
> Let me test it; it might just require some changes to
> software_node_graph_get_port_parent() to check if the parent fwnode is a
> secondary, and if it is to return the primary instead.

Ah, indeed. I forgot this part. I wonder if it'd cause issues to return the
primary if you've got the secondary swnode.

Heikki, any idea?

Code elsewhere (e.g. V4L2 fwnode framework + drivers) assume a device is
identified by a single fwnode, not two --- currently the swnode graph
function returning port parent returns the secondary so there's no match
with the primary fwnode.

-- 
Sakari Ailus
