Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4914A2B87A3
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 23:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgKRWYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 17:24:44 -0500
Received: from mga18.intel.com ([134.134.136.126]:25450 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgKRWYo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 17:24:44 -0500
IronPort-SDR: TUYNHvBQtI0HJl2GvQe6EloLfr3LyMOls/f9Ch67FBi2u32txj7daYcliuUE5thgJPbpPrqqpm
 AKDZITYOAQ6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="158968287"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="158968287"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:24:43 -0800
IronPort-SDR: ru1ZaGRoGMgJM864jLNQaeEFiprTJpXpSHmLf2md6tF9d1YfIG6ids2nfXW09JWoG0WTjZj4Ik
 xEdLMTdacWCA==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="368643391"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 14:24:42 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8A8A2207BF; Thu, 19 Nov 2020 00:24:38 +0200 (EET)
Date:   Thu, 19 Nov 2020 00:24:38 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>, linux-media@vger.kernel.org,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v2] media: ipu3-cio2: Use macros from mm.h
Message-ID: <20201118222438.GR3940@paasikivi.fi.intel.com>
References: <20201028155520.14458-1-andriy.shevchenko@linux.intel.com>
 <20201116165319.GF4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116165319.GF4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 06:53:19PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 28, 2020 at 05:55:20PM +0200, Andy Shevchenko wrote:
> > There are few nice macros in mm.h, some of which we may use here.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> If there is no further comments, can it be applied?

It's in my latest pull request, but not in media tree master yet.

-- 
Sakari Ailus
