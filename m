Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7CA2887F6
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 13:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388164AbgJILlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 07:41:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:52296 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388152AbgJILlR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 07:41:17 -0400
IronPort-SDR: 19u1aZH5qhRd7enQRj/9HtFmeAnuOUEbuJfihmo+6CPecngLG2FxRqirS1F/+EaHg6nWWgEMgk
 v4bjt57c/Aaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165587256"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="165587256"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 04:41:15 -0700
IronPort-SDR: U/5D7PHmsqoy0sga6YSBGxwZsvG7/IIDXIw6orD3YBarFoOw4s/Qe9vhL8Q+cRfYl9u6Ipqj+u
 GVpa/6UeeR5Q==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="317008213"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 04:41:14 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQqmu-002ZPj-Ug; Fri, 09 Oct 2020 14:42:16 +0300
Date:   Fri, 9 Oct 2020 14:42:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 03/10] media: ipu2-cio2: Replace custom definition
 with PAGE_SIZE
Message-ID: <20201009114216.GV4077@smile.fi.intel.com>
References: <20200817160734.12402-1-andriy.shevchenko@linux.intel.com>
 <20200817160734.12402-3-andriy.shevchenko@linux.intel.com>
 <20201009010456.GF12857@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009010456.GF12857@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 04:04:56AM +0300, Laurent Pinchart wrote:
> On Mon, Aug 17, 2020 at 07:07:26PM +0300, Andy Shevchenko wrote:
> > It's quite unlikely that another page size will be supported,
> > but in any case there is still an inconsistency between custom
> > page size definition and generic macros used in the driver.
> > 
> > Switch over to the generic PAGE_SIZE for sake of the consistency.
> 
> Is this conceptually correct though ? Does the CIO2 have an intrinsic
> page size, or do pages here always refer to system memory pages ? In the
> latter case the change is good, otherwise a separate macro seems best.

I don't think the hardware is going to change these defaults.
But of course we may repeat all macros and constants over the code, which makes
a little sense to me, because hardware is using same settings as CPU MMU.

In principle we may do that, but in reality the page size change will bring a
hell out of it with all code being at least rechecked and I believe partially
rewritten (you can imagine how to map for example CIO2 MMU with 11-bit per page
to CPU page which is 12-bit).

-- 
With Best Regards,
Andy Shevchenko


