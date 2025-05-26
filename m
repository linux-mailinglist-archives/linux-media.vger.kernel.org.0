Return-Path: <linux-media+bounces-33370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15332AC3E6F
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1FC818984F9
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456901FDA9B;
	Mon, 26 May 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrvX8wJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9611F9413;
	Mon, 26 May 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258263; cv=none; b=Q1bJH+bLALlZmoLPmlA/88hzphNR/cWtU9Ht6mR/bhDax2v6xrDFLs+h+IbGqJ79fIaaUWc7L7wCPl4D1NUTPyawSxLNfwvMZbgk9jdH62l8PJr5KreVm4QwbflMAl40ZXWr3I/Vskgw65UpTbBBV+KCqNuFyaw7Gf5X4hnmpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258263; c=relaxed/simple;
	bh=SFHPQkB/Mt4aGlD1gas9fY5CYz3PxckINfIH0EnFEI0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1xNukO/NU6Oy5UAMihgTXonCAV8k+5qeVb0TFC2muCON2wt0TihjiLP9OecoaAQykzZQHJOWCyNj6swZIT4pZyXgLF5s9PLp74lMreZcLUeBzDDxyoGADtlSYLPgEYF2KMwGMfBHqntBxHk/g9IJJvRXwL4Nh/E9wh0VOfis2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrvX8wJ9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748258262; x=1779794262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SFHPQkB/Mt4aGlD1gas9fY5CYz3PxckINfIH0EnFEI0=;
  b=VrvX8wJ9/AyFiVrKEAyxDgKTPNarZc/lqMTDP7HsfXqZ86ofvWGrTcGP
   mNKqTnOok1b+uWMWv+QERvcofISBANniht9hGjQHqWwQA9HaAJCTmldPz
   BQJAwJqKdX+oyQ7PS4K/igajLVa3YvoQ8cw2je1xk3U4OaCeK67KDtv0n
   TOJbfH8ILK1wb6u9Ig428fIUx64QhltSt7VQw58THNVjbKL6NC+y79B7Q
   X92umFvreeQE/CQ1GsOcrvIBcSw6VmYVOMtazrQnwlZTY3ilMOcyDfFHI
   zQ65p8nfV25L7gurQg/Cj1oC7ZubOMHTrWMjdrPBXW7Ski+1TxVyHIHRs
   g==;
X-CSE-ConnectionGUID: FR2qtRvQRsqPPrtmX7BTnA==
X-CSE-MsgGUID: S9eMi6ljRd2EYKKQnNGzJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49935355"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="49935355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:39 -0700
X-CSE-ConnectionGUID: V8Ku9zXnSOq9uaCER7WLfA==
X-CSE-MsgGUID: qvMUM5vPSKOEGkJYjRLqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142273287"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C293511F7E3;
	Mon, 26 May 2025 14:17:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJVpk-0022kq-2J;
	Mon, 26 May 2025 14:17:32 +0300
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
Subject: [PATCH 1/2] Documentation: Bump media IOCTL reserved numbers
Date: Mon, 26 May 2025 14:17:31 +0300
Message-Id: <20250526111732.487229-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
References: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Media Controller uses IOCTL numbers up to 0x81. Given that nothing
appears to be using them for other purposes, even in the samples
allocation (checked with $ git grep "#define.*_IO.*'|'"), just reassign
the numbers up to 0x8f to linux/media.h and bump the samples allocation by
0x10.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


