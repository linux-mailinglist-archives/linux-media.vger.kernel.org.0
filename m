Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B785683CB
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 11:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbiGFJii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 05:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbiGFJi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 05:38:28 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F4E237E2;
        Wed,  6 Jul 2022 02:38:20 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:3a70:988d:42ce:f5cc])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CDFA466019AD;
        Wed,  6 Jul 2022 10:38:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657100299;
        bh=Pc01xd3UxsBg7Fqnq6gTTbtdqkYbng68gmR8BJ3yino=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mZXF72kh1e/lgHSbZffgxW4ZlsJxkUlzI0YLU9cisyA/2AWTL/aDATEdkUZTJ3a0p
         KwezvL+MJJgFFRuhlV6qBJGGiXk5KhD73E3f+6wRm1kATn0nuEV/Bz46ITe9/u6jow
         WzQStR7XAh6vRdw8t7W0uBY5/oF+IuCI3qsDAS34wbZ/Tyg/24DPB3E+QtaAaB0Spo
         NNx0+35hIpC46QWOhgEZ93/8WYfC6i3w+e5vKI6TB3DzPu30gUEMXWMhE1sHd5M52T
         a0ppolZkDydDBDNAbqn4iL9IiEZcJHFSkDSY+bUYwTPybyWmEbtyzvR0YZ9KT6x3EE
         8/4xg/TmpMdIQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v11 12/17] media: uapi: Move the HEVC stateless control type out of staging
Date:   Wed,  6 Jul 2022 11:37:58 +0200
Message-Id: <20220706093803.158810-13-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706093803.158810-1-benjamin.gaignard@collabora.com>
References: <20220706093803.158810-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the HEVC stateless controls types out of staging,
and re-number them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../userspace-api/media/videodev2.h.rst.exceptions         | 5 +++++
 include/media/hevc-ctrls.h                                 | 7 -------
 include/uapi/linux/videodev2.h                             | 6 ++++++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0b91200776f8..2feea4a5a008 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -153,6 +153,11 @@ replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 3a6601a46ced..42d16e8a1050 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -22,13 +22,6 @@
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_BASE + 1017)
 
-/* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
-#define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
-#define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
-#define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
-#define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
-
 enum v4l2_stateless_hevc_decode_mode {
 	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 	V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 37f9f23a67fe..e0d19a6b5bc7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1836,6 +1836,12 @@ enum v4l2_ctrl_type {
 
 	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
 	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
+
+	V4L2_CTRL_TYPE_HEVC_SPS			= 0x0270,
+	V4L2_CTRL_TYPE_HEVC_PPS			= 0x0271,
+	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
+	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
+	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.32.0

