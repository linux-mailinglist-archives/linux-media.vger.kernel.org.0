Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25741476F93
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 12:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbhLPLLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 06:11:09 -0500
Received: from mga03.intel.com ([134.134.136.65]:3876 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236475AbhLPLLI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 06:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639653068; x=1671189068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLmQDIOY/nuxj81xa9HFBkghDkLFp+wjKf+/8rQrsx0=;
  b=MKrNLMMfeZkt1PfQN3CsgJ1voIJE7fkqwIIXdLexWJa3V5KEUrLZuazi
   7UypgFyG+O9JqxGhC3b/xyIlBDUYpLG2mQv/kht3KS0nTu7vTAxVrgJSm
   ebBCgxwHI4OnMyN1d0Afei6oEbJoJUu/DMACIzy77ZJ3uiVj8dmU4Xmpu
   hGAFoM/Gc7cIrBKqQH59tePuFXsqWuwuLV23rHKsxllCMLR0GfbOU5WM+
   btJ6c9fzRxTiPu3IjvwO8JxZ8HccC9LtMpBIWAjWzO4HAvgNHUcHtO1xw
   FedDQ6xJGHAQf8ltDuGXAsk8NqO+6vaezDwuzo23iMq1DkzigAugEqYk4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239414959"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="239414959"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 03:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="584811970"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2021 03:10:57 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxof3-00033S-4R; Thu, 16 Dec 2021 11:10:57 +0000
Date:   Thu, 16 Dec 2021 19:10:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 5/5] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <202112161906.gHHRLukN-lkp@intel.com>
References: <20211213232849.40071-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-6-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20211214-073020
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20211216/202112161906.gHHRLukN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7e7fcd65e8144f3ffa337760c26fb786f4028466
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Introduce-ancillary-links/20211214-073020
        git checkout 7e7fcd65e8144f3ffa337760c26fb786f4028466
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-async.c:284:10: error: no member named 'entity' in 'struct v4l2_subdev'
           if (sd->entity.function != MEDIA_ENT_F_LENS &&
               ~~  ^
   drivers/media/v4l2-core/v4l2-async.c:285:10: error: no member named 'entity' in 'struct v4l2_subdev'
               sd->entity.function != MEDIA_ENT_F_FLASH)
               ~~  ^
   drivers/media/v4l2-core/v4l2-async.c:288:52: error: no member named 'entity' in 'struct v4l2_subdev'
           link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
                                               ~~~~~~~~~~~~  ^
   drivers/media/v4l2-core/v4l2-async.c:288:65: error: no member named 'entity' in 'struct v4l2_subdev'
           link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
                                                                      ~~  ^
   drivers/media/v4l2-core/v4l2-async.c:309:24: error: no member named 'entity' in 'struct v4l2_subdev'
           switch (notifier->sd->entity.function) {
                   ~~~~~~~~~~~~  ^
   5 errors generated.


vim +284 drivers/media/v4l2-core/v4l2-async.c

   277	
   278	static int
   279	__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
   280					   struct v4l2_subdev *sd)
   281	{
   282		struct media_link *link;
   283	
 > 284		if (sd->entity.function != MEDIA_ENT_F_LENS &&
   285		    sd->entity.function != MEDIA_ENT_F_FLASH)
   286			return -EINVAL;
   287	
   288		link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity,
   289						   MEDIA_LNK_FL_ENABLED |
   290						   MEDIA_LNK_FL_IMMUTABLE);
   291	
   292		return IS_ERR(link) ? PTR_ERR(link) : 0;
   293	}
   294	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
