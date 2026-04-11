Return-Path: <linux-media+bounces-58576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNbuKE/D2WlxswgAu9opvQ
	(envelope-from <linux-media+bounces-58576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 05:43:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5813DE41E
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 05:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35454300C562
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 03:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB72F2D73BD;
	Sat, 11 Apr 2026 03:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+O4fV/C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCFA280CFB
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775878982; cv=none; b=mZxExhIrSbbqvJ3OUtgeZuyKwsS1pHpSCsyy+XplhERigCk9UOIEahamx65e4QDIGJO1HUVvAjOUwo8yV9I69fAQb4ozotEJSHQa/7z3H2Fx+wB/uOazrrRQ+rhnh4L9Fnri6ueshEgQlNZS8zC0soPzrhMhhxGLIQ6ANcxbUtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775878982; c=relaxed/simple;
	bh=D8JLvZudWYPw8KEuqIcwICczZgGDzXdU89Gvz+A8dQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PCoNg2mbszki022cg/i97mdC1NF6nTv3SQg0VA5sPAH2+sibfNdrabqQFDLnwi9g7L9QkjMyx/zO6ekgAVESEmYpL3O/SdWptdvm+Z0tway2IHIdITQ7zgsr8Xg8MVqdBS+4DfJ5vLuRVex32knNzRKglfCNHcAGE2k7guSaRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+O4fV/C; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775878981; x=1807414981;
  h=date:from:to:cc:subject:message-id;
  bh=D8JLvZudWYPw8KEuqIcwICczZgGDzXdU89Gvz+A8dQ0=;
  b=V+O4fV/CmWMpAWqvE0hoXD6U0bxwnjfzx6EIblWyKX8xKy7WUMaypnun
   LPIf1kV8lz7w5Y7WjmQrUfpICWXvOLYL1OwvxK5cm7A15Oek+tvgQwvxC
   0Z8aymbqT5bbvHkgazTt9TykJ7stJw+t4BCqeS61uAv/gW+Zd1UXIGG8C
   A9l+B1I+uUsOeMUoqljoxBVo8DSesoIV7XKKgAB8IpF51zUYR0U+fUWMX
   D6ZxZN+QpmuBEXT8HypPEdLzsrqG/mj2CTs1RJAi7jQtw/fvlGABGPvo+
   D5xN6Y1Q9hY9pKY8w/QURylgU7CYr+/UVUXXwGrONuHh/O8sNVYxJb+Hj
   w==;
X-CSE-ConnectionGUID: B18Md/VBR5GkK842QBhWXA==
X-CSE-MsgGUID: etrYgnGnQrWkttsq0Eb5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79485181"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="79485181"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 20:43:00 -0700
X-CSE-ConnectionGUID: gV7tfCPeSkWqVfOL8tfWnw==
X-CSE-MsgGUID: 7axVnIEGSaG0PmDwT3hr8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="233336561"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2026 20:42:59 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBPFH-000000000iX-3yO8;
	Sat, 11 Apr 2026 03:42:55 +0000
Date: Sat, 11 Apr 2026 11:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:pld 5/11] ERROR: modpost:
 "v4l2_fwnode_device_parse" [drivers/media/pci/intel/ipu-bridge.ko] undefined!
Message-ID: <202604111142.iUEyM6oM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58576-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.932];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url]
X-Rspamd-Queue-Id: 6B5813DE41E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   eb7a465247c98700986d85aa41baadbd0734dead
commit: 00b2c5aa794c2da0ab85ba2ea8cece4e14bd3ecf [5/11] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
config: x86_64-randconfig-016-20260410 (https://download.01.org/0day-ci/archive/20260411/202604111142.iUEyM6oM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111142.iUEyM6oM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111142.iUEyM6oM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_fwnode_device_parse" [drivers/media/pci/intel/ipu-bridge.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

