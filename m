Return-Path: <linux-media+bounces-24840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A54A1395A
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465E53A4EA3
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 11:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12C71DE2B3;
	Thu, 16 Jan 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4aOoae4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE551DE3A5
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028039; cv=none; b=QXWL71+DBHPJtRaPyh/Kfj0k6eHadvoDGgVxaBh/qjya/MXQVyyqCDC3w8nZMfTcGPmjgi3MJSSwju7mx+PPDoj+d8fowb2h4GZmQdQhYk6PufOVVWiBKB1bcKLjAhQLt8K/WztZqGhcBzEwvOFKi3N9wrPRcBLLY4Fnr5lmwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028039; c=relaxed/simple;
	bh=KUaRZoGSBn64BKd33Hm/qARCzpPjyO0qH4YMS2UlGmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=llVKzpIt2b3rIw9zZh/HfXnCjoksGO/HBAC0KeUob41rFa+iFaCG+JYFnS7VsVz6iTTb8suzBqWRnfyMM2R840cGI1ozwy0nSuj6H4SBht2jQionCf30CNhnKIAU4A9ugrGo6Moik4Ka4NrfwerBubv3PW/xS0fQSPaHMQUKSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4aOoae4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737028037; x=1768564037;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KUaRZoGSBn64BKd33Hm/qARCzpPjyO0qH4YMS2UlGmE=;
  b=T4aOoae4uR0xe8Tj5hWWwXzsOkqb+74+WmLSQRAE/7smdImt5sfmyXQj
   F5xO3mhmAupAvpNl7T1U7dbQKBGNu+NvI/yPaBwVEkXRmw2bH9lfJrZVb
   9CBs0OehNydG/q0bZsDQy6S1d4Zlz3PCHlzrBCMNhSbs7tTE2AQlF1yM5
   Dif73MbHDGepGN4BkT1tJAOWqWRBDTBTRSAU/u0eiwNhJA0cNBqudYqvm
   l8ZNKCo4xdziCRjgSZi8K2CDNyMIO/pa+eRRWZXSKvP2YFvcFwCZisBr6
   yzRpW3X5AZ47RumEViPTZiSKw7c3oY6LzNMzES+zBncAcaGjLnSTGyZ4g
   A==;
X-CSE-ConnectionGUID: +9CWcbAVSmK9aVCHzzKOxA==
X-CSE-MsgGUID: DRMGbBSSTiW21j2fWPcKfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36686965"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36686965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:14 -0800
X-CSE-ConnectionGUID: 4Jzi2QDAR/q/L4s0u9OuVg==
X-CSE-MsgGUID: J6ozPDi6QZWIDLDyaa64Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="136313636"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:14 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E75E11F944;
	Thu, 16 Jan 2025 13:47:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tYOL8-000HYU-09;
	Thu, 16 Jan 2025 13:47:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH 0/2] Fix PM on imx214 error paths
Date: Thu, 16 Jan 2025 13:46:58 +0200
Message-Id: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi André,

I'm posting this separately as it seems to be backportable, your set needs
to go on the top. I've pushed that to my "devel" branch in my
git.linuxtv.org tree <URL:https://git.linuxtv.org/sailus/media_tree.git/>,
please let me know if you see problems.

Sakari Ailus (2):
  Revert "media: imx214: Fix the error handling in imx214_probe()"
  media: i2c: imx214: Rectify probe error handling related to runtime PM

 drivers/media/i2c/imx214.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.39.5


