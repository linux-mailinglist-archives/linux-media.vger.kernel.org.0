Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D488228C92C
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 09:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389992AbgJMHWb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 03:22:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:36280 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389874AbgJMHWb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 03:22:31 -0400
IronPort-SDR: bzq2nA5JJikgb+JpaFuPU8JFyQlnMTJmsRx0MIgdIbtJO5tbW46EtzRsEtCKAiYmkTBxKlz/gk
 OAKrL/nYX9Gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="183340047"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="183340047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 00:22:30 -0700
IronPort-SDR: wBMYeWTcnEZB/hbYFsQYcYDJOnGll6628sAZoeelvEJitMVma2t4SFPdoxzK2Z7Pn3xF5pcnv8
 m144AD6yHCxw==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
   d="scan'208";a="299468235"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 00:22:26 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A9D7520435; Tue, 13 Oct 2020 10:22:23 +0300 (EEST)
Date:   Tue, 13 Oct 2020 10:22:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 8/8] ipu3-cio2: Remove traces of returned buffers
Message-ID: <20201013072223.GZ26842@paasikivi.fi.intel.com>
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com>
 <20201012180414.11579-9-sakari.ailus@linux.intel.com>
 <CAHp75VcQ9vY14qkQF_kq=YRbQdc_1WS67hdB19TX_W6YXsGGYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcQ9vY14qkQF_kq=YRbQdc_1WS67hdB19TX_W6YXsGGYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 09:32:04PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 12, 2020 at 9:07 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > If starting a video buffer queue fails, the buffers are returned to
> > videobuf2. Remove the reference to the buffer from driver's queue as well.
> 
> the driver's
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for the review, Andy and Laurent!

I've fixed the commit messages and pushed the patches to my tree's master
branch.

-- 
Sakari Ailus
