Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C970168A93D
	for <lists+linux-media@lfdr.de>; Sat,  4 Feb 2023 10:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjBDJio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Feb 2023 04:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjBDJin (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Feb 2023 04:38:43 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9E937B61;
        Sat,  4 Feb 2023 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675503521; x=1707039521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiZgZsJuCpjgiD0NAzlWJRA/pLfimPXAWyzZBVVrg9s=;
  b=H0/MsDob6pWXRddi8YbVXkLE1PlHkngvtKsaIe4adKx6yegyBa4f43ip
   zN57ecqXO16N+iNyypgS2GX7f5uAegaqZSITh5ZBf/3aGtY5Mr7/q+5ag
   yvgUIISnJYcuqGiIiPU05944/cOMhYss4rwZIVVsnaJjrQSEYg0lu6vC0
   nd7r6CdJK8FrYvpblMgCAmb5a3QCtWaYSHxURFvR9xnriUxKksB6mOCF8
   VarMxb/m1Vj+eGA3WktHbukHCSqqSqRBkIMYyzZp8/przuu2+M6+k99vZ
   88WvV6AfxCKs5IWlUjKmrqrsSiD8Oh6TB4OTf9r6iLVutuV8ZV+B8amhL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309266346"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309266346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 01:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659366483"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659366483"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 01:38:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOF0I-0001Ce-2S;
        Sat, 04 Feb 2023 09:38:38 +0000
Date:   Sat, 4 Feb 2023 17:38:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        linux-doc@vger.kernel.org
Subject: [jsarha:topic/cros-sof-v4.19 1264/6555] spdxcheck:
 Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid
 License ID: GFDL-1.1-or-later
Message-ID: <202302041705.9KpNOrLD-lkp@intel.com>
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
https://github.com/intel/lkp-tests
