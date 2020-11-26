Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8639D2C51F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387901AbgKZKWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:22:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:1115 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387674AbgKZKWJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:22:09 -0500
IronPort-SDR: zvX/oZheCuFsVTheXLnw9QYJ4ohwea/vPGF2UQukMH0sMFsqabxqLNENdgaxE5JkxWODuRpYDF
 x9Q2nbJ1mfSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="171487146"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="171487146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 02:22:08 -0800
IronPort-SDR: NaCzb73Tb6yTgC4IOTVCXEKPCfc2F8kFHE89Qa1vhKF2iQjqFrtV4B8kx/2VyVhD7BZVj44VDl
 2lRtHhi7EUcg==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="313336125"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 02:22:07 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 62EF420B24; Thu, 26 Nov 2020 12:22:05 +0200 (EET)
Date:   Thu, 26 Nov 2020 12:22:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/5] v4l2-fwnode: Remove
 v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper
Message-ID: <20201126102205.GN3940@paasikivi.fi.intel.com>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
 <20201126101251.jcsvi6g5xsbnc52w@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126101251.jcsvi6g5xsbnc52w@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Nov 26, 2020 at 11:12:51AM +0100, Jacopo Mondi wrote:
> Hi Niklas, Sakari,
> 
> On Wed, Nov 25, 2020 at 05:44:45PM +0100, Niklas Söderlund wrote:
> > Hello,
> >
> > This series aims to remove a V4L2 helper that provides a too simple
> > implementation, v4l2_async_notifier_parse_fwnode_endpoints_by_port().
> > Instead drivers shall implement what the helper does directly to get
> > greater control of the process. There is only one user left in tree of
> > this interface, R-Car VIN.
> 
> What is the plan going forward ?
> removing v4l2_async_notifier_parse_fwnode_endpoints_by_port() here
> then remove v4l2_async_notifier_parse_fwnode_endpoints() as it has a
> single user in mainline too ?
> 
> Are we standardizing all platform drivers to use
> v4l2_async_notifier_add_fwnode_subdev() and perform fwnode.match
> initialization by themselves or is there a plan to replace

Yes, please.

> v4l2_async_notifier_parse_fwnode_endpoints*() with something else ?

That's always been somewhat clunky and required special cases. The other
option, i.e. what this patchset does, is straightforward as well as allows
setting defaults in drivers, and admittedly, comes with a little bit of
extra code in drivers in areas that are driver specific. The old functions
such as v4l2_async_notifier_parse_fwnode_endpoints() just pretended they
were not...

-- 
Regards,

Sakari Ailus
