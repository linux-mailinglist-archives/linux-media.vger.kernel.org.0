Return-Path: <linux-media+bounces-33430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC0AC47F7
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1866E7ACD88
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2D91FC0ED;
	Tue, 27 May 2025 05:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCIXWQ3v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D111F7904;
	Tue, 27 May 2025 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325418; cv=none; b=DBQTiQds1jvV5FR871JV6pCNAj1bX6k1Xpg5se+AtnFeq+MkMPPmmkMQxgFs7c3+fmoxDY9mig2S/mNxd1YyWbFHN8pK9583dRCugg8HPNgjX4dfBSTCtajTtgSC/q4lpYJRi6JzG/XR7eZVgC5/oCMjUlh9SsDjqGrZux/JTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325418; c=relaxed/simple;
	bh=qprTcpVFkqtVO0xVfYUsvxVyOnADDH6pLUBzaIiSgWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nLOTACzDImUrKXlXd8PtGJJ91yK/Q4s4MKr4uAybImgUxJvkxIj9NXZ6fTKdu1TPvgV1C00bJc1QftTwdTG76e+a1+o3yCnVnBnSOaQDgPkWsekCzFpyGJ9A9ywXSdBcZsrg9pB0b/CV6CPLsidBtBGI8euVCJPPRTC2qWqNRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCIXWQ3v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748325418; x=1779861418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qprTcpVFkqtVO0xVfYUsvxVyOnADDH6pLUBzaIiSgWY=;
  b=jCIXWQ3vYJr6V4FWPJr+kSxEdbqhhR+N7cADEORW6DzWsKddMzoyCRn6
   HFJco8EAGPoIZFIrf8lJfQcVa5J64PIBG85+ItB5HUaDotO+cUFInhnPQ
   pI3e7MHf9m+yyGc3LWi9gige5ReStI1F6gFABHeplvlKJvxNFuSSYmF3u
   EpvIdMZzsbn2liLDzfAzw0USAmE9UErKTsVmhtzXXaEKSGblvqRY3UnL3
   /Ag0kmrxV2a/xJ6DnZ6rgmq8qI5fppU3QRqKBmveKsYN8FosQOZMmzRWi
   10TJmepnQTeDdN0g63Po8aGWNmeiOdQ9V4xvRcdbGXVxj64S4JJRJCh9s
   Q==;
X-CSE-ConnectionGUID: d3azfpulSD2OLtCsR+aoDA==
X-CSE-MsgGUID: DWFGvgwzRkeLfOkeFzYeOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67710379"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67710379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:55 -0700
X-CSE-ConnectionGUID: 3KqfdO2rSI6gi64OPYbBzw==
X-CSE-MsgGUID: yY6WERG6Rqqsh+iO5z6IrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147919443"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5821F1202B2;
	Tue, 27 May 2025 08:56:47 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJnIu-00275V-3B;
	Tue, 27 May 2025 08:56:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 1/3] Documentation: Bump media IOCTL reserved numbers
Date: Tue, 27 May 2025 08:56:46 +0300
Message-Id: <20250527055648.503884-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
References: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Media Controller uses IOCTL type '|' with numbers up to 0x81 while
numbers from 0x80 onwards are allocated for samples, creating a conflict
between allocations for MC and samples. Given that nothing appears to be
using numbers between 0x80 and 0x8f for other purposes than MC, even in
the samples allocation (checked with $ git grep "#define.*_IO.*'|'"), just
reassign the numbers up to 0x8f to linux/media.h and bump the samples
allocation by 0x10.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index bc91756bde73..6b3be3fb0b15 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -312,8 +312,8 @@ Code  Seq#    Include File                                           Comments
 'z'   40-7F                                                          CAN bus card conflict!
                                                                      <mailto:oe@port.de>
 'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
-'|'   00-7F  linux/media.h
-'|'   80-9F  samples/                                                Any sample and example drivers
+'|'   00-8F  linux/media.h
+'|'   90-AF  samples/                                                Any sample and example drivers
 0x80  00-1F  linux/fb.h
 0x81  00-1F  linux/vduse.h
 0x89  00-06  arch/x86/include/asm/sockios.h
-- 
2.39.5


