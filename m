Return-Path: <linux-media+bounces-99-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297CF7E8A62
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 11:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF5E280F8B
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 10:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F16412B60;
	Sat, 11 Nov 2023 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIoP3pcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD287F
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 10:53:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081473AA8;
	Sat, 11 Nov 2023 02:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699700020; x=1731236020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sri7pyPfJ1jGdWG8uOtu4Dd/45elvMuxlAnl70MkOjI=;
  b=JIoP3pcJiExenZubg7S/81f8ywtTGfFE2UexcpNNIqJO6MRgBeIfWf2s
   VON2UC4sjW+TH/pZO/XnAeoD2nx2EwU67xFRhyGotIyey2mUClwOjS+uq
   ZbQd4wlhU/ErdQc5frf97dGgJ9yHUUpkL1xPoGpjMLfhT0MLWWPoEkE2D
   v6Vw4QdSPbCdEhMTjQviBvayR0+4onNuHA2m1PJVkEWoHMEACx8y1jjoL
   In9VqTLqXwTvUBaq0y9ZGJAtI0KBWWQLN/bZ5Ji1b+zpWYWkuMgO0IXF1
   kr3KqRsFi7CrDV3qjp+H0OBNnFBH0RvjAWZCGoIMkwK5EZTxMLCpYLSNy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394172432"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="394172432"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 02:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767505053"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="767505053"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Nov 2023 02:53:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1lcK-000AO6-1a;
	Sat, 11 Nov 2023 10:53:32 +0000
Date: Sat, 11 Nov 2023 18:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 13/15] media: uapi: Add an entity type for audio
 resampler
Message-ID: <202311111844.o3EWWxvk-lkp@intel.com>
References: <1699595289-25773-14-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699595289-25773-14-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20231110-143635
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1699595289-25773-14-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v9 13/15] media: uapi: Add an entity type for audio resampler
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311111844.o3EWWxvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111844.o3EWWxvk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/media.h.rst:6: WARNING: undefined label: media-ent-f-proc-audio-resampler (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/media.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

