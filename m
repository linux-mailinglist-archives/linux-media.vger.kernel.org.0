Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DD432EF37
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 16:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhCEPnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 10:43:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:47565 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhCEPml (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 10:42:41 -0500
IronPort-SDR: IG43jqmOHLEAg5IXpOrfDeQrpqLLNCrKAVAxMlABlSUWPtshIDoCh6AKDlORbqWI74OIGVBQIJ
 1T8ybUReymKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9914"; a="184293761"
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; 
   d="scan'208";a="184293761"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 07:42:40 -0800
IronPort-SDR: dZr1nM+3wpKK7rwbZVOYsZxztWeY5VYkPdD55C23r0TIqdQZFC12thGNxORqdVK9V8ziZUEFGF
 CweRUjgCK4wg==
X-IronPort-AV: E=Sophos;i="5.81,225,1610438400"; 
   d="scan'208";a="401716362"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 07:42:38 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AC77D202B5;
        Fri,  5 Mar 2021 17:42:36 +0200 (EET)
Date:   Fri, 5 Mar 2021 17:42:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com
Subject: Re: [RFC PATCH 0/4] use v4l2_get_link_freq() in CSI receiver drivers
Message-ID: <20210305154236.GW3@paasikivi.fi.intel.com>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303180817.12285-1-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 03, 2021 at 09:08:13PM +0300, Andrey Konovalov wrote:
> This patchset continues the work discussed in the "[RFC] Repurpose
> V4L2_CID_PIXEL_RATE for the sampling rate in the pixel array" thread [1].
> 
> This patchset follows up the patchset for camss driver [2] of the same
> purpose, and makes the rest of the receiver drivers in drivers/media
> and drivers/staging/media to use v4l2_get_link_freq() instead of
> V4L2_CID_PIXEL_RATE.
> 
> This patchset has been build tested only, as I don't have access to the
> hardware. Most of the changes are fairly straightforward except for the
> ones in the omap4iss driver. I would appreciate if people with better
> knowledge of the omap4iss driver reviewed the last patch in this series,
> and checked if I got the logic in the driver right.

To me this looks good, hopefully people could test the set, too.

-- 
Sakari Ailus
