Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22DE47066DB
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 13:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEQLgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 07:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjEQLgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 07:36:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AA840E1
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684323363; x=1715859363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RdW9ny9ld8DPIZ+2+Jdwe9xBIlNPQy3byzod4HDlDq8=;
  b=c02UsZOzDA4mJIZAkE4LmC0+SKbePm7RjlHsHMOXgD23I91+HTx3XLVU
   yQXw4oNnmZ9d1qIZqvRu4p1EfV6peDZwbTtSWR0AGiNM4UxJgYpOqsy01
   GvNFktyqkGVw8G2H8U3LIIX0Lk/BaaEExo+sM3PLvZFGbyx56yCtQGRJf
   A63l54c2m5o4Pdt/srtlMNT9YKJUn4G37wiVAYQZJq+cvbCC0BaT3YKlT
   DSX26Jd0kwa22rgM+pnnGlWoKhYh0C2LBxn/6m3Pbg1QaEEjrbNr746BE
   dWl4FD99CZYl+amAjb2VN1sxDz2jq8QFg/QFxECJShKRtPq+2zirl5Dwl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354903820"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="354903820"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 04:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="695833721"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="695833721"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 04:35:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1850F120279;
        Wed, 17 May 2023 14:35:57 +0300 (EEST)
Date:   Wed, 17 May 2023 11:35:57 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        wentong.wu@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: intel: rename and move cio2-bridge out of ipu3
Message-ID: <ZGS8HZmQXuaExrwE@kekkonen.localdomain>
References: <20230517103004.724264-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517103004.724264-1-bingbu.cao@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thanks for the patch.

On Wed, May 17, 2023 at 06:30:04PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> cio2 bridge was involved along with IPU3. However, in fact all Intel
> IPUs besides IPU3 CIO2 need this bridge driver. This patch move
> bridge driver out of ipu3 directory and rename as ipu-bridge. Then
> it can be worked with IPU3 and other Intel IPUs.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Could you also rename the names used internally? I.e. cio -> ipu? But not
renaming actual CIO2 dependencies, they should be handled in separate patch
(or patches). It'd be nice to see them in the same set.

-- 
Kind regards,

Sakari Ailus
