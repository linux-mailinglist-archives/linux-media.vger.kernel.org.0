Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F0E293991
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 13:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393441AbgJTLEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 07:04:52 -0400
Received: from mga06.intel.com ([134.134.136.31]:61519 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392468AbgJTLEv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 07:04:51 -0400
IronPort-SDR: tmvhHJXz4j9S7eLGJ109d/HszHGNBQmwkAgydkDiUwqFkwL9E0sAXIAoqUhxRir+bz8JcDOCOB
 1LyfMKs0flFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="228821020"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="228821020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2020 04:04:51 -0700
IronPort-SDR: npN9kWgKjjJnhfEQWH/SuWkWkZvWHJ/nF9dGRx4hTzeFThuwV6gRcELF8qSsP00wi4AyMLXU3+
 Z/9eWFYWUDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="scan'208";a="422472099"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 Oct 2020 04:04:44 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 20 Oct 2020 14:04:44 +0300
Date:   Tue, 20 Oct 2020 14:04:44 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        dmitry.torokhov@gmail.com,
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
Message-ID: <20201020110444.GN1667571@kuha.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-2-djrscally@gmail.com>
 <20201020100510.GS13341@paasikivi.fi.intel.com>
 <20201020110155.GH4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020110155.GH4077@smile.fi.intel.com>
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

Sounds reasonable to me.

thanks,

-- 
heikki
