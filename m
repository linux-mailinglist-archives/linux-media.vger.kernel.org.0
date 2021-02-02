Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E0130CE6A
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 23:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhBBWEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 17:04:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:8248 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231453AbhBBWE3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 17:04:29 -0500
IronPort-SDR: h5YkYpR463GkM+ju3UsaAsMe1I8RvgamRSjJhdWEJnJSA0+3K35KCW4+BXMNCcdvJZyxW9tTdv
 E+ppdoraJJFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199877628"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="199877628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 14:02:20 -0800
IronPort-SDR: vBVdwMaEDzrwOrY9kcBjFmDx+t1IMzWhS/MblZQ6nR1VY/Y+++bhsnGUgS4EskNL3CH+91qtPC
 EPzKdjZAx68w==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; 
   d="scan'208";a="370969802"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 14:02:18 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 39A9C205B3; Wed,  3 Feb 2021 00:02:16 +0200 (EET)
Date:   Wed, 3 Feb 2021 00:02:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>
Subject: Re: [PATCH 1/1] ipu3-cio2: Build bridge only if ACPI is enabled
Message-ID: <20210202220216.GY32460@paasikivi.fi.intel.com>
References: <20210202201440.10613-1-sakari.ailus@linux.intel.com>
 <070d3585-e21c-0bef-3740-d38fcd106f25@infradead.org>
 <20210202203022.GX32460@paasikivi.fi.intel.com>
 <2102444d-8a2b-cae7-9266-903eb14a7c21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2102444d-8a2b-cae7-9266-903eb14a7c21@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 09:37:47PM +0000, Daniel Scally wrote:
> On 02/02/2021 20:30, Sakari Ailus wrote:
> > On Tue, Feb 02, 2021 at 12:24:54PM -0800, Randy Dunlap wrote:
> >> On 2/2/21 12:14 PM, Sakari Ailus wrote:
> >>> ipu3-cio2-bridge uses several features of the ACPI framework that have no
> >>> meaningful replacement when ACPI is disabled. Instead of adding #ifdefs to
> >>> the affected places, only build the bridge code if CONFIG_ACPI is enabled.
> >>>
> >>> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> > Thanks! I'll include this in a pull request to Mauro shortly.
> >
> Ah - thank you both; sorry to have missed that.

No worries; this was missed in review, too. There are just combinations you
don't always end up testing before merging the patches.

-- 
Regards,

Sakari Ailus
