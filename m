Return-Path: <linux-media+bounces-41533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3DB3F93B
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D404D201713
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D784C2E92D0;
	Tue,  2 Sep 2025 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3AkvrXt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37B2E8DFD;
	Tue,  2 Sep 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756803345; cv=none; b=S84dWrrN2hH11WAIgaDCHmm/iujOYY0F8HkJRxdjxrct2waxRs4w2dcCilI/jdmkErXZZtIABWJGKzG/od36f388iYloz8u1lvDRhm0qvk9RyxUi+DqV9Dn1X8SERaoS2OB5ofKnlASTX7wTLdZkIC6kBzFK1hWJD6a4EOQITpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756803345; c=relaxed/simple;
	bh=y4zvEtylgfQb3Fhs2xIdnauav7UCkXlE4/cb7u0Fl4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3pi1/0GqR4CfR82qNgxR2ea6U+JaKUU+h2PFsc1NcZBuiMx+se+FqBxBvpqWuTTBUEjqy4ke5mEAiOrM+IJ439aWXqZ9vOu1bfe7e+f1Kt3VGm+Vzirj96gH8UyzCU7maDpptm08SyscUm3YDog+msuoT9rG3pYuVFjIeQqisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3AkvrXt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756803344; x=1788339344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4zvEtylgfQb3Fhs2xIdnauav7UCkXlE4/cb7u0Fl4U=;
  b=A3AkvrXtVAsgZQ+XsQEe28rbClVhFMeYUlTEi7VFkAyNShSJLZPocUmX
   TbCL408Wb4rKs9xjZcgPhBITYKAeKmbgC2SrHsSajxUj3PwVAeHRcAhMJ
   cMvCZXnkbwZSyg/tscfgTFXoygIprAPndsw5psrXRujY+GaGLaQoe4lvx
   VMzNfdGkKXkRW7PkXvdH0uRwLhsPPlEubVRTyTe4tqGck9IP7VZ9Gf/ch
   71ztDuWSWKRDGqPQjgzcyHbqvpBQqrdehx0uksMODNS76RKkxfO/GSM+B
   c+ZIfkPVEayl0EOxhWB2uwObxygRvB1fV8dNctbipcgSuI5Iv6phwB8/C
   w==;
X-CSE-ConnectionGUID: 4hhS/wuATlG94PSw2e9GiQ==
X-CSE-MsgGUID: K7gIMkYaTtOYSY1Keut40g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62887454"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62887454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 01:55:43 -0700
X-CSE-ConnectionGUID: o8tCd2q/TH2VIqzXYi5+LA==
X-CSE-MsgGUID: oXzpySnOQEugkKSomUdGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171181736"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2025 01:55:41 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utMnj-0003HD-20;
	Tue, 02 Sep 2025 08:55:39 +0000
Date: Tue, 2 Sep 2025 10:55:25 +0200
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [linux-next:master 4559/5641] htmldocs: Warning:
 Documentation/doc-guide/parse-headers.rst references a file that doesn't
 exist: Documentation/userspace-api/media/Makefile
Message-ID: <202509021051.9EXvNBXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: 8a298579cdfcfdbcb70bb7af5e30769387494f37 [4559/5641] scripts: sphinx-build-wrapper: get rid of uapi/media Makefile
reproduce: (https://download.01.org/0day-ci/archive/20250902/202509021051.9EXvNBXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021051.9EXvNBXk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
>> Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/trace/rv/da_monitor_instrumentation.rst references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
>> Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

