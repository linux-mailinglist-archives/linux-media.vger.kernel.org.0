Return-Path: <linux-media+bounces-58029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKzpF2t+z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF43924B2
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644CB30AB171
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167E437CD4F;
	Fri,  3 Apr 2026 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcEffWPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FF37F8C4
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205726; cv=none; b=OWb7hxMrS+Nc8oh5/1KuynkGpQWnkBFiUW1oiBrVJ8CjYJaKCP7Pt2wK3n1MYs/6tFdv51gGQZtmS/O9eE+dgdOfhc/mApW2HM6qX3Z254N8V7KdBL8M3UJqsh38/F+5yBdk4uPbYxEoukKCV/Nrrtv53WQ4xyohXKJQngzWXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205726; c=relaxed/simple;
	bh=OM7JAe9idMfjXGZ/45XJ/LV7IOy95UVMAYPkep6LA7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YWlbyb32HqXcUoicOZ64WBD0OG6TvJIfeMcmLCcGizYgITa+WBmfTL3acPsY/2bI4rHi0UVhU0o62wWFrO0R948JZu/oF1/QF6YK9qkTXHKtpDuuXRz+aMsu8WKZILtBX9fQBXqeiKCX4MlQ4TKg7kQs4Dp2tadaS3Am4yUIBow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcEffWPZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205722; x=1806741722;
  h=date:from:to:cc:subject:message-id;
  bh=OM7JAe9idMfjXGZ/45XJ/LV7IOy95UVMAYPkep6LA7c=;
  b=LcEffWPZ2ndy66+a6HU2bDWPQ2Twp4YpzDU7K8S9Rkx9xyG3s0rwu4QO
   W/MQK//wPmFQLKF70YNhWim1UpaZbnwZ72fXvf8Zscw6kwiKSWlUE2kE7
   3vghUOdTMy3RMWMY7nl+B73Ys6qe5hXY6af9TneUaNQsKbwRB3R6R4e7I
   UXje5NNxjSWQSkdpenq5/P+Oovi1mzXyYe0KlFWh1dTbk1+E9/LTk8j8r
   w0YzF7NpmF25EJfndw62tx4H51lT5lSmiYTBR2QBDbxSDByNYg28WWU5C
   QZ10hyIVl4dg8kjfwHSdNGPIDMPzaOaHQDajBt2PyG4Fkk/TVoqmNyA/3
   A==;
X-CSE-ConnectionGUID: fCz6a8XERra9qDz2CfuGUA==
X-CSE-MsgGUID: 1xkfspaUTMejP5w+4I1/qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852145"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852145"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:59 -0700
X-CSE-ConnectionGUID: uNNi8nbyQc2E0d1TtQdXQA==
X-CSE-MsgGUID: EUJPpgEhQIO6xqhXA3rnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943094"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-00000000133-2uXN;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Subject: [sailus-media-tree:pld 24/32]
 drivers/media/v4l2-core/v4l2-fwnode.c:831:3: error: call to undeclared
 function '__acpi_handle_debug'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604022233.XxAwrVdV-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58029-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: A5DF43924B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: 010794c2fea2ddf1d1556e40bcd97c3c3b952825 [24/32] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
config: hexagon-randconfig-001-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022233.XxAwrVdV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022233.XxAwrVdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022233.XxAwrVdV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-fwnode.c:831:3: error: call to undeclared function '__acpi_handle_debug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     831 |                 acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
         |                 ^
   include/linux/acpi.h:1275:26: note: expanded from macro 'acpi_handle_debug'
    1275 |         _dynamic_func_call(fmt, __acpi_handle_debug,                    \
         |                                 ^
   1 error generated.


vim +/__acpi_handle_debug +831 drivers/media/v4l2-core/v4l2-fwnode.c

   820	
   821	static int v4l2_fwnode_device_parse_acpi(struct device *dev,
   822						 struct v4l2_fwnode_device_properties *props)
   823	{
   824		struct acpi_pld_info *pld;
   825		int ret = 0;
   826	
   827		if (!is_acpi_device_node(dev_fwnode(dev)))
   828			return 0;
   829	
   830		if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
 > 831			acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
   832			return 0;
   833		}
   834	
   835		if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
   836			switch (pld->panel) {
   837			case ACPI_PLD_PANEL_FRONT:
   838				props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
   839				break;
   840			case ACPI_PLD_PANEL_BACK:
   841				props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
   842				break;
   843			case ACPI_PLD_PANEL_TOP:
   844			case ACPI_PLD_PANEL_LEFT:
   845			case ACPI_PLD_PANEL_RIGHT:
   846			case ACPI_PLD_PANEL_UNKNOWN:
   847				props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
   848				break;
   849			default:
   850				acpi_handle_warn(ACPI_HANDLE(dev),
   851						 "invalid panel %u in _PLD\n",
   852						 pld->panel);
   853				ret = -EINVAL;
   854				goto done;
   855			}
   856		}
   857	
   858		if (props->rotation == V4L2_FWNODE_PROPERTY_UNSET) {
   859			switch (pld->rotation) {
   860			case 0 ... 7:
   861				props->rotation = pld->rotation * 45;
   862				break;
   863			default:
   864				acpi_handle_warn(ACPI_HANDLE(dev),
   865						 "invalid rotation %u in _PLD\n",
   866						 pld->rotation);
   867				ret = -EINVAL;
   868				goto done;
   869			}
   870		}
   871	
   872	done:
   873		ACPI_FREE(pld);
   874		return ret;
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

