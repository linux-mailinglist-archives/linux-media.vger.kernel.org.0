Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29471E9352
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 21:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgE3TUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 15:20:08 -0400
Received: from mga05.intel.com ([192.55.52.43]:8902 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729296AbgE3TUI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 15:20:08 -0400
IronPort-SDR: tELFkUggi1vkhjrQ+RRSe7dTgnixA+6sfgoyy6CE5w0OTnP8Y/RW4NobCF28dKc4W6ALnCHU0E
 ql/MMQZfe3yQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2020 12:19:55 -0700
IronPort-SDR: /UzJb8u9CIvA5qIN1Y8rPkEXTjxJqWxitfSI3CCryu6P1uCCoReAHjRNPqHwCwhdxRUAMTRh3y
 oqFljwCqWY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,452,1583222400"; 
   d="gz'50?scan'50,208,50";a="257618425"
Received: from lkp-server01.sh.intel.com (HELO 9f9df8056aac) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 May 2020 12:19:53 -0700
Received: from kbuild by 9f9df8056aac with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jf71M-0000ln-Op; Sat, 30 May 2020 19:19:52 +0000
Date:   Sun, 31 May 2020 03:19:29 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Mauro, Carvalho, Chehab," <mchehab+huawei@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: [media-next:master 556/556]
 drivers/staging/media/atomisp/pci/atomisp_cmd.c:2805:31: warning: variable
 'stream_config' set but not used
Message-ID: <202005310324.95TZS0df%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   e2afb5f02e3a2a34982bbed4e712f7227cecf9c4
commit: e2afb5f02e3a2a34982bbed4e712f7227cecf9c4 [556/556] media: atomisp: re-enable warnings again
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        git checkout e2afb5f02e3a2a34982bbed4e712f7227cecf9c4
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1505:15: warning: variable 'a0_max_id' set but not used [-Wunused-but-set-variable]
1505 |  unsigned int a0_max_id = 0;
|               ^~~~~~~~~
At top level:
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
--
cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/memory_access/: No such file or directory [-Wmissing-include-dirs]
drivers/staging/media/atomisp/pci/sh_css_mipi.c: In function 'allocate_mipi_frames':
>> drivers/staging/media/atomisp/pci/sh_css_mipi.c:415:27: warning: variable 'mipi_intermediate_info' set but not used [-Wunused-but-set-variable]
415 |  struct ia_css_frame_info mipi_intermediate_info;
|                           ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/staging/media/atomisp//pci/system_local.h:8,
from drivers/staging/media/atomisp//pci/ia_css_acc_types.h:23,
from drivers/staging/media/atomisp//pci/ia_css_pipe_public.h:29,
from drivers/staging/media/atomisp//pci/ia_css_stream_public.h:25,
from drivers/staging/media/atomisp/pci/sh_css_mipi.h:21,
from drivers/staging/media/atomisp/pci/sh_css_mipi.c:17:
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
..

vim +/stream_config +2805 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2800  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2801  int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2802  			 struct atomisp_metadata *md)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2803  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2804  	struct atomisp_device *isp = asd->isp;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @2805  	struct ia_css_stream_config *stream_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2806  	struct ia_css_stream_info *stream_info;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2807  	struct camera_mipi_info *mipi_info;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2808  	struct atomisp_metadata_buf *md_buf;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2809  	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2810  	int ret, i;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2811  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2812  	if (flag != 0)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2813  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2814  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2815  	stream_config = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2816  			stream_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2817  	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2818  		      stream_info;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2819  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2820  	/* We always return the resolution and stride even if there is
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2821  	 * no valid metadata. This allows the caller to get the information
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2822  	 * needed to allocate user-space buffers. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2823  	md->width  = stream_info->metadata_info.resolution.width;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2824  	md->height = stream_info->metadata_info.resolution.height;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2825  	md->stride = stream_info->metadata_info.stride;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2826  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2827  	/* sanity check to avoid writing into unallocated memory.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2828  	 * This does not return an error because it is a valid way
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2829  	 * for applications to detect that metadata is not enabled. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2830  	if (md->width == 0 || md->height == 0 || !md->data)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2831  		return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2832  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2833  	/* This is done in the atomisp_buf_done() */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2834  	if (list_empty(&asd->metadata_ready[md_type])) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2835  		dev_warn(isp->dev, "Metadata queue is empty now!\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2836  		return -EAGAIN;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2837  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2838  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2839  	mipi_info = atomisp_to_sensor_mipi_info(
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2840  			isp->inputs[asd->input_curr].camera);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2841  	if (!mipi_info)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2842  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2843  
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2844  	if (mipi_info->metadata_effective_width) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2845  		for (i = 0; i < md->height; i++)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2846  			md->effective_width[i] =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2847  			    mipi_info->metadata_effective_width[i];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2848  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2849  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2850  	md_buf = list_entry(asd->metadata_ready[md_type].next,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2851  			    struct atomisp_metadata_buf, list);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2852  	md->exp_id = md_buf->metadata->exp_id;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2853  	if (md_buf->md_vptr) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2854  		ret = copy_to_user(md->data,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2855  				   md_buf->md_vptr,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2856  				   stream_info->metadata_info.size);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2857  	} else {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2858  		hmm_load(md_buf->metadata->address,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2859  			 asd->params.metadata_user[md_type],
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2860  			 stream_info->metadata_info.size);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2861  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2862  		ret = copy_to_user(md->data,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2863  				   asd->params.metadata_user[md_type],
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2864  				   stream_info->metadata_info.size);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2865  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2866  	if (ret) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2867  		dev_err(isp->dev, "copy to user failed: copied %d bytes\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2868  			ret);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2869  		return -EFAULT;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2870  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2871  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2872  	list_del_init(&md_buf->list);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2873  	list_add_tail(&md_buf->list, &asd->metadata[md_type]);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2874  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2875  	dev_dbg(isp->dev, "%s: HAL de-queued metadata type %d with exp_id %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2876  		__func__, md_type, md->exp_id);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2877  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2878  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  2879  

:::::: The code at line 2805 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--OgqxwSJOaUobr8KG
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
UB1uE73aZH6VNHus/wOofW8jDKMEAA==

--OgqxwSJOaUobr8KG--
