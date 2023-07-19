Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E09759136
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjGSJKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 05:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjGSJKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 05:10:21 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703E4A4
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689757820; x=1721293820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DGKiig9+fzzh0JkgD62R+v9YoG7Xf6THVrk988BiqM=;
  b=Z+/1ZYuASSOk3kBss8Vy1sjsMK9aKo/inVDO5nsVbNqiOMn/qfH5AGSQ
   6O/AzDSrkBCU1ODFQLF0nZkyesQ8IaXdaIceC6E24xk8TPVyErgPUhx9h
   CzP5HgVFfRJVbZmIx2m8zyvpuAFysq26pdFTnaEyXvnLAWp8AHuW47NXf
   FsUVtp+0+HJDIU8aoYhZEPjouwe9GAxnZ7HuAdTu9DBZ7iY63zGeyhgQm
   Zh963WINdxH1WAnrocbSfz24lQyhpoO2cj1tHNj+kqKFMmbEN2eAyram5
   UUMuHP+0oE4iQezFNUgII231IH0Xbk3eNYCJx37ZoxPigGbzBjTwie/HM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369060616"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369060616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 02:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793934869"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="793934869"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 02:10:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qM3CK-0004bZ-2V;
        Wed, 19 Jul 2023 09:10:16 +0000
Date:   Wed, 19 Jul 2023 17:09:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stefan Herdler <herdler@nurfuerspam.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: Re: [PATCH v3 3/6] Add documentation for audio.h (data types)
Message-ID: <202307191616.jdo5lLxc-lkp@intel.com>
References: <20230717020446.28877-4-herdler@nurfuerspam.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717020446.28877-4-herdler@nurfuerspam.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.5-rc2 next-20230719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Herdler/Add-documentation-for-legacy-DVB-decoder-API/20230718-174209
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230717020446.28877-4-herdler%40nurfuerspam.de
patch subject: [PATCH v3 3/6] Add documentation for audio.h (data types)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191616.jdo5lLxc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191616.jdo5lLxc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst:80: WARNING: Unknown interpreted text role "c:enum".

vim +80 Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst

  > 80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
