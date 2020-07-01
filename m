Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD5D210524
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 09:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgGAHgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 03:36:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:48729 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727836AbgGAHgU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 03:36:20 -0400
IronPort-SDR: wibQw0h9NLMov/pHnmqqoJSbw+oAsKPLoGCgNS7mgw72z77vYtTkXv/eoqbJLsEuWA6y4Vb+/5
 G/jUZaKgFRTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="143993287"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="gz'50?scan'50,208,50";a="143993287"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 00:36:13 -0700
IronPort-SDR: o7ABPUdsERNt+OcU2fmymhZzA4i7PYTNicCMrqp+3DD/WSMYl94UYuXpL+x9T8XTQqyKpbnU/l
 r/aDjStBgcpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; 
   d="gz'50?scan'50,208,50";a="312606392"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jul 2020 00:36:06 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jqXHq-0002cD-4V; Wed, 01 Jul 2020 07:36:06 +0000
Date:   Wed, 1 Jul 2020 15:35:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Gutson <daniel.gutson@eclypsium.com>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, Richard Hughes <hughsient@gmail.com>,
        Alex Bazhaniuk <alex@eclypsium.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] SPI LPC information kernel module
Message-ID: <202007011534.ebC3rvmt%lkp@intel.com>
References: <20200629225932.5036-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20200629225932.5036-1-daniel.gutson@eclypsium.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

I love your patch! Yet something to improve:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on soc/for-next linus/master v5.8-rc3 next-20200701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Gutson/SPI-LPC-information-kernel-module/20200630-070234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git ba2104c24aba1fa7e19d53f08c985526a6786d8b
config: um-allmodconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        # save the attached .config to linux build tree
        make W=1 ARCH=um 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/misc/spi_lpc/spi_lpc_main.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27,
                    from drivers/misc/spi_lpc/low_level_access.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:675,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/pci-dma-compat.h:8,
                    from include/linux/pci.h:2415,
                    from drivers/misc/spi_lpc/low_level_access.c:11:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      17 |    (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                             ^~
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      45 |   __access_ok_vsyscall(addr, size) ||
         |   ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/debugfs.h:15,
                    from drivers/misc/eeprom/idt_89hpesx.c:78:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      17 |    (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                             ^~
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      45 |   __access_ok_vsyscall(addr, size) ||
         |   ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_byte':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: error: implicit declaration of function 'pci_find_bus'; did you mean 'pci_find_next_bus'? [-Werror=implicit-function-declaration]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_byte'; did you mean 'pci_read_config_byte'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_word':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:57:1: note: in expansion of macro 'GENERIC_PCI_READ'
      57 | GENERIC_PCI_READ(word, u16)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_word'; did you mean 'pci_read_config_word'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:57:1: note: in expansion of macro 'GENERIC_PCI_READ'
      57 | GENERIC_PCI_READ(word, u16)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_dword':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:58:1: note: in expansion of macro 'GENERIC_PCI_READ'
      58 | GENERIC_PCI_READ(dword, u32)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_dword'; did you mean 'pci_read_config_dword'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:58:1: note: in expansion of macro 'GENERIC_PCI_READ'
      58 | GENERIC_PCI_READ(dword, u32)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/enclosure.c:115: warning: Function parameter or member 'name' not described in 'enclosure_register'
   drivers/misc/enclosure.c:115: warning: Function parameter or member 'cb' not described in 'enclosure_register'
   drivers/misc/enclosure.c:283: warning: Function parameter or member 'number' not described in 'enclosure_component_alloc'
   drivers/misc/enclosure.c:283: warning: Excess function parameter 'num' description in 'enclosure_component_alloc'
   drivers/misc/enclosure.c:363: warning: Function parameter or member 'component' not described in 'enclosure_add_device'
   drivers/misc/enclosure.c:363: warning: Excess function parameter 'num' description in 'enclosure_add_device'
   drivers/misc/enclosure.c:398: warning: Function parameter or member 'dev' not described in 'enclosure_remove_device'
   drivers/misc/enclosure.c:398: warning: Excess function parameter 'num' description in 'enclosure_remove_device'
   cc1: some warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/misc/spi_lpc/low_level_access.o] Error 1
   make[4]: Target '__build' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:497: drivers/misc/spi_lpc] Error 2
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   make[2]: *** [scripts/Makefile.build:497: drivers/misc] Error 2
   make[2]: Target '__build' not remade because of errors.
   make[3]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1756: drivers] Error 2
   make[1]: Target 'drivers/misc/' not remade because of errors.
--
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/misc/spi_lpc/spi_lpc_main.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27,
                    from drivers/misc/spi_lpc/low_level_access.c:11:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                   ^~
   include/linux/compiler.h:372:9: note: in definition of macro '__compiletime_assert'
     372 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
     392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_ON'
      32 |  BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |  ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:675,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/pci-dma-compat.h:8,
                    from include/linux/pci.h:2415,
                    from drivers/misc/spi_lpc/low_level_access.c:11:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      17 |    (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                             ^~
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      45 |   __access_ok_vsyscall(addr, size) ||
         |   ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/debugfs.h:15,
                    from drivers/misc/eeprom/idt_89hpesx.c:78:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
      17 |    (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                             ^~
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      45 |   __access_ok_vsyscall(addr, size) ||
         |   ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_byte':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: error: implicit declaration of function 'pci_find_bus'; did you mean 'pci_find_next_bus'? [-Werror=implicit-function-declaration]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_byte'; did you mean 'pci_read_config_byte'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:56:1: note: in expansion of macro 'GENERIC_PCI_READ'
      56 | GENERIC_PCI_READ(byte, u8)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_word':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:57:1: note: in expansion of macro 'GENERIC_PCI_READ'
      57 | GENERIC_PCI_READ(word, u16)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_word'; did you mean 'pci_read_config_word'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:57:1: note: in expansion of macro 'GENERIC_PCI_READ'
      57 | GENERIC_PCI_READ(word, u16)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c: In function 'pci_read_dword':
>> drivers/misc/spi_lpc/low_level_access.c:42:31: warning: initialization of 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |   struct pci_bus *found_bus = pci_find_bus(0, bus);              \
         |                               ^~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:58:1: note: in expansion of macro 'GENERIC_PCI_READ'
      58 | GENERIC_PCI_READ(dword, u32)
         | ^~~~~~~~~~~~~~~~
>> drivers/misc/spi_lpc/low_level_access.c:46:10: error: implicit declaration of function 'pci_bus_read_config_dword'; did you mean 'pci_read_config_dword'? [-Werror=implicit-function-declaration]
      46 |    ret = pci_bus_read_config_##Suffix(                    \
         |          ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/spi_lpc/low_level_access.c:58:1: note: in expansion of macro 'GENERIC_PCI_READ'
      58 | GENERIC_PCI_READ(dword, u32)
         | ^~~~~~~~~~~~~~~~
   drivers/misc/enclosure.c:115: warning: Function parameter or member 'name' not described in 'enclosure_register'
   drivers/misc/enclosure.c:115: warning: Function parameter or member 'cb' not described in 'enclosure_register'
   drivers/misc/enclosure.c:283: warning: Function parameter or member 'number' not described in 'enclosure_component_alloc'
   drivers/misc/enclosure.c:283: warning: Excess function parameter 'num' description in 'enclosure_component_alloc'
   drivers/misc/enclosure.c:363: warning: Function parameter or member 'component' not described in 'enclosure_add_device'
   drivers/misc/enclosure.c:363: warning: Excess function parameter 'num' description in 'enclosure_add_device'
   drivers/misc/enclosure.c:398: warning: Function parameter or member 'dev' not described in 'enclosure_remove_device'
   drivers/misc/enclosure.c:398: warning: Excess function parameter 'num' description in 'enclosure_remove_device'
   cc1: some warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/misc/spi_lpc/low_level_access.o] Error 1
   make[4]: Target '__build' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:497: drivers/misc/spi_lpc] Error 2
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   make[2]: *** [scripts/Makefile.build:497: drivers/misc] Error 2
   make[2]: Target '__build' not remade because of errors.
   make[3]: Target '__build' not remade because of errors.
..

vim +42 drivers/misc/spi_lpc/low_level_access.c

    36	
    37	#define GENERIC_PCI_READ(Suffix, Type)                                         \
    38		int pci_read_##Suffix(Type *value, u64 bus, u64 device, u64 function,  \
    39				      u64 offset)                                      \
    40		{                                                                      \
    41			int ret;                                                       \
  > 42			struct pci_bus *found_bus = pci_find_bus(0, bus);              \
    43			pr_debug("Reading PCI 0x%llx 0x%llx 0x%llx 0x%llx\n", bus,     \
    44				 device, function, offset);                            \
    45			if (found_bus != NULL) {                                       \
  > 46				ret = pci_bus_read_config_##Suffix(                    \
    47					found_bus, PCI_DEVFN(device, function),        \
    48					offset, value);                                \
    49			} else {                                                       \
    50				pr_err("Couldn't find Bus 0x%llx\n", bus);             \
    51				ret = -EIO;                                            \
    52			}                                                              \
    53			return ret;                                                    \
    54		}
    55	
  > 56	GENERIC_PCI_READ(byte, u8)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--2fHTh5uZTiUOsy+g
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--2fHTh5uZTiUOsy+g--
