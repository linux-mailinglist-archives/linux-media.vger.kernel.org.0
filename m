Return-Path: <linux-media+bounces-58577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI7ONIwP2mnwyAgAu9opvQ
	(envelope-from <linux-media+bounces-58577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:08:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C533DF1B3
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 11:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 780EA301727B
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15A33030F;
	Sat, 11 Apr 2026 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAq++Pft"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822923BD1B
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 09:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775898504; cv=none; b=SKNuSa+cz9+c7F23rKhZVDjtHAJRibM6Whd04mTpgIXQBgpmGRilgahyrGYUN/pqmviZRmEbuYGg6vjN10ByjaewHKAWdFIKibS1S7/xku9yrO6gajPDXdc1B/AtHGd9F9qOy1ZweU2YXI071pbSX9twvuvvEZYz7NHmwRuEOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775898504; c=relaxed/simple;
	bh=WXLhIIBQjRiMyeHXZHyORNpHnhBtzSzN0Hv660kO2IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WnSu8SQT+o0Aaylz3/QSw5FSC0nacmsHBuoKeJ9Xs6QNLisPt8adpEL1kZDm1C86HmxczCYNihafIlFAtvVSb1XqGP7TY1X0rMB8EbDn006kJoynDPtk2yF30lla52Vo2D1Alk4dpe556NON8fXjfoHX9JQpXhSx/f+FvvCep5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAq++Pft; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775898503; x=1807434503;
  h=date:from:to:cc:subject:message-id;
  bh=WXLhIIBQjRiMyeHXZHyORNpHnhBtzSzN0Hv660kO2IU=;
  b=XAq++PftNYNsCzH7twrdmWc32AbOIgMTB8oLk9+e6X1wU3IE6284AS45
   4Lb1sv3DsNs5lZvOZAaHb8g1gUDnIJoeDAdm4dDSrksUPOxZ4Vf7Bz3dI
   IluWEEz3TGeSX1iuZVk/crw8A99vwrSqjxQ4hivQd/UBTnlY9xwNQF5M6
   Twg8eirMUarxhJDBP2hBg1U3Mp6saLaJ2kwmvoXMpS8/OSFj62wAi92Va
   c8eyvNafmEQFKuf2vaiCc6ZrXwHHH/18Dj8qfcMx4ayMcLUXcytr8sxWE
   QhWvcGpj2HM+O0YcWooIK9kxnUhZfkAGHCvnX/GN9pDrM6BMLWWVaYlfk
   g==;
X-CSE-ConnectionGUID: +/KsdeYrTkOe0iorveiEvQ==
X-CSE-MsgGUID: cfyY7WNhQHqm+8ytwlRmrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75947681"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="75947681"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 02:08:22 -0700
X-CSE-ConnectionGUID: qHgnhC3STDauAQ+9RKxHcw==
X-CSE-MsgGUID: PXpI48QxRoWjKaP8MOpZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228462592"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2026 02:08:20 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBUK7-0000000011R-2hso;
	Sat, 11 Apr 2026 09:08:15 +0000
Date: Sat, 11 Apr 2026 17:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:pld 5/11] ld.lld: error: undefined
 symbol: v4l2_fwnode_device_parse
Message-ID: <202604111705.kwsmT0KM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58577-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 76C533DF1B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   eb7a465247c98700986d85aa41baadbd0734dead
commit: 00b2c5aa794c2da0ab85ba2ea8cece4e14bd3ecf [5/11] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
config: loongarch-randconfig-002-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111705.kwsmT0KM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111705.kwsmT0KM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111705.kwsmT0KM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_fwnode_device_parse
   >>> referenced by ipu-bridge.c
   >>>               drivers/media/pci/intel/ipu-bridge.o:(ipu_bridge_parse_ssdb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

