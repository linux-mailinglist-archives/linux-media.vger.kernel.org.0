Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0403A2CA691
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 16:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391741AbgLAPIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 10:08:09 -0500
Received: from mga04.intel.com ([192.55.52.120]:30872 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390149AbgLAPII (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 10:08:08 -0500
IronPort-SDR: NJskWhjQkPBP5YS5mQotClbBeZm37cySytvPElCvq7CA+TGeHJarv8V62pzFlwPUN2xZiHOoWD
 MfPQ/gHm5aow==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="170275387"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="gz'50?scan'50,208,50";a="170275387"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 07:07:08 -0800
IronPort-SDR: O2J7qSaxiGw+VGF20olz57ZeV1xyfJNgFppYosneLrL/0xQS0cQTOjFSb62bomvjWmDgXtFOsW
 Fvfw0RAfsOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="gz'50?scan'50,208,50";a="335127065"
Received: from lkp-server01.sh.intel.com (HELO cb91f3174bdd) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Dec 2020 07:07:03 -0800
Received: from kbuild by cb91f3174bdd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kk7F8-00000O-Ra; Tue, 01 Dec 2020 15:07:02 +0000
Date:   Tue, 1 Dec 2020 23:06:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 16/16] scripts: kernel-doc: validate kernel-doc markup
 with the actual names
Message-ID: <202012012319.CLOjMzDU-lkp@intel.com>
References: <03ac429b0d41755e491c8fd80ca927d65b87d7d1.1606823973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <03ac429b0d41755e491c8fd80ca927d65b87d7d1.1606823973.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20201201]
[cannot apply to lwn/docs-next tip/sched/core hsi/for-next linus/master v5.10-rc6 v5.10-rc5 v5.10-rc4 v5.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mauro-Carvalho-Chehab/HSI-fix-a-kernel-doc-markup/20201201-210930
base:    0eedceafd3a63fd082743c914853ef4b9247dbe6
config: parisc-randconfig-s032-20201201 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-170-g3bc348f6-dirty
        # https://github.com/0day-ci/linux/commit/7c52ba119279c74e6c7e968e3fa7290bd0f3b837
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mauro-Carvalho-Chehab/HSI-fix-a-kernel-doc-markup/20201201-210930
        git checkout 7c52ba119279c74e6c7e968e3fa7290bd0f3b837
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/parisc/kernel/firmware.c:144: warning: Function parameter or member 'addr' not described in 'convert_to_wide'
   arch/parisc/kernel/firmware.c:144: warning: Excess function parameter 'address' description in 'convert_to_wide'
   arch/parisc/kernel/firmware.c:260: warning: Function parameter or member 'led_info' not described in 'pdc_chassis_info'
   arch/parisc/kernel/firmware.c:260: warning: Excess function parameter 'result' description in 'pdc_chassis_info'
   arch/parisc/kernel/firmware.c:284: warning: Function parameter or member 'state' not described in 'pdc_pat_chassis_send_log'
   arch/parisc/kernel/firmware.c:284: warning: Function parameter or member 'data' not described in 'pdc_pat_chassis_send_log'
   arch/parisc/kernel/firmware.c:284: warning: Excess function parameter 'retval' description in 'pdc_pat_chassis_send_log'
   arch/parisc/kernel/firmware.c:304: warning: Function parameter or member 'disp' not described in 'pdc_chassis_disp'
   arch/parisc/kernel/firmware.c:304: warning: Excess function parameter 'retval' description in 'pdc_chassis_disp'
>> arch/parisc/kernel/firmware.c:320: warning: expecting prototype for pdc_cpu_rendenzvous(). Prototype was for __pdc_cpu_rendezvous() instead
   arch/parisc/kernel/firmware.c:333: warning: Function parameter or member 'warn' not described in 'pdc_chassis_warn'
   arch/parisc/kernel/firmware.c:333: warning: Excess function parameter 'retval' description in 'pdc_chassis_warn'
   arch/parisc/kernel/firmware.c:519: warning: Function parameter or member 'versions' not described in 'pdc_model_versions'
   arch/parisc/kernel/firmware.c:519: warning: Excess function parameter 'cpu_id' description in 'pdc_model_versions'
   arch/parisc/kernel/firmware.c:963: warning: Function parameter or member 'hpa' not described in 'pdc_pci_config_read'
   arch/parisc/kernel/firmware.c:963: warning: Function parameter or member 'cfg_addr' not described in 'pdc_pci_config_read'
   arch/parisc/kernel/firmware.c:987: warning: Function parameter or member 'hpa' not described in 'pdc_pci_config_write'
   arch/parisc/kernel/firmware.c:987: warning: Function parameter or member 'cfg_addr' not described in 'pdc_pci_config_write'
   arch/parisc/kernel/firmware.c:987: warning: Function parameter or member 'val' not described in 'pdc_pci_config_write'
   arch/parisc/kernel/firmware.c:1464: warning: Function parameter or member 'actual_len' not described in 'pdc_pat_pd_get_addr_map'
   arch/parisc/kernel/firmware.c:1464: warning: Excess function parameter 'actlen' description in 'pdc_pat_pd_get_addr_map'
>> arch/parisc/kernel/firmware.c:1487: warning: expecting prototype for pdc_pat_pd_get_PDC_interface_revisions(). Prototype was for pdc_pat_pd_get_pdc_revisions() instead
   arch/parisc/kernel/firmware.c:1539: warning: Function parameter or member 'val' not described in 'pdc_pat_io_pci_cfg_write'
   arch/parisc/kernel/firmware.c:1539: warning: Excess function parameter 'value' description in 'pdc_pat_io_pci_cfg_write'
>> arch/parisc/kernel/firmware.c:1557: warning: expecting prototype for pdc_pat_mem_pdc_info(). Prototype was for pdc_pat_mem_pdt_info() instead
--
   arch/parisc/kernel/pdc_chassis.c:47: warning: Function parameter or member 'str' not described in 'pdc_chassis_setup'
   arch/parisc/kernel/pdc_chassis.c:64: warning: Excess function parameter 'pdc_chassis_old' description in 'pdc_chassis_checkold'
   arch/parisc/kernel/pdc_chassis.c:88: warning: Function parameter or member 'this' not described in 'pdc_chassis_panic_event'
   arch/parisc/kernel/pdc_chassis.c:88: warning: Function parameter or member 'event' not described in 'pdc_chassis_panic_event'
   arch/parisc/kernel/pdc_chassis.c:88: warning: Function parameter or member 'ptr' not described in 'pdc_chassis_panic_event'
   arch/parisc/kernel/pdc_chassis.c:108: warning: Function parameter or member 'this' not described in 'pdc_chassis_reboot_event'
   arch/parisc/kernel/pdc_chassis.c:108: warning: Function parameter or member 'event' not described in 'pdc_chassis_reboot_event'
   arch/parisc/kernel/pdc_chassis.c:108: warning: Function parameter or member 'ptr' not described in 'pdc_chassis_reboot_event'
>> arch/parisc/kernel/pdc_chassis.c:108: warning: expecting prototype for parisc_reboot_event(). Prototype was for pdc_chassis_reboot_event() instead
   arch/parisc/kernel/pdc_chassis.c:162: warning: Function parameter or member 'message' not described in 'pdc_chassis_send_status'
   arch/parisc/kernel/pdc_chassis.c:162: warning: Excess function parameter 'retval' description in 'pdc_chassis_send_status'
--
>> arch/parisc/kernel/processor.c:67: warning: expecting prototype for init_cpu_profiler(). Prototype was for init_percpu_prof() instead
--
   drivers/tty/serial/mux.c:118: warning: Function parameter or member 'port' not described in 'mux_set_mctrl'
   drivers/tty/serial/mux.c:118: warning: Excess function parameter 'ports' description in 'mux_set_mctrl'
>> drivers/tty/serial/mux.c:371: warning: expecting prototype for mux_drv_poll(). Prototype was for mux_poll() instead

vim +320 arch/parisc/kernel/firmware.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  134  
^1da177e4c3f415 Linus Torvalds 2005-04-16  135  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  136   * convert_to_wide - Convert the return buffer addresses into kernel addresses.
^1da177e4c3f415 Linus Torvalds 2005-04-16  137   * @address: The return buffer from PDC.
^1da177e4c3f415 Linus Torvalds 2005-04-16  138   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  139   * This function is used to convert the return buffer addresses retrieved from PDC
^1da177e4c3f415 Linus Torvalds 2005-04-16  140   * into kernel addresses when the PDC address size and kernel address size are
^1da177e4c3f415 Linus Torvalds 2005-04-16  141   * different.
^1da177e4c3f415 Linus Torvalds 2005-04-16  142   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  143  static void convert_to_wide(unsigned long *addr)
^1da177e4c3f415 Linus Torvalds 2005-04-16 @144  {
a8f44e3889b6868 Helge Deller   2007-01-28  145  #ifdef CONFIG_64BIT
^1da177e4c3f415 Linus Torvalds 2005-04-16  146  	int i;
^1da177e4c3f415 Linus Torvalds 2005-04-16  147  	unsigned int *p = (unsigned int *)addr;
^1da177e4c3f415 Linus Torvalds 2005-04-16  148  
^1da177e4c3f415 Linus Torvalds 2005-04-16  149  	if (unlikely(parisc_narrow_firmware)) {
8a5aa00e6b9630d Helge Deller   2017-08-04  150  		for (i = (NUM_PDC_RESULT-1); i >= 0; --i)
^1da177e4c3f415 Linus Torvalds 2005-04-16  151  			addr[i] = p[i];
^1da177e4c3f415 Linus Torvalds 2005-04-16  152  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  153  #endif
^1da177e4c3f415 Linus Torvalds 2005-04-16  154  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  155  
24b574d052a1996 Kyle McMartin  2008-07-29  156  #ifdef CONFIG_64BIT
60ffef065dd40b9 Paul Gortmaker 2013-06-17  157  void set_firmware_width_unlocked(void)
24b574d052a1996 Kyle McMartin  2008-07-29  158  {
24b574d052a1996 Kyle McMartin  2008-07-29  159  	int ret;
24b574d052a1996 Kyle McMartin  2008-07-29  160  
24b574d052a1996 Kyle McMartin  2008-07-29  161  	ret = mem_pdc_call(PDC_MODEL, PDC_MODEL_CAPABILITIES,
24b574d052a1996 Kyle McMartin  2008-07-29  162  		__pa(pdc_result), 0);
24b574d052a1996 Kyle McMartin  2008-07-29  163  	convert_to_wide(pdc_result);
24b574d052a1996 Kyle McMartin  2008-07-29  164  	if (pdc_result[0] != NARROW_FIRMWARE)
24b574d052a1996 Kyle McMartin  2008-07-29  165  		parisc_narrow_firmware = 0;
24b574d052a1996 Kyle McMartin  2008-07-29  166  }
24b574d052a1996 Kyle McMartin  2008-07-29  167  	
^1da177e4c3f415 Linus Torvalds 2005-04-16  168  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  169   * set_firmware_width - Determine if the firmware is wide or narrow.
^1da177e4c3f415 Linus Torvalds 2005-04-16  170   * 
24b574d052a1996 Kyle McMartin  2008-07-29  171   * This function must be called before any pdc_* function that uses the
24b574d052a1996 Kyle McMartin  2008-07-29  172   * convert_to_wide function.
^1da177e4c3f415 Linus Torvalds 2005-04-16  173   */
60ffef065dd40b9 Paul Gortmaker 2013-06-17  174  void set_firmware_width(void)
^1da177e4c3f415 Linus Torvalds 2005-04-16  175  {
09690b18b7b9696 Kyle McMartin  2006-10-05  176  	unsigned long flags;
09690b18b7b9696 Kyle McMartin  2006-10-05  177  	spin_lock_irqsave(&pdc_lock, flags);
24b574d052a1996 Kyle McMartin  2008-07-29  178  	set_firmware_width_unlocked();
09690b18b7b9696 Kyle McMartin  2006-10-05  179  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  180  }
24b574d052a1996 Kyle McMartin  2008-07-29  181  #else
60ffef065dd40b9 Paul Gortmaker 2013-06-17  182  void set_firmware_width_unlocked(void)
60ffef065dd40b9 Paul Gortmaker 2013-06-17  183  {
24b574d052a1996 Kyle McMartin  2008-07-29  184  	return;
24b574d052a1996 Kyle McMartin  2008-07-29  185  }
24b574d052a1996 Kyle McMartin  2008-07-29  186  
60ffef065dd40b9 Paul Gortmaker 2013-06-17  187  void set_firmware_width(void)
60ffef065dd40b9 Paul Gortmaker 2013-06-17  188  {
24b574d052a1996 Kyle McMartin  2008-07-29  189  	return;
24b574d052a1996 Kyle McMartin  2008-07-29  190  }
24b574d052a1996 Kyle McMartin  2008-07-29  191  #endif /*CONFIG_64BIT*/
^1da177e4c3f415 Linus Torvalds 2005-04-16  192  
f5213b2c40f5749 Helge Deller   2017-08-20  193  
f5213b2c40f5749 Helge Deller   2017-08-20  194  #if !defined(BOOTLOADER)
^1da177e4c3f415 Linus Torvalds 2005-04-16  195  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  196   * pdc_emergency_unlock - Unlock the linux pdc lock
^1da177e4c3f415 Linus Torvalds 2005-04-16  197   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  198   * This call unlocks the linux pdc lock in case we need some PDC functions
^1da177e4c3f415 Linus Torvalds 2005-04-16  199   * (like pdc_add_valid) during kernel stack dump.
^1da177e4c3f415 Linus Torvalds 2005-04-16  200   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  201  void pdc_emergency_unlock(void)
^1da177e4c3f415 Linus Torvalds 2005-04-16  202  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  203   	/* Spinlock DEBUG code freaks out if we unconditionally unlock */
^1da177e4c3f415 Linus Torvalds 2005-04-16  204          if (spin_is_locked(&pdc_lock))
^1da177e4c3f415 Linus Torvalds 2005-04-16  205  		spin_unlock(&pdc_lock);
^1da177e4c3f415 Linus Torvalds 2005-04-16  206  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  207  
^1da177e4c3f415 Linus Torvalds 2005-04-16  208  
^1da177e4c3f415 Linus Torvalds 2005-04-16  209  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  210   * pdc_add_valid - Verify address can be accessed without causing a HPMC.
^1da177e4c3f415 Linus Torvalds 2005-04-16  211   * @address: Address to be verified.
^1da177e4c3f415 Linus Torvalds 2005-04-16  212   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  213   * This PDC call attempts to read from the specified address and verifies
^1da177e4c3f415 Linus Torvalds 2005-04-16  214   * if the address is valid.
^1da177e4c3f415 Linus Torvalds 2005-04-16  215   * 
^1da177e4c3f415 Linus Torvalds 2005-04-16  216   * The return value is PDC_OK (0) in case accessing this address is valid.
^1da177e4c3f415 Linus Torvalds 2005-04-16  217   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  218  int pdc_add_valid(unsigned long address)
^1da177e4c3f415 Linus Torvalds 2005-04-16  219  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  220          int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  221  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  222  
09690b18b7b9696 Kyle McMartin  2006-10-05  223          spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  224          retval = mem_pdc_call(PDC_ADD_VALID, PDC_ADD_VALID_VERIFY, address);
09690b18b7b9696 Kyle McMartin  2006-10-05  225          spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  226  
^1da177e4c3f415 Linus Torvalds 2005-04-16  227          return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  228  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  229  EXPORT_SYMBOL(pdc_add_valid);
^1da177e4c3f415 Linus Torvalds 2005-04-16  230  
77089c5274fe2f7 Helge Deller   2017-09-17  231  /**
77089c5274fe2f7 Helge Deller   2017-09-17  232   * pdc_instr - Get instruction that invokes PDCE_CHECK in HPMC handler.
77089c5274fe2f7 Helge Deller   2017-09-17  233   * @instr: Pointer to variable which will get instruction opcode.
77089c5274fe2f7 Helge Deller   2017-09-17  234   *
77089c5274fe2f7 Helge Deller   2017-09-17  235   * The return value is PDC_OK (0) in case call succeeded.
77089c5274fe2f7 Helge Deller   2017-09-17  236   */
77089c5274fe2f7 Helge Deller   2017-09-17  237  int __init pdc_instr(unsigned int *instr)
77089c5274fe2f7 Helge Deller   2017-09-17  238  {
77089c5274fe2f7 Helge Deller   2017-09-17  239  	int retval;
77089c5274fe2f7 Helge Deller   2017-09-17  240  	unsigned long flags;
77089c5274fe2f7 Helge Deller   2017-09-17  241  
77089c5274fe2f7 Helge Deller   2017-09-17  242  	spin_lock_irqsave(&pdc_lock, flags);
77089c5274fe2f7 Helge Deller   2017-09-17  243  	retval = mem_pdc_call(PDC_INSTR, 0UL, __pa(pdc_result));
77089c5274fe2f7 Helge Deller   2017-09-17  244  	convert_to_wide(pdc_result);
77089c5274fe2f7 Helge Deller   2017-09-17  245  	*instr = pdc_result[0];
77089c5274fe2f7 Helge Deller   2017-09-17  246  	spin_unlock_irqrestore(&pdc_lock, flags);
77089c5274fe2f7 Helge Deller   2017-09-17  247  
77089c5274fe2f7 Helge Deller   2017-09-17  248  	return retval;
77089c5274fe2f7 Helge Deller   2017-09-17  249  }
77089c5274fe2f7 Helge Deller   2017-09-17  250  
^1da177e4c3f415 Linus Torvalds 2005-04-16  251  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  252   * pdc_chassis_info - Return chassis information.
^1da177e4c3f415 Linus Torvalds 2005-04-16  253   * @result: The return buffer.
^1da177e4c3f415 Linus Torvalds 2005-04-16  254   * @chassis_info: The memory buffer address.
^1da177e4c3f415 Linus Torvalds 2005-04-16  255   * @len: The size of the memory buffer address.
^1da177e4c3f415 Linus Torvalds 2005-04-16  256   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  257   * An HVERSION dependent call for returning the chassis information.
^1da177e4c3f415 Linus Torvalds 2005-04-16  258   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  259  int __init pdc_chassis_info(struct pdc_chassis_info *chassis_info, void *led_info, unsigned long len)
^1da177e4c3f415 Linus Torvalds 2005-04-16  260  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  261          int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  262  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  263  
09690b18b7b9696 Kyle McMartin  2006-10-05  264          spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  265          memcpy(&pdc_result, chassis_info, sizeof(*chassis_info));
^1da177e4c3f415 Linus Torvalds 2005-04-16  266          memcpy(&pdc_result2, led_info, len);
^1da177e4c3f415 Linus Torvalds 2005-04-16  267          retval = mem_pdc_call(PDC_CHASSIS, PDC_RETURN_CHASSIS_INFO,
^1da177e4c3f415 Linus Torvalds 2005-04-16  268                                __pa(pdc_result), __pa(pdc_result2), len);
^1da177e4c3f415 Linus Torvalds 2005-04-16  269          memcpy(chassis_info, pdc_result, sizeof(*chassis_info));
^1da177e4c3f415 Linus Torvalds 2005-04-16  270          memcpy(led_info, pdc_result2, len);
09690b18b7b9696 Kyle McMartin  2006-10-05  271          spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  272  
^1da177e4c3f415 Linus Torvalds 2005-04-16  273          return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  274  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  275  
^1da177e4c3f415 Linus Torvalds 2005-04-16  276  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  277   * pdc_pat_chassis_send_log - Sends a PDC PAT CHASSIS log message.
^1da177e4c3f415 Linus Torvalds 2005-04-16  278   * @retval: -1 on error, 0 on success. Other value are PDC errors
^1da177e4c3f415 Linus Torvalds 2005-04-16  279   * 
^1da177e4c3f415 Linus Torvalds 2005-04-16  280   * Must be correctly formatted or expect system crash
^1da177e4c3f415 Linus Torvalds 2005-04-16  281   */
a8f44e3889b6868 Helge Deller   2007-01-28  282  #ifdef CONFIG_64BIT
^1da177e4c3f415 Linus Torvalds 2005-04-16  283  int pdc_pat_chassis_send_log(unsigned long state, unsigned long data)
^1da177e4c3f415 Linus Torvalds 2005-04-16  284  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  285  	int retval = 0;
09690b18b7b9696 Kyle McMartin  2006-10-05  286  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  287          
^1da177e4c3f415 Linus Torvalds 2005-04-16  288  	if (!is_pdc_pat())
^1da177e4c3f415 Linus Torvalds 2005-04-16  289  		return -1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  290  
09690b18b7b9696 Kyle McMartin  2006-10-05  291  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  292  	retval = mem_pdc_call(PDC_PAT_CHASSIS_LOG, PDC_PAT_CHASSIS_WRITE_LOG, __pa(&state), __pa(&data));
09690b18b7b9696 Kyle McMartin  2006-10-05  293  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  294  
^1da177e4c3f415 Linus Torvalds 2005-04-16  295  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  296  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  297  #endif
^1da177e4c3f415 Linus Torvalds 2005-04-16  298  
^1da177e4c3f415 Linus Torvalds 2005-04-16  299  /**
8ffaeaf42e91930 Thibaut Varene 2006-05-03  300   * pdc_chassis_disp - Updates chassis code
^1da177e4c3f415 Linus Torvalds 2005-04-16  301   * @retval: -1 on error, 0 on success
^1da177e4c3f415 Linus Torvalds 2005-04-16  302   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  303  int pdc_chassis_disp(unsigned long disp)
^1da177e4c3f415 Linus Torvalds 2005-04-16  304  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  305  	int retval = 0;
09690b18b7b9696 Kyle McMartin  2006-10-05  306  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  307  
09690b18b7b9696 Kyle McMartin  2006-10-05  308  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  309  	retval = mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_DISP, disp);
09690b18b7b9696 Kyle McMartin  2006-10-05  310  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  311  
^1da177e4c3f415 Linus Torvalds 2005-04-16  312  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  313  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  314  
507efd63d98c443 Sven Schnelle  2019-09-08  315  /**
507efd63d98c443 Sven Schnelle  2019-09-08  316   * pdc_cpu_rendenzvous - Stop currently executing CPU
507efd63d98c443 Sven Schnelle  2019-09-08  317   * @retval: -1 on error, 0 on success
507efd63d98c443 Sven Schnelle  2019-09-08  318   */
507efd63d98c443 Sven Schnelle  2019-09-08  319  int __pdc_cpu_rendezvous(void)
507efd63d98c443 Sven Schnelle  2019-09-08 @320  {
507efd63d98c443 Sven Schnelle  2019-09-08  321  	if (is_pdc_pat())
507efd63d98c443 Sven Schnelle  2019-09-08  322  		return mem_pdc_call(PDC_PAT_CPU, PDC_PAT_CPU_RENDEZVOUS);
507efd63d98c443 Sven Schnelle  2019-09-08  323  	else
507efd63d98c443 Sven Schnelle  2019-09-08  324  		return mem_pdc_call(PDC_PROC, 1, 0);
507efd63d98c443 Sven Schnelle  2019-09-08  325  }
507efd63d98c443 Sven Schnelle  2019-09-08  326  
507efd63d98c443 Sven Schnelle  2019-09-08  327  
8ffaeaf42e91930 Thibaut Varene 2006-05-03  328  /**
8ffaeaf42e91930 Thibaut Varene 2006-05-03  329   * pdc_chassis_warn - Fetches chassis warnings
8ffaeaf42e91930 Thibaut Varene 2006-05-03  330   * @retval: -1 on error, 0 on success
8ffaeaf42e91930 Thibaut Varene 2006-05-03  331   */
8ffaeaf42e91930 Thibaut Varene 2006-05-03  332  int pdc_chassis_warn(unsigned long *warn)
8ffaeaf42e91930 Thibaut Varene 2006-05-03  333  {
8ffaeaf42e91930 Thibaut Varene 2006-05-03  334  	int retval = 0;
09690b18b7b9696 Kyle McMartin  2006-10-05  335  	unsigned long flags;
8ffaeaf42e91930 Thibaut Varene 2006-05-03  336  
09690b18b7b9696 Kyle McMartin  2006-10-05  337  	spin_lock_irqsave(&pdc_lock, flags);
8ffaeaf42e91930 Thibaut Varene 2006-05-03  338  	retval = mem_pdc_call(PDC_CHASSIS, PDC_CHASSIS_WARN, __pa(pdc_result));
8ffaeaf42e91930 Thibaut Varene 2006-05-03  339  	*warn = pdc_result[0];
09690b18b7b9696 Kyle McMartin  2006-10-05  340  	spin_unlock_irqrestore(&pdc_lock, flags);
8ffaeaf42e91930 Thibaut Varene 2006-05-03  341  
8ffaeaf42e91930 Thibaut Varene 2006-05-03  342  	return retval;
8ffaeaf42e91930 Thibaut Varene 2006-05-03  343  }
8ffaeaf42e91930 Thibaut Varene 2006-05-03  344  
60ffef065dd40b9 Paul Gortmaker 2013-06-17  345  int pdc_coproc_cfg_unlocked(struct pdc_coproc_cfg *pdc_coproc_info)
24b574d052a1996 Kyle McMartin  2008-07-29  346  {
24b574d052a1996 Kyle McMartin  2008-07-29  347  	int ret;
24b574d052a1996 Kyle McMartin  2008-07-29  348  
24b574d052a1996 Kyle McMartin  2008-07-29  349  	ret = mem_pdc_call(PDC_COPROC, PDC_COPROC_CFG, __pa(pdc_result));
24b574d052a1996 Kyle McMartin  2008-07-29  350  	convert_to_wide(pdc_result);
24b574d052a1996 Kyle McMartin  2008-07-29  351  	pdc_coproc_info->ccr_functional = pdc_result[0];
24b574d052a1996 Kyle McMartin  2008-07-29  352  	pdc_coproc_info->ccr_present = pdc_result[1];
24b574d052a1996 Kyle McMartin  2008-07-29  353  	pdc_coproc_info->revision = pdc_result[17];
24b574d052a1996 Kyle McMartin  2008-07-29  354  	pdc_coproc_info->model = pdc_result[18];
24b574d052a1996 Kyle McMartin  2008-07-29  355  
24b574d052a1996 Kyle McMartin  2008-07-29  356  	return ret;
24b574d052a1996 Kyle McMartin  2008-07-29  357  }
24b574d052a1996 Kyle McMartin  2008-07-29  358  
^1da177e4c3f415 Linus Torvalds 2005-04-16  359  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  360   * pdc_coproc_cfg - To identify coprocessors attached to the processor.
^1da177e4c3f415 Linus Torvalds 2005-04-16  361   * @pdc_coproc_info: Return buffer address.
^1da177e4c3f415 Linus Torvalds 2005-04-16  362   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  363   * This PDC call returns the presence and status of all the coprocessors
^1da177e4c3f415 Linus Torvalds 2005-04-16  364   * attached to the processor.
^1da177e4c3f415 Linus Torvalds 2005-04-16  365   */
60ffef065dd40b9 Paul Gortmaker 2013-06-17  366  int pdc_coproc_cfg(struct pdc_coproc_cfg *pdc_coproc_info)
^1da177e4c3f415 Linus Torvalds 2005-04-16  367  {
24b574d052a1996 Kyle McMartin  2008-07-29  368  	int ret;
09690b18b7b9696 Kyle McMartin  2006-10-05  369  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  370  
09690b18b7b9696 Kyle McMartin  2006-10-05  371  	spin_lock_irqsave(&pdc_lock, flags);
24b574d052a1996 Kyle McMartin  2008-07-29  372  	ret = pdc_coproc_cfg_unlocked(pdc_coproc_info);
09690b18b7b9696 Kyle McMartin  2006-10-05  373  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  374  
24b574d052a1996 Kyle McMartin  2008-07-29  375  	return ret;
^1da177e4c3f415 Linus Torvalds 2005-04-16  376  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  377  
^1da177e4c3f415 Linus Torvalds 2005-04-16  378  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  379   * pdc_iodc_read - Read data from the modules IODC.
^1da177e4c3f415 Linus Torvalds 2005-04-16  380   * @actcnt: The actual number of bytes.
^1da177e4c3f415 Linus Torvalds 2005-04-16  381   * @hpa: The HPA of the module for the iodc read.
^1da177e4c3f415 Linus Torvalds 2005-04-16  382   * @index: The iodc entry point.
^1da177e4c3f415 Linus Torvalds 2005-04-16  383   * @iodc_data: A buffer memory for the iodc options.
^1da177e4c3f415 Linus Torvalds 2005-04-16  384   * @iodc_data_size: Size of the memory buffer.
^1da177e4c3f415 Linus Torvalds 2005-04-16  385   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  386   * This PDC call reads from the IODC of the module specified by the hpa
^1da177e4c3f415 Linus Torvalds 2005-04-16  387   * argument.
^1da177e4c3f415 Linus Torvalds 2005-04-16  388   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  389  int pdc_iodc_read(unsigned long *actcnt, unsigned long hpa, unsigned int index,
^1da177e4c3f415 Linus Torvalds 2005-04-16  390  		  void *iodc_data, unsigned int iodc_data_size)
^1da177e4c3f415 Linus Torvalds 2005-04-16  391  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  392  	int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  393  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  394  
09690b18b7b9696 Kyle McMartin  2006-10-05  395  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  396  	retval = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, 
^1da177e4c3f415 Linus Torvalds 2005-04-16  397  			      index, __pa(pdc_result2), iodc_data_size);
^1da177e4c3f415 Linus Torvalds 2005-04-16  398  	convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  399  	*actcnt = pdc_result[0];
^1da177e4c3f415 Linus Torvalds 2005-04-16  400  	memcpy(iodc_data, pdc_result2, iodc_data_size);
09690b18b7b9696 Kyle McMartin  2006-10-05  401  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  402  
^1da177e4c3f415 Linus Torvalds 2005-04-16  403  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  404  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  405  EXPORT_SYMBOL(pdc_iodc_read);
^1da177e4c3f415 Linus Torvalds 2005-04-16  406  
^1da177e4c3f415 Linus Torvalds 2005-04-16  407  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  408   * pdc_system_map_find_mods - Locate unarchitected modules.
^1da177e4c3f415 Linus Torvalds 2005-04-16  409   * @pdc_mod_info: Return buffer address.
^1da177e4c3f415 Linus Torvalds 2005-04-16  410   * @mod_path: pointer to dev path structure.
^1da177e4c3f415 Linus Torvalds 2005-04-16  411   * @mod_index: fixed address module index.
^1da177e4c3f415 Linus Torvalds 2005-04-16  412   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  413   * To locate and identify modules which reside at fixed I/O addresses, which
^1da177e4c3f415 Linus Torvalds 2005-04-16  414   * do not self-identify via architected bus walks.
^1da177e4c3f415 Linus Torvalds 2005-04-16  415   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  416  int pdc_system_map_find_mods(struct pdc_system_map_mod_info *pdc_mod_info,
^1da177e4c3f415 Linus Torvalds 2005-04-16  417  			     struct pdc_module_path *mod_path, long mod_index)
^1da177e4c3f415 Linus Torvalds 2005-04-16  418  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  419  	int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  420  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  421  
09690b18b7b9696 Kyle McMartin  2006-10-05  422  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  423  	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_MODULE, __pa(pdc_result), 
^1da177e4c3f415 Linus Torvalds 2005-04-16  424  			      __pa(pdc_result2), mod_index);
^1da177e4c3f415 Linus Torvalds 2005-04-16  425  	convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  426  	memcpy(pdc_mod_info, pdc_result, sizeof(*pdc_mod_info));
^1da177e4c3f415 Linus Torvalds 2005-04-16  427  	memcpy(mod_path, pdc_result2, sizeof(*mod_path));
09690b18b7b9696 Kyle McMartin  2006-10-05  428  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  429  
^1da177e4c3f415 Linus Torvalds 2005-04-16  430  	pdc_mod_info->mod_addr = f_extend(pdc_mod_info->mod_addr);
^1da177e4c3f415 Linus Torvalds 2005-04-16  431  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  432  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  433  
^1da177e4c3f415 Linus Torvalds 2005-04-16  434  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  435   * pdc_system_map_find_addrs - Retrieve additional address ranges.
^1da177e4c3f415 Linus Torvalds 2005-04-16  436   * @pdc_addr_info: Return buffer address.
^1da177e4c3f415 Linus Torvalds 2005-04-16  437   * @mod_index: Fixed address module index.
^1da177e4c3f415 Linus Torvalds 2005-04-16  438   * @addr_index: Address range index.
^1da177e4c3f415 Linus Torvalds 2005-04-16  439   * 
^1da177e4c3f415 Linus Torvalds 2005-04-16  440   * Retrieve additional information about subsequent address ranges for modules
^1da177e4c3f415 Linus Torvalds 2005-04-16  441   * with multiple address ranges.  
^1da177e4c3f415 Linus Torvalds 2005-04-16  442   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  443  int pdc_system_map_find_addrs(struct pdc_system_map_addr_info *pdc_addr_info, 
^1da177e4c3f415 Linus Torvalds 2005-04-16  444  			      long mod_index, long addr_index)
^1da177e4c3f415 Linus Torvalds 2005-04-16  445  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  446  	int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  447  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  448  
09690b18b7b9696 Kyle McMartin  2006-10-05  449  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  450  	retval = mem_pdc_call(PDC_SYSTEM_MAP, PDC_FIND_ADDRESS, __pa(pdc_result),
^1da177e4c3f415 Linus Torvalds 2005-04-16  451  			      mod_index, addr_index);
^1da177e4c3f415 Linus Torvalds 2005-04-16  452  	convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  453  	memcpy(pdc_addr_info, pdc_result, sizeof(*pdc_addr_info));
09690b18b7b9696 Kyle McMartin  2006-10-05  454  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  455  
^1da177e4c3f415 Linus Torvalds 2005-04-16  456  	pdc_addr_info->mod_addr = f_extend(pdc_addr_info->mod_addr);
^1da177e4c3f415 Linus Torvalds 2005-04-16  457  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  458  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  459  
^1da177e4c3f415 Linus Torvalds 2005-04-16  460  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  461   * pdc_model_info - Return model information about the processor.
^1da177e4c3f415 Linus Torvalds 2005-04-16  462   * @model: The return buffer.
^1da177e4c3f415 Linus Torvalds 2005-04-16  463   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  464   * Returns the version numbers, identifiers, and capabilities from the processor module.
^1da177e4c3f415 Linus Torvalds 2005-04-16  465   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  466  int pdc_model_info(struct pdc_model *model) 
^1da177e4c3f415 Linus Torvalds 2005-04-16  467  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  468  	int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  469  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  470  
09690b18b7b9696 Kyle McMartin  2006-10-05  471  	spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  472  	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_INFO, __pa(pdc_result), 0);
^1da177e4c3f415 Linus Torvalds 2005-04-16  473  	convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  474  	memcpy(model, pdc_result, sizeof(*model));
09690b18b7b9696 Kyle McMartin  2006-10-05  475  	spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  476  
^1da177e4c3f415 Linus Torvalds 2005-04-16  477  	return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  478  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  479  
^1da177e4c3f415 Linus Torvalds 2005-04-16  480  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  481   * pdc_model_sysmodel - Get the system model name.
^1da177e4c3f415 Linus Torvalds 2005-04-16  482   * @name: A char array of at least 81 characters.
^1da177e4c3f415 Linus Torvalds 2005-04-16  483   *
ec1fdc24c2ae012 Kyle McMartin  2006-06-21  484   * Get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L).
ec1fdc24c2ae012 Kyle McMartin  2006-06-21  485   * Using OS_ID_HPUX will return the equivalent of the 'modelname' command
ec1fdc24c2ae012 Kyle McMartin  2006-06-21  486   * on HP/UX.
^1da177e4c3f415 Linus Torvalds 2005-04-16  487   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  488  int pdc_model_sysmodel(char *name)
^1da177e4c3f415 Linus Torvalds 2005-04-16  489  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  490          int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  491  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  492  
09690b18b7b9696 Kyle McMartin  2006-10-05  493          spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  494          retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_SYSMODEL, __pa(pdc_result),
^1da177e4c3f415 Linus Torvalds 2005-04-16  495                                OS_ID_HPUX, __pa(name));
^1da177e4c3f415 Linus Torvalds 2005-04-16  496          convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  497  
^1da177e4c3f415 Linus Torvalds 2005-04-16  498          if (retval == PDC_OK) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  499                  name[pdc_result[0]] = '\0'; /* add trailing '\0' */
^1da177e4c3f415 Linus Torvalds 2005-04-16  500          } else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  501                  name[0] = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  502          }
09690b18b7b9696 Kyle McMartin  2006-10-05  503          spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  504  
^1da177e4c3f415 Linus Torvalds 2005-04-16  505          return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  506  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  507  
^1da177e4c3f415 Linus Torvalds 2005-04-16  508  /**
^1da177e4c3f415 Linus Torvalds 2005-04-16  509   * pdc_model_versions - Identify the version number of each processor.
^1da177e4c3f415 Linus Torvalds 2005-04-16  510   * @cpu_id: The return buffer.
^1da177e4c3f415 Linus Torvalds 2005-04-16  511   * @id: The id of the processor to check.
^1da177e4c3f415 Linus Torvalds 2005-04-16  512   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  513   * Returns the version number for each processor component.
^1da177e4c3f415 Linus Torvalds 2005-04-16  514   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  515   * This comment was here before, but I do not know what it means :( -RB
^1da177e4c3f415 Linus Torvalds 2005-04-16  516   * id: 0 = cpu revision, 1 = boot-rom-version
^1da177e4c3f415 Linus Torvalds 2005-04-16  517   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  518  int pdc_model_versions(unsigned long *versions, int id)
^1da177e4c3f415 Linus Torvalds 2005-04-16 @519  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  520          int retval;
09690b18b7b9696 Kyle McMartin  2006-10-05  521  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  522  
09690b18b7b9696 Kyle McMartin  2006-10-05  523          spin_lock_irqsave(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  524          retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_VERSIONS, __pa(pdc_result), id);
^1da177e4c3f415 Linus Torvalds 2005-04-16  525          convert_to_wide(pdc_result);
^1da177e4c3f415 Linus Torvalds 2005-04-16  526          *versions = pdc_result[0];
09690b18b7b9696 Kyle McMartin  2006-10-05  527          spin_unlock_irqrestore(&pdc_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  528  
^1da177e4c3f415 Linus Torvalds 2005-04-16  529          return retval;
^1da177e4c3f415 Linus Torvalds 2005-04-16  530  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  531  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bp/iNruPH9dso1Pn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--bp/iNruPH9dso1Pn--
