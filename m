Return-Path: <linux-media+bounces-52623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPYcIOH0jGk8wAAAu9opvQ
	(envelope-from <linux-media+bounces-52623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 22:30:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E2127C4E
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 22:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E17830125DB
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 21:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8CF36680C;
	Wed, 11 Feb 2026 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N49IaX37"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CAB32ED37
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770845400; cv=none; b=A1ICJFV+r6EEGLc/Km7HlMpM/M9ioLtVls2jGBdLAxxtVX2jpLZiJ24udl7tYrMC9rLZFJ5Q0ZYDlQrU4hw9rVsUL4Kf7SOCL2lFXgusjdZx/J6nu857w8z/vzS1BC0FwRwMkFYt3gyPWpQu31II/CNqDCsdcXNwbvkJQHWralg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770845400; c=relaxed/simple;
	bh=Ker2ADh8aoPqspLg71QmWg/CjqpVnVLgSRzqOLbDeGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R6Qg/lIKGOn32X0E1zZT+ZsA2bRuiT+F5l55cs26zaL/EdN1UyxaGnmRfoTYiAuRCQGEhP86eU40dgzb5Bn+31n9PV9mHRKVn4IUwUNxT+nDieG6Xy3p5PfPJOlQusNSBn7Up+fhvz3BevGsFJ7NMcgyjD7CSXTHOzQZgbyypxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N49IaX37; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770845394; x=1802381394;
  h=date:from:to:cc:subject:message-id;
  bh=Ker2ADh8aoPqspLg71QmWg/CjqpVnVLgSRzqOLbDeGg=;
  b=N49IaX37CbcusQrdnsT0pirP7/8dFVtcLSIdX1n4Ayt7J60wtmSgd03K
   AIVhZxaoTzRTKtDeiZjMBlVDI4bONpm3TMJ60kLOpMl92t7273X1dFPmP
   EbvFji/7axvMt9R+xv1ErtfZJKNff8Fy/TYV/5wm+8p/997nmqqTSU1pL
   n5NMeoZ0qt/Gsz1q2EM5i2ML0pldy8RNh4DMLTbKWpavts84JpANr5hic
   GmBuxmBiYmkJiF3R/QZVqQBk1zrVVAxzTl6n04NkIaqGC4ZTs+SWWG/M1
   U+L1YY7EQDpUi3i1Cq+/+rGEPnJ0Xt+/VazE0B/+Ap5xQz5b1cDSSt5TX
   A==;
X-CSE-ConnectionGUID: clFrZImVTaanCNItLRlUhQ==
X-CSE-MsgGUID: Lic3OvUVS/eoUdR9P9irKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72190901"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72190901"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:29:53 -0800
X-CSE-ConnectionGUID: Pki0qm5gQtqyJC5dwU244g==
X-CSE-MsgGUID: 1796NYcUSW2Zjiwb2ndYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211655427"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2026 13:29:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqHmO-00000000qOq-3Yuy;
	Wed, 11 Feb 2026 21:29:48 +0000
Date: Thu, 12 Feb 2026 05:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD REGRESSION
 11ab80de774b0527a7365d6f03ea5dcd0ace3e85
Message-ID: <202602120538.gtSnK1M1-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-52623-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 442E2127C4E
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 11ab80de774b0527a7365d6f03ea5dcd0ace3e85  media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202602070144.zjnSVXAx-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070152.AuqeXeCe-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070533.3Ybd45b6-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070821.c9SviwgN-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602112130.C4fhjpAe-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602112253.JRfzluk0-lkp@intel.com

    Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
    Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
    Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
    Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:885 function parameter 'ci' not described in 'imx335_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:962 function parameter 'ci' not described in 'imx335_get_selection'
    Warning: drivers/media/i2c/imx412.c:715 function parameter 'ci' not described in 'imx412_get_pad_format'
    Warning: drivers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
    Warning: drivers/media/i2c/ov9282.c:1000 function parameter 'ci' not described in 'ov9282_set_pad_format'
    Warning: drivers/media/i2c/ov9282.c:968 function parameter 'ci' not described in 'ov9282_get_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:47: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:47: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:6: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:666:54: error: passing argument 3 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:666:54: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:63: error: passing argument 3 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:63: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:52: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:52: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:7: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:375:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:375:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->get_fmt'
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->set_fmt'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->get_fmt'
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->set_fmt'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1976:42: error: passing argument 2 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:1976:42: error: passing argument 2 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:42: error: passing argument 2 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:42: error: passing argument 2 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2003:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm-defconfig
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|-- arm-randconfig-004-20260211
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_fmt
|-- arm64-defconfig
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|-- arm64-randconfig-002-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- arm64-randconfig-002-20260212
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|-- csky-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- i386-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:conflicting-types-for-ipu7_isys_subdev_set_fmt-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- i386-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:conflicting-types-for-ipu7_isys_subdev_set_fmt-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- i386-buildonly-randconfig-001-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-buildonly-randconfig-003-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-buildonly-randconfig-006-20260211
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-004-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-005-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-012-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-014-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-141-20260211
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- loongarch-randconfig-001-20260211
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- m68k-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- m68k-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- microblaze-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- mips-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- nios2-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- nios2-randconfig-002-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- openrisc-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- riscv-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:too-few-arguments-to-function-call-expected-have
|-- sh-randconfig-001-20260211
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_fmt
|-- sh-randconfig-r072-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- sparc-randconfig-002-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- sparc64-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_
|   `-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:conflicting-types-for-ipu7_isys_subdev_set_fmt
|-- x86_64-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format
|   |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|   |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v
|   |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_
|-- x86_64-buildonly-randconfig-001-20260211
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-buildonly-randconfig-002-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-buildonly-randconfig-003-20260211
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   `-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|-- x86_64-randconfig-003-20260211
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   `-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|-- x86_64-randconfig-004-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-011-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-015-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-161-20260211
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
`-- xtensa-allyesconfig
    |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
    |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
    |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
    |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
    |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
    |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
    |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
    |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
    |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
    |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
    |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
    |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
    |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
    |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_get_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
    |-- drivers-media-platform-renesas-vsp1-vsp1_histo.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
    |-- drivers-media-platform-renesas-vsp1-vsp1_hsit.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
    |-- drivers-media-platform-renesas-vsp1-vsp1_iif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_lif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_lut.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_rwpf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incomp
    |-- drivers-media-platform-renesas-vsp1-vsp1_sru.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_uds.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
    |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have

elapsed time: 737m

configs tested: 258
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260211    gcc-9.5.0
arc                   randconfig-001-20260212    gcc-10.5.0
arc                   randconfig-002-20260211    gcc-9.5.0
arc                   randconfig-002-20260212    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                       omap2plus_defconfig    gcc-15.2.0
arm                   randconfig-001-20260211    gcc-10.5.0
arm                   randconfig-001-20260212    gcc-10.5.0
arm                   randconfig-002-20260211    gcc-8.5.0
arm                   randconfig-002-20260212    gcc-10.5.0
arm                   randconfig-003-20260211    clang-22
arm                   randconfig-003-20260212    gcc-10.5.0
arm                   randconfig-004-20260211    gcc-8.5.0
arm                   randconfig-004-20260212    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260211    gcc-8.5.0
arm64                 randconfig-001-20260212    gcc-10.5.0
arm64                 randconfig-002-20260211    gcc-15.2.0
arm64                 randconfig-002-20260212    gcc-10.5.0
arm64                 randconfig-003-20260211    gcc-15.2.0
arm64                 randconfig-003-20260212    gcc-10.5.0
arm64                 randconfig-004-20260211    gcc-14.3.0
arm64                 randconfig-004-20260212    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260211    gcc-15.2.0
csky                  randconfig-001-20260212    gcc-10.5.0
csky                  randconfig-002-20260211    gcc-11.5.0
csky                  randconfig-002-20260212    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260211    clang-22
hexagon               randconfig-001-20260212    clang-18
hexagon               randconfig-002-20260211    clang-22
hexagon               randconfig-002-20260212    clang-18
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260211    clang-20
i386        buildonly-randconfig-002-20260211    clang-20
i386        buildonly-randconfig-002-20260211    gcc-12
i386        buildonly-randconfig-003-20260211    clang-20
i386        buildonly-randconfig-004-20260211    clang-20
i386        buildonly-randconfig-005-20260211    clang-20
i386        buildonly-randconfig-005-20260211    gcc-14
i386        buildonly-randconfig-006-20260211    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260211    gcc-14
i386                  randconfig-002-20260211    gcc-14
i386                  randconfig-003-20260211    gcc-14
i386                  randconfig-004-20260211    clang-20
i386                  randconfig-005-20260211    gcc-14
i386                  randconfig-006-20260211    clang-20
i386                  randconfig-007-20260211    gcc-14
i386                  randconfig-011-20260211    clang-20
i386                  randconfig-012-20260211    clang-20
i386                  randconfig-013-20260211    clang-20
i386                  randconfig-014-20260211    clang-20
i386                  randconfig-015-20260211    clang-20
i386                  randconfig-016-20260211    clang-20
i386                  randconfig-017-20260211    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260211    clang-22
loongarch             randconfig-001-20260212    clang-18
loongarch             randconfig-002-20260211    clang-22
loongarch             randconfig-002-20260212    clang-18
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    gcc-15.2.0
mips                         bigsur_defconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                 decstation_r4k_defconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260211    clang-22
nios2                 randconfig-001-20260211    gcc-11.5.0
nios2                 randconfig-001-20260212    clang-18
nios2                 randconfig-002-20260211    clang-22
nios2                 randconfig-002-20260211    gcc-11.5.0
nios2                 randconfig-002-20260212    clang-18
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260211    clang-22
parisc                randconfig-001-20260211    gcc-14.3.0
parisc                randconfig-002-20260211    clang-22
parisc                randconfig-002-20260211    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260211    clang-16
powerpc               randconfig-001-20260211    clang-22
powerpc               randconfig-002-20260211    clang-22
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                     tqm8541_defconfig    clang-22
powerpc                      tqm8xx_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260211    clang-17
powerpc64             randconfig-001-20260211    clang-22
powerpc64             randconfig-002-20260211    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260211    gcc-8.5.0
riscv                 randconfig-002-20260211    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260211    gcc-13.4.0
s390                  randconfig-002-20260211    clang-22
s390                       zfcpdump_defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                    randconfig-001-20260211    gcc-9.5.0
sh                    randconfig-002-20260211    gcc-13.4.0
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260211    gcc-8.5.0
sparc                 randconfig-002-20260211    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260211    gcc-15.2.0
sparc64               randconfig-002-20260211    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260211    clang-17
um                    randconfig-002-20260211    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260211    clang-20
x86_64      buildonly-randconfig-001-20260211    gcc-12
x86_64      buildonly-randconfig-002-20260211    gcc-12
x86_64      buildonly-randconfig-002-20260211    gcc-14
x86_64      buildonly-randconfig-003-20260211    gcc-12
x86_64      buildonly-randconfig-003-20260211    gcc-14
x86_64      buildonly-randconfig-004-20260211    gcc-12
x86_64      buildonly-randconfig-005-20260211    clang-20
x86_64      buildonly-randconfig-005-20260211    gcc-12
x86_64      buildonly-randconfig-006-20260211    clang-20
x86_64      buildonly-randconfig-006-20260211    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260211    clang-20
x86_64                randconfig-002-20260211    clang-20
x86_64                randconfig-003-20260211    clang-20
x86_64                randconfig-004-20260211    clang-20
x86_64                randconfig-005-20260211    clang-20
x86_64                randconfig-006-20260211    clang-20
x86_64                randconfig-011-20260211    gcc-14
x86_64                randconfig-012-20260211    gcc-14
x86_64                randconfig-013-20260211    gcc-12
x86_64                randconfig-013-20260211    gcc-14
x86_64                randconfig-014-20260211    clang-20
x86_64                randconfig-014-20260211    gcc-14
x86_64                randconfig-015-20260211    gcc-14
x86_64                randconfig-016-20260211    gcc-14
x86_64                randconfig-071-20260211    clang-20
x86_64                randconfig-072-20260211    clang-20
x86_64                randconfig-073-20260211    clang-20
x86_64                randconfig-074-20260211    clang-20
x86_64                randconfig-075-20260211    clang-20
x86_64                randconfig-076-20260211    clang-20
x86_64                randconfig-076-20260211    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260211    gcc-8.5.0
xtensa                randconfig-002-20260211    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

