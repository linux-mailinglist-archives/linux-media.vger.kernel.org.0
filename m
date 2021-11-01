Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDFC441AAC
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 12:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhKALdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 07:33:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:34952 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231437AbhKALdF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 07:33:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="228449836"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="228449836"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 04:30:32 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="467275325"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 04:30:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mhVVz-002eGR-Uk;
        Mon, 01 Nov 2021 13:30:11 +0200
Date:   Mon, 1 Nov 2021 13:30:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 13/16] media: i2c: Re-order runtime pm initialisation
Message-ID: <YX/Pw2n5/LXkSLxS@smile.fi.intel.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-14-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101001119.46056-14-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 12:11:16AM +0000, Daniel Scally wrote:
> The kerneldoc for pm_runtime_set_suspended() says:
> 
> "It is not valid to call this function for devices with runtime PM
> enabled"
> 
> To satisfy that requirement, re-order the calls so that
> pm_runtime_enable() is the last one.

Shouldn't this be a fix with Fixes tag applied?

-- 
With Best Regards,
Andy Shevchenko


