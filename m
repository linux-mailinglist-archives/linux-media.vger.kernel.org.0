Return-Path: <linux-media+bounces-30396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0070A91459
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DD6F5A2DF5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E382153E8;
	Thu, 17 Apr 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxWfxEUy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C6621518B
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872850; cv=none; b=jQe+lscbzyxy+AFRJVOACJY21s7tic+xDXWDw6HSKOK0aDz5EuRmNqAsPNdC7vWXflHdMy2ea4cFddwShlOt4zR5EE3aJCqd+mcM46eHrj5K1SP6YQEB1EIDqB1KOnCFgdkR3MxB/bAdEqb34Z4ys35drbv9JPldg+O5FhP11K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872850; c=relaxed/simple;
	bh=pYXVbty7oOQQ+6uASVhzYMoQAbuDAXYUTkID2Ykgo7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I1KnSV26pj4hnKfkQvy1dlxmKecZAIR0xHnJPnE5zK/mcMbklWmTGr9JPlf42VqUNw2J20GxWx7TW4YUp9BsowaSbTcUlEG/uDAdeaKtVwd0pbOMVAjNd46xehDQJLFJLJ71km6cm8aM8OwCqDq9qTvgOlXE7M9BK35fvoRJFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxWfxEUy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872849; x=1776408849;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pYXVbty7oOQQ+6uASVhzYMoQAbuDAXYUTkID2Ykgo7M=;
  b=DxWfxEUy6egU3IhtLbr5HBXx6hatKqoEgezTBMmPiI8bc2yWxHAP722h
   /1XZ/YpovGUHKQtdqMesQTtKXM1uBhDyFAzd3AURRWM7QIJid4wX5ULXA
   /Lx0ShgI4eWSd06HNTkZSFIH7UbSqBK33EbCcnE05ZMnJR2todDR97Z6y
   UAN2bcObjtkfUVTeUVHu2zG92Ked0WbpxJXp7Nkivz8CTgDABXj11DxMD
   K7ubU/egkS4sWfjvJg29TsMnuncU2x439XCg3HZpAzTdxgxxZnoSXQgaF
   210BfI9n4BsjsGuNc4FYn0ftJH4rlHT5marAz41Kz6vzQdFi5qodo4QKx
   Q==;
X-CSE-ConnectionGUID: p7uXEZm9TnOp9yW8fE2mPA==
X-CSE-MsgGUID: zlIiz9IXS7y3PItEs/E72g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831259"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
X-CSE-ConnectionGUID: lrFcMkEoTryos9GV2a3PMQ==
X-CSE-MsgGUID: JNII/jixQSyLDPWnjOe4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262172"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:08 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 00ADC11F9C2;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8O-001J4d-36;
	Thu, 17 Apr 2025 09:54:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 00/11] CCS PLL fixes and improvements
Date: Thu, 17 Apr 2025 09:53:43 +0300
Message-Id: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Here are a few fixes and improvements to the CCS PLL calculator.

v1 is <20250226132319.2517656-1-sakari.ailus@linux.intel.com>.

since v1:

- Added patches for the following:

	- Drop the now-unused LINK_DECOUPLED flag.

	- Print missing flags.

	- Print PLL calculator flags before running the calculator
	  (earlier version posted separately already).

	- Document the CCS PLL flags tersely but still in a way that is
	  useful.

- Rebased other patches to clean up things first.

Sakari Ailus (11):
  media: ccs-pll: Start OP pre-PLL multiplier search from correct value
  media: ccs-pll: Start VT pre-PLL multiplier search from correct value
  media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
  media: ccs-pll: Correctly the upper limit of maximum
    op_pre_pll_clk_div
  media: ccs-pll: Print a debug message on too high VT PLL OP clock
  media: ccs-pll: Drop LINK_DECOUPLED flag
  media: ccs-pll: Print missing PLL flags
  media: ccs-pll: Add a flag for even PLL multipliers
  media: ccs-pll: Better validate VT PLL branch
  media: ccs-pll: Print PLL calculator flags in the beginning
  media: ccs-pll: Document the CCS PLL flags

 drivers/media/i2c/ccs-pll.c       | 49 +++++++++++++++++++++++++------
 drivers/media/i2c/ccs-pll.h       | 29 +++++++++++++++---
 drivers/media/i2c/ccs/ccs-core.c  |  1 -
 drivers/media/i2c/ccs/ccs-quirk.c |  3 +-
 4 files changed, 66 insertions(+), 16 deletions(-)

-- 
2.39.5


