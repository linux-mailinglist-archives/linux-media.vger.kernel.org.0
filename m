Return-Path: <linux-media+bounces-27040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 208A4A460BC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195BD17A8A6
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CB822371F;
	Wed, 26 Feb 2025 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn5Bw7Y7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C49A22259B
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576217; cv=none; b=YG988iKe3HSDX5Mn/BRlNrwyrG1Fs/t8hDsnTirrD0aWprKGJFi7S9dgiNGUwIkb+GVf+EfiGI9pHgxw+vjonwMm7jNBn7exhMUk+eVN9Ij/8WYxg2Qs+UmUrhB2LIlK0EWcKtkW8x6qhJ+G5/5obl4NMiSE3nyBhaJ3x808SBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576217; c=relaxed/simple;
	bh=SjOeZbPMNrzAOCzJXXooY/vPFdKDoc2apzWel9TWgwo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g7dmPPPnxVP25d4bqKV4mtm69n9h9zGoeiCh2BBIpS/0rTRX+e2jOlwGLoVu9VH/tovU+zRwUJIp3TyLtlEWzfLdj/nMB8BJz3ka821KQf19hmmHb3pCNOigEYjV0jcp0FHGnKEK8GioNDYhRzCA97Y4dKEQRl89Nxqb2WHRWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn5Bw7Y7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576216; x=1772112216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SjOeZbPMNrzAOCzJXXooY/vPFdKDoc2apzWel9TWgwo=;
  b=Cn5Bw7Y7nM3H94hk4r9MofX0u+nul3beTha1QvmaGPFfIsOtA15RTuTu
   ahzUxb56jtBki6Qa8LeGux0AGLvQtV7KxpQN/voHRHuXqKJOEbdV6+TMB
   hrTaS5DfjkYT1GgvbTTU6qm4gLWLrjIcwqcXmuncXiQE74VL+GYltp6mX
   BXBv6mobFAPbxPUw/Qzc2zF5M1xi6nEbQoq+zOUhR4SI+S+SfrOkQIqcM
   jSZFwC0aH+xEywv0YPrw00E436T7aQdUGDHzEkNj42o8VYdgqSK8aX6Fe
   fmHKgH2hs/Qc4GPwc5xfBYc7S2mOF9F/6iJLp7L5qLt08csXOnH8AEzrN
   w==;
X-CSE-ConnectionGUID: DgPzJk9aS2e5P10yr32vkw==
X-CSE-MsgGUID: AJV9N69IQsqoHLCdzjlRnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45331990"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45331990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
X-CSE-ConnectionGUID: H0a/WBhrQOOUswbjagmeqA==
X-CSE-MsgGUID: npH3/vfMRdKbqKIRgYBd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117622419"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E25E411F944;
	Wed, 26 Feb 2025 15:23:29 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNp-00AYxm-2s;
	Wed, 26 Feb 2025 15:23:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 0/7] CCS PLL fixes and improvements
Date: Wed, 26 Feb 2025 15:23:12 +0200
Message-Id: <20250226132319.2517656-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Here are a few fixes and improvements to the CCS PLL calculator.

Sakari Ailus (7):
  media: ccs-pll: Start OP pre-PLL multiplier search from correct value
  media: ccs-pll: Start VT pre-PLL multiplier search from correct value
  media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
  media: ccs-pll: Correctly the upper limit of maximum
    op_pre_pll_clk_div
  media: ccs-pll: Print a debug message on too high VT PLL OP clock
  media: ccs-pll: Add a flag for even PLL multipliers
  media: ccs-pll: Better validate VT PLL branch

 drivers/media/i2c/ccs-pll.c | 43 +++++++++++++++++++++++++++++--------
 drivers/media/i2c/ccs-pll.h |  1 +
 2 files changed, 35 insertions(+), 9 deletions(-)

-- 
2.39.5


