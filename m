Return-Path: <linux-media+bounces-30797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A3A989D8
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBF616BF89
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6565026773A;
	Wed, 23 Apr 2025 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+yf9lWf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64AD21A445
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411655; cv=none; b=cqDSGY9oE9RZd2rR5Ew8VbLhJFb/C46h7sqjyY0e8JrYts7X/2sjhUdXwaHfCQ+UK7pYLpTqnR+5f4e0BS+gVgObJlro2H3XG3OV63nvvPPIejPVvOuDVrXkvQDu9+PBKkNxunbqeRm6ig8rHfEm/EA+gclPUrfzMVAslIXAYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411655; c=relaxed/simple;
	bh=DHgkJW9gUUCE6Z5diEj5E0gXTdAVfiaWb4xpV46Ma0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hCcif3x4yBqeIfmaKXGCA610SfudGtOL0mNykDvb1rWyvBoQHuM11RSQTGnhrfMjdPHHpVwOM3gQZE9QBcVKRI1Pi+nk2eVZQEEu19hMNy0DTiAfCA1eh92U1ENN8SgowApoBe8JF0Y/sV8hbMWek8t5ceHpXl30c942q4jHEy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+yf9lWf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411654; x=1776947654;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DHgkJW9gUUCE6Z5diEj5E0gXTdAVfiaWb4xpV46Ma0c=;
  b=i+yf9lWfkmq8v1cXpltoIeECbVuFOkb4Z7no9MLOFh5mU7kOYg1s9Glo
   9Wk1jqfxlEwEvoCu9z+/K/pxboU0GwTvve7dNzUziHIf2WTqE25/pcyGQ
   TBXRcE7bghu7Qwc7QhtJgUAxK1qro2/oIbjiILo0k6qXTRfTt06Pqt+qu
   45NDZNOkMlhoGigkHLpiFkobxNYkoVa5w8Q2ElCQ7nJj2RRno/qo/Ktdc
   Im1pQ3hDY0TmWlK69mDjp5xZ7cNcV5g1Kr5Lu4H7hk8ZuKa1suDUikMhL
   OuWVQae3d7n0+EcxnFv24JS789sFVL5Yuhjl8TFunc9FNn896YWZX0cdg
   A==;
X-CSE-ConnectionGUID: SDraSIN1SGy3xSJkeN4ZMQ==
X-CSE-MsgGUID: vXWlJ8UxTcywCN393cLScA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57991786"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57991786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:14 -0700
X-CSE-ConnectionGUID: TtC65HerTfW+oWw6ly/G7Q==
X-CSE-MsgGUID: +egqx6CvS5CZ94dePl0jtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133257302"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B20CB11F9FE;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YVO-24;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 00/11] CCS PLL fixes and improvements
Date: Wed, 23 Apr 2025 15:33:48 +0300
Message-Id: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
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

v2 is <20250417065354.311617-1-sakari.ailus@linux.intel.com>.

v1 is <20250226132319.2517656-1-sakari.ailus@linux.intel.com>.

since v2:

- Reword commit messages based on review comments.

- Move the even PLL multiplier flag next to other non-CCS PLL flags.

- Small code readability improvements.

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
  media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
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


