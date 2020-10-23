Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8219E297807
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 22:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755273AbgJWUDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 16:03:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:8226 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754588AbgJWUDX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 16:03:23 -0400
IronPort-SDR: qDK20zKgB/8NZ/nlg9RdLgQmiAf3quRgIKM1xNCqo2yLnmaUDwZVaXhuTSXba+dR6RMRuQLXrV
 HiBMOGNGGdTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="231917127"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; 
   d="gz'50?scan'50,208,50";a="231917127"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 13:03:19 -0700
IronPort-SDR: YoSkAf/UrlCT4uSZtpV9KYP8d/ntRcGSkmL43qqEL2AyxcU3tmZTBqHgIAg8VbzsNz3gIZWART
 I4hf2hwZJdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; 
   d="gz'50?scan'50,208,50";a="349329070"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2020 13:03:13 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kW3HN-0000Ah-5Q; Fri, 23 Oct 2020 20:03:13 +0000
Date:   Sat, 24 Oct 2020 04:02:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 56/56] scrpits: kernel-doc: validate kernel-doc markup
 with the actual names
Message-ID: <202010240356.04GQOaBt-lkp@intel.com>
References: <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20201023]
[cannot apply to linuxtv-media/master sound/for-next pci/next mkp-scsi/for-next scsi/for-next linus/master v5.9 v5.9-rc8 v5.9-rc7 v5.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/Fix-several-bad-kernel-doc-markups/20201024-004025
base:    9695c4ff26459ff5bfe25c7d6179e4c9c00e1363
config: riscv-randconfig-r002-20201024 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 147b9497e79a98a8614b2b5eb4ba653b44f6b6f0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/002bbfc5a97ce37daf3c570e0edd28fa0c7de5b8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/Fix-several-bad-kernel-doc-markups/20201024-004025
        git checkout 002bbfc5a97ce37daf3c570e0edd28fa0c7de5b8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/analogbits/wrpll-cln28hpc.c:223: warning: expecting prototype for wrpll_configure(). Prototype was for wrpll_configure_for_rate() instead

vim +223 drivers/clk/analogbits/wrpll-cln28hpc.c

7b9487a9a5c41ce Paul Walmsley 2019-04-30  199  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  200  /**
7b9487a9a5c41ce Paul Walmsley 2019-04-30  201   * wrpll_configure() - compute PLL configuration for a target rate
7b9487a9a5c41ce Paul Walmsley 2019-04-30  202   * @c: ptr to a struct wrpll_cfg record to write into
7b9487a9a5c41ce Paul Walmsley 2019-04-30  203   * @target_rate: target PLL output clock rate (post-Q-divider)
7b9487a9a5c41ce Paul Walmsley 2019-04-30  204   * @parent_rate: PLL input refclk rate (pre-R-divider)
7b9487a9a5c41ce Paul Walmsley 2019-04-30  205   *
7b9487a9a5c41ce Paul Walmsley 2019-04-30  206   * Compute the appropriate PLL signal configuration values and store
7b9487a9a5c41ce Paul Walmsley 2019-04-30  207   * in PLL context @c.  PLL reprogramming is not glitchless, so the
7b9487a9a5c41ce Paul Walmsley 2019-04-30  208   * caller should switch any downstream logic to a different clock
7b9487a9a5c41ce Paul Walmsley 2019-04-30  209   * source or clock-gate it before presenting these values to the PLL
7b9487a9a5c41ce Paul Walmsley 2019-04-30  210   * configuration signals.
7b9487a9a5c41ce Paul Walmsley 2019-04-30  211   *
7b9487a9a5c41ce Paul Walmsley 2019-04-30  212   * The caller must pass this function a pre-initialized struct
7b9487a9a5c41ce Paul Walmsley 2019-04-30  213   * wrpll_cfg record: either initialized to zero (with the
7b9487a9a5c41ce Paul Walmsley 2019-04-30  214   * exception of the .name and .flags fields) or read from the PLL.
7b9487a9a5c41ce Paul Walmsley 2019-04-30  215   *
7b9487a9a5c41ce Paul Walmsley 2019-04-30  216   * Context: Any context.  Caller must protect the memory pointed to by @c
7b9487a9a5c41ce Paul Walmsley 2019-04-30  217   *          from simultaneous access or modification.
7b9487a9a5c41ce Paul Walmsley 2019-04-30  218   *
7b9487a9a5c41ce Paul Walmsley 2019-04-30  219   * Return: 0 upon success; anything else upon failure.
7b9487a9a5c41ce Paul Walmsley 2019-04-30  220   */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  221  int wrpll_configure_for_rate(struct wrpll_cfg *c, u32 target_rate,
7b9487a9a5c41ce Paul Walmsley 2019-04-30  222  			     unsigned long parent_rate)
7b9487a9a5c41ce Paul Walmsley 2019-04-30 @223  {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  224  	unsigned long ratio;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  225  	u64 target_vco_rate, delta, best_delta, f_pre_div, vco, vco_pre;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  226  	u32 best_f, f, post_divr_freq;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  227  	u8 fbdiv, divq, best_r, r;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  228  	int range;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  229  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  230  	if (c->flags == 0) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  231  		WARN(1, "%s called with uninitialized PLL config", __func__);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  232  		return -EINVAL;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  233  	}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  234  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  235  	/* Initialize rounding data if it hasn't been initialized already */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  236  	if (parent_rate != c->parent_rate) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  237  		if (__wrpll_update_parent_rate(c, parent_rate)) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  238  			pr_err("%s: PLL input rate is out of range\n",
7b9487a9a5c41ce Paul Walmsley 2019-04-30  239  			       __func__);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  240  			return -ERANGE;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  241  		}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  242  	}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  243  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  244  	c->flags &= ~WRPLL_FLAGS_RESET_MASK;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  245  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  246  	/* Put the PLL into bypass if the user requests the parent clock rate */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  247  	if (target_rate == parent_rate) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  248  		c->flags |= WRPLL_FLAGS_BYPASS_MASK;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  249  		return 0;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  250  	}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  251  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  252  	c->flags &= ~WRPLL_FLAGS_BYPASS_MASK;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  253  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  254  	/* Calculate the Q shift and target VCO rate */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  255  	divq = __wrpll_calc_divq(target_rate, &target_vco_rate);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  256  	if (!divq)
7b9487a9a5c41ce Paul Walmsley 2019-04-30  257  		return -1;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  258  	c->divq = divq;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  259  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  260  	/* Precalculate the pre-Q divider target ratio */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  261  	ratio = div64_u64((target_vco_rate << ROUND_SHIFT), parent_rate);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  262  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  263  	fbdiv = __wrpll_calc_fbdiv(c);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  264  	best_r = 0;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  265  	best_f = 0;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  266  	best_delta = MAX_VCO_FREQ;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  267  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  268  	/*
7b9487a9a5c41ce Paul Walmsley 2019-04-30  269  	 * Consider all values for R which land within
7b9487a9a5c41ce Paul Walmsley 2019-04-30  270  	 * [MIN_POST_DIVR_FREQ, MAX_POST_DIVR_FREQ]; prefer smaller R
7b9487a9a5c41ce Paul Walmsley 2019-04-30  271  	 */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  272  	for (r = c->init_r; r <= c->max_r; ++r) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  273  		f_pre_div = ratio * r;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  274  		f = (f_pre_div + (1 << ROUND_SHIFT)) >> ROUND_SHIFT;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  275  		f >>= (fbdiv - 1);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  276  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  277  		post_divr_freq = div_u64(parent_rate, r);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  278  		vco_pre = fbdiv * post_divr_freq;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  279  		vco = vco_pre * f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  280  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  281  		/* Ensure rounding didn't take us out of range */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  282  		if (vco > target_vco_rate) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  283  			--f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  284  			vco = vco_pre * f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  285  		} else if (vco < MIN_VCO_FREQ) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  286  			++f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  287  			vco = vco_pre * f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  288  		}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  289  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  290  		delta = abs(target_rate - vco);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  291  		if (delta < best_delta) {
7b9487a9a5c41ce Paul Walmsley 2019-04-30  292  			best_delta = delta;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  293  			best_r = r;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  294  			best_f = f;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  295  		}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  296  	}
7b9487a9a5c41ce Paul Walmsley 2019-04-30  297  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  298  	c->divr = best_r - 1;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  299  	c->divf = best_f - 1;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  300  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  301  	post_divr_freq = div_u64(parent_rate, best_r);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  302  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  303  	/* Pick the best PLL jitter filter */
7b9487a9a5c41ce Paul Walmsley 2019-04-30  304  	range = __wrpll_calc_filter_range(post_divr_freq);
7b9487a9a5c41ce Paul Walmsley 2019-04-30  305  	if (range < 0)
7b9487a9a5c41ce Paul Walmsley 2019-04-30  306  		return range;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  307  	c->range = range;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  308  
7b9487a9a5c41ce Paul Walmsley 2019-04-30  309  	return 0;
7b9487a9a5c41ce Paul Walmsley 2019-04-30  310  }
7b9487a9a5c41ce Paul Walmsley 2019-04-30  311  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--envbJBWh7q8WU6mo
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
83tSJzNrclHqRCk5cuf2D/hOHYtQkAEA

--envbJBWh7q8WU6mo--
