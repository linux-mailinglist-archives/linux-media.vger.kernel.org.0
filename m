Return-Path: <linux-media+bounces-38869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91023B1A6C1
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 17:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9113AA7B5
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9371F2737F6;
	Mon,  4 Aug 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL77TTyL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9E221DB6
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322729; cv=none; b=gGqjo5Zfw/HygJ72UyUFYj8b9jVTr/NDPyAH7InK9Mx/X3HHkn+oGoI/F683HSEjs7EoIs+dxXzKITqa7/5aW0/QQWmMrGa/S16zN0cl02Zzsu3ESKOQvv1D8K2eUbv+akEHmvylGsLVdETqxy6fGPupSOgY2xOf1E2sg5Wl1HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322729; c=relaxed/simple;
	bh=0/f88CIeYOn9D2r5xsO70hG8ZRlWjd15wHsan/xzgSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBV6WAN1A5SNMS6TWPgxAiJfzYqOguCxSu/Lkn8uVudSubHmAbF4Ba8aqDHyCCAKzkTREcXB0dRz3PTuJR41GC51oXaOyak3rIc1j3in16Hz764upVCIvCvc43NucYUDopYhaxqGFO9HRoG6uZyKifwSV7/B95W6WjGqcsp8Y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hL77TTyL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322728; x=1785858728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0/f88CIeYOn9D2r5xsO70hG8ZRlWjd15wHsan/xzgSE=;
  b=hL77TTyLK24GVeB96IclNAzklT3gGt9zqlS2D14RXOjK/n62YGadDdMm
   d6888Tweldi2DS9Jaef87SAkSHsO6CwGpkDYyFkYno5yXOD2drwgCzl+f
   /76Gxr8QyhT4KWv9sw6OXdNozbjKU036YA7KLO8JP6KzFEu3Dlg+6tSdM
   CFL0IlsRPT2JWb74v+htv7ngzLvIuOMln/uJzK/OLYW94t82f1JJz4zZI
   Z7uYSHI+ci9lBIuJbXBhkbN0oiZib+NqT8x8T1wVwnTQ63IMAHtYT3NXC
   ChgvdP8MVbx0ntRulzwZUtk/J7y4tzis7C44DbsUzByySPtOMuN3ndYCM
   w==;
X-CSE-ConnectionGUID: hVKcIdyITISWDy7JLDieog==
X-CSE-MsgGUID: IeTfCATMTy+wmpnxJ/NVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56484265"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56484265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:05 -0700
X-CSE-ConnectionGUID: M8UkF4EATWiillPMnA+MJg==
X-CSE-MsgGUID: 5UxfgmcgQ2267vktr5qySQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169500276"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E769311F9C8;
	Mon,  4 Aug 2025 18:52:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uixTk-001cZw-2w;
	Mon, 04 Aug 2025 18:52:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH v2 1/2] contrib/test/test-media: Fix module unloading
Date: Mon,  4 Aug 2025 18:51:59 +0300
Message-Id: <20250804155200.386609-2-sakari.ailus@linux.intel.com>
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

Keep track of all loaded modules and unload them at exit. This also
unifies informing of loading and unloading modules.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 contrib/test/test-media | 83 ++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 68fe48f947f3..87f5a0544b84 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -24,10 +24,31 @@ kobj_rel=0
 v4l2_ctl=v4l2-ctl
 v4l2_compliance=v4l2-compliance
 compliance_args=
+declare -A modules_loaded
+
+unload_module() {
+	echo rmmod $1 | tee /dev/kmsg
+	rmmod $1 2> /dev/null
+	unset modules_loaded[$1];
+}
+
+unload_modules() {
+	local i
+
+	for i in ${!modules_unload[@]}; do
+		unload_module $i
+	done
+}
 
 run_modprobe () {
 	dmesg -n info
+	if [ "$1" == "-r" ]; then
+		unload_module "$2"
+		shift
+	fi
+	echo modprobe $1 | tee /dev/kmsg
 	modprobe $@
+	modules_loaded[$1]=1
 	sleep $modprobe_time
 	udevadm settle
 	dmesg -n notice
@@ -229,8 +250,7 @@ if [ $kmemleak -eq 1 ]; then
 fi
 
 dmesg -n info
-rmmod vivid 2&>/dev/null
-run_modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
+run_modprobe -r vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
 
 tmp=`mktemp`
 
@@ -238,6 +258,7 @@ if ! $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap ; then
 	echo "FAIL: the vivid module failed to load" | tee -a $tmp
 	echo "Grand Total for vivid: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 	echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+	unload_modules
 	exit 0
 fi
 
@@ -291,6 +312,7 @@ if [ $cec -eq 1 ]; then
 		echo "FAIL: the vivid module had no cec support" | tee -a $tmp
 		echo "Grand Total for vivid cec: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		unload_modules
 		exit 0
 	fi
 	cec-ctl -D vivid -a vivid-000-vid-cap0 --tv
@@ -375,9 +397,7 @@ if [ $vivid -eq 1 -a $setup -eq 0 ]; then
 	echo -n vivid.0 >/sys/bus/platform/drivers/vivid/unbind
 	sleep $reunbind_time
 	echo
-	echo rmmod vivid | tee /dev/kmsg
-	echo
-	rmmod vivid
+	unload_module vivid
 	sleep $rmmod_time
 
 	if [ $kmemleak -eq 1 ]; then
@@ -410,14 +430,13 @@ if [ $vivid -eq 1 -a $setup -eq 0 ]; then
 fi
 
 if [ $vim2m -eq 1 ]; then
-	rmmod vim2m 2&>/dev/null
-	run_modprobe vim2m
+	run_modprobe -r vim2m
 
 	if ! $v4l2_ctl -z platform:vim2m ; then
 		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
 		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		unload_modules
 		exit 0
 	fi
 fi
@@ -432,9 +451,7 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 	echo
 	echo
 	echo
-	echo rmmod vim2m | tee /dev/kmsg
-	echo
-	rmmod vim2m
+	unload_module vim2m
 	sleep $rmmod_time
 	if [ $kmemleak -eq 1 ]; then
 		echo
@@ -453,7 +470,7 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
 		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		unload_modules
 		exit 0
 	fi
 
@@ -493,9 +510,7 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 	echo -n vim2m.0 >/sys/bus/platform/drivers/vim2m/unbind
 	sleep $reunbind_time
 	echo
-	echo rmmod vim2m | tee /dev/kmsg
-	echo
-	rmmod vim2m
+	unload_module vim2m
 	sleep $rmmod_time
 	if [ $kmemleak -eq 1 ]; then
 		echo
@@ -518,14 +533,13 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 fi
 
 if [ $vimc -eq 1 ]; then
-	rmmod vimc 2&>/dev/null
-	run_modprobe vimc
+	run_modprobe -r vimc
 
 	if ! $v4l2_ctl -z platform:vimc -d "Sensor A" ; then
 		echo "FAIL: the vimc module failed to load" | tee -a $tmp
 		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		unload_modules
 		exit 0
 	fi
 
@@ -587,9 +601,7 @@ if [ $vimc -eq 1 -a $setup -eq 0 ]; then
 	echo -n vimc.0 >/sys/bus/platform/drivers/vimc/unbind
 	sleep 14
 	echo
-	echo rmmod vimc | tee /dev/kmsg
-	echo
-	rmmod vimc
+	unload_module vimc
 	sleep $rmmod_time
 	if [ $kmemleak -eq 1 ]; then
 		echo
@@ -620,14 +632,13 @@ if [ $vicodec -eq 1 ]; then
 		mkdir $tmpdir
 	fi
 
-	rmmod vicodec 2&>/dev/null
-	run_modprobe vicodec
+	run_modprobe -r vicodec
 
 	if ! $v4l2_ctl -z platform:vicodec ; then
 		echo "FAIL: the vicodec module failed to load" | tee -a $tmp
 		echo "Grand Total for vicodec: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		unload_modules
 		exit 0
 	fi
 
@@ -778,9 +789,7 @@ if [ $vicodec -eq 1 -a $setup -eq 0 ]; then
 	echo -n vicodec.0 >/sys/bus/platform/drivers/vicodec/unbind
 	sleep $reunbind_time
 	echo
-	echo rmmod vicodec | tee /dev/kmsg
-	echo
-	rmmod vicodec
+	unload_module vicodec
 	sleep $rmmod_time
 	if [ $kmemleak -eq 1 ]; then
 		echo
@@ -805,14 +814,13 @@ fi
 
 if [ $visl -eq 1 ]; then
 	echo
-	echo loading visl module | tee /dev/kmsg
-	run_modprobe visl
+	run_modprobe -r visl
 
 	if ! $v4l2_ctl -z platform:visl ; then
 		echo "FAIL: the visl module failed to load" | tee -a $tmp
 		echo "Grand Total for visl: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
-		rmmod vivid
+		unload_modules
 		exit 0
 	fi
 fi
@@ -846,9 +854,7 @@ if [ $visl -eq 1 -a $setup -eq 0 ]; then
 	echo -n visl.0 >/sys/bus/platform/drivers/visl/unbind
 	sleep $reunbind_time
 	echo
-	echo rmmod visl | tee /dev/kmsg
-	echo
-	rmmod visl
+	unload_module visl
 	sleep $rmmod_time
 
 	if [ $kmemleak -eq 1 ]; then
@@ -889,6 +895,7 @@ if [ $vidtv -eq 1 ]; then
 		echo "Grand Total for vidtv: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
 		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
 		rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod 2&>/dev/null
+		unload_modules
 		exit 0
 	fi
 fi
@@ -926,9 +933,7 @@ if [ $vidtv -eq 1 -a $setup -eq 0 ]; then
 	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
 	sleep $reunbind_time
 	echo
-	echo rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod
-	echo
-	rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod
+	unload_module dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod
 	sleep $rmmod_time
 	if [ $kmemleak -eq 1 ]; then
 		echo
@@ -959,9 +964,7 @@ if [ $setup -eq 0 ]; then
 	echo -n vivid.0 >/sys/bus/platform/drivers/vivid/unbind
 	sleep $unbind_time
 	echo
-	echo rmmod vivid | tee /dev/kmsg
-	echo
-	rmmod vivid
+	unload_module vivid
 	sleep $rmmod_time
 fi
 
@@ -1001,5 +1004,7 @@ if [ $setup -eq 0 ]; then
 	fi
 fi
 
+unload_modules
+
 dmesg -n info
 date
-- 
2.39.5


