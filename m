Return-Path: <linux-media+bounces-35757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33990AE6255
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA4C7B33B1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C3028DF01;
	Tue, 24 Jun 2025 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CuNN/IhA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4828641D;
	Tue, 24 Jun 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760527; cv=none; b=kTvTszA6ej/GPWkbRah6Iscu6i5uA7EtsSTBylFCx/rytlmelHtGkqNK9TPbqInlMJLI0Q0XKYPDaKnmyTnn04IZGzVKKAMZFXsV0hXP+C/tLJbWVT7Vr1NkHQ/RFwI1xlb/mzSS0wkAjwxBd1xo/JWUK/4x267xvBy4lht5wOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760527; c=relaxed/simple;
	bh=78SHuabwJC0MB33M+eSr2NzmoxNFbkmC9aWc6MH/qAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZ413Gd97S+ENrNDPUmwH8jV7qyM7Oicq7DCXUQiQQ85D3/ya/38QXkT4e3IoQ6fxdZNa+nDa6HHhRJhcYV2l4M059Ht1eARYHN5GolGF2BuYQLFjpgg4CcHZElv+WBicmU22ArXSsDmiPEMs42OyJSV/D8OownWJFk4JSHoWts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CuNN/IhA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB8CB741;
	Tue, 24 Jun 2025 12:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760485;
	bh=78SHuabwJC0MB33M+eSr2NzmoxNFbkmC9aWc6MH/qAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CuNN/IhAcS7jF8KBuGikXpd68Xn3GyBo0XYuMSwxVbc26FRjROghDh1ir5rGDalaq
	 g78jSFg93+VyZSiUwswZikHfPTaxi3lOFoncJnbnF6lvvFbmU2LB/ZzaWrbRQqlKov
	 DlLzt8fxgTUmQc90Jc5iT9zJz9d9cQzhZoyXDtyo=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:30 +0100
Subject: [PATCH v10 17/17] Documentation: mali-c55: Document the mali-c55
 parameter setting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-17-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5930;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=78SHuabwJC0MB33M+eSr2NzmoxNFbkmC9aWc6MH/qAE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwqNvj6rLxsM7RK1g8Z2qsVrGKGuhq14CA6T
 pLsLHPjDRGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KgAKCRDISVd6bEV1
 MmwKD/4kzdDTK5VEoJBER8OxlKDe4obprRL3PbcvgglHmNtHasVln0xq0XaEzlu8gts1v4VyOz4
 eXFB86VbtGPE0Qj6h+Tug5TnWIqUJDIWZpcCroGg11xzs4D3fHEfp7LCZHbZPXV+9rSlj2HI26g
 9EmbxrUWdfT/fp4Dn5MvZHGGQuSlX4usGAcvNAYWewEmWm2xCHii6PWpGYhGhiMEDZwyWwYA+Us
 f8qrrpYFghIkkwkldS7s8KOHmh6D2MDkyoPZhkJ9h6Qdhj7ULhivQLaPtoPVUAhYrHZV5xsCejK
 aQwjaZgcItMT+Nc4POcGqm5Mv+4OngdsWgWAalBWfiKXXb82hqvd42mwtpZM6dGFNKHcK94BvVb
 +Fu3btKflxtuyDp+4Qs/XvuHp40L1o03GpTFMi/+rOFGledIzgil3LK0nY1k5AUQlxNWFL7Mi26
 DnK6gYFjdc+0n1f4N/gH5B++AsVnuPPMcBa0ZCjo1gwBYuvPPLCpJtF9LIDhqJH05KSGOohIwgr
 ATqFCw7qIfSOS1Ur9RHepmqkn0H+5PKUmzdZMAvJY48CLp6GlmY30jBaeRzRqIblxOHEy8am/pe
 vsCqZp/JwHFQvLm6a/yG8V+iQyp5ndkNsPspXSC3jcnlqAdg54AhoDu/E5YyGDfKxe9v0cFfg1E
 dzFyGVTGaywJ8rw==
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
index 186e0deb9ece70ab1d2b22bb5ccb69196264a793..c0948b41fb0c18ddbef80285e2990f5d156a51ac 100644
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
+are defined as distinct structs or "blocks" which may be added to the data
+member of :c:type:`mali_c55_params_buffer`. Userspace is responsible for
+populating the data member with the blocks that need to be configured by the driver, but
+need not populate it with **all** the blocks, or indeed with any at all if there
+are no configuration changes to make. Populated blocks **must** be consecutive
+in the buffer. To assist both userspace and the driver in identifying the
+blocks each block-specific struct embeds
+:c:type:`mali_c55_params_block_header` as its first member and userspace
+must populate the type member with a value from
+:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
+into the data buffer, the combined size of all populated blocks shall be set in
+the total_size member of :c:type:`mali_c55_params_buffer`. For example:
+
+.. code-block:: c
+
+	struct mali_c55_params_buffer *params =
+		(struct mali_c55_params_buffer *)buffer;
+
+	params->version = MALI_C55_PARAM_BUFFER_V1;
+	params->total_size = 0;
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
+	data += sizeof(struct mali_c55_params_awb_gains);
+	params->total_size += sizeof(struct mali_c55_params_awb_gains);
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
+	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
+
 Arm Mali-C55 uAPI data types
 ============================
 

-- 
2.34.1


