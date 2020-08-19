Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2830324A4BA
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 19:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgHSROn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 13:14:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:59322 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgHSROb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 13:14:31 -0400
IronPort-SDR: 9d8RIdjTEbL0fQ/CXjh2wAWyIFOe6CVioLW728TE855KnKe+bE5ARHqfhnV67gViIrZgm5cZRw
 YcIQF+BDDGMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="142790823"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="gz'50?scan'50,208,50";a="142790823"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 10:14:30 -0700
IronPort-SDR: ieGdFWC5l60qaNPQAAT+A5czmLipddawxL22tTEfAX9Q7QgPxh0K5qi/wfbB2qj3f9bXxeB0ik
 owF9eg7htM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="gz'50?scan'50,208,50";a="334741712"
Received: from lkp-server01.sh.intel.com (HELO 4cedd236b688) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2020 10:14:27 -0700
Received: from kbuild by 4cedd236b688 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8RfO-0000O4-FZ; Wed, 19 Aug 2020 17:14:26 +0000
Date:   Thu, 20 Aug 2020 01:14:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Subject: Re: [PATCH v5 2/2] mm: add a field to store names for private
 anonymous memory
Message-ID: <202008200159.CjwHBHM6%lkp@intel.com>
References: <20200819141650.7462-3-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20200819141650.7462-3-sumit.semwal@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sumit,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.9-rc1]
[cannot apply to hnaz-linux-mm/master linux/master next-20200819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sumit-Semwal/Anonymous-VMA-naming-patches/20200819-222011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 18445bf405cb331117bc98427b1ba6f12418ad17
config: nds32-allnoconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nds32le-linux-ld: kernel/sys.o: in function `__se_sys_prctl':
>> sys.c:(.text+0x16a6): undefined reference to `madvise_set_anon_name'
>> nds32le-linux-ld: sys.c:(.text+0x16aa): undefined reference to `madvise_set_anon_name'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--1yeeQ81UyVL57Vl7
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--1yeeQ81UyVL57Vl7--
