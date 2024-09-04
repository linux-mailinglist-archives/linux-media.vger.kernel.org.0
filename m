Return-Path: <linux-media+bounces-17514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBD96AF90
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 05:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9042B2852AC
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 03:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F7055893;
	Wed,  4 Sep 2024 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4y3aXWL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04C947A73
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725421882; cv=none; b=pJ/kI/Kqh4hPt0gji5f/kH10vFsl/nDUjlfrDYae0RN9DflE4JghoojYlrZvqj8xTkVU047Z4CPlE3lYsolM5PXOoSwpQ2/nTKQLbavG7ifXINPZzIgw+vo3WYoSTPsFC+NxjEI2+Zod3RDVPtfD/V6wbVeyUWzzEuqqDAgk8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725421882; c=relaxed/simple;
	bh=wNFwOnAx9a1kvCT/RjPzcL4bamgzRSfaU7VayICQBJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWeipJj7ItuC44wvBGPEGWv1VRv/AIUz8McP6d6tYf7Rj5xcGUlQs5REcAxRbto2iNQcP/9769AK0/v0fb3g4c4A+SufEB9PZgSDXmZcr0j5ehXCEwP8olKqTmynUGPddjm9UqluIqKw+96NmLIXuT3VLBDcntDLRtpiN3MAFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4y3aXWL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725421880; x=1756957880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNFwOnAx9a1kvCT/RjPzcL4bamgzRSfaU7VayICQBJY=;
  b=U4y3aXWLhvgaDHwwhHe3cdPL4ga+awvKRgJmlDcdZ56tVD4zcQ2yMsVH
   SPCbTLa8TMN720T7LHbOrHW925MBW0AfXHABJBge4d/AOGN2djK2fLYk9
   k1H7lRXhNZHxGf4McGwHyJp1dNkgYQdV4roy2LPT/ZNFMPj56Pi2PAEu3
   Phap7kbj6EAZw7jHMnKC8IaTTdHKph10gjtq9FXfiKWf566D+74FDUNrv
   cIp5ZI7Pa347QnFDGBgCe8D91sLr63kzTKDHdzi+MYjjsCrzCnGlh027p
   arIMksnUMg8p53oJpYqCTyz3u9JjQ6ddeIMr26A7ZnpAA6KZdLic0dpyy
   g==;
X-CSE-ConnectionGUID: x5ItvGFYQ4uWPOv2xhRkYg==
X-CSE-MsgGUID: 4d9BcBa3Qhuyc75uzFlRAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="26970077"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="26970077"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 20:50:33 -0700
X-CSE-ConnectionGUID: YohGMsdmQPeuyAlxAC+1zg==
X-CSE-MsgGUID: CWk99jnqQgiIoDZ39ffiZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65186585"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2024 20:49:47 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slh1d-0007W5-0v;
	Wed, 04 Sep 2024 03:49:45 +0000
Date: Wed, 4 Sep 2024 11:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [mchehab-edac:edac-fixes 6/6] drivers/acpi/apei/ghes.c:574
 ghes_handle_arm_hw_error() warn: inconsistent indenting
Message-ID: <202409041147.fl53VURu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-edac.git edac-fixes
head:   bd8a8958080eb6b4ba0d80fa822703b675aad933
commit: bd8a8958080eb6b4ba0d80fa822703b675aad933 [6/6] apei/ghes: don't go past the ARM processor CPER record buffer
config: x86_64-randconfig-161-20240904 (https://download.01.org/0day-ci/archive/20240904/202409041147.fl53VURu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041147.fl53VURu-lkp@intel.com/

smatch warnings:
drivers/acpi/apei/ghes.c:574 ghes_handle_arm_hw_error() warn: inconsistent indenting

vim +574 drivers/acpi/apei/ghes.c

   530	
   531	static bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
   532					     int sev, bool sync)
   533	{
   534		struct cper_sec_proc_arm *err = acpi_hest_get_payload(gdata);
   535		int flags = sync ? MF_ACTION_REQUIRED : 0;
   536		int length = gdata->error_data_length;
   537		char error_type[120];
   538		bool queued = false;
   539		int sec_sev, i;
   540		char *p;
   541	
   542		sec_sev = ghes_severity(gdata->error_severity);
   543		log_arm_hw_error(err, sec_sev);
   544		if (sev != GHES_SEV_RECOVERABLE || sec_sev != GHES_SEV_RECOVERABLE)
   545			return false;
   546	
   547		p = (char *)(err + 1);
   548		length -= sizeof(err);
   549	
   550		for (i = 0; i < err->err_info_num; i++) {
   551			if (length <= 0)
   552				break;
   553	
   554			struct cper_arm_err_info *err_info = (struct cper_arm_err_info *)p;
   555			bool is_cache = err_info->type & CPER_ARM_CACHE_ERROR;
   556			bool has_pa = (err_info->validation_bits & CPER_ARM_INFO_VALID_PHYSICAL_ADDR);
   557	
   558			/*
   559			 * The field (err_info->error_info & BIT(26)) is fixed to set to
   560			 * 1 in some old firmware of HiSilicon Kunpeng920. We assume that
   561			 * firmware won't mix corrected errors in an uncorrected section,
   562			 * and don't filter out 'corrected' error here.
   563			 */
   564			if (is_cache && has_pa) {
   565				length -= err_info->length;
   566				if (length < 0)
   567					break;
   568				queued = ghes_do_memory_failure(err_info->physical_fault_addr, flags);
   569				p += err_info->length;
   570	
   571				continue;
   572			}
   573			length -= err_info->length;
 > 574				if (length < 0)
   575					break;
   576	
   577			cper_bits_to_str(error_type, sizeof(error_type),
   578					 FIELD_GET(CPER_ARM_ERR_TYPE_MASK, err_info->type),
   579					 cper_proc_error_type_strs,
   580					 ARRAY_SIZE(cper_proc_error_type_strs));
   581	
   582			pr_warn_ratelimited(FW_WARN GHES_PFX
   583					    "Unhandled processor error type 0x%02x: %s%s\n",
   584					    err_info->type, error_type,
   585					    (err_info->type & ~CPER_ARM_ERR_TYPE_MASK) ? " with reserved bit(s)" : "");
   586			p += err_info->length;
   587		}
   588	
   589		return queued;
   590	}
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

