Return-Path: <linux-media+bounces-56547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iITWMEtzvWmt9wIAu9opvQ
	(envelope-from <linux-media+bounces-56547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:18:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9E72DD2FA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A9623023D4B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495213D4108;
	Fri, 20 Mar 2026 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjJcFQRZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88111A0BF1
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023355; cv=none; b=heuYhjCs6hrHF/MzLWnXobFu9M5aAf39Ncg9twdHYUA8cjPSpFcuc/NWfs2N3/f8HUQXgR8shQNIt0ca2CDXFRwvKjD2uqDCqyxYI1kwpKTjdhizxpoeZYt0Z0dYSZNPd8czAkt31cwtxdRPpwOqhNBP0MsK2mD178x9rDBgjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023355; c=relaxed/simple;
	bh=V2MU87xXIvgae6wV61LEDy2Gq1DOiNT+92Pes4OPeuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l36kVgjur652zXGS7c2Pa/9LIs/y6D1dF0EC6zKKnYXbgOj2thJyboMrTbsDsnTuCVVs2ngEKZHsrEncc3t0b43xo1LwPjDkzfs8tJk2gC8pG0lRX0pPGYsL+Ke5sskWcIIsXLuafMQ9ldqZOYb3n0LXhUC7+DulYmeAXSCO5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjJcFQRZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774023348; x=1805559348;
  h=date:from:to:cc:subject:message-id;
  bh=V2MU87xXIvgae6wV61LEDy2Gq1DOiNT+92Pes4OPeuo=;
  b=FjJcFQRZ14wBkfPWr7y6172Jqr54xat/uLFWAayoHs1jfM3orKBUK1tG
   8LgiR4lg0pGvHjRQUFcylw/lnbnxyXbGjj6HztYTGQiSXeFH3iNEf6Y2S
   g6+j7xN19C2nethOsCLsS1qZOI2okcLtT42ifKTW++HJeUCwtN7nkDctd
   kaJXk/3Ww/N/TePfg8Q+plZXY1K1YAKXulkC+y1Rj2ohPhcjt/TKp76wC
   +alhCp6Tbdi4HuifEtoycasbYdcpT6HRFe9e8apcq8Em+HjoVuJdpEWs9
   tD8A1+BP0TXA2oOR1baJ3ulDBQOr6goVFrZOfHnoNKy/s4l13fuR/OUNN
   A==;
X-CSE-ConnectionGUID: jGqSClcfTxSze3Amc8ZSGg==
X-CSE-MsgGUID: r525/os7SSKBJVzt2xBEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85738151"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85738151"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 09:15:47 -0700
X-CSE-ConnectionGUID: JUiOz2LtSsqUw92LIb0g0A==
X-CSE-MsgGUID: So5qXk38R1mDyJRxsUmOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222422284"
Received: from lkp-server01.sh.intel.com (HELO ba623fe84fe1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2026 09:15:45 -0700
Received: from kbuild by ba623fe84fe1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3cVi-00000000079-1a4b;
	Fri, 20 Mar 2026 16:15:42 +0000
Date: Sat, 21 Mar 2026 00:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 7a108073e0c1f6e9035329a152d5835f9d4f9507
Message-ID: <202603210017.S6ZfMgVP-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56547-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: DC9E72DD2FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 7a108073e0c1f6e9035329a152d5835f9d4f9507  media: v4l2-subdev: Add v4l2_subdev_state_is_active()

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202603201843.dY5CTAVD-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202603201906.5eCaoTIU-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202603202019.logGbtI4-lkp@intel.com

    ' not described in 'imx334_set_pad_format'
    Warning: drivdrivers/media/platform/renesas/vsp1/vsp1_histo.c:383:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    Warning: drivers/media/0: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
    Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
    Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
    Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
    Warning: drivers/media/i2c/imx334.c:791 function parameter 'cii2c/ov9282.c:822 function parameter 'ci' not described in 'ov9282_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:885 function parameter 'ci' not described in 'imx335_set_pad_format'
    Warning: drivers/media/i2c/imx335.c:962 function parameter 'ci' not described in 'imx335_get_selection'
    Warning: drivers/media/i2c/imx412.c:715 function parameter 'ci' not described in 'imx412_get_pad_format'
    Warning: drivers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
    Warning: drivers/media/i2c/ov9282.c:794 function parameter 'ci' not described in 'ov9282_get_pad_format'
    Warning: drivers/media/i2c/ov9282.c:822 function parameter 'ci' not described in 'ov9282_set_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
    Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
    Warning: drivers/media/iers/media/i2c/imx412.c:746 function parameter 'ci' not described in 'imx412_set_pad_format'
    Warning: drivers/media/irmat *)' [-Wincompatible-function-pointer-types]
    Warning: drivers/meubdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/i2c/og01a1b.c:767:32: error: passing argument 2 of 'og01a1b_set_format' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/i2c/og01a1b.c:767:32: error: passing argument 2 of 'og01a1b_set_format' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/i2c/og01a1b.c:767:36: error: too few arguments to function call, expected 4, have 3
    drivers/media/i2c/og01a1b.c:767:9: error: too few arguments to function 'og01a1b_set_format'; expected 4, have 3
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:6: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_on of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:267:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:267:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, dia/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:160:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:160:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:378:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:378:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:126:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:126:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_for2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:2mat *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:69:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:69:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:73:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:73:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v42c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:136:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:136:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-ferror: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: 2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointerps *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:262:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:262:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_s, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:249:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:249:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:176:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expressiounction-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:176:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_forivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:741:9: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/synopsys/dw-mipi-csi2rx.c:324:24: error: too few arguments to function 'v4l2_subdev_get_fmt'; expected 4, have 3
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:7: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:373:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:373:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:101:5: error: conflicting types for 'ipu7_isys_subdev_set_fmt'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    dstruct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1930:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1930:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1933:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1933:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1941:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1941:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1941:36: error: too few arguments to function '((const struct v4l2_sul2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    include/media/v4l2-subdev.h:1944:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1944:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1944:36: error: too few arguments to function '((const struct v4lbdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1998:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2036:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2036:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:2036:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:2036:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   `-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|-- arc-allmodconfig
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
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
|   |-- drivers-media-platform-synopsys-dw-mipi-csi2rx.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arc-allyesconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- drivers-media-platform-synopsys-dw-mipi-csi2rx.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm-allyesconfig
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- arm64-allmodconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- hexagon-allmodconfig
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-rcar-vin-rcar-dma.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-sh_vou.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-media-platform-renesas-vsp1-vsp1_brx.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-media-platform-renesas-vsp1-vsp1_clu.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
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
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:conflicting-types-for-ipu7_isys_subdev_set_fmt-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
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
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|-- loongarch-allmodconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- drivers-media-platform-synopsys-dw-mipi-csi2rx.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
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
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- parisc-allyesconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- riscv-allmodconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|-- s390-allmodconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|-- sh-allyesconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|-- um-allmodconfig
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-call-expected-have
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
    |-- drivers-media-i2c-og01a1b.c:error:passing-argument-of-og01a1b_set_format-from-incompatible-pointer-type
    |-- drivers-media-i2c-og01a1b.c:error:too-few-arguments-to-function-og01a1b_set_format-expected-have
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
    |-- drivers-media-platform-synopsys-dw-mipi-csi2rx.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt-expected-have
    |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have

elapsed time: 1089m

configs tested: 55
configs skipped: 0

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

