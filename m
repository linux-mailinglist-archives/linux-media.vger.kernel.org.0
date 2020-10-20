Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1CB293548
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 08:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404611AbgJTGy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 02:54:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:4813 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404591AbgJTGy0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 02:54:26 -0400
IronPort-SDR: UQqk/iXzfVw6vP0RUkReODjKmPebtal7gcEMj1zmGrj0ll29cmf453Yb4q9zMerkc1vsGiNzEV
 aK6GANExn8Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="251860493"
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="gz'50?scan'50,208,50";a="251860493"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2020 23:54:23 -0700
IronPort-SDR: 5B2mitE9PvpsNRdSfp2iWealuRQYvKwQfGZbLluygP1spx5DwiXzLLQc7nXGOu+i0iW7jdqVTX
 mo4lztlt9r7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,396,1596524400"; 
   d="gz'50?scan'50,208,50";a="353236958"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2020 23:54:21 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kUlXI-0000RH-HG; Tue, 20 Oct 2020 06:54:20 +0000
Date:   Tue, 20 Oct 2020 14:53:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6:
 warning: no previous prototype for function 'ia_css_isys_ibuf_rmgr_init'
Message-ID: <202010201416.rULNT0I3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   270315b8235e3d10c2e360cff56c2f9e0915a252
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   4 months ago
config: x86_64-randconfig-a003-20201020 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ea693a162786d933863ab079648d4261ac0ead47)
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

--ew6BAiZeqk4r7MaW
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ew6BAiZeqk4r7MaW--
