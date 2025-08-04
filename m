Return-Path: <linux-media+bounces-38828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB30B19F4C
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBAF7175655
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC32E2566D2;
	Mon,  4 Aug 2025 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5bN0QNT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854742512F1
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301797; cv=none; b=Gat/+6PmME2ubVcseNZJpndpcoHF13ZW30GA/9CsrC9K/Rg4pKeYhspagySReFtrwaFUmCsnFGI3HXHV4U8xs25JfTeujuOYF6y5TyC20CGtuRXSuXIMwlUlv6XvPSgoxwoa/ETOo+FsszN8jwEjXkP1YI8DRBUT4Ppm4Sf7SV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301797; c=relaxed/simple;
	bh=lzIld8ERQKcLnaf4afOMBge2Ha9INaCAgUxj0DtM0iw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YeOsxr1I3LoYDZUKBiFHMd724SGcmZYW/qsYV9ZZkys14M2U/C0HoVZnlAMO4KxR3dlaeh7gTNh1lYqZZFSQJMIghMPdOOHJ+/OqkOddkj1FY3t12JRvqFtdb2a3LU44Iji+kHHokitvprME2jWaJ0TRd4h3Ch7cS03SKMSG5PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5bN0QNT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754301795; x=1785837795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lzIld8ERQKcLnaf4afOMBge2Ha9INaCAgUxj0DtM0iw=;
  b=K5bN0QNTHfghJFuuV+9SIdKeiNi2p+Kt0SCMcU9yannBPZW3X5cRqYky
   buTavj5UBQ7T0TEPagMfU0KFci94V0GEwxtF5tOq4OHnrnVbJMUmp2DQu
   zwRkjU92q6XglEHGZgtnvu3TwVNPvkP2+ity9KXa52tOjzqPEM/HlutpB
   SKw7I90Q0zEsrRxKExNle0BnIovyYt5i38GuMkPP5mqjB7rn5pu+4JzmU
   UJXC8OWL6HaODa9JPlDMZ1VUtWw7WAv1plsZCF/ElSxh4Qb7ocFdT6B0v
   zVO8oEnuKr//+AXgx/WGFMGS+TQ4aBiGwGEeZGaeSkvhdHki2hwc6UZMd
   g==;
X-CSE-ConnectionGUID: QQtR19gaTDWns+zEm3IdIQ==
X-CSE-MsgGUID: 81w2Kci2TsqccTnVVj9pRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56448980"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56448980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:13 -0700
X-CSE-ConnectionGUID: LZ75bbZiQ5y2IKJk7r0rsQ==
X-CSE-MsgGUID: ypVJS9mlR3W456slDfz1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194950824"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 03:03:12 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8821811FC4F;
	Mon,  4 Aug 2025 13:03:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uis29-001TPV-1n;
	Mon, 04 Aug 2025 13:03:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH 2/2] contrib/test/test-media: Probe the vimc device
Date: Mon,  4 Aug 2025 13:03:09 +0300
Message-Id: <20250804100309.351362-3-sakari.ailus@linux.intel.com>
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

The vimc platform device is called platform:vimc.0 after kernel patch
"media: vimc: Don't explicitly set bus_info". Adapt to possible different
naming of the vimc device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 contrib/test/test-media | 51 +++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index dda7ff44075b..c3691ab32ca9 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -521,7 +521,18 @@ if [ $vimc -eq 1 ]; then
 	rmmod vimc 2&>/dev/null
 	run_modprobe vimc
 
-	if ! $v4l2_ctl -z platform:vimc -d "Sensor A" ; then
+	for i in vimc vimc.0; do
+		if media-ctl -d platform:$i > /dev/null; then
+			vimc_device=platform:$i
+		fi
+	done
+	if [ "$vimc_device" -eq "" ]; then
+		echo "FAIL: can't find vimc device" | tee -a $tmp
+		rmmod vimc
+		exit 0
+	fi
+
+	if ! $v4l2_ctl -z $vimc_device -d "Sensor A" ; then
 		echo "FAIL: the vimc module failed to load" | tee -a $tmp
 		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
@@ -529,14 +540,14 @@ if [ $vimc -eq 1 ]; then
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
@@ -545,7 +556,7 @@ if [ $vimc -eq 1 -a $setup -eq 0 ]; then
 	echo vimc compliance tests | tee /dev/kmsg
 	echo
 	date
-	stdbuf -oL $v4l2_compliance -m platform:vimc -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
+	stdbuf -oL $v4l2_compliance -m $vimc_device -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
 	echo
 	echo
 	echo
@@ -565,24 +576,24 @@ if [ $vimc -eq 1 -a $setup -eq 0 ]; then
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


