Return-Path: <linux-media+bounces-31932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDBAAD9F3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7283AC72C
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548631C6FF3;
	Wed,  7 May 2025 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERQSc/yz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5C0145355
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605593; cv=none; b=tkRwtyb0wWvdGoVa4NOu/0Ytui4LkqURVuhDpqkQBlmh3ftoesr3Bq3ctnHf6ngbXsLbc2dWlJvYqcGsfwSsaog/3FxpfQ0J6FQ9t9Aidq504fEV69/2MUl2DXaV3gyscMnuQTpxTIU+TSByHOEw/Tyybz8yri2IIgOHyEuGt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605593; c=relaxed/simple;
	bh=V220L8PDY8aoneJiOf+aZ0L+k4ftdr04pojPRIC8mMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNDXY7JspjrDFNEpBh7oZEnz9aOdljLVtROZCQP+8Uo9eXU4a8hmbwDWGYE3CyI3UXwr9Zs7HbWbIGeAaF6nHdz8MHSF0WNGJwg5aOdsF7T6T5yzfrmOb2tPoWHzf3lwETi+E+9rYh58jFFithrmhRhfI6uyxmSMjFtL2Nj/34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERQSc/yz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746605592; x=1778141592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V220L8PDY8aoneJiOf+aZ0L+k4ftdr04pojPRIC8mMY=;
  b=ERQSc/yzFN2+QOCFqQFDxsCq3p/zdQErtQjq5YML3xPNuDWCG2Kbi+sy
   w+tOhPrLDHtR3pasoOIvtvUEX0EjtoX4nEEKve2Z+HboaXS8ClV5PHC2L
   gfhBnHnoVBStZvq8qhwne0Ml5Rq0Iuuohitejkowpkn1G7pO8/9OVmBwF
   xe2sYdX3I8cXOBRxFidJyasXUvF87Cndx1LBy+c3T8luqb0rQTAoaEbEo
   A/2qlX5PaPuEpkW4mulb49LtFIehhmN7CNzbbwZYHLtOP2FDplTRxpd1j
   pNX6nY7YYS7/9FaUyU785aJcLLCfqG5S8Xj4kBnWAUb6gPY5ZMO88HJLa
   g==;
X-CSE-ConnectionGUID: 3uvG48scRWu//m85GQwEnQ==
X-CSE-MsgGUID: Xq0khIFrTsa1Jj/fAewF4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70827297"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70827297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:11 -0700
X-CSE-ConnectionGUID: 6CXonMTBS1e3DT1o18E/tQ==
X-CSE-MsgGUID: tet5waZBQ/qd1QBxd2AsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135885209"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 01:13:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZts-0007OC-00;
	Wed, 07 May 2025 08:13:08 +0000
Date: Wed, 7 May 2025 16:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [linux-next:master 2038/9308] .pylintrc: warning: ignored by one of
 the .gitignore files
Message-ID: <202505071520.7aBIzkeM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 02df8e3b333c3d8550a22ffdfc969caec8462df9 [2038/9308] docs: add a .pylintrc file with sys path for docs scripts
config: x86_64-buildonly-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071520.7aBIzkeM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071520.7aBIzkeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071520.7aBIzkeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .pylintrc: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

