Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D2F1B234A
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 11:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgDUJwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 05:52:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:34244 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbgDUJws (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 05:52:48 -0400
IronPort-SDR: XWLyCYgwCrXiv7H4WYoRWZY9vlms/tIu0Cvs5Nn4ST54o9igVcwa33JiAz1iPh3hTVUwdZv6d9
 gaVi4fWOk09g==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 02:52:44 -0700
IronPort-SDR: 81k67NkdKKT3Bt/1+Qo5g0IZs9R0Bzf7ywdOmPCUTwQUYvwbuVuZmENYv2YbGBt5HbWNDbSZVy
 gAVBGEWGlCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; 
   d="gz'50?scan'50,208,50";a="247132714"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2020 02:52:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jQpa3-000AmO-ML; Tue, 21 Apr 2020 17:52:39 +0800
Date:   Tue, 21 Apr 2020 17:52:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tejun Heo <tj@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] kbuild: Set CLANG_VERSION only when Clang is used
Message-ID: <202004211757.rLRWoxrI%lkp@intel.com>
References: <20200419123612.173187-1-sedat.dilek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20200419123612.173187-1-sedat.dilek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sedat,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kbuild/for-next]
[also build test ERROR on jeyu/modules-next linus/master v5.7-rc2 next-20200420]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sedat-Dilek/kbuild-Set-CLANG_VERSION-only-when-Clang-is-used/20200421-110637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: mips-fuloong2e_defconfig (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/cpu_pm.h:12,
                    from arch/mips/mm/c-r4k.c:10:
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16':
>> arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
>> arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
>> arch/mips/include/asm/r4kcache.h:219:4: note: in expansion of macro 'cache_unroll'
     219 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:250:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     250 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/unroll.h:29:9: note: each undeclared identifier is reported only once for each function it appears in
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
>> arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
>> arch/mips/include/asm/r4kcache.h:219:4: note: in expansion of macro 'cache_unroll'
     219 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:250:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     250 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16_page':
>> arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
>> arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:229:3: note: in expansion of macro 'cache_unroll'
     229 |   cache_unroll(32, kernel_cache, hitop, start, lsize); \
         |   ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:250:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     250 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16_page_indexed':
>> arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
>> arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:246:4: note: in expansion of macro 'cache_unroll'
     246 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:250:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     250 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16':
>> arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
>> arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:219:4: note: in expansion of macro 'cache_unroll'
     219 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:251:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     251 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16_page':
   arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:229:3: note: in expansion of macro 'cache_unroll'
     229 |   cache_unroll(32, kernel_cache, hitop, start, lsize); \
         |   ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:251:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     251 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16_page_indexed':
   arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:246:4: note: in expansion of macro 'cache_unroll'
     246 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:251:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     251 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_scache16':
   arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/unroll.h:28:2: note: in expansion of macro 'BUILD_BUG_ON'
      28 |  BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||  \
         |  ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:203:2: note: in expansion of macro 'unroll'
     203 |  unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize))); \
         |  ^~~~~~
   arch/mips/include/asm/r4kcache.h:219:4: note: in expansion of macro 'cache_unroll'
     219 |    cache_unroll(32, kernel_cache, indexop,  \
         |    ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:252:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     252 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_scache16_page':
   arch/mips/include/asm/unroll.h:29:9: error: 'CONFIG_CLANG_VERSION' undeclared (first use in this function); did you mean 'CONFIG_LD_VERSION'?
      29 |         CONFIG_CLANG_VERSION >= 80000) &&  \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
     330 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'

vim +29 arch/mips/include/asm/unroll.h

6baaeadae911ba9 Paul Burton       2019-10-08   4  
6baaeadae911ba9 Paul Burton       2019-10-08   5  /*
6baaeadae911ba9 Paul Burton       2019-10-08   6   * Explicitly unroll a loop, for use in cases where doing so is performance
6baaeadae911ba9 Paul Burton       2019-10-08   7   * critical.
6baaeadae911ba9 Paul Burton       2019-10-08   8   *
6baaeadae911ba9 Paul Burton       2019-10-08   9   * Ideally we'd rely upon the compiler to provide this but there's no commonly
6baaeadae911ba9 Paul Burton       2019-10-08  10   * available means to do so. For example GCC's "#pragma GCC unroll"
6baaeadae911ba9 Paul Burton       2019-10-08  11   * functionality would be ideal but is only available from GCC 8 onwards. Using
6baaeadae911ba9 Paul Burton       2019-10-08  12   * -funroll-loops is an option but GCC tends to make poor choices when
6baaeadae911ba9 Paul Burton       2019-10-08  13   * compiling our string functions. -funroll-all-loops leads to massive code
6baaeadae911ba9 Paul Burton       2019-10-08  14   * bloat, even if only applied to the string functions.
6baaeadae911ba9 Paul Burton       2019-10-08  15   */
6baaeadae911ba9 Paul Burton       2019-10-08  16  #define unroll(times, fn, ...) do {				\
6baaeadae911ba9 Paul Burton       2019-10-08  17  	extern void bad_unroll(void)				\
6baaeadae911ba9 Paul Burton       2019-10-08  18  		__compiletime_error("Unsupported unroll");	\
6baaeadae911ba9 Paul Burton       2019-10-08  19  								\
6baaeadae911ba9 Paul Burton       2019-10-08  20  	/*							\
6baaeadae911ba9 Paul Burton       2019-10-08  21  	 * We can't unroll if the number of iterations isn't	\
6baaeadae911ba9 Paul Burton       2019-10-08  22  	 * compile-time constant. Unfortunately GCC versions	\
6baaeadae911ba9 Paul Burton       2019-10-08  23  	 * up until 4.6 tend to miss obvious constants & cause	\
6baaeadae911ba9 Paul Burton       2019-10-08  24  	 * this check to fail, even though they go on to	\
6baaeadae911ba9 Paul Burton       2019-10-08  25  	 * generate reasonable code for the switch statement,	\
6baaeadae911ba9 Paul Burton       2019-10-08  26  	 * so we skip the sanity check for those compilers.	\
6baaeadae911ba9 Paul Burton       2019-10-08  27  	 */							\
df3da04880b45b0 Nathan Chancellor 2019-10-10 @28  	BUILD_BUG_ON((CONFIG_GCC_VERSION >= 40700 ||		\
df3da04880b45b0 Nathan Chancellor 2019-10-10 @29  		      CONFIG_CLANG_VERSION >= 80000) &&		\
6baaeadae911ba9 Paul Burton       2019-10-08  30  		     !__builtin_constant_p(times));		\
6baaeadae911ba9 Paul Burton       2019-10-08  31  								\
6baaeadae911ba9 Paul Burton       2019-10-08  32  	switch (times) {					\
6baaeadae911ba9 Paul Burton       2019-10-08  33  	case 32: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  34  	case 31: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  35  	case 30: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  36  	case 29: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  37  	case 28: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  38  	case 27: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  39  	case 26: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  40  	case 25: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  41  	case 24: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  42  	case 23: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  43  	case 22: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  44  	case 21: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  45  	case 20: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  46  	case 19: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  47  	case 18: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  48  	case 17: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  49  	case 16: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  50  	case 15: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  51  	case 14: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  52  	case 13: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  53  	case 12: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  54  	case 11: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  55  	case 10: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  56  	case 9: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  57  	case 8: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  58  	case 7: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  59  	case 6: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  60  	case 5: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  61  	case 4: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  62  	case 3: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  63  	case 2: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  64  	case 1: fn(__VA_ARGS__); /* fall through */		\
6baaeadae911ba9 Paul Burton       2019-10-08  65  	case 0: break;						\
6baaeadae911ba9 Paul Burton       2019-10-08  66  								\
6baaeadae911ba9 Paul Burton       2019-10-08  67  	default:						\
6baaeadae911ba9 Paul Burton       2019-10-08  68  		/*						\
6baaeadae911ba9 Paul Burton       2019-10-08  69  		 * Either the iteration count is unreasonable	\
6baaeadae911ba9 Paul Burton       2019-10-08  70  		 * or we need to add more cases above.		\
6baaeadae911ba9 Paul Burton       2019-10-08  71  		 */						\
6baaeadae911ba9 Paul Burton       2019-10-08  72  		bad_unroll();					\
6baaeadae911ba9 Paul Burton       2019-10-08  73  		break;						\
6baaeadae911ba9 Paul Burton       2019-10-08  74  	}							\
6baaeadae911ba9 Paul Burton       2019-10-08  75  } while (0)
6baaeadae911ba9 Paul Burton       2019-10-08  76  

:::::: The code at line 29 was first introduced by commit
:::::: df3da04880b45b059b8b064c2dd67289a793109e mips: Fix unroll macro when building with Clang

:::::: TO: Nathan Chancellor <natechancellor@gmail.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--zYM0uCDKw75PZbzx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Xi0RFYFgqhcaFe6rq/5yRPIbDqXfovxAAQA=

--zYM0uCDKw75PZbzx--
