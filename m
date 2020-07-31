Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70FE23414E
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 10:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731612AbgGaIi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 04:38:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:29166 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731442AbgGaIi7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 04:38:59 -0400
IronPort-SDR: Lbm4w4agsFagee9X18ny1OFMXSoclzNjouxgU1koI/xYgO8MS9SfLE1JbjfQOwkmmxsV5RxDwh
 oFqop11+P9AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152956787"
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="152956787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 01:38:59 -0700
IronPort-SDR: ZPDFIp5v/ttJ6NXoyDJH9IqYGXvV/z1FkdimiwgE2bLRLfErahmVbxR78il4gGqhbQTFNXYlx0
 4WERVCq1nutg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,417,1589266800"; 
   d="scan'208";a="365442807"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 31 Jul 2020 01:38:56 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1k1QZ6-005Gyk-Da; Fri, 31 Jul 2020 11:38:56 +0300
Date:   Fri, 31 Jul 2020 11:38:56 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     dan.carpenter@oracle.com, devel@driverdev.osuosl.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] staging: atomisp: move null check to earlier point
Message-ID: <20200731083856.GF3703480@smile.fi.intel.com>
References: <20200730084545.GB1793@kadam>
 <20200730221737.51569-1-cengiz@kernel.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730221737.51569-1-cengiz@kernel.wtf>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 31, 2020 at 01:17:38AM +0300, Cengiz Can wrote:
> `find_gmin_subdev` function that returns a pointer to `struct

func() are referred with name followed by parentheses.

> gmin_subdev` can return NULL.

> In `gmin_v2p8_ctrl` there's a call to this function but the possibility
> of a NULL was not checked before its being dereferenced. ie:

'. ie:' -> ', i.e.:'

> ```

Instead just shift right by two spaces.

> /* Acquired here --------v */
> struct gmin_subdev *gs = find_gmin_subdev(subdev);
> 
> /*  v------Dereferenced here */
> if (gs->v2p8_gpio >= 0) {
>     ...
> }

> ```

Drop this as per above comment.

> To avoid the issue, null check has been moved to an earlier point
> and return semantics has been changed to reflect this exception.

> Please do note that this change introduces a new return value to
> `gmin_v2p8_ctrl`.

This rather should explain better the semantics change, e.g.
"Now the function() refuses to take NULL argument and returns an error. We also
WARN() for sake of the debugging."

> [NEW] - raise a WARN and return -ENODEV if there are no subdevices.
>       - return result of `gpio_request` or `gpio_direction_output`.
>       - return 0 if GPIO is ON.
>       - return results of `regulator_enable` or `regulator_disable`.
>       - according to PMIC type, return result of `axp_regulator_set`
>         or `gmin_i2c_write`.
>       - return -EINVAL if unknown PMIC type.

This has to go after cutter '---' line below.

> Caught-by: Coverity Static Analyzer CID 1465536

Reported-by:

And as discussed previously,
Suggested-by: Mauro ...

> Signed-off-by: Cengiz Can <cengiz@kernel.wtf>

The code looks good enough (WARN() will probably go away when driver gains
better quality).

-- 
With Best Regards,
Andy Shevchenko


