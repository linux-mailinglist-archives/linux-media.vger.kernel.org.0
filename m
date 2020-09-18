Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256D026FCBF
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 14:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgIRMmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 08:42:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:51066 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgIRMmH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 08:42:07 -0400
IronPort-SDR: P+R7o6vUiPwg2ztVB4Bl6NGA1altU1K4ufd19k764z0BTSq5RXNEj036NRSmvJfZw4PqTbyfBE
 r7nMbT3qxQSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="221483497"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="221483497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 05:42:06 -0700
IronPort-SDR: GSuMos98CwJ7VIRQPmMN9n0J29vwQjETsA+YfVUC259OSN1ws9GfxVs0zQXKoV08he8PFS9gMr
 BY7EboO4nZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="336791627"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Sep 2020 05:42:03 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kJFiC-00Ha71-8X; Fri, 18 Sep 2020 15:42:00 +0300
Date:   Fri, 18 Sep 2020 15:42:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dan Scally <djrscally@gmail.com>, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
Message-ID: <20200918124200.GY3956970@smile.fi.intel.com>
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
 <20200918062237.GP834@valkosipuli.retiisi.org.uk>
 <294db5cf-4c95-d56c-0a42-60ca95393c06@gmail.com>
 <20200918073433.GR834@valkosipuli.retiisi.org.uk>
 <9cdd8073-430b-773a-6aa7-4698110a5416@gmail.com>
 <20200918075741.GS834@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918075741.GS834@valkosipuli.retiisi.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 18, 2020 at 10:57:41AM +0300, Sakari Ailus wrote:
> On Fri, Sep 18, 2020 at 08:46:52AM +0100, Dan Scally wrote:
> > On 18/09/2020 08:34, Sakari Ailus wrote:
> > > On Fri, Sep 18, 2020 at 07:49:31AM +0100, Dan Scally wrote:

...

> > > The secondary field is there for this purpose. But it may be not all fwnode
> > > interface functions operate on fwnode->secondary?
> > Let me test it; it might just require some changes to
> > software_node_graph_get_port_parent() to check if the parent fwnode is a
> > secondary, and if it is to return the primary instead.
> 
> Ah, indeed. I forgot this part. I wonder if it'd cause issues to return the
> primary if you've got the secondary swnode.
> 
> Heikki, any idea?
> 
> Code elsewhere (e.g. V4L2 fwnode framework + drivers) assume a device is
> identified by a single fwnode, not two --- currently the swnode graph
> function returning port parent returns the secondary so there's no match
> with the primary fwnode.

At least recently I made a patch (114dbb4fa7c4) to support secondary in
device_get_next_child_node(). I'm not sure how we can do it on fwnode level.

And now I'm thinking that above mentioned change is just particular case, but
doesn't really move entire device property API to that.

-- 
With Best Regards,
Andy Shevchenko


