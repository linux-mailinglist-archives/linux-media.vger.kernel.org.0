Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA0D3D395D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhGWKmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 06:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhGWKmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 06:42:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F895C061575
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 04:22:49 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.103])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 433C056B;
        Fri, 23 Jul 2021 13:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627039368;
        bh=CC5F2wiPZj5TjrGGlK+tG8+gcD3f2SeeVIW/I7P3EAs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g4ioskTVdaAACAtzmm2tIo74/tcSijJQrUgypfgEyr40hpCoOdTA3HrmIcyU0mQIp
         QLH6GMdFWXKBL08KV32A6hz7t7R3eZqNi6Wn+2OpuBVuTUSv/vYQSdKy6u0hy2ja5i
         +XvOHvg2kOvjKp3t0loGVE1+ttlk5x/Jk9rcBVZI=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 2/2] media: imx258: Limit the max analogue gain to 480
Date:   Fri, 23 Jul 2021 16:52:33 +0530
Message-Id: <20210723112233.1361319-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
References: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The range for analog gain mentioned in the datasheet is [0, 480].
The real gain formula mentioned in the datasheet is:

	Gain = 512 / (512 – X)

Hence, values larger than 511 clearly makes no sense. The gain
register field is also documented to be of 9-bits in the datasheet.

Certainly, it is enough to infer that, the kernel driver currently
advertises an arbitrary analog gain max. Fix it by rectifying the
value as per the data sheet i.e. 480.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 4e695096e5d0..81cdf37216ca 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -47,7 +47,7 @@
 /* Analog gain control */
 #define IMX258_REG_ANALOG_GAIN		0x0204
 #define IMX258_ANA_GAIN_MIN		0
-#define IMX258_ANA_GAIN_MAX		0x1fff
+#define IMX258_ANA_GAIN_MAX		480
 #define IMX258_ANA_GAIN_STEP		1
 #define IMX258_ANA_GAIN_DEFAULT		0x0
 
-- 
2.31.1

