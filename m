Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158DE6F1680
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 13:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbjD1LWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 07:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240436AbjD1LV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 07:21:26 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C511749D5
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682680885; x=1714216885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YY0hOXxKLjdH8iwlQSl0mIe+GH2DoIfcQ6l7OCEmb8k=;
  b=m9Ca8QI9tWCij1O1T1diKYeP48TWyHGYRonnIj2iJb4AhvlD9trpEr3h
   JhamogL8C0zQlebVS8TmdyjpkaUS0mxy26hxnedZVEdYQtEoPbGD/3OuM
   tL+jDY0xrBKruEZMF1gda3UHt7OWkYReJ8cD4Aub/7SsNgeXV2HglNpaq
   eSXvDwl+92y+rw3pTL1D3qYr12ALkW03XhWnYykNj0jWq63TiKHtFOn9J
   8LZl+ogWQAeu26v/hltQbrIoXZ4ReX4/8s4ma6bAgLWvrFl6gvubzZw82
   NWE7NufA1TezuA1GWAAm0PRPWnfc/ZNNnfx0CQPtGfLPoPKN6021HwewM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410816136"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="410816136"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759626972"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="759626972"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:21:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E884211FCA0;
        Fri, 28 Apr 2023 14:21:19 +0300 (EEST)
Date:   Fri, 28 Apr 2023 14:21:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 10/18] media: pxa_camera: Register V4L2 device early, fix
 probe error handling
Message-ID: <ZEusL7X3yr9GG5Rp@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-11-sakari.ailus@linux.intel.com>
 <20230425002506.GA4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425002506.GA4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 03:25:06AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 30, 2023 at 02:58:45PM +0300, Sakari Ailus wrote:
> > Register V4L2 device before initialising the notifier. This way the device
> > is available to the notifier from the beginning.
> 
> Could you please explain in the commit message why this is needed ? Same
> comment for subsequent patches in this series.

Yes.

> 
> > Also fix error handling in probe.
> 
> Splitting this in two patches, with the fix first, would make it easier
> to review.

I'll address these in v2.

-- 
Sakari Ailus
