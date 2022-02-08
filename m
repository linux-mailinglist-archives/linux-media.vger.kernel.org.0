Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF974AD734
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356358AbiBHLcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344839AbiBHLQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 06:16:36 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739D2C03FEC0
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644318995; x=1675854995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+vEDXTQpwHQ3zqoLR6hm6sRJl5StNuggze1cqlkpMqI=;
  b=URQ3J1c6teLNw+yKN22o+w1NYZDT54Pt93xGwqS8V3sCXl7+Er64Xaq/
   tULgzkJMU/nRBrDs3DaasW7nqJTv2+QQhW5kC0bhl4UvEAX4CiPNIdzd3
   n6FZZRrSu+pu/c2T6GgyTg+mHz0OIJQXVs3j6wvogWgJI4WbeNNDasI+1
   P9jGn+yPTMiyHYvQCJcJHwqov7dWLWcDwFkSwmNqHkpUYO8SI0Ek6LQ8m
   b7+toUE2ecMCdfioIUt+FFRJ54stQ1Enw0dRVVlsmDFYTKo6e0vz2dMyz
   ibdGhka1JYyk98seLIzmiCKDPRnSfyBJEeQeBMz3klt8g8P+233s9c5sL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="232493300"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="232493300"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 03:16:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="678072818"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 03:16:33 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 75A56203C9;
        Tue,  8 Feb 2022 13:16:31 +0200 (EET)
Date:   Tue, 8 Feb 2022 13:16:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Eugen.Hristev@microchip.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <YgJRD1Lt2QedgL7+@paasikivi.fi.intel.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

On Tue, Feb 08, 2022 at 01:06:17PM +0200, Laurent Pinchart wrote:
> > My opinion is that if we want to replace something existing with a new 
> > API or something else, we should first add the new support, block any 
> > new adopters for the old API such that everyone uses the new API, and 
> > only after that convert the old API clients to the new API.
> > So 'can be reintroduced later on' is not okay. We can't remove things in 
> > the hope that it would be reintroduced later. Just my personal take on 
> > this, feel free to have a different opinion.
> 
> When regressions are introduced this makes sense, but here we're
> dropping a feature that isn't used as no kernel driver selects a VC
> different than 0.

I'd like to add that the purpose of virtual channels in CSI-2 is to be able
to transport multiple logically separate streams over a single link. That
has never been supported in V4L2 so these flags have been unusable to begin
with.

The streams set a lot of people have been working on on their turn is the
way to support virtual channels (as well as other features such as data
types), and it does not involve using mbus flags (as the virtual channel
isn't bound to the bus).

The intent was to cc the patch to Eugen but it seems my gitconfig prevented
that.

-- 
Kind regards,

Sakari Ailus
