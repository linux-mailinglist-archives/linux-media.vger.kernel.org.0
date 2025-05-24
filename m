Return-Path: <linux-media+bounces-33302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AFAC2CBF
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 02:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F165428DF
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 00:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077B41DE2CC;
	Sat, 24 May 2025 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuBZq+9F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC93234;
	Sat, 24 May 2025 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046718; cv=none; b=E3bJT11xz81gyWW4c6D8+AY++8AJoYJVU0QqL5tL1UjZHNIxaAvNVhngdBujDk58FOP8vemUGfL60t540nPwvLp7xvCU7UkkSCtxbGlJAwDYGjiaS+MuHPuCPfKPVjrA9oOqbbq8/FzP5yRcNKipZmXlW0EqW8TgMfCgJ/vsgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046718; c=relaxed/simple;
	bh=8B9ms8skaqPcUFNLJygoW8B0+g4QerMXzcmxHo4OEu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeFmUuYvad9Il10Yj/UI5YIAFgiFbgHSRMLYHqa76+OJdzbGOfYwZkwbmo8785Arvcld6Wk6WqVbjNhJP9ujB/HEBOlzG73qau7Erfw99+ScL9ShJi32M5enZDH1PhwFmf3+cPjp4I4UvXklx1A5wJr75L7U/9a90QKFnMiX0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuBZq+9F; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748046717; x=1779582717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8B9ms8skaqPcUFNLJygoW8B0+g4QerMXzcmxHo4OEu4=;
  b=NuBZq+9FMTQo3tB/3cSB1KGfuekrPV0wDuu02Lunk/WZf8ILQnN7pCW4
   iCWhLZ65xHf5OQo6AA/bBoUrp4bMqrYGKfSCQooEq8g7SV5tMDKJiM4g9
   RPJyYjeII8A5Byno9Q91OU9DeYvRU5ANGgT47rNYtwc+YahpHUJZmleyS
   AiHf5WpGXMnYy6v2Ij5Ey4gW0J5gGHmLgwbgTgQLbQdvFB3fikMRdU8e9
   o1bth+5MERALTEtsqJn0npxq15V6XLr6QOkSJhP82wwqCparVGQjWPGpR
   7lDtvof3nmT1pRVR1eCQC5C/fJneoaS3dcJkxxX0+BU/arEeN0Ke7/zTn
   g==;
X-CSE-ConnectionGUID: s7ZResBwTxinqwuazyR+eg==
X-CSE-MsgGUID: PkUUD9aUTMuec80uiKsEbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61461808"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61461808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:31:54 -0700
X-CSE-ConnectionGUID: 9h/MQO37R5W9JlftX8/ReQ==
X-CSE-MsgGUID: wPol45gnQbWLbG9ApDYacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146554279"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2025 17:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIcnh-000Qpc-1q;
	Sat, 24 May 2025 00:31:45 +0000
Date: Sat, 24 May 2025 08:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202505240808.VaN58jYa-lkp@intel.com>
References: <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250523-214946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250523134207.68481-6-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: i386-randconfig-014-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240808.VaN58jYa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240808.VaN58jYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240808.VaN58jYa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:251:9: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     250 |                 al_codec_err(dev, "mem check failed for 0x%16llx of size %zu",
         |                                                           ~~~~~~
         |                                                           %16x
     251 |                              *paddr, size);
         |                              ^~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:82:25: note: expanded from macro 'al_codec_err'
      81 |         dev_err(&(al_dev)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n",  \
         |                                                                      ~~~
      82 |                 __func__, __LINE__, ##args)
         |                                       ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:249:22: warning: result of comparison of constant 549755813887 with expression of type 'unsigned int' is always false [-Wtautological-constant-out-of-range-compare]
     249 |         if ((*paddr + size) > AL_CODEC_MAX_ADDR) {
         |             ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_common.c:508:50: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     508 |         al_codec_dbg(dev, "periph address = 0x%016llx", dev->apb);
         |                                               ~~~~~~~   ^~~~~~~~
         |                                               %016x
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:120:60: note: expanded from macro 'al_codec_dbg'
     120 |         dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
         |                                                       ~~~         ^~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/platform/allegro-dvt/al300/al_codec_common.c:712:8: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     711 |         al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
         |                                                 ~~~
         |                                                 %zu
     712 |                      req->req_size);
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/allegro-dvt/al300/al_codec_util.h:120:60: note: expanded from macro 'al_codec_dbg'
     120 |         dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
         |                                                       ~~~         ^~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   4 warnings generated.


vim +712 drivers/media/platform/allegro-dvt/al300/al_codec_common.c

   680	
   681	int al_common_send_req_reply(struct al_codec_dev *dev,
   682				     struct list_head *cmd_list,
   683				     struct msg_itf_header *hdr,
   684				     struct al_common_mcu_req *req)
   685	{
   686		struct al_codec_cmd *cmd = NULL;
   687		int ret;
   688	
   689		hdr->drv_cmd_hdl = 0;
   690	
   691		if (req->reply_size && req->reply) {
   692			cmd = al_codec_cmd_create(req->reply_size);
   693			if (!cmd)
   694				return -ENOMEM;
   695	
   696			hdr->drv_cmd_hdl = al_virt_to_phys(cmd);
   697		}
   698	
   699		hdr->drv_ctx_hdl = req->pCtx;
   700		hdr->type = req->req_type;
   701		hdr->payload_len = req->req_size;
   702	
   703		/* Add the list to the cmd list */
   704		if (cmd)
   705			list_add(&cmd->list, cmd_list);
   706	
   707		ret = al_common_send(dev, hdr);
   708		if (ret)
   709			goto remove_cmd;
   710	
   711		al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
 > 712			     req->req_size);
   713	
   714		if (!cmd)
   715			return 0;
   716	
   717		ret = wait_for_completion_timeout(&cmd->done, 5 * HZ);
   718		if (ret <= 0) {
   719			al_codec_err(dev, "cmd %p has %d (%s)", cmd, ret,
   720				     (ret == 0) ? "failed" : "timedout");
   721			ret = -ETIMEDOUT;
   722			goto remove_cmd;
   723		}
   724	
   725		ret = 0;
   726		memcpy(req->reply, cmd->reply, req->reply_size);
   727	
   728	remove_cmd:
   729	
   730		if (cmd) {
   731			list_del(&cmd->list);
   732			al_codec_cmd_put(cmd);
   733		}
   734		return ret;
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

