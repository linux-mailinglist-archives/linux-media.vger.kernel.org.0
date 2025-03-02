Return-Path: <linux-media+bounces-27308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C6A4B4FD
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 22:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6D4188D8DF
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 21:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4BA1EE7D5;
	Sun,  2 Mar 2025 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRJlufjS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE441EDA3E;
	Sun,  2 Mar 2025 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740951732; cv=none; b=mWBTsvDDM3tBdeFr0qTLKo8/Jgk+GfKPR5eWY1AGe522LlJ71XGcoYsZ92BfCVHa6wRCOIQ/DtPOf4WC4OJt5BpcsvodpIAa4TgnMyP1i4Zraih8Xd60HLz72v3ncRTtegIQMhK7oIfvI7LFOXHTcB3YHkQLrwwuJ90RrUskgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740951732; c=relaxed/simple;
	bh=n/owQeef8/mE5carj3xBdBe6w8LTQcNKNkp7SRvPV2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp5IXCTjb/xFzLgv5v6+jY6OdKzU/x6n0yYtHVz8qACdeoYuAkEV3H5koNAKGSURz+lzYciGq09EBjFJwt/5F2Vf7/FpIVnP3S6ssjyNVqQ9KNTtfIX6BgG/6nnULrLBpKimxpP32XE8o3LGRv58XP6BdJLl5gj9f4JoghpRn7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRJlufjS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740951729; x=1772487729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/owQeef8/mE5carj3xBdBe6w8LTQcNKNkp7SRvPV2Q=;
  b=KRJlufjSBwa+dRekb9oR8DBEsAFivisx5QqL2QMIEW2YNnCMqLaLs4vU
   i8ZBf4uPtPkm2aRbYg2fzIqnPQx1+fxdWlcN7wWxoIBBlG86kUiK97J4r
   cKFPsRJ77jr3wM8xjBKTvlT3p0PZ7suvduzn1JNOFbpzMY8qM4ao567Hp
   KAi/hvaI6gzFAMTguD7Vr6ZhTGKtGVUfQs4BkaHomY76NQKIb0LZPOjDT
   jb7BNz/hME4d9PEKUzCK50/t40jw9utUatnokhxfQZHNe6m3CljwbVdaT
   Z+8bofPLUFMqndjbkIwM7rVAtCsD8Qp7AcYo4P/jnLZywj+CwhiOXHvNK
   g==;
X-CSE-ConnectionGUID: i2FIyX/MTLmiNrej+I9iNg==
X-CSE-MsgGUID: RQdIoFyPQlyihTNz3+iXnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44635253"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="44635253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 13:42:08 -0800
X-CSE-ConnectionGUID: 0gt7opgCTXa/4+gP2U28LQ==
X-CSE-MsgGUID: qmuQWeQaR0mgSJtWt/kOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118321297"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2025 13:42:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tor4R-000Hes-1e;
	Sun, 02 Mar 2025 21:42:00 +0000
Date: Mon, 3 Mar 2025 05:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	linux-samsung-soc@vger.kernel.org, gost.dev@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: Re: [PATCH] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL
 interrupt
Message-ID: <202503030529.ccd21udL-lkp@intel.com>
References: <20250228065952.14375-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228065952.14375-1-aakarsh.jain@samsung.com>

Hi Aakarsh,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linuxtv-media-pending/master linus/master sailus-media-tree/streams sailus-media-tree/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aakarsh-Jain/media-s5p-mfc-Support-for-handling-RET_ENC_BUFFER_FULL-interrupt/20250228-175738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250228065952.14375-1-aakarsh.jain%40samsung.com
patch subject: [PATCH] media: s5p-mfc: Support for handling RET_ENC_BUFFER_FULL interrupt
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250303/202503030529.ccd21udL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030529.ccd21udL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030529.ccd21udL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c: In function 's5p_mfc_irq':
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:742:14: error: 'S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET' undeclared (first use in this function); did you mean 'S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET'?
     742 |         case S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c:742:14: note: each undeclared identifier is reported only once for each function it appears in


vim +742 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c

   645	
   646	/* Interrupt processing */
   647	static irqreturn_t s5p_mfc_irq(int irq, void *priv)
   648	{
   649		struct s5p_mfc_dev *dev = priv;
   650		struct s5p_mfc_ctx *ctx;
   651		unsigned int reason;
   652		unsigned int err;
   653	
   654		mfc_debug_enter();
   655		/* Reset the timeout watchdog */
   656		atomic_set(&dev->watchdog_cnt, 0);
   657		spin_lock(&dev->irqlock);
   658		ctx = dev->ctx[dev->curr_ctx];
   659		/* Get the reason of interrupt and the error code */
   660		reason = s5p_mfc_hw_call(dev->mfc_ops, get_int_reason, dev);
   661		err = s5p_mfc_hw_call(dev->mfc_ops, get_int_err, dev);
   662		mfc_debug(1, "Int reason: %d (err: %08x)\n", reason, err);
   663		switch (reason) {
   664		case S5P_MFC_R2H_CMD_ERR_RET:
   665			/* An error has occurred */
   666			if (ctx->state == MFCINST_RUNNING &&
   667				(s5p_mfc_hw_call(dev->mfc_ops, err_dec, err) >=
   668					dev->warn_start ||
   669					err == S5P_FIMV_ERR_NO_VALID_SEQ_HDR ||
   670					err == S5P_FIMV_ERR_INCOMPLETE_FRAME ||
   671					err == S5P_FIMV_ERR_TIMEOUT))
   672				s5p_mfc_handle_frame(ctx, reason, err);
   673			else
   674				s5p_mfc_handle_error(dev, ctx, reason, err);
   675			clear_bit(0, &dev->enter_suspend);
   676			break;
   677	
   678		case S5P_MFC_R2H_CMD_SLICE_DONE_RET:
   679		case S5P_MFC_R2H_CMD_FIELD_DONE_RET:
   680		case S5P_MFC_R2H_CMD_FRAME_DONE_RET:
   681			if (ctx->c_ops->post_frame_start) {
   682				if (ctx->c_ops->post_frame_start(ctx))
   683					mfc_err("post_frame_start() failed\n");
   684	
   685				if (ctx->state == MFCINST_FINISHING &&
   686							list_empty(&ctx->ref_queue)) {
   687					s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   688					s5p_mfc_handle_stream_complete(ctx);
   689					break;
   690				}
   691				s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   692				WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
   693				s5p_mfc_clock_off(dev);
   694				wake_up_ctx(ctx, reason, err);
   695				s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   696			} else {
   697				s5p_mfc_handle_frame(ctx, reason, err);
   698			}
   699			break;
   700	
   701		case S5P_MFC_R2H_CMD_SEQ_DONE_RET:
   702			s5p_mfc_handle_seq_done(ctx, reason, err);
   703			break;
   704	
   705		case S5P_MFC_R2H_CMD_OPEN_INSTANCE_RET:
   706			ctx->inst_no = s5p_mfc_hw_call(dev->mfc_ops, get_inst_no, dev);
   707			ctx->state = MFCINST_GOT_INST;
   708			goto irq_cleanup_hw;
   709	
   710		case S5P_MFC_R2H_CMD_CLOSE_INSTANCE_RET:
   711			ctx->inst_no = MFC_NO_INSTANCE_SET;
   712			ctx->state = MFCINST_FREE;
   713			goto irq_cleanup_hw;
   714	
   715		case S5P_MFC_R2H_CMD_SYS_INIT_RET:
   716		case S5P_MFC_R2H_CMD_FW_STATUS_RET:
   717		case S5P_MFC_R2H_CMD_SLEEP_RET:
   718		case S5P_MFC_R2H_CMD_WAKEUP_RET:
   719			if (ctx)
   720				clear_work_bit(ctx);
   721			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   722			clear_bit(0, &dev->hw_lock);
   723			clear_bit(0, &dev->enter_suspend);
   724			wake_up_dev(dev, reason, err);
   725			break;
   726	
   727		case S5P_MFC_R2H_CMD_INIT_BUFFERS_RET:
   728			s5p_mfc_handle_init_buffers(ctx, reason, err);
   729			break;
   730	
   731		case S5P_MFC_R2H_CMD_COMPLETE_SEQ_RET:
   732			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   733			ctx->int_type = reason;
   734			ctx->int_err = err;
   735			s5p_mfc_handle_stream_complete(ctx);
   736			break;
   737	
   738		case S5P_MFC_R2H_CMD_DPB_FLUSH_RET:
   739			ctx->state = MFCINST_RUNNING;
   740			goto irq_cleanup_hw;
   741	
 > 742		case S5P_MFC_R2H_CMD_ENC_BUFFER_FULL_RET:
   743			ctx->state = MFCINST_NAL_ABORT;
   744			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   745			set_work_bit(ctx);
   746			WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
   747			s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   748			break;
   749	
   750		case S5P_MFC_R2H_CMD_NAL_ABORT_RET:
   751			ctx->state = MFCINST_ERROR;
   752			s5p_mfc_cleanup_queue(&ctx->dst_queue, &ctx->vq_dst);
   753			s5p_mfc_cleanup_queue(&ctx->src_queue, &ctx->vq_src);
   754			goto irq_cleanup_hw;
   755	
   756		default:
   757			mfc_debug(2, "Unknown int reason\n");
   758			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   759		}
   760		spin_unlock(&dev->irqlock);
   761		mfc_debug_leave();
   762		return IRQ_HANDLED;
   763	irq_cleanup_hw:
   764		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
   765		ctx->int_type = reason;
   766		ctx->int_err = err;
   767		ctx->int_cond = 1;
   768		if (test_and_clear_bit(0, &dev->hw_lock) == 0)
   769			mfc_err("Failed to unlock hw\n");
   770	
   771		s5p_mfc_clock_off(dev);
   772		clear_work_bit(ctx);
   773		wake_up(&ctx->queue);
   774	
   775		s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
   776		spin_unlock(&dev->irqlock);
   777		mfc_debug(2, "Exit via irq_cleanup_hw\n");
   778		return IRQ_HANDLED;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

