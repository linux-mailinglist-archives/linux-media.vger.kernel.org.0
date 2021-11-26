Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECE245E714
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 06:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358583AbhKZFQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 00:16:30 -0500
Received: from mga05.intel.com ([192.55.52.43]:62765 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232562AbhKZFO3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 00:14:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="321843812"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="321843812"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 21:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="675442484"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2021 21:11:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqTVw-0007WF-D4; Fri, 26 Nov 2021 05:11:12 +0000
Date:   Fri, 26 Nov 2021 13:10:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com
Subject: Re: [PATCH v3 3/6] staging: media: wave5: Add the v4l2 layer
Message-ID: <202111261354.DVf9NPz7-lkp@intel.com>
References: <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110120910.12411-4-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

I love your patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Dafna-Hirschfeld/staging-media-wave5-add-wave5-codec-driver/20211110-201127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 8a893759d0075ea9556abcf86a4826d9865ba4bf
config: nios2-randconfig-s031-20211115 (https://download.01.org/0day-ci/archive/20211126/202111261354.DVf9NPz7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/2fcd7c429c9a940f0e22894189556dfda264f127
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dafna-Hirschfeld/staging-media-wave5-add-wave5-codec-driver/20211110-201127
        git checkout 2fcd7c429c9a940f0e22894189556dfda264f127
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/nvme/target/ drivers/staging/media/wave5/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/staging/media/wave5/wave5-hw.c: note: in included file (through drivers/staging/media/wave5/vpu.h):
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/staging/media/wave5/vpu.c: note: in included file (through drivers/staging/media/wave5/vpu.h):
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/staging/media/wave5/vpuapi.c: note: in included file:
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/staging/media/wave5/vdi.c: note: in included file (through drivers/staging/media/wave5/vpu.h):
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
--
   drivers/staging/media/wave5/vpu_enc.c: note: in included file (through drivers/staging/media/wave5/vpu.h):
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
   drivers/staging/media/wave5/vpu_enc.c: note: in included file:
>> drivers/staging/media/wave5/vpu.h:62:48: sparse: sparse: marked inline, but without a definition
>> drivers/staging/media/wave5/vpu.h:62:48: sparse: sparse: marked inline, but without a definition
--
   drivers/staging/media/wave5/vpu_dec.c: note: in included file (through drivers/staging/media/wave5/vpu.h):
>> drivers/staging/media/wave5/vpuapi.h:842:29: sparse: sparse: dubious one-bit signed bitfield
   drivers/staging/media/wave5/vpu_dec.c: note: in included file:
>> drivers/staging/media/wave5/vpu.h:62:48: sparse: sparse: marked inline, but without a definition
>> drivers/staging/media/wave5/vpu.h:62:48: sparse: sparse: marked inline, but without a definition

vim +62 drivers/staging/media/wave5/vpu.h

    57	
    58	int  wave5_vpu_dec_register_device(struct vpu_device *dev);
    59	void wave5_vpu_dec_unregister_device(struct vpu_device *dev);
    60	int  wave5_vpu_enc_register_device(struct vpu_device *dev);
    61	void wave5_vpu_enc_unregister_device(struct vpu_device *dev);
  > 62	inline bool wave5_vpu_both_queues_are_streaming(struct vpu_instance *inst);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
