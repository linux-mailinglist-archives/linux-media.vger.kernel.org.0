Return-Path: <linux-media+bounces-22544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B99E1D86
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 14:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13CA282839
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3833E1EF09C;
	Tue,  3 Dec 2024 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu/wc44g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058019A297
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733232430; cv=none; b=FQnkibA/KwOOkC0vLB+OCvMiO5u+AnkcAbyUOhQGAyCqknXwdxzow8mmLQLXV4eAmeFz0+fAH0/RDxC5bTXZkyE55WjgOz7KOo4isFpofE63Qx8D3xD67y4b8Gv35Jrz3u2afSfwnrsb3u5pD9nCz+VH4xqETBtD/haoAwET0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733232430; c=relaxed/simple;
	bh=GJJVRB+r+tZPQsZPmLAMOC0LuevwFBUN7eVBiP0dqYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0cp9KTzzTn/veW3nfxdnnmRVlZyCOrrp6xqpd+7ziao3YgfpOjUcWauU0kETJOTSjor/TTrbE8XvoS3pLs1R+2Z+dPfJCt9I5706CVsNkIOMvtJq1Mlk+h5yThclsU7rDf76szR34bfea4sQ7mb2L0epq8oYMjcXvW+fVnwDhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu/wc44g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733232428; x=1764768428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GJJVRB+r+tZPQsZPmLAMOC0LuevwFBUN7eVBiP0dqYg=;
  b=Tu/wc44gFlDSa2pctefsmQ2MhU08v/tRnvQwUgO0mTPOMZMAlkRuPsDQ
   S0wXZqwEkOq9Jw8KP1zyw/uyrfDl+333pfvEeF+mbt/IqGgIbvyF3rOHq
   KCsHJ8V7Lnx70Pr/j7n2HBxRI0lS17N/bCA0m4HC0b/jONAZzXyCpHN7e
   hMlUacZCMspF+Hkln134c1PkL2i7kUYFhWGPFIFOINcJzUTH1mkRmsTxa
   eKZAfjKha/Mnc5qdXuE9bhHoUGLAzmk+Gnl+UH2GkLtuTGxIVKfe0wPdg
   lxjK2FVQ04+X4kxDLfUaUYTVGtvj57AiBqArFEqJ2qhQwmA1tE9eKCvh1
   g==;
X-CSE-ConnectionGUID: ELzFWuD1QxKTk3BeOS3Giw==
X-CSE-MsgGUID: Q18yk6EfRlakufeFEwVsJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33501943"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33501943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:27:07 -0800
X-CSE-ConnectionGUID: iQ8of2KEQFaQYa8+6lU9hA==
X-CSE-MsgGUID: 1N8UxxxYRx2vCPnrVCh4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93519897"
Received: from lkp-server02.sh.intel.com (HELO 3c97e37f0ba1) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Dec 2024 05:27:07 -0800
Received: from kbuild by 3c97e37f0ba1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tISvg-000014-0O;
	Tue, 03 Dec 2024 13:27:04 +0000
Date: Tue, 3 Dec 2024 21:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, david@ixit.cz
Subject: Re: [PATCH 1/1] media: ccs: Clean up parsed CCS static data on parse
 failure
Message-ID: <202412032012.8W7tXCJq-lkp@intel.com>
References: <20241203102737.851076-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203102737.851076-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master media-tree/master sailus-media-tree/streams sailus-media-tree/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ccs-Clean-up-parsed-CCS-static-data-on-parse-failure/20241203-183006
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20241203102737.851076-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH 1/1] media: ccs: Clean up parsed CCS static data on parse failure
config: arc-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412032012.8W7tXCJq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032012.8W7tXCJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032012.8W7tXCJq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ccs/ccs-data.c: In function 'ccs_data_parse':
>> drivers/media/i2c/ccs/ccs-data.c:977:44: error: expected ')' before ';' token
     977 |         memset(ccsdata, 0, sizeof(*ccsdata);
         |               ~                            ^
         |                                            )
>> drivers/media/i2c/ccs/ccs-data.c:979:21: error: expected ';' before '}' token
     979 |         return rval;
         |                     ^
         |                     ;
     980 | }
         | ~                    
>> drivers/media/i2c/ccs/ccs-data.c:980:1: warning: control reaches end of non-void function [-Wreturn-type]
     980 | }
         | ^


vim +977 drivers/media/i2c/ccs/ccs-data.c

   933	
   934	/**
   935	 * ccs_data_parse - Parse a CCS static data file into a usable in-memory
   936	 *		    data structure
   937	 * @ccsdata:	CCS static data in-memory data structure
   938	 * @data:	CCS static data binary
   939	 * @len:	Length of @data
   940	 * @dev:	Device the data is related to (used for printing debug messages)
   941	 * @verbose:	Whether to be verbose or not
   942	 */
   943	int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
   944			   size_t len, struct device *dev, bool verbose)
   945	{
   946		struct bin_container bin = { 0 };
   947		int rval;
   948	
   949		rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
   950		if (rval)
   951			return rval;
   952	
   953		rval = bin_backing_alloc(&bin);
   954		if (rval)
   955			return rval;
   956	
   957		rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
   958		if (rval)
   959			goto out_free;
   960	
   961		if (verbose && ccsdata->version)
   962			print_ccs_data_version(dev, ccsdata->version);
   963	
   964		if (bin.now != bin.end) {
   965			rval = -EPROTO;
   966			dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
   967				bin.base, bin.now, bin.end);
   968			goto out_free;
   969		}
   970	
   971		ccsdata->backing = bin.base;
   972	
   973		return 0;
   974	
   975	out_free:
   976		kvfree(bin.base);
 > 977		memset(ccsdata, 0, sizeof(*ccsdata);
   978	
 > 979		return rval;
 > 980	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

