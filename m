Return-Path: <linux-media+bounces-60478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNzMAZRR+mnyMQMAu9opvQ
	(envelope-from <linux-media+bounces-60478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:22:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901304D39D9
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C35C130208E1
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 20:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B243C2779;
	Tue,  5 May 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UllUv3Kx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F6390C84
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012561; cv=none; b=Xb6VGINKRXJcMRCGz/rfkUrcsUxEsZG+l5T9qwrOM3/USRfuhWI7k1WG2Q8PQTqldeqCQTCXGwpbnQtURiCe8JyMizSy0xT7kKirLNO8KomuziMnDnB2KDDr8jrudqZ4X5bGlz867MQoyMN44twUJnP52mX1jcwJeXNIukumy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012561; c=relaxed/simple;
	bh=2M53MvbZ+9sfh7m45IFu0E/Neyggppe3gcgmVR/PgMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mm4RlrMe3X0LAeQW+y/hX2VttY+mQmeIcsF3njNOx1sllNlt3xeE3+ZlSdWA4E8nCbcaFCyoM3bEmTjyB+7SdrLcCYLg/Oybc0tf3cZJ4IiZYXQiNQykoeHVwLsBAHF1JRZ74Z4iecmRpP+Bg241s/LMUrltaDVeOZLMg5xpRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UllUv3Kx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778012558; x=1809548558;
  h=date:from:to:cc:subject:message-id;
  bh=2M53MvbZ+9sfh7m45IFu0E/Neyggppe3gcgmVR/PgMM=;
  b=UllUv3KxbfP4AMXztt9RNVC0pZsIYytwp1gJ/Pue+Hje2FhQ6kaPs4Vu
   jSfusclr4kXX6hlJaCZk/SkiFK7AtNt0c2jRfoWsg3koWGrbykGEUwhdm
   sM+DpX2/hpe9g6fw3aOzk7rngGlyqA06MhfxFkfiTa4ogR0/NpAgsfouh
   XUo/P+zTxty5+0Lb76oJlY1LFX3ZTB7vehrc4JE3/+R7IrE8MKIWN3iuu
   oCMuKJgoICFwHNSytMe3KrN0QZDUgQBRK4RquFDyoK+t2XlAZ1ncMT41Y
   il2tNzi82ch1Gy329+xZCsyXlAjx6a0OBUxP03A4mX1lbGLSQmkEF5ZFo
   Q==;
X-CSE-ConnectionGUID: 7FkvimtZTG+CdJPR4TH6Wg==
X-CSE-MsgGUID: oXI/3fGwQk+e0KF5nnAcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90270489"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="90270489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 13:22:31 -0700
X-CSE-ConnectionGUID: xhALfCoxSQ6VLMYB8Ji92g==
X-CSE-MsgGUID: hYM4WUQLRIi4FJubQyJW9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="232789458"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2026 13:22:30 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKMHj-000000000Qn-3IrL;
	Tue, 05 May 2026 20:22:27 +0000
Date: Wed, 06 May 2026 04:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 9f2d6009eb7008b9c9b17ec0c10720b4397510ad
Message-ID: <202605060452.EH5FbWne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 901304D39D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60478-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:server fail,10.60.135.147:server fail,192.198.163.10:server fail,2600:3c09:e001:a7::12fc:5321:server fail];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 9f2d6009eb7008b9c9b17ec0c10720b4397510ad  media: mc: Tell when a pipeline is about to be populated

Error/Warning (recently discovered and may have been fixed):

    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    include/media/v4l2-subdev.h:1985:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:1985:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1988:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'
    include/media/v4l2-subdev.h:1988:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; expected 4, have 3

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- arc-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- arc-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- arm-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- arm64-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- csky-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- hexagon-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- m68k-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- m68k-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- microblaze-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- mips-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- mips-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- nios2-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
|-- openrisc-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- parisc-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- parisc-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- powerpc-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- riscv-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- riscv-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- s390-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- s390-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- sh-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- sh-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- sparc64-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- um-allmodconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format
|   |-- drivers-staging-media-max96712-max96712.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_su
|   |-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|   `-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|-- um-allyesconfig
|   |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
|   |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
`-- xtensa-allyesconfig
    |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:conflicting-types-for-vsp1_subdev_set_pad_format-have-int(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struc
    |-- drivers-staging-media-max96712-max96712.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
    |-- include-media-mipi-csi2.h:error:unknown-type-name-u32
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have

elapsed time: 733m

configs tested: 326
configs skipped: 23

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-002-20260505    gcc-8.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                            mmp2_defconfig    gcc-15.2.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                 randconfig-001-20260506    gcc-15.2.0
arm64                 randconfig-002-20260505    gcc-14.3.0
arm64                 randconfig-002-20260506    gcc-15.2.0
arm64                 randconfig-003-20260505    gcc-14.3.0
arm64                 randconfig-003-20260506    gcc-15.2.0
arm64                 randconfig-004-20260505    gcc-14.3.0
arm64                 randconfig-004-20260506    gcc-15.2.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                  randconfig-001-20260506    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
csky                  randconfig-002-20260506    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260505    clang-23
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-002-20260505    clang-23
hexagon               randconfig-002-20260506    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386        buildonly-randconfig-001-20260506    clang-20
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386        buildonly-randconfig-002-20260506    clang-20
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260505    gcc-14
i386        buildonly-randconfig-003-20260506    clang-20
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260505    gcc-14
i386        buildonly-randconfig-004-20260506    clang-20
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386        buildonly-randconfig-005-20260506    clang-20
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386        buildonly-randconfig-006-20260506    clang-20
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260505    clang-20
i386                  randconfig-001-20260505    gcc-14
i386                  randconfig-001-20260506    gcc-14
i386                           randconfig-002    clang-20
i386                  randconfig-002-20260505    clang-20
i386                  randconfig-002-20260505    gcc-14
i386                  randconfig-002-20260506    gcc-14
i386                           randconfig-003    clang-20
i386                  randconfig-003-20260505    clang-20
i386                  randconfig-003-20260506    gcc-14
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260505    clang-20
i386                  randconfig-004-20260505    gcc-14
i386                  randconfig-004-20260506    gcc-14
i386                           randconfig-005    clang-20
i386                  randconfig-005-20260505    clang-20
i386                  randconfig-005-20260506    gcc-14
i386                           randconfig-006    clang-20
i386                  randconfig-006-20260505    clang-20
i386                  randconfig-006-20260506    gcc-14
i386                           randconfig-007    clang-20
i386                  randconfig-007-20260505    clang-20
i386                  randconfig-007-20260505    gcc-14
i386                  randconfig-007-20260506    gcc-14
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-017-20260505    clang-20
i386                  randconfig-017-20260506    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260505    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch             randconfig-001-20260506    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260505    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
loongarch             randconfig-002-20260506    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260505    clang-23
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                 randconfig-001-20260506    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260505    clang-23
nios2                 randconfig-002-20260505    gcc-11.5.0
nios2                 randconfig-002-20260506    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc         de0_nano_multicore_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-14.3.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                         randconfig-002    gcc-14.3.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-14.3.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc                        randconfig-002    gcc-14.3.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc                     tqm8541_defconfig    clang-23
powerpc64                      randconfig-001    gcc-14.3.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64                      randconfig-002    gcc-14.3.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260505    gcc-10.5.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-002-20260506    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                  randconfig-002-20260505    gcc-10.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260505    gcc-10.5.0
sh                    randconfig-001-20260506    gcc-8.5.0
sh                    randconfig-002-20260505    gcc-10.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260505    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260505    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260505    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260505    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260505    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260505    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260505    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-002-20260505    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-003-20260505    clang-20
x86_64      buildonly-randconfig-003-20260505    gcc-14
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-004-20260505    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-005-20260505    clang-20
x86_64      buildonly-randconfig-005-20260505    gcc-14
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-006-20260505    clang-20
x86_64      buildonly-randconfig-006-20260505    gcc-14
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260505    clang-20
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-002-20260505    clang-20
x86_64                randconfig-002-20260506    clang-20
x86_64                randconfig-003-20260505    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                randconfig-004-20260505    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                randconfig-005-20260505    clang-20
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-006-20260505    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                randconfig-011-20260505    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                randconfig-012-20260505    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                randconfig-013-20260505    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                randconfig-014-20260505    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                randconfig-015-20260505    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                randconfig-016-20260505    clang-20
x86_64                randconfig-016-20260506    clang-20
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260505    clang-20
x86_64                randconfig-071-20260506    clang-20
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260505    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260505    clang-20
x86_64                randconfig-073-20260506    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260505    clang-20
x86_64                randconfig-074-20260506    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260505    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260505    clang-20
x86_64                randconfig-076-20260506    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260505    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260505    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

