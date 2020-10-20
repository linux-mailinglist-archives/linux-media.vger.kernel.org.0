Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534D7293983
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 13:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393401AbgJTLBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 07:01:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:8501 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393282AbgJTLBA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 07:01:00 -0400
IronPort-SDR: 84VCDKbpDYG/i9V1pTguMnW6a4g4jUEWqpgTmtVT10nTGlJehv+pI29V9C/rnwt3Pkn3eQc3nU
 6YBhh/wL1J3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167308376"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="167308376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:00:59 -0700
IronPort-SDR: xZ3WQGariDJAfyFaVkQfbdontik2fnd+MYGAE+fFZ/it3Y1YpXUp5sVpRWcCtggifCu/18WFpb
 KI5Lr5oaQriA==
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="353293975"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:00:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kUpOt-00BNIY-Ff; Tue, 20 Oct 2020 14:01:55 +0300
Date:   Tue, 20 Oct 2020 14:01:55 +0300
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
Message-ID: <20201020110155.GH4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020100510.GS13341@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 20, 2020 at 01:05:10PM +0300, Sakari Ailus wrote:
> On Mon, Oct 19, 2020 at 11:58:55PM +0100, Daniel Scally wrote:
> > Software nodes that are children of another software node should be
> > unregistered before their parent. To allow easy unregistering of an array
> > of software_nodes ordered parent to child, add a helper function to loop
> > over and unregister nodes in such an array in reverse order.

...

> > + * software_node_unregister_nodes_reverse - Unregister an array of software
> > + * nodes in reverse order.
> > + * @nodes: Array of software nodes to be unregistered.
> > + *
> > + * NOTE: The same warning applies as with software_node_unregister_nodes.
> > + * Unless you are _sure_ that the array of nodes is ordered parent to child
> > + * it is wiser to remove them individually in the correct order.
> 
> Could the default order in software_node_unregister_nodes() be reversed
> instead? There are no users so this should be easy to change.
> 
> Doing this only one way may require enforcing the registration order in
> software_node_register_nodes(), but the end result would be safer.
> 
> What do you think?

Will work for me (I would also hear Heikki).

But in such case let's change the order of
software_node_unregister_node_group() for the sake of consistency.

-- 
With Best Regards,
Andy Shevchenko


