Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67F7232796
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 00:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgG2WZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 18:25:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:23745 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgG2WZp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 18:25:45 -0400
IronPort-SDR: VP+cldvVRy7ZHMfgljSCTbu8FFm1zmAheWC9Bwsu/BsurGSzWCrDUGm8yJytTdvBqMA2UnNG+R
 Fhfs+W2gxrGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="139512501"
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="gz'50?scan'50,208,50";a="139512501"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 15:25:23 -0700
IronPort-SDR: MhIjUlssu7qWCJmyc/Q+QspVS4Jcd919UwmnHVBb2DGTL82JB5Mbee/yR9u31dJjcfaDXjtMTR
 rzIiq2+F8IjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="gz'50?scan'50,208,50";a="304366709"
Received: from lkp-server02.sh.intel.com (HELO 1bde1f275adc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Jul 2020 15:25:20 -0700
Received: from kbuild by 1bde1f275adc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k0uVj-0000FB-HP; Wed, 29 Jul 2020 22:25:19 +0000
Date:   Thu, 30 Jul 2020 06:24:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/atomisp_cmd.c:2805:31: warning:
 variable 'stream_config' set but not used
Message-ID: <202007300622.EcWcN87r%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6ba1b005ffc388c2aeaddae20da29e4810dea298
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   7 weeks ago
config: i386-randconfig-r016-20200729 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce (this is a W=1 build):
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_get_metadata':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:2805:31: warning: variable 'stream_config' set but not used [-Wunused-but-set-variable]
    2805 |  struct ia_css_stream_config *stream_config;
         |                               ^~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_get_metadata_by_type':
   drivers/staging/media/atomisp/pci/atomisp_cmd.c:2884:31: warning: variable 'stream_config' set but not used [-Wunused-but-set-variable]
    2884 |  struct ia_css_stream_config *stream_config;
         |                               ^~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:8,
                    from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:23,
                    from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
                    from drivers/staging/media/atomisp/pci/sh_css_legacy.h:23,
                    from drivers/staging/media/atomisp/pci/atomisp_internal.h:34,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:30,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.c:37:
   At top level:
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:217:26: warning: 'STREAM2MMIO_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     217 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:210:26: warning: 'PIXELGEN_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     210 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:203:26: warning: 'CSI_RX_BE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     203 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:196:26: warning: 'CSI_RX_FE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     196 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:189:26: warning: 'ISYS_IRQ_BASE' defined but not used [-Wunused-const-variable=]
     189 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:182:26: warning: 'IBUF_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     182 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:177:26: warning: 'RX_BASE' defined but not used [-Wunused-const-variable=]
     177 | static const hrt_address RX_BASE[N_RX_ID] = {
         |                          ^~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:162:26: warning: 'INPUT_SYSTEM_BASE' defined but not used [-Wunused-const-variable=]
     162 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:154:26: warning: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=]
     154 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:149:26: warning: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     149 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:144:26: warning: 'GPIO_BASE' defined but not used [-Wunused-const-variable=]
     144 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:140:26: warning: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=]
     140 | static const hrt_address GP_TIMER_BASE =
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:133:26: warning: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=]
     133 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:120:26: warning: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=]
     120 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:114:26: warning: 'GDC_BASE' defined but not used [-Wunused-const-variable=]
     114 | static const hrt_address GDC_BASE[N_GDC_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:102:26: warning: 'IRQ_BASE' defined but not used [-Wunused-const-variable=]
     102 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:97:26: warning: 'ISYS2401_DMA_BASE' defined but not used [-Wunused-const-variable=]
      97 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:93:26: warning: 'DMA_BASE' defined but not used [-Wunused-const-variable=]
      93 | static const hrt_address DMA_BASE[N_DMA_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:84:26: warning: 'MMU_BASE' defined but not used [-Wunused-const-variable=]
      84 | static const hrt_address MMU_BASE[N_MMU_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:74:26: warning: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      74 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:70:26: warning: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      70 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:65:26: warning: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=]
      65 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:59:26: warning: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=]
      59 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:55:26: warning: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=]
      55 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:51:26: warning: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      51 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:47:26: warning: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      47 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:42:26: warning: 'DDR_BASE' defined but not used [-Wunused-const-variable=]
      42 | static const hrt_address DDR_BASE[N_DDR_ID] = {
         |                          ^~~~~~~~
--
   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css2_dbg_print':
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:159:2: warning: function 'atomisp_css2_dbg_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     159 |  vprintk(fmt, args);
         |  ^~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css2_dbg_ftrace_print':
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:165:2: warning: function 'atomisp_css2_dbg_ftrace_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     165 |  ftrace_vprintk(fmt, args);
         |  ^~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:165:2: warning: function 'atomisp_css2_dbg_ftrace_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
   drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css2_err_print':
>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:171:2: warning: function 'atomisp_css2_err_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     171 |  vprintk(fmt, args);
         |  ^~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:8,
                    from drivers/staging/media/atomisp/pci/ia_css_acc_types.h:23,
                    from drivers/staging/media/atomisp/pci/ia_css.h:26,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.h:24,
                    from drivers/staging/media/atomisp/pci/atomisp_compat.h:22,
                    from drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:28:
   At top level:
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:217:26: warning: 'STREAM2MMIO_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     217 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:210:26: warning: 'PIXELGEN_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     210 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:203:26: warning: 'CSI_RX_BE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     203 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:196:26: warning: 'CSI_RX_FE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     196 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:189:26: warning: 'ISYS_IRQ_BASE' defined but not used [-Wunused-const-variable=]
     189 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:182:26: warning: 'IBUF_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     182 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:177:26: warning: 'RX_BASE' defined but not used [-Wunused-const-variable=]
     177 | static const hrt_address RX_BASE[N_RX_ID] = {
         |                          ^~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:162:26: warning: 'INPUT_SYSTEM_BASE' defined but not used [-Wunused-const-variable=]
     162 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:154:26: warning: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=]
     154 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:149:26: warning: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     149 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:144:26: warning: 'GPIO_BASE' defined but not used [-Wunused-const-variable=]
     144 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:140:26: warning: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=]
     140 | static const hrt_address GP_TIMER_BASE =
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:133:26: warning: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=]
     133 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:120:26: warning: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=]
     120 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:114:26: warning: 'GDC_BASE' defined but not used [-Wunused-const-variable=]
     114 | static const hrt_address GDC_BASE[N_GDC_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:102:26: warning: 'IRQ_BASE' defined but not used [-Wunused-const-variable=]
     102 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:97:26: warning: 'ISYS2401_DMA_BASE' defined but not used [-Wunused-const-variable=]
      97 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:93:26: warning: 'DMA_BASE' defined but not used [-Wunused-const-variable=]
      93 | static const hrt_address DMA_BASE[N_DMA_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:84:26: warning: 'MMU_BASE' defined but not used [-Wunused-const-variable=]
      84 | static const hrt_address MMU_BASE[N_MMU_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:74:26: warning: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      74 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:70:26: warning: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      70 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:65:26: warning: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=]
      65 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:59:26: warning: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=]
      59 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:55:26: warning: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=]
      55 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:51:26: warning: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      51 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:47:26: warning: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      47 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:42:26: warning: 'DDR_BASE' defined but not used [-Wunused-const-variable=]
      42 | static const hrt_address DDR_BASE[N_DDR_ID] = {
         |                          ^~~~~~~~
--
   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
   drivers/staging/media/atomisp/pci/atomisp_v4l2.c: In function 'is_valid_device':
>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1499:15: warning: variable 'a0_max_id' set but not used [-Wunused-but-set-variable]
    1499 |  unsigned int a0_max_id = 0;
         |               ^~~~~~~~~
   At top level:
   drivers/staging/media/atomisp/pci/atomisp_v4l2.c:769:12: warning: 'atomisp_mrfld_power' defined but not used [-Wunused-function]
     769 | static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_v4l2.c:395:40: warning: 'dfs_config_byt_cr' defined but not used [-Wunused-const-variable=]
     395 | static const struct atomisp_dfs_config dfs_config_byt_cr = {
         |                                        ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:8,
                    from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:23,
                    from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
                    from drivers/staging/media/atomisp/pci/sh_css_legacy.h:23,
                    from drivers/staging/media/atomisp/pci/atomisp_internal.h:34,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:30,
                    from drivers/staging/media/atomisp/pci/atomisp_v4l2.c:33:
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:217:26: warning: 'STREAM2MMIO_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     217 | static const hrt_address STREAM2MMIO_CTRL_BASE[N_STREAM2MMIO_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:210:26: warning: 'PIXELGEN_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     210 | static const hrt_address PIXELGEN_CTRL_BASE[N_PIXELGEN_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:203:26: warning: 'CSI_RX_BE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     203 | static const hrt_address CSI_RX_BE_CTRL_BASE[N_CSI_RX_BACKEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:196:26: warning: 'CSI_RX_FE_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     196 | static const hrt_address CSI_RX_FE_CTRL_BASE[N_CSI_RX_FRONTEND_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:189:26: warning: 'ISYS_IRQ_BASE' defined but not used [-Wunused-const-variable=]
     189 | static const hrt_address ISYS_IRQ_BASE[N_ISYS_IRQ_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:182:26: warning: 'IBUF_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     182 | static const hrt_address IBUF_CTRL_BASE[N_IBUF_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:177:26: warning: 'RX_BASE' defined but not used [-Wunused-const-variable=]
     177 | static const hrt_address RX_BASE[N_RX_ID] = {
         |                          ^~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:162:26: warning: 'INPUT_SYSTEM_BASE' defined but not used [-Wunused-const-variable=]
     162 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:154:26: warning: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=]
     154 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:149:26: warning: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     149 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:144:26: warning: 'GPIO_BASE' defined but not used [-Wunused-const-variable=]
     144 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:140:26: warning: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=]
     140 | static const hrt_address GP_TIMER_BASE =
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:133:26: warning: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=]
     133 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:120:26: warning: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=]
     120 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:114:26: warning: 'GDC_BASE' defined but not used [-Wunused-const-variable=]
     114 | static const hrt_address GDC_BASE[N_GDC_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:102:26: warning: 'IRQ_BASE' defined but not used [-Wunused-const-variable=]
     102 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:97:26: warning: 'ISYS2401_DMA_BASE' defined but not used [-Wunused-const-variable=]
      97 | static const hrt_address ISYS2401_DMA_BASE[N_ISYS2401_DMA_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:93:26: warning: 'DMA_BASE' defined but not used [-Wunused-const-variable=]
      93 | static const hrt_address DMA_BASE[N_DMA_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:84:26: warning: 'MMU_BASE' defined but not used [-Wunused-const-variable=]
      84 | static const hrt_address MMU_BASE[N_MMU_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:74:26: warning: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      74 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:70:26: warning: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      70 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:65:26: warning: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=]
      65 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:59:26: warning: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=]
      59 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:55:26: warning: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=]
      55 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:51:26: warning: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      51 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:47:26: warning: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      47 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2401_system_local.h:42:26: warning: 'DDR_BASE' defined but not used [-Wunused-const-variable=]
      42 | static const hrt_address DDR_BASE[N_DDR_ID] = {
         |                          ^~~~~~~~
..

vim +/stream_config +2805 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2800  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2801  int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2802  			 struct atomisp_metadata *md)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2803  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2804  	struct atomisp_device *isp = asd->isp;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @2805  	struct ia_css_stream_config *stream_config;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2806  	struct ia_css_stream_info *stream_info;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2807  	struct camera_mipi_info *mipi_info;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2808  	struct atomisp_metadata_buf *md_buf;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2809  	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2810  	int ret, i;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2811  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2812  	if (flag != 0)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2813  		return -EINVAL;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2814  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2815  	stream_config = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2816  			stream_config;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2817  	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2818  		      stream_info;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2819  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2820  	/* We always return the resolution and stride even if there is
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2821  	 * no valid metadata. This allows the caller to get the information
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2822  	 * needed to allocate user-space buffers. */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2823  	md->width  = stream_info->metadata_info.resolution.width;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2824  	md->height = stream_info->metadata_info.resolution.height;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2825  	md->stride = stream_info->metadata_info.stride;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2826  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2827  	/* sanity check to avoid writing into unallocated memory.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2828  	 * This does not return an error because it is a valid way
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2829  	 * for applications to detect that metadata is not enabled. */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2830  	if (md->width == 0 || md->height == 0 || !md->data)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2831  		return 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2832  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2833  	/* This is done in the atomisp_buf_done() */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2834  	if (list_empty(&asd->metadata_ready[md_type])) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2835  		dev_warn(isp->dev, "Metadata queue is empty now!\n");
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2836  		return -EAGAIN;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2837  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2838  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2839  	mipi_info = atomisp_to_sensor_mipi_info(
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2840  			isp->inputs[asd->input_curr].camera);
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2841  	if (!mipi_info)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2842  		return -EINVAL;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2843  
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2844  	if (mipi_info->metadata_effective_width) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2845  		for (i = 0; i < md->height; i++)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2846  			md->effective_width[i] =
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2847  			    mipi_info->metadata_effective_width[i];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2848  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2849  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2850  	md_buf = list_entry(asd->metadata_ready[md_type].next,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2851  			    struct atomisp_metadata_buf, list);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2852  	md->exp_id = md_buf->metadata->exp_id;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2853  	if (md_buf->md_vptr) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2854  		ret = copy_to_user(md->data,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2855  				   md_buf->md_vptr,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2856  				   stream_info->metadata_info.size);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2857  	} else {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2858  		hmm_load(md_buf->metadata->address,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2859  			 asd->params.metadata_user[md_type],
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2860  			 stream_info->metadata_info.size);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2861  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2862  		ret = copy_to_user(md->data,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2863  				   asd->params.metadata_user[md_type],
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2864  				   stream_info->metadata_info.size);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2865  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2866  	if (ret) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2867  		dev_err(isp->dev, "copy to user failed: copied %d bytes\n",
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2868  			ret);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2869  		return -EFAULT;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2870  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2871  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2872  	list_del_init(&md_buf->list);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2873  	list_add_tail(&md_buf->list, &asd->metadata[md_type]);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2874  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2875  	dev_dbg(isp->dev, "%s: HAL de-queued metadata type %d with exp_id %d\n",
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2876  		__func__, md_type, md->exp_id);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2877  	return 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2878  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2879  

:::::: The code at line 2805 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--3V7upXqbjpZ4EhLz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--3V7upXqbjpZ4EhLz--
