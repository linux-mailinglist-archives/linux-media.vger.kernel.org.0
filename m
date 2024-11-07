Return-Path: <linux-media+bounces-21064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEE9C0853
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BCE21F21878
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E49E212D3E;
	Thu,  7 Nov 2024 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="dCGAV1O3"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE528F1;
	Thu,  7 Nov 2024 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988058; cv=pass; b=BlZdUjS1iGyOFPXSUdWy6o9famgR41ypIykHxiqLN1IuZwrVXr6MNK+5XYr5ivlbT0tv9GycvsMwIWnM672cW/h6urZkhXCu73HACpAyhhXx5unroCopiD6Fnj5ZbNjV1FMqjaqWjfHsnFOKRLkOO+geeWm7aGj6blRhgugTVgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988058; c=relaxed/simple;
	bh=4NcsKRtVZifoMZpv/hWeYJyhhc5NM9VV7JwBM8iZYu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mi2XcqOiWFjMPxGWvcIwTZIxeFsUx6L524mnyBbBrUhaAB0Gw1HZ9MxAHtCjyxbofmvmKbm5S5uBRaBsZte1rVJ+uyVmhXBQjZQAmlp52Mo2SpAewas4tk7V/5/Q25RRPa+BuBBOAtvcU1xG7eEyDm1B+bmn6gggnUXxC8j23PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=dCGAV1O3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1730988043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FPzo6oCh3divIIwH605kd/PhJXr0AK8WevAN6er8ZLUtrKSC4cHNcA6EQdaq/ookC2XW4XD+sVOM1+OTWoAPGDCaOZE91zJYVi0KqjQMOmUwHiCZBG87BLRxmSoFzYnrsy8fhllNiMiWD8bUtYGNWGEy6SkopeNFqqMIe9o7QB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730988043; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FQlNU2ZVOPW7ydKhB4DJDtUqfzE3jqalhsT9d8MtRhc=; 
	b=T3ZFHP7Aocc0l73a8c1QCF0r/ItZF9T5OfjRke9vTQny69kZDt3zFJIUPEGYHFKRCJa0a4J4Y73zKrtE2v6DaVg+anUuPSZfDB1sfReO3FkGBbYksy/gQZ95RFvdMZdPYNsQEW/kYdC1iR4XAzaZxnqpAfxA1yEFkn8EjUlAHkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730988043;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FQlNU2ZVOPW7ydKhB4DJDtUqfzE3jqalhsT9d8MtRhc=;
	b=dCGAV1O3473pj6EBP6vlotZ+6OpeOIYS0Z/f7bAKnWluzsz3lnKaxjqS4fg3w2Y6
	peHkvDiPPUdb2fy++RctYiCbOWqZDfoqtT2Y/jbhUgP/1tcWp36N3fB6JmZ2uMVkroT
	C9eXw9x5vA3B7dCuSj2Pj4BG7uN8GhNjohFDERa4=
Received: by mx.zohomail.com with SMTPS id 1730988040967873.7786360092949;
	Thu, 7 Nov 2024 06:00:40 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Thu, 07 Nov 2024 15:00:24 +0100
Subject: [PATCH 2/2] docs: media: Debugging guide for the media subsystem
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241028-media_docs_improve_v3-v1-2-2b1b486c223e@collabora.com>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
In-Reply-To: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730988026; l=8175;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=4NcsKRtVZifoMZpv/hWeYJyhhc5NM9VV7JwBM8iZYu4=;
 b=Frt57lxx3bQHq1CrSJu82LhWrtDlJ+PDHIoTpHWtcaBPg583hUxvbg8rdo7QnoJrs+b+T7KaPeTu
 X5zjDHTvCKdVVxHXrDj+Pv4kVp36u5cnA2r0AGtIAnaAq74TtTCv
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

Provide a guide for developers on how to debug code with a focus on the
media subsystem. This document aims to provide a rough overview over the
possibilities and a rational to help choosing the right tool for the
given circumstances.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 Documentation/process/debugging/index.rst          |   1 +
 .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++++++++++
 2 files changed, 179 insertions(+)

diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
index c200ede7c955..322e33d65ca3 100644
--- a/Documentation/process/debugging/index.rst
+++ b/Documentation/process/debugging/index.rst
@@ -10,6 +10,7 @@ Debugging advice for Linux Kernel developers
    general_advice
    driver_development_debugging_guide
    userspace_debugging_guide
+   media_specific_debugging_guide
 
 .. only::  subproject and html
 
diff --git a/Documentation/process/debugging/media_specific_debugging_guide.rst b/Documentation/process/debugging/media_specific_debugging_guide.rst
new file mode 100644
index 000000000000..ab840e695af9
--- /dev/null
+++ b/Documentation/process/debugging/media_specific_debugging_guide.rst
@@ -0,0 +1,178 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Debugging and tracing in the media subsystem
+============================================
+
+This document serves as a starting point and lookup for debugging device
+drivers in the media subsystem and to debug these drivers from userspace.
+
+.. contents::
+    :depth: 3
+
+General debugging advice
+------------------------
+
+For general advice see the :doc:`/process/debugging/general_advice`.
+
+The following sections show you some of the available tools.
+
+dev_debug module parameter
+--------------------------
+
+Every video device provides a `dev_debug` parameter, which allows to get
+further insights into the IOCTLs in the background.::
+
+  # cat /sys/class/video4linux/video3/name
+  rkvdec
+  # echo 0xff > /sys/class/video4linux/video3/dev_debug
+  # dmesg -wH
+  [...] videodev: v4l2_open: video3: open (0)
+  [  +0.000036] video3: VIDIOC_QUERYCAP: driver=rkvdec, card=rkvdec,
+  bus=platform:rkvdec, version=0x00060900, capabilities=0x84204000,
+  device_caps=0x04204000
+
+For the full documentation see :ref:`driver-api/media/v4l2-dev:video device debugging`
+
+dev_dbg / v4l2_dbg
+------------------
+
+Two debug print statements, which are specific for devices and for the v4l2
+subsystem, avoid adding these to your final submission unless they have
+long-term value for investigations.
+
+For a general overview please see the
+:ref:`process/debugging/driver_development_debugging_guide:printk & friends`
+guide.
+
+- Difference between both?
+
+  - v4l2_dbg utilizes v4l2_printk under the hood, which further uses printk
+    directly, thus it cannot be targeted by dynamic debug
+  - dev_dbg can be targeted by dynamic debug
+  - v4l2_dbg has a more specific prefix format for the media subsystem, while
+    dev_dbg only highlights the driver name and the location of the log
+
+Dynamic debug
+-------------
+
+A method to trim down the debug output to your needs.
+
+For general advice see the
+:ref:`process/debugging/userspace_debugging_guide:dynamic debug` guide.
+
+Here is one example, that enables all available pr_debug()'s within the file::
+
+  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
+  $ ddcmd '-p; file v4l2-h264.c +p'
+  $ grep =p /proc/dynamic_debug/control
+   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p
+   "ref_pic_list_b%u (cur_poc %u%c) %s"
+   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p
+   "ref_pic_list_p (cur_poc %u%c) %s\n"
+
+Ftrace
+------
+
+An internal kernel tracer that can trace static predefined events, function
+calls, etc. Very useful for debugging problems without changing the kernel and
+understanding the behavior of subsystems.
+
+For general advice see the
+:ref:`process/debugging/userspace_debugging_guide:ftrace` guide.
+
+DebugFS
+-------
+
+This tool allows you to dump or modify internal values of your driver to files
+in a custom filesystem.
+
+For general advice see the
+:ref:`process/debugging/driver_development_debugging_guide:debugfs` guide.
+
+Perf & alternatives
+-------------------
+
+Tools to measure the various stats on a running system to diagnose issues.
+
+For general advice see the
+:ref:`process/debugging/userspace_debugging_guide:perf & alternatives` guide.
+
+Example for media devices:
+
+Gather statistics data for a decoding job: (This example is on a RK3399 SoC
+with the rkvdec codec driver using the `fluster test suite
+<https://github.com/fluendo/fluster>`__)::
+
+  perf stat -d python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts
+  JVT-AVC_V1 -tv AUD_MW_E -j1
+  ...
+  Performance counter stats for 'python3 fluster.py run -d
+  GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1 -v':
+
+         7794.23 msec task-clock:u                     #    0.697 CPUs utilized
+               0      context-switches:u               #    0.000 /sec
+               0      cpu-migrations:u                 #    0.000 /sec
+           11901      page-faults:u                    #    1.527 K/sec
+       882671556      cycles:u                         #    0.113 GHz                         (95.79%)
+       711708695      instructions:u                   #    0.81  insn per cycle              (95.79%)
+        10581935      branches:u                       #    1.358 M/sec                       (15.13%)
+         6871144      branch-misses:u                  #   64.93% of all branches             (95.79%)
+       281716547      L1-dcache-loads:u                #   36.144 M/sec                       (95.79%)
+         9019581      L1-dcache-load-misses:u          #    3.20% of all L1-dcache accesses   (95.79%)
+ <not supported>      LLC-loads:u
+ <not supported>      LLC-load-misses:u
+
+    11.180830431 seconds time elapsed
+
+     1.502318000 seconds user
+     6.377221000 seconds sys
+
+The availability of events and metrics depends on the system you are running.
+
+Error checking & panic analysis
+-------------------------------
+
+Various Kernel configuration options to enhance error detection of the Linux
+Kernel with the cost of lowering performance.
+
+For general advice see the
+:ref:`process/debugging/driver_development_debugging_guide:kasan, ubsan,
+lockdep and other error checkers` guide.
+
+Driver verification with v4l2-compliance
+----------------------------------------
+
+To verify, that a driver adheres to the v4l2 API, the tool v4l2-compliance is
+used, which is part of the `v4l_utils
+<https://git.linuxtv.org/v4l-utils.git>`__, a suite of userspace tools to work
+with the media subsystem.
+
+To see the detailed media topology (and check it) use::
+
+  v4l2-compliance -M /dev/mediaX --verbose
+
+You can also run a full compliance check for all devices referenced in the
+media topology with::
+
+  v4l2-compliance -m /dev/mediaX
+
+Debugging problems with receiving video
+---------------------------------------
+
+Implementing vidioc_log_status in the driver: this can log the current status
+to the kernel log. It's called by v4l2-ctl --log-status. Very useful for
+debugging problems with receiving video (TV/S-Video/HDMI/etc) since the video
+signal is external (so unpredictable). Less useful with camera sensor inputs
+since you have control over what the camera sensor does.
+
+Usually you can just assign the default::
+
+  .vidioc_log_status  = v4l2_ctrl_log_status,
+
+But you can also create your own callback, to create a custom status log.
+
+You can find an example in the cobalt driver
+(`drivers/media/pci/cobalt/cobalt-v4l2.c <https://elixir.bootlin.com/linux/v6.11.6/source/drivers/media/pci/cobalt/cobalt-v4l2.c#L567>`__).
+
+**Copyright** ©2024 : Collabora

-- 
2.25.1

