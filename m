Return-Path: <linux-media+bounces-15959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8CD94B444
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 02:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6782C283029
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 00:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F861373;
	Thu,  8 Aug 2024 00:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5SesZ0i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2820ED;
	Thu,  8 Aug 2024 00:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723077807; cv=none; b=ilfOhtqOLthOHmmhM3/7qJ1cxYVwmtqjr9VS2BftCyH5LaNBpfqvRIy8x32nF9EtFLyITQGW2gukdK5gBStukeod6NhV3s7h8/J/yCWxK/9/6oHbSFRpuawdiCkslPinOA/0SOLOfexGhaO+05Uf8KH8AWsjHq/4xZUuyrryuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723077807; c=relaxed/simple;
	bh=nMQeQO9juOP/urzyZwNp6oAyWdRfl3fIrxLNYUjD1Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvxU7JdbNkWEEbXJrbBlsSiF5VsXklbb6JtPlKXocR84JKZwoWAQYRWInBZVMJvh/F3TUkIbeFtPUbI59O+//a0/knowL6LPVPJdAgg92lSByZw9dQeI1iffSNaOwIN3Cz2++dBQLFOF8cxqc+yv5hiKxEH5irZu12IbCfF2eY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5SesZ0i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723077806; x=1754613806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMQeQO9juOP/urzyZwNp6oAyWdRfl3fIrxLNYUjD1Yo=;
  b=H5SesZ0ii6g0ll3gWC1qJ3WXPOhrrfgJ2zGiHvq8koz+aW5nG/CamVXJ
   R6GZZgDFz+19a3tKb3dkYUBmkDhE5Ncx9M9MTubbjnhXJuT9gNwB447cL
   AGMRPClnPxxhr6Rdi8FWDrm60O93Z6ubzJ+fh12gPDAeDb/+T/MF+Gkl1
   QZvEnejbPnSxai3F8Bg9kY7DGDwe9GPhG7T+4sV0PUnyXSNliNJiEI7aI
   hgUHfLdCCiag+U9gm5XtzQan+GSSW+uSQwYQEYyyrbcAfKhZ85PaQcm6L
   VmhjeLeVzfzpI3ZYhUvsmGQ8J6X0yUHQHgf9+bS/zLtdcTjFxtI7UM+OA
   g==;
X-CSE-ConnectionGUID: sg3uiqBUSEGyhTLpysSbmA==
X-CSE-MsgGUID: /ExmqpTQS5KDTRF8ojp4ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38638280"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="38638280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 17:43:25 -0700
X-CSE-ConnectionGUID: kWCySDzrT2qyKCo25dnpnA==
X-CSE-MsgGUID: HiRH4qizSYOE3YptmFQVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61446502"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2024 17:43:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbrFQ-0005p2-2U;
	Thu, 08 Aug 2024 00:43:20 +0000
Date: Thu, 8 Aug 2024 08:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, daniel.almeida@collabora.com,
	mchehab@kernel.org, angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
Message-ID: <202408080826.MtdkQQdh-lkp@intel.com>
References: <20240807130835.26739-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807130835.26739-1-jianhua.lin@mediatek.com>

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc2 next-20240807]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-support-34bits/20240807-211309
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240807130835.26739-1-jianhua.lin%40mediatek.com
patch subject: [PATCH v5 1/1] media: mediatek: jpeg: support 34bits
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240808/202408080826.MtdkQQdh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080826.MtdkQQdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080826.MtdkQQdh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpeg_set_enc_src':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:104:39: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     104 |                                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
         |                                       ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpeg_dec_set_dst_bank0':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:294:23: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     294 |                 val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
         |                       ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +104 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

    87	
    88	void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
    89				  struct vb2_buffer *src_buf)
    90	{
    91		int i;
    92		dma_addr_t dma_addr;
    93		u32 val;
    94		u32 upper;
    95		bool support_34bit = ctx->jpeg->variant->support_34bit;
    96	
    97		for (i = 0; i < src_buf->num_planes; i++) {
    98			dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
    99				   src_buf->planes[i].data_offset;
   100			if (!i) {
   101				writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
   102				if (support_34bit) {
   103					upper = upper_32_bits(dma_addr);
 > 104					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   105					writel(val, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);
   106				}
   107			} else {
   108				writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
   109				if (support_34bit) {
   110					upper = upper_32_bits(dma_addr);
   111					val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
   112					writel(val, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);
   113				}
   114			}
   115		}
   116	}
   117	EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

