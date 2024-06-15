Return-Path: <linux-media+bounces-13304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF281909948
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 19:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F06C282C15
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 17:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64AD4CDEC;
	Sat, 15 Jun 2024 17:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3At73YI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2377168C4;
	Sat, 15 Jun 2024 17:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718472098; cv=none; b=mow6GTlla2Pz/T2ltfpmVEE8NLUFk5REg5+TqnvF8wgjmqPXYkIZRg4ibpmbJGrH72HatX0ltsNiPu6Brl0xoG9jMsJXmtIYXSFBu/1pdN98v7SrUlR6e6qdFvKNe2q0o/0XksJOJkMHJXMv8W7aOh9W+GZqwWd0SFGZwJ/PWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718472098; c=relaxed/simple;
	bh=ExyEuM3dwfd/4v0BFya7kw8n6mZ0l1HV91Gq8fQkkYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoaoebOQBw9LtAQtLWzUIO726M2MN9e4VydY5zKYHUqgNM+qtUZXAmj7U68+eSzZlpbmsFHI7AE9NuDSFfF6BM4Is8ouok9tozo0Kf/Y8BLl2XmInIsmLZqmH8AkqYp2Dk68sEdBTMdcVbN489YV2YATXLuhKW8BsvCmVr3pJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3At73YI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718472096; x=1750008096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ExyEuM3dwfd/4v0BFya7kw8n6mZ0l1HV91Gq8fQkkYk=;
  b=T3At73YI41STVU9wJhlMUQDHTa6TU6857tzJaYbsCA8S9GmEjAj+u5iv
   FywDXKoYKpTsAOOpQsNQ/k28+cXOkjVaV3C17lpL5yTMvsrwdL0Vt+bX6
   NCnmhEme1XNsX00FgCqITETf4nLN3+TmpVnf2etOcn1fhBK43BgDWuTUK
   dl7n4vKtVI5zEPdcLCJo788u0Ud1G+D2hAXEPvMgmQXQZG68XboZKW9XC
   v1wcmiBudAcb8mqQNv9U2tdGC8kyASr5IxUKalvknb6FIGIYJWa29PYn8
   h4HXvPWYkzkGNlL02IEjr99+obkbPuk+cbSSV5WvsiRUdeiXqu+919ETp
   Q==;
X-CSE-ConnectionGUID: 9zB0UoFPRRGrAK0OHDPNLQ==
X-CSE-MsgGUID: Po3doQgpQqiKKE/7Ytb48g==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15226121"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15226121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 10:21:35 -0700
X-CSE-ConnectionGUID: 2tPOAhzQQn2CxG3CPyIHbg==
X-CSE-MsgGUID: 0gtVHwRvRZq5d1wSu4LYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40900515"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jun 2024 10:21:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIX5k-0000KA-19;
	Sat, 15 Jun 2024 17:21:28 +0000
Date: Sun, 16 Jun 2024 01:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Message-ID: <202406160145.9n6HU9uQ-lkp@intel.com>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.10-rc3 next-20240613]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rockchip-Introduce-the-rkvdec2-driver/20240615-100124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240615015734.1612108-2-detlev.casanova%40collabora.com
patch subject: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240616/202406160145.9n6HU9uQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160145.9n6HU9uQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160145.9n6HU9uQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/media/rkvdec2/rkvdec2-h264.c:563:2: error: call to undeclared function '__iowrite32_copy_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     563 |         __iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
         |         ^
   drivers/staging/media/rkvdec2/rkvdec2-h264.c:563:2: note: did you mean '__iowrite32_copy'?
   arch/x86/include/asm/io.h:219:20: note: '__iowrite32_copy' declared here
     219 | static inline void __iowrite32_copy(void __iomem *to, const void *from,
         |                    ^
>> drivers/staging/media/rkvdec2/rkvdec2-h264.c:598:6: warning: variable 'yuv_virstride' set but not used [-Wunused-but-set-variable]
     598 |         u32 yuv_virstride = 0;
         |             ^
   1 warning and 1 error generated.


vim +/__iowrite32_copy_full +563 drivers/staging/media/rkvdec2/rkvdec2-h264.c

   557	
   558	static void rkvdec2_write_regs(struct rkvdec2_ctx *ctx)
   559	{
   560		struct rkvdec2_dev *rkvdec = ctx->dev;
   561		struct rkvdec2_h264_ctx *h264_ctx = ctx->priv;
   562	
 > 563		__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
   564				      &h264_ctx->regs.common,
   565				      sizeof(h264_ctx->regs.common));
   566		__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
   567				      &h264_ctx->regs.h264_param,
   568				      sizeof(h264_ctx->regs.h264_param));
   569		__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
   570				      &h264_ctx->regs.common_addr,
   571				      sizeof(h264_ctx->regs.common_addr));
   572		__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
   573				      &h264_ctx->regs.h264_addr,
   574				      sizeof(h264_ctx->regs.h264_addr));
   575		__iowrite32_copy_full(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
   576				      &h264_ctx->regs.h264_highpoc,
   577				      sizeof(h264_ctx->regs.h264_highpoc));
   578	}
   579	
   580	static void config_registers(struct rkvdec2_ctx *ctx,
   581				     struct rkvdec2_h264_run *run)
   582	{
   583		const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
   584		const struct v4l2_ctrl_h264_sps *sps = run->sps;
   585		const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
   586		struct rkvdec2_h264_ctx *h264_ctx = ctx->priv;
   587		dma_addr_t priv_start_addr = h264_ctx->priv_tbl.dma;
   588		const struct v4l2_pix_format_mplane *dst_fmt;
   589		struct vb2_v4l2_buffer *src_buf = run->base.bufs.src;
   590		struct vb2_v4l2_buffer *dst_buf = run->base.bufs.dst;
   591		struct rkvdec2_regs_h264 *regs = &h264_ctx->regs;
   592		const struct v4l2_format *f;
   593		dma_addr_t rlc_addr;
   594		dma_addr_t dst_addr;
   595		u32 hor_virstride = 0;
   596		u32 ver_virstride = 0;
   597		u32 y_virstride = 0;
 > 598		u32 yuv_virstride = 0;
   599		u32 offset;
   600		u32 pixels;
   601		u32 i;
   602	
   603		memset(regs, 0, sizeof(*regs));
   604	
   605		/* Set H264 mode */
   606		regs->common.reg009.dec_mode = RKVDEC2_MODE_H264;
   607	
   608		/* Set config */
   609		regs->common.reg011.buf_empty_en = 1;
   610		regs->common.reg011.dec_clkgate_e = 1;
   611		regs->common.reg011.dec_timeout_e = 1;
   612		regs->common.reg011.pix_range_detection_e = 1;
   613	
   614		/* Set IDR flag */
   615		regs->common.reg013.cur_pic_is_idr =
   616			!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC);
   617	
   618		/* Set input stream length */
   619		regs->common.reg016_str_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
   620	
   621		/* Set max slice number */
   622		regs->common.reg017.slice_num = MAX_SLICE_NUMBER;
   623	
   624		/* Set strides */
   625		f = &ctx->decoded_fmt;
   626		dst_fmt = &f->fmt.pix_mp;
   627		hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
   628		ver_virstride = round_up(dst_fmt->height, 16);
   629		y_virstride = hor_virstride * ver_virstride;
   630		pixels = dst_fmt->height * dst_fmt->width;
   631	
   632		if (sps->chroma_format_idc == 0)
   633			yuv_virstride = y_virstride;
   634		else if (sps->chroma_format_idc == 1)
   635			yuv_virstride += y_virstride + y_virstride / 2;
   636		else if (sps->chroma_format_idc == 2)
   637			yuv_virstride += 2 * y_virstride;
   638	
   639		regs->common.reg018.y_hor_virstride = hor_virstride / 16;
   640		regs->common.reg019.uv_hor_virstride = hor_virstride / 16;
   641		regs->common.reg020_y_virstride.y_virstride = y_virstride / 16;
   642	
   643		/* Activate block gating */
   644		regs->common.reg026.swreg_block_gating_e = 0xfffef;
   645		regs->common.reg026.reg_cfg_gating_en = 1;
   646	
   647		/* Set timeout threshold */
   648		if (pixels < RKVDEC2_1080P_PIXELS)
   649			regs->common.reg032_timeout_threshold = RKVDEC2_TIMEOUT_1080p;
   650		else if (pixels < RKVDEC2_4K_PIXELS)
   651			regs->common.reg032_timeout_threshold = RKVDEC2_TIMEOUT_4K;
   652		else if (pixels < RKVDEC2_8K_PIXELS)
   653			regs->common.reg032_timeout_threshold = RKVDEC2_TIMEOUT_8K;
   654	
   655		/* Set TOP and BOTTOM POCs */
   656		regs->h264_param.cur_top_poc = dec_params->top_field_order_cnt;
   657		regs->h264_param.cur_bot_poc = dec_params->bottom_field_order_cnt;
   658	
   659		/* Set ref pic address & poc */
   660		for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
   661			struct vb2_buffer *vb_buf = run->ref_buf[i];
   662			dma_addr_t buf_dma;
   663	
   664			/*
   665			 * If a DPB entry is unused or invalid, address of current destination
   666			 * buffer is returned.
   667			 */
   668			if (!vb_buf)
   669				vb_buf = &dst_buf->vb2_buf;
   670	
   671			buf_dma = vb2_dma_contig_plane_dma_addr(vb_buf, 0);
   672	
   673			/* Set reference addresses */
   674			regs->h264_addr.ref_base[i] = buf_dma;
   675	
   676			/* Set COLMV addresses */
   677			regs->h264_addr.colmv_base[i] = buf_dma + ctx->colmv_offset;
   678	
   679			struct rkvdec2_h264_ref_info *ref_info =
   680				&regs->h264_param.reg99_102_ref_info[i / 4].ref_info[i % 4];
   681	
   682			ref_info->ref_field =
   683				!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD);
   684			ref_info->ref_colmv_use_flag =
   685				!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE);
   686			ref_info->ref_topfield_used =
   687				!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF);
   688			ref_info->ref_botfield_used =
   689				!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF);
   690	
   691			regs->h264_param.reg67_98_ref_poc[i * 2] =
   692				dpb[i].top_field_order_cnt;
   693			regs->h264_param.reg67_98_ref_poc[i * 2 + 1] =
   694				dpb[i].bottom_field_order_cnt;
   695		}
   696	
   697		/* Set rlc base address (input stream) */
   698		rlc_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
   699		regs->common_addr.reg128_rlc_base = rlc_addr;
   700		regs->common_addr.reg129_rlcwrite_base = rlc_addr;
   701	
   702		/* Set output base address */
   703		dst_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
   704		regs->common_addr.reg130_decout_base = dst_addr;
   705	
   706		/* Set colmv address */
   707		regs->common_addr.reg131_colmv_cur_base = dst_addr + ctx->colmv_offset;
   708	
   709		/* Set RCB addresses */
   710		for (i = 0; i < RKVDEC2_RCB_COUNT; i++)
   711			regs->common_addr.reg133_142_rcb_base[i] = ctx->rcb_bufs[i].dma;
   712	
   713		/* Set hw pps address */
   714		offset = offsetof(struct rkvdec2_h264_priv_tbl, param_set);
   715		regs->h264_addr.pps_base = priv_start_addr + offset;
   716	
   717		/* Set hw rps address */
   718		offset = offsetof(struct rkvdec2_h264_priv_tbl, rps);
   719		regs->h264_addr.rps_base = priv_start_addr + offset;
   720	
   721		/* Set cabac table */
   722		offset = offsetof(struct rkvdec2_h264_priv_tbl, cabac_table);
   723		regs->h264_addr.cabactbl_base = priv_start_addr + offset;
   724	
   725		rkvdec2_write_regs(ctx);
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

