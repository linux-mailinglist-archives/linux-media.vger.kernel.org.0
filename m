Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9F2294B4C
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 12:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441774AbgJUKdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 06:33:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:53950 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438919AbgJUKdm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 06:33:42 -0400
IronPort-SDR: 1fu5scWTujzMkifnGN9Crq6F+Ugt7NYTozPYBF4h1jsu9RytYZhYq7WsvKtwh+2SG8Ok3WALqH
 cBaYGPlXAzKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="163855186"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="163855186"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 03:33:37 -0700
IronPort-SDR: rRUOT46I2XsEcGQcEFmg0uBBPsi0bPo7Y8e/ydZlDcXSsm5kTQclo7P5M0pPLAU9YHH869KWmd
 T+YsjliVWRQg==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="533476275"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 03:33:35 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3E45820815; Wed, 21 Oct 2020 13:33:33 +0300 (EEST)
Date:   Wed, 21 Oct 2020 13:33:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        senozhatsky@chromium.org, tfiga@chromium.org
Subject: Re: [PATCH] media: ov2740: change the minimal exposure value to 4
Message-ID: <20201021103333.GF2703@paasikivi.fi.intel.com>
References: <1603248250-24847-1-git-send-email-bingbu.cao@intel.com>
 <20201021092043.GD2703@paasikivi.fi.intel.com>
 <2907f55b-2854-7f4d-e9e6-6b4d386f6773@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2907f55b-2854-7f4d-e9e6-6b4d386f6773@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Oct 21, 2020 at 06:12:16PM +0800, Bingbu Cao wrote:
> Sakari, thanks.
> I did not find that on patchwork, so resend it again. :)

That patch simply seems to have been lost. It's also not on the list, only
in my inbox.

We've had e-mail delivery problems recently both ways, I suppose this is
attributable to those.

Thanks for resending so others could also see it.

-- 
Regards,

Sakari Ailus

P.S. Please avoid top posting.
