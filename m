Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD873AB4AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 15:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhFQN2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 09:28:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:37262 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232607AbhFQN2p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 09:28:45 -0400
IronPort-SDR: XTMP6wZoTp6+k/xSQ2Vm0eD06SUkJzHTI48+qI/Itbp8PIw4dwNJOKBqNDWfh5fHe3vmaAV/5d
 j8qWfc2B6txw==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="270215209"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="270215209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 06:26:37 -0700
IronPort-SDR: CsOA3JyKINmJL7mwTbegK0PA8EHx/ohm0UjvZyEXLhIQQfcu3Ow9ZDnmv91mlKuqkqMKeVrEd+
 oMIwGT7e+qZA==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="554399326"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 06:26:34 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lts2R-003LwZ-Hl; Thu, 17 Jun 2021 16:26:31 +0300
Date:   Thu, 17 Jun 2021 16:26:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Baokun Li <libaokun1@huawei.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, kaixuxia@tencent.com,
        gustavoars@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        weiyongjun1@huawei.com, yuehaibing@huawei.com,
        yangjihong1@huawei.com, yukuai3@huawei.com,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v5] media: staging: atomisp: use list_splice_init
 in atomisp_compat_css20.c
Message-ID: <YMtNh+yZAthTjFJn@smile.fi.intel.com>
References: <20210617125357.675562-1-libaokun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617125357.675562-1-libaokun1@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 08:53:57PM +0800, Baokun Li wrote:
> Using list_splice_init() instead of entire while-loops
> in atomisp_compat_css20.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
> V1->V2:
> 	CC mailist
> V2->V3:
>         Using list_move_tail() -> Using list_splice_init()
> V3->V4:
>         Remove redundant 'asd->'
> V4->V5:
>         Add the version information for 'V3->V4:'

What about

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2107:31: warning: unused variable 'md_buf' [-Wunused-variable]
2107 |  struct atomisp_metadata_buf *md_buf;
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2106:26: warning: unused variable 'dis_buf' [-Wunused-variable]
2106 |  struct atomisp_dis_buf *dis_buf;
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2105:26: warning: unused variable 's3a_buf' [-Wunused-variable]
2105 |  struct atomisp_s3a_buf *s3a_buf;

?

-- 
With Best Regards,
Andy Shevchenko


