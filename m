Return-Path: <linux-media+bounces-58015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGyzBrlqz2lPwAYAu9opvQ
	(envelope-from <linux-media+bounces-58015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 09:22:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54656391B39
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 09:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68AFB3049533
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 07:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA002D8DC3;
	Fri,  3 Apr 2026 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jg+18Vmq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524631F9AF
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200619; cv=none; b=Rv7Gs6pao5KGo6kPCoEQwInMqXBrkB28XOiVHkWWdw9UivE2ep4h5F7GMCCb/TIgu5yCoiVck4Pc+2nU9lxlVFg/kRivY8StBeniX69FhFaUpA0WSf+dYI72KuhK3MZL5ivX2KLdup+ytGRqZN6Bnx6RClvDbmpO1RiM6JW01PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200619; c=relaxed/simple;
	bh=M/EC+w5gJ1uduIHftfZ8gmL6rNZReHHqTGbOXES+mcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WQk0I6p2lxdMEgNPx7hYTaqsDik8u3urXhmDHqiwkkRiotP6T8EkEbllhpBLMsUPbCfg1xas3HCSNFkpJj2VVUxhZkvVM7JBtadrlOFluoe2IWYZ9L9MXEmikkmkBlXprMZ2EI5l5XFEfgii9K9UQPGS9KJq9ITQu3C8r1eWACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jg+18Vmq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775200614; x=1806736614;
  h=date:from:to:cc:subject:message-id;
  bh=M/EC+w5gJ1uduIHftfZ8gmL6rNZReHHqTGbOXES+mcc=;
  b=Jg+18VmqNWVGoNOQYNptJUTYWlMYBK4inVWgSPPKsrhXTIj0poDdSyZA
   4yplYbZQypP5saJ8mFJ3ZlHiXpwnXGU8MiwfAevSSRnSQGjC58OEhSSbZ
   1CBG4HBIohgUDiaBnnSDYTTsjrk3cVupHquSy8F+fIzYHUG4nsCo4umhN
   lrCqFCbFN9Lk+IRhbJbXsRwkVGUljiutqIDpRYCYk7i2ZxTZp/PFfZacO
   z+LXastONrcHJIo+7T6TVbMt/10pkMCbxvToBcpeMI10k7i1OOJOLQ/Wz
   TcojTPVmCTnj4oNX9D17tdeXTawPJxK4qOq+u7MCXs1udkD4D1vHNMFmJ
   w==;
X-CSE-ConnectionGUID: qll17NvUT7uuwMnM+5oSKA==
X-CSE-MsgGUID: v4iyY40JTxCWHXVPArae0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75987596"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75987596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 00:16:53 -0700
X-CSE-ConnectionGUID: KHPlaGIeRzeXufLN6jDBdw==
X-CSE-MsgGUID: LnxZxxdpSzOPTYdoySsWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222340002"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2026 00:16:50 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Yls-000000000y1-2BD3;
	Fri, 03 Apr 2026 07:16:48 +0000
Date: Fri, 03 Apr 2026 15:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 feb4f7361e07b561023576f7d47ff4f8b8e5db69
Message-ID: <202604031558.tVt3rs5u-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-58015-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 54656391B39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: feb4f7361e07b561023576f7d47ff4f8b8e5db69  media: bcm2835-unicam: Support generic raw formats

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202603201843.dY5CTAVD-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202603201906.5eCaoTIU-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202603202019.logGbtI4-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202604031211.ZXvlxRg9-lkp@intel.com

    Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
    Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
    Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
    Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:885 function parameter 'ci' not described in 'imx335_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:962 function parameter 'ci' not described in 'imx335_get_selection'
    Warning: drivers/media/i2c/imx412.c:715 function parameter 'ci' not described in 'imx412_get_pad_format'
    Warning: drivers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
    Warning: drivers/media/i2c/ov9282.c:794 function parameter 'ci' not described in 'ov9282_get_pad_format'
    Warning: drivers/media/i2c/ov9282.c:822 function parameter 'ci' not described in 'ov9282_set_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1206:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1206:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1206:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1206:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1206:6: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:717:22: error: passing argument 3 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:29: error: passing argument 3 of '__sd->ops->pad->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:268:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:268:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:268:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:128:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:128:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:128:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:164:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:164:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:425:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:425:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:425:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:173:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:173:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:173:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:42:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:42:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:42:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:45:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:45:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:45:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:104:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:104:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:104:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:356:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:356:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:356:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:251:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:251:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:251:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:238:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:238:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:238:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:148:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:148:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:148:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:150:19: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:150:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:150:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:54: error: passing argument 3 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:54: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
    include/media/v4l2-device.h:356:12: error: too few arguments to function '__sd->ops->pad->set_fmt'
    include/media/v4l2-device.h:356:12: error: too few arguments to function '__sd->ops->pad->set_selection'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1964:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->get_fmt'
    include/media/v4l2-subdev.h:1964:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->set_fmt'
    include/media/v4l2-subdev.h:1964:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1964:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1967:15: error: too few arguments to function '__sd->ops->pad->get_fmt'
    include/media/v4l2-subdev.h:1967:15: error: too few arguments to function '__sd->ops->pad->set_fmt'
    include/media/v4l2-subdev.h:1967:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1967:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:2032:42: error: passing argument 2 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2032:42: error: passing argument 2 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2059:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2059:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2059:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2059:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    ld.lld: error: undefined symbol: __divdi3

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|-- alpha-randconfig-r051-20260403
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-__sd-ops-pad-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_selection
|-- arc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- arc-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- arm-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- arm-randconfig-r064-20260403
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-__sd-ops-pad-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_fmt
|-- arm64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- csky-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- hexagon-allmodconfig
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|-- i386-buildonly-randconfig-002-20260403
|   `-- ld.lld:error:undefined-symbol:__divdi3
|-- m68k-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- m68k-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- microblaze-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- mips-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- mips-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|-- parisc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- parisc-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- powerpc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- riscv-randconfig-002-20260403
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- s390-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- sh-allmodconfig
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- sh-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|-- sparc64-randconfig-001-20260403
|   `-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|-- um-allyesconfig
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
|   |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_
|   `-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:conflicting-types-for-ipu7_isys_subdev_set_fmt
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
    |-- drivers-media-platform-renesas-vsp1-vsp1_uif.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
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

elapsed time: 818m

configs tested: 179
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-002-20260403    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         orion5x_defconfig    clang-23
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-004-20260403    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-002-20260403    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-002-20260403    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-006-20260403    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-017-20260403    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-002-20260403    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-002-20260403    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-002-20260403    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-002-20260403    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-002-20260403    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-002-20260403    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-002-20260403    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-002-20260403    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

