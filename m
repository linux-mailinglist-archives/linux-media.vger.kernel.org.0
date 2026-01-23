Return-Path: <linux-media+bounces-51417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBDwKiBpc2mivQAAu9opvQ
	(envelope-from <linux-media+bounces-51417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:27:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188B75C36
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97833302963F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 12:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EFB33BBBF;
	Fri, 23 Jan 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7thJpAD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A672E7F11;
	Fri, 23 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171222; cv=none; b=TEdyBdiBsGQRVHCBmEut89ho42TayR9ODR+3/z9QPzD9OcgIEvIafifkStDGHJyPFnyfUoMdPuik99MSoADHnkDaGbaJEMXvACDxvrTRYm0gj4PTzUt5ahaHm9bZOdD57zkeX17wG4M2SqKslUlGCTKtFa1mtP+obZpymQIJ+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171222; c=relaxed/simple;
	bh=3iT+Gee8r381xtGkYnpzN+q/2dGkK5QY8w1KqVQC8Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onYdwwq+WicublBj7HtXSi5LbkGZtTUfU430Dic/gXohqazfW18Tu1b8JThDMqKFTqqbrJsTVVheYHYfFJLFov4NZnEhidec/f06CVTaNFD+Aome0TkV8USEBVb6tt2xDVujMlCraoqkth3EQMX37Cw5jz8auj+4JQ4X7MR4E1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7thJpAD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769171220; x=1800707220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3iT+Gee8r381xtGkYnpzN+q/2dGkK5QY8w1KqVQC8Gs=;
  b=H7thJpADQEccZ8mGg6Ca3Se796EoMArX8CoMJhNXhtYWhKGlqr+8LDbt
   ubQYF7RouneCSKIrvp99sgRYvwz+iTHug4fUzP9UduqHMJbNlzr4wdlwx
   koO1LzBk439zS1rvanmy4OI2hDB+MJjp6nk7U4e3VFSxidjmbLydhR0li
   lGwjdm2aom1BJFKdVEsraB1pEK7ay3vPP2J/u9H8yrDm/mOzXAsPi6mSQ
   yqR7d1wlxkIsHC8oZXfWSngZEJG1jES+YQBkhkcPjJw8h7Aqd0TG1ndI5
   gJRI6z5jMdLj/ub3hnyfN75EMcaq0qfi6tqJ2WWgmCkJYOj+Vb9F7tzev
   A==;
X-CSE-ConnectionGUID: sQhatZjhRfOlQE0cu2yr4Q==
X-CSE-MsgGUID: SUNQ4hUbTWmc0k058hVeRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87841446"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="87841446"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:26:59 -0800
X-CSE-ConnectionGUID: 5n8F5fXOSP+30nLg7BP14g==
X-CSE-MsgGUID: zshX63vFSbi7DxIoTLduJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206274997"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 04:26:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGFY-00000000Twa-42p4;
	Fri, 23 Jan 2026 12:26:52 +0000
Date: Fri, 23 Jan 2026 20:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Message-ID: <202601232059.fCMMbALw-lkp@intel.com>
References: <20260123031713.14621-6-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123031713.14621-6-kyrie.wu@mediatek.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51417-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,collabora.com,gmail.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3188B75C36
X-Rspamd-Action: no action

Hi Kyrie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyrie-Wu/media-mediatek-jpeg-fix-jpeg-cores-amounts-setting/20260123-112425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123031713.14621-6-kyrie.wu%40mediatek.com
patch subject: [PATCH v12 05/12] media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260123/202601232059.fCMMbALw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232059.fCMMbALw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232059.fCMMbALw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:429:12: warning: 'mtk_jpegenc_resume' defined but not used [-Wunused-function]
     429 | static int mtk_jpegenc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:420:12: warning: 'mtk_jpegenc_suspend' defined but not used [-Wunused-function]
     420 | static int mtk_jpegenc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:412:12: warning: 'mtk_jpegenc_pm_resume' defined but not used [-Wunused-function]
     412 | static int mtk_jpegenc_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:402:12: warning: 'mtk_jpegenc_pm_suspend' defined but not used [-Wunused-function]
     402 | static int mtk_jpegenc_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpegdec_hw_irq_handler':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:549:30: warning: variable 'ctx' set but not used [-Wunused-but-set-variable]
     549 |         struct mtk_jpeg_ctx *ctx;
         |                              ^~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: At top level:
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:707:12: warning: 'mtk_jpegdec_resume' defined but not used [-Wunused-function]
     707 | static int mtk_jpegdec_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:698:12: warning: 'mtk_jpegdec_suspend' defined but not used [-Wunused-function]
     698 | static int mtk_jpegdec_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:690:12: warning: 'mtk_jpegdec_pm_resume' defined but not used [-Wunused-function]
     690 | static int mtk_jpegdec_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:680:12: warning: 'mtk_jpegdec_pm_suspend' defined but not used [-Wunused-function]
     680 | static int mtk_jpegdec_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_jpegenc_resume +429 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

   401	
 > 402	static int mtk_jpegenc_pm_suspend(struct device *dev)
   403	{
   404		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   405	
   406		clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
   407					   jpeg->venc_clk.clks);
   408	
   409		return 0;
   410	}
   411	
 > 412	static int mtk_jpegenc_pm_resume(struct device *dev)
   413	{
   414		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   415	
   416		return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
   417					       jpeg->venc_clk.clks);
   418	}
   419	
 > 420	static int mtk_jpegenc_suspend(struct device *dev)
   421	{
   422		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   423	
   424		v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
   425	
   426		return pm_runtime_force_suspend(dev);
   427	}
   428	
 > 429	static int mtk_jpegenc_resume(struct device *dev)
   430	{
   431		struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
   432		int ret;
   433	
   434		ret = pm_runtime_force_resume(dev);
   435		if (ret < 0)
   436			return ret;
   437	
   438		v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
   439	
   440		return 0;
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

