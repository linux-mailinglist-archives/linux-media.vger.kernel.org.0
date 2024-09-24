Return-Path: <linux-media+bounces-18496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA389840FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427461F209B0
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E27315D5B7;
	Tue, 24 Sep 2024 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="bXqBIc9R"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3028158DD4;
	Tue, 24 Sep 2024 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167593; cv=pass; b=mgpG4TSMpiLJLpm2897aQiJ+2qWElcmfXAjIt6oyMst109bS4iEx3j1yY+LvAwoImW5UYP9IfDjLn4fuKUJmDAE6l8YTLTxXKxShNT/H6aUcVyfWD83R/vBzcleRAzKx1L4w30E92cKDCF7BSmDN+nrxbUm7rb7bvl/vQGoapnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167593; c=relaxed/simple;
	bh=po5NJZt3jrD7xtPpFLubKUK9l5jPK5lSkJwH5Hc6ERg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+oeiAuctA39p2OjgF83gGoLyoREG5z3gtcSabq+Fjn6FezCgV0OcRhE9g1cJAmen1B0N+sOqeiG57CvNQMe4sYZTgZLlzAceA7QZNl8RAlWZ99e5dYflr+cmvQfSSbe00mMFIRJGdmgXo57LfS+8+qssbtT9uxkTWiCVz174lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=bXqBIc9R; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727167580; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iRXtW9d7+497VXCoLeNTo5ficc9zEpanVsPHAPYNwzr5Dh6rJ21q85IpyAT0LDYlG3qN/g/noOhpjSYkCTMZTPT+orv8Bv4CpLaYMdj5gtlOCEcVjs+D7NpMequ+mbfjfKyb9oZYYmvmQlK9aYkqtl6+vmb3w3iy0QkBnyQoQl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727167580; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q3oWApHbcp8oyyobWeD5nMvlKWjpy2UT/CxElHmtVlo=; 
	b=haOc4Ms0edw8FOTGEmRWXeGyqfDGrn11m1x11B7QocVU3HxrVBjMqjW8F2yYroE+liyXe8c0Ame7IRCLGbED6tvNgU9keMUEySr2kefS9/n+tCz5uGitiEA7EhGN9ZSskh7pKJx9BTQSg2GG/4VsTXHdo9iuTlsPm7pkaX/LAu0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727167580;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=q3oWApHbcp8oyyobWeD5nMvlKWjpy2UT/CxElHmtVlo=;
	b=bXqBIc9R9DwkgFnqOi7jzIfLyfKeMFF1H2CPYVDhkNX2EzXkYNQG+uIPElh3aDe7
	i+V1ua+67bXr35hbQ+n+k+yllXZ4Vh1zWbK1wLczsqHBK7eYcLeIjkZ4aLTlHoqHSy9
	jY0+UIxun9GAFh4BfV83Sv2erlJPKeW2tdhd8oEE=
Received: by mx.zohomail.com with SMTPS id 1727167578119426.33679518370786;
	Tue, 24 Sep 2024 01:46:18 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 24 Sep 2024 10:45:59 +0200
Subject:
 [PATCH RFC v2 3/3] docs: media: Debugging guide for the media subsystem
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-b4-media_docs_improve-v2-3-66318b2da726@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727167560; l=9004;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=po5NJZt3jrD7xtPpFLubKUK9l5jPK5lSkJwH5Hc6ERg=;
 b=cFLrdBlwdChnzCrtmBsR9xfPiFeXHFXdLUrUO8H5nyegMs9f26ulMFSKdg4h5YocA2GGMhTP7RGc
 FqVPC3WRC3Gsq39BcsmI/uxSkPE80TKHUEsnTax430NJ4kwXt2r+
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

Create a guides section for all documentation material, that isn't
strictly related to a specific piece of code.

Provide a guide for developers on how to debug code with a focus on the
media subsystem. This document aims to provide a rough overview over the
possibilities and a rational to help choosing the right tool for the
given circumstances.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 Documentation/media/guides/debugging_issues.rst | 174 ++++++++++++++++++++++++
 Documentation/media/guides/index.rst            |  11 ++
 Documentation/media/index.rst                   |   1 +
 3 files changed, 186 insertions(+)

diff --git a/Documentation/media/guides/debugging_issues.rst b/Documentation/media/guides/debugging_issues.rst
new file mode 100644
index 000000000000..5f37801dd4ba
--- /dev/null
+++ b/Documentation/media/guides/debugging_issues.rst
@@ -0,0 +1,174 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+============================================
+Debugging and tracing in the media subsystem
+============================================
+
+This document serves as a starting point and lookup for debugging device
+drivers in the media subsystem.
+
+.. contents::
+    :depth: 3
+
+General debugging advice
+========================
+
+For general advice see the `general-debugging-guide <../../debugging/index.html>`__.
+
+Available tools
+===============
+
+dev_debug module parameter
+--------------------------
+
+For a general overview please see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
+
+Every video device provides a `dev_debug` parameter, which allows to get further insights into the IOCTLs in the background.
+::
+
+  # cat /sys/class/video4linux/video3/name
+  rkvdec
+  # echo 0xff > /sys/class/video4linux/video3/dev_debug
+  # dmesg -wH
+  [...] videodev: v4l2_open: video3: open (0)
+  [  +0.000036] video3: VIDIOC_QUERYCAP: driver=rkvdec, card=rkvdec, bus=platform:rkvdec, version=0x00060900, capabilities=0x84204000, device_caps=0x04204000
+
+`Full documentation <../../driver-api/media/v4l2-dev.html#video-device-debugging>`__
+
+dev_dbg / v4l2_dbg
+------------------
+
+- Difference between both?
+
+  - v4l2_dbg utilizes v4l2_printk under the hood, which further uses printk directly, thus it cannot be targeted by dynamic debug
+  - dev_dbg can be targeted by dynamic debug
+  - v4l2_dbg has a more specific prefix format for the media subsystem, while dev_dbg only highlights the driver name and the location of the log
+
+Dynamic debug
+-------------
+
+For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
+
+Here is one example, that enables all available `pr_debug()`'s within the file:
+::
+
+  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
+  $ ddcmd '-p; file v4l2-h264.c +p'
+  $ grep =p /proc/dynamic_debug/control
+   drivers/media/v4l2-core/v4l2-h264.c:372 [v4l2_h264]print_ref_list_b =p "ref_pic_list_b%u (cur_poc %u%c) %s"
+   drivers/media/v4l2-core/v4l2-h264.c:333 [v4l2_h264]print_ref_list_p =p "ref_pic_list_p (cur_poc %u%c) %s\n"
+
+Ftrace
+------
+
+For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
+
+Trace whenever the `rkvdec_try_ctrl` function is called
+::
+
+  $ cd /sys/kernel/tracing
+  $ echo function > /sys/kernel/tracing/current_tracer
+  $ echo rkvdec_try_ctrl > set_ftrace_filter
+  $ echo 1 > tracing_on
+  $ cat trace
+   h264parse0:sink-6359    [001] ...1. 172714.547523: rkvdec_try_ctrl <-try_or_set_cluster
+   h264parse0:sink-6359    [005] ...1. 172714.567386: rkvdec_try_ctrl <-try_or_set_cluster
+
+Find out from where the calls originate
+::
+
+  $ echo 1 > options/func_stack_trace
+   h264parse0:sink-6715    [002] ..... 172837.967762: rkvdec_try_ctrl <-try_or_set_cluster
+   h264parse0:sink-6715    [002] ..... 172837.967773: <stack trace>
+   => rkvdec_try_ctrl
+   => try_or_set_cluster
+   => try_set_ext_ctrls_common
+   => try_set_ext_ctrls
+   => v4l2_s_ext_ctrls
+   => v4l_s_ext_ctrls
+   ...
+   h264parse0:sink-6715    [004] ..... 172837.985747: rkvdec_try_ctrl <-try_or_set_cluster
+   h264parse0:sink-6715    [004] ..... 172837.985750: <stack trace>
+   => rkvdec_try_ctrl
+   => try_or_set_cluster
+   => v4l2_ctrl_request_setup
+   => rkvdec_run_preamble
+   => rkvdec_h264_run
+   => rkvdec_device_run
+   ...
+
+Trace the children of a function call and show the return values (requires config `FUNCTION_GRAPH_RETVAL`)
+::
+
+  echo function_graph > current_tracer
+  echo rkvdec_h264_run > set_graph_function
+  echo 4 > max_graph_depth
+  echo do_interrupt_handler mutex_* > set_graph_notrace
+  echo 1 > options/funcgraph-retval
+   ...
+   4)               |  rkvdec_h264_run [rockchip_vdec]() {
+   4)               |    v4l2_ctrl_find [videodev]() {
+   ...
+   4)               |    rkvdec_run_preamble [rockchip_vdec]() {
+   4)   4.666 us    |      v4l2_m2m_next_buf [v4l2_mem2mem](); /* = 0xffff000005782000 */
+   ...
+   4)               |      v4l2_ctrl_request_setup [videodev]() {
+   4)   4.667 us    |        media_request_object_find [mc](); /* = 0xffff000005e3aa98 */
+   4)   1.750 us    |        find_ref [videodev](); /* = 0xffff00000833b2a0 */
+   ...
+   4)   1.750 us    |      v4l2_m2m_buf_copy_metadata [v4l2_mem2mem](); /* = 0x0 */
+   4) ! 114.333 us  |    } /* rkvdec_run_preamble [rockchip_vdec] = 0x0 */
+   4)   2.334 us    |    v4l2_h264_init_reflist_builder [v4l2_h264](); /* = 0x3e */
+   ...
+   4)               |    v4l2_h264_build_b_ref_lists [v4l2_h264]() {
+   ...
+   4)               |    rkvdec_run_postamble [rockchip_vdec]() {
+   ...
+   4) ! 444.208 us  |  } /* rkvdec_h264_run [rockchip_vdec] = 0x0 */
+
+DebugFS
+-------
+
+For general advice see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
+
+Perf & alternatives
+-------------------
+
+For general advice see the `userspace-debugging-guide <../../debugging/userspace_debugging_guide.html>`__.
+
+Example for media devices:
+
+Gather statistics data for a decoding job: (This example is on a RK3399 SoC with the rkvdec codec driver using the `fluster test suite <https://github.com/fluendo/fluster>`__)
+::
+
+  perf stat -d python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1
+  ...
+  Performance counter stats for 'python3 fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -ts JVT-AVC_V1 -tv AUD_MW_E -j1 -v':
+
+           7794.23 msec task-clock:u                     #    0.697 CPUs utilized
+                 0      context-switches:u               #    0.000 /sec
+                 0      cpu-migrations:u                 #    0.000 /sec
+             11901      page-faults:u                    #    1.527 K/sec
+         882671556      cycles:u                         #    0.113 GHz                         (95.79%)
+         711708695      instructions:u                   #    0.81  insn per cycle              (95.79%)
+          10581935      branches:u                       #    1.358 M/sec                       (15.13%)
+           6871144      branch-misses:u                  #   64.93% of all branches             (95.79%)
+         281716547      L1-dcache-loads:u                #   36.144 M/sec                       (95.79%)
+           9019581      L1-dcache-load-misses:u          #    3.20% of all L1-dcache accesses   (95.79%)
+   <not supported>      LLC-loads:u
+   <not supported>      LLC-load-misses:u
+
+      11.180830431 seconds time elapsed
+
+       1.502318000 seconds user
+       6.377221000 seconds sys
+
+The availability of events and metrics depends on the system you are running.
+
+Error checking & panic analysis
+-------------------------------
+
+For general advice see the `driver-development-debugging-guide <../../debugging/driver_development_debugging_guide.html>`__.
+
+**Copyright** |copy| 2024 : Collabora
diff --git a/Documentation/media/guides/index.rst b/Documentation/media/guides/index.rst
new file mode 100644
index 000000000000..0008966c0862
--- /dev/null
+++ b/Documentation/media/guides/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+Media Guides
+============
+
+.. toctree::
+    :caption: Table of Contents
+    :maxdepth: 1
+
+    debugging_issues
diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
index d056a9e99dca..5461876fc401 100644
--- a/Documentation/media/index.rst
+++ b/Documentation/media/index.rst
@@ -7,6 +7,7 @@ Media Subsystem Documentation
 .. toctree::
    :maxdepth: 2
 
+   guides/index
    ../userspace-api/media/index
    ../driver-api/media/index.rst
    ../admin-guide/media/index

-- 
2.25.1

