Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260723BAF32
	for <lists+linux-media@lfdr.de>; Sun,  4 Jul 2021 23:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhGDVY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 17:24:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:52611 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhGDVY5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 17:24:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="208854755"
X-IronPort-AV: E=Sophos;i="5.83,324,1616482800"; 
   d="gz'50?scan'50,208,50";a="208854755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 14:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,324,1616482800"; 
   d="gz'50?scan'50,208,50";a="485136810"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jul 2021 14:22:18 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m09ZB-000CAQ-SQ; Sun, 04 Jul 2021 21:22:17 +0000
Date:   Mon, 5 Jul 2021 05:21:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:488:7:
 warning: variable 'port_enabled' set but not used
Message-ID: <202107050512.582A3LFx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   303392fd5c160822bf778270b28ec5ea50cab2b4
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   1 year, 1 month ago
config: x86_64-buildonly-randconfig-r001-20210705 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5b552b198c2557295becd471bff53bb520fefee5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

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


vim +/port_enabled +488 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  482  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  483  #if !defined(USE_INPUT_SYSTEM_VERSION_2401)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  484  void ia_css_isys_rx_configure(const rx_cfg_t *config,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  485  			      const enum ia_css_input_mode input_mode)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  486  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  487  #if defined(HAS_RX_VERSION_2)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19 @488  	bool port_enabled[N_MIPI_PORT_ID];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  489  	bool any_port_enabled = false;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  490  	enum mipi_port_id port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  491  
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  492  	if ((!config)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  493  	    || (config->mode >= N_RX_MODE)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  494  	    || (config->port >= N_MIPI_PORT_ID)) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  495  		assert(0);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  496  		return;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  497  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  498  	for (port = (enum mipi_port_id)0; port < N_MIPI_PORT_ID; port++) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  499  		if (is_receiver_port_enabled(RX0_ID, port))
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  500  			any_port_enabled = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  501  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  502  	/* AM: Check whether this is a problem with multiple
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  503  	 * streams. MS: This is the case. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  504  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  505  	port = config->port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  506  	receiver_port_enable(RX0_ID, port, false);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  507  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  508  	port = config->port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  509  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  510  	/* AM: Check whether this is a problem with multiple streams. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  511  	if (MIPI_PORT_LANES[config->mode][port] != MIPI_0LANE_CFG) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  512  		receiver_port_reg_store(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  513  					_HRT_CSS_RECEIVER_FUNC_PROG_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  514  					config->timeout);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  515  		receiver_port_reg_store(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  516  					_HRT_CSS_RECEIVER_2400_INIT_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  517  					config->initcount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  518  		receiver_port_reg_store(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  519  					_HRT_CSS_RECEIVER_2400_SYNC_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  520  					config->synccount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  521  		receiver_port_reg_store(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  522  					_HRT_CSS_RECEIVER_2400_RX_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  523  					config->rxcount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  524  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  525  		port_enabled[port] = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  526  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  527  		if (input_mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  528  			/* MW: A bit of a hack, straight wiring of the capture
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  529  			 * units,assuming they are linearly enumerated. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  530  			input_system_sub_system_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  531  							  GPREGS_UNIT0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  532  							  HIVE_ISYS_GPREG_MULTICAST_A_IDX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  533  							  + (unsigned int)port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  534  							  INPUT_SYSTEM_CSI_BACKEND);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  535  			/* MW: Like the integration test example we overwite,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  536  			 * the GPREG_MUX register */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  537  			input_system_sub_system_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  538  							  GPREGS_UNIT0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  539  							  HIVE_ISYS_GPREG_MUX_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  540  							  (input_system_multiplex_t)port);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  541  		} else {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  542  			/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  543  			 * AM: A bit of a hack, wiring the input system.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  544  			 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  545  			input_system_sub_system_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  546  							  GPREGS_UNIT0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  547  							  HIVE_ISYS_GPREG_MULTICAST_A_IDX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  548  							  + (unsigned int)port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  549  							  INPUT_SYSTEM_INPUT_BUFFER);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  550  			input_system_sub_system_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  551  							  GPREGS_UNIT0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  552  							  HIVE_ISYS_GPREG_MUX_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  553  							  INPUT_SYSTEM_ACQUISITION_UNIT);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  554  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  555  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  556  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  557  	 * The 2ppc is shared for all ports, so we cannot
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  558  	 * disable->configure->enable individual ports
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  559  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  560  	/* AM: Check whether this is a problem with multiple streams. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  561  	/* MS: 2ppc should be a property per binary and should be
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  562  	 * enabled/disabled per binary.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  563  	 * Currently it is implemented as a system wide setting due
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  564  	 * to effort and risks. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  565  	if (!any_port_enabled) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  566  		receiver_reg_store(RX0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  567  				   _HRT_CSS_RECEIVER_TWO_PIXEL_EN_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  568  				   config->is_two_ppc);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  569  		receiver_reg_store(RX0_ID, _HRT_CSS_RECEIVER_BE_TWO_PPC_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  570  				   config->is_two_ppc);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  571  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  572  	receiver_port_enable(RX0_ID, port, true);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  573  	/* TODO: JB: need to add the beneath used define to mizuchi */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  574  	/* sh_css_sw_hive_isp_css_2400_system_20121224_0125\css
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  575  	 *                      \hrt\input_system_defs.h
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  576  	 * #define INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG 0X207
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  577  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  578  	/* TODO: need better name for define
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  579  	 * input_system_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  580  	 *                INPUT_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  581  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  582  	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  583  #else
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  584  #error "rx.c: RX version must be one of {RX_VERSION_2}"
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  585  #endif
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  586  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  587  	return;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  588  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/isys/src/rx.c Mauro Carvalho Chehab 2020-04-19  589  

:::::: The code at line 488 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--sdtB3X0nJg68CQEu--
