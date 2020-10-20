Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B432937EC
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391355AbgJTJVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:21:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:39820 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389774AbgJTJVw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:21:52 -0400
IronPort-SDR: 5JBgU44g+TrFdC0ZBcHouBFEpKFZ1+taYM1SCCia4G/1MEc9utgN08O/ck6M6I5UUvcQxAYdai
 8fM1lK6oZCtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154122944"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="154122944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:21:52 -0700
IronPort-SDR: jrYPBsOzch3McB0zJ8KupDFQdkV/vJIjRFZwvWsfkjn97QzeEwMAvQ4W5PTRHUXPQlwK94YIbN
 Ofz7V/51Pung==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="532983246"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 02:21:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUnqw-00BJzh-Ow; Tue, 20 Oct 2020 12:22:46 +0300
Date:   Tue, 20 Oct 2020 12:22:46 +0300
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
Subject: Re: [RFC PATCH v3 1/9] software_node: Add helper function to
 unregister arrays of software_nodes ordered parent to child
Message-ID: <20201020092246.GE4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019225903.14276-2-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
> Software nodes that are children of another software node should be
> unregistered before their parent. To allow easy unregistering of an array
> of software_nodes ordered parent to child, add a helper function to loop
> over and unregister nodes in such an array in reverse order.

> Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>

For all patches Andriy -> Andy (email stays as above!).

...

> +/**
> + * software_node_unregister_nodes_reverse - Unregister an array of software
> + * nodes in reverse order.

Can you shrink this to one line?

Something like dropping ' in reverse order.' and adding it below...

> + * @nodes: Array of software nodes to be unregistered.
> + *

...like here to explain reversed order?

> + * NOTE: The same warning applies as with software_node_unregister_nodes.

software_node_unregister_nodes()

> + * Unless you are _sure_ that the array of nodes is ordered parent to child
> + * it is wiser to remove them individually in the correct order.
> + */
> +void software_node_unregister_nodes_reverse(const struct software_node *nodes)
> +{
> +	unsigned int i = 0;
> +
> +	while (nodes[i].name)
> +		i++;
> +
> +	while (i--)
> +		software_node_unregister(&nodes[i]);
> +}

-- 
With Best Regards,
Andy Shevchenko


