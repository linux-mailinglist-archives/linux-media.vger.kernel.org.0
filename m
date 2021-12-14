Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEDF473BEA
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 05:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbhLNEHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 23:07:12 -0500
Received: from mga03.intel.com ([134.134.136.65]:65296 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229669AbhLNEHM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 23:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639454832; x=1670990832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=idGga7JHsTTNGwOM4gkNNjAONgZTkfZEFF35dWQ/gXI=;
  b=jU+XqypT295RaxiZe6wfxJj5Bh9SCgVNvTKazv4LebDwofxjqNr46E8D
   MraxbiGvTiKNF0tktELuIQiAP/dInws5GLDMSHvyP9a/zs4H0MfAsQ08V
   RtPzu9sHOH02HMFezrjulmWvT3yqq3zTDf0hNLG7pYNbIFL0tWEA/0Xnc
   j6eRD7OJ9aRLKt/gTidghnx/Z94fAxLQteSqaDEIc5JmgXN7L9f/mrPzz
   LFZIYWqSj7+Bzny05cRoa29scaXgDs2zyyKftPvDBcygDCzGCI7Cmnqc5
   DjmRZiKYOTnr+MK81dtY48/TsBkbxEoovfcUZjmlDH6fFNCmTRF8g5c8Z
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238838881"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="238838881"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 20:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="754693591"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2021 20:07:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwz5o-0007QA-1K; Tue, 14 Dec 2021 04:07:08 +0000
Date:   Tue, 14 Dec 2021 12:06:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
Message-ID: <202112141239.xdqTNOOD-lkp@intel.com>
References: <20211213232849.40071-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-5-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20211214-073020
base:   git://linuxtv.org/media_tree.git master
config: i386-buildonly-randconfig-r003-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141239.xdqTNOOD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/627c8446267d301ed36953f7e4fa616ab6cb771a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Introduce-ancillary-links/20211214-073020
        git checkout 627c8446267d301ed36953f7e4fa616ab6cb771a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/mc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:1062:6: warning: no previous prototype for function 'media_remove_ancillary_link' [-Wmissing-prototypes]
   void media_remove_ancillary_link(struct media_link *link)
        ^
   drivers/media/mc/mc-entity.c:1062:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void media_remove_ancillary_link(struct media_link *link)
   ^
   static 
   drivers/media/mc/mc-entity.c:17:27: warning: unused function 'intf_type' [-Wunused-function]
   static inline const char *intf_type(struct media_interface *intf)
                             ^
   2 warnings generated.


vim +/media_remove_ancillary_link +1062 drivers/media/mc/mc-entity.c

  1061	
> 1062	void media_remove_ancillary_link(struct media_link *link)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
