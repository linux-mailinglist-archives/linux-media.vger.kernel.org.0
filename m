Return-Path: <linux-media+bounces-62911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNUSFhsMF2oR2gcAu9opvQ
	(envelope-from <linux-media+bounces-62911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:22:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866505E6C9C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0D03040F87
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B2137757D;
	Wed, 27 May 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huhAkmUz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4B24CEEA
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895037; cv=none; b=qtDVoZ6ntkY3fzr2TXmreCvxdiGSQB8OYkiF2iBdRIsW0lU1DMAUgo0K36Wfg5f7UIFcwfva/8eIasNYVF6/5nIvinz3ftQVTIj3mTh7L0PPao1aBiFXTQ6sirqJ8emfjYL8JMCuKnyiRxnpsZeGYPkYa0FFVEID7HrAau1fCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895037; c=relaxed/simple;
	bh=I/KoFesp8lYkD2t912+yIwKZUxBjIkcP/79EWfAGy08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VkZMBX0+MhBEjhxJw1JnHi2dwaDIWWldgbn6bbeUTYEL/NG8xW3y0+HjiRCucvlPioaI7cxdrthTYm6re09OdthIqb5qDPKjGOcAsvvaCyjhWeDLY6ZfpV8lygmS/kpHYPjqPt8BzankX5hcymtnr+4fqMTV+mxDEDSq2jLaIFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huhAkmUz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779895034; x=1811431034;
  h=date:from:to:cc:subject:message-id;
  bh=I/KoFesp8lYkD2t912+yIwKZUxBjIkcP/79EWfAGy08=;
  b=huhAkmUzXSTGJPOp7nDV06oOp37NhzMia3fE8KB+PYiBm6SDpOp8q+LV
   1HAk+yEvaBA3qAPyGucNKIEZcOA4PnnFIFcjCdJbnA8fa3VUetNllFLvu
   mNvhEE4/XxUqUwUii/sqlxQgWHrstbokJMnAiQ+YnWPcIXD/wo2TS0OMQ
   TfmZ9Nnxh1JdDR7JNqDXxanHZOoxRes0kMsI8R6lUeu7anvcTimiC00jd
   Qyll8GcHcioARBH9L6POqxhZ005MOUfAzJD0q2gf3TY10ZfLBhEXJ878k
   fwylxwSc8iLcMgYlSqk0Ad/JpJ6C+Z/sGOYB74II3EZh9yzJdZUGiiIfE
   Q==;
X-CSE-ConnectionGUID: mpEQ9EUyS96N/J1j174ksA==
X-CSE-MsgGUID: VcDqgCNJTsWfCcEfYm16Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91834545"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91834545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 08:17:13 -0700
X-CSE-ConnectionGUID: Zj9FhMy4S62WV3V0PEwgSA==
X-CSE-MsgGUID: R0GhctizTRWgMReb4Ggtng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="235885971"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2026 08:17:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSG0L-0000000045m-2cc8;
	Wed, 27 May 2026 15:17:09 +0000
Date: Wed, 27 May 2026 23:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 5b470f2ed717705b51f4a799722dffb34a37f10a
Message-ID: <202605272348.idwODaY6-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-62911-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 866505E6C9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 5b470f2ed717705b51f4a799722dffb34a37f10a  Documentation: media: Reword blanking control documentation

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202605271111.UVoTvlKX-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202605271150.bla1wpwS-lkp@intel.com

    drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:980:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:981:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:981:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'const struct v4l2_subdev_client_info *' [-Werror,-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'const struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/max96712/max96712.c:267:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/max96712/max96712.c:267:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/staging/media/max96712/max96712.c:267:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:7: error: too few arguments to function call, expected 4, have 3
    include/media/v4l2-device.h:297:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2021:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:2021:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:2021:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'
    include/media/v4l2-subdev.h:2021:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2024:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'
    include/media/v4l2-subdev.h:2024:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:2024:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-subdev.h:2024:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2039:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:2039:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:2039:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'
    include/media/v4l2-subdev.h:2039:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2042:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'
    include/media/v4l2-subdev.h:2042:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:2042:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-subdev.h:2042:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2116:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2116:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2134:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2134:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2134:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2134:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arc-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arc-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm64-allmodconfig
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   `-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|-- csky-allmodconfig
|   `-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|-- hexagon-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- i386-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- i386-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- m68k-allmodconfig
|   `-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|-- m68k-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- microblaze-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- mips-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- mips-allyesconfig
|   `-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|-- nios2-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- openrisc-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- parisc-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- parisc-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- powerpc-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- riscv-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- riscv-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- s390-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- s390-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- sh-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- sh-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- sparc64-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- um-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- um-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|-- x86_64-allmodconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-allyesconfig
|   |-- drivers-media-platform-renesas-sh_vou.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-pointer-types-passing-struct-v4l2_subdev_state-to-parameter-of-type-const-struct-v4l2_subdev_client_info-Werror-Wincompatible-pointer-ty
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-randconfig-161
|   `-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
`-- xtensa-allyesconfig
    |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
    |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
    |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have

elapsed time: 1339m

configs tested: 63
configs skipped: 0

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260527    clang-19
loongarch   randconfig-002-20260527    gcc-13.4.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

