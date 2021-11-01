Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B34441ABD
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 12:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhKALiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 07:38:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:11847 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231485AbhKALiw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 07:38:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="254603062"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="254603062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 04:31:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="599003355"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 04:31:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mhVXK-002eHD-Ip;
        Mon, 01 Nov 2021 13:31:34 +0200
Date:   Mon, 1 Nov 2021 13:31:34 +0200
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
Subject: Re: [PATCH v4 16/16] media: i2c: ov8865: Fix lockdep error
Message-ID: <YX/QFlAfbTzOQuEB@smile.fi.intel.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-17-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101001119.46056-17-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 12:11:19AM +0000, Daniel Scally wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> ov8865_state_init() calls ov8865_state_mipi_configure() which uses
> __v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
> is also sensor->ctrls.handler.lock) must be locked before calling
> ov8865_state_init().
> 
> Note ov8865_state_mipi_configure() is also used in other places where
> the lock is already held so it cannot be changed itself.
> 
> This fixes the following lockdep kernel WARN:

> [   13.233413] ------------[ cut here ]------------

You may drop this noisy line.

> [   13.233421] WARNING: CPU: 0 PID: 8 at drivers/media/v4l2-core/v4l2-ctrls-api.c:833 __v4l2_ctrl_s_ctrl+0x4d/0x60 [videodev]
> ...
> [   13.234063] Call Trace:
> [   13.234074]  ov8865_state_configure+0x98b/0xc00 [ov8865]
> [   13.234095]  ov8865_probe+0x4b1/0x54c [ov8865]
> [   13.234117]  i2c_device_probe+0x13c/0x2d0

Seems to me that this should be moved to the head of the series with Fixes tag
added.

-- 
With Best Regards,
Andy Shevchenko


