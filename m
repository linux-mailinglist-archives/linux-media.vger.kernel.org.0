Return-Path: <linux-media+bounces-58028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG3WOXZ9z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:42:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F123923DE
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1195830309AF
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB9337FF62;
	Fri,  3 Apr 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1cHiY0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDC37C93D
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205721; cv=none; b=nd1V8k/yam/8/cV64F4cez+vKaM8uWVw+iyIKl722nnYjAnB+/bW3PFzI2sCY1z6XRYfwwkmgrP/5OxrhfEnVAIhRpKXQynqKD44dHT/2Mfbw7jkY/MKXfYQbLmWYo68hSvDaAGh8MrJ4vwync9AUVwIBkhnhb/J7j0dfhEt68c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205721; c=relaxed/simple;
	bh=OMvGlsQ2ATABnfdY7I33DOwwxc5s2SDj18tq0uzhJQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SqKwETy6ZqMfyLY/W2P6tXJFwdocTldn85AMntSdcVgvezILvbwVbQisUXfufZnc3O+oLiIuIqhorjUIL5q+Fuhwr4bs1r19jqZVQU0DILPKCbqBozfPTtzTfdNIlu9UkO319pY5ONDsons55OIBpbwjEwxMSxRsvFC7zheVTWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1cHiY0U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205718; x=1806741718;
  h=date:from:to:cc:subject:message-id;
  bh=OMvGlsQ2ATABnfdY7I33DOwwxc5s2SDj18tq0uzhJQY=;
  b=k1cHiY0UrIw3vPwK5KzIwYwrKyUdBSFXGUcrR4Jlj08bhgQaqLdUIWal
   mL15rjpdRyd7Sdh68/JIJHCUA8jodAEt+yb4rPK1QDX6xUu13cc4IcTWo
   Voxw1rpnJs3r/NkP7j5G70m0bxYe+g3rf4Rl64ho616e7M76QPPLHiB0A
   zlSGogj6IXp+6ZQ9C30bcwKP9A/2JYuAt1FQajg0y1Pnn3TKOc6v41UI5
   DXgMseeGJyubGv2IwVoqXfthT3Hyt9LuQ6RuIgXirZL2oYYAXfC+GoL+/
   Bxj2yAtHipmVDldBEBmLML1hd7sQwdrFYsowqLMkoaDWC39BFevcVHVjZ
   Q==;
X-CSE-ConnectionGUID: lGAvQ1CxSMi7tjBTkrEfNw==
X-CSE-MsgGUID: YifVP+19RmWfX51H1EuSkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852142"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:58 -0700
X-CSE-ConnectionGUID: J+sXJG7kTFCx1VQ2Ake4xg==
X-CSE-MsgGUID: ++EaqK4xQ0m++btkdG8jvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943091"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-00000000137-31s2;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:pld 32/32]
 include/acpi/acpi_bus.h:526:37: warning: passing argument 1 of
 'is_acpi_device_node' makes pointer from integer without a cast
Message-ID: <202604022234.VEwDWSU1-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58028-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 80F123923DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: b8c5b499767feb946c184029ff272276a036623e [32/32] media: ipu-bridge: Prioritise _PLD over SSDB in rotation
config: i386-randconfig-003-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022234.VEwDWSU1-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022234.VEwDWSU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022234.VEwDWSU1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/pci/intel/ipu-bridge.c:4:
   drivers/media/pci/intel/ipu-bridge.c: In function 'ipu_bridge_parse_rotation':
   drivers/media/pci/intel/ipu-bridge.c:300:47: error: 'dev' undeclared (first use in this function); did you mean 'adev'?
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
>> include/acpi/acpi_bus.h:526:37: warning: passing argument 1 of 'is_acpi_device_node' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
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


vim +/is_acpi_device_node +526 include/acpi/acpi_bus.h

8a0662d9ed2968 Rafael J. Wysocki 2014-11-04  521  
8b9d6802583a1e Sakari Ailus      2017-07-21  522  #define to_acpi_device_node(__fwnode)					\
8b9d6802583a1e Sakari Ailus      2017-07-21  523  	({								\
8b9d6802583a1e Sakari Ailus      2017-07-21  524  		typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
8b9d6802583a1e Sakari Ailus      2017-07-21  525  									\
8b9d6802583a1e Sakari Ailus      2017-07-21 @526  		is_acpi_device_node(__to_acpi_device_node_fwnode) ?	\
8b9d6802583a1e Sakari Ailus      2017-07-21  527  			container_of(__to_acpi_device_node_fwnode,	\
8b9d6802583a1e Sakari Ailus      2017-07-21  528  				     struct acpi_device, fwnode) :	\
8b9d6802583a1e Sakari Ailus      2017-07-21  529  			NULL;						\
8b9d6802583a1e Sakari Ailus      2017-07-21  530  	})
8b9d6802583a1e Sakari Ailus      2017-07-21  531  

:::::: The code at line 526 was first introduced by commit
:::::: 8b9d6802583a1ef6977e4b059f9fa848e6882253 ACPI: Constify acpi_bus helper functions, switch to macros

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

