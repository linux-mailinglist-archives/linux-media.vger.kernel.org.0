Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F272D11A3
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 14:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLGNQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 08:16:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:15383 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725550AbgLGNQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 08:16:36 -0500
IronPort-SDR: 9MJvIj5UBPmY/Sp8++NTNgCA5eUo7FYiR7OeWtem8n/mKWG6X/BymJjaoqlG9+ZEaXRIinzPBm
 9hJ/kX8fXBCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="170186434"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="170186434"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 05:14:51 -0800
IronPort-SDR: 7X7gGi9e8OQvv5SmocmK0RyRyYCsQgWRDAKF27hovQ57aeLlK9gxzfJaFq1eufj+8RYPoMtfN/
 y3sxxtDmxvFw==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="407138115"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 05:14:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0C56D20901; Mon,  7 Dec 2020 15:14:47 +0200 (EET)
Date:   Mon, 7 Dec 2020 15:14:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-ID: <20201207131446.GA852@paasikivi.fi.intel.com>
References: <X84nbdgv0a/ak2ef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X84nbdgv0a/ak2ef@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> The "ret" variable isn't set on the no-op path where we are setting to
> on/off and it's in the on or off state already.
> 
> Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch.

This issue has been fixed by another patch here:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>

-- 
Kind regards,

Sakari Ailus
