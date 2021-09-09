Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06EC40535F
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 14:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344016AbhIIMvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 08:51:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:57490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355438AbhIIMpo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Sep 2021 08:45:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76E9C63213;
        Thu,  9 Sep 2021 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188569;
        bh=uAbR59EJyY356MSmfgpeGTVaI69N2/xc0UlG7WwyYPs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S/jl/xUa5KVCnjfHguDItj0P10B2ubFX8zUf7gJOIUjyEEKNyQ0fapi3TqeFsYwEt
         8oNe35H9Uo/oHggincw4kQxlrGbCPyBtILlXDntc9OrqkgaONyP8buUTQWQ10DZpd8
         mBxfXwQpy+vE5ENCfUFkHg6j47hoq6ct2TpD8HM1QkdXGB84ZKySAoQy3sV8micZX5
         OskpJXGdRwR5glPqFwQPkEER+P51mZ4KnSl8E8wxVs8GXH4g+1POnll7h1VbSoVtzd
         LuFCMraUHDMtUe5iT2r5DbQl2IPW8ZnA4AoXYKNkLkY9ir07RgRhAZFdRFe7hWQI1N
         2GRSBseRd31cg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 049/109] media: imx258: Rectify mismatch of VTS value
Date:   Thu,  9 Sep 2021 07:54:06 -0400
Message-Id: <20210909115507.147917-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit 51f93add3669f1b1f540de1cf397815afbd4c756 ]

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
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index f86ae18bc104..5f5e50c01b12 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -22,7 +22,7 @@
 #define IMX258_CHIP_ID			0x0258
 
 /* V_TIMING internal */
-#define IMX258_VTS_30FPS		0x0c98
+#define IMX258_VTS_30FPS		0x0c50
 #define IMX258_VTS_30FPS_2K		0x0638
 #define IMX258_VTS_30FPS_VGA		0x034c
 #define IMX258_VTS_MAX			0xffff
-- 
2.30.2

