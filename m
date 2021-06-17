Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E373AB3D8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 14:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhFQMnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 08:43:47 -0400
Received: from mga02.intel.com ([134.134.136.20]:51984 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229891AbhFQMnr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 08:43:47 -0400
IronPort-SDR: 4MhOBV7INAHhjx/JLrU0wkxXh+E58nltD62/yWlZ7w16dIkig33SsuC+8BgNVec0ZxHq4HCqDk
 VDH0VUe5x8JA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193487923"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="193487923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 05:41:39 -0700
IronPort-SDR: +Lhz+pz9Dy+dov93trqEkBpD8LKyTxVijDNA07kQJ3g/EKsoFv/IT/gP0LSSIdenc0qxPcg9Gn
 srh3cfaa9OEw==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="485278416"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 05:41:35 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ltrKu-003LFy-KC; Thu, 17 Jun 2021 15:41:32 +0300
Date:   Thu, 17 Jun 2021 15:41:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "libaokun (A)" <libaokun1@huawei.com>
Cc:     kernel test robot <lkp@intel.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        kaixuxia@tencent.com, gustavoars@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        weiyongjun1@huawei.com
Subject: Re: [PATCH -next v3] media: staging: atomisp: use list_splice_init
 in atomisp_compat_css20.c
Message-ID: <YMtC/CmZeni2dD1W@smile.fi.intel.com>
References: <20210611081004.1348026-1-libaokun1@huawei.com>
 <202106171617.BN97N8mw-lkp@intel.com>
 <d39a3cb0-4024-4abe-ad28-937fee53bc98@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d39a3cb0-4024-4abe-ad28-937fee53bc98@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 17, 2021 at 08:14:28PM +0800, libaokun (A) wrote:
> Sorry, I only tested it with 'x86_64.config'.
> 
> I'm about to send a patch v4 with the changes to fix the error under your
> config.

Please, do not top-post!


Problem here that you tested without additional warnings enabled.

Next time try to start with `make W=1 ...`

If you have installed Sparse tool, the better option would be
`make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`

> 在 2021/6/17 16:52, kernel test robot 写道:
> > Hi Baokun,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on next-20210616]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
> > base:    c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8
> > config: i386-allyesconfig (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=1 build):
> >          # https://github.com/0day-ci/linux/commit/05c714d7b4e1722a75f949e40c5305f3ba28d048
> >          git remote add linux-review https://github.com/0day-ci/linux
> >          git fetch --no-tags linux-review Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
> >          git checkout 05c714d7b4e1722a75f949e40c5305f3ba28d048
> >          # save the attached .config to linux build tree
> >          make W=1 ARCH=i386
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css_stop':
> > > > drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2156:50: error: 'struct atomisp_sub_device' has no member named 'asd'
> >      2156 |   list_splice_init(&asd->metadata_in_css[i], &asd->asd->metadata[i]);
> >           |                                                  ^~
> >     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2157:49: error: 'struct atomisp_sub_device' has no member named 'asd'
> >      2157 |   list_splice_init(&asd->metadata_ready[i], &asd->asd->metadata[i]);
> >           |                                                 ^~
> >     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2107:31: warning: unused variable 'md_buf' [-Wunused-variable]
> >      2107 |  struct atomisp_metadata_buf *md_buf;
> >           |                               ^~~~~~
> >     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2106:26: warning: unused variable 'dis_buf' [-Wunused-variable]
> >      2106 |  struct atomisp_dis_buf *dis_buf;
> >           |                          ^~~~~~~

-- 
With Best Regards,
Andy Shevchenko


