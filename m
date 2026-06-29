Return-Path: <linux-media+bounces-65835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q5R1DnXUQWqEuwkAu9opvQ
	(envelope-from <linux-media+bounces-65835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 04:12:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA26D5799
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 04:12:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="YGvB6T8/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65835-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65835-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E81300FC45
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 02:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5229F372EC0;
	Mon, 29 Jun 2026 02:11:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73240D597
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 02:11:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782699118; cv=none; b=afo4Fhz5UOyI7+n62a4tKuONFUEZiE51vzw4DFgezyIz2zNxB1Pp8UMrSswafVtVokblXfI05MUg2dN25OMcYiWWsv3Vdimbss1CJkHqmsNGwE9m4RkpUYbieGsSUVCPiQAa5roAo0lyP7ccWi0UcNOw2Erdu2Gi/ZwcHm1tBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782699118; c=relaxed/simple;
	bh=8LEVgM4v0P06IkA+zNAd7sm6U+ztXU+wGvWOT+wm1hM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AG/dYUx1JkFUfB2qIwpVjUVQt5MUYYQ7/+v8ToUzU5XLdQ4I880JN3gyuyFH1RfHymdz9ARBXxSVfkTmhJHbzfHbem2pvjJNdCesqqgR8b/bg5l1n+PgOFijrmlhOxvrHg3BeNljR0A/U+Vx9poWSLAKnqBtuLr2cYkRbXl1J/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGvB6T8/; arc=none smtp.client-ip=192.198.163.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782699117; x=1814235117;
  h=date:from:to:cc:subject:message-id;
  bh=8LEVgM4v0P06IkA+zNAd7sm6U+ztXU+wGvWOT+wm1hM=;
  b=YGvB6T8/rGKGG3jcgzNdnmLRGKa0gXpBaOdXN9F6Oya4AuMUj6ngymSF
   jmUbDeH7sEy9NPkRWrFpb/5Bvw1KTiFBUskys/8cdx6Fx/vgIHiCKWEJh
   yo/RSI4tv0LJgTM33qG+i5I2iAECSbQ8xFBbIR5lzfJYNUprR3U9uaSqE
   cl0djU8GOvLXWDTilPLmXH9af0RH+pV8xuea3U9HvfCh/YhhGrZn2PUws
   oXV+8H3BHIUOZUhr22mH2bEozDQvOcnaQcLahlWocdfaAy+VI7BwdpRrZ
   shJCBwwVenZjxA8ai/tgRjtUOxUsjQk5skFC7rvCMU7AJsN9FeGq8+7d+
   w==;
X-CSE-ConnectionGUID: DxvV7KnLRw++GQC49GoWPw==
X-CSE-MsgGUID: tiqrovXoQM+DvkzP1K5dWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100924205"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="100924205"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 19:11:57 -0700
X-CSE-ConnectionGUID: PXhwBmxITIWaCr9wDecL9Q==
X-CSE-MsgGUID: AlHseJ8WSX2tAjfQPTLWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256231865"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2026 19:11:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we1TU-000000006ld-3vpC;
	Mon, 29 Jun 2026 02:11:52 +0000
Date: Mon, 29 Jun 2026 10:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 17/17] Warning:
 drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in
 'cvs_csi_set_fmt'
Message-ID: <202606291022.4ZXe8Dz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65835-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81FA26D5799

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   66c090febbc3c412ced4e71cb69f47b05eea0331
commit: 66c090febbc3c412ced4e71cb69f47b05eea0331 [17/17] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606291022.4ZXe8Dz4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291022.4ZXe8Dz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291022.4ZXe8Dz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in 'cvs_csi_set_fmt'
>> Warning: drivers/media/i2c/cvs/v4l2.c:203 function parameter 'ci' not described in 'cvs_csi_set_fmt'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

