Return-Path: <linux-media+bounces-52332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJN+DfvohmlNRwQAu9opvQ
	(envelope-from <linux-media+bounces-52332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 08:25:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2E1051FC
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 08:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DE443021E46
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 07:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8034D2F6921;
	Sat,  7 Feb 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fclVqWUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791F27F75C
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770449137; cv=none; b=hP8HacqGDRqG9OculRwS1oPMAe8SWHjdsDzu8jz/AhBopVXvUjfz1Qvc8NtfMiqg64xT9DgTglBcK4ix9rW78o7fdV6wNuFh33e5kGzPjkcimzsd8KSH7TjgecJ6q2l7EpG5mArsKklE30ZKNksOwmM5HOWF8qFzOJR+4qMdIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770449137; c=relaxed/simple;
	bh=7bjpnmxiK1ueGm/qIMlFMfNc0W20Be2CAgaOdcDS14Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jK547Q0g9IHZhMLa/9+BcitUa+hl4QMfLNeiDerFHSxU+jl+9DJLOAnykc7st9u9VjolwJIqLxhxV03sjvKF0Olsi8WY5/2myZLlM3es/D9aegXVS9vF0gmrdQOaOu4IMwJ3H6nOZEsIYdlQKfHEyOrW/NWjaXFDxHU3V5zM8+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fclVqWUY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770449137; x=1801985137;
  h=date:from:to:cc:subject:message-id;
  bh=7bjpnmxiK1ueGm/qIMlFMfNc0W20Be2CAgaOdcDS14Q=;
  b=fclVqWUYzpYy5H8H5klZmqcJNzCVsouPz8/HGAvPE07UByayeG1TZjye
   +/Pg1pzRsmff2kP2UbG1A2OYNyAfdjwAozF0N8IyJYrgPZJx82kr9iKnM
   O6JB4O8jY36O8psnNQM35NcXqi0qqd7bXZGWd+pGwECQY+HPwpS4nkWFE
   0CV2MI76hMhrBzWc4FNKo0Dvm7uMFPOwld0oQThQfBlgbdXnh9PKESgAX
   /StLPy1oQ2i+iioTOfAdedBo/Fy3pVzPlBzMZCYr6zGMXz91+YR6fFatv
   PpU+S5Y8tcdIhAMi9e6iLTp7ExGmNelD9TtZsN2YVqkrm6HIWNDPAsn/n
   g==;
X-CSE-ConnectionGUID: yeOXtcqOScubj586dqAR5Q==
X-CSE-MsgGUID: kfQN8Z2fSCeY/HWCMh+loQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75498143"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75498143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:25:37 -0800
X-CSE-ConnectionGUID: gGWcUqlQRJWr5g2PdO7dzA==
X-CSE-MsgGUID: EAPXmfVpRumP4lQGxTI/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210908498"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 23:25:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vochA-00000000lU4-47st;
	Sat, 07 Feb 2026 07:25:32 +0000
Date: Sat, 07 Feb 2026 15:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD REGRESSION
 1b58854744d17413b2855b20178e63a1c82d58f5
Message-ID: <202602071543.xDCiY9fG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52332-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: CCF2E1051FC
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 1b58854744d17413b2855b20178e63a1c82d58f5  media: v4l: Add struct v4l2_subdev_client_info argument to pad ops

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202602070104.132QkQjg-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070139.HB5ypt6u-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070144.zjnSVXAx-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070152.AuqeXeCe-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070533.3Ybd45b6-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070821.c9SviwgN-lkp@intel.com

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
    drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:497:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:499:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c:162:5: error: conflicting types for 'ipu6_isys_subdev_set_fmt'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    drivers/media/pci/saa7134/saa7134-empress.c:106:2: error: too few arguments to function call, expected 4, have 3
    drivers/media/pci/saa7134/saa7134-empress.c:106:40: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/pci/saa7134/saa7134-empress.c:106:47: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/pci/saa7134/saa7134-empress.c:125:40: error: passing argument 3 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/pci/saa7134/saa7134-empress.c:125:47: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c:520:56: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c:520:56: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c:520:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c:520:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c:520:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/cadence/cdns-csi2rx.c:279:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/cadence/cdns-csi2rx.c:280:10: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/cadence/cdns-csi2rx.c:280:10: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/cadence/cdns-csi2rx.c:280:45: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/cadence/cdns-csi2rx.c:280:45: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/cadence/cdns-csi2rx.c:280:45: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/cadence/cdns-csi2rx.c:280:45: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/intel/pxa_camera.c:1822:48: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/intel/pxa_camera.c:1822:48: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/intel/pxa_camera.c:1822:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/marvell/mcam-core.c:1025:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/marvell/mcam-core.c:1025:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/marvell/mcam-core.c:1025:9: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/nxp/imx7-media-csi.c:1415:62: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/nxp/imx7-media-csi.c:1415:62: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/media/platform/nxp/imx7-media-csi.c:1415:69: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/nxp/imx7-media-csi.c:1415:69: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/nxp/imx7-media-csi.c:1415:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/rcar-vin/rcar-dma.c:1184:6: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:716:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/renesas/sh_vou.c:717:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/sh_vou.c:977:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:267:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:267:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_brx.c:270:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:160:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:160:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_clu.c:161:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'
    drivers/media/platform/renesas/vsp1/vsp1_entity.c:161:5: error: conflicting types for 'vsp1_subdev_get_pad_format'; have 'int(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)'
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:378:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:378:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_histo.c:383:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:126:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:126:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_hsit.c:127:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:69:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:69:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_iif.c:70:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:73:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:73:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lif.c:74:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:136:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:136:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_lut.c:137:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:280:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_rwpf.c:283:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:262:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:262:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_sru.c:263:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:249:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:249:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uds.c:250:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:176:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:176:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/renesas/vsp1/vsp1_uif.c:179:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:666:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:666:68: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:666:9: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/st/stm32/stm32-dcmi.c:995:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/cal/cal-video.c:114:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/cal/cal-video.c:114:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/cal/cal-video.c:114:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/ti/cal/cal-video.c:139:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/cal/cal-video.c:139:63: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:956:8: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:957:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:957:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:59: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/ti/omap3isp/ispccdc.c:1160:7: error: too few arguments to function call, expected 4, have 3
    drivers/media/platform/via/via-camera.c:252:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/via/via-camera.c:252:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/media/platform/via/via-camera.c:252:9: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:765:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:901:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:3742:67: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:3742:67: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:3749:69: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:3749:69: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_csi2.c:136:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_subdev.c:577:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_subdev.c:579:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_v4l2.c:916:32: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_v4l2.c:916:32: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_v4l2.c:971:37: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/atomisp/pci/atomisp_v4l2.c:971:37: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/deprecated/atmel/atmel-isc-base.c:962:8: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/deprecated/atmel/atmel-isc-base.c:963:32: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/deprecated/atmel/atmel-isc-base.c:963:32: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-ic-prp.c:468:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/imx/imx-ic-prp.c:468:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-ic-prpencvf.c:1317:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/imx/imx-ic-prpencvf.c:1317:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-capture.c:362:66: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-capture.c:362:66: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-capture.c:362:8: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/imx/imx-media-csi.c:1880:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/imx/imx-media-csi.c:1880:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-csi.c:1882:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-utils.c:444:64: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-utils.c:444:64: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx-media-utils.c:444:9: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/imx/imx-media-vdic.c:848:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/imx/imx-media-vdic.c:848:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/imx/imx6-mipi-csi2.c:622:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/imx/imx6-mipi-csi2.c:622:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu3/ipu3-v4l2.c:915:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu3/ipu3-v4l2.c:917:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:373:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-csi2.c:374:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:116:24: error: too few arguments to function 'v4l2_subdev_get_fmt'
    drivers/staging/media/ipu7/ipu7-isys-subdev.c:116:48: error: passing argument 2 of 'v4l2_subdev_get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/starfive/camss/stf-isp.c:310:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/starfive/camss/stf-isp.c:310:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/starfive/camss/stf-isp.c:311:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/staging/media/starfive/camss/stf-video.c:233:75: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/starfive/camss/stf-video.c:233:75: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/starfive/camss/stf-video.c:233:9: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c:340:13: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c:340:27: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/csi.c:447:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/staging/media/tegra-video/csi.c:447:14: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/csi.c:447:35: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:483:10: error: too few arguments to function call, expected 4, have 3
    drivers/staging/media/tegra-video/vi.c:484:19: error: passing argument 3 of '__sd->ops->pad->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:484:19: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:484:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:484:54: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:498:47: error: passing argument 2 of '__sd->ops->pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:498:47: error: passing argument 2 of 'v4l2_subdev_call_wrappers.pad->set_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:498:54: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:498:54: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:579:53: error: passing argument 3 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:579:53: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:579:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:579:60: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:676:59: error: passing argument 3 of '__sd->ops->pad->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:676:59: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->set_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:676:66: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:676:66: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-device.h:297:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'
    include/media/v4l2-device.h:297:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-device.h:297:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-device.h:297:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:297:5: error: too few arguments to function '__sd->ops->pad->get_fmt'
    include/media/v4l2-device.h:297:5: error: too few arguments to function '__sd->ops->pad->set_fmt'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'
    include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->get_fmt'
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->get_selection'
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->set_fmt'
    include/media/v4l2-subdev.h:1908:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->set_selection'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_selection'
    include/media/v4l2-subdev.h:1908:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->get_fmt'
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->get_selection'
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->set_fmt'
    include/media/v4l2-subdev.h:1911:15: error: too few arguments to function '__sd->ops->pad->set_selection'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'
    include/media/v4l2-subdev.h:1911:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1939:41: error: passing argument 2 of '__sd->ops->pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:41: error: passing argument 2 of 'v4l2_subdev_call_wrappers.pad->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1939:55: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1976:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1976:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|-- alpha-randconfig-r111-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_selection
|-- arc-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   `-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from
|-- arc-randconfig-001-20260207
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   `-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|-- arm-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|-- arm-randconfig-001-20260207
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_fmt
|-- arm-randconfig-002-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- arm-randconfig-003-20260207
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-set_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-set_selection
|-- csky-randconfig-002-20260206
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|-- hexagon-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
|-- hexagon-randconfig-002-20260206
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
|-- i386-allmodconfig
|   |-- drivers-staging-media-atomisp-i2c-atomisp-gc2235.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-i2c-atomisp-ov2722.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-staging-media-atomisp-pci-atomisp_subdev.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-pci-atomisp_subdev.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompa
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:passing-argument-of-v4l2_subdev_get_fmt-from-incompatible-pointer-type
|   `-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt
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
|   |-- drivers-media-pci-intel-ipu6-ipu6-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompat
|   |-- drivers-media-pci-intel-ipu6-ipu6-isys-subdev.c:error:conflicting-types-for-ipu6_isys_subdev_set_fmt-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-via-via-camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-via-via-camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-i2c-atomisp-gc2235.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-i2c-atomisp-ov2722.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_cmd.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|   |-- drivers-staging-media-atomisp-pci-atomisp_subdev.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-inc
|   |-- drivers-staging-media-atomisp-pci-atomisp_subdev.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-atomisp-pci-atomisp_v4l2.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-ipu3-ipu3-v4l2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-ipu3-ipu3-v4l2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-ipu7-ipu7-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompa
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:passing-argument-of-v4l2_subdev_get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-ipu7-ipu7-isys-subdev.c:error:too-few-arguments-to-function-v4l2_subdev_get_fmt
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection
|-- i386-buildonly-randconfig-002-20260207
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-buildonly-randconfig-005-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-buildonly-randconfig-006-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|-- i386-randconfig-003-20260207
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   `-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|-- i386-randconfig-005-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|-- i386-randconfig-011-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- i386-randconfig-014-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|-- loongarch-randconfig-001-20260206
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|-- loongarch-randconfig-002-20260206
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   `-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|-- m68k-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   `-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|-- mips-allmodconfig
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
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-expected-have
|-- nios2-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection
|-- openrisc-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|-- parisc-allmodconfig
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
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-expected-have
|-- parisc-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-via-via-camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-via-via-camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|-- parisc-randconfig-001-20260207
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- parisc-randconfig-002-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|-- powerpc-allmodconfig
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
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-expected-have
|-- powerpc64-randconfig-002-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- riscv-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-via-via-camera.c:error:too-few-arguments-to-function-call-expected-have
|-- s390-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-intel-pxa_camera.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subde
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_s
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_s
|   |-- drivers-staging-media-tegra-video-csi.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subd
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- s390-allyesconfig
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
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-marvell-mcam-core.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-omap3isp-ispccdc.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-deprecated-atmel-atmel-isc-base.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-ic-prp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   |-- drivers-staging-media-imx-imx-ic-prpencvf.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatib
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-imx-imx-media-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompati
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-utils.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-imx-imx-media-vdic.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-imx-imx6-mipi-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatibl
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-expected-have
|-- sh-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- sh-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-amlogic-c3-isp-c3-isp-capture.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-intel-pxa_camera.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
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
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-cal-cal-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-ti-j721e-csi2rx-j721e-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-csi.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-p
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_fmt-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-set_selection-expected-have
|-- sparc-randconfig-001-20260207
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:passing-argument-of-__sd-ops-pad-set_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-get_fmt
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-__sd-ops-pad-set_fmt
|-- sparc-randconfig-002-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- sparc64-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
|-- sparc64-randconfig-001-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- um-allmodconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-media-platform-nxp-imx7-media-csi.c:error:too-few-arguments-to-function-call-expected-have
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-s
|-- um-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|-- x86_64-buildonly-randconfig-002-20260207
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt
|-- x86_64-buildonly-randconfig-003-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|-- x86_64-buildonly-randconfig-005-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-001-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-002-20260207
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|-- x86_64-randconfig-003-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:too-few-arguments-to-function-call-expected-have
|   `-- drivers-media-platform-marvell-mcam-core.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-randconfig-005-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_get_selection
|   |-- Warning:drivers-media-i2c-imx335.c-function-parameter-ci-not-described-in-imx335_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-randconfig-012-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   `-- include-media-v4l2-device.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-set_fmt
|-- x86_64-randconfig-013-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-pci-intel-ipu6-ipu6-isys-csi2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompat
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-subdev.c:error:conflicting-types-for-ipu6_isys_subdev_set_fmt-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4
|-- x86_64-randconfig-014-20260207
|   `-- drivers-media-pci-saa7134-saa7134-empress.c:error:too-few-arguments-to-function-call-expected-have
|-- x86_64-randconfig-015-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-staging-media-ipu3-ipu3-v4l2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-po
|   `-- drivers-staging-media-ipu3-ipu3-v4l2.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible
|-- x86_64-randconfig-016-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-072-20260207
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-073-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- x86_64-randconfig-076-20260207
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|-- xtensa-allyesconfig
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_get_fmt
|   |-- Warning:drivers-media-i2c-imx274.c-function-parameter-ci-not-described-in-imx274_set_fmt
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_get_pad_format
|   |-- Warning:drivers-media-i2c-imx334.c-function-parameter-ci-not-described-in-imx334_set_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_get_pad_format
|   |-- Warning:drivers-media-i2c-imx412.c-function-parameter-ci-not-described-in-imx412_set_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_get_pad_format
|   |-- Warning:drivers-media-i2c-ov9282.c-function-parameter-ci-not-described-in-ov9282_set_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
|   |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompa
|   |-- drivers-staging-media-starfive-camss-stf-isp.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-inco
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-starfive-camss-stf-video.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
|   |-- drivers-staging-media-sunxi-sun6i-isp-sun6i_isp_proc.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from
|   |-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_fmt-from-incompatible-pointer-type
|   `-- include-media-v4l2-subdev.h:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_fmt-from-incompatible-pointer-type
`-- xtensa-randconfig-001-20260207
    |-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_get_pad_format
    `-- Warning:drivers-media-i2c-tvp514x.c-function-parameter-ci-not-described-in-tvp514x_set_pad_format

elapsed time: 1139m

configs tested: 164
configs skipped: 5

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260207    gcc-9.5.0
arc                   randconfig-002-20260207    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20260207    gcc-10.5.0
arm                   randconfig-002-20260207    gcc-12.5.0
arm                   randconfig-003-20260207    gcc-8.5.0
arm                   randconfig-004-20260207    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260206    gcc-14.3.0
arm64                 randconfig-002-20260206    clang-18
arm64                 randconfig-003-20260206    clang-22
arm64                 randconfig-004-20260206    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260206    gcc-15.2.0
csky                  randconfig-002-20260206    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260206    clang-19
hexagon               randconfig-002-20260206    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260207    gcc-14
i386        buildonly-randconfig-002-20260207    clang-20
i386        buildonly-randconfig-003-20260207    clang-20
i386        buildonly-randconfig-004-20260207    clang-20
i386        buildonly-randconfig-005-20260207    clang-20
i386        buildonly-randconfig-006-20260207    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260207    clang-20
i386                  randconfig-002-20260207    clang-20
i386                  randconfig-003-20260207    clang-20
i386                  randconfig-004-20260207    clang-20
i386                  randconfig-005-20260207    clang-20
i386                  randconfig-006-20260207    clang-20
i386                  randconfig-007-20260207    clang-20
i386                  randconfig-011-20260207    gcc-14
i386                  randconfig-012-20260207    gcc-14
i386                  randconfig-013-20260207    gcc-12
i386                  randconfig-014-20260207    clang-20
i386                  randconfig-015-20260207    gcc-14
i386                  randconfig-016-20260207    clang-20
i386                  randconfig-017-20260207    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260206    clang-22
loongarch             randconfig-002-20260206    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260206    gcc-8.5.0
nios2                 randconfig-002-20260206    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260207    gcc-14.3.0
parisc                randconfig-002-20260207    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    clang-22
powerpc               randconfig-001-20260207    gcc-10.5.0
powerpc               randconfig-002-20260207    gcc-15.2.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260207    clang-22
powerpc64             randconfig-002-20260207    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260207    clang-18
riscv                 randconfig-002-20260207    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260207    gcc-8.5.0
s390                  randconfig-002-20260207    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260207    gcc-15.2.0
sh                    randconfig-002-20260207    gcc-12.5.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260207    gcc-8.5.0
sparc                 randconfig-002-20260207    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260207    gcc-14.3.0
sparc64               randconfig-002-20260207    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260207    clang-22
um                    randconfig-002-20260207    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260207    clang-20
x86_64      buildonly-randconfig-002-20260207    gcc-14
x86_64      buildonly-randconfig-003-20260207    gcc-14
x86_64      buildonly-randconfig-004-20260207    clang-20
x86_64      buildonly-randconfig-005-20260207    clang-20
x86_64      buildonly-randconfig-006-20260207    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260207    gcc-14
x86_64                randconfig-002-20260207    gcc-14
x86_64                randconfig-003-20260207    clang-20
x86_64                randconfig-004-20260207    clang-20
x86_64                randconfig-005-20260207    clang-20
x86_64                randconfig-006-20260207    clang-20
x86_64                randconfig-011-20260207    gcc-14
x86_64                randconfig-012-20260207    gcc-14
x86_64                randconfig-013-20260207    gcc-14
x86_64                randconfig-014-20260207    clang-20
x86_64                randconfig-015-20260207    gcc-14
x86_64                randconfig-016-20260207    gcc-14
x86_64                randconfig-071-20260207    gcc-14
x86_64                randconfig-072-20260207    clang-20
x86_64                randconfig-073-20260207    clang-20
x86_64                randconfig-074-20260207    gcc-13
x86_64                randconfig-075-20260207    clang-20
x86_64                randconfig-076-20260207    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260207    gcc-8.5.0
xtensa                randconfig-002-20260207    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

