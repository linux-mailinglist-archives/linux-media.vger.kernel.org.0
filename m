Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5CE2E3118
	for <lists+linux-media@lfdr.de>; Sun, 27 Dec 2020 13:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgL0M2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Dec 2020 07:28:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:27503 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgL0M2C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Dec 2020 07:28:02 -0500
IronPort-SDR: Pq8ozymev6N5DW89KSphOxA5d0SSmmOU8GEo8TAvGoEu1Dcl1AuhvZmQS3tAlMvoLzgYDBJ7XS
 xcQqj3E0EqbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9846"; a="194777604"
X-IronPort-AV: E=Sophos;i="5.78,452,1599548400"; 
   d="gz'50?scan'50,208,50";a="194777604"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2020 04:27:21 -0800
IronPort-SDR: iLWopVvrSqaW+FVw/4V6SDK0RktLTMqt+fWSqJz78rsJ47GDykRTzE1Y62Y5IOYyZZ2NGnzn0L
 WWNJyDt9xKAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,452,1599548400"; 
   d="gz'50?scan'50,208,50";a="375275038"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Dec 2020 04:27:18 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ktV8o-0002ON-B7; Sun, 27 Dec 2020 12:27:18 +0000
Date:   Sun, 27 Dec 2020 20:26:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6:
 warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_init'
Message-ID: <202012272017.JN2TVG20-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f838f8d2b694cf9d524dc4423e9dd2db13892f3f
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   7 months ago
config: x86_64-randconfig-a003-20201222 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project cee1e7d14f4628d6174b33640d502bff3b54ae45)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5b552b198c2557295becd471bff53bb520fefee5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6: warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_init' [-Wmissing-prototypes]
   void ia_css_isys_ibuf_rmgr_init(void)
        ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ia_css_isys_ibuf_rmgr_init(void)
   ^
   static 
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:6: warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_uninit' [-Wmissing-prototypes]
   void ia_css_isys_ibuf_rmgr_uninit(void)
        ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ia_css_isys_ibuf_rmgr_uninit(void)
   ^
   static 
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:6: warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_acquire' [-Wmissing-prototypes]
   bool ia_css_isys_ibuf_rmgr_acquire(
        ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool ia_css_isys_ibuf_rmgr_acquire(
   ^
   static 
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:6: warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_release' [-Wmissing-prototypes]
   void ia_css_isys_ibuf_rmgr_release(
        ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ia_css_isys_ibuf_rmgr_release(
   ^
   static 
   4 warnings generated.


vim +/ia_css_isys_ibuf_rmgr_init +34 drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   33  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @34  void ia_css_isys_ibuf_rmgr_init(void)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   35  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   36  	memset(&ibuf_rsrc, 0, sizeof(ibuf_rsrc));
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   37  	ibuf_rsrc.free_size = MAX_INPUT_BUFFER_SIZE;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   38  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   39  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @40  void ia_css_isys_ibuf_rmgr_uninit(void)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   41  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   42  	memset(&ibuf_rsrc, 0, sizeof(ibuf_rsrc));
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   43  	ibuf_rsrc.free_size = MAX_INPUT_BUFFER_SIZE;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   44  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   45  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @46  bool ia_css_isys_ibuf_rmgr_acquire(
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   47      u32	size,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   48      uint32_t	*start_addr)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   49  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   50  	bool retval = false;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   51  	bool input_buffer_found = false;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   52  	u32 aligned_size;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   53  	ibuf_handle_t *handle = NULL;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   54  	u16 i;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   55  
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   56  	assert(start_addr);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   57  	assert(size > 0);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   58  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   59  	aligned_size = (size + (IBUF_ALIGN - 1)) & ~(IBUF_ALIGN - 1);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   60  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   61  	/* Check if there is an available un-used handle with the size
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   62  	 * that will fulfill the request.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   63  	 */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   64  	if (ibuf_rsrc.num_active < ibuf_rsrc.num_allocated) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   65  		for (i = 0; i < ibuf_rsrc.num_allocated; i++) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   66  			handle = getHandle(i);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   67  			if (!handle->active) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   68  				if (handle->size >= aligned_size) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   69  					handle->active = true;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   70  					input_buffer_found = true;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   71  					ibuf_rsrc.num_active++;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   72  					break;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   73  				}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   74  			}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   75  		}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   76  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   77  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   78  	if (!input_buffer_found) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   79  		/* There were no available handles that fulfilled the
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   80  		 * request. Allocate a new handle with the requested size.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   81  		 */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   82  		if ((ibuf_rsrc.num_allocated < MAX_IBUF_HANDLES) &&
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   83  		    (ibuf_rsrc.free_size >= aligned_size)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   84  			handle = getHandle(ibuf_rsrc.num_allocated);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   85  			handle->start_addr	= ibuf_rsrc.free_start_addr;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   86  			handle->size		= aligned_size;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   87  			handle->active		= true;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   88  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   89  			ibuf_rsrc.free_start_addr += aligned_size;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   90  			ibuf_rsrc.free_size -= aligned_size;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   91  			ibuf_rsrc.num_active++;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   92  			ibuf_rsrc.num_allocated++;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   93  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   94  			input_buffer_found = true;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   95  		}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   96  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   97  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   98  	if (input_buffer_found && handle) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   99  		*start_addr = handle->start_addr;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  100  		retval = true;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  101  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  102  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  103  	return retval;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  104  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  105  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19 @106  void ia_css_isys_ibuf_rmgr_release(

:::::: The code at line 34 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--G4iJoqBmSsgzjUCe
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
bK1HK/RE/ZZUZoekbg5y/wMzOo1V+FICAA==

--G4iJoqBmSsgzjUCe--
