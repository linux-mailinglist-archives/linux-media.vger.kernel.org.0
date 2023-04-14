Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8236E221B
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 13:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjDNL2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjDNL2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 07:28:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3B09ECF
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 04:28:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6731646FE
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 11:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F50C4339E;
        Fri, 14 Apr 2023 11:28:02 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 18/18] staging: media: av7110: fix VBI output support
Date:   Fri, 14 Apr 2023 13:27:42 +0200
Message-Id: <20230414112742.27749-19-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
References: <20230414112742.27749-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With these changes it now passes the v4l2-compliance test.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/av7110/av7110_v4l.c | 98 ++++++++++++++---------
 1 file changed, 60 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 3ab930cd8a27..ed2c605808e8 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -473,6 +473,28 @@ static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
 	return av7110_dvb_c_switch(dev);
 }
 
+static int vidioc_enum_output(struct file *file, void *fh, struct v4l2_output *o)
+{
+	if (o->index)
+		return -EINVAL;
+	strscpy(o->name, "Video Output", sizeof(o->name));
+	o->type = V4L2_OUTPUT_TYPE_ANALOG;
+	o->std = V4L2_STD_NTSC_M | V4L2_STD_PAL_BG;
+	o->capabilities = V4L2_OUT_CAP_STD;
+	return 0;
+}
+
+static int vidioc_g_output(struct file *file, void *fh, unsigned int *output)
+{
+	*output = 0;
+	return 0;
+}
+
+static int vidioc_s_output(struct file *file, void *fh, unsigned int output)
+{
+	return output ? -EINVAL : 0;
+}
+
 static int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *a)
 {
 	dprintk(2, "VIDIOC_G_AUDIO: %d\n", a->index);
@@ -536,52 +558,53 @@ static int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh,
 	if (av7110->wssMode) {
 		f->fmt.sliced.service_set = V4L2_SLICED_WSS_625;
 		f->fmt.sliced.service_lines[0][23] = V4L2_SLICED_WSS_625;
-		f->fmt.sliced.io_size = sizeof(struct v4l2_sliced_vbi_data);
 	}
+	f->fmt.sliced.io_size = sizeof(struct v4l2_sliced_vbi_data);
 	return 0;
 }
 
-static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
-					struct v4l2_format *f)
+static int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh,
+					 struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
 	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
+	bool want_wss = (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) ||
+		(!f->fmt.sliced.service_set &&
+		 f->fmt.sliced.service_lines[0][23] == V4L2_SLICED_WSS_625);
 
-	dprintk(2, "VIDIOC_S_FMT\n");
+	dprintk(2, "VIDIOC_G_FMT:\n");
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
 		return -EINVAL;
-	if (f->fmt.sliced.service_set != V4L2_SLICED_WSS_625 &&
-	    f->fmt.sliced.service_lines[0][23] != V4L2_SLICED_WSS_625) {
-		memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
-		/* WSS controlled by firmware */
-		av7110->wssMode = 0;
-		av7110->wssData = 0;
-		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
-				     SetWSSConfig, 1, 0);
-	} else {
-		memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
+	memset(&f->fmt.sliced, 0, sizeof(f->fmt.sliced));
+	if (want_wss) {
 		f->fmt.sliced.service_set = V4L2_SLICED_WSS_625;
 		f->fmt.sliced.service_lines[0][23] = V4L2_SLICED_WSS_625;
-		f->fmt.sliced.io_size = sizeof(struct v4l2_sliced_vbi_data);
-		/* WSS controlled by userspace */
-		av7110->wssMode = 1;
-		av7110->wssData = 0;
 	}
+	f->fmt.sliced.io_size = sizeof(struct v4l2_sliced_vbi_data);
 	return 0;
 }
 
-static int av7110_vbi_reset(struct file *file)
+static int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
+					struct v4l2_format *f)
 {
 	struct saa7146_dev *dev = video_drvdata(file);
-	struct av7110 *av7110 = (struct av7110*) dev->ext_priv;
+	struct av7110 *av7110 = (struct av7110 *)dev->ext_priv;
 
-	dprintk(2, "%s\n", __func__);
-	av7110->wssMode = 0;
-	av7110->wssData = 0;
-	if (FW_VERSION(av7110->arm_app) < 0x2623)
-		return 0;
-	else
-		return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 1, 0);
+	dprintk(2, "VIDIOC_S_FMT\n");
+	if (vidioc_try_fmt_sliced_vbi_out(file, fh, f))
+		return -EINVAL;
+	if (f->fmt.sliced.service_set & V4L2_SLICED_WSS_625) {
+		/* WSS controlled by userspace */
+		av7110->wssMode = 1;
+		av7110->wssData = 0;
+	} else {
+		/* WSS controlled by firmware */
+		av7110->wssMode = 0;
+		av7110->wssData = 0;
+		return av7110_fw_cmd(av7110, COMTYPE_ENCODER,
+				     SetWSSConfig, 1, 0);
+	}
+	return 0;
 }
 
 static ssize_t av7110_vbi_write(struct file *file, const char __user *data, size_t count, loff_t *ppos)
@@ -801,13 +824,16 @@ int av7110_init_v4l(struct av7110 *av7110)
 	vv_data->vid_ops.vidioc_s_audio = vidioc_s_audio;
 	vv_data->vid_ops.vidioc_g_fmt_vbi_cap = NULL;
 
-	vv_data->vbi_ops.vidioc_g_tuner = vidioc_g_tuner;
-	vv_data->vbi_ops.vidioc_s_tuner = vidioc_s_tuner;
-	vv_data->vbi_ops.vidioc_g_frequency = vidioc_g_frequency;
-	vv_data->vbi_ops.vidioc_s_frequency = vidioc_s_frequency;
+	vv_data->vbi_ops.vidioc_enum_output = vidioc_enum_output;
+	vv_data->vbi_ops.vidioc_g_output = vidioc_g_output;
+	vv_data->vbi_ops.vidioc_s_output = vidioc_s_output;
+	vv_data->vbi_ops.vidioc_g_parm = NULL;
 	vv_data->vbi_ops.vidioc_g_fmt_vbi_cap = NULL;
+	vv_data->vbi_ops.vidioc_try_fmt_vbi_cap = NULL;
+	vv_data->vbi_ops.vidioc_s_fmt_vbi_cap = NULL;
 	vv_data->vbi_ops.vidioc_g_sliced_vbi_cap = vidioc_g_sliced_vbi_cap;
 	vv_data->vbi_ops.vidioc_g_fmt_sliced_vbi_out = vidioc_g_fmt_sliced_vbi_out;
+	vv_data->vbi_ops.vidioc_try_fmt_sliced_vbi_out = vidioc_try_fmt_sliced_vbi_out;
 	vv_data->vbi_ops.vidioc_s_fmt_sliced_vbi_out = vidioc_s_fmt_sliced_vbi_out;
 
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
@@ -848,7 +874,7 @@ static struct saa7146_standard standard[] = {
 		.h_offset	= 0x48,	.h_pixels	= 708,
 		.v_max_out	= 576,	.h_max_out	= 768,
 	}, {
-		.name	= "NTSC",	.id		= V4L2_STD_NTSC,
+		.name	= "NTSC",	.id		= V4L2_STD_NTSC_M,
 		.v_offset	= 0x10,	.v_field	= 244,
 		.h_offset	= 0x40,	.h_pixels	= 708,
 		.v_max_out	= 480,	.h_max_out	= 640,
@@ -862,7 +888,7 @@ static struct saa7146_standard analog_standard[] = {
 		.h_offset	= 0x08,	.h_pixels	= 708,
 		.v_max_out	= 576,	.h_max_out	= 768,
 	}, {
-		.name	= "NTSC",	.id		= V4L2_STD_NTSC,
+		.name	= "NTSC",	.id		= V4L2_STD_NTSC_M,
 		.v_offset	= 0x10,	.v_field	= 244,
 		.h_offset	= 0x40,	.h_pixels	= 708,
 		.v_max_out	= 480,	.h_max_out	= 640,
@@ -876,7 +902,7 @@ static struct saa7146_standard dvb_standard[] = {
 		.h_offset	= 0x48,	.h_pixels	= 708,
 		.v_max_out	= 576,	.h_max_out	= 768,
 	}, {
-		.name	= "NTSC",	.id		= V4L2_STD_NTSC,
+		.name	= "NTSC",	.id		= V4L2_STD_NTSC_M,
 		.v_offset	= 0x10,	.v_field	= 244,
 		.h_offset	= 0x40,	.h_pixels	= 708,
 		.v_max_out	= 480,	.h_max_out	= 640,
@@ -912,8 +938,6 @@ static struct saa7146_ext_vv av7110_vv_data_st = {
 	.num_stds	= ARRAY_SIZE(standard),
 	.std_callback	= &std_callback,
 
-	.vbi_fops.open	= av7110_vbi_reset,
-	.vbi_fops.release = av7110_vbi_reset,
 	.vbi_fops.write	= av7110_vbi_write,
 };
 
@@ -927,8 +951,6 @@ static struct saa7146_ext_vv av7110_vv_data_c = {
 	.num_stds	= ARRAY_SIZE(standard),
 	.std_callback	= &std_callback,
 
-	.vbi_fops.open	= av7110_vbi_reset,
-	.vbi_fops.release = av7110_vbi_reset,
 	.vbi_fops.write	= av7110_vbi_write,
 };
 
-- 
2.39.2

