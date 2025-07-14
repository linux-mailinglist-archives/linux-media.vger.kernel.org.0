Return-Path: <linux-media+bounces-37672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB3B0431B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C9917B592F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCF0260565;
	Mon, 14 Jul 2025 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OYtCOTTj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7625A640;
	Mon, 14 Jul 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505645; cv=none; b=eDhsL6fkEby9m5fxTtSL0yX5zNk/2rv5ZVlfPpRy1hheObyo4QphZWcFD60zGglBvE/VFY/wOFjkfmo6nsRlhp9SyZfFZV65bTFRXEi3pQdyRjc85bEtsxZPWhFs76Lzdm9W2RPsrS4T53qTdeRGQ5TX7i025EpgVaVzabWxySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505645; c=relaxed/simple;
	bh=gnnIsYI0vNT48MJLYko6Y7wwtbQ725ILEob/XY0pCCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Unn0JUsQR8ez+qW6PUDvmL4n5sjfYxP3vkBX5z0iHnNlzjzVdSQF20Tk7/CEfozu6pladRu4dGZrn33bXMChbg+sjuLFF96PPhfO7byHLh9+ARiesnkvrWodQyAdp3GJCjdRFF2O8S+0gIkXJBxh0gM1ZPHM7G7F3LRZcIPZZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OYtCOTTj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87BD15553;
	Mon, 14 Jul 2025 17:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505586;
	bh=gnnIsYI0vNT48MJLYko6Y7wwtbQ725ILEob/XY0pCCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OYtCOTTjneQTHfqtBoY0E8+dkrleW6a7ZWjFN0WzR6hHOvuQk3v810q3PNl6UCen5
	 eP0qqApzbIpuwLAiRGk/rhQfrSiHN5nQMsRC+Jqnl/v8m2OaVuLuLiUREDXOTREr3d
	 kSjAMQfEE+E0JhK4KEC08znVbPcXsvUfJKJH9gt8=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:45 +0100
Subject: [PATCH v11 19/19] Documentation: mali-c55: Document the mali-c55
 parameter setting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-19-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6137;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=gnnIsYI0vNT48MJLYko6Y7wwtbQ725ILEob/XY0pCCg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0DEqDwC9LpataxJm9CPT3z2A6qU2OG8ZUO8
 +OvoHBECKKJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAwAKCRDISVd6bEV1
 Moo1D/4qboYi8h8jx1Gn6wHvlMw/QYIeeTfsaeHubj96dICr+M2VaXh9+/6qwLyv0xda35s2wFk
 Q6CQCjW4W45KCyjt6/MGlWLcbR89OGJ0A0N5NPjPyHL6n35hflP/a9pRRahCzgpeK1+HJY18mWx
 6jwBEkSYUWGXueDZDYOLQTuz5JTL5O0yu9KnYQCcTX2i7NQbfCT4KUkaGe3YlTOFu+3hWKXg0IZ
 M8luGFhn15Qe1gfr8PXRBGIbGsHrqGIJCM2jzNJYjePOReeVYYasPahkJN9s/nFcsiysERpqpUs
 nTY0aofB7CWAuzL1g4LnnCfthlW3TsypxKlVM3ANw3NVh/A1nPVIEvuuY2gx6O+u+YJ5+g/owmP
 FqQ/01Vk5S9lgxO8QJ0nEVyUALtFj1dvUJqRqdDrhdoffM2ZD5eMRcitJdgM/IrYv96oj+/kl9z
 6SRv3n3u8k59qu4Ag39roDXZelIOwBlpyuOpzLnrifg42QsU10tuWqKpt43ezYxjqgugayqHQZB
 zQGRYBt/f/rlk7K+L2lHOBQ+xlPPXaJH3xN38WdKekkT4ez5lKbXl6tBoPcW90cpbGf+YhEi5ba
 cV7oBUnc/0hHbXkKV6tRnNvKdu2jh3NB4MDw2AALWpIdMc4N5Qc3JHngFeo6SV4sOrXp+DxFkpd
 g5ZjjncYsiVShcw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Document the mali-c55 parameter setting by expanding the relevant
pages in both admin-guide/ and userspace-api/.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v11:

	- Updated the documentation to account for the use of the
	  V4L2 extensible params

Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v7:

	- None

Changes in v6:

	- Minor rewording

Changes in v5:

	- New patch
---
 Documentation/admin-guide/media/mali-c55.rst       | 19 ++++++-
 .../media/v4l/metafmt-arm-mali-c55.rst             | 66 +++++++++++++++++++++-
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
index 7eaeac63ddf713730fac266d81866539310cc7e2..dbed5179d5f84fb69465beee9281ac9fb572a37f 100644
--- a/Documentation/admin-guide/media/mali-c55.rst
+++ b/Documentation/admin-guide/media/mali-c55.rst
@@ -387,9 +387,24 @@ the processing flow the statistics can be drawn from::
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
index 186e0deb9ece70ab1d2b22bb5ccb69196264a793..f21f4f8cff49874821cea7d9ad8d6a41e57d6ff8 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
@@ -1,10 +1,11 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _v4l2-meta-fmt-mali-c55-params:
 .. _v4l2-meta-fmt-mali-c55-3a-stats:
 
-*************************************
-V4L2_META_FMT_MALI_C55_STATS ('C55S')
-*************************************
+*****************************************************************************
+V4L2_META_FMT_MALI_C55_STATS ('C55S'), V4L2_META_FMT_MALI_C55_PARAMS ('C55P')
+*****************************************************************************
 
 3A Statistics
 =============
@@ -23,6 +24,65 @@ of the C structure :c:type:`mali_c55_stats_buffer` defined in
 
 For details of the statistics see :c:type:`mali_c55_stats_buffer`.
 
+Configuration Parameters
+========================
+
+The configuration parameters are passed to the
+:ref:`mali-c55 3a params <mali-c55-3a-params>` metadata output video node, using
+the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
+sub-structs for each configurable area of the ISP, parameters for the Mali-C55
+use the V4L2 extensible parameters system, through which groups of parameters
+are defined as distinct structs or "blocks" which may be added to the data
+member of :c:type:`v4l2_params_buffer`. Userspace is responsible for populating
+the data member with the blocks that need to be configured by the driver, but
+need not populate it with **all** the blocks, or indeed with any at all if there
+are no configuration changes to make. Populated blocks **must** be consecutive
+in the buffer. To assist both userspace and the driver in identifying the
+blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
+its first member and userspace must populate the type member with a value from
+:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
+into the data buffer, the combined size of all populated blocks shall be set in
+the data_size member of :c:type:`v4l2_params_buffer`. For example:
+
+.. code-block:: c
+
+	struct v4l2_params_buffer *params =
+		(struct v4l2_params_buffer *)buffer;
+
+	params->version = MALI_C55_PARAM_BUFFER_V1;
+	params->data_size = 0;
+
+	void *data = (void *)params->data;
+
+	struct mali_c55_params_awb_gains *gains =
+		(struct mali_c55_params_awb_gains *)data;
+
+	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
+	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
+	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
+
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+	gains->gain00 = 256;
+
+	data += sizeof(struct mali_c55_params_awb_gains);
+	params->data_size += sizeof(struct mali_c55_params_awb_gains);
+
+	struct mali_c55_params_sensor_off_preshading *blc =
+		(struct mali_c55_params_sensor_off_preshading *)data;
+
+	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
+	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
+	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
+
+	blc->chan00 = 51200;
+	blc->chan01 = 51200;
+	blc->chan10 = 51200;
+	blc->chan11 = 51200;
+
+	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
+
 Arm Mali-C55 uAPI data types
 ============================
 

-- 
2.34.1


