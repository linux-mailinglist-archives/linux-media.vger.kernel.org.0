Return-Path: <linux-media+bounces-10229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F109A8B3A6E
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 16:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE021C233DE
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 14:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDFF148846;
	Fri, 26 Apr 2024 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfYJczSa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3D1487C3
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714143356; cv=none; b=LjIeV1TJR3i8A8HKjulmZt70ONnkhk7+id9dsl7HrPz1dp+CFEfIDuXIHJW7qIp9VHpz2LzSQboeqnE5j4xhIsAmkYwrIntpFDRccp7g4mnfWNCTSjQoSbZ4aMLlxvYIP4BybipZBrdzQTaH8ZWqWmgwPBG9S7R+qEGIVELjyXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714143356; c=relaxed/simple;
	bh=KCU1k9cjxUtzLj6jkWOczakDjmB8QgGPifWZJuswmfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUtcZDU8BtFoDrn++DmXg1bBmL88imRF3KmbqD9iYKX5FB7N05kQ7CHz4olH9EkPqZpdylzyu0gUqab/xwphJwdbQFEQ9mAaHLwRqXyEFrnywSw14t9SSO5oc171Ixy9cXLhDPudXws2qOvhxCmXzxy+YSEq76u1jEDauNHnXkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfYJczSa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714143355; x=1745679355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KCU1k9cjxUtzLj6jkWOczakDjmB8QgGPifWZJuswmfI=;
  b=EfYJczSa5K2zNO3ThrF1xSTlsYSzrh1p7bh/+wNB9set2vanW6JEUugy
   AqHOoHhlYL1WBEHCiyHOsfJnlIuBz1Yp24OXb1JTrw0hh38YGRP+WYl9v
   rgRKnjAY1vtTLR7HZheh93DOCngFPw+NvhaOIQspY4vCScIFsnXYwOcjd
   mu7K/tuip/CPcw1j+SsEF5+WmiggM18G7WXYG2z9VjorwA2vRzaBkmtjP
   7FAhU6qFHPpDNP/bwDCgRsEGYXpIIA5/IZzR7q/lU18g/TBvMQMu+E5Kd
   wIiftEOgqFelsUHwtlqM3gIhzJg2v1Du5QqvnbPQrAPL+iIV+uS70rvq2
   g==;
X-CSE-ConnectionGUID: O7GehDoXTlm3kMVFJmnA3Q==
X-CSE-MsgGUID: mGHgBps5Szme1wfAv1Akhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10095280"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="10095280"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:52 -0700
X-CSE-ConnectionGUID: 8NKK24Z4SuClW31demMGIw==
X-CSE-MsgGUID: q/AM8OEySs+3bBaV4IJoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25514718"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:55:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B066311FC19;
	Fri, 26 Apr 2024 17:55:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s0MzM-002kC9-2C;
	Fri, 26 Apr 2024 17:55:48 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 1/3] media: Documentation: v4l: Add CUR_LINK_FREQ control
Date: Fri, 26 Apr 2024 17:55:36 +0300
Message-Id: <20240426145538.654212-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a 64-bit integer control for devices that are passing through CSI-2
(or other) data, to signal the link frequency used by also the upstream
sub-device. The control is volatile and read-only.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
 include/uapi/linux/v4l2-controls.h                           | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index b1c2ab2854af..31d5045f32e7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -55,3 +55,7 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_CUR_LINK_FREQ (64-bit integer)``
+    The current link frequency on a data interface (e.g. parallel or
+    CSI-2). This control is read-only.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..1e8e02818f9f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1163,6 +1163,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_CUR_LINK_FREQ:		return "Link Frequency";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1425,6 +1426,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_LINK_FREQ:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
+	case V4L2_CID_CUR_LINK_FREQ:
+		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
+		*type = V4L2_CTRL_TYPE_INTEGER64;
+		break;
 	case V4L2_CID_RDS_TX_PS_NAME:
 	case V4L2_CID_RDS_TX_RADIO_TEXT:
 	case V4L2_CID_RDS_RX_PS_NAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 99c3f5e99da7..1c63d2e51e8d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1223,6 +1223,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_CUR_LINK_FREQ			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.39.2


