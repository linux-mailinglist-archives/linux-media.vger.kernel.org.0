Return-Path: <linux-media+bounces-38868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B615B1A6B3
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 17:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADAC5181955
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1772737E6;
	Mon,  4 Aug 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kx/ITh0I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F5264A8E
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322728; cv=none; b=Xg4cULWnEUB0xebu0lZ8Z5Huv4egFdavjtgIfs96+Q17btedNCTgG19anWz7txbU81zoU8pou4Qz6BTeHX/ZrVhq3D1/4GhiJv44HvNOi4AB2lwt0QV1U7UV4p9L5wpqPM7TcdF+qtDPEGr0cFRSgcDEug4YEahwEnpymbTpLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322728; c=relaxed/simple;
	bh=RWHbFFxzLatyCHlWMgS7Lg/h4tfl812r8HSwwuVgdgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPcKQCCn5pDd+TQsufVWSQ6aIoG0SyY9mvAbPFpFjJL3nJ1dIDwuyHAWIFgIT85bem37qMDxBtad4mB8nR2E1PnP1LLhDQ2IPkMGfGdXBu2dYHbIx6JHbM3Az9apM6ZfSCJNe1uaNzoI823AZ8/S8WHTINJ/7vbVp1Arjngplo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kx/ITh0I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322728; x=1785858728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RWHbFFxzLatyCHlWMgS7Lg/h4tfl812r8HSwwuVgdgk=;
  b=kx/ITh0Iuuh2UBGqlU40nlQXrdVy3mOIk7Wo9F0fXzxxGQdJR2Q18YB/
   wpPWIFyZRmXcOjYp5Ypb6ag7rXpYtwO+xQXH13wVo6CzDp1wBAFJZuWnz
   q2NOXecv4D+JuVHmGn0FAn6PzXA3c8WtGfoCSDFWggdfxuSGG+ldxVC5s
   LYZhU/R53P4s9nnJoETcfuTY91GQ/wid1H9DarzwTvQehdrAil0JRZLZI
   6rqx/DMySOybvSGW+Geru+JO0oJFy7LQcuo+mEjBfi1843cv9Fp6Y9ztE
   mbyTcBKixoRI3JC0DiOiFEwoUQS4jr9+t7KNOZ6krXaG0ZcXOKzPdxY/T
   A==;
X-CSE-ConnectionGUID: VevAol2DTjKpWEvJkgfDTw==
X-CSE-MsgGUID: 4hoaTFfwRY+Epg1rq0tgmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56484267"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56484267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:05 -0700
X-CSE-ConnectionGUID: UHnDombKSQSvfBNzQm2EPg==
X-CSE-MsgGUID: 8xnVYjUrQn2+3UYh14ORrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169500277"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E803C11FBEE;
	Mon,  4 Aug 2025 18:52:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uixTk-001ca0-2z;
	Mon, 04 Aug 2025 18:52:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH v2 2/2] contrib/test/test-media: Probe the vimc device
Date: Mon,  4 Aug 2025 18:52:00 +0300
Message-Id: <20250804155200.386609-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804155200.386609-1-sakari.ailus@linux.intel.com>
References: <20250804155200.386609-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vimc platform device is called platform:vimc.0 after kernel patch
"media: vimc: Don't explicitly set bus_info". Adapt to possible different
naming of the vimc device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 contrib/test/test-media | 51 +++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 87f5a0544b84..0bb4844a58ad 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -535,7 +535,18 @@ fi
 if [ $vimc -eq 1 ]; then
 	run_modprobe -r vimc
 
-	if ! $v4l2_ctl -z platform:vimc -d "Sensor A" ; then
+	for i in vimc vimc.0; do
+		if media-ctl -d platform:$i > /dev/null; then
+			vimc_device=platform:$i
+		fi
+	done
+	if [ "$vimc_device" -eq "" ]; then
+		echo "FAIL: can't find vimc device" | tee -a $tmp
+		unload_modules
+		exit 0
+	fi
+
+	if ! $v4l2_ctl -z $vimc_device -d "Sensor A" ; then
 		echo "FAIL: the vimc module failed to load" | tee -a $tmp
 		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
@@ -543,14 +554,14 @@ if [ $vimc -eq 1 ]; then
 		exit 0
 	fi
 
-	media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/1920x1440]'
-	$v4l2_ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
-	$v4l2_ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
-	$v4l2_ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
+	media-ctl -d $vimc_device -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Scaler":1[fmt:RGB888_1X24/1920x1440]'
+	$v4l2_ctl -z $vimc_device -d "RGB/YUV Capture" -v width=1920,height=1440
+	$v4l2_ctl -z $vimc_device -d "Raw Capture 0" -v pixelformat=BA81
+	$v4l2_ctl -z $vimc_device -d "Raw Capture 1" -v pixelformat=BA81
 fi
 
 if [ $vimc -eq 1 -a $setup -eq 0 ]; then
@@ -559,7 +570,7 @@ if [ $vimc -eq 1 -a $setup -eq 0 ]; then
 	echo vimc compliance tests | tee /dev/kmsg
 	echo
 	date
-	stdbuf -oL $v4l2_compliance -m platform:vimc -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
+	stdbuf -oL $v4l2_compliance -m $vimc_device -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
 	echo
 	echo
 	echo
@@ -579,24 +590,24 @@ if [ $vimc -eq 1 -a $setup -eq 0 ]; then
 	echo
 	echo -n vimc.0 >/sys/bus/platform/drivers/vimc/bind
 	sleep 1
-	media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
-	media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/1920x1440]'
-	$v4l2_ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
-	$v4l2_ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
-	$v4l2_ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
+	media-ctl -d $vimc_device -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d $vimc_device -V '"Scaler":1[fmt:RGB888_1X24/1920x1440]'
+	$v4l2_ctl -z $vimc_device -d "RGB/YUV Capture" -v width=1920,height=1440
+	$v4l2_ctl -z $vimc_device -d "Raw Capture 0" -v pixelformat=BA81
+	$v4l2_ctl -z $vimc_device -d "Raw Capture 1" -v pixelformat=BA81
 	echo
 	echo second unbind vimc | tee /dev/kmsg
 	echo
 	# Max sleep time is 6 + 8 = 14s
-	for i in `$v4l2_ctl -z platform:vimc --list-devices`; do
+	for i in `$v4l2_ctl -z $vimc_device --list-devices`; do
 		let "t = 6 + $RANDOM / 4096"
 		echo $i: sleep ${t}s
 		sleep $t <$i &
 	done
-	$v4l2_ctl -z platform:vimc -d "Raw Capture 0" --stream-mmap --sleep 5 &
+	$v4l2_ctl -z $vimc_device -d "Raw Capture 0" --stream-mmap --sleep 5 &
 	sleep 1
 	echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
 	sleep 14
-- 
2.39.5


