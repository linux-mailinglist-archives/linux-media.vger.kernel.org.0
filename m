Return-Path: <linux-media+bounces-45128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549BBF6829
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 14:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CA105057B5
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8B9334C13;
	Tue, 21 Oct 2025 12:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uei7vXcs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5380331A56;
	Tue, 21 Oct 2025 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050499; cv=none; b=AwcxC5b8yJLK1I669YZG2Yv2Bh4lDda0I41s2iRonfUa9z9UolgEUUR0Lnba6qilOWJylK2pWTCbE6gZorb9XIwju3VozKMuTP5DBjS4BiVqzejIdhTe01XpmkmRVwWXA5KThtRjnSberYd3a8aTWw9qptEwUU6L2y/1F7QEKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050499; c=relaxed/simple;
	bh=d9oesBpLqRfCkHZZ8TKTxA34sdMl6Gbv8qnQV7o09pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyRtw/HCFBq69CyK6plgM19R0bxlFl9ff3iFUMVZJXf5AByqO9K/gq5sLRpTebPp8eMYZgjP4AybyudR2uF/p5mfEPcI79UfAJmvmmVTcuvrrDaP9IXikXww4q3eH9FO4eB5r2InTd/dQPo5Yr2rQQoQW6sHObBBY4C3koY6R/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uei7vXcs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B066F9;
	Tue, 21 Oct 2025 14:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761050385;
	bh=d9oesBpLqRfCkHZZ8TKTxA34sdMl6Gbv8qnQV7o09pk=;
	h=From:To:Cc:Subject:Date:From;
	b=uei7vXcsqNYcWI85WPMvS0BIYJkfhRFbznmRk3QD9gaMiaSdfqxwoUWRMVAlmTLH2
	 hIiMsrCR6HLCivf/1zcfLAcSsEW2puQwl6iCWBxo/kLn0LulfmpOwJu09LLhIBi0eA
	 5YtjIFGa0Ok4jN5ODGmZADSKRHgilp/3N2JLRrPM=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	david.plowman@raspberrypi.com,
	naush@raspberrypi.com,
	kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH] v4l: controls: Add v4l2 control to store camera module identifier
Date: Tue, 21 Oct 2025 13:41:21 +0100
Message-ID: <20251021124121.93907-1-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new v4l2 control ID that would be used by drivers to store a
string representing a SKU or other vendor-specific camera module
identifier. This would be used to tell user space which specific type of
camera module is present in the system.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

---

Hi all,

This patch builds on the discussion here:

https://lore.kernel.org/all/20250507081338.53614-1-sakari.ailus@linux.intel.com/

regarding the need to be able to identify camera modules. This is useful
when modules need to use the base driver of the camera sensor they
include, but need adjustments to account for different module features.

The driver, or potentially core v4l2, would be responsible for setting
this as a read-only control containing the SKU, or a vendor-specific
identifier for a camera module.

A SKU is expected to cover the sensor (found in the compatible string),
as well as the lens / packaging. For example, Raspberry Pi produce an
IMX708 camera module with several variations; a lot of code duplication
could be avoided in user space applications if a camera module
identifier was available.

These could be expressed through the SKU instead of variations of the
compatible string.

This would allow user space programs, such as libcamera, to select
different configurations specific to that module to account for
differences in lens characteristics, different CCMs, and more.

Tested on media/next

Best wishes,

Isaac
---
 include/uapi/linux/v4l2-controls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2d30107e047e..39267bdd5286 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1102,6 +1102,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 
+#define V4L2_CID_CAMERA_MODULE_IDENTIFIER	(V4L2_CID_CAMERA_CLASS_BASE+37)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.43.0


