Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322874CBF94
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbiCCOLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbiCCOLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:20 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCA118CC13
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:34 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so3314629wms.4
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Lt7lw1VwVwd56j2eIX/8bxjWp7pJt5XpEq+8nm66ns=;
        b=Q5eHdkuMo4R5Zo+cX7S3OKOkasEDYvGdJKdMOb0HWpQ83B2DUejHJc7ph3KK67a7t0
         QDxR00Kp+NvUrE8cEz4dYOqsRkMgq3ToD5UY3KEfLo/nUEJdIUrqqymJqLEsxOAeVBIT
         f77pA54TPdeJiOjd2W015qSUbRMookHGeL2+Yf8cxXYUPYgUeS6URTwcP1LVAQLWViEi
         aqNm3UqbcAefasUJbWyqCVrcXId6B4fTjhFfv9OOwNQIVbrOazBBYbGiFmah7kKlhN/8
         ZQOCXTjGnb59CMTIvNFyRBw7jqEnJYmNL65st9GOWTfAdqBTHUbf5fuhbwlf0xGO0Wh5
         V4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Lt7lw1VwVwd56j2eIX/8bxjWp7pJt5XpEq+8nm66ns=;
        b=4W+ep6vpDo0OekcXZf2+m2aTWbU+NSOR0WhkZzVUWq66v7Td76xnEruc7GN6zRn+5D
         Chu5k4ARQGpBw+de0fVB+94U3QZRSINMWKKOzy0JqBdmBO2By9vpm1528Hz63scFrj8F
         u5beq9gXQMD4JcmJ6dC/Plx5/eTYNw7wuW+uvkSwCGxSfHeHiv4wZE+1bFqkbBHHd6Nz
         jhr4sElqV6bgKcfMT6CwqBGqxXH/aEKOQKZrXW3DAnHTeCu2dCimPZW5Rdcljj6lPTFZ
         glREWF5V5D13KbtIxXACuTG37EJv4RJVOVzhrs1vkKi+NGEJwL5e34HUj4domwhze7B1
         KEMQ==
X-Gm-Message-State: AOAM531yCvZUbfZ2UMgJPrxnSKKWMA05WM5IhKxrUrtjIN6kXsWwza9L
        FRy2sPWsUh9Yd4dxT99dr9Ep0LOw1m4LbcuL
X-Google-Smtp-Source: ABdhPJxyiy3vznTB/KT1lmPlGYFEuqhGZqj+TIcX6KCU3o1a6482fbYVSu4H7qZfTACOSO8bHDsjAw==
X-Received: by 2002:a05:600c:2e07:b0:387:aeab:93da with SMTP id o7-20020a05600c2e0700b00387aeab93damr2848238wmf.186.1646316632655;
        Thu, 03 Mar 2022 06:10:32 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:32 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 2/6] v4l: Add HEIF control class and control IDs
Date:   Thu,  3 Mar 2022 16:10:06 +0200
Message-Id: <20220303141010.573408-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
References: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-heif.rst              | 47 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 10 ++++
 include/uapi/linux/v4l2-controls.h            |  9 ++++
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-heif.rst

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-heif.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-heif.rst
new file mode 100644
index 000000000000..e2a7f45a3821
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-heif.rst
@@ -0,0 +1,47 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _heif-controls:
+
+**********************
+HEIF Control Reference
+**********************
+
+The HEIF (High Efficiency Image File Format) class includes controls for
+common features of HEIF encoders.
+
+.. _heif-control-id:
+
+HEIF Control IDs
+================
+
+``V4L2_CID_HEIF_CLASS (class)``
+    The HEIF class descriptor. Calling :ref:`VIDIOC_QUERYCTRL` for this
+    control will return a description of this control class.
+
+.. _heif-hevc-grid-controls:
+
+The following controls are used to describe the parameters for derived
+image item of type 'grid'. The encoded input image will be divided on
+NxM grids with grid_width by grid_height pixels. The input width and
+height will satisfy the following equation:
+
+grid_width  * grid_columns >= input_image_width
+grid_height * grid_rows    >= input_image_height
+
+All grids shall have the same grid_width and grid_height.
+
+``V4L2_CID_HEIF_HEVC_GRID_WIDTH (integer)``
+    Specify the grid width in pixels.
+
+``V4L2_CID_HEIF_HEVC_GRID_HEIGHT (integer)``
+    Specify the grid height in pixels.
+
+``V4L2_CID_HEIF_HEVC_GRID_ROWS (integer)``
+    Specify the number of grid rows. If client sets grid rows and columns to 1,
+    no image division will be applied.
+
+``V4L2_CID_HEIF_HEVC_GRID_COLUMNS (integer)``
+    Specify the number of grid columns. If client sets grid rows and columns to 1,
+    no image division will be applied.
+
+For more details about HEIF specification, refer to ISO/IEC 23008-12:2017.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 54ca4e6b820b..31d05fac9dac 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1186,6 +1186,15 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
+
+	/* HEIF controls */
+	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
+	case V4L2_CID_HEIF_CLASS:		return "HEIF Controls";
+	case V4L2_CID_HEIF_HEVC_GRID_WIDTH:	return "HEIF HEVC Grid Width";
+	case V4L2_CID_HEIF_HEVC_GRID_HEIGHT:	return "HEIF HEVC Grid Height";
+	case V4L2_CID_HEIF_HEVC_GRID_ROWS:	return "HEIF HEVC Grid Rows";
+	case V4L2_CID_HEIF_HEVC_GRID_COLUMNS:	return "HEIF HEVC Grid Columns";
+
 	default:
 		return NULL;
 	}
@@ -1391,6 +1400,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
 	case V4L2_CID_COLORIMETRY_CLASS:
+	case V4L2_CID_HEIF_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c8e0f84d204d..45a3b399272c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -68,6 +68,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_HEIF		0x00a60000	/* HEIF controls */
 
 /* User-class control IDs */
 
@@ -2302,6 +2303,14 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 	struct v4l2_vp9_mv_probs mv;
 };
 
+#define V4L2_CID_HEIF_CLASS_BASE	(V4L2_CTRL_CLASS_HEIF | 0x900)
+#define V4L2_CID_HEIF_CLASS		(V4L2_CTRL_CLASS_HEIF | 1)
+
+#define V4L2_CID_HEIF_HEVC_GRID_WIDTH	(V4L2_CID_HEIF_CLASS_BASE + 0)
+#define V4L2_CID_HEIF_HEVC_GRID_HEIGHT	(V4L2_CID_HEIF_CLASS_BASE + 1)
+#define V4L2_CID_HEIF_HEVC_GRID_ROWS	(V4L2_CID_HEIF_CLASS_BASE + 2)
+#define V4L2_CID_HEIF_HEVC_GRID_COLUMNS	(V4L2_CID_HEIF_CLASS_BASE + 3)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.25.1

