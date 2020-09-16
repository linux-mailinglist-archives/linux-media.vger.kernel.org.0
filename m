Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFFB26CCB1
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgIPUsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:48:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:33041 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbgIPRBO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:01:14 -0400
IronPort-SDR: jKvmMRsbXpN7sZlnSB6ivgwpj7SiQxo79MSBd+Pk3uxHs71THSfZfIfHGPsgNkfrYN1oX6IvIF
 RCWsokkpCqxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="158754290"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="158754290"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 07:32:47 -0700
IronPort-SDR: NqTeR4wIj1OCxUIlK2a2Me8rV1JTj9i1KRs4rY8sa8onkkOG/Lo1Fpop9ZWNw465PdC1OlCfYo
 Bo+day95h8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="336043207"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 07:32:44 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIYUD-00H6OZ-0J; Wed, 16 Sep 2020 17:32:41 +0300
Date:   Wed, 16 Sep 2020 17:32:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        kieran.bingham@ideasonboard.com, jorhand@linux.microsoft.com,
        kitakar@gmail.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
Message-ID: <20200916143241.GL3956970@smile.fi.intel.com>
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 02:22:10PM +0100, Dan Scally wrote:
> On 16/09/2020 10:17, Sakari Ailus wrote:
> > On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:

...

> >> @@ -450,7 +455,7 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
> >>  		c = list_next_entry(c, entry);
> >>  	else
> >>  		c = list_first_entry(&p->children, struct swnode, entry);
> >> -	return &c->fwnode;
> >> +	return software_node_get(&c->fwnode);
> > This looks like a bugfix that probably should or could be backported. Could
> > you make it a separate patch, with a Fixes: tag?
> Yes, sure. That does change how some of the other code would need to
> work though if this patch were applied but not the separated one. Sorry;
> not sure what's the best way to proceed in that case. Should I just note
> that this patch depends on the prior application of the separated one?

It's easy to achieve. You may create a series of two, where the second one
dependant on the first one and first one has a Fixes tag and subject to
backport. I guess that's what Sakari meant.

> >>  }

-- 
With Best Regards,
Andy Shevchenko


