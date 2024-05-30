Return-Path: <linux-media+bounces-12240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9458D4C1D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E730B2842A4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023B17CA06;
	Thu, 30 May 2024 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ac141h56"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7A17C9E5;
	Thu, 30 May 2024 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073755; cv=none; b=F5uoA4sTeXewxxHVXooylI+qMpx62MfQSEx2SifXMeMta0+y3mQq7e1NhlrQsyKN1tImMPnXGzrMZ6BcX//wY8IiiRh5VX/1tEoiZJhQv4Wf2s9wKQF8PrkkFNhKwAk/CDcD3UBpsT2PQQWtTFXV3jfOqBuUOUoGinqFWgbcUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073755; c=relaxed/simple;
	bh=0X4fg4iFYKDndZ2Iqm/1AYkChQqhNk/LkEu9yRES+Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQ0NbegRB26XU7/6gIEMxSN+O8W5N1yugeUWlSWxOgP134vPbBAhwYyy+Sd1P+UPIQKdSWB7Hp092dj7eNhsWyGXtdRw9rjzQXiB9GA7BPRX69DqRuKT1MQ1bSCqmrXJzFBqoJWHhqrYCNChmBoEWbddOfQSYNghs8p0j2EvZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ac141h56; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717073755; x=1748609755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0X4fg4iFYKDndZ2Iqm/1AYkChQqhNk/LkEu9yRES+Ns=;
  b=ac141h56o0hK82QKcIq228m3sO1V6d8R0Oz65gXXZUr55dH6PW+RJ81c
   C5VXEsbruymAiWuYKCcKP6fpB5sckBBHTJM2wseRGaADItX0fdzZN5Aam
   x6zE1LuE+Eq0ybiZhZeOQLL62QE1n8h2LrWZKCroDMNqIvMG8kPSXrQtm
   pdpBWmgI9n+0MIgTUP6tPSDC8ip9UU1wirxbVypcSoy0e4vZ8xG74WmSB
   yqbQOPo7uaZJfWXBIB+7LPfXrcw5G9WFZTkizZZyKhSwO+VBlPrzDr3em
   EN7ZNqoQ2bQAATXPwED8bEU1tCokhIGcrUw8X/MLfJstWvNd5ffoFoyss
   g==;
X-CSE-ConnectionGUID: tqHujd/tQPKRx+cuPbtI1g==
X-CSE-MsgGUID: iuKrTuw+RHmHbOQ5GE3jZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24212936"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24212936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 05:55:54 -0700
X-CSE-ConnectionGUID: nGh0ZSuIRT+n4SJAOnAjEQ==
X-CSE-MsgGUID: sNkZZY+dSvO9LH+0m+cs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35786717"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2024 05:55:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCfJq-000FLN-2l;
	Thu, 30 May 2024 12:55:46 +0000
Date: Thu, 30 May 2024 20:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
	dan.scally@ideasonboard.com
Subject: Re: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video
 node
Message-ID: <202405302048.Twi0r71r-lkp@intel.com>
References: <20240529152858.183799-16-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-16-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[cannot apply to linuxtv-media-stage/master sailus-media-tree/master linus/master sailus-media-tree/streams v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-uapi-Add-MEDIA_BUS_FMT_RGB202020_1X60-format-code/20240529-233239
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240529152858.183799-16-dan.scally%40ideasonboard.com
patch subject: [PATCH v5 15/16] media: platform: Add mali-c55 parameters video node
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20240530/202405302048.Twi0r71r-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405302048.Twi0r71r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405302048.Twi0r71r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/media/media-entity.h:15,
                    from drivers/media/platform/arm/mali-c55/mali-c55-params.c:9:
   drivers/media/platform/arm/mali-c55/mali-c55-params.c: In function 'mali_c55_params_write_config':
>> drivers/media/platform/arm/mali-c55/mali-c55-params.c:504:40: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     504 |                 dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/arm/mali-c55/mali-c55-params.c:504:17: note: in expansion of macro 'dev_dbg'
     504 |                 dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
         |                 ^~~~~~~
   drivers/media/platform/arm/mali-c55/mali-c55-params.c:504:74: note: format string is defined here
     504 |                 dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
         |                                                                        ~~^
         |                                                                          |
         |                                                                          long unsigned int
         |                                                                        %u


vim +504 drivers/media/platform/arm/mali-c55/mali-c55-params.c

   480	
   481	void mali_c55_params_write_config(struct mali_c55 *mali_c55)
   482	{
   483		struct mali_c55_params *params = &mali_c55->params;
   484		enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
   485		struct mali_c55_params_buffer *config;
   486		struct mali_c55_buffer *buf;
   487		size_t block_offset = 0;
   488	
   489		spin_lock(&params->buffers.lock);
   490	
   491		buf = list_first_entry_or_null(&params->buffers.queue,
   492					       struct mali_c55_buffer, queue);
   493		if (buf)
   494			list_del(&buf->queue);
   495		spin_unlock(&params->buffers.lock);
   496	
   497		if (!buf)
   498			return;
   499	
   500		buf->vb.sequence = mali_c55->isp.frame_sequence;
   501		config = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
   502	
   503		if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
 > 504			dev_dbg(mali_c55->dev, "Invalid parameters buffer size %lu\n",
   505				config->total_size);
   506			state = VB2_BUF_STATE_ERROR;
   507			goto err_buffer_done;
   508		}
   509	
   510		/* Walk the list of parameter blocks and process them. */
   511		while (block_offset < config->total_size) {
   512			const struct mali_c55_block_handler *block_handler;
   513			struct mali_c55_params_block_header *block;
   514	
   515			block = (struct mali_c55_params_block_header *)
   516				 &config->data[block_offset];
   517	
   518			if (block->type >= MALI_C55_PARAM_BLOCK_SENTINEL) {
   519				dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
   520				state = VB2_BUF_STATE_ERROR;
   521				goto err_buffer_done;
   522			}
   523	
   524			block_handler = &mali_c55_block_handlers[block->type];
   525			if (block->size != block_handler->size) {
   526				dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
   527				state = VB2_BUF_STATE_ERROR;
   528				goto err_buffer_done;
   529			}
   530	
   531			block_handler->handler(mali_c55, block);
   532	
   533			block_offset += block->size;
   534		}
   535	
   536	err_buffer_done:
   537		vb2_buffer_done(&buf->vb.vb2_buf, state);
   538	}
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

