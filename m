Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FB37442DD
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 21:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjF3Tqs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 15:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjF3Tqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 15:46:45 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F32F3C01
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688154404; x=1719690404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gtlQGYMm1ULeNUjSy6Nn3R1aUjHM5HNjqOWPEVH1+8=;
  b=nJtZuuhVq0PPkjxFkmK1MullL5sy9Y66AMhHfOGjto1dcLn5L1fKtpr2
   uCO14scb2rQrgq0P+iX6+15JbRv++FFWqqBlkL0pI7kN8sREtXpRxYypk
   9d/4tZODEzt78HsYAcfSqxwmWtsVvJLStfuLDnTbgYXbBMHkMT1aNLkn2
   pP0VAOi5fGBze5OHTMhbRbSr1K14zNybuEafPxwAvlGXf3MJ5T7LdZe7X
   0by3C47yU4kgTEw2PWBf9L1AIXDMhfCj+1nJ+igsIqIR+E42wW/tWRWkt
   ypkXdwczZ/AXMRYkWTc9zTkTKKKYVeOVhLgwl+6IWF/SIN+t9lNUKfqn2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="359955255"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="359955255"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 12:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="721080924"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="721080924"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 12:46:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qFK4n-000FJl-0N;
        Fri, 30 Jun 2023 19:46:41 +0000
Date:   Sat, 1 Jul 2023 03:45:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [linux-next:master 7313/12815]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1888:5:
 warning: stack frame size (2208) exceeds limit (2048) in
 'rockchip_vpu981_av1_dec_run'
Message-ID: <202307010357.sY3iLanr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6352a698ca5bf26a9199202666b16cf741f579f6
commit: 727a400686a2c0d25015c9e44916a59b72882f83 [7313/12815] media: verisilicon: Add Rockchip AV1 decoder
config: riscv-randconfig-r021-20230701 (https://download.01.org/0day-ci/archive/20230701/202307010357.sY3iLanr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010357.sY3iLanr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010357.sY3iLanr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1888:5: warning: stack frame size (2208) exceeds limit (2048) in 'rockchip_vpu981_av1_dec_run' [-Wframe-larger-than]
   int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
       ^
   375/2208 (16.98%) spills, 1833/2208 (83.02%) variables
   1 warning generated.


vim +/rockchip_vpu981_av1_dec_run +1888 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c

  1887	
> 1888	int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
  1889	{
  1890		struct hantro_dev *vpu = ctx->dev;
  1891		struct vb2_v4l2_buffer *vb2_src;
  1892		int ret;
  1893	
  1894		hantro_start_prepare_run(ctx);
  1895	
  1896		ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
  1897		if (ret)
  1898			goto prepare_error;
  1899	
  1900		vb2_src = hantro_get_src_buf(ctx);
  1901		if (!vb2_src) {
  1902			ret = -EINVAL;
  1903			goto prepare_error;
  1904		}
  1905	
  1906		rockchip_vpu981_av1_dec_clean_refs(ctx);
  1907		rockchip_vpu981_av1_dec_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
  1908	
  1909		rockchip_vpu981_av1_dec_set_parameters(ctx);
  1910		rockchip_vpu981_av1_dec_set_global_model(ctx);
  1911		rockchip_vpu981_av1_dec_set_tile_info(ctx);
  1912		rockchip_vpu981_av1_dec_set_reference_frames(ctx);
  1913		rockchip_vpu981_av1_dec_set_segmentation(ctx);
  1914		rockchip_vpu981_av1_dec_set_loopfilter(ctx);
  1915		rockchip_vpu981_av1_dec_set_picture_dimensions(ctx);
  1916		rockchip_vpu981_av1_dec_set_cdef(ctx);
  1917		rockchip_vpu981_av1_dec_set_lr(ctx);
  1918		rockchip_vpu981_av1_dec_set_prob(ctx);
  1919	
  1920		hantro_reg_write(vpu, &av1_dec_mode, AV1_DEC_MODE);
  1921		hantro_reg_write(vpu, &av1_dec_out_ec_byte_word, 0);
  1922		hantro_reg_write(vpu, &av1_write_mvs_e, 1);
  1923		hantro_reg_write(vpu, &av1_dec_out_ec_bypass, 1);
  1924		hantro_reg_write(vpu, &av1_dec_clk_gate_e, 1);
  1925	
  1926		hantro_reg_write(vpu, &av1_dec_abort_e, 0);
  1927		hantro_reg_write(vpu, &av1_dec_tile_int_e, 0);
  1928	
  1929		hantro_reg_write(vpu, &av1_dec_alignment, 64);
  1930		hantro_reg_write(vpu, &av1_apf_disable, 0);
  1931		hantro_reg_write(vpu, &av1_apf_threshold, 8);
  1932		hantro_reg_write(vpu, &av1_dec_buswidth, 2);
  1933		hantro_reg_write(vpu, &av1_dec_max_burst, 16);
  1934		hantro_reg_write(vpu, &av1_error_conceal_e, 0);
  1935		hantro_reg_write(vpu, &av1_axi_rd_ostd_threshold, 64);
  1936		hantro_reg_write(vpu, &av1_axi_wr_ostd_threshold, 64);
  1937	
  1938		hantro_reg_write(vpu, &av1_ext_timeout_cycles, 0xfffffff);
  1939		hantro_reg_write(vpu, &av1_ext_timeout_override_e, 1);
  1940		hantro_reg_write(vpu, &av1_timeout_cycles, 0xfffffff);
  1941		hantro_reg_write(vpu, &av1_timeout_override_e, 1);
  1942	
  1943		rockchip_vpu981_av1_dec_set_output_buffer(ctx);
  1944		rockchip_vpu981_av1_dec_set_input_buffer(ctx, vb2_src);
  1945	
  1946		hantro_end_prepare_run(ctx);
  1947	
  1948		hantro_reg_write(vpu, &av1_dec_e, 1);
  1949	
  1950		return 0;
  1951	
  1952	prepare_error:
  1953		hantro_end_prepare_run(ctx);
  1954		hantro_irq_done(vpu, VB2_BUF_STATE_ERROR);
  1955		return ret;
  1956	}
  1957	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
