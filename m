Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0375164DCF3
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 15:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiLOOhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 09:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiLOOhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 09:37:46 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016E52E683
        for <linux-media@vger.kernel.org>; Thu, 15 Dec 2022 06:37:43 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFDrVH5022651;
        Thu, 15 Dec 2022 15:37:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=NPc17h2EiCR66RSOZuX4Dr3AW+IgxG3gAf/QaZbOlq4=;
 b=E5ZqIL28SadG6ycb3gG7StV0Q9Ah8ZHez71TbDjANwZ4FlQaKhAnb2ty+tih52mWAEYv
 5s2/M4k5/M64L9cKxMNJHEeOI0qZ2KK3AlhMhdRFaiDtOzeJmyaMPqfNOHLq20yvLaDb
 BCOogyrFA0l5Dcl7DY581gX2p6CY5zqQ3kRfBHxHmyYRfYd+x66XPnJZU0yf9T3sNGnb
 z+HChR0W/P/AA0r9pzalzASUBbQrKz4j1ksN1tmsULCEqPGGpr7by+wrYGTSsxEJqvSi
 CV3GIYFgG//SrIYkjwffEBEOtDH5B2GISzHrlhw/6ozZWoWYlCsG7ajSxMK0egXRF1TC xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6v6kvyy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 15:37:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBDC310002A;
        Thu, 15 Dec 2022 15:37:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C19512291C3;
        Thu, 15 Dec 2022 15:37:36 +0100 (CET)
Received: from localhost (10.252.10.60) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 15 Dec
 2022 15:37:36 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>
CC:     <dave.stevenson@raspberrypi.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v4l-utils] libv4lconvert: Fix v4lconvert_grey_to_rgb24 not taking stride into account
Date:   Thu, 15 Dec 2022 15:37:26 +0100
Message-ID: <20221215143726.59781-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.10.60]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_08,2022-12-15_02,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers are allowed to generate buffers where stride != width. Where as
v4lconvert_grey_to_rgb24() assumed that stride == width is always true.
This resulted in wrong frames for monochrome sensors, with padding bytes
being visible diagonally and messing up the image alignment.

Tested with rasbperry pi unicam driver using strides of 32 paired with
the st-vgxy61 driver, which native resolution is 1944x1204, producing a
frame of 1952x1204.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 lib/libv4lconvert/libv4lconvert-priv.h | 2 +-
 lib/libv4lconvert/libv4lconvert.c      | 2 +-
 lib/libv4lconvert/rgbyuv.c             | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index 00a03f9e..0fd6a102 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -157,7 +157,7 @@ void v4lconvert_swap_uv(const unsigned char *src, unsigned char *dst,
 		const struct v4l2_format *src_fmt);
 
 void v4lconvert_grey_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height);
+		int width, int height, int stride);
 
 void v4lconvert_grey_to_yuv420(const unsigned char *src, unsigned char *dest,
 		const struct v4l2_format *src_fmt);
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index b07bf3ba..201dcf45 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -1245,7 +1245,7 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
 	        case V4L2_PIX_FMT_BGR24:
-			v4lconvert_grey_to_rgb24(src, dest, width, height);
+			v4lconvert_grey_to_rgb24(src, dest, width, height, bytesperline);
 			break;
 		case V4L2_PIX_FMT_YUV420:
 		case V4L2_PIX_FMT_YVU420:
diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
index ce31a1ba..e2dceb3a 100644
--- a/lib/libv4lconvert/rgbyuv.c
+++ b/lib/libv4lconvert/rgbyuv.c
@@ -654,7 +654,7 @@ void v4lconvert_y16_to_yuv420(const unsigned char *src, unsigned char *dest,
 }
 
 void v4lconvert_grey_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height)
+		int width, int height, int stride)
 {
 	int j;
 	while (--height >= 0) {
@@ -664,6 +664,7 @@ void v4lconvert_grey_to_rgb24(const unsigned char *src, unsigned char *dest,
 			*dest++ = *src;
 			src++;
 		}
+		src += stride - width;
 	}
 }
 
-- 
2.25.1

