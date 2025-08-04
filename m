Return-Path: <linux-media+bounces-38826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EFB19F44
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41CA189CCCD
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5002528F3;
	Mon,  4 Aug 2025 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOAsU4tc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE2B24729D
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301795; cv=none; b=QhgtRcbgOySckxSw+Qn5ADOvhv1rjjVYi1uPUdD6IEOk75AX4WpJDwyn3cejzvrXCP1O0V5g0M4ZFYfVbcvjdA7wVm9mCkfoYZCg7x26blyqG8caY3s6NDcQKt00mXpr0p+TKbbKSBkqudyLmQQOjPYxEAMJJG90wC36jQ47BmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301795; c=relaxed/simple;
	bh=ELY4G0D7IOs0L8878EMwaykiXgus4tIC+LiL4DRoYho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dtgqvFdPbKa0Jcj2ckyDae9tkNb5AXv+1vmEA3ZI+cGGwTBbfBMdEmxtIfNHcyT5f3nn/RaBzsnlwD4IhoVRaz+hceN0LV4V2vuYkHTaqSjI5n4796Xq20Mex4JKCL/ZrGaxLsCpjlPuO5p82ZCm4IsTX6pKIeo4B00sK7bUePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOAsU4tc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754301793; x=1785837793;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ELY4G0D7IOs0L8878EMwaykiXgus4tIC+LiL4DRoYho=;
  b=WOAsU4tcXRL8I2UjGkpNbAvgMlZDFigRtsU+lClLWjSRoKSgLCDgiWYZ
   MMqrGHHpoGN1t5ORzUfybbbW6QU3RMeUYwWkyjfXtIv04tYxQ3OIQ09Zj
   DeKtxJBAxNHi+qtFh6P5hHC96mOve9R6HzCzacREXh9fg2XHfOxHg/rjt
   KBolLozxPgj42o0iwBArebG4yTfKdyyTFqk82T4AAIX+OGT/iVDZu76i/
   LRZCJ0YaF0KKfJ2dAaWGHpp/RFMc0QAoW+TGH2epdcj8an+Kkmn4hRGYp
   cf9zBPUYc7d/O0nWcvZ7kMLiqY+He4O5/HZjKStOArTMU++/n8RehKLyo
   Q==;
X-CSE-ConnectionGUID: UZOzqRtyQKWdsu1nI61bOw==
X-CSE-MsgGUID: 7FZcRQecRDukOrjjY7R+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56448974"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56448974"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:13 -0700
X-CSE-ConnectionGUID: +wgoa7jwQAG2c2yDytNzNA==
X-CSE-MsgGUID: KKSHqKtJT2S+d17O/A59RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194950825"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:12 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 84D6911FBD0;
	Mon,  4 Aug 2025 13:03:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uis29-001TPO-1c;
	Mon, 04 Aug 2025 13:03:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH 0/2] Fix module unloading, vimc device naming
Date: Mon,  4 Aug 2025 13:03:07 +0300
Message-Id: <20250804100309.351362-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This set fixes test driver module unloading and vimc device naming (see
<20231129141545.87461-3-sakari.ailus@linux.intel.com> on LMML).

Sakari Ailus (2):
  contrib/test/test-media: Fix module unloading in error handling
  contrib/test/test-media: Probe the vimc device

 contrib/test/test-media | 61 ++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

-- 
2.39.5


