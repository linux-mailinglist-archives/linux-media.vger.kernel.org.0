Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9412294AAD
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441436AbgJUJjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:39:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:7764 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438223AbgJUJjR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:39:17 -0400
IronPort-SDR: zQj6bhiLU2ROlVwhwGGHu8L0u+M09jpkCVmD2hZuGPohO2+r2ozJHDHGYlWPsvpFaJozTZdTEi
 659PleEiwk5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167460321"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="167460321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:39:15 -0700
IronPort-SDR: zGez5Kh8q4wHyOIXeiQvDw4ckKkpYx8lLshVMlr3unshRSLMhRPuAG4E+Vc4pJPjkA8vbXafKk
 Eu7Vpi/CQ/VA==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="348508345"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:39:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kVAbJ-00C9hk-AP; Wed, 21 Oct 2020 12:40:09 +0300
Date:   Wed, 21 Oct 2020 12:40:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, yong.zhi@intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 1/9] software_node: Add helper function to
 unregister arrays of software_nodes ordered parent to child
Message-ID: <20201021094009.GN4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
 <b6909e37-cd8f-2c1a-126c-40e34ba2a560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6909e37-cd8f-2c1a-126c-40e34ba2a560@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 11:52:56PM +0100, Dan Scally wrote:
> On 20/10/2020 11:05, Sakari Ailus wrote:
> > On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
> >> Software nodes that are children of another software node should be
> >> unregistered before their parent. To allow easy unregistering of an array
> >> of software_nodes ordered parent to child, add a helper function to loop
> >> over and unregister nodes in such an array in reverse order.

...

> >> + * software_node_unregister_nodes_reverse - Unregister an array of software
> >> + * nodes in reverse order.
> >> + * @nodes: Array of software nodes to be unregistered.
> >> + *
> >> + * NOTE: The same warning applies as with software_node_unregister_nodes.
> >> + * Unless you are _sure_ that the array of nodes is ordered parent to child
> >> + * it is wiser to remove them individually in the correct order.
> > Could the default order in software_node_unregister_nodes() be reversed
> > instead? There are no users so this should be easy to change.
> >
> > Doing this only one way may require enforcing the registration order in
> > software_node_register_nodes(), but the end result would be safer.
> >
> > What do you think?
> 
> Yeah fine by me. We can just use software_node_to_swnode(node->parent)
> within software_node_unregister_nodes() to check that children come
> after their parents have already been processed. I'll add a patch to do
> that in the next version of this series, and another changing the
> ordering of software_node_unregister_node_group() as Andy suggests for
> consistency.

I remember it was a big discussion between Rafael, Heikki and Greg KH about
child-parent release in kobjects. That ended up with few patches to device
object handling along with one that reversed the order of swnode unregistering
in test_printf.c. So here is the question who is maintaining the order: a kref
(via kobject) or a caller?

-- 
With Best Regards,
Andy Shevchenko


