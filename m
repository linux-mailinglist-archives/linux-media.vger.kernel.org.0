Return-Path: <linux-media+bounces-52471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLdQChtlimmiJwAAu9opvQ
	(envelope-from <linux-media+bounces-52471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 23:52:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2759115443
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 23:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FC0B3027DBD
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 22:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2729314B6D;
	Mon,  9 Feb 2026 22:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLe4+qUh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD99314B8C;
	Mon,  9 Feb 2026 22:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770677524; cv=none; b=Pw4tSQQ/inDkmDr1nlt0OnxSb8YbeItHECWA3PSRQp/b7P4m7hfLfwJAM5JnO53QzYRzCLcxpUg9FTxVG++cNvTeklFHAuSbkEh+FZ0pDMa466mlXX0e3CcQGjLjN2B3ppBlDnBNdWBb2sJQNIwIaP9YMBKmf7BQpk2XgtrwHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770677524; c=relaxed/simple;
	bh=b+7JPl9kv7MhfWcCEzqsfhs2C1MBdRF0PrNnnHEVrtU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fgbWWGaz3eNZCxDejTANxzOldljeT8y9drO6qncQM4lM70/R9WQ5wnEs+ZPB826SAw1UDEQWzylVe/1Ec/pCJFXX4BaNB9Kp+rXLZLDAnHxYZsBaSE1apr2JK5pUNM+VOsSKDMyhD5Raz6NxomhTdLSAulpHWEy6yegra346bVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLe4+qUh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770677523; x=1802213523;
  h=date:from:to:cc:subject:message-id;
  bh=b+7JPl9kv7MhfWcCEzqsfhs2C1MBdRF0PrNnnHEVrtU=;
  b=ZLe4+qUhwKjK10MKhextow12hcKX0+zZnKRfKHzQ+vzHVR5pZenCmYwg
   R3cMe5bm0LTImxg3tTLeGWfxP+8bdEjgmEE6RGyZmTv6wstw4Kqq0dvLJ
   rv7pRrjBoLfCqnU/14duVN+QGc8jqkBAql3TUy5MO7sAG/ujICKbfUICd
   HUCo0eFObfOS8eO4SpTX1M0jL7y2eOxQmpwHNqKrjjsNX55c96CfiyWoq
   x6yCZBEOBQw2KAm79GElXtj1pCE2ZrC68oJ5ikfKr3wFdLSHn+ixWUlO1
   CwvDjdH4QJewgnmxMm498MXID78mZAy84qF9ENriNo1SNY1xYkZENeMAx
   Q==;
X-CSE-ConnectionGUID: i7m3z0SIQuW5rytB8RLDgw==
X-CSE-MsgGUID: goUvjekZTmqg8ijo3n/4jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71899592"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71899592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 14:52:03 -0800
X-CSE-ConnectionGUID: lXjnV3+gQSe6ZXOzwI86xA==
X-CSE-MsgGUID: cNt5XVrZTxyA6SjP/S/XKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241795106"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2026 14:52:01 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpa6p-000000000UD-0UMq;
	Mon, 09 Feb 2026 22:51:59 +0000
Date: Mon, 09 Feb 2026 23:51:52 +0100
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [linux-next:master 1881/12313] htmldocs:
 Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING:
 Failed to create a cross reference. A title or caption not found: 'crc'
 [ref.ref]
Message-ID: <202602092322.eM3qz1o1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52471-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2759115443
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: bea467aa5da1f51834501da3ac3c40204027a221 [1881/12313] docs: media: v4l2-ioctl.h: document two global variables
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602092322.eM3qz1o1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092322.eM3qz1o1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:45: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:453: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:153: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:462: ./include/uapi/linux/landlock.h:176: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

