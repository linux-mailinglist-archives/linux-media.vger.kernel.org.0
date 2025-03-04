Return-Path: <linux-media+bounces-27523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A9A4ED2E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BCD11890A71
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF2A259C9C;
	Tue,  4 Mar 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2kBPhps"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F29259CB1;
	Tue,  4 Mar 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116129; cv=none; b=Ckr8ld6qh5fyNW9kQMSzYdql+AkJRqAJecEv5MKDolbxCSjVZeNnUiwLZiDXCV/2s4HynmQM7CAMUFZkX7Isu7efgrmRMlOdO6sr8dBHqug45UWdtRSlzajHd/38dbzARQMVPYWpQ92KUMNDpRzfqtcTaNPBAYdaOVxCxVmckXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116129; c=relaxed/simple;
	bh=sS1Jy4MZ3ULHuGCYt3nACn4VMCcZWnFa/TQI0pe2Plw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qAHZNlgxYrBuLghfXs5dAkpQxMXALqoaPkQyS7ZpDGVjQkx6DVJ4qRGDPgVTo/DFOj4yhF29PQxNN3nIoTYi5/Xv6fr0clBn/z698iFc91TW9H6gx3toXAeGiBtE/QueuYAgKm23nTbplJBhv3B314PGh3oadXNAVfTCMxwsbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2kBPhps; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741116127; x=1772652127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sS1Jy4MZ3ULHuGCYt3nACn4VMCcZWnFa/TQI0pe2Plw=;
  b=G2kBPhpsRDEGVwC9HmkTni0viOgu9QZBPbjyGtXM2xoIBye5xTXIZUq6
   oDN6rGu71rsBL7BozSG07kasZizdALkrrUw4EWtnBh/KGAkNOlewRv6WF
   v90pw8Yi3fpPa4HtxocPaoQIh+nG6AFk1PFHPSst8iPjGuYtlQXkCXs4D
   dqlLTYlVSCPcRGS4+k8YNtEuEGilGrZUIf0IkMkBL7DOsYMeUnayZQUlA
   AK0YaCKbzD/GRwqO/TdGjTiPuC4DXlOaKK1SIfdAsgV+7Tgz4otAuReAj
   rJU6IGLTX/G1VzxZwOi3LIwy0bJGtHJoET4S/6o3FDDeSlZN+isbrZdr9
   A==;
X-CSE-ConnectionGUID: 8w71VksIRRe2LyboxoDu9Q==
X-CSE-MsgGUID: z+xQIv3FTj2Xh+h8JXxXXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67424334"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="67424334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:22:07 -0800
X-CSE-ConnectionGUID: hT0DxdifQo6QeQkn/ygtgA==
X-CSE-MsgGUID: bgb2E51WRXWqQIySLdsFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118614670"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2025 11:22:05 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpXq6-000KBI-2L;
	Tue, 04 Mar 2025 19:22:02 +0000
Date: Wed, 5 Mar 2025 03:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-doc@vger.kernel.org
Subject: [sailus-media-tree:devel 27/46] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/i2c/ov7670.txt
Message-ID: <202503050359.6DYrXi6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   d84f66b64b763277de4a99cca88cccede13ec914
commit: bcf999e34bc7c56a4cc589a2aadfcf248bbc3f1c [27/46] media: dt-bindings: media: i2c: align filenames format with standard
reproduce: (https://download.01.org/0day-ci/archive/20250305/202503050359.6DYrXi6o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050359.6DYrXi6o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/ov7670.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

