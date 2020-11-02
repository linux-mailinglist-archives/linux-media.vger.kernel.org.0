Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0152A36AD
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 23:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgKBWl4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 17:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgKBWl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 17:41:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB81DC0617A6
        for <linux-media@vger.kernel.org>; Mon,  2 Nov 2020 14:41:55 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B68A9E7C;
        Mon,  2 Nov 2020 23:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604356914;
        bh=oyqJcTVT1Q+ibAYS5S61v9iotQT9GFW53+jxWVIbUcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k+mxuiHYljJXRRBemxk8FrkUNk+cLe5zjcKomogAt9GiD2p2WOm7Ao7fhcMGzBTeN
         1l5rKYzlvwyV3/5MAUUR2FgR2/8FVETNFgvOvjxxMk24IZAdkDQxIrtviGJ4Fp8Edu
         8Gyi6REtp+bdsvxAiYel5vGO2a14HwpddbawO1D0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2 02/19] media: videodev2.h: Move HI240 format to vendor-specific section
Date:   Tue,  3 Nov 2020 00:40:45 +0200
Message-Id: <20201102224102.30292-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_PIX_FMT_HI240 is a 8-bit dithered RGB format specific to BTTV. Move
it from the packed YUV formats section where it was misplaced to the
vendor-specific formats section.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/videodev2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4cbc02bd8b72..2d34a9ec293b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -591,7 +591,6 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
-#define V4L2_PIX_FMT_HI240   v4l2_fourcc('H', 'I', '2', '4') /*  8  8-bit color   */
 #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
 
@@ -734,6 +733,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
+#define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
Regards,

Laurent Pinchart

