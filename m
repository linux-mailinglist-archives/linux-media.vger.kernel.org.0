Return-Path: <linux-media+bounces-19027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4CB98ECDE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB6E28231E
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB7814A4FB;
	Thu,  3 Oct 2024 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMHI1CK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2A31474D9;
	Thu,  3 Oct 2024 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950948; cv=none; b=dp9V/NAGDrCEkYhuu1VoTDYcb4YhQABNZJ6Ko/3FqhxyM8xCb/mmf6uVovEu0LUD1IpGyb00J08VFP+1rLUkqcT0x7OkbM1bGjx/cr0AvbR/ZmIhTnGSCNGlSR0ogIjN0XO8JF68AipzL7TbN5bEw7PaZOQXY3/FFRTEbT28AxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950948; c=relaxed/simple;
	bh=PUe/d/uoUvyHtqc9qqxU8GVE8TfzmWIfGoFUBOUZGC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuSv/ow05GD0v/skQut+pv4P4tUqEK84hTBaG1aH8VIWob40nQaN0NFId9w7WWQ1bbrKXzBSUdt/yLoSXVS516dTpLdOHl7BZK7bF6qDUQ9UQda19lS4svUulXojfNji3PZkgx7+AUQEmuNcnlnTzlBlIap6bG/GlJv53GX7XWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMHI1CK3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950947; x=1759486947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PUe/d/uoUvyHtqc9qqxU8GVE8TfzmWIfGoFUBOUZGC4=;
  b=UMHI1CK3a0mNyTj2rz7hhr+erU8bPECb3uRMCkoSseIcFb2hCsWVUY1h
   VsKmhQlCEIUIi2CK4K0af53KQq4HYVdzvosXWlz6/PrWMnCyBplZCdXH/
   4SnudAaOaI585fLjkRUuGnYTnbbMQUzV87EArvf+GhewpK66mmQZlL4Qk
   FTffyciE2K6vjCNJpt6cZVnjK9jMyZcHMtdHxsjQxwtQHIo4f8DbDzScd
   mLjYJ9dsD69hVuNoRFj8WFwT1onuQH2S97lLlrF/+VJaqbiMUazU7ikCi
   tLao1D5tmgYFOBSkHrCKPkpy7JhaXX9rFG7K6iYFKiSv6YNvL1lfCXHbL
   A==;
X-CSE-ConnectionGUID: HV7MtGQPSGyA+5t6LSRwug==
X-CSE-MsgGUID: A6VvFa4qT8G+T8SnoXah/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27292080"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27292080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:22:25 -0700
X-CSE-ConnectionGUID: MAJ8szbkTKyUEGsTDmdTHQ==
X-CSE-MsgGUID: SI9YnEH3Rjmts6WRzIfWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="79067765"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Oct 2024 03:22:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swIyT-0000HY-2C;
	Thu, 03 Oct 2024 10:22:21 +0000
Date: Thu, 3 Oct 2024 18:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH] media: Add t4ka3 camera sensor driver
Message-ID: <202410031806.jxxP1Fch-lkp@intel.com>
References: <20241002093037.50875-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002093037.50875-1-hpa@redhat.com>

Hi Kate,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.12-rc1 next-20241003]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kate-Hsuan/media-Add-t4ka3-camera-sensor-driver/20241002-173303
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241002093037.50875-1-hpa%40redhat.com
patch subject: [PATCH] media: Add t4ka3 camera sensor driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410031806.jxxP1Fch-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031806.jxxP1Fch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031806.jxxP1Fch-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/t4ka3.c:1099:30: warning: 't4ka3_acpi_match' defined but not used [-Wunused-variable]
    1099 | static struct acpi_device_id t4ka3_acpi_match[] = {
         |                              ^~~~~~~~~~~~~~~~


vim +/t4ka3_acpi_match +1099 drivers/media/i2c/t4ka3.c

  1098	
> 1099	static struct acpi_device_id t4ka3_acpi_match[] = {
  1100		{ "XMCC0003" },
  1101		{},
  1102	};
  1103	MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
  1104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

