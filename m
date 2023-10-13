Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED067C8445
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjJMLTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjJMLTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:19:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7139B7
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195982; x=1728731982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6xzh19EmKbi2ni2xP2TDCqeapVWPg8r/YSmvinZ015U=;
  b=SzroJrkejqGrFa1j0E4MjjkeFxI0GlLAK+CXAJFV7gRAkcspY2sbOfx2
   HfWVpqyRM2iKCgSpmqMHNpQ/2I9KNSpRqZHhAnngjVT2w6/qFRMrJ2WmM
   gWzOBjJOZjZYx+LYoVdVCby2hRVn6COS+M9gqmX4EyU8COOXYDcxBmvfl
   OkFqy1Ethc38Cx19ZMJKxvYO/yGva12sZYVx8xi4HIEmmQhgYIsPfACQG
   VOcbSvLOUWIWUaTEVmMkqf9JW7dIXInIzHc1wDLkviwOHR1T3nlRqgBDU
   SLMimdoJfBj0bhIMZn9XBq3Ei1ete5WWSgA9hZk+69J+uLLMIqEqN9WyI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382386879"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382386879"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001912070"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1001912070"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:19:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0DBB9120A75;
        Fri, 13 Oct 2023 14:13:00 +0300 (EEST)
Date:   Fri, 13 Oct 2023 11:13:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 2/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZSkmPJdxlxeSzYeZ@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-3-sakari.ailus@linux.intel.com>
 <20231013110741.GD11101@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013110741.GD11101@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 13, 2023 at 02:07:41PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Oct 13, 2023 at 01:44:20PM +0300, Sakari Ailus wrote:
> > There are two sets of functions that return information from sub-device
> > state, one for stream-unaware users and another for stream-aware users.
> > Add support for stream-aware functions to return format, crop and compose
> > information from pad-based array that are functionally equivalent to the
> > old, stream-unaware ones.
> > 
> > Also check state is non-NULL, in order to guard against old drivers
> > potentially calling this with NULL state for active formats or selection
> > rectangles.
> 
> I'm not too keen on this I'm afraid :-( I think it gets confusing for
> drivers that are not stream-aware to have to call a function that takes
> a stream number. I don't see a problem with keeping two different sets
> of functions, one for stream-aware drivers, and one for other drivers.

This becomes a nuisance in drivers such as CCS that work with sub-devices
some of which have streams and others which don't. I don't see why we
should have two sets of functions to access the same information, even
though it's stored differently.

I can add a wrapper using C11 _Generic to make the stream number go away.

-- 
Regards,

Sakari Ailus
