Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BB12938D3
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 12:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405904AbgJTKFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 06:05:18 -0400
Received: from mga17.intel.com ([192.55.52.151]:9626 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405412AbgJTKFS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 06:05:18 -0400
IronPort-SDR: 4pu+Qx3YSahBQ4f9shrHwmz37sx+ZcSb9LIGB4MuH5jHCF3TylbSyY+ykPahLPrupBpUDmfVDd
 yU5JqfD+y9QQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="147041745"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="147041745"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 03:05:18 -0700
IronPort-SDR: 35GOW96f0+iCOOvX8X8vt+j0U8FL8ZJ+CjbcpGTt1NuTnA+G5U/f7dnbITHEhGicyhF70Yq6m8
 AxXeIHh0WV5w==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="465879281"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 03:05:12 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A9E252068C; Tue, 20 Oct 2020 13:05:10 +0300 (EEST)
Date:   Tue, 20 Oct 2020 13:05:10 +0300
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
Subject: Re: [RFC PATCH v3 1/9] software_node: Add helper function to
 unregister arrays of software_nodes ordered parent to child
Message-ID: <20201020100510.GS13341@paasikivi.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-2-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel, Andy,

On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
> Software nodes that are children of another software node should be
> unregistered before their parent. To allow easy unregistering of an array
> of software_nodes ordered parent to child, add a helper function to loop
> over and unregister nodes in such an array in reverse order.
> 
> Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
> 	- patch introduced.
> 
>  drivers/base/swnode.c    | 21 +++++++++++++++++++++
>  include/linux/property.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 010828fc7..f01b1cc61 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -727,6 +727,27 @@ void software_node_unregister_nodes(const struct software_node *nodes)
>  }
>  EXPORT_SYMBOL_GPL(software_node_unregister_nodes);
>  
> +/**
> + * software_node_unregister_nodes_reverse - Unregister an array of software
> + * nodes in reverse order.
> + * @nodes: Array of software nodes to be unregistered.
> + *
> + * NOTE: The same warning applies as with software_node_unregister_nodes.
> + * Unless you are _sure_ that the array of nodes is ordered parent to child
> + * it is wiser to remove them individually in the correct order.

Could the default order in software_node_unregister_nodes() be reversed
instead? There are no users so this should be easy to change.

Doing this only one way may require enforcing the registration order in
software_node_register_nodes(), but the end result would be safer.

What do you think?

-- 
Regards,

Sakari Ailus
