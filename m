Return-Path: <linux-media+bounces-54110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIH2F23OpWm1GwAAu9opvQ
	(envelope-from <linux-media+bounces-54110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:52:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F00F1DE16D
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63E533004DBD
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 17:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FD8427A03;
	Mon,  2 Mar 2026 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2nVBh+c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF2410D3B;
	Mon,  2 Mar 2026 17:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473943; cv=none; b=dH/CgctdyGMUsv98UJ7wg482Z17pYmNFaD5FGbKgCgr4L2Be7uRpLbITmqPrfG3+HM2llJLDc8gjEndiAY/9RRZi6e89rfgHOSb4q+VTwN0d61rK2UFpobOItGz039i/e5LRtZ0OPM0h5dTM2ZVSsFFsULL8tfCHIubHGN6K4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473943; c=relaxed/simple;
	bh=ocP+C9HfpPwTXV481DvZ35sXEaKaSA1rbLYL2fkLDFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgOcsJDvJmfCAq6fG4k68L+H16LO+vVyl5vYt1Ick3pForGa6KdUqcu/3+FR9Perpf/XaS1hrqO1fMfqXIvz/FnCqeIHG9IXgNhrOIchoZAWevkdjTC44uHi5+4zBNU+fbS1GZfbMXpKkuQYMdd6FjYOFF0lBvUBbne17trnnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2nVBh+c; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772473941; x=1804009941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocP+C9HfpPwTXV481DvZ35sXEaKaSA1rbLYL2fkLDFc=;
  b=d2nVBh+cEkdGnfbVwOGnXADDZKEiW3HND/E7cbPisqeQuF5QSgZHMDZ1
   rUJNQOBeVPbBA+ByUuGaBhu0YrB5ywONDEuPnvuR62A8wf8rjPpySY74Z
   GBfHQn5r5Ht7LTukKZobUzaC894YgjbgErU1nBvWxWiH9yBAK10byPyBd
   kUdeW80VrduQYjthoxyg3pqfrn75wrQqTIBkKUG5J4kljMdJO5zSH0Ww3
   mYvsqv+dEiYEMdBHp1Ltme0G4Gjd2nV/Pqgm9kl8sZpQRtEpUF9p94OA9
   f1i249gzXIch3WWaQi9SvB4w4Nxg2rU2R0JeLB6/laLndsczJK8wt3r/9
   A==;
X-CSE-ConnectionGUID: kmFK4bVbR+urSwrrXRjzgw==
X-CSE-MsgGUID: PNruRpGVTIuulABUl3OJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77356708"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="77356708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 09:52:21 -0800
X-CSE-ConnectionGUID: nNRUGTjeQk6S+fA4p8+jrQ==
X-CSE-MsgGUID: B8mwo8rcSJGcPKXG1axUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="248238372"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 09:52:17 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com
Cc: sakari.ailus@iki.fi,
	sakari.ailus@intel.com,
	sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v3 0/2] Add TPS68470 power supply support for ov13b10 sensor
Date: Mon,  2 Mar 2026 23:16:42 +0530
Message-ID: <20260302174644.1258718-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130092431.2335363-2-arun.t@intel.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F00F1DE16D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-54110-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:mid]
X-Rspamd-Action: no action


This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.

The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

Changes in v3:
	- Fixed check patch errors as updated by sakari
	- Enabled VCM regulator for ov13b10 sensor to enable autofocus to work

Suggested by Sakari:
	- Add include header file in alphabetical order 
	- Remove extra space
        - Asked to check vcm instance

Changes in v2:
	- Added power supply names array for the three required regulators
	- Implement regulator handling with devm_regulator_bulk_get()
	- Add regulator_bulk_enable() and regulator_bulk_disable() for sensor power on/off sequence

Suggested by Hans:
        - Add multiple regulators you should use the bulk regulator API
        - Use use "reset" instead of "s_resetn" for parse gpio name.
        - Add diffent regulator power supplies  in single array


Arun T (2):
  platform/x86: int3472: Add TPS68470 board data for Intel nvl
  media: i2c: ov13b10: support tps68470 regulator and gpio

 drivers/media/i2c/ov13b10.c                   |  48 +++---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 2 files changed, 177 insertions(+), 21 deletions(-)

-- 
2.43.0


