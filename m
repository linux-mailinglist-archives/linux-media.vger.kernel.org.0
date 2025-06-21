Return-Path: <linux-media+bounces-35513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4720AE276F
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 06:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C2317EC7E
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 04:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E2F1865FA;
	Sat, 21 Jun 2025 04:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFEGpwHy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C45258
	for <linux-media@vger.kernel.org>; Sat, 21 Jun 2025 04:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750481651; cv=none; b=KDyi3iT87vgkWeec1OWx9JL51xpUNI98cF5tGq4vvRr6OCq5ik7Q3fYNkU9N0xRuOPQpyW3NF6ZAqj/w1GV1wko/tuoKSsjYtai0bnQoXSTrsJxw4+9earUSp2rf0Rtlx8DtRzWj15l1swS1LPzJHyHLv89/MAlcz5TY0DEYMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750481651; c=relaxed/simple;
	bh=sQ/rVsli/E5ke/ZY6e4XfRLU4PKOiP+5nbJ0znktvTc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cTkH4di1BmmrMZ5b/RlspFQez08h4PEYsEd7rSgcRpy7Tsi/OrfZBd1b9l66NzbnJgJLOKDp6FczpRLty0vo93j/iIV3sffNZ0DClLmdU7wpb1mtHBRFjST9Rg2yv3taanLCjxlcTu1CzWHXZl8/Hszh7MUJhbWUFEvIx8tCthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFEGpwHy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750481649; x=1782017649;
  h=date:from:to:cc:subject:message-id;
  bh=sQ/rVsli/E5ke/ZY6e4XfRLU4PKOiP+5nbJ0znktvTc=;
  b=EFEGpwHyhhXihDF7tkUK5Rk7aLslrgPfldijNL6U91Etq4QBDqPPvkUg
   //GsSNRVcdPGqc9vw//85kGH5QW6z+1UNEziC0H2aVGMRF7hq8OU4xNeQ
   fkw6QYmb9bTNTUnstTGpAtXqtP3CtOqoTA46ezcseAGofsutnsAmkrATl
   7CpOZ/2P7ZI84SNKhXx+pP3uabDdHY8VD/DcRPVCqQqyT5Ug4lYUIlQzF
   oeRaiUeQel2J2JkueOMk0hsR3hClIQCNc+LhK9vS23fD6fGyfhpXkyphz
   gboH9Z+PvPLJeV2U1rGx2/lbulQBDiMTQhsa9+Ty2FwNXNh78fwnyqn2M
   g==;
X-CSE-ConnectionGUID: i9pWZ9MQRFex7P8OPEMoYw==
X-CSE-MsgGUID: /cH8TDb/S4qRJ7wNKTGjMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52891929"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="52891929"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 21:54:09 -0700
X-CSE-ConnectionGUID: BVUoFftzRpmSwFmPgzUvjg==
X-CSE-MsgGUID: YI0EqpwtRRC6/U+9tXedFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="151375302"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2025 21:54:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSqEv-000MNG-39;
	Sat, 21 Jun 2025 04:54:05 +0000
Date: Sat, 21 Jun 2025 12:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS WITH WARNING
 803b9eabc649c778986449eb0596e5ffeb7a8aed
Message-ID: <202506211219.ifE3Nr6r-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 803b9eabc649c778986449eb0596e5ffeb7a8aed  media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com

    drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-004-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-004-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-004-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-005-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-randconfig-141-20250621
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc64-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc64-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-002-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-003-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-004-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-005-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-006-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-defconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-randconfig-161-20250621
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- xtensa-randconfig-001-20250620
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-randconfig-002-20250620
    `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 957m

configs tested: 140
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250620    gcc-8.5.0
arc                   randconfig-002-20250620    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250620    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250620    gcc-9.5.0
arm64                 randconfig-002-20250620    gcc-8.5.0
arm64                 randconfig-003-20250620    gcc-11.5.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250620    gcc-13.3.0
csky                  randconfig-002-20250620    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250620    clang-21
hexagon               randconfig-002-20250620    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250620    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250620    gcc-14.3.0
loongarch             randconfig-002-20250620    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250620    gcc-8.5.0
nios2                 randconfig-002-20250620    gcc-10.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250620    gcc-10.5.0
parisc                randconfig-002-20250620    gcc-12.4.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250620    clang-21
powerpc               randconfig-002-20250620    gcc-11.5.0
powerpc               randconfig-003-20250620    clang-21
powerpc64             randconfig-001-20250620    gcc-14.3.0
powerpc64             randconfig-002-20250620    clang-21
powerpc64             randconfig-003-20250620    clang-19
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20250620    gcc-14.3.0
riscv                 randconfig-002-20250620    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250620    gcc-9.3.0
s390                  randconfig-002-20250620    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250620    gcc-15.1.0
sh                    randconfig-002-20250620    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250620    gcc-8.5.0
sparc                 randconfig-002-20250620    gcc-10.3.0
sparc64               randconfig-001-20250620    gcc-13.3.0
sparc64               randconfig-002-20250620    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250620    clang-21
um                    randconfig-002-20250620    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250620    gcc-12
x86_64      buildonly-randconfig-001-20250621    gcc-12
x86_64      buildonly-randconfig-002-20250620    gcc-12
x86_64      buildonly-randconfig-002-20250621    gcc-12
x86_64      buildonly-randconfig-003-20250620    clang-20
x86_64      buildonly-randconfig-003-20250621    gcc-12
x86_64      buildonly-randconfig-004-20250620    gcc-12
x86_64      buildonly-randconfig-004-20250621    gcc-12
x86_64      buildonly-randconfig-005-20250620    gcc-12
x86_64      buildonly-randconfig-005-20250621    gcc-12
x86_64      buildonly-randconfig-006-20250620    clang-20
x86_64      buildonly-randconfig-006-20250621    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250621    gcc-12
x86_64                randconfig-072-20250621    gcc-12
x86_64                randconfig-073-20250621    gcc-12
x86_64                randconfig-074-20250621    gcc-12
x86_64                randconfig-075-20250621    gcc-12
x86_64                randconfig-076-20250621    gcc-12
x86_64                randconfig-077-20250621    gcc-12
x86_64                randconfig-078-20250621    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250620    gcc-8.5.0
xtensa                randconfig-002-20250620    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

