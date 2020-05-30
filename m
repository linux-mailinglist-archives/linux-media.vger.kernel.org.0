Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750161E8D94
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 06:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgE3EAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 00:00:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:56872 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728293AbgE3EAN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 00:00:13 -0400
IronPort-SDR: zfmOcn1jRc0MuKatZf5bExys0Pda4UxbAxP6Ys9PcFIO1fjUlzdSDvGpR+aIaVAiF7ZMV+QLVC
 3vwaQUCWF+LQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 19:32:53 -0700
IronPort-SDR: Q8l+C93KOY2pdK3+tNrpHC66EJh71zqA0KUZhhw7XON5qgjqbElUe2iQ8o980awplF2XemOLpj
 iN4wCDWiPv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,451,1583222400"; 
   d="gz'50?scan'50,208,50";a="469691899"
Received: from lkp-server01.sh.intel.com (HELO 9f9df8056aac) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 19:32:51 -0700
Received: from kbuild by 9f9df8056aac with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jerIo-0000YX-Ry; Sat, 30 May 2020 02:32:50 +0000
Date:   Sat, 30 May 2020 10:32:32 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "Mauro, Carvalho, Chehab," <mchehab+huawei@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-media@vger.kernel.org
Subject: [linux-next:master 10308/14131]
 drivers/staging/media/atomisp/pci/sh_css_sp.c:1039:23: warning: address of
 'binary->in_frame_info' will always evaluate to 'true'
Message-ID: <202005301029.sGjcYvXG%lkp@intel.com>
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

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b08814b16b80a0bf76eeca16317f8c2ed23b8c
commit: 085093606320ac76a062c99cf12e33c010417b4b [10308/14131] media: atomisp: allow building for isp2401
config: x86_64-allyesconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d068e534f1671459e1b135852c1b3c10502e929)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout 085093606320ac76a062c99cf12e33c010417b4b
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/staging/media/atomisp/pci/sh_css_sp.c:1039:23: warning: address of 'binary->in_frame_info' will always evaluate to 'true' [-Wpointer-bool-conversion]
} else if (&binary->in_frame_info) {
~~   ~~~~~~~~^~~~~~~~~~~~~
1 warning generated.

vim +1039 drivers/staging/media/atomisp/pci/sh_css_sp.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   937  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   938  	initialize_stage_frames(&sh_css_sp_stage.frames);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   939  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   940  	 * TODO: Make the Host dynamically determine
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   941  	 * the stage type.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   942  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   943  	sh_css_sp_stage.stage_type = SH_CSS_ISP_STAGE_TYPE;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   944  	sh_css_sp_stage.num		= (uint8_t)stage;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   945  	sh_css_sp_stage.isp_online	= (uint8_t)binary->online;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   946  	sh_css_sp_stage.isp_copy_vf     = (uint8_t)args->copy_vf;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   947  	sh_css_sp_stage.isp_copy_output = (uint8_t)args->copy_output;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   948  	sh_css_sp_stage.enable.vf_output = (args->out_vf_frame != NULL);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   949  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   950  	/* Copy the frame infos first, to be overwritten by the frames,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   951  	   if these are present.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   952  	*/
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   953  	sh_css_sp_stage.frames.effective_in_res.width = binary->effective_in_frame_res.width;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   954  	sh_css_sp_stage.frames.effective_in_res.height = binary->effective_in_frame_res.height;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   955  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   956  	ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.in.info,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   957  					   &binary->in_frame_info);
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   958  	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   959  	{
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   960  		ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.out[i].info,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   961  						   &binary->out_frame_info[i]);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   962  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   963  	ia_css_frame_info_to_frame_sp_info(&sh_css_sp_stage.frames.internal_frame_info,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   964  					   &binary->internal_frame_info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   965  	sh_css_sp_stage.dvs_envelope.width    = binary->dvs_envelope.width;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   966  	sh_css_sp_stage.dvs_envelope.height   = binary->dvs_envelope.height;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   967  	sh_css_sp_stage.isp_pipe_version      = (uint8_t)info->pipeline.isp_pipe_version;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   968  	sh_css_sp_stage.isp_deci_log_factor   = (uint8_t)binary->deci_factor_log2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   969  	sh_css_sp_stage.isp_vf_downscale_bits = (uint8_t)binary->vf_downscale_log2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   970  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   971  	sh_css_sp_stage.if_config_index = (uint8_t)if_config_index;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   972  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   973  	sh_css_sp_stage.sp_enable_xnr = (uint8_t)xnr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   974  	sh_css_sp_stage.xmem_bin_addr = xinfo->xmem_addr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   975  	sh_css_sp_stage.xmem_map_addr = sh_css_params_ddr_address_map();
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   976  	sh_css_isp_stage.blob_info = *blob_info;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   977  	sh_css_stage_write_binary_info((struct ia_css_binary_info *)info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   978  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   979  	/* Make sure binary name is smaller than allowed string size */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   980  	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   981  	strncpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME - 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   982  	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   983  	sh_css_isp_stage.mem_initializers = *isp_mem_if;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   984  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   985  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   986  	 * Even when a stage does not need uds and does not params,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   987  	 * ia_css_uds_sp_scale_params() seems to be called (needs
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   988  	 * further investigation). This function can not deal with
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   989  	 * dx, dy = {0, 0}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   990  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   991  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   992  	err = sh_css_sp_write_frame_pointers(args);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   993  	/* TODO: move it to a better place */
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   994  	if (binary->info->sp.enable.s3a)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   995  	{
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   996  		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_3A_STATISTICS, thread_id,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   997  					       &queue_id);
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   998  		sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.s3a_buf, queue_id,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19   999  						    mmgr_EXCEPTION,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1000  						    IA_CSS_BUFFER_TYPE_3A_STATISTICS);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1001  	}
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1002  	if (binary->info->sp.enable.dis)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1003  	{
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1004  		ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_DIS_STATISTICS, thread_id,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1005  					       &queue_id);
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1006  		sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.dvs_buf, queue_id,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1007  						    mmgr_EXCEPTION,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1008  						    IA_CSS_BUFFER_TYPE_DIS_STATISTICS);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1009  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1010  #if defined SH_CSS_ENABLE_METADATA
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1011  	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id, &queue_id);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1012  	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id, mmgr_EXCEPTION, IA_CSS_BUFFER_TYPE_METADATA);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1013  #endif
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1014  	if (err != IA_CSS_SUCCESS)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1015  		return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1016  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1017  #ifdef USE_INPUT_SYSTEM_VERSION_2401
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1018  #ifndef ISP2401
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1019  	if (args->in_frame)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1020  	{
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1021  		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1022  		if (!pipe)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1023  			return IA_CSS_ERR_INTERNAL_ERROR;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1024  		ia_css_get_crop_offsets(pipe, &args->in_frame->info);
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1025  	} else if (&binary->in_frame_info)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1026  	{
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1027  		pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1028  		if (!pipe)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1029  			return IA_CSS_ERR_INTERNAL_ERROR;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1030  		ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1031  #else
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1032  	if (stage == 0)
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1033  	{
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1034  		if (args->in_frame) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1035  			pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1036  			if (!pipe)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1037  				return IA_CSS_ERR_INTERNAL_ERROR;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1038  			ia_css_get_crop_offsets(pipe, &args->in_frame->info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19 @1039  		} else if (&binary->in_frame_info) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1040  			pipe = find_pipe_by_num(sh_css_sp_group.pipe[thread_id].pipe_num);
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1041  			if (!pipe)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1042  				return IA_CSS_ERR_INTERNAL_ERROR;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1043  			ia_css_get_crop_offsets(pipe, &binary->in_frame_info);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1044  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1045  #endif
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1046  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1047  #else
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1048  	(void)pipe; /*avoid build warning*/
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1049  #endif
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1050  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1051  	err = configure_isp_from_args(&sh_css_sp_group.pipe[thread_id],
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1052  				      binary, args, two_ppc, sh_css_sp_stage.deinterleaved);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1053  	if (err != IA_CSS_SUCCESS)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1054  		return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1055  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1056  	initialize_isp_states(binary);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1057  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1058  	/* we do this only for preview pipe because in fill_binary_info function
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1059  	 * we assign vf_out res to out res, but for ISP internal processing, we need
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1060  	 * the original out res. for video pipe, it has two output pins --- out and
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1061  	 * vf_out, so it can keep these two resolutions already. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1062  	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1063  	    (binary->vf_downscale_log2 > 0))
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1064  	{
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1065  		/* TODO: Remove this after preview output decimation is fixed
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1066  		 * by configuring out&vf info fiels properly */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1067  		sh_css_sp_stage.frames.out[0].info.padded_width
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1068  		<<= binary->vf_downscale_log2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1069  		sh_css_sp_stage.frames.out[0].info.res.width
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1070  		<<= binary->vf_downscale_log2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1071  		sh_css_sp_stage.frames.out[0].info.res.height
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1072  		<<= binary->vf_downscale_log2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1073  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1074  	err = copy_isp_mem_if_to_ddr(binary);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1075  	if (err != IA_CSS_SUCCESS)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1076  		return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1077  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1078  	return IA_CSS_SUCCESS;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1079  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css_sp.c Mauro Carvalho Chehab 2020-04-19  1080  

:::::: The code at line 1039 was first introduced by commit
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

--OgqxwSJOaUobr8KG--
