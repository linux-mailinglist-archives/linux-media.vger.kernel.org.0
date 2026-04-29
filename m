Return-Path: <linux-media+bounces-59906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEGiOuaE8WkyhgEAu9opvQ
	(envelope-from <linux-media+bounces-59906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:11:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFD48F02F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 06:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD89B3018BF4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 04:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDAE34A3D6;
	Wed, 29 Apr 2026 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgpaWj+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E03090C1
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777435868; cv=none; b=VRmmFPKR0liZnuQt6AskeAZSwiYXbDkohhW4PH1im8Xxh88n7hqPkFzf+hjfD6YJc0I8Vzl+N+ZhmBTU81+uKdylWTQL9b03Lm+d89ugEGEAcz4nVHag3czLQzW3vM0xReKSwsk1ff2pQmuKgMZEkDDzLrDR04hA9PxzSKMCeGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777435868; c=relaxed/simple;
	bh=XNBSS57VrD6IzsXS17vP/9EYnFIkDs4Rci5PXE7qOJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rfGksyBZfzb9PH7UsWhTn/B9rjBN0X/mGtCxspr5c0Bhlw83RWeLOLIotI24644RrPkJ3TzDNbZKN3LJTajSGO6FYdJwpJI6ZFOwScirD9U4UBGxmB27e9pDpvTq/YzTBvLIP33cnD7l3+4zFxKrx4R2a5ojXQaBSLsU1JD9tdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgpaWj+L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777435867; x=1808971867;
  h=date:from:to:cc:subject:message-id;
  bh=XNBSS57VrD6IzsXS17vP/9EYnFIkDs4Rci5PXE7qOJo=;
  b=hgpaWj+Lm+TPPE31hb++ieMw8g/4bMDx/ghctFvZFzsCMbtVZ5FjVF6d
   hYio3tqYWBDxhly85nmQZlnWukKLFOnQKpmlx+w5UIrqdFccRGDD3fGuz
   k2wdsx4n9cEPpzDp18eFvg5MjZD+8H8I1EGMPGtKb/YcR6geP3JPTLpRo
   JjSqvW+Um8cBwhmLhGGzSX+0aHHsERCMl1IgOhb+CkHZ5jTeMyYC+Hw9r
   3qp3VTA8RyYvykDby6MGXSFEyuvNMYBPXlFvo9PsW4xn7DX3iE/PjULn0
   ZhQbzf/W8b4a0arzoYugadbfk59bT7vlZ29WlME1y/9choAI3ibVo4J/A
   Q==;
X-CSE-ConnectionGUID: FhlVRd/pTf+TjqHhBHIzmw==
X-CSE-MsgGUID: l29ZEvcoSgupy8w1Ntn3LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77387091"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="77387091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 21:11:06 -0700
X-CSE-ConnectionGUID: MqlU59jkQymtS4byNl9isA==
X-CSE-MsgGUID: Dgb+rvhARpKhCDZLIerCGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="238475576"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Apr 2026 21:11:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHwGL-00000000Ab6-3c5j;
	Wed, 29 Apr 2026 04:11:01 +0000
Date: Wed, 29 Apr 2026 12:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 26/122]
 include/media/mipi-csi2.h:47:27: error: unknown type name 'u32'
Message-ID: <202604291221.mpBYkuLv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 5DDFD48F02F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59906-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: 25d771fe2c1e03232e2c3764b3bd04b2d3ecdcb0 [26/122] media: v4l2-common: Add mipi_csi2_dt_for_mbus()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291221.mpBYkuLv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291221.mpBYkuLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291221.mpBYkuLv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/rockchip/rkisp1/rkisp1-common.c:8:
>> include/media/mipi-csi2.h:47:27: error: unknown type name 'u32'
      47 | int mipi_csi2_dt_for_mbus(u32 code);
         |                           ^~~


vim +/u32 +47 include/media/mipi-csi2.h

    46	
  > 47	int mipi_csi2_dt_for_mbus(u32 code);
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

