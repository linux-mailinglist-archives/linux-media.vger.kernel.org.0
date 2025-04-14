Return-Path: <linux-media+bounces-30103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0CA8790C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 391A33A3F8A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E466D269820;
	Mon, 14 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O77euCSm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764D26656D;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616125; cv=none; b=PooA5y3cNxlezizgo1HvGSR1HFsQFlvYt5yLaLrJ3YZWuRi2lQNX5R0eJfPbZ42Pg/nGqXOw/G/ePZ6NaAK7HsfgSjc/I1lGcMSjTqi4Ph4ejw0mZP+AYbDjF+mhmfx0oGu6Jru4GFvdq745hGXiStef8LPGAeSC1vtiHZgyw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616125; c=relaxed/simple;
	bh=0MaAoHDr1CDVzxRbHnM4xxKoKnL4pRQuzw5J94sWokQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hU3+Ukg5RPenWavhC4qle6CZ/wme8BmGwjqhMbAio/PwkQdS1BbLTQV+XOxbEItpo/MZkKMsOvDonr0qC3B/S8NRa+7FxuS3vGiJXPyATWi/QwRY0eGdsXHBDOg0a2lMe618iGKSzLvOETBvp5zWyBCpoHU2/w0yMWKDcRIIm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O77euCSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 341BDC4CEEB;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616125;
	bh=0MaAoHDr1CDVzxRbHnM4xxKoKnL4pRQuzw5J94sWokQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O77euCSmAREmhpoUAxKym+ZkaxPnLhh+0NYJ70gBFAoNJmCZUbO5W2+3JVVVzu3f2
	 99HtQznBa8oyjB88hKVzr7taYL/JNfy1DO22sWjU0s4wLSiWF63j0Tu3HEG3MWmP8F
	 IuSNmoF5S3wjE51gVo4spPcfi73AXnYWkr9b1YRGt4qBDy1TWy5jnkLvZQkTQkZfYD
	 85h3QpBawHX+S39i9gzPfRTR5rl1SQV2o1B1+UtJrB8BYdiDuuNx9DmTNPkB6otz78
	 kqnuoNk2XsUeANKNXLl+tKsxcalsUTMrEJHFkot+wfIaqz2mgb61zHMRNpId/tbaq1
	 /6jMGGTy6AWcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2E5C369B4;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Mon, 14 Apr 2025 15:35:22 +0800
Subject: [PATCH v8 09/10] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-c3isp-v8-9-9f89e537494e@amlogic.com>
References: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
In-Reply-To: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616122; l=5017;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Y2xAhnVamQXsHOplTghUW7N4TKJYgc8KO7h0VyNU8Ic=;
 b=iwduCRUzo7fqoPvWhuk7EjV3FgGZay5Kg4gJBntN91ZU8UKitULf6/7Ih78ZgwWNmG2ZXsDmP
 5jsfwPahesNCNQb5UZaTJSEP8n1bPKU+vaRMxCG851WwU6/tqeTSlmf
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

Add the file 'metafmt-c3-isp.rst' that documents
the meta format of c3-isp.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     | 86 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 88 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 86ffb3bc8ade..bb6876cfc271 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
 .. toctree::
     :maxdepth: 1
 
+    metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
diff --git a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
new file mode 100644
index 000000000000..449b45c2ec24
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+.. _v4l2-meta-fmt-c3isp-stats:
+.. _v4l2-meta-fmt-c3isp-params:
+
+***********************************************************************
+V4L2_META_FMT_C3ISP_STATS ('C3ST'), V4L2_META_FMT_C3ISP_PARAMS ('C3PM')
+***********************************************************************
+
+.. c3_isp_stats_info
+
+3A Statistics
+=============
+
+The C3 ISP can collect different statistics over an input Bayer frame.
+Those statistics are obtained from the "c3-isp-stats" metadata capture video nodes,
+using the :c:type:`v4l2_meta_format` interface.
+They are formatted as described by the :c:type:`c3_isp_stats_info` structure.
+
+The statistics collected are  Auto-white balance,
+Auto-exposure and Auto-focus information.
+
+.. c3_isp_params_cfg
+
+Configuration Parameters
+========================
+
+The configuration parameters are passed to the c3-isp-params metadata output video node,
+using the :c:type:`v4l2_meta_format` interface. Rather than a single struct containing
+sub-structs for each configurable area of the ISP, parameters for the C3-ISP
+are defined as distinct structs or "blocks" which may be added to the data
+member of :c:type:`c3_isp_params_cfg`. Userspace is responsible for
+populating the data member with the blocks that need to be configured by the driver, but
+need not populate it with **all** the blocks, or indeed with any at all if there
+are no configuration changes to make. Populated blocks **must** be consecutive
+in the buffer. To assist both userspace and the driver in identifying the
+blocks each block-specific struct embeds
+:c:type:`c3_isp_params_block_header` as its first member and userspace
+must populate the type member with a value from
+:c:type:`c3_isp_params_block_type`. Once the blocks have been populated
+into the data buffer, the combined size of all populated blocks shall be set in
+the data_size member of :c:type:`c3_isp_params_cfg`. For example:
+
+.. code-block:: c
+
+	struct c3_isp_params_cfg *params =
+		(struct c3_isp_params_cfg *)buffer;
+
+	params->version = C3_ISP_PARAM_BUFFER_V0;
+	params->data_size = 0;
+
+	void *data = (void *)params->data;
+
+	struct c3_isp_params_awb_gains *gains =
+		(struct c3_isp_params_awb_gains *)data;
+
+	gains->header.type = C3_ISP_PARAMS_BLOCK_AWB_GAINS;
+	gains->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
+	gains->header.size = sizeof(struct c3_isp_params_awb_gains);
+
+	gains->gr_gain = 256;
+	gains->r_gain = 256;
+	gains->b_gain = 256;
+	gains->gb_gain = 256;
+
+	data += sizeof(struct c3_isp__params_awb_gains);
+	params->data_size += sizeof(struct c3_isp_params_awb_gains);
+
+	struct c3_isp_params_awb_config *awb_cfg =
+		(struct c3_isp_params_awb_config *)data;
+
+	awb_cfg->header.type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;
+	awb_cfg->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
+	awb_cfg->header.size = sizeof(struct c3_isp_params_awb_config);
+
+	awb_cfg->tap_point = C3_ISP_AWB_STATS_TAP_BEFORE_WB;
+	awb_cfg->satur = 1;
+	awb_cfg->horiz_zones_num = 32;
+	awb_cfg->vert_zones_num = 24;
+
+	params->data_size += sizeof(struct c3_isp_params_awb_config);
+
+Amlogic C3 ISP uAPI data types
+===============================
+
+.. kernel-doc:: include/uapi/linux/media/amlogic/c3-isp-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index f2dbd348b6bb..b2bf9c6cd194 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1260,6 +1260,7 @@ M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
 F:	drivers/media/platform/amlogic/c3/isp/
 F:	include/uapi/linux/media/amlogic/
 

-- 
2.49.0



