Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08674C6EEC
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 15:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237021AbiB1OJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 09:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236987AbiB1OJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 09:09:32 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2977E0A5;
        Mon, 28 Feb 2022 06:08:53 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:82d4:230a:70ff:cde0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A159F1F43AA0;
        Mon, 28 Feb 2022 14:08:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646057332;
        bh=rgaEeqFe00tD1vAZ+inyrGdVSn2E/4mstljxq2OQZQU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GLjjztuneryRlII6JK4OTHkSuxCK4+JczozbbmkSFN0n6pyc6mgjZJy9FZVrT00Ea
         BZPOBm+Ypq4CAzFCzf+EMSMlnIHdeKP1inf6BHFp5B0MC3sarofZf0EJnDrDr5jRMt
         fv/TvjYudRjXeFCoAe1vDm6SmcSqoirTHDFXikXGuy9OoKZ+6fTaKEfy6Hosz58Dqd
         NkpdnbrECa4j+O5shUXQJfSXziQqyyrXFEvNwD8sCI6nfwhePq1/D+hpeKYbSSTalb
         SAgp9mAj2QaSRAP7srrYkYnhzBtkzSVr4hpLo30/kkz1hZSAsS09UyAgnuVpTL1SoE
         Wyg/+m27guZrw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, jonas@kwiboo.se, nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com, knaerzche@gmail.com, jc@kynesim.co.uk,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 09/15] media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
Date:   Mon, 28 Feb 2022 15:08:32 +0100
Message-Id: <20220228140838.622021-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228140838.622021-1-benjamin.gaignard@collabora.com>
References: <20220228140838.622021-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The number of 'entry point offset' could be very variable.
Rather than use a large static array define a v4l2 dynamic array
of U32 (V4L2_CTRL_TYPE_U32).
The number of entry point offsets is reported by the elems field
and in struct v4l2_ctrl_hevc_slice_params.num_entry_point_offsets
field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
Version 4:
- Add num_entry_point_offsets field in  struct v4l2_ctrl_hevc_slice_params
- Fix V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS name
- Initialize control

 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c             |  5 +++++
 include/media/hevc-ctrls.h                            |  5 ++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 91c80964f82f..b2993ac5a041 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2988,6 +2988,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
+    * - __u32
+      - ``num_entry_point_offsets``
+      - Specifies the number of entry point offset syntax elements in the slice header.
     * - __u8
       - ``nal_unit_type``
       - Specifies the coding type of the slice (B, P or I).
@@ -3128,6 +3131,14 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
+``V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (integer)``
+    Specifies entry point offsets in bytes.
+    This control is a dynamically sized array. The number of entry point
+    offsets is reported by the ``elems`` field.
+    This bitstream parameter is defined according to :ref:`hevc`.
+    They are described in section 7.4.7.1 "General slice segment header
+    semantics" of the specification.
+
 ``V4L2_CID_STATELESS_HEVC_SCALING_MATRIX (struct)``
     Specifies the HEVC scaling matrix parameters used for the scaling process
     for transform coefficients.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 4b68cbe23309..48d385b776b1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1180,6 +1180,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
 	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1508,6 +1509,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
 		break;
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:
+		*type = V4L2_CTRL_TYPE_U32;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
 		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
 		break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 6b5849ca247b..1ec29e79cc55 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -20,6 +20,7 @@
 #define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
 #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
+#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_BASE + 1017)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
@@ -302,6 +303,8 @@ struct v4l2_hevc_pred_weight_table {
  *
  * @bit_size: size (in bits) of the current slice data
  * @data_bit_offset: offset (in bits) to the video data in the current slice data
+ * @num_entry_point_offsets: specifies the number of entry point offset syntax
+ *			     elements in the slice header.
  * @nal_unit_type: specifies the coding type of the slice (B, P or I)
  * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the NAL unit
  * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
@@ -344,7 +347,7 @@ struct v4l2_hevc_pred_weight_table {
 struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
-
+	__u32	num_entry_point_offsets;
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
 	__u8	nuh_temporal_id_plus1;
-- 
2.32.0

