Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9F439506F
	for <lists+linux-media@lfdr.de>; Sun, 30 May 2021 12:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhE3Khs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 May 2021 06:37:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:44357 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE3Khs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 May 2021 06:37:48 -0400
IronPort-SDR: y4X/NAX2hU1YLIbH7fBjeF5N8UcZTQVB5lHx03r1TjXkJWwSmwPYHyi++B3PW7Oe9WGdVmt3db
 zzmFxO7dt2Sg==
X-IronPort-AV: E=McAfee;i="6200,9189,9999"; a="203242058"
X-IronPort-AV: E=Sophos;i="5.83,234,1616482800"; 
   d="gz'50?scan'50,208,50";a="203242058"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2021 03:36:09 -0700
IronPort-SDR: 10ikcHoDgdEekZvE0MlhNhFpThGpjOhEIg26HjD8p+Lwm14lowO0h5UJ8eEZ2a9Sqtkco1OcNU
 1piG6JHmvzSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,234,1616482800"; 
   d="gz'50?scan'50,208,50";a="548454570"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 May 2021 03:36:07 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lnIne-00045Q-AB; Sun, 30 May 2021 10:36:06 +0000
Date:   Sun, 30 May 2021 18:35:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/media/common/videobuf2/videobuf2-core.c:391:12: warning:
 stack frame size of 2080 bytes in function '__vb2_queue_alloc'
Message-ID: <202105301809.JFoKgL0Y-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergey,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b90e90f40b4ff23c753126008bf4713a42353af6
commit: bac63f1239aceb092e94fee3ef112dbaea79b372 media: vb2: set cache sync hints when init buffers
date:   6 months ago
config: powerpc64-randconfig-r034-20210530 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc6799f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bac63f1239aceb092e94fee3ef112dbaea79b372
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bac63f1239aceb092e94fee3ef112dbaea79b372
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:249:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:251:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:2:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:4:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:6:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:8:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/media/common/videobuf2/videobuf2-core.c:391:12: warning: stack frame size of 2080 bytes in function '__vb2_queue_alloc' [-Wframe-larger-than=]
   static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
              ^
   14 warnings generated.


vim +/__vb2_queue_alloc +391 drivers/media/common/videobuf2/videobuf2-core.c

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  383  
2a87af6ba1b9df drivers/media/v4l2-core/videobuf2-core.c        Mauro Carvalho Chehab 2017-11-27  384  /*
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  385   * __vb2_queue_alloc() - allocate videobuf buffer structures and (for MMAP type)
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  386   * video buffer memory for all buffers/planes on the queue and initializes the
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  387   * queue
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  388   *
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  389   * Returns the number of buffers successfully allocated.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  390   */
bed04f93424737 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-10-06 @391  static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  392  			     unsigned int num_buffers, unsigned int num_planes,
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  393  			     const unsigned plane_sizes[VB2_MAX_PLANES])
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  394  {
489648afcd309b drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  395  	unsigned int buffer, plane;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  396  	struct vb2_buffer *vb;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  397  	int ret;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  398  
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  399  	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  400  	num_buffers = min_t(unsigned int, num_buffers,
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  401  			    VB2_MAX_FRAME - q->num_buffers);
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  402  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  403  	for (buffer = 0; buffer < num_buffers; ++buffer) {
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  404  		/* Allocate videobuf buffer structures */
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  405  		vb = kzalloc(q->buf_struct_size, GFP_KERNEL);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  406  		if (!vb) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinchart      2020-06-21  407  			dprintk(q, 1, "memory alloc for buffer struct failed\n");
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  408  			break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  409  		}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  410  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  411  		vb->state = VB2_BUF_STATE_DEQUEUED;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  412  		vb->vb2_queue = q;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  413  		vb->num_planes = num_planes;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-09-22  414  		vb->index = q->num_buffers + buffer;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-09-22  415  		vb->type = q->type;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-09-22  416  		vb->memory = memory;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  417  		/*
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  418  		 * We need to set these flags here so that the videobuf2 core
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  419  		 * will call ->prepare()/->finish() cache sync/flush on vb2
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  420  		 * buffers when appropriate. However, we can avoid explicit
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  421  		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  422  		 * because DMA exporter takes care of it.
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  423  		 */
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  424  		if (q->memory != VB2_MEMORY_DMABUF) {
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  425  			vb->need_cache_sync_on_prepare = 1;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  426  			vb->need_cache_sync_on_finish = 1;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senozhatsky    2020-11-30  427  		}
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  428  		for (plane = 0; plane < num_planes; ++plane) {
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  429  			vb->planes[plane].length = plane_sizes[plane];
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  430  			vb->planes[plane].min_length = plane_sizes[plane];
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  431  		}
8e013700bc1280 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2018-06-01  432  		call_void_bufop(q, init_buffer, vb);
8e013700bc1280 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2018-06-01  433  
e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  434  		q->bufs[vb->index] = vb;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  435  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  436  		/* Allocate video buffer memory for the MMAP type */
bed04f93424737 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-10-06  437  		if (memory == VB2_MEMORY_MMAP) {
c1426bc727b788 drivers/media/video/videobuf2-core.c            Marek Szyprowski      2011-08-24  438  			ret = __vb2_buf_mem_alloc(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  439  			if (ret) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinchart      2020-06-21  440  				dprintk(q, 1, "failed allocating memory for buffer %d\n",
8720427c198b6d drivers/media/v4l2-core/videobuf2-core.c        Mauro Carvalho Chehab 2016-10-18  441  					buffer);
e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  442  				q->bufs[vb->index] = NULL;
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  443  				kfree(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  444  				break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  445  			}
20eedf0e169180 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  446  			__setup_offsets(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  447  			/*
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  448  			 * Call the driver-provided buffer initialization
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  449  			 * callback, if given. An error in initialization
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  450  			 * results in queue setup failure.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  451  			 */
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  452  			ret = call_vb_qop(vb, buf_init, vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  453  			if (ret) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinchart      2020-06-21  454  				dprintk(q, 1, "buffer %d %p initialization failed\n",
8720427c198b6d drivers/media/v4l2-core/videobuf2-core.c        Mauro Carvalho Chehab 2016-10-18  455  					buffer, vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  456  				__vb2_buf_mem_free(vb);
e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2015-11-20  457  				q->bufs[vb->index] = NULL;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  458  				kfree(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  459  				break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  460  			}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  461  		}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  462  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  463  
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinchart      2020-06-21  464  	dprintk(q, 3, "allocated %d buffers, %d plane(s) each\n",
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  465  		buffer, num_planes);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  466  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  467  	return buffer;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  468  }
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  469  

:::::: The code at line 391 was first introduced by commit
:::::: bed04f9342473743fc96b71c3130f645c718bd47 [media] media: videobuf2: Replace v4l2-specific data with vb2 data

:::::: TO: Junghak Sung <jh1009.sung@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--u3/rZRmxL6MmkK24
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
u0qd/38cndpxr4EBAA==

--u3/rZRmxL6MmkK24--
