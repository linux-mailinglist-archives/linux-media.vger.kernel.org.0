Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19BDFFE8E6
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfKOX5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:11 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:51253 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727406AbfKOX5K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:10 -0500
X-Halon-ID: a0dc9491-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a0dc9491-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:07 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/6] v4l2-dev/ioctl: Add default handlers for VIDIOC_{G,S}_{INPUT,OUTPUT}
Date:   Sat, 16 Nov 2019 00:55:54 +0100
Message-Id: <20191115235559.806041-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is very common to have just one input/output, and many drivers
implements the same trivial handlers. Add default handlers for
VIDIOC_{G,S}_{INPUT,OUTPUT} that assumes a single input/output.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-dev.c   |  8 ++---
 drivers/media/v4l2-core/v4l2-ioctl.c | 44 +++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index da42d172714adcb5..4293df8d664f70b3 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -726,8 +726,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		if (is_rx) {
 			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
-			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
-			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
+			set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
@@ -736,8 +736,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		}
 		if (is_tx) {
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
-			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
-			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
+			set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4e700583659bac8c..4a461de28677c5a8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1085,6 +1085,37 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
+static int v4l2_ioctl_g_single_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+#define v4l2_ioctl_g_single_output v4l2_ioctl_g_single_input
+
+static int v4l2_ioctl_s_single_input(struct file *file, void *priv, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+#define v4l2_ioctl_s_single_output v4l2_ioctl_s_single_input
+
+static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	if (!ops->vidioc_g_input)
+		return v4l2_ioctl_g_single_input(file, fh, arg);
+
+	return ops->vidioc_g_input(file, fh, arg);
+}
+
+static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	if (!ops->vidioc_g_output)
+		return v4l2_ioctl_g_single_output(file, fh, arg);
+
+	return ops->vidioc_g_output(file, fh, arg);
+}
+
 static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1094,12 +1125,19 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 	ret = v4l_enable_media_source(vfd);
 	if (ret)
 		return ret;
+
+	if (!ops->vidioc_s_input)
+		return v4l2_ioctl_s_single_input(file, fh, *(unsigned int *)arg);
+
 	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
 }
 
 static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	if (!ops->vidioc_s_output)
+		return v4l2_ioctl_s_single_output(file, fh, *(unsigned int *)arg);
+
 	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
 }
 
@@ -2678,10 +2716,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
 DEFINE_V4L_STUB_FUNC(g_std)
 DEFINE_V4L_STUB_FUNC(g_audio)
 DEFINE_V4L_STUB_FUNC(s_audio)
-DEFINE_V4L_STUB_FUNC(g_input)
 DEFINE_V4L_STUB_FUNC(g_edid)
 DEFINE_V4L_STUB_FUNC(s_edid)
-DEFINE_V4L_STUB_FUNC(g_output)
 DEFINE_V4L_STUB_FUNC(g_audout)
 DEFINE_V4L_STUB_FUNC(s_audout)
 DEFINE_V4L_STUB_FUNC(g_jpegcomp)
@@ -2730,11 +2766,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
 	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
-	IOCTL_INFO(VIDIOC_G_INPUT, v4l_stub_g_input, v4l_print_u32, 0),
+	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
 	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
 	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
-	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_stub_g_output, v4l_print_u32, 0),
+	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
 	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
 	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
-- 
2.24.0

