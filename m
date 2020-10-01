Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337382805ED
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 19:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732965AbgJARuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 13:50:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:26024 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732407AbgJARuv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 13:50:51 -0400
IronPort-SDR: Po8TYo+bRjq3oLeqA78FF/ugZ+mGVH51D9VfOtTohkMSDTT+6iRTVO0H8WV1fu3GFsKo6h4Tz0
 +ybDMMGKXeNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="162033993"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="162033993"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:50:50 -0700
IronPort-SDR: 32xZXl3hpKxS3KHJmN42gQZhcK3HG5vGRe/Xn1i8w4okHfCD4btq7NPIXStbzzBkZt/GGHdizz
 IlZ3O7sGjCbw==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="339637201"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:50:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kO2j1-003HB0-PZ; Thu, 01 Oct 2020 20:50:39 +0300
Date:   Thu, 1 Oct 2020 20:50:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com
Subject: Re: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201001175039.GL3956970@smile.fi.intel.com>
References: <20201001093326.6208-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001093326.6208-1-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 01, 2020 at 10:33:26AM +0100, Daniel Scally wrote:

...

> This patch is dependent on another (which implements the software node graph
> family of functions):
> 
> https://lore.kernel.org/linux-media/20200915232827.3416-1-djrscally@gmail.com/

More thoughts about the (future) series. Can you rather do a series of patches
to understand what is going on here. I see something like this:
  patch 1. Add unregister_nodes_reverse()
	2. Use above in test_printf.c
	3. Add that graph support patch
	4. Add T: to MAINTAINERS for IPU3-CIO2
	5. Add this patch

-- 
With Best Regards,
Andy Shevchenko


