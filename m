Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DCB2D18B7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 19:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgLGSor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 13:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgLGSoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 13:44:46 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396DBC061793
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 10:44:06 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id b2so14858465edm.3
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 10:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OvOjqk1ZX87ccfAMQ4hAEgkuopZ1BUmMdSoioq+u04=;
        b=f3ebqbHzfKJJNfjKijYDXiG8LFvVixCC4Lv1mopfZgTFubQmb4gO4vb3CC8JtJOvgp
         2AnkrfPpyZUc5ISM+2y/CI0CwSGhkTHCcx4Sv8jAJqyXIaIdeBWsUikDnvsA7cDck+lV
         MB5Ym1VtOs7qSirhSR5IbcDKYEQWRLfeGv9jbAVfJ8GmTwczie9vD3mwPp0xtxLrC0mO
         FOfJkTGWSweTVRvNuVnc8xzrf0CoSZmh2DslcnnmfzWSO4I49PXb3y3g/NGo/KYESs9J
         E31jS5mEAOi1fsgVMeYIH9OjCHM+jvhyIGe0koQXg2t/3Ni8f3qxUbNChEv+ldpnP+LE
         WbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6OvOjqk1ZX87ccfAMQ4hAEgkuopZ1BUmMdSoioq+u04=;
        b=PeW3K4XBjh7MZReoPxYa9D3mC8WphLYiqjKuZ0jfbCRuZjqAiFV+u6J1JgAwFxpqA4
         jYLtNXfLqdB0Z9RhyMR5oT7KkhsFCuUFYnQvVzhofDbUuc4XsW+/4Mnxlf6mW6pA/+Z0
         M+BCuXz4oGNzK4Mky9AG+lTeovjsu1M8Q0ch1PlisXyZ/oRI/jeLgD73c0QZQkrkZi2V
         0SJ4jAl2w0xJygYSrHIw8VPKDPSs3jRkEkA8rm8sBv1HfFcDf6Cx4HDNidwscd84Vpnw
         hCMdmpbPwgryqKLil6ToBkDFZyUqCOTEuYjqIqHKXo8oUCtJzWnXBVZWGPdolki2M8+5
         wmFw==
X-Gm-Message-State: AOAM5316zG9xctWQPoUj/cztqnb3ikD0mXAHlOsYUSdhC8BxnP0HA27A
        9NpyKBYB2Gn2UD8WeMB1rjyhP71H5w0=
X-Google-Smtp-Source: ABdhPJz739CQlGAwn653Pe5HTTLrXD5J5UMDOJBjNcKjWVn9AVTni/Qkp4poYBX/DFx6urFzm8krPg==
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr21395267edt.219.1607366644632;
        Mon, 07 Dec 2020 10:44:04 -0800 (PST)
Received: from basti.fritz.box (p200300d1ff007e00a893d83069870c20.dip0.t-ipconnect.de. [2003:d1:ff00:7e00:a893:d830:6987:c20])
        by smtp.gmail.com with ESMTPSA id r24sm6800527edc.21.2020.12.07.10.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:44:03 -0800 (PST)
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, dafna.hirschfeld@collabora.com,
        sebastian.fricke.linux@gmail.com
Subject: [PATCH v2] media: rkisp1: Add the enum_frame_size ioctl
Date:   Mon,  7 Dec 2020 19:43:58 +0100
Message-Id: <20201207184358.3793-1-sebastian.fricke.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the VIDIOC_SUBDEV_ENUM_FRAME_SIZE ioctl, check if the mbus
code is valid for the given pad. This call is not available for the
parameter or metadata pads of the RkISP1.

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---

Changes since v1:

- Replace the custom bus code check with the `rkisp1_isp_mbus_info_get`
  function
- Add a missing line break above the function

I have tested this patch with the following script:
https://github.com/initBasti/Linux_kernel_media_tree_fork/commit/efc4b399cff53fb36fadde999594961a3d84073e

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

basti@nanopct4:~/libcamera$ v4l2-compliance
...
Format ioctls (Input 0):
    test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
...

---

 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 889982d8ca41..642dd13137d3 100644
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
+		return -EINVAL;
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

