Return-Path: <linux-media+bounces-1691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E6805E9A
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 20:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25091F21723
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 19:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60F6675C7;
	Tue,  5 Dec 2023 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdlEnrtH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EF1196
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 11:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701804289; x=1733340289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cfJFzkpdgsUS4rTefh4CKUvyIi5q0MhTzFVZ3xXG3YY=;
  b=mdlEnrtHN9zFIezHE5F8a7d4d9xMGyM/Xi3+D6DMf7Zx2itcairSkidt
   IgBaMkrFRcRY+7Xzb3dgghmFckb8UUo/M8qi0HyaL94yPnosd+NiuS2tX
   rwTmMXMG3YcLy9KV0nvwOwIJHR2LN91D6z0BWz30TxEU4POmbifR4TTVd
   E20HLD+zoBRZmsVeaWszG9YoM2uSjSmtiBwBpFeRoXKp7i1bdm297Rok2
   6PInh9ZJS3EPkbZdcp4fEYHXDGIJAYPurqNvz4mUNEPP2wKdWi1GnqqLf
   alzPtpbr/LgulVq4HgUYEmr2ugfJObTKjKcuU/lWkFzoM+9VUIEOAugGt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15497074"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="15497074"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720822558"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="720822558"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 11:24:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAb2A-0009bj-2s;
	Tue, 05 Dec 2023 19:24:42 +0000
Date: Wed, 6 Dec 2023 03:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/3] media: i2c: imx415: Convert to new CCI register
 access helpers
Message-ID: <202312060301.eWnbiFAk-lkp@intel.com>
References: <20231205090557.298680-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205090557.298680-2-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master linus/master v6.7-rc4 next-20231205]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/media-i2c-imx415-Convert-to-new-CCI-register-access-helpers/20231205-170736
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231205090557.298680-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/3] media: i2c: imx415: Convert to new CCI register access helpers
config: arm-randconfig-002-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060301.eWnbiFAk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060301.eWnbiFAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060301.eWnbiFAk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx415.c:119:16: error: call to undeclared function 'CCI_REG16_LE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   .regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
                                ^
   drivers/media/i2c/imx415.c:41:30: note: expanded from macro 'IMX415_BCWAIT_TIME'
   #define IMX415_BCWAIT_TIME        CCI_REG16_LE(0x3008)
                                     ^
   drivers/media/i2c/imx415.c:119:16: error: initializer element is not a compile-time constant
                   .regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
                                ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:41:30: note: expanded from macro 'IMX415_BCWAIT_TIME'
   #define IMX415_BCWAIT_TIME        CCI_REG16_LE(0x3008)
                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx415.c:195:4: error: call to undeclared function 'CCI_REG24_LE'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           { IMX415_VMAX, 0x08CA },
             ^
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^
   drivers/media/i2c/imx415.c:195:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:211:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:227:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/CCI_REG16_LE +119 drivers/media/i2c/imx415.c

14cd15e7a1e2a3 Gerald Loacker  2023-01-30   31  
a13751ef748a7a Alexander Stein 2023-12-05   32  #define IMX415_MODE		  CCI_REG8(0x3000)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   33  #define IMX415_MODE_OPERATING	  (0)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   34  #define IMX415_MODE_STANDBY	  BIT(0)
a13751ef748a7a Alexander Stein 2023-12-05   35  #define IMX415_REGHOLD		  CCI_REG8(0x3001)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   36  #define IMX415_REGHOLD_INVALID	  (0)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   37  #define IMX415_REGHOLD_VALID	  BIT(0)
a13751ef748a7a Alexander Stein 2023-12-05   38  #define IMX415_XMSTA		  CCI_REG8(0x3002)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   39  #define IMX415_XMSTA_START	  (0)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   40  #define IMX415_XMSTA_STOP	  BIT(0)
a13751ef748a7a Alexander Stein 2023-12-05  @41  #define IMX415_BCWAIT_TIME	  CCI_REG16_LE(0x3008)
a13751ef748a7a Alexander Stein 2023-12-05   42  #define IMX415_CPWAIT_TIME	  CCI_REG16_LE(0x300A)
a13751ef748a7a Alexander Stein 2023-12-05   43  #define IMX415_WINMODE		  CCI_REG8(0x301C)
a13751ef748a7a Alexander Stein 2023-12-05   44  #define IMX415_ADDMODE		  CCI_REG8(0x3022)
a13751ef748a7a Alexander Stein 2023-12-05   45  #define IMX415_REVERSE		  CCI_REG8(0x3030)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   46  #define IMX415_HREVERSE_SHIFT	  (0)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   47  #define IMX415_VREVERSE_SHIFT	  BIT(0)
a13751ef748a7a Alexander Stein 2023-12-05   48  #define IMX415_ADBIT		  CCI_REG8(0x3031)
a13751ef748a7a Alexander Stein 2023-12-05   49  #define IMX415_MDBIT		  CCI_REG8(0x3032)
a13751ef748a7a Alexander Stein 2023-12-05   50  #define IMX415_SYS_MODE		  CCI_REG8(0x3033)
a13751ef748a7a Alexander Stein 2023-12-05   51  #define IMX415_OUTSEL		  CCI_REG8(0x30C0)
a13751ef748a7a Alexander Stein 2023-12-05   52  #define IMX415_DRV		  CCI_REG8(0x30C1)
a13751ef748a7a Alexander Stein 2023-12-05   53  #define IMX415_VMAX		  CCI_REG24_LE(0x3024)
a13751ef748a7a Alexander Stein 2023-12-05   54  #define IMX415_HMAX		  CCI_REG16_LE(0x3028)
a13751ef748a7a Alexander Stein 2023-12-05   55  #define IMX415_SHR0		  CCI_REG24_LE(0x3050)
a13751ef748a7a Alexander Stein 2023-12-05   56  #define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   57  #define IMX415_AGAIN_MIN	  0
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   58  #define IMX415_AGAIN_MAX	  100
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   59  #define IMX415_AGAIN_STEP	  1
a13751ef748a7a Alexander Stein 2023-12-05   60  #define IMX415_BLKLEVEL		  CCI_REG16_LE(0x30E2)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   61  #define IMX415_BLKLEVEL_DEFAULT	  50
a13751ef748a7a Alexander Stein 2023-12-05   62  #define IMX415_TPG_EN_DUOUT	  CCI_REG8(0x30E4)
a13751ef748a7a Alexander Stein 2023-12-05   63  #define IMX415_TPG_PATSEL_DUOUT	  CCI_REG8(0x30E6)
a13751ef748a7a Alexander Stein 2023-12-05   64  #define IMX415_TPG_COLORWIDTH	  CCI_REG8(0x30E8)
a13751ef748a7a Alexander Stein 2023-12-05   65  #define IMX415_TESTCLKEN_MIPI	  CCI_REG8(0x3110)
a13751ef748a7a Alexander Stein 2023-12-05   66  #define IMX415_INCKSEL1		  CCI_REG8(0x3115)
a13751ef748a7a Alexander Stein 2023-12-05   67  #define IMX415_INCKSEL2		  CCI_REG8(0x3116)
a13751ef748a7a Alexander Stein 2023-12-05   68  #define IMX415_INCKSEL3		  CCI_REG16_LE(0x3118)
a13751ef748a7a Alexander Stein 2023-12-05   69  #define IMX415_INCKSEL4		  CCI_REG16_LE(0x311A)
a13751ef748a7a Alexander Stein 2023-12-05   70  #define IMX415_INCKSEL5		  CCI_REG8(0x311E)
a13751ef748a7a Alexander Stein 2023-12-05   71  #define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32C8)
a13751ef748a7a Alexander Stein 2023-12-05   72  #define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
a13751ef748a7a Alexander Stein 2023-12-05   73  #define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3F12)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   74  #define IMX415_SENSOR_INFO_MASK	  0xFFF
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   75  #define IMX415_CHIP_ID		  0x514
a13751ef748a7a Alexander Stein 2023-12-05   76  #define IMX415_LANEMODE		  CCI_REG16_LE(0x4001)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   77  #define IMX415_LANEMODE_2	  1
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   78  #define IMX415_LANEMODE_4	  3
a13751ef748a7a Alexander Stein 2023-12-05   79  #define IMX415_TXCLKESC_FREQ	  CCI_REG16_LE(0x4004)
a13751ef748a7a Alexander Stein 2023-12-05   80  #define IMX415_INCKSEL6		  CCI_REG8(0x400C)
a13751ef748a7a Alexander Stein 2023-12-05   81  #define IMX415_TCLKPOST		  CCI_REG16_LE(0x4018)
a13751ef748a7a Alexander Stein 2023-12-05   82  #define IMX415_TCLKPREPARE	  CCI_REG16_LE(0x401A)
a13751ef748a7a Alexander Stein 2023-12-05   83  #define IMX415_TCLKTRAIL	  CCI_REG16_LE(0x401C)
a13751ef748a7a Alexander Stein 2023-12-05   84  #define IMX415_TCLKZERO		  CCI_REG16_LE(0x401E)
a13751ef748a7a Alexander Stein 2023-12-05   85  #define IMX415_THSPREPARE	  CCI_REG16_LE(0x4020)
a13751ef748a7a Alexander Stein 2023-12-05   86  #define IMX415_THSZERO		  CCI_REG16_LE(0x4022)
a13751ef748a7a Alexander Stein 2023-12-05   87  #define IMX415_THSTRAIL		  CCI_REG16_LE(0x4024)
a13751ef748a7a Alexander Stein 2023-12-05   88  #define IMX415_THSEXIT		  CCI_REG16_LE(0x4026)
a13751ef748a7a Alexander Stein 2023-12-05   89  #define IMX415_TLPX		  CCI_REG16_LE(0x4028)
a13751ef748a7a Alexander Stein 2023-12-05   90  #define IMX415_INCKSEL7		  CCI_REG8(0x4074)
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   91  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   92  static const char *const imx415_supply_names[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   93  	"dvdd",
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   94  	"ovdd",
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   95  	"avdd",
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   96  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   97  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   98  /*
14cd15e7a1e2a3 Gerald Loacker  2023-01-30   99   * The IMX415 data sheet uses lane rates but v4l2 uses link frequency to
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  100   * describe MIPI CSI-2 speed. This driver uses lane rates wherever possible
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  101   * and converts them to link frequencies by a factor of two when needed.
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  102   */
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  103  static const s64 link_freq_menu_items[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  104  	594000000 / 2,	720000000 / 2,	891000000 / 2,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  105  	1440000000 / 2, 1485000000 / 2,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  106  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  107  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  108  struct imx415_clk_params {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  109  	u64 lane_rate;
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  110  	u64 inck;
a13751ef748a7a Alexander Stein 2023-12-05  111  	struct cci_reg_sequence regs[IMX415_NUM_CLK_PARAM_REGS];
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  112  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  113  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  114  /* INCK Settings - includes all lane rate and INCK dependent registers */
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  115  static const struct imx415_clk_params imx415_clk_params[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  116  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  117  		.lane_rate = 594000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  118  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30 @119  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  120  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  121  		.regs[2] = { IMX415_SYS_MODE, 0x7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  122  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  123  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  124  		.regs[5] = { IMX415_INCKSEL3, 0x084 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  125  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  126  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  127  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  128  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  129  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  130  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  131  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  132  		.lane_rate = 720000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  133  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  134  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  135  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  136  		.regs[2] = { IMX415_SYS_MODE, 0x9 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  137  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  138  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  139  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  140  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  141  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  142  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  143  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  144  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  145  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  146  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  147  		.lane_rate = 891000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  148  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  149  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  150  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  151  		.regs[2] = { IMX415_SYS_MODE, 0x5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  152  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  153  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  154  		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  155  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  156  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  157  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  158  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  159  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  160  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  161  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  162  		.lane_rate = 1440000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  163  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  164  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  165  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  166  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  167  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  168  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  169  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  170  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  171  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  172  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  173  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  174  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  175  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  176  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  177  		.lane_rate = 1485000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  178  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  179  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  180  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  181  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  182  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  183  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  184  		.regs[5] = { IMX415_INCKSEL3, 0x0A5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  185  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  186  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  187  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  188  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  189  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  190  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  191  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  192  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  193  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
a13751ef748a7a Alexander Stein 2023-12-05  194  static const struct cci_reg_sequence imx415_mode_2_720[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30 @195  	{ IMX415_VMAX, 0x08CA },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  196  	{ IMX415_HMAX, 0x07F0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  197  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  198  	{ IMX415_TCLKPOST, 0x006F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  199  	{ IMX415_TCLKPREPARE, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  200  	{ IMX415_TCLKTRAIL, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  201  	{ IMX415_TCLKZERO, 0x00BF },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  202  	{ IMX415_THSPREPARE, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  203  	{ IMX415_THSZERO, 0x0057 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  204  	{ IMX415_THSTRAIL, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  205  	{ IMX415_THSEXIT, 0x004F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  206  	{ IMX415_TLPX, 0x0027 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  207  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

