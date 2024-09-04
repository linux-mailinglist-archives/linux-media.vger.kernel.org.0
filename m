Return-Path: <linux-media+bounces-17616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 469BA96C6F2
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 20:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91EB7B22E1B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 18:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6468E1E411E;
	Wed,  4 Sep 2024 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC3+EsC5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C121CCB5C
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476268; cv=none; b=lWH9fu5p9lGC+8HlV+nx+bmOj8pg+xBHRoflltNUQEQH0QIJGFTcACZbORRb8EGqywiEK8tT+cFpNbvZHGPmSAGgSIHpFDOAaCjmnUjfAo04jtK8PO/UZqTWukskhaJyo+ymbWnTRxhaHeWalEyH+9hifFhftWtWrwNM3r6sj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476268; c=relaxed/simple;
	bh=wJmzBrfElcD578sAX2j4p2YeKgKtJq7mL5oO8txhSAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEMBgbDgeDteEJxtXvGsQO+GpsEz7Tb8QdqxYjm/7B/fDbnfsw/oF5k0oprt5Hjb9x+xRMsP4yvbf1a/JQE+z9KoNRSlYlRN0i+VG9z4ojlZR4qkJMylHmG/JrUwYF6FULh0OFGOqOTdT+sxVuXhvz8bM8z61yd9oyeCNWs5nT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC3+EsC5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725476266; x=1757012266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJmzBrfElcD578sAX2j4p2YeKgKtJq7mL5oO8txhSAo=;
  b=KC3+EsC56dcbth6ypALo/l1w9buEwtHYq1kUfk0wT5VWtgMBr9BNMWHU
   FWiJDS/6V9bwk+PFC5c5ObF+T4TmrgoEzgl49GOXA4Yqbsr7wcQ4DUGQc
   eJDUkcBKwa6Am32fqN3BDPcZVmv3OoRcNRJq0uqJAWsKRs6W4GGVvbAhK
   CXq/HhexNhvZO3fJcbbwPhtThwDwk5grp1s7A55VLc3WVcrsjKHtZj2PE
   9eAqSQhhoLY7N8akjIcNWcav8a4HRxthhhEZky2UpMb6dsTERIJ9pU+q3
   8Dw0/3hD0YE6gyqC2FxklQNawAJNluWyvXK/jlIPw2vd72/PPckkk/Jhd
   A==;
X-CSE-ConnectionGUID: +uXLd9F+S6+9rn7b9AWPJQ==
X-CSE-MsgGUID: MuwuSt4qR96ocOBDadAmug==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27079373"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="27079373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 11:57:38 -0700
X-CSE-ConnectionGUID: AZgV3s37Tc2Ru3umIfho2g==
X-CSE-MsgGUID: fj4Y+9AzTTug2DBcXEQjkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="70254593"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 11:57:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slvCA-0008Sn-38;
	Wed, 04 Sep 2024 18:57:34 +0000
Date: Thu, 5 Sep 2024 02:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [mchehab-edac:edac-fixes 4/6] drivers/acpi/apei/ghes.c:565:34:
 error: implicit declaration of function 'FIELD_GET'
Message-ID: <202409050218.tZHMvQ7x-lkp@intel.com>
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
commit: b2bce6cb25e5c57398220f151f9860aec97598a9 [4/6] efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
config: x86_64-buildonly-randconfig-002-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050218.tZHMvQ7x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050218.tZHMvQ7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050218.tZHMvQ7x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/apei/ghes.c: In function 'ghes_handle_arm_hw_error':
>> drivers/acpi/apei/ghes.c:565:34: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     565 |                                  FIELD_GET(CPER_ARM_ERR_TYPE_MASK, err_info->type),
         |                                  ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +565 drivers/acpi/apei/ghes.c

   530	
   531	static bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
   532					     int sev, bool sync)
   533	{
   534		struct cper_sec_proc_arm *err = acpi_hest_get_payload(gdata);
   535		int flags = sync ? MF_ACTION_REQUIRED : 0;
   536		char error_type[120];
   537		bool queued = false;
   538		int sec_sev, i;
   539		char *p;
   540	
   541		sec_sev = ghes_severity(gdata->error_severity);
   542		log_arm_hw_error(err, sec_sev);
   543		if (sev != GHES_SEV_RECOVERABLE || sec_sev != GHES_SEV_RECOVERABLE)
   544			return false;
   545	
   546		p = (char *)(err + 1);
   547		for (i = 0; i < err->err_info_num; i++) {
   548			struct cper_arm_err_info *err_info = (struct cper_arm_err_info *)p;
   549			bool is_cache = err_info->type & CPER_ARM_CACHE_ERROR;
   550			bool has_pa = (err_info->validation_bits & CPER_ARM_INFO_VALID_PHYSICAL_ADDR);
   551	
   552			/*
   553			 * The field (err_info->error_info & BIT(26)) is fixed to set to
   554			 * 1 in some old firmware of HiSilicon Kunpeng920. We assume that
   555			 * firmware won't mix corrected errors in an uncorrected section,
   556			 * and don't filter out 'corrected' error here.
   557			 */
   558			if (is_cache && has_pa) {
   559				queued = ghes_do_memory_failure(err_info->physical_fault_addr, flags);
   560				p += err_info->length;
   561				continue;
   562			}
   563	
   564			cper_bits_to_str(error_type, sizeof(error_type),
 > 565					 FIELD_GET(CPER_ARM_ERR_TYPE_MASK, err_info->type),
   566					 cper_proc_error_type_strs,
   567					 ARRAY_SIZE(cper_proc_error_type_strs));
   568	
   569			pr_warn_ratelimited(FW_WARN GHES_PFX
   570					    "Unhandled processor error type 0x%02x: %s%s\n",
   571					    err_info->type, error_type,
   572					    (err_info->type & ~CPER_ARM_ERR_TYPE_MASK) ? " with reserved bit(s)" : "");
   573			p += err_info->length;
   574		}
   575	
   576		return queued;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

