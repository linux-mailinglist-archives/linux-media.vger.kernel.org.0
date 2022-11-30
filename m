Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823E463E294
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 22:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiK3VT5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 16:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiK3VTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 16:19:54 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF918B190
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669843189; x=1701379189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mo7pO6GaikgzbTecsJk/J5YnQ3v3rvIziQcbrJ6pGqk=;
  b=CkgI9908Ewjtk/ajzSMFgKZfCRs+2zft2i9fMt9d7RFSHWvYG1R7nl1a
   CIrrQH6LX+sU3PWpkni14BANYaJH0nKm7QNzr3+8uvMGOE1FNo2jcyOKA
   ju3OHABxXmd3vExXRyN5/k0u+K1mKkGxPyKaJjnSmpAqBU49Ms0Xnyfjs
   iXnkkcMcqEx1D9JsKu1I/4KVKjvj8J16pBOpwcp7eOSSPQxEHUGI0PIG0
   w5XSXBaFyElAvYIWHRR18k4sFEDjYm2B0oObqZ4YXXV0kHcSGrzzBBY30
   YvV5X21lOiXc+rheo+xLUpq/E+bl/BpY9XvrwjLEV9bk2ILa8PqZm17is
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="401788922"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="401788922"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 13:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="644373029"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="644373029"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2022 13:19:44 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0UUa-000BkR-0S;
        Wed, 30 Nov 2022 21:19:44 +0000
Date:   Thu, 1 Dec 2022 05:18:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 5514/9999]
 drivers/media/i2c/tc358743.c:1921:7: warning: explicitly assigning value of
 variable of type 'int' to itself
Message-ID: <202212010501.AzUtMvek-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="To7QobAImH+yTowo"
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--To7QobAImH+yTowo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sakari,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 314217a6c4fba0dc2b0c2d7900e33fea534acbba [5514/9999] UPSTREAM: media: v4l: fwnode: Let the caller provide V4L2 fwnode endpoint
config: mips-buildonly-randconfig-r004-20221128
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/jsarha/linux/commit/314217a6c4fba0dc2b0c2d7900e33fea534acbba
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 314217a6c4fba0dc2b0c2d7900e33fea534acbba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash M=drivers/media/i2c

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/tc358743.c:15:
   In file included from include/linux/kernel.h:11:
   In file included from include/linux/bitops.h:19:
   In file included from arch/mips/include/asm/bitops.h:19:
   In file included from arch/mips/include/uapi/asm/byteorder.h:15:
   In file included from include/linux/byteorder/little_endian.h:11:
   include/linux/byteorder/generic.h:195:16: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
           for (i = 0; i < len; i++)
                       ~ ^ ~~~
   include/linux/byteorder/generic.h:203:16: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
           for (i = 0; i < len; i++)
                       ~ ^ ~~~
   In file included from drivers/media/i2c/tc358743.c:16:
   In file included from include/linux/module.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:6:
   In file included from include/linux/seqlock.h:36:
   In file included from include/linux/spinlock.h:51:
   In file included from include/linux/preempt.h:81:
   In file included from ./arch/mips/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   include/linux/thread_info.h:141:29: warning: comparison of integers of different signs: 'int' and 'size_t' (aka 'unsigned int') [-Wsign-compare]
           if (unlikely(sz >= 0 && sz < bytes)) {
                                   ~~ ^ ~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   In file included from drivers/media/i2c/tc358743.c:16:
   In file included from include/linux/module.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:6:
   In file included from include/linux/seqlock.h:36:
   In file included from include/linux/spinlock.h:88:
   In file included from arch/mips/include/asm/spinlock.h:13:
   In file included from ./arch/mips/include/generated/asm/qrwlock.h:1:
   include/asm-generic/qrwlock.h:75:36: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                                                cnts, cnts | _QW_LOCKED) == cnts);
                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/media/i2c/tc358743.c:16:
   In file included from include/linux/module.h:13:
   In file included from include/linux/kmod.h:22:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:984:44: warning: comparison of integers of different signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   In file included from drivers/media/i2c/tc358743.c:29:
   In file included from include/media/cec.h:16:
   In file included from include/linux/kthread.h:7:
   In file included from include/linux/cgroup.h:28:
   include/linux/cgroup-defs.h:464:16: warning: field 'cgrp' with variable sized type 'struct cgroup' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct cgroup cgrp;
                         ^
   In file included from drivers/media/i2c/tc358743.c:29:
   In file included from include/media/cec.h:19:
   In file included from include/media/rc-core.h:21:
   In file included from include/linux/kfifo.h:56:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:26:
   In file included from include/linux/page_ref.h:7:
   include/linux/page-flags.h:162:21: warning: comparison of integers of different signs: 'const unsigned long' and 'long' [-Wsign-compare]
           return page->flags == PAGE_POISON_PATTERN;
                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/tc358743.c:29:
   In file included from include/media/cec.h:19:
   In file included from include/media/rc-core.h:21:
   In file included from include/linux/kfifo.h:56:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1170:
   include/linux/vmstat.h:221:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_online_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:778:36: note: expanded from macro 'for_each_online_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   drivers/media/i2c/tc358743.c:62:2: warning: missing field 'reserved' initializer [-Wmissing-field-initializers]
           V4L2_INIT_BT_TIMINGS(640, 1920, 350, 1200, 13000000, 165000000,
           ^
   include/uapi/linux/v4l2-dv-timings.h:26:29: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
           { .bt = { _width , ## args } }
                                      ^
   drivers/media/i2c/tc358743.c:163:16: warning: comparison of integers of different signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
           for (i = 0; i < n; i++)
                       ~ ^ ~
>> drivers/media/i2c/tc358743.c:1921:7: warning: explicitly assigning value of variable of type 'int' to itself [-Wself-assign]
                   ret = ret;
                   ~~~ ^ ~~~
   drivers/media/i2c/tc358743.c:2034:3: warning: missing field 'hdmi_vic' initializer [-Wmissing-field-initializers]
                   V4L2_DV_BT_CEA_640X480P59_94;
                   ^
   include/uapi/linux/v4l2-dv-timings.h:36:2: note: expanded from macro 'V4L2_DV_BT_CEA_640X480P59_94'
           V4L2_INIT_BT_TIMINGS(640, 480, 0, 0, \
           ^
   include/uapi/linux/v4l2-dv-timings.h:26:29: note: expanded from macro 'V4L2_INIT_BT_TIMINGS'
           { .bt = { _width , ## args } }
                                      ^
   12 warnings generated.
   Assembler messages:
   Fatal error: invalid -march= option: `mips32'
   clang-16: error: assembler command failed with exit code 1 (use -v to see invocation)


vim +/int +1921 drivers/media/i2c/tc358743.c

  1894	
  1895	static int tc358743_probe_of(struct tc358743_state *state)
  1896	{
  1897		struct device *dev = &state->i2c_client->dev;
  1898		struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
  1899		struct device_node *ep;
  1900		struct clk *refclk;
  1901		u32 bps_pr_lane;
  1902		int ret;
  1903	
  1904		refclk = devm_clk_get(dev, "refclk");
  1905		if (IS_ERR(refclk)) {
  1906			if (PTR_ERR(refclk) != -EPROBE_DEFER)
  1907				dev_err(dev, "failed to get refclk: %ld\n",
  1908					PTR_ERR(refclk));
  1909			return PTR_ERR(refclk);
  1910		}
  1911	
  1912		ep = of_graph_get_next_endpoint(dev->of_node, NULL);
  1913		if (!ep) {
  1914			dev_err(dev, "missing endpoint node\n");
  1915			return -EINVAL;
  1916		}
  1917	
  1918		ret = v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(ep), &endpoint);
  1919		if (ret) {
  1920			dev_err(dev, "failed to parse endpoint\n");
> 1921			ret = ret;
  1922			goto put_node;
  1923		}
  1924	
  1925		if (endpoint.bus_type != V4L2_MBUS_CSI2_DPHY ||
  1926		    endpoint.bus.mipi_csi2.num_data_lanes == 0 ||
  1927		    endpoint.nr_of_link_frequencies == 0) {
  1928			dev_err(dev, "missing CSI-2 properties in endpoint\n");
  1929			ret = -EINVAL;
  1930			goto free_endpoint;
  1931		}
  1932	
  1933		if (endpoint.bus.mipi_csi2.num_data_lanes > 4) {
  1934			dev_err(dev, "invalid number of lanes\n");
  1935			ret = -EINVAL;
  1936			goto free_endpoint;
  1937		}
  1938	
  1939		state->bus = endpoint.bus.mipi_csi2;
  1940	
  1941		ret = clk_prepare_enable(refclk);
  1942		if (ret) {
  1943			dev_err(dev, "Failed! to enable clock\n");
  1944			goto free_endpoint;
  1945		}
  1946	
  1947		state->pdata.refclk_hz = clk_get_rate(refclk);
  1948		state->pdata.ddc5v_delay = DDC5V_DELAY_100_MS;
  1949		state->pdata.enable_hdcp = false;
  1950		/* A FIFO level of 16 should be enough for 2-lane 720p60 at 594 MHz. */
  1951		state->pdata.fifo_level = 16;
  1952		/*
  1953		 * The PLL input clock is obtained by dividing refclk by pll_prd.
  1954		 * It must be between 6 MHz and 40 MHz, lower frequency is better.
  1955		 */
  1956		switch (state->pdata.refclk_hz) {
  1957		case 26000000:
  1958		case 27000000:
  1959		case 42000000:
  1960			state->pdata.pll_prd = state->pdata.refclk_hz / 6000000;
  1961			break;
  1962		default:
  1963			dev_err(dev, "unsupported refclk rate: %u Hz\n",
  1964				state->pdata.refclk_hz);
  1965			goto disable_clk;
  1966		}
  1967	
  1968		/*
  1969		 * The CSI bps per lane must be between 62.5 Mbps and 1 Gbps.
  1970		 * The default is 594 Mbps for 4-lane 1080p60 or 2-lane 720p60.
  1971		 */
  1972		bps_pr_lane = 2 * endpoint.link_frequencies[0];
  1973		if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
  1974			dev_err(dev, "unsupported bps per lane: %u bps\n", bps_pr_lane);
  1975			goto disable_clk;
  1976		}
  1977	
  1978		/* The CSI speed per lane is refclk / pll_prd * pll_fbd */
  1979		state->pdata.pll_fbd = bps_pr_lane /
  1980				       state->pdata.refclk_hz * state->pdata.pll_prd;
  1981	
  1982		/*
  1983		 * FIXME: These timings are from REF_02 for 594 Mbps per lane (297 MHz
  1984		 * link frequency). In principle it should be possible to calculate
  1985		 * them based on link frequency and resolution.
  1986		 */
  1987		if (bps_pr_lane != 594000000U)
  1988			dev_warn(dev, "untested bps per lane: %u bps\n", bps_pr_lane);
  1989		state->pdata.lineinitcnt = 0xe80;
  1990		state->pdata.lptxtimecnt = 0x003;
  1991		/* tclk-preparecnt: 3, tclk-zerocnt: 20 */
  1992		state->pdata.tclk_headercnt = 0x1403;
  1993		state->pdata.tclk_trailcnt = 0x00;
  1994		/* ths-preparecnt: 3, ths-zerocnt: 1 */
  1995		state->pdata.ths_headercnt = 0x0103;
  1996		state->pdata.twakeup = 0x4882;
  1997		state->pdata.tclk_postcnt = 0x008;
  1998		state->pdata.ths_trailcnt = 0x2;
  1999		state->pdata.hstxvregcnt = 0;
  2000	
  2001		state->reset_gpio = devm_gpiod_get_optional(dev, "reset",
  2002							    GPIOD_OUT_LOW);
  2003		if (IS_ERR(state->reset_gpio)) {
  2004			dev_err(dev, "failed to get reset gpio\n");
  2005			ret = PTR_ERR(state->reset_gpio);
  2006			goto disable_clk;
  2007		}
  2008	
  2009		if (state->reset_gpio)
  2010			tc358743_gpio_reset(state);
  2011	
  2012		ret = 0;
  2013		goto free_endpoint;
  2014	
  2015	disable_clk:
  2016		clk_disable_unprepare(refclk);
  2017	free_endpoint:
  2018		v4l2_fwnode_endpoint_free(&endpoint);
  2019	put_node:
  2020		of_node_put(ep);
  2021		return ret;
  2022	}
  2023	#else
  2024	static inline int tc358743_probe_of(struct tc358743_state *state)
  2025	{
  2026		return -ENODEV;
  2027	}
  2028	#endif
  2029	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--To7QobAImH+yTowo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/mips 4.19.43 Kernel Configuration
#

#
# Compiler: clang version 16.0.0 (git://gitmirror/llvm_project 6e4cea55f0d1104408b26ac574566a0e4de48036)
#
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_IPI=y
CONFIG_HANDLE_DOMAIN_IRQ=y
CONFIG_IRQ_FORCED_THREADING=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_GENERIC_SCHED_CLOCK=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_DEBUG is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SCHED_TUNE is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_SYSCALL is not set
CONFIG_USERFAULTFD=y
# CONFIG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_COMPAT_BRK=y
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_PROFILING=y
CONFIG_MIPS=y

#
# Machine selection
#
CONFIG_MIPS_GENERIC=y
# CONFIG_MIPS_ALCHEMY is not set
# CONFIG_AR7 is not set
# CONFIG_ATH25 is not set
# CONFIG_ATH79 is not set
# CONFIG_BMIPS_GENERIC is not set
# CONFIG_BCM47XX is not set
# CONFIG_BCM63XX is not set
# CONFIG_MIPS_COBALT is not set
# CONFIG_MACH_DECSTATION is not set
# CONFIG_MACH_JAZZ is not set
# CONFIG_MACH_INGENIC is not set
# CONFIG_LANTIQ is not set
# CONFIG_LASAT is not set
# CONFIG_MACH_LOONGSON32 is not set
# CONFIG_MACH_LOONGSON64 is not set
# CONFIG_MACH_PISTACHIO is not set
# CONFIG_MIPS_MALTA is not set
# CONFIG_MACH_PIC32 is not set
# CONFIG_NEC_MARKEINS is not set
# CONFIG_MACH_VR41XX is not set
# CONFIG_NXP_STB220 is not set
# CONFIG_NXP_STB225 is not set
# CONFIG_PMC_MSP is not set
# CONFIG_RALINK is not set
# CONFIG_SGI_IP22 is not set
# CONFIG_SGI_IP27 is not set
# CONFIG_SGI_IP28 is not set
# CONFIG_SGI_IP32 is not set
# CONFIG_SIBYTE_CRHINE is not set
# CONFIG_SIBYTE_CARMEL is not set
# CONFIG_SIBYTE_CRHONE is not set
# CONFIG_SIBYTE_RHONE is not set
# CONFIG_SIBYTE_SWARM is not set
# CONFIG_SIBYTE_LITTLESUR is not set
# CONFIG_SIBYTE_SENTOSA is not set
# CONFIG_SIBYTE_BIGSUR is not set
# CONFIG_SNI_RM is not set
# CONFIG_MACH_TX39XX is not set
# CONFIG_MACH_TX49XX is not set
# CONFIG_MIKROTIK_RB532 is not set
# CONFIG_CAVIUM_OCTEON_SOC is not set
# CONFIG_NLM_XLR_BOARD is not set
# CONFIG_NLM_XLP_BOARD is not set
# CONFIG_MIPS_PARAVIRT is not set

#
# Legacy (non-UHI/non-FIT) Boards
#
# CONFIG_LEGACY_BOARD_SEAD3 is not set
# CONFIG_LEGACY_BOARD_OCELOT is not set

#
# FIT/UHI Boards
#
# CONFIG_FIT_IMAGE_FDT_BOSTON is not set
# CONFIG_FIT_IMAGE_FDT_NI169445 is not set
# CONFIG_FIT_IMAGE_FDT_XILFPGA is not set
# CONFIG_FIT_IMAGE_FDT_OCELOT_PCB123 is not set
# CONFIG_VIRT_BOARD_RANCHU is not set
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_BOOT_RAW=y
CONFIG_CEVT_R4K=y
CONFIG_CSRC_R4K=y
CONFIG_MIPS_CLOCK_VSYSCALL=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_DMA_MAYBE_COHERENT=y
CONFIG_DMA_PERDEV_COHERENT=y
CONFIG_DMA_NONCOHERENT=y
CONFIG_SYNC_R4K=y
CONFIG_SYS_SUPPORTS_RELOCATABLE=y
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_SYS_SUPPORTS_BIG_ENDIAN=y
CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
CONFIG_NO_EXCEPT_FILL=y
CONFIG_SWAP_IO_SPACE=y
CONFIG_MIPS_L1_CACHE_SHIFT_7=y
CONFIG_MIPS_L1_CACHE_SHIFT=7

#
# CPU selection
#
CONFIG_CPU_MIPS32_R1=y
# CONFIG_CPU_MIPS32_R2 is not set
# CONFIG_CPU_MIPS32_R6 is not set
# CONFIG_CPU_MIPS64_R1 is not set
# CONFIG_CPU_MIPS64_R2 is not set
# CONFIG_CPU_MIPS64_R6 is not set
CONFIG_SYS_HAS_CPU_MIPS32_R1=y
CONFIG_SYS_HAS_CPU_MIPS32_R2=y
CONFIG_SYS_HAS_CPU_MIPS32_R6=y
CONFIG_SYS_HAS_CPU_MIPS64_R1=y
CONFIG_SYS_HAS_CPU_MIPS64_R2=y
CONFIG_SYS_HAS_CPU_MIPS64_R6=y
CONFIG_CPU_MIPS32=y
CONFIG_CPU_MIPSR1=y
CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
CONFIG_SYS_SUPPORTS_64BIT_KERNEL=y
CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
CONFIG_HARDWARE_WATCHPOINTS=y

#
# Kernel type
#
CONFIG_32BIT=y
# CONFIG_PAGE_SIZE_4KB is not set
# CONFIG_PAGE_SIZE_16KB is not set
CONFIG_PAGE_SIZE_64KB=y
CONFIG_FORCE_MAX_ZONEORDER=14
CONFIG_BOARD_SCACHE=y
CONFIG_MIPS_CPU_SCACHE=y
CONFIG_CPU_HAS_PREFETCH=y
CONFIG_CPU_GENERIC_DUMP_TLB=y
CONFIG_CPU_R4K_FPU=y
CONFIG_CPU_R4K_CACHE_TLB=y
CONFIG_MIPS_MT_SMP=y
CONFIG_MIPS_MT=y
# CONFIG_SCHED_SMT is not set
CONFIG_SYS_SUPPORTS_SCHED_SMT=y
CONFIG_SYS_SUPPORTS_MULTITHREADING=y
CONFIG_MIPS_MT_FPAFF=y
# CONFIG_MIPS_CPS is not set
CONFIG_MIPS_CM=y
CONFIG_MIPS_CPC=y
CONFIG_CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS=y
# CONFIG_CPU_HAS_SMARTMIPS is not set
# CONFIG_CPU_MICROMIPS is not set
CONFIG_CPU_MIPSR2_IRQ_VI=y
CONFIG_CPU_MIPSR2_IRQ_EI=y
CONFIG_CPU_HAS_SYNC=y
CONFIG_MIPS_ASID_SHIFT=0
CONFIG_MIPS_ASID_BITS=8
# CONFIG_HIGHMEM is not set
CONFIG_CPU_SUPPORTS_HIGHMEM=y
CONFIG_SYS_SUPPORTS_HIGHMEM=y
CONFIG_SYS_SUPPORTS_SMARTMIPS=y
CONFIG_SYS_SUPPORTS_MICROMIPS=y
CONFIG_SYS_SUPPORTS_MIPS16=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_SMP=y
CONFIG_SMP_UP=y
CONFIG_SYS_SUPPORTS_MIPS_CPS=y
CONFIG_SYS_SUPPORTS_SMP=y
CONFIG_NR_CPUS=2
CONFIG_MIPS_PERF_SHARED_TC_COUNTERS=y
CONFIG_MIPS_NR_CPU_NR_MAP=2
# CONFIG_HZ_24 is not set
# CONFIG_HZ_48 is not set
CONFIG_HZ_100=y
# CONFIG_HZ_128 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_256 is not set
# CONFIG_HZ_1000 is not set
# CONFIG_HZ_1024 is not set
CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0xffffffff84000000
CONFIG_MIPS_O32_FP64_SUPPORT=y
CONFIG_USE_OF=y
CONFIG_BUILTIN_DTB=y
CONFIG_MIPS_NO_APPENDED_DTB=y
# CONFIG_MIPS_ELF_APPENDED_DTB is not set
# CONFIG_MIPS_RAW_APPENDED_DTB is not set
# CONFIG_MIPS_CMDLINE_FROM_DTB is not set
# CONFIG_MIPS_CMDLINE_DTB_EXTEND is not set
CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_MIPS_AUTO_PFN_OFFSET=y

#
# Bus options (PCI, PCMCIA, EISA, ISA, TC)
#
CONFIG_HW_HAS_PCI=y
# CONFIG_PCI is not set
CONFIG_PCI_DRIVERS_GENERIC=y

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=15
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=15
# CONFIG_PCCARD is not set
CONFIG_TRAD_SIGNALS=y

#
# Power management options
#
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y

#
# CPU Power Management
#

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y

#
# MIPS CPU Idle Drivers
#

#
# Firmware Drivers
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_ARM_SCPI_POWER_DOMAIN=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# CONFIG_VIRTUALIZATION is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_OPROFILE is not set
CONFIG_HAVE_OPROFILE=y
# CONFIG_JUMP_LABEL is not set
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=12
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_CLONE_BACKWARDS=y
# CONFIG_REFCOUNT_FULL is not set
CONFIG_HAVE_ARCH_COMPILER_H=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_GCOV_FORMAT_4_7=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
# CONFIG_BLOCK is not set
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_ELFCORE=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_BALLOON_COMPACTION is not set
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_MMAP_NOEXEC_TAINT=1
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_IDLE_PAGE_TRACKING=y
# CONFIG_LOW_MEM_NOTIFY is not set
CONFIG_FRAME_VECTOR=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_MM_METRICS is not set
# CONFIG_NET is not set
CONFIG_HAVE_CBPF_JIT=y

#
# Device Drivers
#

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8

#
# Bus devices
#
CONFIG_BRCMSTB_GISB_ARB=y
CONFIG_QCOM_EBI2=y
# CONFIG_SIMPLE_PM_BUS is not set
CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
# CONFIG_PARPORT is not set

#
# NVME Support
#

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
# CONFIG_AD525X_DPOT is not set
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_QCOM_COINCELL is not set
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_USB_SWITCH_FSA9480 is not set
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_MISC_RTSX=y
# CONFIG_MEMORY_STATE_TIME is not set
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_93XX46=y
CONFIG_EEPROM_IDT_89HPESX=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_SENSORS_LIS3_SPI is not set
CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y
CONFIG_MISC_RTSX_USB=y
CONFIG_HAVE_IDE=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set
# CONFIG_INPUT_KEYRESET is not set
# CONFIG_INPUT_KEYCOMBO is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5520=y
# CONFIG_KEYBOARD_ADP5588 is not set
CONFIG_KEYBOARD_ADP5589=y
# CONFIG_KEYBOARD_ATKBD is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_CLPS711X is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=y
# CONFIG_KEYBOARD_TCA8418 is not set
CONFIG_KEYBOARD_MATRIX=y
# CONFIG_KEYBOARD_LM8323 is not set
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_MAX7359=y
# CONFIG_KEYBOARD_MCS is not set
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_NEWTON=y
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_SH_KEYSC is not set
# CONFIG_KEYBOARD_OMAP4 is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
CONFIG_KEYBOARD_XTKBD=y
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
CONFIG_KEYBOARD_MTK_PMIC=y
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
# CONFIG_TABLET_USB_GTCO is not set
CONFIG_TABLET_USB_HANWANG=y
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
CONFIG_TOUCHSCREEN_ADS7846=y
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=y
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
CONFIG_TOUCHSCREEN_CY8CTMG110=y
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DA9052 is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_ILI210X is not set
CONFIG_TOUCHSCREEN_IPROC=y
CONFIG_TOUCHSCREEN_S6SY761=y
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=y
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=y
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=y
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MTOUCH=y
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_MIGOR=y
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
CONFIG_TOUCHSCREEN_WM831X=y
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MX25=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
# CONFIG_TOUCHSCREEN_USB_ITM is not set
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
CONFIG_TOUCHSCREEN_USB_GUNZE=y
# CONFIG_TOUCHSCREEN_USB_DMC_TSC10 is not set
# CONFIG_TOUCHSCREEN_USB_IRTOUCH is not set
# CONFIG_TOUCHSCREEN_USB_IDEALTEK is not set
# CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
# CONFIG_TOUCHSCREEN_USB_GOTOP is not set
# CONFIG_TOUCHSCREEN_USB_JASTEC is not set
# CONFIG_TOUCHSCREEN_USB_ELO is not set
# CONFIG_TOUCHSCREEN_USB_E2I is not set
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
# CONFIG_TOUCHSCREEN_USB_NEXIO is not set
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=y
# CONFIG_TOUCHSCREEN_TS4800 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2005=y
CONFIG_TOUCHSCREEN_TSC2007=y
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SUR40=y
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=y
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SPI=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_LIBPS2 is not set
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
# CONFIG_CONSOLE_TRANSLATIONS is not set
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=y
# CONFIG_TRACE_SINK is not set
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_LDISC_AUTOLOAD is not set
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_FINTEK=y
# CONFIG_SERIAL_8250_CONSOLE is not set
CONFIG_SERIAL_8250_MEN_MCB=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_BCM2835AUX is not set
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_LPC18XX is not set
CONFIG_SERIAL_8250_UNIPHIER=y
# CONFIG_SERIAL_8250_INGENIC is not set
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_ATMEL is not set
CONFIG_SERIAL_CLPS711X=y
CONFIG_SERIAL_CLPS711X_CONSOLE=y
CONFIG_SERIAL_MAX3100=y
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=y
CONFIG_SERIAL_IMX_CONSOLE=y
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_QCOM_GENI=y
CONFIG_SERIAL_QCOM_GENI_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_SC16IS7XX_SPI=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_MXS_AUART=y
# CONFIG_SERIAL_MXS_AUART_CONSOLE is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_ST_ASC=y
# CONFIG_SERIAL_ST_ASC_CONSOLE is not set
# CONFIG_SERIAL_MEN_Z135 is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
# CONFIG_IPMI_PANIC_EVENT is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
CONFIG_ASPEED_BT_IPMI_BMC=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
# CONFIG_HW_RANDOM_EXYNOS is not set
# CONFIG_TCG_TPM is not set
# CONFIG_XILLYBUS is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
# CONFIG_I2C_EFM32 is not set
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX_LPI2C=y
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_KEMPLD is not set
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MESON is not set
CONFIG_I2C_MT65XX=y
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_QCOM_GENI=y
CONFIG_I2C_RIIC=y
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=y
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=y
# CONFIG_SPI_ARMADA_3700 is not set
# CONFIG_SPI_ATMEL is not set
CONFIG_SPI_AXI_SPI_ENGINE=y
CONFIG_SPI_BCM2835=y
# CONFIG_SPI_BCM2835AUX is not set
CONFIG_SPI_BCM63XX=y
# CONFIG_SPI_BCM63XX_HSSPI is not set
CONFIG_SPI_BCM_QSPI=y
CONFIG_SPI_BITBANG=y
CONFIG_SPI_CADENCE=y
CONFIG_SPI_CLPS711X=y
CONFIG_SPI_DESIGNWARE=y
CONFIG_SPI_DW_MMIO=y
# CONFIG_SPI_DLN2 is not set
# CONFIG_SPI_EP93XX is not set
CONFIG_SPI_FSL_LPSPI=y
CONFIG_SPI_GPIO=y
CONFIG_SPI_IMG_SPFI=y
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_JCORE is not set
# CONFIG_SPI_LP8841_RTC is not set
# CONFIG_SPI_FSL_SPI is not set
CONFIG_SPI_FSL_DSPI=y
# CONFIG_SPI_MESON_SPICC is not set
CONFIG_SPI_MESON_SPIFC=y
CONFIG_SPI_MT65XX=y
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=y
CONFIG_SPI_OMAP24XX=y
CONFIG_SPI_TI_QSPI=y
# CONFIG_SPI_OMAP_100K is not set
CONFIG_SPI_ORION=y
CONFIG_SPI_PIC32=y
CONFIG_SPI_PIC32_SQI=y
# CONFIG_SPI_ROCKCHIP is not set
CONFIG_SPI_RSPI=y
# CONFIG_SPI_QCOM_GENI is not set
CONFIG_SPI_S3C64XX=y
CONFIG_SPI_SC18IS602=y
# CONFIG_SPI_SH_MSIOF is not set
# CONFIG_SPI_SH is not set
CONFIG_SPI_SH_HSPI=y
# CONFIG_SPI_SPRD_ADI is not set
CONFIG_SPI_STM32=y
CONFIG_SPI_ST_SSC4=y
# CONFIG_SPI_SUN4I is not set
CONFIG_SPI_SUN6I=y
CONFIG_SPI_TEGRA114=y
CONFIG_SPI_TEGRA20_SFLASH=y
CONFIG_SPI_TEGRA20_SLINK=y
# CONFIG_SPI_TXX9 is not set
# CONFIG_SPI_UNIPHIER is not set
CONFIG_SPI_XCOMM=y
CONFIG_SPI_XILINX=y
CONFIG_SPI_XLP=y
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
CONFIG_SPI_TLE62X0=y
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=y
# CONFIG_PINCTRL_DA850_PUPD is not set
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_APQ8064 is not set
# CONFIG_PINCTRL_APQ8084 is not set
# CONFIG_PINCTRL_IPQ4019 is not set
# CONFIG_PINCTRL_IPQ8064 is not set
# CONFIG_PINCTRL_IPQ8074 is not set
# CONFIG_PINCTRL_MSM8660 is not set
# CONFIG_PINCTRL_MSM8960 is not set
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8994 is not set
# CONFIG_PINCTRL_MSM8996 is not set
# CONFIG_PINCTRL_MSM8998 is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_SDM845 is not set
# CONFIG_PINCTRL_SPRD is not set
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
CONFIG_PINCTRL_MT6397=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_ASPEED is not set
CONFIG_GPIO_ATH79=y
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BRCMSTB is not set
# CONFIG_GPIO_CLPS711X is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
# CONFIG_GPIO_FTGPIO010 is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_GRGPIO is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_INGENIC is not set
# CONFIG_GPIO_IOP is not set
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_SYSCON is not set
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
# CONFIG_GPIO_XILINX is not set
CONFIG_GPIO_XLP=y
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
CONFIG_GPIO_ADP5588_IRQ=y
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
CONFIG_GPIO_TS4900=y

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DA9055=y
# CONFIG_GPIO_DLN2 is not set
# CONFIG_GPIO_KEMPLD is not set
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_TPS65912=y
# CONFIG_GPIO_WM831X is not set
# CONFIG_GPIO_WM8350 is not set

#
# SPI GPIO expanders
#
# CONFIG_GPIO_74X164 is not set
CONFIG_GPIO_MAX3191X=y
CONFIG_GPIO_MAX7301=y
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_BRCMKONA is not set
CONFIG_POWER_RESET_BRCMSTB=y
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_GPIO_RESTART is not set
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
CONFIG_POWER_RESET_RMOBILE=y
# CONFIG_POWER_RESET_ZX is not set
# CONFIG_SYSCON_REBOOT_MODE is not set
CONFIG_POWER_RESET_SC27XX=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_MAX14577=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX8998=y
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_SC2731=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=y
# CONFIG_SENSORS_ADM1021 is not set
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=y
CONFIG_SENSORS_ADT7411=y
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DA9052_ADC=y
# CONFIG_SENSORS_DA9055 is not set
CONFIG_SENSORS_F71805F=y
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=y
CONFIG_SENSORS_FTSTEUTATES=y
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=y
# CONFIG_SENSORS_IBMAEM is not set
CONFIG_SENSORS_IBMPEX=y
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=y
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX1111=y
CONFIG_SENSORS_MAX16065=y
CONFIG_SENSORS_MAX1619=y
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31722 is not set
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MCP3021=y
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
# CONFIG_SENSORS_ADCXX is not set
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM70=y
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=y
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
CONFIG_SENSORS_NPCM7XX=y
# CONFIG_SENSORS_NSA320 is not set
CONFIG_SENSORS_PCF8591=y
CONFIG_PMBUS=y
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1275 is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
CONFIG_SENSORS_IR35221=y
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX16064 is not set
CONFIG_SENSORS_MAX20751=y
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=y
CONFIG_SENSORS_UCD9000=y
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
CONFIG_SENSORS_SHT15=y
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=y
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_DME1737=y
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_STTS751=y
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
# CONFIG_SENSORS_ADS1015 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=y
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83791D=y
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83793=y
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83L786NG=y
# CONFIG_SENSORS_W83627HF is not set
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y
CONFIG_SENSORS_WM8350=y
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
# CONFIG_WATCHDOG_SYSFS is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_DA9052_WATCHDOG=y
CONFIG_DA9055_WATCHDOG=y
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_MENZ069_WATCHDOG=y
# CONFIG_TANGOX_WATCHDOG is not set
CONFIG_WM831X_WATCHDOG=y
# CONFIG_WM8350_WATCHDOG is not set
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_ASM9260_WATCHDOG is not set
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
# CONFIG_SAMA5D4_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_FTWDT010_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=y
CONFIG_OMAP_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
# CONFIG_RN5T618_WATCHDOG is not set
CONFIG_SUNXI_WATCHDOG=y
# CONFIG_NPCM7XX_WATCHDOG is not set
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_NUC900_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
CONFIG_TS72XX_WATCHDOG=y
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_IMX2_WDT is not set
CONFIG_MOXART_WDT=y
CONFIG_SIRFSOC_WATCHDOG=y
# CONFIG_ST_LPC_WATCHDOG is not set
CONFIG_TEGRA_WATCHDOG=y
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=y
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_ATLAS7_WATCHDOG is not set
CONFIG_RENESAS_WDT=y
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_ASPEED_WATCHDOG=y
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
CONFIG_SPRD_WATCHDOG=y
# CONFIG_SC520_WDT is not set
CONFIG_KEMPLD_WDT=y
# CONFIG_BCM47XX_WDT is not set
CONFIG_WDT_MTX1=y
# CONFIG_SIBYTE_WDOG is not set
# CONFIG_AR7_WDT is not set
CONFIG_TXX9_WDT=y
# CONFIG_BCM2835_WDT is not set
CONFIG_BCM_KONA_WDT=y
CONFIG_BCM_KONA_WDT_DEBUG=y
CONFIG_BCM7038_WDT=y
CONFIG_IMGPDC_WDT=y
CONFIG_PIC32_WDT=y
CONFIG_PIC32_DMT=y
CONFIG_MPC5200_WDT=y
# CONFIG_MV64X60_WDT is not set
CONFIG_MEN_A21_WDT=y
CONFIG_UML_WATCHDOG=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_SERIAL=y
CONFIG_SSB_DRIVER_MIPS=y
CONFIG_SSB_SFLASH=y
# CONFIG_SSB_DRIVER_EXTIF is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=y
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_CPCAP=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
CONFIG_MFD_SC27XX_PMIC=y
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=y
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
# CONFIG_MFD_CS47L24 is not set
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_STW481X=y
# CONFIG_MFD_ROHM_BD718XX is not set
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_RAVE_SP_CORE is not set
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
# CONFIG_REGULATOR_AAT2870 is not set
CONFIG_REGULATOR_CPCAP=y
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=y
# CONFIG_REGULATOR_DA9063 is not set
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LM363X=y
# CONFIG_REGULATOR_LP3971 is not set
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
# CONFIG_REGULATOR_LP8788 is not set
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
# CONFIG_REGULATOR_MC13892 is not set
# CONFIG_REGULATOR_MT6311 is not set
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6380=y
CONFIG_REGULATOR_MT6397=y
# CONFIG_REGULATOR_PBIAS is not set
# CONFIG_REGULATOR_PCF50633 is not set
# CONFIG_REGULATOR_PFUZE100 is not set
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_RPMH=y
CONFIG_REGULATOR_QCOM_SMD_RPM=y
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RT5033=y
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
CONFIG_REGULATOR_SC2731=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
CONFIG_REGULATOR_STW481X_VMMC=y
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS6524X=y
# CONFIG_REGULATOR_TPS65912 is not set
# CONFIG_REGULATOR_UNIPHIER is not set
# CONFIG_REGULATOR_VCTRL is not set
# CONFIG_REGULATOR_WM831X is not set
# CONFIG_REGULATOR_WM8350 is not set
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_CEC_CORE=y
# CONFIG_RC_CORE is not set
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_V4L2=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=y
CONFIG_V4L2_FWNODE=y
CONFIG_VIDEOBUF_GEN=y
CONFIG_VIDEOBUF_VMALLOC=y
CONFIG_DVB_CORE=y
CONFIG_DVB_MMAP=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
CONFIG_DVB_ULE_DEBUG=y

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
# CONFIG_USB_VIDEO_CLASS is not set
CONFIG_USB_GSPCA=y
# CONFIG_USB_M5602 is not set
CONFIG_USB_STV06XX=y
CONFIG_USB_GL860=y
CONFIG_USB_GSPCA_BENQ=y
CONFIG_USB_GSPCA_CONEX=y
CONFIG_USB_GSPCA_CPIA1=y
CONFIG_USB_GSPCA_DTCS033=y
CONFIG_USB_GSPCA_ETOMS=y
CONFIG_USB_GSPCA_FINEPIX=y
# CONFIG_USB_GSPCA_JEILINJ is not set
CONFIG_USB_GSPCA_JL2005BCD=y
CONFIG_USB_GSPCA_KINECT=y
CONFIG_USB_GSPCA_KONICA=y
CONFIG_USB_GSPCA_MARS=y
CONFIG_USB_GSPCA_MR97310A=y
CONFIG_USB_GSPCA_NW80X=y
# CONFIG_USB_GSPCA_OV519 is not set
CONFIG_USB_GSPCA_OV534=y
CONFIG_USB_GSPCA_OV534_9=y
CONFIG_USB_GSPCA_PAC207=y
CONFIG_USB_GSPCA_PAC7302=y
CONFIG_USB_GSPCA_PAC7311=y
CONFIG_USB_GSPCA_SE401=y
CONFIG_USB_GSPCA_SN9C2028=y
CONFIG_USB_GSPCA_SN9C20X=y
CONFIG_USB_GSPCA_SONIXB=y
CONFIG_USB_GSPCA_SONIXJ=y
CONFIG_USB_GSPCA_SPCA500=y
CONFIG_USB_GSPCA_SPCA501=y
CONFIG_USB_GSPCA_SPCA505=y
CONFIG_USB_GSPCA_SPCA506=y
CONFIG_USB_GSPCA_SPCA508=y
CONFIG_USB_GSPCA_SPCA561=y
CONFIG_USB_GSPCA_SPCA1528=y
# CONFIG_USB_GSPCA_SQ905 is not set
CONFIG_USB_GSPCA_SQ905C=y
CONFIG_USB_GSPCA_SQ930X=y
CONFIG_USB_GSPCA_STK014=y
CONFIG_USB_GSPCA_STK1135=y
# CONFIG_USB_GSPCA_STV0680 is not set
# CONFIG_USB_GSPCA_SUNPLUS is not set
CONFIG_USB_GSPCA_T613=y
CONFIG_USB_GSPCA_TOPRO=y
CONFIG_USB_GSPCA_TOUPTEK=y
# CONFIG_USB_GSPCA_TV8532 is not set
# CONFIG_USB_GSPCA_VC032X is not set
CONFIG_USB_GSPCA_VICAM=y
CONFIG_USB_GSPCA_XIRLINK_CIT=y
CONFIG_USB_GSPCA_ZC3XX=y
# CONFIG_USB_PWC is not set
CONFIG_VIDEO_CPIA2=y
CONFIG_USB_ZR364XX=y
# CONFIG_USB_STKWEBCAM is not set
CONFIG_USB_S2255=y
CONFIG_VIDEO_USBTV=y

#
# Analog TV USB devices
#
CONFIG_VIDEO_PVRUSB2=y
CONFIG_VIDEO_PVRUSB2_SYSFS=y
CONFIG_VIDEO_PVRUSB2_DVB=y
CONFIG_VIDEO_PVRUSB2_DEBUGIFC=y
CONFIG_VIDEO_HDPVR=y
# CONFIG_VIDEO_USBVISION is not set
CONFIG_VIDEO_STK1160_COMMON=y
CONFIG_VIDEO_STK1160=y
# CONFIG_VIDEO_GO7007 is not set

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=y
CONFIG_VIDEO_AU0828_V4L2=y
CONFIG_VIDEO_CX231XX=y
CONFIG_VIDEO_CX231XX_ALSA=y
CONFIG_VIDEO_CX231XX_DVB=y

#
# Digital TV USB devices
#
CONFIG_DVB_USB_V2=y
# CONFIG_DVB_USB_AF9015 is not set
CONFIG_DVB_USB_AF9035=y
CONFIG_DVB_USB_ANYSEE=y
CONFIG_DVB_USB_AU6610=y
CONFIG_DVB_USB_AZ6007=y
# CONFIG_DVB_USB_CE6230 is not set
# CONFIG_DVB_USB_EC168 is not set
# CONFIG_DVB_USB_GL861 is not set
CONFIG_DVB_USB_MXL111SF=y
CONFIG_DVB_USB_RTL28XXU=y
CONFIG_DVB_USB_DVBSKY=y
CONFIG_DVB_USB_ZD1301=y
# CONFIG_SMS_USB_DRV is not set
# CONFIG_DVB_B2C2_FLEXCOP_USB is not set
# CONFIG_DVB_AS102 is not set

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=y
CONFIG_VIDEO_EM28XX_V4L2=y
CONFIG_VIDEO_EM28XX_ALSA=y
CONFIG_VIDEO_EM28XX_DVB=y

#
# Software defined radio USB devices
#
CONFIG_USB_AIRSPY=y
CONFIG_USB_HACKRF=y
CONFIG_USB_MSI2500=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
# CONFIG_SMS_SDIO_DRV is not set
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=y
CONFIG_RADIO_SI470X=y
CONFIG_USB_SI470X=y
# CONFIG_I2C_SI470X is not set
CONFIG_RADIO_SI4713=y
# CONFIG_USB_SI4713 is not set
# CONFIG_PLATFORM_SI4713 is not set
CONFIG_I2C_SI4713=y
CONFIG_USB_MR800=y
CONFIG_USB_DSBR=y
CONFIG_RADIO_SHARK=y
CONFIG_RADIO_SHARK2=y
CONFIG_USB_KEENE=y
CONFIG_USB_RAREMONO=y
CONFIG_USB_MA901=y
CONFIG_RADIO_TEA5764=y
# CONFIG_RADIO_TEA5764_XTAL is not set
# CONFIG_RADIO_SAA7706H is not set
CONFIG_RADIO_TEF6862=y
CONFIG_RADIO_WL1273=y

#
# Texas Instruments WL128x FM driver (ST based)
#
# CONFIG_V4L_RADIO_ISA_DRIVERS is not set

#
# Supported FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
CONFIG_VIDEO_CX2341X=y
CONFIG_VIDEO_TVEEPROM=y
CONFIG_CYPRESS_FIRMWARE=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=y
CONFIG_VIDEO_TEA6415C=y
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_MSP3400=y
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
CONFIG_VIDEO_TLV320AIC23B=y
CONFIG_VIDEO_UDA1342=y
CONFIG_VIDEO_WM8775=y
CONFIG_VIDEO_WM8739=y
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=y
CONFIG_VIDEO_ADV7183=y
# CONFIG_VIDEO_ADV748X is not set
CONFIG_VIDEO_ADV7604=y
CONFIG_VIDEO_ADV7604_CEC=y
CONFIG_VIDEO_ADV7842=y
# CONFIG_VIDEO_ADV7842_CEC is not set
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=y
CONFIG_VIDEO_BT866=y
# CONFIG_VIDEO_KS0127 is not set
CONFIG_VIDEO_ML86V7667=y
CONFIG_VIDEO_AD5820=y
CONFIG_VIDEO_AK7375=y
CONFIG_VIDEO_DW9714=y
CONFIG_VIDEO_DW9807_VCM=y
# CONFIG_VIDEO_SAA7110 is not set
CONFIG_VIDEO_SAA711X=y
CONFIG_VIDEO_TC358743=y
# CONFIG_VIDEO_TC358743_CEC is not set
# CONFIG_VIDEO_TVP514X is not set
CONFIG_VIDEO_TVP5150=y
CONFIG_VIDEO_TVP7002=y
CONFIG_VIDEO_TW2804=y
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
CONFIG_VIDEO_VPX3220=y

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=y
CONFIG_VIDEO_CX25840=y

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=y
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_ADV7170=y
# CONFIG_VIDEO_ADV7175 is not set
CONFIG_VIDEO_ADV7343=y
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
# CONFIG_VIDEO_ADV7511_CEC is not set
CONFIG_VIDEO_AD9389B=y
CONFIG_VIDEO_AK881X=y
CONFIG_VIDEO_THS8200=y

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=y
CONFIG_VIDEO_IMX258=y
CONFIG_VIDEO_IMX274=y
CONFIG_VIDEO_OV2640=y
CONFIG_VIDEO_OV2659=y
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
# CONFIG_VIDEO_OV5640 is not set
# CONFIG_VIDEO_OV5645 is not set
CONFIG_VIDEO_OV5647=y
CONFIG_VIDEO_OV6650=y
CONFIG_VIDEO_OV5670=y
CONFIG_VIDEO_OV5695=y
# CONFIG_VIDEO_OV7251 is not set
# CONFIG_VIDEO_OV772X is not set
CONFIG_VIDEO_OV7640=y
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_OV7740=y
CONFIG_VIDEO_OV9650=y
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_VS6624 is not set
CONFIG_VIDEO_MT9M032=y
CONFIG_VIDEO_MT9M111=y
CONFIG_VIDEO_MT9P031=y
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9T112 is not set
CONFIG_VIDEO_MT9V011=y
CONFIG_VIDEO_MT9V032=y
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
CONFIG_VIDEO_NOON010PC30=y
# CONFIG_VIDEO_M5MOLS is not set
CONFIG_VIDEO_RJ54N1=y
# CONFIG_VIDEO_S5K6AA is not set
CONFIG_VIDEO_S5K6A3=y
CONFIG_VIDEO_S5K4ECGX=y
CONFIG_VIDEO_S5K5BAF=y
# CONFIG_VIDEO_SMIAPP is not set
CONFIG_VIDEO_ET8EK8=y
CONFIG_VIDEO_S5C73M3=y

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=y
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=y
CONFIG_VIDEO_UPD64083=y

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=y

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_THS7303=y
CONFIG_VIDEO_M52790=y
CONFIG_VIDEO_I2C=y

#
# Sensors used on soc_camera driver
#

#
# SPI helper chips
#
CONFIG_VIDEO_GS1662=y

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
CONFIG_MEDIA_TUNER_MSI001=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2060=y
CONFIG_MEDIA_TUNER_MT2063=y
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC2580=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_TUA9001=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_R820T=y
CONFIG_MEDIA_TUNER_MXL301RF=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=y
CONFIG_DVB_STB6100=y
CONFIG_DVB_STV090x=y
CONFIG_DVB_STV0910=y
# CONFIG_DVB_STV6110x is not set
CONFIG_DVB_STV6111=y
CONFIG_DVB_MXL5XX=y
CONFIG_DVB_M88DS3103=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
CONFIG_DVB_TDA18271C2DD=y
CONFIG_DVB_SI2165=y
CONFIG_DVB_MN88472=y
CONFIG_DVB_MN88473=y

#
# DVB-S (satellite) frontends
#
# CONFIG_DVB_CX24110 is not set
CONFIG_DVB_CX24123=y
# CONFIG_DVB_MT312 is not set
# CONFIG_DVB_ZL10036 is not set
CONFIG_DVB_ZL10039=y
# CONFIG_DVB_S5H1420 is not set
CONFIG_DVB_STV0288=y
CONFIG_DVB_STB6000=y
CONFIG_DVB_STV0299=y
CONFIG_DVB_STV6110=y
CONFIG_DVB_STV0900=y
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA10086=y
CONFIG_DVB_TDA8261=y
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_TUNER_ITD1000=y
CONFIG_DVB_TUNER_CX24113=y
CONFIG_DVB_TDA826X=y
CONFIG_DVB_TUA6100=y
CONFIG_DVB_CX24116=y
# CONFIG_DVB_CX24117 is not set
CONFIG_DVB_CX24120=y
CONFIG_DVB_SI21XX=y
CONFIG_DVB_TS2020=y
CONFIG_DVB_DS3000=y
CONFIG_DVB_MB86A16=y
CONFIG_DVB_TDA10071=y

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_SP8870 is not set
CONFIG_DVB_SP887X=y
CONFIG_DVB_CX22700=y
CONFIG_DVB_CX22702=y
CONFIG_DVB_S5H1432=y
CONFIG_DVB_DRXD=y
CONFIG_DVB_L64781=y
CONFIG_DVB_TDA1004X=y
CONFIG_DVB_NXT6000=y
CONFIG_DVB_MT352=y
CONFIG_DVB_ZL10353=y
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=y
CONFIG_DVB_DIB7000M=y
CONFIG_DVB_DIB7000P=y
CONFIG_DVB_DIB9000=y
CONFIG_DVB_TDA10048=y
# CONFIG_DVB_AF9013 is not set
# CONFIG_DVB_EC100 is not set
CONFIG_DVB_STV0367=y
CONFIG_DVB_CXD2820R=y
CONFIG_DVB_CXD2841ER=y
CONFIG_DVB_RTL2830=y
CONFIG_DVB_RTL2832=y
CONFIG_DVB_RTL2832_SDR=y
CONFIG_DVB_SI2168=y
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_CXD2880=y

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=y
CONFIG_DVB_TDA10021=y
CONFIG_DVB_TDA10023=y
# CONFIG_DVB_STV0297 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_NXT200X is not set
CONFIG_DVB_OR51211=y
# CONFIG_DVB_OR51132 is not set
CONFIG_DVB_BCM3510=y
CONFIG_DVB_LGDT330X=y
CONFIG_DVB_LGDT3305=y
CONFIG_DVB_LGDT3306A=y
CONFIG_DVB_LG2160=y
CONFIG_DVB_S5H1409=y
CONFIG_DVB_AU8522=y
CONFIG_DVB_AU8522_DTV=y
CONFIG_DVB_AU8522_V4L=y
CONFIG_DVB_S5H1411=y

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=y
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=y
CONFIG_DVB_MN88443X=y

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=y
CONFIG_DVB_TUNER_DIB0070=y
CONFIG_DVB_TUNER_DIB0090=y

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=y
CONFIG_DVB_LNBH25=y
CONFIG_DVB_LNBP21=y
CONFIG_DVB_LNBP22=y
CONFIG_DVB_ISL6405=y
CONFIG_DVB_ISL6421=y
CONFIG_DVB_ISL6423=y
CONFIG_DVB_A8293=y
CONFIG_DVB_LGS8GL5=y
# CONFIG_DVB_LGS8GXX is not set
CONFIG_DVB_ATBM8830=y
# CONFIG_DVB_TDA665x is not set
# CONFIG_DVB_IX2505V is not set
CONFIG_DVB_M88RS2000=y
CONFIG_DVB_AF9033=y
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ASCOT2E=y
CONFIG_DVB_HELENE=y

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=y
CONFIG_DVB_SP2=y

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=y

#
# Graphics support
#
CONFIG_IMX_IPUV3_CORE=y
# CONFIG_DRM is not set
# CONFIG_DRM_DP_CEC is not set

#
# ACP (Audio CoProcessor) Configuration
#

#
# AMD Library routines
#

#
# ARM GPU Configuration
#

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
CONFIG_HDMI=y

#
# Console display driver support
#
# CONFIG_VGA_CONSOLE is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
# CONFIG_SND_OSSEMUL is not set
# CONFIG_SND_PCM_TIMER is not set
# CONFIG_SND_HRTIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
CONFIG_SND_VMASTER=y
CONFIG_SND_SEQUENCER=y
# CONFIG_SND_SEQ_DUMMY is not set
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=y
# CONFIG_SND_ALOOP is not set
# CONFIG_SND_VIRMIDI is not set
CONFIG_SND_MTPAV=y
CONFIG_SND_SERIAL_U16550=y
# CONFIG_SND_MPU401 is not set

#
# HD-Audio
#
CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_SPI is not set
# CONFIG_SND_MIPS is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=y
CONFIG_SND_USB_UA101=y
CONFIG_SND_USB_CAIAQ=y
# CONFIG_SND_USB_CAIAQ_INPUT is not set
CONFIG_SND_USB_US122L=y
CONFIG_SND_USB_6FIRE=y
CONFIG_SND_USB_HIFACE=y
# CONFIG_SND_BCD2000 is not set
CONFIG_SND_USB_LINE6=y
# CONFIG_SND_USB_POD is not set
CONFIG_SND_USB_PODHD=y
# CONFIG_SND_USB_TONEPORT is not set
CONFIG_SND_USB_VARIAX=y
# CONFIG_SND_FIREWIRE is not set
# CONFIG_SND_SOC is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
CONFIG_UHID=y
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACCUTOUCH=y
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=y
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
CONFIG_HID_BETOP_FF=y
# CONFIG_HID_CHERRY is not set
CONFIG_HID_CHICONY=y
CONFIG_HID_CORSAIR=y
CONFIG_HID_COUGAR=y
CONFIG_HID_PRODIKEYS=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CP2112=y
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
CONFIG_HID_HOLTEK=y
# CONFIG_HOLTEK_FF is not set
CONFIG_HID_GOOGLE_HAMMER=y
CONFIG_HID_GT683R=y
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=y
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_DJ=y
CONFIG_HID_LOGITECH_HIDPP=y
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PENMOUNT=y
CONFIG_HID_PETALYNX=y
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_QUICKSTEP is not set
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=y
CONFIG_HID_SAITEK=y
CONFIG_HID_SAMSUNG=y
CONFIG_HID_SONY=y
CONFIG_SONY_FF=y
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=y
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
# CONFIG_HID_THINGM is not set
CONFIG_HID_THRUSTMASTER=y
CONFIG_THRUSTMASTER_FF=y
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
CONFIG_HID_ALPS=y

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_OTG_FSM=y
# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
CONFIG_USB_MON=y
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
CONFIG_USB_XHCI_MTK=y
# CONFIG_USB_XHCI_MVEBU is not set
CONFIG_USB_XHCI_RCAR=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_SSB=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
CONFIG_USB_R8A66597_HCD=y
# CONFIG_USB_RENESAS_USBHS_HCD is not set
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MTU3=y
CONFIG_USB_MTU3_HOST=y
# CONFIG_USB_MTU3_GADGET is not set
# CONFIG_USB_MTU3_DUAL_ROLE is not set
# CONFIG_USB_MTU3_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
# CONFIG_USB_MUSB_GADGET is not set
CONFIG_USB_MUSB_DUAL_ROLE=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_DSPS is not set
CONFIG_USB_MUSB_UX500=y

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
# CONFIG_USB_DWC3_HOST is not set
# CONFIG_USB_DWC3_GADGET is not set
CONFIG_USB_DWC3_DUAL_ROLE=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_OMAP=y
CONFIG_USB_DWC3_EXYNOS=y
# CONFIG_USB_DWC3_KEYSTONE is not set
CONFIG_USB_DWC3_OF_SIMPLE=y
CONFIG_USB_DWC3_ST=y
CONFIG_USB_DWC3_QCOM=y
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_OF=y
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_HOST=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
# CONFIG_USB_SERIAL_CP210X is not set
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
CONFIG_USB_SERIAL_FTDI_SIO=y
# CONFIG_USB_SERIAL_VISOR is not set
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_F8153X=y
CONFIG_USB_SERIAL_GARMIN=y
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=y
# CONFIG_USB_SERIAL_KLSI is not set
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
# CONFIG_USB_SERIAL_QUALCOMM is not set
CONFIG_USB_SERIAL_SPCP8X5=y
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
CONFIG_USB_SERIAL_SYMBOL=y
CONFIG_USB_SERIAL_TI=y
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_XIRCOM is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=y
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=y
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
# CONFIG_USB_RIO500 is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
# CONFIG_USB_IOWARRIOR is not set
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
# CONFIG_USB_ISIGHTFW is not set
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_USB_GPIO_VBUS=y
# CONFIG_USB_ISP1301 is not set
CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
CONFIG_USB_GADGET_VERBOSE=y
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
# CONFIG_USB_FUSB300 is not set
CONFIG_USB_FOTG210_UDC=y
CONFIG_USB_GR_UDC=y
CONFIG_USB_R8A66597=y
CONFIG_USB_RENESAS_USBHS_UDC=y
CONFIG_USB_RENESAS_USB3=y
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
# CONFIG_USB_SNP_UDC_PLAT is not set
CONFIG_USB_M66592=y
CONFIG_USB_BDC_UDC=y

#
# Platform Support
#
CONFIG_USB_NET2272=y
CONFIG_USB_NET2272_DMA=y
# CONFIG_USB_GADGET_XILINX is not set
# CONFIG_USB_ASPEED_VHUB is not set
# CONFIG_USB_DUMMY_HCD is not set
CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_FS=y
CONFIG_USB_F_UAC1=y
CONFIG_USB_F_UAC1_LEGACY=y
CONFIG_USB_F_UAC2=y
CONFIG_USB_F_UVC=y
CONFIG_USB_F_PRINTER=y
CONFIG_USB_CONFIGFS=y
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
# CONFIG_USB_CONFIGFS_OBEX is not set
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
CONFIG_USB_CONFIGFS_F_FS=y
# CONFIG_USB_CONFIGFS_F_ACC is not set
# CONFIG_USB_CONFIGFS_UEVENT is not set
CONFIG_USB_CONFIGFS_F_UAC1=y
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
CONFIG_USB_CONFIGFS_F_UAC2=y
# CONFIG_USB_CONFIGFS_F_MIDI is not set
# CONFIG_USB_CONFIGFS_F_HID is not set
# CONFIG_USB_CONFIGFS_F_UVC is not set
CONFIG_USB_CONFIGFS_F_PRINTER=y
# CONFIG_USB_ZERO is not set
# CONFIG_USB_AUDIO is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
# CONFIG_USB_G_SERIAL is not set
# CONFIG_USB_MIDI_GADGET is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
CONFIG_USB_G_WEBCAM=y
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
# CONFIG_TYPEC_UCSI is not set
CONFIG_TYPEC_TPS6598X=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_UWB is not set
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
CONFIG_PWRSEQ_SIMPLE=y
CONFIG_SDIO_UART=y
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_PLTFM=y
# CONFIG_MMC_SDHCI_OF_ARASAN is not set
# CONFIG_MMC_SDHCI_OF_AT91 is not set
# CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
# CONFIG_MMC_SDHCI_CADENCE is not set
# CONFIG_MMC_SDHCI_PXAV3 is not set
# CONFIG_MMC_SDHCI_PXAV2 is not set
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_SDHCI_IPROC is not set
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_GOLDFISH is not set
# CONFIG_MMC_SPI is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_SDHI=y
# CONFIG_MMC_SDHI_SYS_DMAC is not set
# CONFIG_MMC_SDHI_INTERNAL_DMAC is not set
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=y
CONFIG_MMC_DW_EXYNOS=y
# CONFIG_MMC_DW_HI3798CV200 is not set
# CONFIG_MMC_DW_K3 is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
CONFIG_MMC_BCM2835=y
# CONFIG_MMC_MTK is not set
CONFIG_MMC_SDHCI_XENON=y
# CONFIG_MMC_SDHCI_OMAP is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_BCM6328 is not set
# CONFIG_LEDS_BCM6358 is not set
# CONFIG_LEDS_CPCAP is not set
# CONFIG_LEDS_CR0014114 is not set
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3533 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_WM8350=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=y
CONFIG_LEDS_MENF21BMC=y
CONFIG_LEDS_IS31FL319X=y
# CONFIG_LEDS_IS31FL32XX is not set
# CONFIG_LEDS_SC27XX_BLTC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_ACCESSIBILITY=y
CONFIG_A11Y_BRAILLE_CONSOLE=y
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
CONFIG_AUXDISPLAY=y
CONFIG_HD44780=y
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_CHARLCD=y
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_UIO_PRUSS=y
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
# CONFIG_VIRTIO_WL is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_STAGING=y
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=y
CONFIG_COMEDI_TEST=y
CONFIG_COMEDI_PARPORT=y
# CONFIG_COMEDI_SSV_DNP is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_USB_DRIVERS is not set
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=y

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# CONFIG_STAGING_BOARD is not set
# CONFIG_FIREWIRE_SERIAL is not set
# CONFIG_GOLDFISH_AUDIO is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
# CONFIG_MOST is not set
CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_GREYBUS_AUDIO is not set
CONFIG_GREYBUS_BOOTROM=y
CONFIG_GREYBUS_FIRMWARE=y
CONFIG_GREYBUS_HID=y
CONFIG_GREYBUS_LIGHT=y
# CONFIG_GREYBUS_LOG is not set
CONFIG_GREYBUS_LOOPBACK=y
# CONFIG_GREYBUS_POWER is not set
CONFIG_GREYBUS_RAW=y
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=y
CONFIG_GREYBUS_GPIO=y
# CONFIG_GREYBUS_I2C is not set
# CONFIG_GREYBUS_SDIO is not set
CONFIG_GREYBUS_SPI=y
# CONFIG_GREYBUS_UART is not set
# CONFIG_GREYBUS_USB is not set
CONFIG_GREYBUS_ARCHE=y
CONFIG_BCM_VIDEOCORE=y
# CONFIG_BCM2835_VCHIQ is not set
# CONFIG_VIDEO_BCM2835 is not set
CONFIG_PI433=y
# CONFIG_MTK_MMC is not set

#
# Gasket devices
#
# CONFIG_XIL_AXIS_FIFO is not set
# CONFIG_MIPS_PLATFORM_DEVICES is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_WM831X is not set
# CONFIG_COMMON_CLK_VERSATILE is not set
# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_MAX77686 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI514 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_SI570 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CDCE925 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_ASPEED is not set
# CONFIG_COMMON_CLK_S2MPS11 is not set
# CONFIG_COMMON_CLK_AXI_CLKGEN is not set
# CONFIG_CLK_QORIQ is not set
CONFIG_COMMON_CLK_XGENE=y
# CONFIG_COMMON_CLK_OXNAS is not set
# CONFIG_COMMON_CLK_VC5 is not set
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_STUB_CLK_HI6220 is not set
# CONFIG_STUB_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_COMMON_CLK_KEYSTONE is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_SPMI_PMIC_CLKDIV is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
CONFIG_FTTMR010_TIMER=y
# CONFIG_MESON6_TIMER is not set
CONFIG_OWL_TIMER=y
CONFIG_SUN4I_TIMER=y
# CONFIG_SUN5I_HSTIMER is not set
CONFIG_VT8500_TIMER=y
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
CONFIG_ASM9260_TIMER=y
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_TI_32K=y
# CONFIG_CLKSRC_NPS is not set
CONFIG_CLKSRC_MPS2=y
CONFIG_ARC_TIMERS=y
# CONFIG_ARC_TIMERS_64BIT is not set
# CONFIG_ARM_TIMER_SP804 is not set
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_ST=y
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
CONFIG_FSL_FTM_TIMER=y
# CONFIG_OXNAS_RPS_TIMER is not set
CONFIG_MTK_TIMER=y
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
CONFIG_SH_TIMER_CMT=y
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_VERSATILE=y
CONFIG_CLKSRC_MIPS_GIC=y
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
CONFIG_CLKSRC_ST_LPC=y
# CONFIG_ATCPIT100_TIMER is not set
CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_PLATFORM_MHU is not set
# CONFIG_ROCKCHIP_MBOX is not set
# CONFIG_ALTERA_MBOX is not set
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
CONFIG_QCOM_APCS_IPC=y
CONFIG_BCM_PDC_MBOX=y
CONFIG_MTK_CMDQ_MBOX=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_QCOM_GLINK_NATIVE=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_GX_PM_DOMAINS is not set
# CONFIG_MESON_MX_SOCINFO is not set
# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# NXP/Freescale QorIQ SoC drivers
#

#
# i.MX SoC drivers
#
# CONFIG_IMX7_PM_DOMAINS is not set

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
CONFIG_MTK_SCPSYS=y

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=y
# CONFIG_QCOM_GSBI is not set
CONFIG_QCOM_LLCC=y
# CONFIG_QCOM_SDM845_LLCC is not set
CONFIG_QCOM_RPMH=y
# CONFIG_QCOM_SMEM is not set
CONFIG_QCOM_SMD_RPM=y
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_APR is not set
CONFIG_SOC_RENESAS=y
# CONFIG_SYSC_R8A7743 is not set
# CONFIG_SYSC_R8A7745 is not set
CONFIG_SYSC_R8A77470=y
CONFIG_SYSC_R8A7779=y
CONFIG_SYSC_R8A7790=y
# CONFIG_SYSC_R8A7791 is not set
# CONFIG_SYSC_R8A7792 is not set
CONFIG_SYSC_R8A7794=y
CONFIG_SYSC_R8A7795=y
# CONFIG_SYSC_R8A7796 is not set
CONFIG_SYSC_R8A77965=y
# CONFIG_SYSC_R8A77970 is not set
CONFIG_SYSC_R8A77980=y
# CONFIG_SYSC_R8A77990 is not set
CONFIG_SYSC_R8A77995=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_PM_DOMAINS=y
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_PM_DOMAINS is not set
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# CONFIG_SOC_ZTE is not set
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=y
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_IRQ_MIPS_CPU=y
# CONFIG_JCORE_AIC is not set
CONFIG_TS4800_IRQ=y
CONFIG_MIPS_GIC=y
# CONFIG_EZNPS_GIC is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_GOLDFISH_PIC is not set
CONFIG_IPACK_BUS=y
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
CONFIG_RESET_BERLIN=y
CONFIG_RESET_HSDK=y
CONFIG_RESET_IMX7=y
CONFIG_RESET_LANTIQ=y
# CONFIG_RESET_LPC18XX is not set
CONFIG_RESET_MESON=y
CONFIG_RESET_MESON_AUDIO_ARB=y
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_STM32MP157 is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_USB3 is not set
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=y
# CONFIG_COMMON_RESET_HI6220 is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_XGENE is not set
# CONFIG_PHY_MESON8B_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB3 is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HISTB_COMBPHY=y
CONFIG_PHY_HISI_INNO_USB2=y
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
CONFIG_ARMADA375_USBCLUSTER_PHY=y
# CONFIG_PHY_MVEBU_CP110_COMPHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
CONFIG_PHY_ROCKCHIP_PCIE=y
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=y
# CONFIG_PHY_STM32_USBPHYC is not set
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_PHY_TUSB1210=y
CONFIG_POWERCAP=y
# CONFIG_IDLE_INJECT is not set
CONFIG_MCB=y
# CONFIG_MCB_LPC is not set
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_DAX=y
CONFIG_NVMEM=y
# CONFIG_NVMEM_IMX_IIM is not set
CONFIG_NVMEM_IMX_OCOTP=y
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_MTK_EFUSE=y
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_BCM_OCOTP=y
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y
CONFIG_MESON_MX_EFUSE=y
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_SC27XX_EFUSE is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_GTH is not set
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
CONFIG_INTEL_TH_DEBUG=y
# CONFIG_FPGA is not set
# CONFIG_FSI is not set
# CONFIG_TEE is not set
CONFIG_PM_OPP=y
CONFIG_SIOX=y
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
# CONFIG_LEGACY_ENERGY_MODEL_DT is not set
# CONFIG_PKGLIST is not set
CONFIG_INTERCONNECT=y

#
# File systems
#
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
CONFIG_QUOTA=y
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_FSCACHE=y
CONFIG_FSCACHE_DEBUG=y

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_CRAMFS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
CONFIG_PSTORE_RAM=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y

#
# Security options
#
CONFIG_KEYS=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_CHROMIUMOS_DEVICE_JAIL=y
CONFIG_SECURITY_CHROMIUMOS_READONLY_PROC_SELF_MEM=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
# CONFIG_CRYPTO_RSA is not set
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_WORKQUEUE=y
CONFIG_CRYPTO_CRYPTD=y
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128L is not set
# CONFIG_CRYPTO_AEGIS256 is not set
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4 is not set
# CONFIG_CRYPTO_TEA is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_X509_CERTIFICATE_PARSER is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
# CONFIG_CRC4 is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_DIRECT_OPS=y
CONFIG_DMA_NONCOHERENT_OPS=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_NONCOHERENT_CACHE_SYNC=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_SG_SPLIT=y
CONFIG_STACKDEPOT=y
CONFIG_PARMAN=y
CONFIG_STRING_SELFTEST=y
CONFIG_GENERIC_LIB_ASHLDI3=y
CONFIG_GENERIC_LIB_ASHRDI3=y
CONFIG_GENERIC_LIB_LSHRDI3=y
CONFIG_GENERIC_LIB_CMPDI2=y
CONFIG_GENERIC_LIB_UCMPDI2=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
CONFIG_PAGE_OWNER=y
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_POISONING=y
# CONFIG_PAGE_POISONING_NO_SANITY is not set
# CONFIG_PAGE_POISONING_ZERO is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_DEBUG_SLAB=y
# CONFIG_DEBUG_SLAB_LEAK is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=1
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PI_LIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_PM_NOTIFIER_ERROR_INJECT=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAIL_MMC_REQUEST=y
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
CONFIG_DMA_API_DEBUG=y
# CONFIG_DMA_API_DEBUG_SG is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_RBTREE_TEST=y
CONFIG_INTERVAL_TREE_TEST=y
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_TEST_STRING_HELPERS=y
CONFIG_TEST_KSTRTOX=y
CONFIG_TEST_PRINTF=y
CONFIG_TEST_BITMAP=y
# CONFIG_TEST_BITFIELD is not set
CONFIG_TEST_UUID=y
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
CONFIG_TEST_IDA=y
CONFIG_TEST_PARMAN=y
CONFIG_FIND_BIT_BENCHMARK=y
# CONFIG_TEST_FIRMWARE is not set
CONFIG_TEST_UDELAY=y
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_SERIAL_CONSOLE is not set
# CONFIG_KGDB_TESTS is not set
CONFIG_KGDB_LOW_LEVEL_TRAP=y
CONFIG_KGDB_KDB=y
CONFIG_KDB_DEFAULT_ENABLE=0x1
CONFIG_KDB_KEYBOARD=y
CONFIG_KDB_CONTINUE_CATASTROPHIC=0
# CONFIG_UBSAN is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_SPINLOCK_TEST=y
# CONFIG_SCACHE_DEBUGFS is not set

--To7QobAImH+yTowo--
