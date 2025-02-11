Return-Path: <linux-media+bounces-25973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9CA2FEC8
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 01:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04A0166330
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 00:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8C52594;
	Tue, 11 Feb 2025 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbTBU09J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88136B;
	Tue, 11 Feb 2025 00:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232285; cv=none; b=OLXGDwbgqa2rZSJLKSu28r2imXBuMBk9vIfYtCKMvqRcdXV0t04IkyHnalZbE9Hm/H3nBwQVp4G0dV8lk1lzt1Dy+J36yTF5UA0zGdVXs/u6kYVdfTnGG3t4t9dnEmgCTtJnQzU69783G6nWvjx6ImIXXAmfdlzCnz1XPuiCvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232285; c=relaxed/simple;
	bh=hJn7ULHbq6CRfDggJSdFISFXucCrGiXYfkgvYplnnGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q20vRk4b9zQV40ipeAH4EvX7uR11WQu8VgQyDh3qMSQ86FLGz+8mrj9BvOy3hvD/SutsWgrgc0Wbz2AQovDPMr3RsJpFSBTkgOb9xowwE25/R50LxVHV8ipT37t2eZGuMFMruBnEFumHquAlelR/TEicp7sIXio8B3JULY66IaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbTBU09J; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739232283; x=1770768283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJn7ULHbq6CRfDggJSdFISFXucCrGiXYfkgvYplnnGM=;
  b=CbTBU09JSmm5dyryDM1kHiR+yxGyU++LinhFS+RDeulp7+vsk2zs6TMj
   X0+Sx5oECQ5VfLmF7ZpgaduR9tAB/R8cMGG9ykbPw0euJt/qmejtI5S3o
   pg0tgHFOvxDMhIvhgBFkEv4E3gGFoX9IvtO7Z4IPhom1o4u1jJKfhPChZ
   X+DmdiH4uTAOKYuob37Ly62XFejt2FcgpJ5FeZ5cHHe48ZFRLWvFmQJOP
   Aw0imnVuWe+hu+Y/Hp/frQcdEpi0JnjtSFkG7KMUxuJP/cfXEIZeXyeY4
   AF4H3P2rsgTNRpIajmX/gwhepZWEhoUSdC580jKsiWDW26/q9NNcE5oHI
   A==;
X-CSE-ConnectionGUID: 7FRh7FSvQtOgrH7Sgmj1Ew==
X-CSE-MsgGUID: CU0kfWVVSluVJxHu/Ol6zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57376672"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57376672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:04:42 -0800
X-CSE-ConnectionGUID: HshYmhZ9Rlm/Ekg9LHrdgg==
X-CSE-MsgGUID: 4zfi4CbcTteOMgJGm1O6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="117372450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2025 16:04:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thdlV-0013Xz-2s;
	Tue, 11 Feb 2025 00:04:37 +0000
Date: Tue, 11 Feb 2025 08:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [lwn:docs-next 35/37] htmldocs: make[2]: ./scripts/get_abi.pl: No
 such file or directory
Message-ID: <202502110736.ZGWaWsep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   95767a592dc997eab17a4f58fcb16abff2101ba3
commit: 1c7e66bc5d20ac7779130e146d70066b3af4711c [35/37] scripts/get_abi.pl: drop now obsoleted script
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502110736.ZGWaWsep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110736.ZGWaWsep-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
>> make[2]: ./scripts/get_abi.pl: No such file or directory
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

