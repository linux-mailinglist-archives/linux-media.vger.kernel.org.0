Return-Path: <linux-media+bounces-58031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKCdBJt9z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:43:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7B3923F4
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF3053029603
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F6537B023;
	Fri,  3 Apr 2026 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZJLyy38"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850837C93D
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205783; cv=none; b=Ls96pdVKdtSy0I5SmSZA4rrySl/oRB16ZBbDp4aqEoSEnV0W5cYqPVdYj5jztLQrvFfaADmqLUVzOU4VLoRIXPeyK2SB0HUGrqHP69K3064YCW+MbNV45RWZs3C8ajrVcbieEw/n6i3bJYM8sNaXxdyPowOLNqlEHj3MM1O3Sqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205783; c=relaxed/simple;
	bh=d8HZolPXdVc6ofYMvu1KfbhlGVOb954XhpBLvjtiuaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U/CZUeqqioxk7Ut1qS8UrNWnchIrybajG1zpz0kYCopt2X9+Zb4ZKosFJJv+HGpKOOo98FY1UEqOCb3fcJYawlsd/bRhZe9KUrbxALkxVUUz0xIBqzb+NKqYKVV9wWnj+g+Nx4q9XK9mn5Sdn/uhnk+A2fY0513v5MlAXwcZim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZJLyy38; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205782; x=1806741782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d8HZolPXdVc6ofYMvu1KfbhlGVOb954XhpBLvjtiuaE=;
  b=fZJLyy38403Qg7kUQb7u5UCrQKm4bkT9z2voyAmxQivt3+s6rLivLPIa
   V12hLsYvzwxV2+CeckePvkoPBXsPvUDc6t9GQml3e3gV/c/aiTEEvHK9h
   LosdSOyWPCnKYnIm3E5xMVS5J+Q4mMtLxV7s5kfnkBaNAP9LFCt91tuD1
   7gp9z4WVWVS3yDrqVyRzy64YDVcFxxOxYKFa2UMgceR7VpjgJvTbo7KU+
   UhzrTbDKhb+f1MNxCF4NiXmPjws+HBRc5SGRKfqG+LMI3MhByTfSV1IM5
   WqphK01uxymLcDHKD60CUSN3ej8ANU739ZzVlPAxxttIP+1AxjsSQ2lPa
   Q==;
X-CSE-ConnectionGUID: /FoMdHavSSaZaZ3Dr9I6Fg==
X-CSE-MsgGUID: OFNBD8NVQuOkIG9GxpkrEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311899"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: gXjSIlXKTqKTKHLxNFhVZA==
X-CSE-MsgGUID: m2gfn2sCS3KGcE9UpmObZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286606"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013e-1sx5;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Subject: [sailus-media-tree:pld 24/32] include/linux/acpi.h:1275:33:
 error: implicit declaration of function '__acpi_handle_debug'; did you mean
 'acpi_handle_debug'?
Message-ID: <202604022300.ObDwjXBo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-58031-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,linux-foundation.org:email]
X-Rspamd-Queue-Id: 75B7B3923F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: 010794c2fea2ddf1d1556e40bcd97c3c3b952825 [24/32] media: v4l: fwnode=
: Support ACPI's _PLD for v4l2_fwnode_device_parse
config: i386-buildonly-randconfig-002-20260402 (https://download.01.org/0da=
y-ci/archive/20260402/202604022300.ObDwjXBo-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260402/202604022300.ObDwjXBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022300.ObDwjXBo-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from drivers/media/v4l2-core/v4l2-fwnode.c:17:
   drivers/media/v4l2-core/v4l2-fwnode.c: In function 'v4l2_fwnode_device_p=
arse_acpi':
>> include/linux/acpi.h:1275:33: error: implicit declaration of function '_=
_acpi_handle_debug'; did you mean 'acpi_handle_debug'? [-Werror=3Dimplicit-=
function-declaration]
    1275 |         _dynamic_func_call(fmt, __acpi_handle_debug,            =
        \
         |                                 ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:17: note: in definition of macro '__dy=
namic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                 ^~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynam=
ic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, #=
#__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1275:9: note: in expansion of macro '_dynamic_func_=
call'
    1275 |         _dynamic_func_call(fmt, __acpi_handle_debug,            =
        \
         |         ^~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-fwnode.c:831:17: note: in expansion of macr=
o 'acpi_handle_debug'
     831 |                 acpi_handle_debug(ACPI_HANDLE(dev), "cannot obta=
in _PLD\n");
         |                 ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1275 include/linux/acpi.h

45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1247 =20
fbfddae696572e Toshi Kani       2012-11-21  1248  /*
fbfddae696572e Toshi Kani       2012-11-21  1249   * acpi_handle_<level>: P=
rint message with ACPI prefix and object path
fbfddae696572e Toshi Kani       2012-11-21  1250   *
fbfddae696572e Toshi Kani       2012-11-21  1251   * These interfaces acqui=
re the global namespace mutex to obtain an object
fbfddae696572e Toshi Kani       2012-11-21  1252   * path.  In interrupt co=
ntext, it shows the object path as <n/a>.
fbfddae696572e Toshi Kani       2012-11-21  1253   */
fbfddae696572e Toshi Kani       2012-11-21  1254  #define acpi_handle_emerg=
(handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1255  	acpi_handle_printk(KERN_=
EMERG, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1256  #define acpi_handle_alert=
(handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1257  	acpi_handle_printk(KERN_=
ALERT, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1258  #define acpi_handle_crit(=
handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1259  	acpi_handle_printk(KERN_=
CRIT, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1260  #define acpi_handle_err(h=
andle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1261  	acpi_handle_printk(KERN_=
ERR, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1262  #define acpi_handle_warn(=
handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1263  	acpi_handle_printk(KERN_=
WARNING, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1264  #define acpi_handle_notic=
e(handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1265  	acpi_handle_printk(KERN_=
NOTICE, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1266  #define acpi_handle_info(=
handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1267  	acpi_handle_printk(KERN_=
INFO, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1268 =20
45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1269  #if defined(DEBUG)
fbfddae696572e Toshi Kani       2012-11-21  1270  #define acpi_handle_debug=
(handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1271  	acpi_handle_printk(KERN_=
DEBUG, handle, fmt, ##__VA_ARGS__)
fbfddae696572e Toshi Kani       2012-11-21  1272  #else
45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1273  #if defined(CONFIG_D=
YNAMIC_DEBUG)
45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1274  #define acpi_handle_=
debug(handle, fmt, ...)				\
f1ebe04f5ba2f4 Rasmus Villemoes 2019-03-07 @1275  	_dynamic_func_call(fmt, =
__acpi_handle_debug,			\
f1ebe04f5ba2f4 Rasmus Villemoes 2019-03-07  1276  			   handle, pr_fmt(fmt)=
, ##__VA_ARGS__)
45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1277  #else
fbfddae696572e Toshi Kani       2012-11-21  1278  #define acpi_handle_debug=
(handle, fmt, ...)				\
fbfddae696572e Toshi Kani       2012-11-21  1279  ({									\
fbfddae696572e Toshi Kani       2012-11-21  1280  	if (0)								\
fbfddae696572e Toshi Kani       2012-11-21  1281  		acpi_handle_printk(KERN=
_DEBUG, handle, fmt, ##__VA_ARGS__); \
fbfddae696572e Toshi Kani       2012-11-21  1282  	0;								\
fbfddae696572e Toshi Kani       2012-11-21  1283  })
fbfddae696572e Toshi Kani       2012-11-21  1284  #endif
45fef5b88d1f2f Bj=C3=B8rn Mork       2014-05-22  1285  #endif
fbfddae696572e Toshi Kani       2012-11-21  1286 =20

:::::: The code at line 1275 was first introduced by commit
:::::: f1ebe04f5ba2f49fd672f12cdef46acda73cd9cf ACPI: implement acpi_handle=
_debug in terms of _dynamic_func_call

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

