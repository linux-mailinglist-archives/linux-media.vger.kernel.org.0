Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C399293BC1
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 14:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406238AbgJTMgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 08:36:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:59053 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406224AbgJTMgF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 08:36:05 -0400
IronPort-SDR: gSr6Pm71mDYsPgPBo9u30U1GgYT5G7+ESPCiW1tzkkHdGV1iVthWkxt5lLMDGiRiPtRk+x5lan
 PQc422Dk9K4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="163708585"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; 
   d="scan'208";a="163708585"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:36:05 -0700
IronPort-SDR: /9wSKmWd89sh63M0JAy9prc4dBuCTaGVJlTnT1uERqSEdS8hxgj00ZGmAtYDf6vLN56H0TYQTO
 7xaNfXLKosIw==
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; 
   d="scan'208";a="533042490"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 05:35:58 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BADDE2062D; Tue, 20 Oct 2020 15:35:56 +0300 (EEST)
Date:   Tue, 20 Oct 2020 15:35:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 4/9] software_node: Add support for
 fwnode_graph*() family of functions
Message-ID: <20201020123556.GW13341@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-5-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel, Heikki,

Thanks for the patch.

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
> 
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

software_node_get_next_child() doesn't drop the reference of the old child
nor gets a reference to the returned node. Should it?

The function to get a named child node does.

It'd be nice if this was aligned. Or am I missing something?

This isn't really a comment on this patch though.

-- 
Kind regards,

Sakari Ailus
