Return-Path: <linux-media+bounces-16007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974994C5D8
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 22:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7081F2430C
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 20:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B353C1598EC;
	Thu,  8 Aug 2024 20:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HuehiRrT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5131494B5
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723149692; cv=none; b=VtmKSRBorPTkZXozbE4MQ1dCg7zQeN3HlEuY5lZxoPMg2poNXWcnULG+1UfPiuW3SG5M0Cyp53PXjpjD45ao1VF5KJKptTIcuORmIXCyNpg9t5qV54EpSs59vrpXmkiduAHZCKkSdEylmjQVu2FvyhESwjvd7hN24HqJRt7az+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723149692; c=relaxed/simple;
	bh=6Q7gh+AZsUzewYxcZhWBoT9qCJkBdDMjE9+32Hk7qQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJYpu77ed4ZTgDS/tX7UBGGkpLjyHz2FmHshNkIfCiWf5ObaMufGjmCcr7tBgCwKWMo5kwe1e1lCA1ZDK2adwpRnG4xU++jmo+YssMrbrKMk6uPF6Vxdln7rQyz98sPucUBY0fNCQf8Upuiec10nboG4zb2qJbzJppflrOK3gcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HuehiRrT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-118.net.vodafone.it [5.90.52.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61E20124E;
	Thu,  8 Aug 2024 22:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723149627;
	bh=6Q7gh+AZsUzewYxcZhWBoT9qCJkBdDMjE9+32Hk7qQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HuehiRrTjm/Nd/7C9r9bzWoIfQXY07sHFW4ohzaRn37/2iVPjlqFHh2BwnYiKjm/h
	 7s5gE8ir6lkJnr3059aLPaWfOXo3SV91GmpZ7uzL3qs/qevyYJPSlH2vhg3o9u1rzz
	 IglRLmH7n2kPxenT3u2D2y7uAst45Eqs24EmrtXY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v10 02/12] media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
Date: Thu,  8 Aug 2024 22:40:55 +0200
Message-ID: <20240808204106.2461316-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
References: <20240808204106.2461316-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rkisp1 driver stores ISP configuration parameters in the fixed
rkisp1_params_cfg structure. As the members of the structure are part of
the userspace API, the structure layout is immutable and cannot be
extended further. Introducing new parameters or modifying the existing
ones would change the buffer layout and cause breakages in existing
applications.

The allow for future extensions to the ISP parameters, introduce a new
extensible parameters format, with a new format 4CC. Document usage of
the new format in the rkisp1 admin guide.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/rkisp1.rst    | 11 +++-
 .../media/v4l/metafmt-rkisp1.rst              | 57 ++++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
 include/uapi/linux/videodev2.h                |  1 +
 4 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
index 6f14d9561fa5..6c878c71442f 100644
--- a/Documentation/admin-guide/media/rkisp1.rst
+++ b/Documentation/admin-guide/media/rkisp1.rst
@@ -114,11 +114,18 @@ to be applied to the hardware during a video stream, allowing userspace
 to dynamically modify values such as black level, cross talk corrections
 and others.
 
-The buffer format is defined by struct :c:type:`rkisp1_params_cfg`, and
-userspace should set
+The ISP driver supports two different parameters configuration methods, the
+`fixed parameters format` or the `extensible parameters format`.
+
+When using the `fixed parameters` method the buffer format is defined by struct
+:c:type:`rkisp1_params_cfg`, and userspace should set
 :ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-rk-isp1-params>` as the
 dataformat.
 
+When using the `extensible parameters` method the buffer format is defined by
+struct :c:type:`rkisp1_ext_params_cfg`, and userspace should set
+:ref:`V4L2_META_FMT_RK_ISP1_EXT_PARAMS <v4l2-meta-fmt-rk-isp1-ext-params>` as
+the dataformat.
 
 Capturing Video Frames Example
 ==============================
diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
index fa04f00bcd2e..959f6bde8695 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
@@ -1,28 +1,67 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _v4l2-meta-fmt-rk-isp1-params:
-
 .. _v4l2-meta-fmt-rk-isp1-stat-3a:
 
-*****************************************************************************
-V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
-*****************************************************************************
+************************************************************************************************************************
+V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s'), V4L2_META_FMT_RK_ISP1_EXT_PARAMS ('rk1e')
+************************************************************************************************************************
 
+========================
 Configuration parameters
 ========================
 
-The configuration parameters are passed to the
+The configuration of the RkISP1 ISP is performed by userspace by providing
+parameters for the ISP to the driver using the :c:type:`v4l2_meta_format`
+interface.
+
+There are two methods that allow to configure the ISP, the `fixed parameters`
+configuration format and the `extensible parameters` configuration
+format.
+
+.. _v4l2-meta-fmt-rk-isp1-params:
+
+Fixed parameters configuration format
+=====================================
+
+When using the fixed configuration format, parameters are passed to the
 :ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
-the :c:type:`v4l2_meta_format` interface. The buffer contains
-a single instance of the C structure :c:type:`rkisp1_params_cfg` defined in
-``rkisp1-config.h``. So the structure can be obtained from the buffer by:
+the `V4L2_META_FMT_RK_ISP1_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`rkisp1_params_cfg` defined in ``rkisp1-config.h``. So the structure can
+be obtained from the buffer by:
 
 .. code-block:: c
 
 	struct rkisp1_params_cfg *params = (struct rkisp1_params_cfg*) buffer;
 
+This method supports a subset of the ISP features only, new applications should
+use the extensible parameters method.
+
+.. _v4l2-meta-fmt-rk-isp1-ext-params:
+
+Extensible parameters configuration format
+==========================================
+
+When using the extensible configuration format, parameters are passed to the
+:ref:`rkisp1_params <rkisp1_params>` metadata output video node, using
+the `V4L2_META_FMT_RK_ISP1_EXT_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`rkisp1_ext_params_cfg` defined in ``rkisp1-config.h``. The
+:c:type:`rkisp1_ext_params_cfg` structure is designed to allow userspace to
+populate the data buffer with only the configuration data for the ISP blocks it
+intends to configure. The extensible parameters format design allows developers
+to define new block types to support new configuration parameters, and defines a
+versioning scheme so that it can be extended and versioned without breaking
+compatibility with existing applications.
+
+For these reasons, this configuration method is preferred over the `fixed
+parameters` format alternative.
+
 .. rkisp1_stat_buffer
 
+===========================
 3A and histogram statistics
 ===========================
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5eb4d797d259..257d69341953 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1458,6 +1458,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
+	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4e91362da6da..725e86c4bbbd 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -854,6 +854,7 @@ struct v4l2_pix_format {
 /* Vendor specific - used for RK_ISP1 camera sub-system */
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
+#define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
 /* Vendor specific - used for RaspberryPi PiSP */
 #define V4L2_META_FMT_RPI_BE_CFG	v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
-- 
2.45.2


