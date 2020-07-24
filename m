Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADBB22C385
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 12:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgGXKpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 06:45:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:55129 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgGXKpb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 06:45:31 -0400
IronPort-SDR: heMNfQcFEmKsxeIs5V1DE+F1yvgJaJ1TErtwHrxfXZAG4qs4Oy3QsGzQk8a/hYYZpDwYdG8Jd+
 juwIVGtBuDSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="138752531"
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; 
   d="gz'50?scan'50,208,50";a="138752531"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2020 03:42:52 -0700
IronPort-SDR: J95nM/4ejT5MtInCaOau8JRCxdSi4c4XOisGYjW58RAamgYNxz5scaagQo0U+msiwEF9lHlwSr
 0TKSqVCmknhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; 
   d="gz'50?scan'50,208,50";a="284899273"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jul 2020 03:42:49 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jyvA9-0000Fk-1i; Fri, 24 Jul 2020 10:42:49 +0000
Date:   Fri, 24 Jul 2020 18:41:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6:
 warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_init'
Message-ID: <202007241835.GC2DpXzO%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f37e99aca03f63aa3f2bd13ceaf769455d12c4b0
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   6 weeks ago
config: i386-randconfig-r032-20200724 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
reproduce (this is a W=1 build):
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6: warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_init' [-Wmissing-prototypes]
      34 | void ia_css_isys_ibuf_rmgr_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:6: warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_uninit' [-Wmissing-prototypes]
      40 | void ia_css_isys_ibuf_rmgr_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:6: warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_acquire' [-Wmissing-prototypes]
      46 | bool ia_css_isys_ibuf_rmgr_acquire(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:6: warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_release' [-Wmissing-prototypes]
     106 | void ia_css_isys_ibuf_rmgr_release(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/input_system_local.h:10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_include/input_system.h:34,
                    from drivers/staging/media/atomisp//pci/runtime/isys/interface/ia_css_isys.h:20,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:20:
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:402:26: warning: 'SUB_SYSTEM_OFFSET' defined but not used [-Wunused-const-variable=]
     402 | static const hrt_address SUB_SYSTEM_OFFSET[N_SUB_SYSTEM_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:391:30: warning: 'MIPI_PORT_LANES' defined but not used [-Wunused-const-variable=]
     391 | static const mipi_lane_cfg_t MIPI_PORT_LANES[N_RX_MODE][N_MIPI_PORT_ID] = {
         |                              ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:380:19: warning: 'MIPI_PORT_ACTIVE' defined but not used [-Wunused-const-variable=]
     380 | static const bool MIPI_PORT_ACTIVE[N_RX_MODE][N_MIPI_PORT_ID] = {
         |                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:374:30: warning: 'MIPI_PORT_MAXLANES' defined but not used [-Wunused-const-variable=]
     374 | static const mipi_lane_cfg_t MIPI_PORT_MAXLANES[N_MIPI_PORT_ID] = {
         |                              ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:368:26: warning: 'MIPI_PORT_OFFSET' defined but not used [-Wunused-const-variable=]
     368 | static const hrt_address MIPI_PORT_OFFSET[N_MIPI_PORT_ID] = {
         |                          ^~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_include/input_system.h:33,
                    from drivers/staging/media/atomisp//pci/runtime/isys/interface/ia_css_isys.h:20,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:20:
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:178:26: warning: 'RX_BASE' defined but not used [-Wunused-const-variable=]
     178 | static const hrt_address RX_BASE[N_RX_ID] = {
         |                          ^~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:163:26: warning: 'INPUT_SYSTEM_BASE' defined but not used [-Wunused-const-variable=]
     163 | static const hrt_address INPUT_SYSTEM_BASE[N_INPUT_SYSTEM_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:155:26: warning: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=]
     155 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:150:26: warning: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     150 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:145:26: warning: 'GPIO_BASE' defined but not used [-Wunused-const-variable=]
     145 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:142:26: warning: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=]
     142 | static const hrt_address GP_TIMER_BASE =
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:135:26: warning: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=]
     135 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:122:26: warning: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=]
     122 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:116:26: warning: 'GDC_BASE' defined but not used [-Wunused-const-variable=]
     116 | static const hrt_address GDC_BASE[N_GDC_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:104:26: warning: 'IRQ_BASE' defined but not used [-Wunused-const-variable=]
     104 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:99:26: warning: 'DMA_BASE' defined but not used [-Wunused-const-variable=]
      99 | static const hrt_address DMA_BASE[N_DMA_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:90:26: warning: 'MMU_BASE' defined but not used [-Wunused-const-variable=]
      90 | static const hrt_address MMU_BASE[N_MMU_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:80:26: warning: 'SP_PMEM_BASE' defined but not used [-Wunused-const-variable=]
      80 | static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:76:26: warning: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      76 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:72:26: warning: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      72 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:67:26: warning: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=]
      67 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:61:26: warning: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=]
      61 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:57:26: warning: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=]
      57 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:53:26: warning: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      53 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:49:26: warning: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      49 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:44:26: warning: 'DDR_BASE' defined but not used [-Wunused-const-variable=]
      44 | static const hrt_address DDR_BASE[N_DDR_ID] = {
         |                          ^~~~~~~~
--
   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: In function 'ia_css_isys_rx_configure':
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:488:7: warning: variable 'port_enabled' set but not used [-Wunused-but-set-variable]
     488 |  bool port_enabled[N_MIPI_PORT_ID];
         |       ^~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_include/input_formatter.h:34,
                    from drivers/staging/media/atomisp//pci/sh_css_internal.h:26,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:21:
   At top level:
   drivers/staging/media/atomisp//pci/hive_isp_css_common/host/input_formatter_local.h:118:27: warning: 'input_formatter_alignment' defined but not used [-Wunused-const-variable=]
     118 | static const unsigned int input_formatter_alignment[N_INPUT_FORMATTER_ID] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/input_system_local.h:10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_include/input_system.h:34,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:17:
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:380:19: warning: 'MIPI_PORT_ACTIVE' defined but not used [-Wunused-const-variable=]
     380 | static const bool MIPI_PORT_ACTIVE[N_RX_MODE][N_MIPI_PORT_ID] = {
         |                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:374:30: warning: 'MIPI_PORT_MAXLANES' defined but not used [-Wunused-const-variable=]
     374 | static const mipi_lane_cfg_t MIPI_PORT_MAXLANES[N_MIPI_PORT_ID] = {
         |                              ^~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_include/input_system.h:33,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:17:
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:155:26: warning: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=]
     155 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_ID] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:150:26: warning: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=]
     150 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] = {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:145:26: warning: 'GPIO_BASE' defined but not used [-Wunused-const-variable=]
     145 | static const hrt_address GPIO_BASE[N_GPIO_ID] = {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:142:26: warning: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=]
     142 | static const hrt_address GP_TIMER_BASE =
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:135:26: warning: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=]
     135 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:122:26: warning: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=]
     122 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] = {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:116:26: warning: 'GDC_BASE' defined but not used [-Wunused-const-variable=]
     116 | static const hrt_address GDC_BASE[N_GDC_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:104:26: warning: 'IRQ_BASE' defined but not used [-Wunused-const-variable=]
     104 | static const hrt_address IRQ_BASE[N_IRQ_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:99:26: warning: 'DMA_BASE' defined but not used [-Wunused-const-variable=]
      99 | static const hrt_address DMA_BASE[N_DMA_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:90:26: warning: 'MMU_BASE' defined but not used [-Wunused-const-variable=]
      90 | static const hrt_address MMU_BASE[N_MMU_ID] = {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:80:26: warning: 'SP_PMEM_BASE' defined but not used [-Wunused-const-variable=]
      80 | static const hrt_address SP_PMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:76:26: warning: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      76 | static const hrt_address SP_DMEM_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:72:26: warning: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      72 | static const hrt_address SP_CTRL_BASE[N_SP_ID] = {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:67:26: warning: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=]
      67 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:61:26: warning: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=]
      61 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:57:26: warning: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=]
      57 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] = {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:53:26: warning: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=]
      53 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:49:26: warning: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=]
      49 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] = {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:44:26: warning: 'DDR_BASE' defined but not used [-Wunused-const-variable=]
      44 | static const hrt_address DDR_BASE[N_DDR_ID] = {
         |                          ^~~~~~~~

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

--NzB8fVQJ5HfG6fxh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AOfub9Ojij79Hbcr+XT0f6FWrdw05gEA

--NzB8fVQJ5HfG6fxh--
