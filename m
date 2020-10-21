Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9062294A93
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437405AbgJUJc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:32:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:50786 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391045AbgJUJc1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:32:27 -0400
IronPort-SDR: E5yBYKFnh+0CFGgYF2lGnE4S1/HN8eu6K+2pFY1CBKV5pBJuD4Hg1TPej70v4uwzJ94DVDak8q
 83rvcYUKoWOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="184993153"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="184993153"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:32:25 -0700
IronPort-SDR: uIsyGHh8GhoqAsZebAcX7woAL+Q19e76vrn2ZrsSz02YK9jPJ2m7H7ZrDe6SJIMKxMPitUddvG
 XKkBQ6rX+0PQ==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="302022482"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:32:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kVAUj-00C9Tu-2v; Wed, 21 Oct 2020 12:33:21 +0300
Date:   Wed, 21 Oct 2020 12:33:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
Subject: Re: [RFC PATCH v3 3/9] software_node: Fix failure to hold refcount
 in software_node_get_next_child
Message-ID: <20201021093321.GM4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-4-djrscally@gmail.com>
 <20201020133148.GB843@valkosipuli.retiisi.org.uk>
 <c1a7beba-faff-e06d-1517-5b30d777b252@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a7beba-faff-e06d-1517-5b30d777b252@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 12:25:28AM +0100, Dan Scally wrote:
> On 20/10/2020 14:31, Sakari Ailus wrote:
> > On Mon, Oct 19, 2020 at 11:58:57PM +0100, Daniel Scally wrote:

> >> +	return software_node_get(&c->fwnode);
> > I believe similarly, the function should drop the reference to the previous
> > node, and not expect the caller to do this. The OF equivalent does the
> > same.
> 
> I think I prefer it this way myself, since the alternative is having to
> explicitly call *_node_get() on a returned child if you want to keep it
> but also keep iterating. But I agree that it's important to take a
> consistent approach. I'll add that too; this will mean
> swnode_graph_find_next_port() and
> software_node_graph_get_next_endpoint() in patch 4 of this series will
> need changing slightly to square away their references.

What about ACPI case? Does it square?

-- 
With Best Regards,
Andy Shevchenko


