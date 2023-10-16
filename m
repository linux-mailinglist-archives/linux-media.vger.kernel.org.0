Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7F47CA2FE
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 10:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjJPI7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 04:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJPI7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 04:59:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F98E6
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697446784; x=1728982784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQkNC/Fvf75Clq+0GClBykc7BLTjTDCRa34Qcl6Z1gA=;
  b=QCEKnLI/gfKC6TQuAiyORNmSG+LYltwsz4PkSecvwYM/5veG3/ZRPYeU
   WUNmct147XfX494+ZzgKmL7RKV2hUX7BVJXdrLsUQm5nTLDzSfSVNB7oj
   gxHsUfTlC3Efcmcg0t7HB7AtbXmlWEtl2Ld/ym35GsKN3hRaX7F457nuj
   ed3R/28M/AcY5f0/OIr1CGbozgfAwuvT7g1oMveGULHSFiiqdQ3RHJHxs
   e0QlNLuh3fpxMrMpKyr3gjMu+kFxDpBrQR3ChJAOcx+YLNlF3Gm985Pzf
   xnYINmWVHh3HnUQgfr4+bqkX403cG0JvPih49MflqRJrWfgGFJHgU7CMN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449688895"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="449688895"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929280213"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="929280213"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:59:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 73F2111F82E;
        Mon, 16 Oct 2023 11:59:15 +0300 (EEST)
Date:   Mon, 16 Oct 2023 08:59:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 2/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZSz7Y0lYrywH8/Jz@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-3-sakari.ailus@linux.intel.com>
 <20231013110741.GD11101@pendragon.ideasonboard.com>
 <ZSkmPJdxlxeSzYeZ@kekkonen.localdomain>
 <20231016082452.GH23177@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016082452.GH23177@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 16, 2023 at 11:24:52AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Oct 13, 2023 at 11:13:00AM +0000, Sakari Ailus wrote:
> > On Fri, Oct 13, 2023 at 02:07:41PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 13, 2023 at 01:44:20PM +0300, Sakari Ailus wrote:
> > > > There are two sets of functions that return information from sub-device
> > > > state, one for stream-unaware users and another for stream-aware users.
> > > > Add support for stream-aware functions to return format, crop and compose
> > > > information from pad-based array that are functionally equivalent to the
> > > > old, stream-unaware ones.
> > > > 
> > > > Also check state is non-NULL, in order to guard against old drivers
> > > > potentially calling this with NULL state for active formats or selection
> > > > rectangles.
> > > 
> > > I'm not too keen on this I'm afraid :-( I think it gets confusing for
> > > drivers that are not stream-aware to have to call a function that takes
> > > a stream number. I don't see a problem with keeping two different sets
> > > of functions, one for stream-aware drivers, and one for other drivers.
> > 
> > This becomes a nuisance in drivers such as CCS that work with sub-devices
> > some of which have streams and others which don't. I don't see why we
> > should have two sets of functions to access the same information, even
> > though it's stored differently.
> > 
> > I can add a wrapper using C11 _Generic to make the stream number go away.
> 
> That could possibly be interesting.

I'll add this for v2.

-- 
Sakari Ailus
