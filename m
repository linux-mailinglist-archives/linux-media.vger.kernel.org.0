Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EBA2D3C78
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 08:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgLIHrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 02:47:46 -0500
Received: from mga09.intel.com ([134.134.136.24]:7730 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgLIHrp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 02:47:45 -0500
IronPort-SDR: NShkaSr5BKcd8e4S+sYVIx7XhxJgg4dMw3wn6g64sCXV7z+da5noyOdy6X6gq97qfZsMSqYOUH
 xIc/7fyRLB+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174181053"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
   d="gz'50?scan'50,208,50";a="174181053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 23:47:02 -0800
IronPort-SDR: YbknlJtpACPU5WB+VA7A/g+aqmbTM3hmDTUIilI/B2FkEy6hnbMWNLm39IG0AcuQRarVwuza/h
 niHm0X5J8hbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
   d="gz'50?scan'50,208,50";a="364032308"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Dec 2020 23:47:00 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmuBg-00008c-2d; Wed, 09 Dec 2020 07:47:00 +0000
Date:   Wed, 9 Dec 2020 15:46:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6:
 warning: no previous prototype for 'ia_css_isys_ibuf_rmgr_init'
Message-ID: <202012091523.M52EmcGj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a68a0262abdaa251e12c53715f48e698a18ef402
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   6 months ago
config: i386-randconfig-a003-20200826 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5b552b198c2557295becd471bff53bb520fefee5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
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

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   33  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @34  void ia_css_isys_ibuf_rmgr_init(void)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   35  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   36  	memset(&ibuf_rsrc, 0, sizeof(ibuf_rsrc));
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   37  	ibuf_rsrc.free_size = MAX_INPUT_BUFFER_SIZE;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   38  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   39  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @40  void ia_css_isys_ibuf_rmgr_uninit(void)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   41  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   42  	memset(&ibuf_rsrc, 0, sizeof(ibuf_rsrc));
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   43  	ibuf_rsrc.free_size = MAX_INPUT_BUFFER_SIZE;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   44  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   45  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  @46  bool ia_css_isys_ibuf_rmgr_acquire(
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   47      u32	size,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   48      uint32_t	*start_addr)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   49  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   50  	bool retval = false;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   51  	bool input_buffer_found = false;
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   52  	u32 aligned_size;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   53  	ibuf_handle_t *handle = NULL;
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   54  	u16 i;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   55  
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   56  	assert(start_addr);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   57  	assert(size > 0);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   58  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   59  	aligned_size = (size + (IBUF_ALIGN - 1)) & ~(IBUF_ALIGN - 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   60  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   61  	/* Check if there is an available un-used handle with the size
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   62  	 * that will fulfill the request.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   63  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   64  	if (ibuf_rsrc.num_active < ibuf_rsrc.num_allocated) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   65  		for (i = 0; i < ibuf_rsrc.num_allocated; i++) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   66  			handle = getHandle(i);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   67  			if (!handle->active) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   68  				if (handle->size >= aligned_size) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   69  					handle->active = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   70  					input_buffer_found = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   71  					ibuf_rsrc.num_active++;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   72  					break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   73  				}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   74  			}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   75  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   76  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   77  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   78  	if (!input_buffer_found) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   79  		/* There were no available handles that fulfilled the
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   80  		 * request. Allocate a new handle with the requested size.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   81  		 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   82  		if ((ibuf_rsrc.num_allocated < MAX_IBUF_HANDLES) &&
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   83  		    (ibuf_rsrc.free_size >= aligned_size)) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   84  			handle = getHandle(ibuf_rsrc.num_allocated);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   85  			handle->start_addr	= ibuf_rsrc.free_start_addr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   86  			handle->size		= aligned_size;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   87  			handle->active		= true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   88  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   89  			ibuf_rsrc.free_start_addr += aligned_size;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   90  			ibuf_rsrc.free_size -= aligned_size;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   91  			ibuf_rsrc.num_active++;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   92  			ibuf_rsrc.num_allocated++;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   93  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   94  			input_buffer_found = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   95  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   96  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   97  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   98  	if (input_buffer_found && handle) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19   99  		*start_addr = handle->start_addr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  100  		retval = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  101  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  102  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  103  	return retval;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  104  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19  105  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/ibuf_ctrl_rmgr.c Mauro Carvalho Chehab 2020-04-19 @106  void ia_css_isys_ibuf_rmgr_release(

:::::: The code at line 34 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ZGiS0Q5IWpPtfppv
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--ZGiS0Q5IWpPtfppv--
