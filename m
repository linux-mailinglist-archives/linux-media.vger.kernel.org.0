Return-Path: <linux-media+bounces-38827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00697B19F4D
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718C47A6E51
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEF12550D8;
	Mon,  4 Aug 2025 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOdc52jX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88D2505BA
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301796; cv=none; b=DTdBtXK/0DazMJUfJ+Udwb0Z1X9HQ1JB7RCi7OFSaGnQ0rA2bGxHfR+wgLAUoDdbcN6TCfekOp+ElX4mUNJ5x4PSoXm7guzOxcUUzKMQtp2hjz7lZtMg9q6gd7/NT3w/K91pIOF2f6Gbz/YylT+Eu+vcAdvNWf4LDxzgR/AOMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301796; c=relaxed/simple;
	bh=QRulJIRMXCQZE5ltcjbJQTno9Myh7+/wxcYH5WCFNfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AWj6cI2ab05in7ijCzaI8DXhtQgpHL8GqlENWiC2jYg+o9/6vOm+hLWeE6SE5+hbmdCN1hfTSnRNs6gMfK6fTA8mPM3jG3HRAymOAdlfq3qHYTUUGbCAJST2Sjlym7ODv8QngKbyhUeKw0+jtrj4iQ4mB+9sAGvyZrLeuNhZaCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOdc52jX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754301795; x=1785837795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QRulJIRMXCQZE5ltcjbJQTno9Myh7+/wxcYH5WCFNfo=;
  b=lOdc52jXmsB2VkQmnr5U4f8aMzragSrEkKzjddu0rfPB59LYTQh/elnI
   qHMw49znE+Pnjg2cgPwLUZPieRNBPqCJopmKF4LOKQrqjbdk704be3EEb
   A/SSC+X7uy/bJbi5FAriMhwJRsxL3TmUrkB9dLQJmumlA6U3aHYKroBiv
   buUWs5fSjHp7wTFOWkRei1ZXDVdAyafexAvTTsv+4neBaMVq69x+s5Rzu
   mRVpPrV44EfNBYMTPykPcL7Rutl2bgXmjxU/FVDcTWgNaK2D6E5LNnY4M
   1Sy/x8lggXyJoVC1EupkQbCkSlOSURWv1zpjtC6lzVHcKPX4/r31eaYZf
   A==;
X-CSE-ConnectionGUID: Sdut7C2ORPufQ6RvHpmiWQ==
X-CSE-MsgGUID: j2PUbHJnRoSOV+9LqknX6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56448977"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56448977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:13 -0700
X-CSE-ConnectionGUID: d+gjMxnBRvGQHOx8RsqX2A==
X-CSE-MsgGUID: vPdr+QF9QRuZoeHpM6Zkzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194950826"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:12 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8745411FBEE;
	Mon,  4 Aug 2025 13:03:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uis29-001TPR-1j;
	Mon, 04 Aug 2025 13:03:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH 1/2] contrib/test/test-media: Fix module unloading in error handling
Date: Mon,  4 Aug 2025 13:03:08 +0300
Message-Id: <20250804100309.351362-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804100309.351362-1-sakari.ailus@linux.intel.com>
References: <20250804100309.351362-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modules are unloaded in case of errors but alas, in all cases the module
being unloaded is vivid, not the one that was just loaded. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 contrib/test/test-media | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 68fe48f947f3..dda7ff44075b 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -417,7 +417,7 @@ if [ $vim2m -eq 1 ]; then
 		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
 		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		rmmod vim2m
 		exit 0
 	fi
 fi
@@ -453,7 +453,7 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
 		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		rmmod vim2m
 		exit 0
 	fi
 
@@ -525,7 +525,7 @@ if [ $vimc -eq 1 ]; then
 		echo "FAIL: the vimc module failed to load" | tee -a $tmp
 		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		rmmod vimc
 		exit 0
 	fi
 
@@ -627,7 +627,7 @@ if [ $vicodec -eq 1 ]; then
 		echo "FAIL: the vicodec module failed to load" | tee -a $tmp
 		echo "Grand Total for vicodec: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		rmmod vicodec
 		exit 0
 	fi
 
@@ -812,7 +812,7 @@ if [ $visl -eq 1 ]; then
 		echo "FAIL: the visl module failed to load" | tee -a $tmp
 		echo "Grand Total for visl: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		rmmod visl
 		exit 0
 	fi
 fi
-- 
2.39.5


