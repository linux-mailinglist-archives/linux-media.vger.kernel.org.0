Return-Path: <linux-media+bounces-33486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72752AC5CCB
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 00:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A289E10F1
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 22:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36CB216392;
	Tue, 27 May 2025 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnJzgjog"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21491F9A8B;
	Tue, 27 May 2025 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383842; cv=none; b=F59TfFO8j7IADShqJnpf/ZOSMLyGb6Wn8tMijB3FbuGG/aiOToO3pgWYLg+qFyR+wCjKKbfhPAs1aL5Fg6f96rdFJPBmKOs6LXmQX75tQDUJBDKp+StOe7JeFkW/V5LCNCh/YElox9zfsiOYkNXntS6t4yUFopLTC8rNO5eg1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383842; c=relaxed/simple;
	bh=1rDzv+Wr6O5EVa6U16GCQQwRDF34NE2TMH2wlIZaKaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHLlZP/5pDUSQJtdnGYKbSRYHQbn4b7X8iVwdKja4ekck7Gb3EW42lSN/cK/RfOfWcv4W61yKdUQ46Ywe2q7rZAH9Dd0cmJ0GdlrFWmU2bLbhFJEOO1TdAV8770h1RsiS45lJl5h7Re9UdXIHq3bF6EDGeJlAO/L+1fgyWBrB3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnJzgjog; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748383840; x=1779919840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1rDzv+Wr6O5EVa6U16GCQQwRDF34NE2TMH2wlIZaKaE=;
  b=dnJzgjogfTAmy0EOpZgvRJQpKUwxtNSYbUgQ7SGYRmuaSUaqPQksUaPP
   9mX5RlYB5bRrIMTwqkA3fd57G3eyl0sFI2tLGqLl5K3pNxQ2uzkPK7vmu
   R1OkEkk1WyjtahDT9rGu7k5Ldd6LM9SIIeBuRrizkl4WP+gJmOhhXNQvD
   M5Dc7uho+LSDjborBK9ALTN6kixe2Xr3yp2IHFffFyrbWEhmMkQVFVKgf
   EQx3l7kkPZ7QfHrgytKNsc8MO3yOVG0z/ElEYOIXukTHUixoXXOtFie+x
   g2Vm0Kfqg/W9HcEzzyrxAIJ9Fjpv7O47FCDyuKY8u4TXS9wDcdDmMazzM
   g==;
X-CSE-ConnectionGUID: Tkb4/yrQT8iXpLvBdZb+Sw==
X-CSE-MsgGUID: oLPLj1BXQpqoRphY0rR6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50552525"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50552525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:10:39 -0700
X-CSE-ConnectionGUID: lLy04/TiRSGJBAJ2i6ZB+A==
X-CSE-MsgGUID: rpVnNj1DRG6XlrYpOsaHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173889005"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 15:10:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2VG-000V2w-1X;
	Tue, 27 May 2025 22:10:34 +0000
Date: Wed, 28 May 2025 06:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Switch to using structs instead of writel
Message-ID: <202505280607.OOCCyEiw-lkp@intel.com>
References: <20250527150043.174415-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527150043.174415-1-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linuxtv-media-pending/master linus/master v6.15 next-20250527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rkvdec-Switch-to-using-structs-instead-of-writel/20250527-230234
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20250527150043.174415-1-detlev.casanova%40collabora.com
patch subject: [PATCH] media: rkvdec: Switch to using structs instead of writel
config: arm64-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280607.OOCCyEiw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280607.OOCCyEiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280607.OOCCyEiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/rkvdec/rkvdec-vp9.c: In function 'config_registers':
>> drivers/staging/media/rkvdec/rkvdec-vp9.c:493:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     u32 val;
         ^~~


vim +/val +493 drivers/staging/media/rkvdec/rkvdec-vp9.c

   483	
   484	static void config_registers(struct rkvdec_ctx *ctx,
   485				     const struct rkvdec_vp9_run *run)
   486	{
   487		unsigned int y_len, uv_len, yuv_len, bit_depth, aligned_height, aligned_pitch, stream_len;
   488		const struct v4l2_ctrl_vp9_frame *dec_params;
   489		struct rkvdec_decoded_buffer *ref_bufs[3];
   490		struct rkvdec_decoded_buffer *dst, *last, *mv_ref;
   491		struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
   492		struct rkvdec_regs *regs = &vp9_ctx->regs;
 > 493		u32 val;
   494		const struct v4l2_vp9_segmentation *seg;
   495		struct rkvdec_dev *rkvdec = ctx->dev;
   496		dma_addr_t addr;
   497		bool intra_only;
   498		unsigned int i;
   499	
   500		dec_params = run->decode_params;
   501		dst = vb2_to_rkvdec_decoded_buf(&run->base.bufs.dst->vb2_buf);
   502		ref_bufs[0] = get_ref_buf(ctx, &dst->base.vb, dec_params->last_frame_ts);
   503		ref_bufs[1] = get_ref_buf(ctx, &dst->base.vb, dec_params->golden_frame_ts);
   504		ref_bufs[2] = get_ref_buf(ctx, &dst->base.vb, dec_params->alt_frame_ts);
   505	
   506		if (vp9_ctx->last.valid)
   507			last = get_ref_buf(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
   508		else
   509			last = dst;
   510	
   511		update_dec_buf_info(dst, dec_params);
   512		update_ctx_cur_info(vp9_ctx, dst, dec_params);
   513		seg = &dec_params->seg;
   514	
   515		intra_only = !!(dec_params->flags &
   516				(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
   517				 V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
   518	
   519		regs->common.reg02.dec_mode = RKVDEC_MODE_VP9;
   520	
   521		bit_depth = dec_params->bit_depth;
   522		aligned_height = round_up(ctx->decoded_fmt.fmt.pix_mp.height, 64);
   523	
   524		aligned_pitch = round_up(ctx->decoded_fmt.fmt.pix_mp.width *
   525					 bit_depth,
   526					 512) / 8;
   527		y_len = aligned_height * aligned_pitch;
   528		uv_len = y_len / 2;
   529		yuv_len = y_len + uv_len;
   530	
   531		regs->common.reg03.y_hor_virstride = aligned_pitch / 16;
   532		regs->common.reg03.uv_hor_virstride = aligned_pitch / 16;
   533		regs->common.reg08.y_virstride = y_len / 16;
   534		regs->common.reg09.yuv_virstride = yuv_len / 16;
   535	
   536		stream_len = vb2_get_plane_payload(&run->base.bufs.src->vb2_buf, 0);
   537	
   538		regs->common.stream_len = stream_len;
   539	
   540		/*
   541		 * Reset count buffer, because decoder only output intra related syntax
   542		 * counts when decoding intra frame, but update entropy need to update
   543		 * all the probabilities.
   544		 */
   545		if (intra_only)
   546			memset(vp9_ctx->count_tbl.cpu, 0, vp9_ctx->count_tbl.size);
   547	
   548		vp9_ctx->cur.segmapid = vp9_ctx->last.segmapid;
   549		if (!intra_only &&
   550		    !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
   551		    (!(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED) ||
   552		     (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP)))
   553			vp9_ctx->cur.segmapid++;
   554	
   555		for (i = 0; i < ARRAY_SIZE(ref_bufs); i++)
   556			config_ref_registers(ctx, run, ref_bufs[i], i);
   557	
   558		for (i = 0; i < 8; i++)
   559			config_seg_registers(ctx, i);
   560	
   561		regs->vp9.reg28.tx_mode = vp9_ctx->cur.tx_mode;
   562		regs->vp9.reg28.frame_reference_mode = dec_params->reference_mode;
   563	
   564		if (!intra_only) {
   565			const struct v4l2_vp9_loop_filter *lf;
   566			s8 delta;
   567	
   568			if (vp9_ctx->last.valid)
   569				lf = &vp9_ctx->last.lf;
   570			else
   571				lf = &vp9_ctx->cur.lf;
   572	
   573			val = 0;
   574			for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {
   575				delta = lf->ref_deltas[i];
   576				switch (i) {
   577				case 0:
   578					regs->vp9.reg32.ref_deltas_lastframe0 = delta;
   579					break;
   580				case 1:
   581					regs->vp9.reg32.ref_deltas_lastframe1 = delta;
   582					break;
   583				case 2:
   584					regs->vp9.reg32.ref_deltas_lastframe2 = delta;
   585					break;
   586				case 3:
   587					regs->vp9.reg32.ref_deltas_lastframe3 = delta;
   588					break;
   589				}
   590			}
   591	
   592			for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {
   593				delta = lf->mode_deltas[i];
   594				switch (i) {
   595				case 0:
   596					regs->vp9.reg33.mode_deltas_lastframe0 = delta;
   597					break;
   598				case 1:
   599					regs->vp9.reg33.mode_deltas_lastframe1 = delta;
   600					break;
   601				}
   602			}
   603		}
   604	
   605		regs->vp9.reg33.segmentation_enable_lstframe =
   606			vp9_ctx->last.valid && !intra_only &&
   607			vp9_ctx->last.seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED;
   608	
   609		regs->vp9.reg33.last_show_frame =
   610			vp9_ctx->last.valid &&
   611			vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_SHOW_FRAME;
   612	
   613		regs->vp9.reg33.last_intra_only =
   614			vp9_ctx->last.valid &&
   615			vp9_ctx->last.flags &
   616			(V4L2_VP9_FRAME_FLAG_KEY_FRAME | V4L2_VP9_FRAME_FLAG_INTRA_ONLY);
   617	
   618		regs->vp9.reg33.last_widthheight_eqcur =
   619			vp9_ctx->last.valid &&
   620			last->vp9.width == dst->vp9.width &&
   621			last->vp9.height == dst->vp9.height;
   622	
   623		regs->vp9.reg36.lasttile_size =
   624			stream_len - dec_params->compressed_header_size -
   625			dec_params->uncompressed_header_size;
   626	
   627		for (i = 0; !intra_only && i < ARRAY_SIZE(ref_bufs); i++) {
   628			unsigned int refw = ref_bufs[i]->vp9.width;
   629			unsigned int refh = ref_bufs[i]->vp9.height;
   630			u32 hscale, vscale;
   631	
   632			hscale = (refw << 14) /	dst->vp9.width;
   633			vscale = (refh << 14) / dst->vp9.height;
   634	
   635			regs->vp9.reg29_31[i].ref_hor_scale = hscale;
   636			regs->vp9.reg29_31[i].ref_ver_scale = vscale;
   637		}
   638	
   639		addr = vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf, 0);
   640		regs->common.decout_base = addr;
   641		addr = vb2_dma_contig_plane_dma_addr(&run->base.bufs.src->vb2_buf, 0);
   642		regs->common.strm_rlc_base = addr;
   643	
   644		regs->common.cabactbl_base = vp9_ctx->priv_tbl.dma +
   645			offsetof(struct rkvdec_vp9_priv_tbl, probs);
   646	
   647		regs->vp9.count_base = vp9_ctx->count_tbl.dma;
   648	
   649		regs->vp9.segidlast_base = vp9_ctx->priv_tbl.dma +
   650			offsetof(struct rkvdec_vp9_priv_tbl, segmap) +
   651			(RKVDEC_VP9_MAX_SEGMAP_SIZE * (!vp9_ctx->cur.segmapid));
   652	
   653		regs->vp9.segidcur_base = vp9_ctx->priv_tbl.dma +
   654			offsetof(struct rkvdec_vp9_priv_tbl, segmap) +
   655			(RKVDEC_VP9_MAX_SEGMAP_SIZE * vp9_ctx->cur.segmapid);
   656	
   657		if (!intra_only &&
   658		    !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT) &&
   659		    vp9_ctx->last.valid)
   660			mv_ref = last;
   661		else
   662			mv_ref = dst;
   663	
   664		regs->vp9.refcolmv_base = get_mv_base_addr(mv_ref);
   665	
   666		regs->vp9.performance_cycle = ctx->decoded_fmt.fmt.pix_mp.width |
   667			       (ctx->decoded_fmt.fmt.pix_mp.height << 16);
   668	
   669		regs->vp9.reg44.strmd_error_e = 0xe;
   670	
   671		rkvdec_write_regs(rkvdec, regs);
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

