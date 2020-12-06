Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B312D00E2
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 06:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgLFFka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 00:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgLFFk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 00:40:29 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE47C0613D0
        for <linux-media@vger.kernel.org>; Sat,  5 Dec 2020 21:39:48 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 3so10521310wmg.4
        for <linux-media@vger.kernel.org>; Sat, 05 Dec 2020 21:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JszvQxiQ+jUlEOzG2swQ7gaMo97fIzwTLLQMuYKMPfs=;
        b=mj7mT5n8pfgjtGsGVEH/pm+CAjWvFUsfBO8zHHju7tevI8hslHH3REuPL+0eAhGNMV
         rEzMWT1aXfwn0j53dL+hLday80ihnqsEsmb+39U+Rxtdk+6lUNP13jB1yOuxdvTYVVe9
         +ftRXyTAhBEFS0ywk58QUX8dWijqpdQgV079QRk8XadegvaF0JEG3Xe0vbx8qjdmQBwh
         szx0e1wSyOW2T9dlEIBuPZxvSdqIGXlglpLqBurJiTh1lglU70JeFo/LG4oj/pyvZr/2
         4HYl84Lnxi2Ik6Punua1VNE02QI58J4LJ36ajQix6w6iOmGTSNC3UEvD4uv5pL9Ba9fN
         AGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JszvQxiQ+jUlEOzG2swQ7gaMo97fIzwTLLQMuYKMPfs=;
        b=XZnpO60duJtLfvVYWFBoKYCEdKayRtYaYCJE7RWssR5XQnAqHBWfgzpNgigXK/MiVO
         Eam/zT6T5YOTSmgDHdlrUMW194B6yKvPbzEOAdVfWveJlhhdLodcVL2ooFkvcrms8KQY
         C8iFzXq7XENX0Z7enu4ThcB4Mb5Gv7uX5IaGWhIwelh1B1OiUd7DTkxZhUQU+vi/5FTg
         hWt1FpG2MOelqoC7Z7Ub3RAxVNjI9WL1AMNve5/A8dWHGppLwLDk7qfrGMOkThILZ2QP
         V7SAptaDO3TSvj1Fth2FGhBJm0CCHcXyWEcS5a9z0rIhu+HzKX+gF+g10YpMMFYAy5t7
         QdjA==
X-Gm-Message-State: AOAM533xqL9Pq71WUowx1oMguf4pX3eIoq2d8/GtkLoViLdwptWm+ZD0
        x2oCeaSjYDtl9AEwLEzyhLITEB9fvy8ofw==
X-Google-Smtp-Source: ABdhPJwz/vQDX9Wr7m+TdDiwdTIkArrkvr3cJUF0iWM5EG+MTNmBOKDcXNets/RFKhG4MkM3U2YPlA==
X-Received: by 2002:a1c:9c4a:: with SMTP id f71mr12285049wme.168.1607233187137;
        Sat, 05 Dec 2020 21:39:47 -0800 (PST)
Received: from basti.fritz.box (p200300d1ff4084001dd1f519956627b5.dip0.t-ipconnect.de. [2003:d1:ff40:8400:1dd1:f519:9566:27b5])
        by smtp.gmail.com with ESMTPSA id n17sm805056wmc.33.2020.12.05.21.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 21:39:46 -0800 (PST)
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        sebastian.fricke.linux@gmail.com
Subject: [PATCH] media: rkisp1: Add the enum_frame_size ioctl
Date:   Sun,  6 Dec 2020 06:39:35 +0100
Message-Id: <20201206053935.24028-1-sebastian.fricke.linux@gmail.com>
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

---

 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 889982d8ca41..fa7540155d71 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -599,6 +599,44 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 
 	return -EINVAL;
 }
+static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	int i;
+	bool code_match = false;
+
+	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
+	    fse->pad == RKISP1_ISP_PAD_SOURCE_STATS)
+		return -EINVAL;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
+		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
+
+		if (fmt->mbus_code == fse->code) {
+			code_match = true;
+			if (!(fmt->direction & RKISP1_ISP_SD_SINK) &&
+			    fse->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+				return -EINVAL;
+			if (!(fmt->direction & RKISP1_ISP_SD_SRC) &&
+			    fse->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+				return -EINVAL;
+		}
+	}
+
+	if (!code_match)
+		return -EINVAL;
+
+	fse->min_width = RKISP1_ISP_MIN_WIDTH;
+	fse->max_width = RKISP1_ISP_MAX_WIDTH;
+	fse->min_height = RKISP1_ISP_MIN_HEIGHT;
+	fse->max_height = RKISP1_ISP_MAX_HEIGHT;
+
+	return 0;
+}
 
 static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_pad_config *cfg)
@@ -880,6 +918,7 @@ static int rkisp1_subdev_link_validate(struct media_link *link)
 
 static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
+	.enum_frame_size = rkisp1_isp_enum_frame_size,
 	.get_selection = rkisp1_isp_get_selection,
 	.set_selection = rkisp1_isp_set_selection,
 	.init_cfg = rkisp1_isp_init_config,
-- 
2.20.1

