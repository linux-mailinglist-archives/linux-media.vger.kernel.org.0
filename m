Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D69526386
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241746AbiEMOOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240695AbiEMOOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:14:31 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEA910FC0
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451271; x=1683987271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IgrD/9e1Qi2X8KQaCGeULNMmNyqj19eeHxi+iWnq/b0=;
  b=SS7wh+6Eq4pDfTV7LttbLx06KciBMfMgzkKvEYehst1MWFozq9Jw+7ao
   xAJF1cwnn+fcbN/vr0rsSekiIr6i4lMc7+gMadLyhGd7yBifgJIRFyrFj
   G/L/ti/zxNKa2ypiCaDMnkwWQDPT7EQGMVy0WLREbZb8gcq6prGCg/Lvg
   I7Hb6kCb02kXjyrFT4NE18HveoJK+rEWQ2X6GHvepOpaHE4iEGAW1idxA
   w1akB4kw9qP4RmIpNXhOQ7wti/bdLN98Iso4Ai0xxkznVWAiK1yurzqHr
   iSVzkY23+5zNY1n0nEaz7APfqrCmPO2SYII5Y3Y02alszLnx9PKBqdY8d
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250212117"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="250212117"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:14:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="521431664"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:14:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 07F6520FA1;
        Fri, 13 May 2022 17:14:26 +0300 (EEST)
Date:   Fri, 13 May 2022 17:14:25 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl,
        Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH 1/1] ov7251: Fix multiple problems in s_stream callback
Message-ID: <Yn5nwU3zH3dTfLdQ@paasikivi.fi.intel.com>
References: <20220513094707.2082-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513094707.2082-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 13, 2022 at 12:47:07PM +0300, Sakari Ailus wrote:
> The s_stream callback had several issues:
> 
> - If pm_runtime_get_sync() fails, the usage_count is not put.
> 
> - The mutex wasn't unlocked and the sensor wasn't suspended if
>   s_stream(subdev, 1) failed.
> 
> Fixes: ("media: i2c: Add pm_runtime support to ov7251")

I'm squashing this to the patch it fixes for the PR.

-- 
Sakari Ailus
