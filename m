Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0DFB47AA45
	for <lists+linux-media@lfdr.de>; Mon, 20 Dec 2021 14:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhLTNVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Dec 2021 08:21:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:54603 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231194AbhLTNVK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Dec 2021 08:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640006470; x=1671542470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrftgwmqGpASu9n773EB2jIrki8BrLG9a/R4i1j5A5o=;
  b=Aw5cszvAsyRdGu8r0KJhe6mEUfTws3HOHS3yplYPYqqVlIQTjejXOHK4
   RXWjBsAe1mpPUZmzKHhjBRUbw1X2VmNOzXTacwujnJ5Hwd8YFId+ZnZKy
   wWtbxdxp3hfv7XB5tjbMFo2S3fvJUbnrLRnuKSfV+Wm4VztEl91nKHWA8
   Q8JEr3x7YfIkbZ9/POXMdMAJoLc7G53/bdLirWz46WkyTWjDZQI5Sn2DJ
   R/m1D6f7eMo4pZvfMFyUfeB3eyAi5YuEjv+q3qfW3ROcfeWgcwuIvTf41
   kCcsQovnBhjN6j6jdpABXac0fXf1LA/zzVyyjvtMYlRNPqbT9eDfcTF8e
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220174841"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="220174841"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 05:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="547328990"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 05:21:07 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzIbC-0007nK-VX; Mon, 20 Dec 2021 13:21:06 +0000
Date:   Mon, 20 Dec 2021 21:20:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Xianting Tian <xianting.tian@linux.alibaba.com>, kraxel@redhat.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org,
        Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH] udmabuf: put dmabuf in case of get fd failed
Message-ID: <202112202144.R9IV6eP2-lkp@intel.com>
References: <20211220054333.3041893-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220054333.3041893-1-xianting.tian@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xianting,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc6 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xianting-Tian/udmabuf-put-dmabuf-in-case-of-get-fd-failed/20211220-134433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a7904a538933c525096ca2ccde1e60d0ee62c08e
config: x86_64-randconfig-r032-20211220 (https://download.01.org/0day-ci/archive/20211220/202112202144.R9IV6eP2-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/322781a4da9de4a3057afd933108d23ca7f5282e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xianting-Tian/udmabuf-put-dmabuf-in-case-of-get-fd-failed/20211220-134433
        git checkout 322781a4da9de4a3057afd933108d23ca7f5282e
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma-buf/udmabuf.c: In function 'udmabuf_create':
   drivers/dma-buf/udmabuf.c:292:13: error: invalid storage class for function 'udmabuf_ioctl_create'
     292 | static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/dma-buf/udmabuf.c:292:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     292 | static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
         | ^~~~~~
   drivers/dma-buf/udmabuf.c:311:13: error: invalid storage class for function 'udmabuf_ioctl_create_list'
     311 | static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:332:13: error: invalid storage class for function 'udmabuf_ioctl'
     332 | static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
         |             ^~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:353:20: error: initializer element is not constant
     353 |  .unlocked_ioctl = udmabuf_ioctl,
         |                    ^~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:353:20: note: (near initialization for 'udmabuf_fops.unlocked_ioctl')
   drivers/dma-buf/udmabuf.c:355:20: error: initializer element is not constant
     355 |  .compat_ioctl   = udmabuf_ioctl,
         |                    ^~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:355:20: note: (near initialization for 'udmabuf_fops.compat_ioctl')
   drivers/dma-buf/udmabuf.c:365:19: error: invalid storage class for function 'udmabuf_dev_init'
     365 | static int __init udmabuf_dev_init(void)
         |                   ^~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:370:20: error: invalid storage class for function 'udmabuf_dev_exit'
     370 | static void __exit udmabuf_dev_exit(void)
         |                    ^~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/cred.h:12,
                    from drivers/dma-buf/udmabuf.c:2:
   include/linux/compiler.h:244:46: error: initializer element is not constant
     244 |   __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                              ^
   include/linux/init.h:236:2: note: in expansion of macro '__ADDRESSABLE'
     236 |  __ADDRESSABLE(fn)
         |  ^~~~~~~~~~~~~
   include/linux/init.h:241:2: note: in expansion of macro '__define_initcall_stub'
     241 |  __define_initcall_stub(__stub, fn)   \
         |  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:254:2: note: in expansion of macro '____define_initcall'
     254 |  ____define_initcall(fn,     \
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:260:2: note: in expansion of macro '__unique_initcall'
     260 |  __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |  ^~~~~~~~~~~~~~~~~
   include/linux/init.h:262:35: note: in expansion of macro '___define_initcall'
     262 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:30: note: in expansion of macro '__define_initcall'
     291 | #define device_initcall(fn)  __define_initcall(fn, 6)
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/init.h:296:24: note: in expansion of macro 'device_initcall'
     296 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:24: note: in expansion of macro '__initcall'
      88 | #define module_init(x) __initcall(x);
         |                        ^~~~~~~~~~
   drivers/dma-buf/udmabuf.c:375:1: note: in expansion of macro 'module_init'
     375 | module_init(udmabuf_dev_init)
         | ^~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/key.h:14,
                    from include/linux/cred.h:13,
                    from drivers/dma-buf/udmabuf.c:2:
>> include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/init.h:246:2: note: in expansion of macro 'static_assert'
     246 |  static_assert(__same_type(initcall_t, &fn));
         |  ^~~~~~~~~~~~~
   include/linux/init.h:254:2: note: in expansion of macro '____define_initcall'
     254 |  ____define_initcall(fn,     \
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:260:2: note: in expansion of macro '__unique_initcall'
     260 |  __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |  ^~~~~~~~~~~~~~~~~
   include/linux/init.h:262:35: note: in expansion of macro '___define_initcall'
     262 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:30: note: in expansion of macro '__define_initcall'
     291 | #define device_initcall(fn)  __define_initcall(fn, 6)
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/init.h:296:24: note: in expansion of macro 'device_initcall'
     296 | #define __initcall(fn) device_initcall(fn)
         |                        ^~~~~~~~~~~~~~~
   include/linux/module.h:88:24: note: in expansion of macro '__initcall'
      88 | #define module_init(x) __initcall(x);
         |                        ^~~~~~~~~~
   drivers/dma-buf/udmabuf.c:375:1: note: in expansion of macro 'module_init'
     375 | module_init(udmabuf_dev_init)
         | ^~~~~~~~~~~
   In file included from include/linux/cred.h:12,
                    from drivers/dma-buf/udmabuf.c:2:
   drivers/dma-buf/udmabuf.c:376:13: error: initializer element is not constant
     376 | module_exit(udmabuf_dev_exit)
         |             ^~~~~~~~~~~~~~~~
   include/linux/init.h:299:50: note: in definition of macro '__exitcall'
     299 |  static exitcall_t __exitcall_##fn __exit_call = fn
         |                                                  ^~
   drivers/dma-buf/udmabuf.c:376:1: note: in expansion of macro 'module_exit'
     376 | module_exit(udmabuf_dev_exit)
         | ^~~~~~~~~~~
   include/linux/init.h:299:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     299 |  static exitcall_t __exitcall_##fn __exit_call = fn
         |  ^~~~~~
   include/linux/module.h:100:24: note: in expansion of macro '__exitcall'
     100 | #define module_exit(x) __exitcall(x);
         |                        ^~~~~~~~~~
   drivers/dma-buf/udmabuf.c:376:1: note: in expansion of macro 'module_exit'
     376 | module_exit(udmabuf_dev_exit)
         | ^~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:379:1: error: expected declaration or statement at end of input
     379 | MODULE_LICENSE("GPL v2");
         | ^~~~~~~~~~~~~~


vim +292 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann   2018-08-27  291  
fbb0de79507819 Gerd Hoffmann   2018-08-27 @292  static long udmabuf_ioctl_create(struct file *filp, unsigned long arg)
fbb0de79507819 Gerd Hoffmann   2018-08-27  293  {
fbb0de79507819 Gerd Hoffmann   2018-08-27  294  	struct udmabuf_create create;
fbb0de79507819 Gerd Hoffmann   2018-08-27  295  	struct udmabuf_create_list head;
fbb0de79507819 Gerd Hoffmann   2018-08-27  296  	struct udmabuf_create_item list;
fbb0de79507819 Gerd Hoffmann   2018-08-27  297  
fbb0de79507819 Gerd Hoffmann   2018-08-27  298  	if (copy_from_user(&create, (void __user *)arg,
33f35429fc49c0 Gerd Hoffmann   2018-09-11  299  			   sizeof(create)))
fbb0de79507819 Gerd Hoffmann   2018-08-27  300  		return -EFAULT;
fbb0de79507819 Gerd Hoffmann   2018-08-27  301  
fbb0de79507819 Gerd Hoffmann   2018-08-27  302  	head.flags  = create.flags;
fbb0de79507819 Gerd Hoffmann   2018-08-27  303  	head.count  = 1;
fbb0de79507819 Gerd Hoffmann   2018-08-27  304  	list.memfd  = create.memfd;
fbb0de79507819 Gerd Hoffmann   2018-08-27  305  	list.offset = create.offset;
fbb0de79507819 Gerd Hoffmann   2018-08-27  306  	list.size   = create.size;
fbb0de79507819 Gerd Hoffmann   2018-08-27  307  
c1bbed66899726 Gurchetan Singh 2019-12-02  308  	return udmabuf_create(filp->private_data, &head, &list);
fbb0de79507819 Gerd Hoffmann   2018-08-27  309  }
fbb0de79507819 Gerd Hoffmann   2018-08-27  310  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
