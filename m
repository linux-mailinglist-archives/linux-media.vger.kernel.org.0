Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3F32D8977
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 19:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407755AbgLLSyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 13:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407746AbgLLSxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 13:53:53 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EFAC0613CF
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 10:53:13 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id c5so8731029wrp.6
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 10:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AT01McFudqUEsfkKXyhaxknAwkxbZsk2WQMqggwTf7A=;
        b=Ng2d0jgsQTi44XzdNEKp4phNYuj9JZj6j3Ayg+ih86p20Tm2eOOvHSmD3wEHSuSwl6
         urVpwLNT4t9aMN9+8Q8vNspVP7Ia2bi2AESQuScWcLguyDhxFx58nphFOrky9oNnDLuJ
         pceL4ZQYtlImP9ZsEkXsm82PX73SZMcKtxLaYQbsi6nDCdAb60l/ZL1ka/tXA8QqrS7H
         /JPnXENgGqFYE/UUSoO0p/P7hInlTRUVOJTKCb05HDunbQsyTQU5ObKQXp+f2ys8+OTd
         HufAPGZhmfFb/tCzYLXzDhRl9kgUz2TOt/2d4vkuaETttn4dNYsinokNbmeP07F1rnQ+
         rrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AT01McFudqUEsfkKXyhaxknAwkxbZsk2WQMqggwTf7A=;
        b=BXusuI8hOrM8n+DSrE3V5abWNzd1SrHhVuj+lD//doQgtUc+x9TQPFxs22/j2gRwP/
         5wjFT9ZKF7cOveDGRpI6OFotPq/Rb9/x2cGsRqkgav918eZ1QWbmLTLYT1dIICFNYkAD
         4VINK4fH18qnXoYnvbj1CjOzKRozHWYSGxGVv8ITS6IGQsBeteLGmOspacB0xdWs4cTI
         KD+NKAvOuCmT4xXY1iIW6goiXGX1whopy2jAh+SzMHYkf7ZxLmA6udhgzhFeql0pBpZe
         c9keLohEz8k8+hV206WiF2kef30b5eOT+plNfjrd7WbTW/NbCbfaKb79AfOKK28ac7UW
         1yyQ==
X-Gm-Message-State: AOAM532BjqGGXGfI+eFESU7oTmCkDOQHjt2rszozZSiA7MrgtSI0Bl75
        3y6nDfnqXjUQ+Usjh05HQ+Fbt5XYNx4=
X-Google-Smtp-Source: ABdhPJyC3Ac/wF+l6xmfulwoBloHfPfbcSztAe8g1+P4l+YLV7j+DOTve2/6UBGYFYz6J4bq5cNHNg==
X-Received: by 2002:adf:f681:: with SMTP id v1mr18286589wrp.133.1607799191479;
        Sat, 12 Dec 2020 10:53:11 -0800 (PST)
Received: from basti.fritz.box (p200300d1ff2b87001ee3808dd84ca8e7.dip0.t-ipconnect.de. [2003:d1:ff2b:8700:1ee3:808d:d84c:a8e7])
        by smtp.gmail.com with ESMTPSA id 65sm21642986wri.95.2020.12.12.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 10:53:11 -0800 (PST)
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        sebastian.fricke.linux@gmail.com
Subject: [PATCH v3] media: rkisp1: isp: Add the enum_frame_size ioctl
Date:   Sat, 12 Dec 2020 19:53:06 +0100
Message-Id: <20201212185306.19135-1-sebastian.fricke.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl for the isp entity,
check if the mbus code is valid for the given pad.
This call is not available for the parameter or metadata pads of the RkISP1.

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---

v1: https://patchwork.kernel.org/project/linux-media/patch/20201206053935.24028-1-sebastian.fricke.linux@gmail.com/
v2: https://patchwork.kernel.org/project/linux-media/patch/20201207184358.3793-1-sebastian.fricke.linux@gmail.com/ 

Changes since v2:
    - Change the return code for the parameter and metadata pads to -ENOTTY instead of -EINVAL
      as this reports that the pad doesn't support the ioctl
    - Highlight more clearly that this patch is for the isp entity of the rkisp1, within the commit description
      as well as in the commit title
    - Add the correct v4l2-complience output to the patch mail

Changes since v1:
    - Replace the custom bus code check with the `rkisp1_isp_mbus_info_get`
      function
    - Add a missing line break above the function

I have tested this patch with the following script:
http://paste.debian.net/1176614/

The results on my NanoPC-T4 (Linux nanopct4 5.10.0-rc6-rockchip64):

pad 0 = RKISP1_ISP_PAD_SINK_VIDEO
pad 1 = RKISP1_ISP_PAD_SINK_PARAMS
pad 2 = RKISP1_ISP_PAD_SOURCE_VIDEO
pad 3 = RKISP1_ISP_PAD_SOURCE_STATS

basti@nanopct4:~$ python3 rkisp1_enum_frame_size_test.py
TEST  0: pad 0 - code 0x300f - size 32x32 - 4032x3024
TEST  1: pad 0 - code 0x3007 - size 32x32 - 4032x3024
TEST  2: pad 0 - code 0x300e - size 32x32 - 4032x3024
TEST  3: pad 0 - code 0x300a - size 32x32 - 4032x3024
TEST  4: pad 0 - code 0x3012 - size 32x32 - 4032x3024
TEST  5: pad 0 - code 0x3008 - size 32x32 - 4032x3024
TEST  6: pad 0 - code 0x3010 - size 32x32 - 4032x3024
TEST  7: pad 0 - code 0x3011 - size 32x32 - 4032x3024
TEST  8: pad 0 - code 0x3014 - size 32x32 - 4032x3024
TEST  9: pad 0 - code 0x3001 - size 32x32 - 4032x3024
TEST 10: pad 0 - code 0x3013 - size 32x32 - 4032x3024
TEST 11: pad 0 - code 0x3002 - size 32x32 - 4032x3024
TEST 12: pad 0 - code 0x2011 - size 32x32 - 4032x3024
TEST 13: pad 0 - code 0x2012 - size 32x32 - 4032x3024
TEST 14: pad 0 - code 0x200f - size 32x32 - 4032x3024
TEST 15: pad 0 - code 0x2010 - size 32x32 - 4032x3024
TEST 16: pad 1 - code 0x7001 - size /
TEST 17: pad 2 - code 0x2008 - size 32x32 - 4032x3024
TEST 18: pad 2 - code 0x300f - size 32x32 - 4032x3024
TEST 19: pad 2 - code 0x3007 - size 32x32 - 4032x3024
TEST 20: pad 2 - code 0x300e - size 32x32 - 4032x3024
TEST 21: pad 2 - code 0x300a - size 32x32 - 4032x3024
TEST 22: pad 2 - code 0x3012 - size 32x32 - 4032x3024
TEST 23: pad 2 - code 0x3008 - size 32x32 - 4032x3024
TEST 24: pad 2 - code 0x3010 - size 32x32 - 4032x3024
TEST 25: pad 2 - code 0x3011 - size 32x32 - 4032x3024
TEST 26: pad 2 - code 0x3014 - size 32x32 - 4032x3024
TEST 27: pad 2 - code 0x3001 - size 32x32 - 4032x3024
TEST 28: pad 2 - code 0x3013 - size 32x32 - 4032x3024
TEST 29: pad 2 - code 0x3002 - size 32x32 - 4032x3024
TEST 30: pad 3 - code 0x7001 - size /
TEST 31: pad 0 - code 0xdead - size / (test with an invalid media bus code)
TEST 32: pad 6 - code 0x300f - size / (test with an invalid pad)
TEST 33: pad 0 - code 0x2008 - size / (test with a format that is not supported by the pad)
TEST 34: pad 2 - code 0x2010 - size / (test with a format that is not supported by the pad)

And here is the output from `v4l2-compliance --device /dev/v4l-subdev0`:
Media Driver Info:
	Driver name      : rkisp1
...
	Name             : rkisp1_isp

...

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
    ...

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
    ...

Sub-Device ioctls (Source Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
    ...

Sub-Device ioctls (Source Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(303): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(348): checkMBusFrameFmt(node, fmt.format)
    ...
...
As reported by Dafna Hirschfeld from v2 the errors on pad 1 & 3 are caused by a
problem within v4l2-utils.

---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 889982d8ca41..2e5b57e3aedc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -600,6 +600,39 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct rkisp1_isp_mbus_info *mbus_info;
+
+	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
+	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
+		return -ENOTTY;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	mbus_info = rkisp1_isp_mbus_info_get(fse->code);
+	if (!mbus_info)
+		return -EINVAL;
+
+	if (!(mbus_info->direction & RKISP1_ISP_SD_SINK) &&
+	    fse->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+		return -EINVAL;
+
+	if (!(mbus_info->direction & RKISP1_ISP_SD_SRC) &&
+	    fse->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+		return -EINVAL;
+
+	fse->min_width = RKISP1_ISP_MIN_WIDTH;
+	fse->max_width = RKISP1_ISP_MAX_WIDTH;
+	fse->min_height = RKISP1_ISP_MIN_HEIGHT;
+	fse->max_height = RKISP1_ISP_MAX_HEIGHT;
+
+	return 0;
+}
+
 static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_pad_config *cfg)
 {
@@ -880,6 +913,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
 
 static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
+	.enum_frame_size = rkisp1_isp_enum_frame_size,
 	.get_selection = rkisp1_isp_get_selection,
 	.set_selection = rkisp1_isp_set_selection,
 	.init_cfg = rkisp1_isp_init_config,
-- 
2.20.1

