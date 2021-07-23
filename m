Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DD43D395C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhGWKmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 06:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhGWKmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 06:42:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1464AC061575
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 04:22:45 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.103])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7862885;
        Fri, 23 Jul 2021 13:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627039363;
        bh=ftX9QVrpqRPkwwZDC6EZFxog/v2aUTQrh0HjXGjTriY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HniKeMM2nVl6oXfgfmEiZpauI4g5yq4uxYULb+vyxjDhzGa6OgAd5dDOzr6rf9Upq
         2YgxTpFlWjWs/PRwMU4CoUFAM/1/TyEx+JLdpixqCaekBWjI3eeEmefkQpuWSNmVms
         dEazLi1Crkj8nHLOL5EJwRGuWpMKjiPa0tXwy+vw=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/2] media: imx258: Rectify mismatch of VTS value
Date:   Fri, 23 Jul 2021 16:52:32 +0530
Message-Id: <20210723112233.1361319-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The frame_length_lines (0x0340) registers are hard-coded as follows:

- 4208x3118
  frame_length_lines = 0x0c50

- 2104x1560
  frame_length_lines = 0x0638

- 1048x780
  frame_length_lines = 0x034c

The driver exposes the V4L2_CID_VBLANK control in read-only mode and
sets its value to vts_def - height, where vts_def is a mode-dependent
value coming from the supported_modes array. It is set using one of
the following macros defined in the driver:

  #define IMX258_VTS_30FPS                0x0c98
  #define IMX258_VTS_30FPS_2K             0x0638
  #define IMX258_VTS_30FPS_VGA            0x034c

There's a clear mismatch in the value for the full resolution mode i.e.
IMX258_VTS_30FPS. Fix it by rectifying the macro with the value set for
the frame_length_lines register as stated above.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 7ab9e5f9f267..4e695096e5d0 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -23,7 +23,7 @@
 #define IMX258_CHIP_ID			0x0258
 
 /* V_TIMING internal */
-#define IMX258_VTS_30FPS		0x0c98
+#define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
-- 
2.31.1

