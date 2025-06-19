Return-Path: <linux-media+bounces-35263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EECAE02E5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12F73A452D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDFD221552;
	Thu, 19 Jun 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfK/LWDz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDC1D9A54
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329948; cv=none; b=Ps4PmXW2wYqG6euQoTEy68nhqevuM+30cGmH7IzWcYJJHGMKHi+emNu0YdV2pA5L0e9eb+Bvm9WsuSCK6fhc09HkwvpHj85wBB2yoW/PXHhoZRvPpp7EREc5CjKRj4ceNsaGxlp99j6kAugu/kMvMq1usRppp6KlwbEUugylPlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329948; c=relaxed/simple;
	bh=+swIXb1UVpnojAOJB+U0+hpJ+xsuBzsrjjFpASkBQCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AddKjMe5leeKuBHJpIYLETVVsNbjHXVI65CYtokF0dFv2yR5LfMTKwBmNtN7VpjCKom1tj8tNfKiKaJUJJEk7TQA3xT9WPpXR0vOXVtiqmSbfRrJUpKYmgbbwkvGtgOF4ruOw0hiZK2e/K7WqB6YZetFEy/G2kEq+5xkogI/wTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfK/LWDz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750329947; x=1781865947;
  h=date:from:to:cc:subject:message-id;
  bh=+swIXb1UVpnojAOJB+U0+hpJ+xsuBzsrjjFpASkBQCE=;
  b=gfK/LWDzPFZeQHxjcrq4mNaJaiLUvJunrG8pAimLlMBlEv27i3AfEHqp
   ryqoifzf9Md7+HsK/Lt6YlYG801eiXpLtj+drIvToeXohuNAem9qt2gkX
   mSoa/gvWIfcaCRAOpodKvqGkUKhcZID+GYg/x1+BZuUkA6LVaoY031PcM
   eCkR3By+Fl7CdBXNcnt+HOVZvSpzD3sGfIVAd0Tpj29sZyn9EMxwm81Rl
   iZfZce/8FoDHcelKlj+AXx4s70yYFEfGC9SvyjjXB+p9V/6H5Esd1k7QY
   wY8zUUiUJXevnkhaE0s3Tp+g8GYyRHgwgS+uC7XYqnez7JRV+nxKLfZg1
   A==;
X-CSE-ConnectionGUID: MPU8LW/LQKO8rElxhd3Yjg==
X-CSE-MsgGUID: LpLp53l6RYewDXiChzINUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52280387"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52280387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:45:45 -0700
X-CSE-ConnectionGUID: lFnGDmZ2R/SUwViR7uk+fA==
X-CSE-MsgGUID: 4bqX1mBiSbSrJoHOjZGxrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154992394"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jun 2025 03:45:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSCm4-000Kf0-33;
	Thu, 19 Jun 2025 10:45:40 +0000
Date: Thu, 19 Jun 2025 18:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS WITH WARNING
 642b70d526ab8daa8f256dfc1eb6bf27c3290cc6
Message-ID: <202506191848.n54qAZ4w-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 642b70d526ab8daa8f256dfc1eb6bf27c3290cc6  media: imx8mq-mipi-csi2: Add support for i.MX8QXP

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com

    drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-004-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-003-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-004-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-003-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-004-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-005-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-003-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-002-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-003-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-004-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-005-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-006-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-rhel-9.4-rust
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-randconfig-001-20250618
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-randconfig-002-20250618
    `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 1361m

configs tested: 246
configs skipped: 7

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250618    gcc-11.5.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250618    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      jornada720_defconfig    clang-21
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250618    gcc-15.1.0
arm                   randconfig-001-20250619    gcc-15.1.0
arm                   randconfig-002-20250618    gcc-10.5.0
arm                   randconfig-002-20250619    gcc-15.1.0
arm                   randconfig-003-20250618    clang-21
arm                   randconfig-003-20250619    gcc-15.1.0
arm                   randconfig-004-20250618    gcc-11.5.0
arm                   randconfig-004-20250619    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250618    clang-21
arm64                 randconfig-001-20250619    gcc-15.1.0
arm64                 randconfig-002-20250618    clang-21
arm64                 randconfig-002-20250619    gcc-15.1.0
arm64                 randconfig-003-20250618    gcc-14.3.0
arm64                 randconfig-003-20250619    gcc-15.1.0
arm64                 randconfig-004-20250618    clang-16
arm64                 randconfig-004-20250619    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250618    gcc-13.3.0
csky                  randconfig-001-20250619    gcc-8.5.0
csky                  randconfig-002-20250618    gcc-15.1.0
csky                  randconfig-002-20250619    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250618    clang-19
hexagon               randconfig-001-20250619    gcc-8.5.0
hexagon               randconfig-002-20250618    clang-16
hexagon               randconfig-002-20250619    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250618    clang-20
i386        buildonly-randconfig-001-20250619    clang-20
i386        buildonly-randconfig-002-20250618    gcc-12
i386        buildonly-randconfig-002-20250619    clang-20
i386        buildonly-randconfig-003-20250618    clang-20
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250618    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250618    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250618    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250619    gcc-12
i386                  randconfig-002-20250619    gcc-12
i386                  randconfig-003-20250619    gcc-12
i386                  randconfig-004-20250619    gcc-12
i386                  randconfig-005-20250619    gcc-12
i386                  randconfig-006-20250619    gcc-12
i386                  randconfig-007-20250619    gcc-12
i386                  randconfig-011-20250619    clang-20
i386                  randconfig-012-20250619    clang-20
i386                  randconfig-013-20250619    clang-20
i386                  randconfig-014-20250619    clang-20
i386                  randconfig-015-20250619    clang-20
i386                  randconfig-016-20250619    clang-20
i386                  randconfig-017-20250619    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250618    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-8.5.0
loongarch             randconfig-002-20250618    gcc-15.1.0
loongarch             randconfig-002-20250619    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-15.1.0
m68k                            mac_defconfig    clang-21
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-21
mips                           ip32_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250618    gcc-11.5.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250618    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250618    gcc-10.5.0
parisc                randconfig-001-20250619    gcc-8.5.0
parisc                randconfig-002-20250618    gcc-8.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-21
powerpc               randconfig-001-20250618    gcc-8.5.0
powerpc               randconfig-001-20250619    gcc-8.5.0
powerpc               randconfig-002-20250618    clang-19
powerpc               randconfig-002-20250619    gcc-8.5.0
powerpc               randconfig-003-20250618    clang-21
powerpc               randconfig-003-20250619    gcc-8.5.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250618    gcc-8.5.0
powerpc64             randconfig-001-20250619    gcc-8.5.0
powerpc64             randconfig-002-20250618    clang-21
powerpc64             randconfig-002-20250619    gcc-8.5.0
powerpc64             randconfig-003-20250619    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250618    clang-20
riscv                 randconfig-001-20250619    gcc-9.3.0
riscv                 randconfig-002-20250618    clang-21
riscv                 randconfig-002-20250619    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250618    gcc-8.5.0
s390                  randconfig-001-20250619    gcc-9.3.0
s390                  randconfig-002-20250618    gcc-15.1.0
s390                  randconfig-002-20250619    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250618    gcc-15.1.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-002-20250618    gcc-15.1.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                           se7705_defconfig    clang-21
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250618    gcc-8.5.0
sparc                 randconfig-001-20250619    gcc-9.3.0
sparc                 randconfig-002-20250618    gcc-13.3.0
sparc                 randconfig-002-20250619    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250618    gcc-13.3.0
sparc64               randconfig-001-20250619    gcc-9.3.0
sparc64               randconfig-002-20250618    gcc-8.5.0
sparc64               randconfig-002-20250619    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250618    clang-21
um                    randconfig-001-20250619    gcc-9.3.0
um                    randconfig-002-20250618    clang-21
um                    randconfig-002-20250619    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250618    clang-20
x86_64      buildonly-randconfig-001-20250619    gcc-12
x86_64      buildonly-randconfig-002-20250618    clang-20
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250618    gcc-12
x86_64      buildonly-randconfig-003-20250619    gcc-12
x86_64      buildonly-randconfig-004-20250618    clang-20
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250618    clang-20
x86_64      buildonly-randconfig-005-20250619    gcc-12
x86_64      buildonly-randconfig-006-20250618    gcc-12
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250619    gcc-11
x86_64                randconfig-002-20250619    gcc-11
x86_64                randconfig-003-20250619    gcc-11
x86_64                randconfig-004-20250619    gcc-11
x86_64                randconfig-005-20250619    gcc-11
x86_64                randconfig-006-20250619    gcc-11
x86_64                randconfig-007-20250619    gcc-11
x86_64                randconfig-008-20250619    gcc-11
x86_64                randconfig-071-20250619    clang-20
x86_64                randconfig-072-20250619    clang-20
x86_64                randconfig-073-20250619    clang-20
x86_64                randconfig-074-20250619    clang-20
x86_64                randconfig-075-20250619    clang-20
x86_64                randconfig-076-20250619    clang-20
x86_64                randconfig-077-20250619    clang-20
x86_64                randconfig-078-20250619    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250618    gcc-13.3.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-002-20250618    gcc-11.5.0
xtensa                randconfig-002-20250619    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

