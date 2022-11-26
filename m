Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EEE639426
	for <lists+linux-media@lfdr.de>; Sat, 26 Nov 2022 08:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiKZHPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Nov 2022 02:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKZHPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Nov 2022 02:15:16 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E826B28716;
        Fri, 25 Nov 2022 23:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669446915; x=1700982915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fx/b8350F9FTxPfdI3/sopUD0DQ64MdLCxzwzUxMx88=;
  b=ZHxh2gKijTI2cttNjSl/1fiMabSEdwVnLKbAQ2892/hRxGV8pRxkgR/S
   rrlvn/b7OsldQISPjmVRqGhLNLuedsZ5o2ovxACqMjgv/p0wfdrsEFUsN
   259r2XgFRT2F3MTMMdEbsLNEiFA2OkcZO4PjVSa7E/e2Aa0XYvgyhgoi9
   rDyP8+26M3xRj2xouNoi6ncO0ODT8tNPCHOJUAEx/fKI7x2+Zcns+9dZo
   7syijy5gle0GXCVfOcvivW31focAtTJBs6SBr7/XlE/nul+hstfZszHhs
   IZC+yrkjvdqmcY7XCh22Oa4L0sdoSfwf+qX0gb+2V6ZN8mDdSdm/XkZdR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="378834717"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="378834717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 23:15:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="748788851"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="748788851"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2022 23:15:13 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oypP6-000625-2B;
        Sat, 26 Nov 2022 07:15:12 +0000
Date:   Sat, 26 Nov 2022 15:14:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        linux-doc@vger.kernel.org
Subject: [jsarha:topic/cros-sof-v4.19 1264/6555] spdxcheck:
 Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid
 License ID: GFDL-1.1-or-later
Message-ID: <202211261557.YUZbHfCe-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: fafd43c288ef4de7f385fde1dd59e45aec303d45 [1264/6555] UPSTREAM: media: Documentation: v4l: document request API
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
   include/dt-bindings/reset/amlogic,meson-axg-reset.h: 9:41 Invalid License ID: BSD
>> Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-queue.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-api.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-close.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-ioctl.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-poll.rst: 1:39 Invalid License ID: GFDL-1.1-or-later

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
