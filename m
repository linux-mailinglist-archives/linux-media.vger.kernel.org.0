Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D864570AFE
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiGKTyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiGKTyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:54:43 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1642B550A8
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 12:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657569282; x=1689105282;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mTotcfH4AlleVXiUpuKY7laadSp8dBx0SohgzGlsTkU=;
  b=jqP42Sw1hm9mtSlFu9mHTVGiILCRhzSOJgqM/d8j84IDn8sgJWnTVLI2
   sVGiaCZJXwx5z+QzSxLSnetjZc9ObwvD1oziNBQRZNSH1vdHyRBzAmQ8H
   veH8nWPzmhlk39AiUsBxAn7pjuDoy+BTrVBV3EkVKL4/jUN78ZalDTVCs
   CGdG4sJKMYW6gxYoV/VsOwgI2u5vTNrNV0AqQbsd5H7Tit9XoJXW/8QQA
   l18WFrMB1ridFMxjsEaLqrwIBJVnKjsplNdYh2BatBcnmBhnZr/5fEtWa
   AW1TLGvuRMMy4dC3bkj+ZHqZ5vYstW/9ZUil9MTitlMLp9FdX/9vIgboP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346440544"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="346440544"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="921914451"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2022 12:54:40 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oAzUN-0001B0-Si;
        Mon, 11 Jul 2022 19:54:39 +0000
Date:   Tue, 12 Jul 2022 03:54:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [BUILD SUCCESS] LAST PATCH: [PATCH v4 2/2] drm/i915/gt: Serialize TLB invalidates with GT resets
Message-ID: <62cc7ff0.e7DM3iqVryCICaP7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Fix-TLB-invalidate-issues-with-Broadwell/20220711-145215
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

elapsed time: 304m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
