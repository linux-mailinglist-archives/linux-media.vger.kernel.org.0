Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7848E7E5A0D
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 16:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjKHPcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 10:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjKHPci (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 10:32:38 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4BA1BF5
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699457556; x=1730993556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZnE66fF3uaNvkFQtSrOTxfblqx4VlhTe7NH/u+Ac5U=;
  b=A9bjWj7BLAOh5zjsVCoJY2T4b+iCTPGeJ/TLdJL9ecmePb1k1lvAHaYu
   hKSXAozPbLoSV5td67ObUrY47kDqpiZ9IMqQ5+AVY91m1Vs1j/GJrdXAJ
   Pdw6e4BkOKBL4OvanrqG+XdYpHNBzMbB2oi+jFnVueht60lQbUstGk19C
   /aXAZeARoduDaYi7ie0G/vu7xef7/GHQSPe7jkGI8VWXrEUti7Fqlqik7
   ZvcdUe7r3i774mkA/jYq6CuEEo+n/sYQqWnBVO3wvklo9XExfK2rp7m+b
   SNwAzIWj9VP/D2lX3MGI/b/DsO/n5d7HJXmy/RbFAYLZY0aELOUoc822J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389596216"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="389596216"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 07:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880244979"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="880244979"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 07:32:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1r0kXd-0000000CNWg-1YiO;
        Wed, 08 Nov 2023 17:32:29 +0200
Date:   Wed, 8 Nov 2023 17:32:29 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: Re: [PATCH v2 08/15] media: intel/ipu6: add IPU6 CSI2 receiver v4l2
 sub-device
Message-ID: <ZUuqDS7xOJcLpXvy@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-9-bingbu.cao@intel.com>
 <7c0a91f986baf62efcf0f021924653a00cdcc503.camel@gmail.com>
 <DM8PR11MB565383A795F071F50B04D1BF99A8A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <a22cea646d0d8b8022c3be8e4625d6e67a3eb7bf.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a22cea646d0d8b8022c3be8e4625d6e67a3eb7bf.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 08, 2023 at 04:00:02PM +0100, Andreas Helbech Kleist wrote:
> On Wed, 2023-11-08 at 14:50 +0000, Cao, Bingbu wrote:

...

> Now we're talking about casts. There is a cast to int32_t, but the rest
> of the code uses the s32/u32 typedefs. I don't know if one or the other
> is recommended for new code, but I think it should at least be
> consistent across the driver.

s32/u32 are preferable in the kernel code.

Also if you need to extend the sign bit, we have sign_extendXX() helpers.

-- 
With Best Regards,
Andy Shevchenko


