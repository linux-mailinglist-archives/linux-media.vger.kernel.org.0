Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0CA68C6EC
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 20:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjBFThO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 14:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBFThN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 14:37:13 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226C01EBEC;
        Mon,  6 Feb 2023 11:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675712233; x=1707248233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3xZ7OM/uN2gRQ0bzjgjs8pO1hanEXsmXRHXnFq+bws=;
  b=iygYTaTBF6tOSw8QBomHinBFPePlCtu7RU8IgtdW39xW7mqPRCta0ulG
   tIxuMB5UEUauvZaybVCyypI3hBzil3+t8tmb4263buc1zQqdOXp4UMoBW
   n69acrb62ZETFYFDfpkZs0rqiCzq5V9U0YxfZ8D9W4Vx6sdtTs9ottc4L
   5fZCZfla4OL1hpznd7PNm30GLLFZwabPsrTOjwwuwHrz7RIwTUHVSMcfg
   ogMA1pXE5KUaqGsbWqnrnalanJyayoutWWufudCHpnLvTTCcAEaLeI29n
   Wt16iQptux0YUvREIUnTWMC9k12Mn9N8Me602Kq44NuVth0AOuMdj/HjU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391693014"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391693014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 11:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809238111"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809238111"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 11:37:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pP7Ic-0002kC-1W;
        Mon, 06 Feb 2023 19:37:10 +0000
Date:   Tue, 7 Feb 2023 03:36:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     oe-kbuild-all@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [mchehab-media-next:master 63/135] htmldocs: Warning:
 Documentation/admin-guide/kernel-parameters.txt references a file that
 doesn't exist: Documentation/admin-guide/media/meye.rst
Message-ID: <202302070341.OVqstpMM-lkp@intel.com>
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

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   14cd15e7a1e2a321f6184124bee95560035db4ef
commit: ba47652ba65523ccadac3f8d50dc0e0d560477b2 [63/135] media: meye: remove this deprecated driver
reproduce:
        git remote add mchehab-media-next git://linuxtv.org/mchehab/media-next.git
        git fetch --no-tags mchehab-media-next master
        git checkout ba47652ba65523ccadac3f8d50dc0e0d560477b2
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/kernel-parameters.txt references a file that doesn't exist: Documentation/admin-guide/media/meye.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
