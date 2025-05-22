Return-Path: <linux-media+bounces-33132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC4AC0D5A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A36DC1BC4C87
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B87828C2B4;
	Thu, 22 May 2025 13:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOgVJBYd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669CA28B4EB
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922033; cv=none; b=Bmd+PSrrwAjy5B80xKOqIssYTZpLFf7dmDlf76LQIdHyLDFI63cuSVoUp3b/mw+4zVK0ipSN7pRRaUqFJYjypfBD8e+NT9ZwoFD5jShgW3DxCMk19F5guMrTmPjp0ZPUQgGphXoLaPawJd3Rwvx+AUcEIaraWBldAVTom11NKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922033; c=relaxed/simple;
	bh=ojmwXsKnN12PQfNVzmnMorUlKwCaq5wQhn3eVS6G9hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SltpyNBpbI4utFnwJl838sDeLvkiQer7MiKp2092GCVApWK1LOQ2SlFFzroZHLlpCm4YQf53kJqoiu2jmK1RO4+Zz8E8Mg/BKR+Dx2Q3fzidv+lWtSskFno0tUpe0tVAp/u37eJiNb1exZghrOCHFXgmSHYDZJ/9uEZ4zbDlq30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOgVJBYd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747922032; x=1779458032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ojmwXsKnN12PQfNVzmnMorUlKwCaq5wQhn3eVS6G9hU=;
  b=XOgVJBYdimNe+dWKE3QYG4XafVx5vhHSFxz40WoJJwLAxa2mo0pn8WQn
   KSGe9vWDu0mdT9AtE9Gfr9iqyWaO0lJBm77zZtvztj0++ddYiizXUN6gh
   6yACI96D1/jmivtN/2DD0Pvim78i9kAIbJXNYPwemqlxBqNoiVkSsznKz
   4CN7hairNQCxj8J7sYj5QQK6JL3PLa7tXAPsxnYM+l0HZIbxCwuERKE8F
   Hslh4UdU6hcK6NXyIec9Cu9Vg5TMzHycQ4EmTQ+fvvBT9n38RuL93MKeK
   s9JHlbYif5iyoaEaAA/n575WviPur8NWogwSBOPF4oKYQLXMNMi8R7Xlr
   A==;
X-CSE-ConnectionGUID: H35Z29meSy23qqp03gTFqg==
X-CSE-MsgGUID: IzBC9a+zSG6DAjP8EEmNVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60995238"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="60995238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 06:53:52 -0700
X-CSE-ConnectionGUID: vhNfBnfFQSK0bL1Gvz+l6w==
X-CSE-MsgGUID: bhh7yZ12RvOb/kIbzLtkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145850403"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2025 06:53:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI6Mm-000POS-0w;
	Thu, 22 May 2025 13:53:48 +0000
Date: Thu, 22 May 2025 21:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
Message-ID: <202505222107.vNoAm2e7-lkp@intel.com>
References: <20250519140403.443915-2-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519140403.443915-2-dan.scally@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master sailus-media-tree/master media-tree/master v6.15-rc7 next-20250522]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250519-222333
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250519140403.443915-2-dan.scally%40ideasonboard.com
patch subject: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
config: m68k-randconfig-r111-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222107.vNoAm2e7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505222107.vNoAm2e7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222107.vNoAm2e7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/mc/mc-entity.c:1093:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/media/mc/mc-entity.c:1093:17: sparse:    void
   drivers/media/mc/mc-entity.c:1093:17: sparse:    int

vim +1093 drivers/media/mc/mc-entity.c

  1081	
  1082	int media_pipeline_stopped(struct media_pipeline *pipe)
  1083	{
  1084		struct media_pipeline_entity_iter iter;
  1085		struct media_entity *entity;
  1086		int ret;
  1087	
  1088		ret = media_pipeline_entity_iter_init(pipe, &iter);
  1089		if (ret)
  1090			return ret;
  1091	
  1092		media_pipeline_for_each_entity(pipe, &iter, entity)
> 1093			media_entity_call(entity, pipeline_stopped);
  1094	
  1095		media_pipeline_entity_iter_cleanup(&iter);
  1096	
  1097		return 0;
  1098	}
  1099	EXPORT_SYMBOL_GPL(media_pipeline_stopped);
  1100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

