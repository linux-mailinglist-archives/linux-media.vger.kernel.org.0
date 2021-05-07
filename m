Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC3637611C
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 09:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEGH2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 03:28:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:54257 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233079AbhEGH2e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 May 2021 03:28:34 -0400
IronPort-SDR: RSRa45Pof/lyUx+2u6UDgrb/sUSYC/+cbB03NiqJnim6xcEDSebbk35JM1Bcq3+Kp46bYmHxqv
 d7baRzK52BVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="186129674"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="gz'50?scan'50,208,50";a="186129674"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:27:34 -0700
IronPort-SDR: SxEtCu4EveDvBcUF3sqFBwR4xmtefEOW41oxw+/gbJrAEx7R6L/tmPFwxkGW90beoyEgoJKT5E
 pFZsd/KMH7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="gz'50?scan'50,208,50";a="434791221"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 May 2021 00:27:32 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1leutX-000B6j-KC; Fri, 07 May 2021 07:27:31 +0000
Date:   Fri, 7 May 2021 15:26:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:488:7:
 warning: variable 'port_enabled' set but not used
Message-ID: <202105071544.fXsdbU7G-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e48661230cc35b3d0f4367eddfc19f86463ab917
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable warnings again
date:   11 months ago
config: i386-randconfig-a003-20200826 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5b552b198c2557295becd471bff53bb520fefee5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        make W=1 W=1 ARCH=i386 

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

--9amGYk9869ThD9tj
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
rjJqZSxS0WqFK7Qj0fKqI1Gl4oJx27nE95W7XkzVYTU8JKPxxHlNK/Azz3H+WKb+UH/vgN/E
00H+pskQ4OgDnCOvk3ioeTkf+p7DGij0R0MuVnsI59GQxvERIMcNgWapJzsw4i7WtocqJFUK
gHPktofg83Y4GPLrLA1GniN3UZr6s/HEmhINO9UdRwAwH088AlhMJkPD2K2FmgBN3UwPAUwW
sZMH0NRjIx5V9XY+GhLrge186bci4f//HN+x3WywGJaaZSpAvMWQ/J4OpubvJpa3Tm0eUnJV
Hc4WC/aeGcT5ANNka0wqRTyFBcEQjhpDCgyTzGshPTsdZixXxpnvHQ4mdVIH3njmcFtFnMMY
WeAWXN4j3CekY4Km/x8WU7ZTaVCMxrrTRBplzZdh9/FdFZm/m80HnPeH3CxAdpOREXaYe9xp
7ViLAlcVadzEQOCy7hQEe7tSAQcwYdVagAbzIVedQFawGDWGQlgKe6U1Ifu4wLcTDGjPd67V
Ag+q3H9rQLJ6PT+/X0XPD5z9iYZsDwQvj6AiGmJ7kwZjz+CL7ojQFZAlvh+fRKgTabVMpX+d
wMQVGyYEaUezTKPpnHv9DIJqrp+tY/+aihysNC5j3PPXBcmlVlT6z/2X+YLkPba6LC2vTw/K
8hrtJeTBvBcZmhCXO2maOgKy0t23jy/K1q9vrGnVPUvILUqe76pClev61Kv9FpLs1LVRIY9r
h7U1y5G8BWx2JzmGl5+TwXRMxd9kxE4jIMZjIkgnk4WHrr16UCYB1QOvA2A6p8Wmiyn9jLAa
k1Q+6dQb6c4tIJUmQ81rBWTReObRNRr6wWQyG+oTdXEIOuOxh4+npx/tOUyfEQsnkCsMhXZ8
vv/RGTH9B73Nw7D6VCSJOp3LW5Y1GgbdvZ9fP4Wnt/fX0x8faLSlt3GRTrrafL97O/6WABmc
y5Pz+eXqH9DOP6++dv140/qh1/3fllTlfvKFhLm+/Xg9v92fX46tBYrGWct0PZwSFQ9/03lf
HfzKg82Sh5nqnbYy17dlzitfabEbDXS7thbArhtZjX+IKx6FryQK3WvW9XpkOfgaHGePi5RM
x7vH9++agFXQ1/erUkYiej69m7J3FY15TyA8ww2GJAyOhJCATGz1GlLvkezPx9Pp4fT+w55T
P/VG+tYYbmpdsG9C1HwOrCzd7NI4NDzPN3VlRKfuEDtPT1cXz6S+qf32iAJpdVmublhW7xgX
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
JAoXQcvConCvFCd5rBexK70u/gfVK3q7bnoCAA==

--9amGYk9869ThD9tj--
