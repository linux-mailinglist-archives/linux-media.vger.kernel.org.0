Return-Path: <linux-media+bounces-48549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57FCB2B75
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C289F303268B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 10:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0954C314A67;
	Wed, 10 Dec 2025 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkVGkgd4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307E314A7A;
	Wed, 10 Dec 2025 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765362798; cv=none; b=q1hLXHLfq2o0WJn+0/OXIxmDr3WgTbybTg36mxGSltM1Z9XhhkfgTDcfe645ES2tDhZYnCv3zxj277c4cwlI4cKDRs/Y/inFKK+B/xPfXk0Jwr57Mxaots/Z2JgDLK6cXB39mqSYqCo+ZpoqS0Hm8jM53Nu97fdKzw0RMCACrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765362798; c=relaxed/simple;
	bh=UsUj9GaciPRcxYu/CgXCrlWKO8WaP9unf5EfzHxcuR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnPTP6tF1cde+WMouNBE3LCZ/O80HtF8lh1ejsTIrp3e5HHFNOOms7xgvnEjVXuQwGB3a4hZZLJSODaAixT6LVOL6ALbWCbLbyduOX6pSGd9c0A2jEyX2+A/I6e2Z9S26tBquVuUmRkRIH66zI04P0W1tWyDTk1t1wJoXoyICN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkVGkgd4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765362794; x=1796898794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UsUj9GaciPRcxYu/CgXCrlWKO8WaP9unf5EfzHxcuR4=;
  b=NkVGkgd49agm/s6hj6JVLgOiTAWlnlYW0z3vrAbrXAGbgCGTjsAvAHY5
   Dn9DwHLYVwCXh0HOnUhxF9M+P1LzqObAcyfMtwExwctoIi14qGs0C+S0Q
   G+i1C5YE7jX/I3wiI/+IsyWX8aA0lUZywFyA3HMymrCMvZNmDJrfFBl2b
   k4REXLbEpC1fTeO/ije3TQMhtlQYj2WHCmpvRc57Qdc3kx/9UARia3jKR
   8sKMnTHJcXQfVHGPJLS3WaiuqL3sfrZYJykykZ58wQSMhOK/ZQqHnQKk5
   r+r4p82mxU9CVvoVW3+S8cxduo9ao/Pq2jXwnCR/gkX5S1uoyrM2lvZvC
   A==;
X-CSE-ConnectionGUID: DkzwhzrsRae+aXzhUhVlDA==
X-CSE-MsgGUID: yJ9FhizkRguXU9GnWgNamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67369055"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="67369055"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 02:33:10 -0800
X-CSE-ConnectionGUID: mYpdlAPeTtqFXJ1tQ+N4Mw==
X-CSE-MsgGUID: P/3vIOoTRM2XfABqfIH5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196540256"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 02:33:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTHVK-0000000035d-0tXD;
	Wed, 10 Dec 2025 10:33:06 +0000
Date: Wed, 10 Dec 2025 18:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS
 laptops with upside down sensors
Message-ID: <202512101804.4fea2mY1-lkp@intel.com>
References: <20251209160621.6854-5-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209160621.6854-5-johannes.goede@oss.qualcomm.com>

Hi Hans,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20251210]
[cannot apply to v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-ov02c10-Fix-bayer-pattern-change-after-default-vflip-change/20251210-001230
base:   linus/master
patch link:    https://lore.kernel.org/r/20251209160621.6854-5-johannes.goede%40oss.qualcomm.com
patch subject: [PATCH 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251210/202512101804.4fea2mY1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101804.4fea2mY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101804.4fea2mY1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu-bridge.c:277:16: error: call to undeclared function 'acpi_dev_hid_match'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
         |                       ^
   1 error generated.


vim +/acpi_dev_hid_match +277 drivers/media/pci/intel/ipu-bridge.c

   270	
   271	static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
   272					     struct ipu_sensor_ssdb *ssdb)
   273	{
   274		const struct dmi_system_id *dmi_id;
   275	
   276		dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
 > 277		if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
   278			return 180;
   279	
   280		switch (ssdb->degree) {
   281		case IPU_SENSOR_ROTATION_NORMAL:
   282			return 0;
   283		case IPU_SENSOR_ROTATION_INVERTED:
   284			return 180;
   285		default:
   286			dev_warn(ADEV_DEV(adev),
   287				 "Unknown rotation %d. Assume 0 degree rotation\n",
   288				 ssdb->degree);
   289			return 0;
   290		}
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

