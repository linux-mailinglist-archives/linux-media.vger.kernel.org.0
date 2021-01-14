Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247DC2F5E69
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 11:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbhANKMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 05:12:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:55666 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbhANKMz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 05:12:55 -0500
IronPort-SDR: Di+lV0HtTFErSK/WCSNIkH14cH5Sg4yFSKvGDrIJLfDEWNKsZEUM7gkboUWCrv8QXDS+XcgsBZ
 shFJfyeW3hJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="239886961"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="gz'50?scan'50,208,50";a="239886961"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 02:12:13 -0800
IronPort-SDR: ytHv2et3D6vIIVkBWNaUouu99RLhsmcYDo9F4sTqjmPi1LpSORBlTex/26DDdYxlg9cOf+DaVH
 V9ucw6R+dhTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="gz'50?scan'50,208,50";a="353850232"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jan 2021 02:12:11 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzzbu-0000lj-HZ; Thu, 14 Jan 2021 10:12:10 +0000
Date:   Thu, 14 Jan 2021 18:11:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/16] scripts: kernel-doc: validate kernel-doc markup
 with the actual names
Message-ID: <202101141835.KQXTHnJC-lkp@intel.com>
References: <081546f141a496d6cabb99a4adc140444c705e93.1610610937.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <081546f141a496d6cabb99a4adc140444c705e93.1610610937.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20210113]
[also build test WARNING on v5.11-rc3]
[cannot apply to lwn/docs-next kees/for-next/pstore mac80211-next/master mac80211/master pza/reset/next linus/master v5.11-rc3 v5.11-rc2 v5.11-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/Fix-several-bad-kernel-doc-markups/20210114-161010
base:    aa515cdce7a151dcc14b7600d33f1414c6fa32c9
config: arm64-alldefconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1e9159b3640012fc5fab8508b1c5635ac13a55e9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/Fix-several-bad-kernel-doc-markups/20210114-161010
        git checkout 1e9159b3640012fc5fab8508b1c5635ac13a55e9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/seccomp.c:126: warning: Function parameter or member 'list' not described in 'seccomp_kaddfd'
   kernel/seccomp.c:390: warning: Function parameter or member 'ret' not described in 'ACTION_ONLY'
>> kernel/seccomp.c:390: warning: expecting prototype for seccomp_run_filters(). Prototype was for ACTION_ONLY() instead
   kernel/seccomp.c:553: warning: Function parameter or member 'tsk' not described in 'seccomp_filter_release'
   kernel/seccomp.c:573: warning: Function parameter or member 'flags' not described in 'seccomp_sync_threads'
--
   drivers/base/platform-msi.c:336: warning: Function parameter or member 'is_tree' not described in '__platform_msi_create_device_domain'
>> drivers/base/platform-msi.c:336: warning: expecting prototype for platform_msi_create_device_domain(). Prototype was for __platform_msi_create_device_domain() instead
--
>> drivers/iommu/iommu.c:956: warning: expecting prototype for iommu_group_for_each_dev(). Prototype was for __iommu_group_for_each_dev() instead
   drivers/iommu/iommu.c:2976: warning: Function parameter or member 'drvdata' not described in 'iommu_sva_bind_device'
--
>> kernel/irq/msi.c:534: warning: expecting prototype for __msi_domain_free_irqs(). Prototype was for msi_domain_free_irqs() instead
--
>> kernel/irq/ipi.c:264: warning: expecting prototype for ipi_send_mask(). Prototype was for __ipi_send_mask() instead


vim +390 kernel/seccomp.c

f9d480b6ffbeb336 YiFei Zhu          2020-10-11  380  
e2cfabdfd0756482 Will Drewry        2012-04-12  381  /**
285fdfc5d9959a21 Mickaël Salaün     2016-09-20  382   * seccomp_run_filters - evaluates all seccomp filters against @sd
285fdfc5d9959a21 Mickaël Salaün     2016-09-20  383   * @sd: optional seccomp data to be passed to filters
deb4de8b31bc5bf2 Kees Cook          2017-08-02  384   * @match: stores struct seccomp_filter that resulted in the return value,
deb4de8b31bc5bf2 Kees Cook          2017-08-02  385   *         unless filter returned SECCOMP_RET_ALLOW, in which case it will
deb4de8b31bc5bf2 Kees Cook          2017-08-02  386   *         be unchanged.
e2cfabdfd0756482 Will Drewry        2012-04-12  387   *
e2cfabdfd0756482 Will Drewry        2012-04-12  388   * Returns valid seccomp BPF response codes.
e2cfabdfd0756482 Will Drewry        2012-04-12  389   */
0466bdb99e8744bc Kees Cook          2017-08-11 @390  #define ACTION_ONLY(ret) ((s32)((ret) & (SECCOMP_RET_ACTION_FULL)))
deb4de8b31bc5bf2 Kees Cook          2017-08-02  391  static u32 seccomp_run_filters(const struct seccomp_data *sd,
deb4de8b31bc5bf2 Kees Cook          2017-08-02  392  			       struct seccomp_filter **match)
e2cfabdfd0756482 Will Drewry        2012-04-12  393  {
acf3b2c71ed20c53 Will Drewry        2012-04-12  394  	u32 ret = SECCOMP_RET_ALLOW;
8225d3853f34f6cf Pranith Kumar      2014-11-21  395  	/* Make sure cross-thread synced filter points somewhere sane. */
8225d3853f34f6cf Pranith Kumar      2014-11-21  396  	struct seccomp_filter *f =
506458efaf153c1e Will Deacon        2017-10-24  397  			READ_ONCE(current->seccomp.filter);
acf3b2c71ed20c53 Will Drewry        2012-04-12  398  
acf3b2c71ed20c53 Will Drewry        2012-04-12  399  	/* Ensure unexpected behavior doesn't result in failing open. */
0d42d73a37ff9102 Igor Stoppa        2018-09-05  400  	if (WARN_ON(f == NULL))
4d3b0b05aae9ee9c Kees Cook          2017-08-11  401  		return SECCOMP_RET_KILL_PROCESS;
acf3b2c71ed20c53 Will Drewry        2012-04-12  402  
f9d480b6ffbeb336 YiFei Zhu          2020-10-11  403  	if (seccomp_cache_check_allow(f, sd))
f9d480b6ffbeb336 YiFei Zhu          2020-10-11  404  		return SECCOMP_RET_ALLOW;
f9d480b6ffbeb336 YiFei Zhu          2020-10-11  405  
e2cfabdfd0756482 Will Drewry        2012-04-12  406  	/*
e2cfabdfd0756482 Will Drewry        2012-04-12  407  	 * All filters in the list are evaluated and the lowest BPF return
acf3b2c71ed20c53 Will Drewry        2012-04-12  408  	 * value always takes priority (ignoring the DATA).
e2cfabdfd0756482 Will Drewry        2012-04-12  409  	 */
3ba2530cc06eb4ae Kees Cook          2014-06-27  410  	for (; f; f = f->prev) {
3d9f773cf2876c01 David Miller       2020-02-24  411  		u32 cur_ret = bpf_prog_run_pin_on_cpu(f->prog, sd);
8f577cadf7181243 Alexei Starovoitov 2014-05-13  412  
0466bdb99e8744bc Kees Cook          2017-08-11  413  		if (ACTION_ONLY(cur_ret) < ACTION_ONLY(ret)) {
acf3b2c71ed20c53 Will Drewry        2012-04-12  414  			ret = cur_ret;
deb4de8b31bc5bf2 Kees Cook          2017-08-02  415  			*match = f;
deb4de8b31bc5bf2 Kees Cook          2017-08-02  416  		}
e2cfabdfd0756482 Will Drewry        2012-04-12  417  	}
e2cfabdfd0756482 Will Drewry        2012-04-12  418  	return ret;
e2cfabdfd0756482 Will Drewry        2012-04-12  419  }
1f41b450416e689b Kees Cook          2014-06-25  420  #endif /* CONFIG_SECCOMP_FILTER */
1f41b450416e689b Kees Cook          2014-06-25  421  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bg08WKrSYDhXBjb5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--bg08WKrSYDhXBjb5--
