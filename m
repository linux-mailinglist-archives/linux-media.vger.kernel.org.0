Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AD626CDD5
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 23:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgIPVFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 17:05:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:47961 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgIPQOy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:14:54 -0400
IronPort-SDR: YM8xyj2v5IK2PGuPv2Bz6Q1liFC9nQiB3/psqLnl0UXvq1Iwki6oapQYNJ4keIvu/+QmIOtQmA
 izdEITI/XCow==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139010505"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="139010505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 09:10:21 -0700
IronPort-SDR: 3Y50nJV6jyTxRwFVh14qPPfHsdKEpLlg7UV3QSz72B9ow8R8dan/HuwotGEgAeNS1nF1kKi+ys
 ZWE1O912MAcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="336075017"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 16 Sep 2020 09:10:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIa0d-00H7Ue-Go; Wed, 16 Sep 2020 19:10:15 +0300
Date:   Wed, 16 Sep 2020 19:10:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com
Subject: Re: [PATCH v2] software_node: Add support for fwnode_graph*() family
 of functions
Message-ID: <20200916161015.GX3956970@smile.fi.intel.com>
References: <20200915232827.3416-1-djrscally@gmail.com>
 <20200916091707.GL834@valkosipuli.retiisi.org.uk>
 <7b81d743-736d-62d1-7072-d08759a0d5d7@gmail.com>
 <4a355889-6e65-70e0-1646-bb832579fd91@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a355889-6e65-70e0-1646-bb832579fd91@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 04:06:25PM +0100, Kieran Bingham wrote:
> On 16/09/2020 14:22, Dan Scally wrote:
> > On 16/09/2020 10:17, Sakari Ailus wrote:
> >> On Wed, Sep 16, 2020 at 12:28:27AM +0100, Daniel Scally wrote:

Thank you, Kieran, for detailed explanation, one small correction below though.

...

> >> This looks like a bugfix that probably should or could be backported. Could
> >> you make it a separate patch, with a Fixes: tag?
> > Yes, sure. That does change how some of the other code would need to
> > work though if this patch were applied but not the separated one. Sorry;
> > not sure what's the best way to proceed in that case. Should I just note
> > that this patch depends on the prior application of the separated one?
> 
> I think the assumption is that this individual change to
> software_node_property_present() should be in a patch on it's own
> preceeding 'this' one.
> 
> Running git-blame on drivers/base/swnode.c identifies this line as
> previously being added by: 59abd83672f70, so you would add the tag:

> Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the
> firmware node framework")

Just to point out that this must be on one line.

> to the 'fixing' patch, and that can be backported accordingly.
> 
> When patches are sent in a series, the dependency becomes implicit.
> You can do this by specifying a range when you do `git format-patch`
> 
> If you want to save off the last '2' patches, you can use a range
> shorthand of '-2':
> 
> for example:
> 
>   git format-patch -2 -v3 --cover-letter -o patches/swnode
> 
> As it's a 'series' we add a cover letter to group them, and that gives a
> location to add some free-form text as you wish too.

-- 
With Best Regards,
Andy Shevchenko


