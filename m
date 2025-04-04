Return-Path: <linux-media+bounces-29422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C83A7C2FC
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 19:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D08A1178C37
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 17:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C3921A455;
	Fri,  4 Apr 2025 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTuWCNW0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F1215178;
	Fri,  4 Apr 2025 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789417; cv=none; b=UBKDdjDUTw2MgxVNk0TsXdi16rEQ3rTKtrZ6j8qvBCwfkiyZtDkp/VGb9m1N9b5UxzRf+hMt6x+D9cx/x2FRzlLLkIFf/3PyeIYaSuPd+9NJZQZPATZ4PwsWA3iopSJ1qMVSKH7yXo1nhVWaTeojhPjwTf7IcvqXCwHZhCCyhyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789417; c=relaxed/simple;
	bh=Dg2hW/aBpaDRA1oxjhtV/3dt/FgK15LMLusch/AwBEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTQDNc8CSgYD9OOBGSRRN4FNK5ZIKP/nZf6P1ggqfqoPAdChNgMOHvc1xA0/KhfG8WgQ7li0yL1yGHQ8qNWKhyMaJg1rECSh2HmlUGzZAWFscUjCYV0lv/m84r4R66gK/PolCAijvJhN6IAuw1DbOv0S89VhjomwLZxKm6Ltrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTuWCNW0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743789415; x=1775325415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dg2hW/aBpaDRA1oxjhtV/3dt/FgK15LMLusch/AwBEA=;
  b=iTuWCNW0XB4cnMIh43BCTBNFGDjGZx7HUbk3B6l6bUKq+LxaRmre0tY5
   uzigfxqKRGrllo2HZNjttlaBflcIC3rBRE/NRMLBJdOsWZ4/FIEuJ2uP1
   bCyTQJVnNAgZICMVFNBderxYU3BLaV+F7bKJkNhPhj5ZyhugttCyje2fG
   azAg8/n4hSS13SLfnbZqD37/mAkP3XzH0lnVZ9bHncli1LIduieX7bzz+
   eSfTu6xCQegNsaYs1GxY/NbTUXwMZkJ3DKESI6tTUAnz1gbnJE9kT1Ba5
   wwIFs64QqJ4R4lq3FmmH/I1/+HO476BeU6aC0NhnnV4j4jPj+sxjU4GOn
   w==;
X-CSE-ConnectionGUID: zr9kFsQSQOOVhGNpFKnIUA==
X-CSE-MsgGUID: MR2UwQ2NRKmSUC6RcBPtWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45142916"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45142916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:56:51 -0700
X-CSE-ConnectionGUID: /2xYXwjTR9aZPEhmvjgUsQ==
X-CSE-MsgGUID: GkWhimOFQKm1WCN8kzfHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="127261980"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2025 10:56:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0lHZ-0001RH-2B;
	Fri, 04 Apr 2025 17:56:45 +0000
Date: Sat, 5 Apr 2025 01:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: "bo.kong" <bo.kong@mediatek.com>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	zhaoyuan.chen@mediatek.com, Teddy.Chen@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 4/4] media: mediatek: add MT8188 AIE driver
Message-ID: <202504050137.vMfW5SAb-lkp@intel.com>
References: <20250403074005.21472-5-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403074005.21472-5-bo.kong@mediatek.com>

Hi bo.kong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bo-kong/media-dt-bindings-add-MT8188-AIE/20250403-154205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250403074005.21472-5-bo.kong%40mediatek.com
patch subject: [PATCH v5 4/4] media: mediatek: add MT8188 AIE driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250405/202504050137.vMfW5SAb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050137.vMfW5SAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050137.vMfW5SAb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c:14:
>> drivers/media/platform/mediatek/aie/mtk_aie.h:569:27: warning: 'fld_face_info_0' defined but not used [-Wunused-const-variable=]
     569 | static const unsigned int fld_face_info_0[FLD_MAX_FRAME] = {
         |                           ^~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:540:27: warning: 'attr_wdma_size' defined but not used [-Wunused-const-variable=]
     540 | static const unsigned int attr_wdma_size[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
         |                           ^~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:511:25: warning: 'attr_rdma_en' defined but not used [-Wunused-const-variable=]
     511 | static const signed int attr_rdma_en[ATTR_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:503:27: warning: 'attr_out_2size' defined but not used [-Wunused-const-variable=]
     503 | static const unsigned int attr_out_2size[ATTR_LOOP_NUM] = { /* O */
         |                           ^~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:498:27: warning: 'attr_out_stride2_as_in' defined but not used [-Wunused-const-variable=]
     498 | static const unsigned int attr_out_stride2_as_in[ATTR_LOOP_NUM] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:488:27: warning: 'attr_ker_rdma_size' defined but not used [-Wunused-const-variable=]
     488 | static const unsigned int attr_ker_rdma_size[ATTR_LOOP_NUM] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:478:27: warning: 'attr_wdma_en' defined but not used [-Wunused-const-variable=]
     478 | static const unsigned int attr_wdma_en[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
         |                           ^~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:388:25: warning: 'fd_rdma_en' defined but not used [-Wunused-const-variable=]
     388 | static const signed int fd_rdma_en[FD_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
         |                         ^~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:380:27: warning: 'out_ch_pack' defined but not used [-Wunused-const-variable=]
     380 | static const unsigned int out_ch_pack[FD_LOOP_NUM] = {
         |                           ^~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:373:27: warning: 'outlayer' defined but not used [-Wunused-const-variable=]
     373 | static const unsigned int outlayer[FD_LOOP_NUM] = {
         |                           ^~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:365:27: warning: 'in_ch_pack' defined but not used [-Wunused-const-variable=]
     365 | static const unsigned int in_ch_pack[FD_LOOP_NUM] = {
         |                           ^~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:358:27: warning: 'out_2size' defined but not used [-Wunused-const-variable=]
     358 | static const unsigned int out_2size[FD_LOOP_NUM] = {
         |                           ^~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:354:27: warning: 'fd_maxpool_indices' defined but not used [-Wunused-const-variable=]
     354 | static const unsigned int fd_maxpool_indices[FD_MAXPOOL_SIZE] = {
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:350:27: warning: 'fd_stride_indices' defined but not used [-Wunused-const-variable=]
     350 | static const unsigned int fd_stride_indices[FD_STRIDE_SIZE] = {
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:343:27: warning: 'fd_out_stride2_in' defined but not used [-Wunused-const-variable=]
     343 | static const unsigned int fd_out_stride2_in[FD_LOOP_NUM] = {
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:332:27: warning: 'fd_ker_rdma_size' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int fd_ker_rdma_size[RPN_LOOP_NUM] = {
         |                           ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie.h:307:27: warning: 'out_stride_size' defined but not used [-Wunused-const-variable=]
     307 | static const unsigned int out_stride_size[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
         |                           ^~~~~~~~~~~~~~~
--
   drivers/media/platform/mediatek/aie/mtk_aie_drv.c: In function 'aie_arrange_fddma_buf':
>> drivers/media/platform/mediatek/aie/mtk_aie_drv.c:577:20: warning: variable 'current_pa' set but not used [-Wunused-but-set-variable]
     577 |         dma_addr_t current_pa;
         |                    ^~~~~~~~~~
--
>> drivers/media/platform/mediatek/aie/mtk_aie_drv.c:872: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The aie driver just loads the bin file provided by algorithm.


vim +/fld_face_info_0 +569 drivers/media/platform/mediatek/aie/mtk_aie.h

   372	
 > 373	static const unsigned int outlayer[FD_LOOP_NUM] = {
   374		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
   375		1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   376		0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
   377		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
   378	};
   379	
 > 380	static const unsigned int out_ch_pack[FD_LOOP_NUM] = {
   381		16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
   382		32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0, 16, 16, 16, 16, 16, 32, 32,
   383		32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32,
   384		32, 32, 32, 0, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32,
   385		32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0
   386	};
   387	
 > 388	static const signed int fd_rdma_en[FD_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
   389		{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
   390		{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   391		{ { 1, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   392		{ { 1, 0 }, { 2, 0 }, { -1, -1 }, { -1, -1 } },
   393		{ { 3, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   394		{ { 1, 2 }, { 2, 2 }, { 4, 2 }, { 4, 3 } },
   395		{ { 5, 0 }, { 5, 1 }, { -1, -1 }, { -1, -1 } },
   396		{ { 6, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   397		{ { 5, 0 }, { 5, 1 }, { 7, 0 }, { -1, -1 } },
   398		{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
   399		{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   400		{ { 5, 2 }, { 5, 3 }, { 7, 2 }, { 10, 2 } },
   401		{ { 11, 0 }, { 11, 1 }, { -1, -1 }, { -1, -1 } },
   402		{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   403		{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   404		{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { -1, -1 } },
   405		{ { 15, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   406		{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   407		{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { 17, 0 } },
   408		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   409		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   410		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   411		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   412		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   413		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   414		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   415		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   416		{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
   417		{ { 19, 0 }, { 22, 0 }, { 22, 1 }, { 25, 0 } },
   418		{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
   419		{ { 29, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   420		{ { 30, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   421		{ { 30, 0 }, { 31, 0 }, { -1, -1 }, { -1, -1 } },
   422		{ { 32, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   423		{ { 30, 2 }, { 31, 2 }, { 33, 2 }, { 33, 3 } },
   424		{ { 34, 0 }, { 34, 1 }, { -1, -1 }, { -1, -1 } },
   425		{ { 35, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   426		{ { 34, 0 }, { 34, 1 }, { 36, 0 }, { -1, -1 } },
   427		{ { 37, 0 }, { 37, 1 }, { -1, -1 }, { -1, -1 } },
   428		{ { 38, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   429		{ { 34, 2 }, { 34, 3 }, { 36, 2 }, { 39, 2 } },
   430		{ { 40, 0 }, { 40, 1 }, { -1, -1 }, { -1, -1 } },
   431		{ { 41, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   432		{ { 42, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   433		{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { -1, -1 } },
   434		{ { 44, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   435		{ { 45, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   436		{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { 46, 0 } },
   437		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   438		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   439		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   440		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   441		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   442		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   443		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   444		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   445		{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
   446		{ { 48, 0 }, { 51, 0 }, { 51, 1 }, { 54, 0 } },
   447		{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
   448		{ { 58, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   449		{ { 59, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   450		{ { 59, 0 }, { 60, 0 }, { -1, -1 }, { -1, -1 } },
   451		{ { 61, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   452		{ { 59, 2 }, { 60, 2 }, { 62, 2 }, { 62, 3 } },
   453		{ { 63, 0 }, { 63, 1 }, { -1, -1 }, { -1, -1 } },
   454		{ { 64, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   455		{ { 63, 0 }, { 63, 1 }, { 65, 0 }, { -1, -1 } },
   456		{ { 66, 0 }, { 66, 1 }, { -1, -1 }, { -1, -1 } },
   457		{ { 67, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   458		{ { 63, 2 }, { 63, 3 }, { 65, 2 }, { 68, 2 } },
   459		{ { 69, 0 }, { 69, 1 }, { -1, -1 }, { -1, -1 } },
   460		{ { 70, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   461		{ { 71, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   462		{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { -1, -1 } },
   463		{ { 73, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   464		{ { 74, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   465		{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { 75, 0 } },
   466		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   467		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   468		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   469		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   470		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   471		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   472		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   473		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   474		{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
   475		{ { 77, 0 }, { 80, 0 }, { 80, 1 }, { 83, 0 } }
   476	};
   477	
 > 478	static const unsigned int attr_wdma_en[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
   479		{ 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
   480		{ 1, 1, 1, 1 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 1, 0 },
   481		{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
   482		{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
   483		{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
   484		{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
   485		{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }
   486	};
   487	
 > 488	static const unsigned int attr_ker_rdma_size[ATTR_LOOP_NUM] = {
   489		240, 1168, 272, 2320,
   490		2080, 9232, 3104, 9232,
   491		4128, 1040, 4624, 4624,
   492		1552, 4624, 4624, 4128,
   493		9232, 272, 9232, 2320,
   494		144, 9232, 272, 9232,
   495		2320, 144
   496	};
   497	
 > 498	static const unsigned int attr_out_stride2_as_in[ATTR_LOOP_NUM] = {
   499		0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0,
   500		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
   501	};
   502	
 > 503	static const unsigned int attr_out_2size[ATTR_LOOP_NUM] = { /* O */
   504		1, 1, 0, 1, 1, 1, 0,
   505		1, 0, 0, 0, 0, 0, 0,
   506		0, 0, 0, 0, 0, 0, 0,
   507		0, 0, 0, 0, 0
   508	};
   509	
   510	/* [loop][ch][output_index] */
 > 511	static const signed int attr_rdma_en[ATTR_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
   512		{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
   513		{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   514		{ { 0, 0 }, { 1, 0 }, { -1, -1 }, { -1, -1 } },
   515		{ { 2, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   516		{ { 0, 2 }, { 1, 2 }, { 3, 2 }, { 3, 3 } },
   517		{ { 4, 0 }, { 4, 1 }, { -1, -1 }, { -1, -1 } },
   518		{ { 4, 0 }, { 4, 1 }, { 5, 0 }, { -1, -1 } },
   519		{ { 6, 0 }, { 6, 1 }, { -1, -1 }, { -1, -1 } },
   520		{ { 4, 2 }, { 4, 3 }, { 5, 2 }, { 7, 2 } },
   521		{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
   522		{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   523		{ { 10, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   524		{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { -1, -1 } },
   525		{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   526		{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   527		{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { 14, 0 } },
   528		{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
   529		{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   530		{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
   531		{ { 18, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   532		{ { 19, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   533		{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
   534		{ { 21, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   535		{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
   536		{ { 23, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
   537		{ { 24, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } }
   538	};
   539	
 > 540	static const unsigned int attr_wdma_size[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
   541		{ 16384, 0, 4096, 0 },
   542		{ 16384, 0, 4096, 0 },
   543		{ 16384, 0, 0, 0 },
   544		{ 16384, 16384, 4096, 4096 },
   545		{ 8192, 8192, 2048, 2048 },
   546		{ 8192, 0, 2048, 0 },
   547		{ 8192, 8192, 0, 0 },
   548		{ 8192, 0, 2048, 0 },
   549		{ 2048, 2048, 0, 0 },
   550		{ 2048, 0, 0, 0 },
   551		{ 2048, 0, 0, 0 },
   552		{ 2048, 0, 0, 0 },
   553		{ 2048, 0, 0, 0 },
   554		{ 2048, 0, 0, 0 },
   555		{ 2048, 0, 0, 0 },
   556		{ 2048, 2048, 0, 0 },
   557		{ 2048, 0, 0, 0 },
   558		{ 0, 0, 0, 0 },
   559		{ 2048, 0, 0, 0 },
   560		{ 1024, 0, 0, 0 },
   561		{ 0, 0, 0, 0 },
   562		{ 2048, 0, 0, 0 },
   563		{ 0, 0, 0, 0 },
   564		{ 2048, 0, 0, 0 },
   565		{ 1024, 0, 0, 0 },
   566		{ 0, 0, 0, 0 }
   567	};
   568	
 > 569	static const unsigned int fld_face_info_0[FLD_MAX_FRAME] = {
   570		0x440, 0x44C, 0x458, 0x464, 0x470, 0x47C, 0x488, 0x494, 0x4A4,
   571		0x4B0, 0x4BC, 0x4C8, 0x4D4, 0x4E0, 0x4EC
   572	};
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

