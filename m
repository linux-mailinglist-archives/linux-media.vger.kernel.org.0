Return-Path: <linux-media+bounces-12182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934348D3B04
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E33FAB27C06
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2971802C6;
	Wed, 29 May 2024 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TuA2HcvC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60073180A92;
	Wed, 29 May 2024 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996590; cv=none; b=KvBywcBX1W3ZlhSL6iRQW7tkuDxMsFR9rAn5lH5myJ09hltgFf4+PEyxlpPuRCdAI8Fb0RV2KHmg/YdmhuZbQu45XzW6IC4/n39GOrAsEpTzaJX5pPpJU4fQElBrJwwi4MAsK5JJ+TXpkf1k5T0HGs3Uc4HS+pPk285N6wcQIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996590; c=relaxed/simple;
	bh=IkfvO15HaTn0N2u4HLoTFNIjbEmbpUy6xdmqh81I+l0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ndnOfzKJv2Co5aY+FshhKf2PQZoIDgtND7maTHH6m5YpeO2bnoIgNxHgUEMrgDX3r9zpGnA7JO27G1d+dLv087EbJzmBX4tqElBwj8iE1geBcATEaSdNSCmr5Um4NQMU9z7eqG7cz94duAbT+AInLm+hGGhxE6zlewFNf3xiSx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TuA2HcvC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFC872F93;
	Wed, 29 May 2024 17:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716996566;
	bh=IkfvO15HaTn0N2u4HLoTFNIjbEmbpUy6xdmqh81I+l0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TuA2HcvCF309lnNCv6/df0lKuwIO47MD3BMEoOPooKhpH5gSN3XFszFrZSdA7s+OS
	 TVLU4HB7/9QQPJPRqio2QloD5gg7MQXcFcPqGkthX9ugOJy33Kgc0PSgnzM+iok7FR
	 AMUvHl3Pgln42c7k0QJOY4Pi5U310/ZbWZ+PL0Us=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	dan.scally@ideasonboard.com
Subject: [PATCH v5 16/16] Documentation: mali-c55: Document the mali-c55 parameter setting
Date: Wed, 29 May 2024 16:28:58 +0100
Message-Id: <20240529152858.183799-17-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529152858.183799-1-dan.scally@ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the mali-c55 parameter setting by expanding the relevant
pages in both admin-guide/ and userspace-api/.

Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- New patch

 Documentation/admin-guide/media/mali-c55.rst  | 19 +++++-
 .../media/v4l/metafmt-arm-mali-c55.rst        | 65 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
index b75437f6e96a..c5e6ac826c99 100644
--- a/Documentation/admin-guide/media/mali-c55.rst
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -380,9 +380,24 @@ the processing flow the statistics can be drawn from::
                        +-------------+   |    +-------------+
                                          +-->  AWB-1
 
-At present all statistics are drawn from the 0th tap point for each algorithm;
+By default all statistics are drawn from the 0th tap point for each algorithm;
 I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
-statistics from AF-0. In the future this will be configurable.
+statistics from AF-0. This is configurable for AEXP and AWB statsistics through
+programming the ISP's parameters.
+
+.. _mali-c55-3a-params:
+
+Programming ISP Parameters
+==========================
+
+The ISP can be programmed with various parameters from userspace to apply to the
+hardware before and during video stream. This allows userspace to dynamically
+change values such as black level, white balance and lens shading gains and so
+on.
+
+The buffer format and how to populate it are described by the
+:ref:`V4L2_META_FMT_MALI_C55_PARAMS <v4l2-meta-fmt-mali-c55-params>` format,
+which should be set as the data format for the `mali-c55 3a params` video node.
 
 References
 ==========
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
index 219a5dd42d70..c359d2c83858 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -1,10 +1,11 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _v4l2-meta-fmt-mali-c55-params:
 .. _v4l2-meta-fmt-mali-c55-3a-stats:
 
-****************************************
-V4L2_META_FMT_MALI_C55_3A_STATS ('C55S')
-****************************************
+********************************************************************************
+V4L2_META_FMT_MALI_C55_3A_STATS ('C55S'), V4L2_META_FMT_MALI_C55_PARAMS ('C55P')
+********************************************************************************
 
 3A Statistics
 =============
@@ -22,6 +23,64 @@ of the C structure :c:type:`mali_c55_stats_buffer` defined in
 
 For details of the statistics see :c:type:`mali_c55_stats_buffer`.
 
+Configuration Parameters
+========================
+
+The configuration parameters are passed to the
+:ref:`mali-c55 3a params <mali-c55-3a-params>` metadata output video node, using
+the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
+sub-structs for each configurable area of the ISP, parameters for the Mali-C55
+are defined as distinct structs or "blocks" which may be added to the data
+member of struct mali_c55_params_buffer. Userspace is responsible for populating
+the data member with the blocks that need to be configured by the driver, but
+need not populate it with **all** the blocks, or indeed with any at all if there
+are no configuration changes to make. Populated blocks **must** be consecutive
+in the buffer. To assist both userspace and the driver in identifying the
+blocks each block-specific struct should embed
+struct mali_c55_params_block_header as its first member and userspace must
+populate the type member with a value from enum mali_c55_param_block_type. Once
+the blocks have been populated into the data buffer, the combined size of all
+populated blocks should be set in the total_size member of
+struct mali_c55_params_buffer. For example:
+
+.. code-block:: c
+
+	struct mali_c55_params_buffer *params =
+		(struct mali_c55_params_buffer *)buffer;
+
+	params->version = MALI_C55_PARAM_BUFFER_V0;
+
+	void *data = (void *)params->data;
+
+	struct mali_c55_params_awb_gains *gains =
+		(struct mali_c55_params_awb_gains *)data;
+
+	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
+	gains->header.enabled = true;
+	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
+
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+
+	data += sizeof(struct mali_c55_params_awb_gains)
+
+	struct mali_c55_params_sensor_off_preshading *blc =
+		(struct mali_c55_params_sensor_off_preshading *)data;
+
+	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
+	blc->header.enabled = true;
+	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
+
+	blc->chan00 = 51200;
+	blc->chan01 = 51200;
+	blc->chan10 = 51200;
+	blc->chan11 = 51200;
+
+	params->total_size = sizeof(struct mali_c55_params_awb_gains) +
+			     sizeof(struct mali_c55_params_sensor_off_preshading);
+
 Arm Mali-C55 uAPI data types
 ============================
 
-- 
2.34.1


