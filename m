Return-Path: <linux-media+bounces-27132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE8A47692
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E4416985C
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8F422687B;
	Thu, 27 Feb 2025 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVHD/tJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7C223711;
	Thu, 27 Feb 2025 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740641238; cv=none; b=mq1a3mYUTp9X3EijQbrx2RV13pdLDC7oqqGx/PlbrIytTERaQJ1aq784tNxa66KvbGrLhLv+LN+DATkdg0aLIQSEQtyGZTScvwqWLODEKt/ElzbaTb1fokE8JK3gSINVDqw3jufGSDt3/ZSJxIT+sjlF7dhFIJkinP2zP0RpMDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740641238; c=relaxed/simple;
	bh=QyX6dPknXUFDhgXd0BoGrXLknDOoVWOdr/0ybi7VuEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKZBCULOq9GbF5PC1GZTEaSyIoTM2DGe1At1sTMTNoOdZyjz8OsfxohI65HUoB2GB+ZMMkv3tNKF10kXuJ+tnVp21kduR1StY8Kjp/KsFTTFM86RpAT6FKxaql0ME6/vcI9L6KRuNEkjqTq2cDSzxGQOS3hf6E8HX4HZeUjuBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVHD/tJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58BA1C4CEFB;
	Thu, 27 Feb 2025 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740641238;
	bh=QyX6dPknXUFDhgXd0BoGrXLknDOoVWOdr/0ybi7VuEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sVHD/tJ28LgGcNa0YQ4xNGS7VweM/uRlS8jI6jauMxRL062PVZMs4uFRglv3P0XUb
	 PhS1idWRUK0a9Q0wehvVYKYSyFZpVYJOD3d9CXiSLeU1BX6KXNc7Gq9WJd90TwoEP6
	 wcCMxQjfYM2LMUt42zG8b2ZvN92KJuqGncLAI6PtMXy89zqiNfUPNz/3ZeT60XxZx6
	 LiO2mhUPfEVc0VqN6YzUEgUHPVFXVnAeKyfL8BYbVZSVqHtqXFoR/edq2a7iU7gIUg
	 OqYZyCJNWenBdwwvKlYbYW/hwmbipAnDO/CpTVeVXKnMdLySScV1Ctj6Co1WvuCRXI
	 HNGb39vBog34A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51549C19F2E;
	Thu, 27 Feb 2025 07:27:18 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 27 Feb 2025 15:27:20 +0800
Subject: [PATCH v6 09/10] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-c3isp-v6-9-f72e19084d0d@amlogic.com>
References: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
In-Reply-To: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740641235; l=5017;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=7FATnKwz1IoFP1PmFSR1R8xWDIl5alXZlGEOz2OxGaI=;
 b=zluL4oCjJ/GIUmINuQGLt8qTRnnO7O8VTRTx4mRjT0zsUThLfn/wRt9YB8CEJIB+Yh6tzBK8s
 rHsR7YP51kMARmGOiaL/xl18QrsTMljNjad/gc4x3IyubZUVUHqZvNc
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
index 3cedf8d29be4..b277304ff3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1257,6 +1257,7 @@ M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
 F:	drivers/media/platform/amlogic/c3/isp/
 F:	include/uapi/linux/media/amlogic/
 

-- 
2.48.1



