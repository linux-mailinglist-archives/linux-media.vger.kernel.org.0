Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0F54CA052
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 10:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240360AbiCBJIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 04:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240327AbiCBJI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 04:08:29 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC66340E7
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 01:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646212065; x=1677748065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFwzaWZicpjrDRp4hSYfK2vX83nNCzakVg2IvBxJH2g=;
  b=bDaQwAxWLToQ/PJSDfxNZtAMp9fTSVVgI/LVfvrnGdkhjZZbRIJWKUIw
   IwaYXyall1QIKxU29ntRYGl495JpK85bgp8xQw2ULkQPzfnNmMEELirWZ
   wsywtgSmsjMoaFthZQn47NfX1ldpjhyYZGXJBZzSlc6Z2LVq9QVBPtwk5
   JlliRot0QpLmubcqs2wDNvUaGfcNAJasjycXaz4KrmWNQeb4NY5rh2kgT
   cDGVfi7v0UaokRdnK7OwNlxUNVKbxd1yaoh4jCQThYgJEsSard+VzVM+3
   X0FPPuEKs8OrP2NCyofMNaVtWoxRHVkG5+NOmJLf8iRWfglVilbwkqpmI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233970750"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="233970750"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 01:07:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="593942086"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 01:07:43 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6B9F020150;
        Wed,  2 Mar 2022 11:07:41 +0200 (EET)
Date:   Wed, 2 Mar 2022 11:07:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Message-ID: <Yh8z3eARejDeEwwo@paasikivi.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
 <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
 <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
 <Yhy4MwU320D3mxeO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yhy4MwU320D3mxeO@smile.fi.intel.com>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 28, 2022 at 01:55:31PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 25, 2022 at 10:04:29PM +0000, Daniel Scally wrote:
> > On 25/02/2022 17:09, Andy Shevchenko wrote:
> > > On Fri, Feb 25, 2022 at 12:07:49AM +0000, Daniel Scally wrote:
> 
> ...
> 
> > > >   	/* get system clock (xclk) */
> > > > -	ov7251->xclk = devm_clk_get(dev, "xclk");
> > > > +	ov7251->xclk = devm_clk_get(dev, NULL);
> > > Why a clock doesn't have a name anymore?
> > > Shouldn't you rather switch to _optional()?
> > 
> > The problem is since we could have a the clock coming from some dt file with
> > it named xclk, as this driver is obviously designed for, but it also can be
> > created by the int3472-tps68470 or int3472-discrete drivers which don't use
> > that name. Without knowing what it's called, best thing I could think to do
> > was remove the name and rely on device matching.
> 
> So, then the Q is why it's not called the same in the other drivers?

FWIW, most sensor drivers use NULL for the name as there's just a single
clock. This one is rather an exception. Existing DT should continue to just
work as well as not specifying the name gives you the first one.

The name could be removed frem the bindings IMO.

-- 
Sakari Ailus
