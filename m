Return-Path: <linux-media+bounces-58032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHlxEIB+z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB53924C1
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E10A3029787
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B9937DEAA;
	Fri,  3 Apr 2026 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoFO0L1T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65B37CD4F
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205784; cv=none; b=ssZIUt6d/915qoCUY18l3wLad5K45P+ZXxeHM+lD3t/eNGdBWwVnq3zXSzwvp4dKLKuSyxp3NokrytxRx6arZeq7fD6DN07KqmP/yy2hesSqpXcPGsl0JhS67y/jLiI613DAm44TLZexsReoD2xgN1AhuJ0gufDugxi0Jx06KH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205784; c=relaxed/simple;
	bh=Qtrota7FcU4wS9AgYs1+25wSQW7a/82QFfSTcR7zoGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fyyYpsJt/QCRLWgIZ8ykwjl8K/qLWfa3pJTvClEZV8FITtTRrM3LyfZ0CyvvotsS+FVwqyPJpdEg5aR+Vi72xbYSCJEgIGyGazneit4VTi+s8hsRmMrtxc6rzUph8J94EodZgtRLMhGCaaUVolwrlYsKJrP3elNlwOZl24CncK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoFO0L1T; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205782; x=1806741782;
  h=date:from:to:cc:subject:message-id;
  bh=Qtrota7FcU4wS9AgYs1+25wSQW7a/82QFfSTcR7zoGQ=;
  b=FoFO0L1T0qeuTSJWT/nVp9iUmqtcUPMtJd609a7FxZnKZ5HKmOWCZWRt
   Auo7XKGeIPWTEJQkfzhuVBjDzqFn8G/XCSctCzWm61qUR0QmvvsjXHlUm
   VifYkYm9kE0gozD162M+1BfkW6oF0iEk8HrzvkLzzrDeGLUBlXVs997i/
   8zqw5sEpfwZstWlMtSfv4KsQn0qkDToagBoZRBvFKrlEGcr83IBWzuNMV
   h4C9MmK9GChNEeOR5oU5ai7wvFo4Bl7VEGceIvXWw7XlU6PKPnsE1YQX0
   91t1jz1+NTttazFiEY1LdUKUuFb5lTaLG/fqLOgyNTxJgAG3JLZmJFlR3
   A==;
X-CSE-ConnectionGUID: DrusKhB3SFScoWzVeqSlpw==
X-CSE-MsgGUID: s8l/D/fGR76dILTJYZqzug==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311902"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: 3G6fGevZQ0e8KnYQUnEnYQ==
X-CSE-MsgGUID: SFOqt7veQz+WKY3tOZFQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286608"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013j-2BXB;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:pld 32/32]
 drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared
 identifier 'dev'; did you mean 'adev'?
Message-ID: <202604022341.WvI89Nd5-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58032-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 93FB53924C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: b8c5b499767feb946c184029ff272276a036623e [32/32] media: ipu-bridge: Prioritise _PLD over SSDB in rotation
config: loongarch-randconfig-002-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022341.WvI89Nd5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022341.WvI89Nd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022341.WvI89Nd5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared identifier 'dev'; did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
         |                                               adev
   include/linux/acpi.h:61:61: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                                           ^
   include/linux/acpi.h:58:51: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                                              ^
   include/acpi/acpi_bus.h:524:10: note: expanded from macro 'to_acpi_device_node'
     524 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                        ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   drivers/media/pci/intel/ipu-bridge.c:287:58: note: 'adev' declared here
     287 | static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
         |                                                          ^
>> drivers/media/pci/intel/ipu-bridge.c:300:33: error: use of undeclared identifier 'dev'; did you mean 'adev'?
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                               ^~~
         |                                               adev
   include/linux/acpi.h:61:61: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                                           ^
   include/linux/acpi.h:58:51: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                                              ^
   include/acpi/acpi_bus.h:524:51: note: expanded from macro 'to_acpi_device_node'
     524 |                 typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
         |                                                                 ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^
   drivers/media/pci/intel/ipu-bridge.c:287:58: note: 'adev' declared here
     287 | static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
         |                                                          ^
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: passing 'typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') to parameter of incompatible type 'const struct fwnode_handle *'; take the address with &
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                                   ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:526:23: note: expanded from macro 'to_acpi_device_node'
     526 |                 is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/acpi/acpi_bus.h:514:54: note: passing argument to parameter 'fwnode' here
     514 | bool is_acpi_device_node(const struct fwnode_handle *fwnode);
         |                                                      ^
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: operand of type 'typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') where arithmetic or pointer type is required
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: indirection requires pointer operand ('typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') invalid)
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/media/pci/intel/ipu-bridge.c:300:21: error: indirection requires pointer operand ('typeof ((adev)->fwnode)' (aka 'struct fwnode_handle') invalid)
     300 |                 acpi_handle_debug(ACPI_HANDLE(dev),
         |                 ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
     301 |                                   "_PLD exists; not use rotation %u from SSDB\n",
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                                   ssdb->degree);
         |                                   ~~~~~~~~~~~~~
   include/linux/acpi.h:61:46: note: expanded from macro 'ACPI_HANDLE'
      61 | #define ACPI_HANDLE(dev)                acpi_device_handle(ACPI_COMPANION(dev))
         |                                                            ^
   include/linux/acpi.h:58:30: note: expanded from macro 'ACPI_COMPANION'
      58 | #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
         |                                         ^
   include/acpi/acpi_bus.h:527:4: note: expanded from macro 'to_acpi_device_node'
     527 |                         container_of(__to_acpi_device_node_fwnode,      \
         |                         ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   6 errors generated.


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

