Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF18D52F8C1
	for <lists+linux-media@lfdr.de>; Sat, 21 May 2022 06:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350024AbiEUEuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 May 2022 00:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349247AbiEUEug (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 May 2022 00:50:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E356ABF4C;
        Fri, 20 May 2022 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653108635; x=1684644635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=itrPZ10vCeHTeIr/aBAglfxYV5UcpuxZ5RfmgaB90ME=;
  b=EJM7hO7NJWfcxPPKxVfAMs8Z8yhkP8VrNI6VXLwBP4YNXXJP/RwIHtAo
   ZyAEt+ThfJzA5nTILgz7RGYV7TLAa6yG1aDLJmNQwqeOXddmjMzMHbdaa
   3hUBHdbFxHxlkQ3DF5oO0heusqeYThLZpAU4IlrJRmmKEMgwlUlkf3Yq/
   Mladc3sSPGDKL0uLCeBQel/tMZiDJ5J/4W7ru4nDgxOIRuCDmOuLjubJX
   9S2ntzlgiUCo05OAi5tH5NTkuwtMl1lgat/ylM1sf4+X3l/eKrK2DRrVE
   bH115v14+OsdkL1la7Gc4GHy2VlDGgAGq51pyt0OIKYZSX0STnNjRfylH
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="260392867"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="260392867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 21:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="576507411"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 May 2022 21:50:30 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsH4P-0005wk-Dn;
        Sat, 21 May 2022 04:50:29 +0000
Date:   Sat, 21 May 2022 12:50:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     kbuild-all@lists.01.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on
 cam1
Message-ID: <202205211233.z5zpxDvl-lkp@intel.com>
References: <20220518133004.342775-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518133004.342775-2-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/Switch-on-IMX577-on-RB5/20220518-213438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220521/202205211233.z5zpxDvl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9d9ad87ded5bf5f2f790a549863ad3d63b7336f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/Switch-on-IMX577-on-RB5/20220518-213438
        git checkout 9d9ad87ded5bf5f2f790a549863ad3d63b7336f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/qrb5165-rb5.dts:1335.1-7 Label or path camcc not found
>> Error: arch/arm64/boot/dts/qcom/qrb5165-rb5.dts:1339.1-7 Label or path camss not found
>> Error: arch/arm64/boot/dts/qcom/qrb5165-rb5.dts:1361.1-6 Label or path cci1 not found
>> Error: arch/arm64/boot/dts/qcom/qrb5165-rb5.dts:1375.20-21 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
