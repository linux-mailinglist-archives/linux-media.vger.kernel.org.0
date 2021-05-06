Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B9D374F57
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 08:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhEFG3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 02:29:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:9101 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229622AbhEFG3R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 02:29:17 -0400
IronPort-SDR: c65634ATLMNAmD/nGJCQKlz7wI7Pybs/VJx8/SvIfD8y78tLSV/pEPuKyHX44IoH7cJABtfhhL
 4zu4S4LfTLsw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="198030330"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="198030330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 23:28:19 -0700
IronPort-SDR: 3r1D4dcB7e5qP36FNpP5S6WsMzC9h7EJZskR51o7p8kFu1PymHKrJGIlJN+5MAt8T4j+fQQOry
 PVbdWBq3hgKw==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="430379026"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 23:28:18 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4F1CA20315;
        Thu,  6 May 2021 09:28:16 +0300 (EEST)
Date:   Thu, 6 May 2021 09:28:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, ezequiel.garcia@collabora.com
Subject: Re: [PATCH v3 1/1] v4l: async, fwnode: Improve module organisation
Message-ID: <20210506062816.GT3@paasikivi.fi.intel.com>
References: <20210504210642.9568-1-sakari.ailus@linux.intel.com>
 <0c0bf5d35c3098188dc594268e721f8133f38789.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c0bf5d35c3098188dc594268e721f8133f38789.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 05, 2021 at 07:12:30PM -0300, Ezequiel Garcia wrote:
> On Wed, 2021-05-05 at 00:06 +0300, Sakari Ailus wrote:
> > The V4L2 async framework is generally used with the V4L2 fwnode, which
> > also depends on the former. There are a few exceptions but they are
> > relatively few.
> > 
> > At the same time there is a vast number of systems that need videodev
> > module, but have no use for v4l2-async that's now part of videodev.
> > 
> > In order to improve, split the v4l2-async into its own module. Selecting
> > V4L2_FWNODE also selects V4L2_ASYNC.
> > 
> > This also moves the initialisation of the debufs entries for async subdevs
> > to loading of the v4l2-async module. The directory is named as
> > "v4l2-async".
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks, Ezequiel!

-- 
Sakari Ailus
