Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A78474A22
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 18:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236773AbhLNRzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 12:55:18 -0500
Received: from mga06.intel.com ([134.134.136.31]:20137 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231778AbhLNRzS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 12:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639504518; x=1671040518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWKd4c6pmpkfVy6aW9VcSytG8AoS/c/lxqMSaRM5+2I=;
  b=K82tV1FMJniG0iMSBnWDQPF+8MQunVRZfZlAWH7SxHg4xRnyDtqAQhYH
   79+cJqudljiuaM7TCPw5crQapgQ0jCcbHYOVC2D1pC0X6giPZsZjdbUwy
   WPqAONJkfOzi2RT9+bPkTRNwDSp8csqnOIum4Zt4tvMc7wlY2xJLhUT2I
   +xfE7PtdaWmmnZ7y9iArJ6jbg89+z6m2qprJBs9o2/hZb7wOLoE21aNYI
   +RTz7uSO8e/ASpPR7hQrdSZjgGbViQ/gR91Kcm2Dry1fKLad9kPKjycOb
   5QMqOx0wn1nMm7Xp3pLALtYZgMR2HpE/QWEXsJp+hzhOYoM4V3OD3r5Us
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299816336"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="299816336"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 09:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="614373532"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2021 09:55:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxC1C-0000aq-Ro; Tue, 14 Dec 2021 17:55:14 +0000
Date:   Wed, 15 Dec 2021 01:54:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 1566/1981] fs/pstore/zone.c:39:
 warning: expecting prototype for struct psz_head. Prototype was for struct
 psz_buffer instead
Message-ID: <202112150136.7UyCfGsC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: d3328cb2dd0a2fb94a09587105c37299e296d4c6 [1566/1981] scripts: kernel-doc: validate kernel-doc markup with the actual names
config: x86_64-randconfig-a011-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150136.7UyCfGsC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/d3328cb2dd0a2fb94a09587105c37299e296d4c6
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout d3328cb2dd0a2fb94a09587105c37299e296d4c6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/pstore/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/pstore/zone.c:39: warning: expecting prototype for struct psz_head. Prototype was for struct psz_buffer instead


vim +39 fs/pstore/zone.c

d26c3321fe18dc WeiXiong Liao 2020-03-25  24  
d26c3321fe18dc WeiXiong Liao 2020-03-25  25  /**
d26c3321fe18dc WeiXiong Liao 2020-03-25  26   * struct psz_head - header of zone to flush to storage
d26c3321fe18dc WeiXiong Liao 2020-03-25  27   *
d26c3321fe18dc WeiXiong Liao 2020-03-25  28   * @sig: signature to indicate header (PSZ_SIG xor PSZONE-type value)
d26c3321fe18dc WeiXiong Liao 2020-03-25  29   * @datalen: length of data in @data
0dc068265a1c59 WeiXiong Liao 2020-03-25  30   * @start: offset into @data where the beginning of the stored bytes begin
d26c3321fe18dc WeiXiong Liao 2020-03-25  31   * @data: zone data.
d26c3321fe18dc WeiXiong Liao 2020-03-25  32   */
d26c3321fe18dc WeiXiong Liao 2020-03-25  33  struct psz_buffer {
d26c3321fe18dc WeiXiong Liao 2020-03-25  34  #define PSZ_SIG (0x43474244) /* DBGC */
d26c3321fe18dc WeiXiong Liao 2020-03-25  35  	uint32_t sig;
d26c3321fe18dc WeiXiong Liao 2020-03-25  36  	atomic_t datalen;
0dc068265a1c59 WeiXiong Liao 2020-03-25  37  	atomic_t start;
d26c3321fe18dc WeiXiong Liao 2020-03-25  38  	uint8_t data[];
d26c3321fe18dc WeiXiong Liao 2020-03-25 @39  };
d26c3321fe18dc WeiXiong Liao 2020-03-25  40  

:::::: The code at line 39 was first introduced by commit
:::::: d26c3321fe18dc74517dc1f518d584aa33b0a851 pstore/zone: Introduce common layer to manage storage zones

:::::: TO: WeiXiong Liao <liaoweixiong@allwinnertech.com>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
