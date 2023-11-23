Return-Path: <linux-media+bounces-868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF37F5633
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 02:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB0C2B21195
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 01:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C54421;
	Thu, 23 Nov 2023 01:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHBUP8MD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB76B1715;
	Wed, 22 Nov 2023 17:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704514; x=1732240514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VHehZwpNIdPmTUBaWqya7f7B1A3v9vGc+DstRouPofo=;
  b=BHBUP8MDbK3/mWK2tNoncofNVQ02S8JDw/i7E8tR+LA+M9jveD3X8dna
   GIPwfYi4/d7JpZTVyTBxnqjrVMMa0rDHLoVf2rwUFG0jX9IlJ/OBGV5ql
   X5LvwccRTveo+1MamWTEG/URfE5/IGPCqFfKIblyCFf5mUuqb8fgixthi
   JqhbaTFhLs0Mp6JcwYlN2jVyxOTdjy4ReNb0stjLU87kSyA4hiiae09lW
   soDn68AUOmWOgqbRo7zd3Gt7pX7670kO47Kw7jHapoo3yGY6OYighpKb8
   Bcbtki/MUaQMf//ohae9IlE3IwfJLOTO75ipDrwXwyE5wHb590HH75jtZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458674161"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458674161"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884821106"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="884821106"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 17:55:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvq-00016C-38;
	Thu, 23 Nov 2023 01:55:06 +0000
Date: Thu, 23 Nov 2023 09:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera
 interface driver
Message-ID: <202311230551.R2sCXDEC-lkp@intel.com>
References: <20231122073927.788810-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122073927.788810-4-alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on media-tree/master linuxtv-media-stage/master linus/master v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/dt-bindings-media-add-bindings-for-stm32-dcmipp/20231122-154327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231122073927.788810-4-alain.volmat%40foss.st.com
patch subject: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera interface driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231123/202311230551.R2sCXDEC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230551.R2sCXDEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230551.R2sCXDEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:7: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
                ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:5: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:256:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:312:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           src_fmt = v4l2_subdev_state_get_format(state, 1);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 3 errors generated.
--
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:8: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           r = v4l2_subdev_state_get_compose(sd_state, i);
                               ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:8: note: did you mean 'v4l2_subdev_state_get_format'?
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:8: note: 'v4l2_subdev_state_get_format' declared here
                   mf = v4l2_subdev_state_get_format(sd_state, i);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                           r = v4l2_subdev_state_get_compose(sd_state, i);
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:8: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           r = v4l2_subdev_state_get_crop(sd_state, i);
                               ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                           r = v4l2_subdev_state_get_crop(sd_state, i);
                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:14: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:12: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:13: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   compose = v4l2_subdev_state_get_compose(sd_state, 0);
                             ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
                   compose = v4l2_subdev_state_get_compose(sd_state, 0);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:7: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
                ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:5: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:255:17: error: indirection requires pointer operand ('int' invalid)
                   fmt->format = *v4l2_subdev_state_get_format(sd_state, 0);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:266:3: error: indirection requires pointer operand ('int' invalid)
                   *v4l2_subdev_state_get_format(sd_state, 1) = fmt->format;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(sd_state, 1);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(sd_state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:8: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                        ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:365:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 0);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:370:6: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
                   mf = v4l2_subdev_state_get_format(sd_state, 1);
                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:13: error: implicit declaration of function 'v4l2_subdev_state_get_format' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                      ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:11: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_mbus_framefmt *' from 'int' [-Wint-conversion]
           sink_fmt = v4l2_subdev_state_get_format(state, 0);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:12: error: implicit declaration of function 'v4l2_subdev_state_get_compose' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           compose = v4l2_subdev_state_get_compose(state, 0);
                     ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:10: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           compose = v4l2_subdev_state_get_compose(state, 0);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:408:9: error: implicit declaration of function 'v4l2_subdev_state_get_crop' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           crop = v4l2_subdev_state_get_crop(state, 1);
                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:408:7: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_rect *' from 'int' [-Wint-conversion]
           crop = v4l2_subdev_state_get_crop(state, 1);


vim +/v4l2_subdev_state_get_format +154 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

   145	
   146	static int dcmipp_par_init_cfg(struct v4l2_subdev *sd,
   147				       struct v4l2_subdev_state *sd_state)
   148	{
   149		unsigned int i;
   150	
   151		for (i = 0; i < sd->entity.num_pads; i++) {
   152			struct v4l2_mbus_framefmt *mf;
   153	
 > 154			mf = v4l2_subdev_state_get_format(sd_state, i);
   155			*mf = fmt_default;
   156		}
   157	
   158		return 0;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

