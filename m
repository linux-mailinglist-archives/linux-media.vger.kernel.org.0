Return-Path: <linux-media+bounces-58030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gg6HHJ+z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778F3924B9
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F356301652F
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F5037D10E;
	Fri,  3 Apr 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdiK6TBt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC5529D266
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205781; cv=none; b=Q5XdJL49I49CZ3xtWpLBPvhxltVUZe0ojphyQefytWKCWOjPe40Nex0fqYLRXTueMjSaA4sCFk0eKz4T7/oUDJ577vsAClOFpe9rPppzCK/vmuVvjdABFq3X6aJCzHEVANZSR6XXdKw+3b1bTSmDXLcHmGiGseo5DiF+DsjVUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205781; c=relaxed/simple;
	bh=ntcrkaQdjSZi+luHzYneUO6Gtw76vghb/jUOQsutuwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGFss88IjUR6ffuiCllKvywqrO6UcwzxKLKU0/krp4KQhKNlLOpR3sL5cq6uXvb6cIKlYtlHsnUxFnJjZ+8OpzR3Ea9JyR5pPggB8Ny2pFmz/94CxtqjUCG1W0lBMNWoQOS2M2g192v8PUIHhCnx5SjRNBgLSufQJw6Fio2FvYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdiK6TBt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205780; x=1806741780;
  h=date:from:to:cc:subject:message-id;
  bh=ntcrkaQdjSZi+luHzYneUO6Gtw76vghb/jUOQsutuwo=;
  b=TdiK6TBtWkqI3rE6Ot6plPqJMfaECZm5fU1hGolIZUV8yxetBsW31avb
   3coI+HdkowRyI5kAXwvcC1ehXEtKoMFQ+GzNP82DRYpIb2TBhxyUC7R6k
   KKKnJvgfIBXYzcTQP1TZE7bU0OHy+QKuq8P5qRD3noXdYPBFV4Tujs5e/
   CgTlHO9hkA9bW1luoMNQWGAreyyiTcRwBgVy9uQ8dARtYNGvdau7T76fn
   f2x41xp6ybAcVRX2vDsfLYMLqyxJ8MrHpCQJFBQpY5nHckDMt4q84LN5l
   piP0rO4AqmrkfBxe6hi4cjPFHUozKCdkyZULC2A3MDA+HGbj+oji9zCwV
   A==;
X-CSE-ConnectionGUID: kylO47WBT52KQTXhQho5Ww==
X-CSE-MsgGUID: GSOR0XCOS1Oyz/bu6B+vLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311898"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: nfx0rur3S+OA874U5xWbBw==
X-CSE-MsgGUID: CjgmzEVNRHiN2gvIUvMObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286604"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013g-1xzQ;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:pld 32/32]
 drivers/media/pci/intel/ipu-bridge.c:300:47: error: 'dev' undeclared; did you
 mean 'adev'?
Message-ID: <202604022305.mNTpVYLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58030-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 0778F3924B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: b8c5b499767feb946c184029ff272276a036623e [32/32] media: ipu-bridge: Prioritise _PLD over SSDB in rotation
config: i386-randconfig-r071-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022305.mNTpVYLs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022305.mNTpVYLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022305.mNTpVYLs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/pci/intel/ipu-bridge.c:4:
   drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_parse_rotation':
>> drivers/media/pci/intel/ipu-bridge.c:300:47: error: 'dev' undeclared (first use in this function); did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:47: note: each undeclared identifier is reported only once for each function it appears in
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
>> include/acpi/acpi_bus.h:526:37: error: passing argument 1 of 'is_acpi_device_node' makes pointer from integer without a cast [-Wint-conversion]
     526 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   In file included from include/linux/acpi.h:38:
   include/acpi/acpi_bus.h:514:54: note: expected 'const struct fwnode_handle *' but argument is of type 'int'
     514 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   include/linux/container_of.h:22:35: error: invalid type argument of unary '*' (have 'int')
      22 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
--
   In file included from ipu-bridge.c:4:
   ipu-bridge.c: In function 'ipu_bridge_parse_rotation':
   ipu-bridge.c:300:47: error: 'dev' undeclared (first use in this function); did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   ipu-bridge.c:300:47: note: each undeclared identifier is reported only once for each function it appears in
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
>> include/acpi/acpi_bus.h:526:37: error: passing argument 1 of 'is_acpi_device_node' makes pointer from integer without a cast [-Wint-conversion]
     526 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   In file included from include/linux/acpi.h:38:
   include/acpi/acpi_bus.h:514:54: note: expected 'const struct fwnode_handle *' but argument is of type 'int'
     514 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   include/linux/container_of.h:22:35: error: invalid type argument of unary '*' (have 'int')
      22 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1281:48: note: in definition of macro 'acpi_handle_debug'
    1281 |                 acpi_handle_printk(KERN_DEBUG, handle, fmt, ##__VA_ARGS__); \
         |                                                ^~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:527:25: note: in expansion of macro 'container_of'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^~~~~~~~~~~~
   include/linux/acpi.h:58:41: note: in expansion of macro 'to_acpi_device_node'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:60: note: in expansion of macro 'ACPI_COMPANION'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~
   ipu-bridge.c:300:35: note: in expansion of macro 'ACPI_HANDLE'
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~


vim +300 drivers/media/pci/intel/ipu-bridge.c

   286	
   287	static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
   288					     struct ipu_sensor_ssdb *ssdb,
   289					     struct v4l2_fwnode_device_properties *props)
   290	{
   291		const struct dmi_system_id *dmi_id;
   292		struct acpi_pld_info *pld;
   293	
   294		dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
   295		if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
   296			return 180;
   297	
   298		if (acpi_get_physical_device_location(adev->handle, &pld) &&
   299		    pld->rotation < 8) {
 > 300			acpi_handle_debug(ACPI_HANDLE(dev),
   301					  "_PLD exists; not use rotation %u from SSDB\n",
   302					  ssdb->degree);
   303			return 0;
   304		}
   305	
   306		if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
   307			return props->rotation;
   308	
   309		switch (ssdb->degree) {
   310		case IPU_SENSOR_ROTATION_NORMAL:
   311			return 0;
   312		case IPU_SENSOR_ROTATION_INVERTED:
   313			return 180;
   314		}
   315	
   316		acpi_handle_warn(acpi_device_handle(adev),
   317				 "Unknown rotation %d. Assume 0 degree rotation\n",
   318				 ssdb->degree);
   319		return 0;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

