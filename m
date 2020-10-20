Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA200293987
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 13:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393435AbgJTLBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 07:01:41 -0400
Received: from mga04.intel.com ([192.55.52.120]:43545 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393431AbgJTLBl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 07:01:41 -0400
IronPort-SDR: 6LAmPSWwYqxXlFS667X5P0Hpd1wQ0ZhTo0Rm6/OYMVF80PC98uHu7+UeTMR8i3kd6BlK5j/8fa
 z1Ss7RHm0wIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="164579190"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="164579190"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:01:40 -0700
IronPort-SDR: Xd2Z2MADxMKgQVdh4bfvaL6oxTyKNw178RongcTFfGxhB+qSI9pQxYn5qA7/2I7/tmjiNErGKu
 fug8h5UUtWRA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="359138186"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:01:35 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUpPY-00BNKI-OF; Tue, 20 Oct 2020 14:02:36 +0300
Date:   Tue, 20 Oct 2020 14:02:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
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
Message-ID: <20201020110236.GI4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
 <20201020110155.GH4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020110155.GH4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 02:01:55PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2020 at 01:05:10PM +0300, Sakari Ailus wrote:
> > On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
> > > Software nodes that are children of another software node should be
> > > unregistered before their parent. To allow easy unregistering of an array
> > > of software_nodes ordered parent to child, add a helper function to loop
> > > over and unregister nodes in such an array in reverse order.
> 
> ...
> 
> > > + * software_node_unregister_nodes_reverse - Unregister an array of software
> > > + * nodes in reverse order.
> > > + * @nodes: Array of software nodes to be unregistered.
> > > + *
> > > + * NOTE: The same warning applies as with software_node_unregister_nodes.
> > > + * Unless you are _sure_ that the array of nodes is ordered parent to child
> > > + * it is wiser to remove them individually in the correct order.
> > 
> > Could the default order in software_node_unregister_nodes() be reversed
> > instead? There are no users so this should be easy to change.
> > 
> > Doing this only one way may require enforcing the registration order in
> > software_node_register_nodes(), but the end result would be safer.
> > 
> > What do you think?
> 
> Will work for me (I would also hear Heikki).
> 
> But in such case let's change the order of
> software_node_unregister_node_group() for the sake of consistency.

But either way we will need a note to describe the ordering.

-- 
With Best Regards,
Andy Shevchenko


