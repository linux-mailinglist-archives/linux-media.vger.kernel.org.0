Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A5D430AAF
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344225AbhJQQ1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344217AbhJQQ07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:26:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100ABC061765;
        Sun, 17 Oct 2021 09:24:50 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id t184so11982158pfd.0;
        Sun, 17 Oct 2021 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYXPUtxyGX4EHVRwa9EkXKsHEn/bCUipsYC+p0LtmcY=;
        b=JCrJDp5psmSMf+XSRDk67SLhUWL9nia+febO+AT1nzYk/txu63RidrN+3/8HNex1mb
         oF3ZGp5sdKVvU8jwYYYVg9FHhWUKT63oO1fb0rsJQsIYH7za03gB9ijJGu2tbefzPWAu
         OH5dwMFH5iX+bcXQOHEySRD5cVQqHFpjbPRRpY22xoz7tde9FtEXYJ8q0+SWqkmK5tv9
         ZZLPPw2hZ9smSoZV+OIt7xKi9LnkOf6Xz+p4MMU9S73BdGBmeclbUeKae6R8nJv+KRZo
         OxDlcrXGaP/Sl4qeDHuAIeomIYQq2YYA8nQFQCsCI+Y0KC0WJXC3sxcLEmMlfzv/t6fb
         TBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYXPUtxyGX4EHVRwa9EkXKsHEn/bCUipsYC+p0LtmcY=;
        b=ElG9d4xtNYUpUP2OQpcFtZwUd7nfLdVZaXJgGxUZ9u2oJWxUO/X30p9IS//vn0DhYg
         Kn+/5LYfdC/pAdOUms8AsSfh0zD/qzCn7SqolTppuINLNuTlyAnOUJvT2U6KRv8sweO1
         gJ63rcllFPSvecTA0L9W7JcWs4jo7E46xIlvrFLaUBH+12AWBgrBHSRJIAaRWrVd4CVS
         u3sXLH/lMY8oiwJA/vpdqySTMJteeLGgRtPa9PwSSOL2a2RwzNqRFLCqVK6/QfYmJ0BV
         32i/iZpf6nssUOO6ZzgSOd5pHIhSKZfwYw2BpdCqJSvdIVuXlLGLt/t9vsVRQa3Z0DWZ
         z2gA==
X-Gm-Message-State: AOAM533q1PxOoFpnURgnONJNzhcGCorO+OcGOzJHbbD1pVUOnV+Reyc3
        hUsOJzh4Xhj2VTf/7rcijsE=
X-Google-Smtp-Source: ABdhPJyZ7iGBn+JSqD2HpnwsJydmJy//Uj+8a093TdCdiYLGJAjobzWA4QNU9rVoPXaEL2/swCEchg==
X-Received: by 2002:a63:d14:: with SMTP id c20mr19162085pgl.118.1634487889419;
        Sun, 17 Oct 2021 09:24:49 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:49 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL check for asd obtained from atomisp_video_pipe
Date:   Mon, 18 Oct 2021 01:23:34 +0900
Message-Id: <20211017162337.44860-4-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is almost a BUG report with RFC patch that just avoids kernel
oopses. Thus, prefixed with [BUG][RFC].

Here is the kernel log after running `v4l2-compliance -d /dev/video4`
with this patch applied:

	kern  :err   : [25507.580392] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.592343] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.592995] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.593685] atomisp-isp2 0000:00:03.0: atomisp_g_input(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.593719] atomisp-isp2 0000:00:03.0: atomisp_g_parm(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.593727] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	[omitting 42 same messages]
	kern  :err   : [25507.593976] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594191] atomisp-isp2 0000:00:03.0: atomisp_g_input(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594449] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	[omitting 43 same messages]
	kern  :err   : [25507.594756] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594779] atomisp-isp2 0000:00:03.0: atomisp_g_ctrl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594787] atomisp-isp2 0000:00:03.0: atomisp_s_ctrl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594803] atomisp-isp2 0000:00:03.0: atomisp_camera_g_ext_ctrls(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594880] atomisp-isp2 0000:00:03.0: atomisp_enum_fmt_cap(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.594915] atomisp-isp2 0000:00:03.0: atomisp_g_parm(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.595058] atomisp-isp2 0000:00:03.0: atomisp_try_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.595089] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.595124] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.595221] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.595241] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.601571] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.607496] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.608604] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.611988] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.617420] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.618429] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.618811] atomisp-isp2 0000:00:03.0: atomisp_g_parm(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.622193] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.627355] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.628391] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.631143] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.635813] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.636489] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.636504] atomisp-isp2 0000:00:03.0: atomisp_s_input(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.636516] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.639111] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.646152] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.646831] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.646847] atomisp-isp2 0000:00:03.0: atomisp_s_input(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.650079] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.657476] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.658741] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.658759] atomisp-isp2 0000:00:03.0: atomisp_s_input(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.658771] atomisp-isp2 0000:00:03.0: atomisp_set_fmt(): asd is NULL, device is ATOMISP ISP ACC
	kern  :err   : [25507.660959] atomisp-isp2 0000:00:03.0: can't change power state from D3cold to D0 (config space inaccessible)
	kern  :warn  : [25507.666665] isys dma store at addr(0xcd408) val(0)
	kern  :err   : [25507.667397] atomisp-isp2 0000:00:03.0: atomisp_queryctl(): asd is NULL, device is ATOMISP ISP ACC

RFC:
  We should rather look into why the asd is NULL when the opened device
  is ACC node (video4/video10), instead of just avoiding NULL ptr derefs?

>8-----------------------------------------------------------------8<

Currently, NULL pointer dereference can occur on running some userspace
apps such as v4l2-compliance, gst-plugin-scanner, guvcview, cheese, etc.

Some debugging revealed that variable asd obtained from atomisp_video_pipe
(e.g., atomisp_to_video_pipe(vdev)->asd) causes this issue.

More precisely, this issue occurs when (and only when) apps try to do
its work for "ACC node"s, which are /dev/video4 and /dev/video10:

	$ grep . /sys/class/video4linux/video*/name
	/sys/class/video4linux/video0/name:ATOMISP ISP CAPTURE output
	/sys/class/video4linux/video10/name:ATOMISP ISP ACC
	/sys/class/video4linux/video1/name:ATOMISP ISP VIEWFINDER output
	/sys/class/video4linux/video2/name:ATOMISP ISP PREVIEW output
	/sys/class/video4linux/video3/name:ATOMISP ISP VIDEO output
	/sys/class/video4linux/video4/name:ATOMISP ISP ACC
	/sys/class/video4linux/video5/name:ATOMISP ISP MEMORY input
	/sys/class/video4linux/video6/name:ATOMISP ISP CAPTURE output
	/sys/class/video4linux/video7/name:ATOMISP ISP VIEWFINDER output
	/sys/class/video4linux/video8/name:ATOMISP ISP PREVIEW output
	/sys/class/video4linux/video9/name:ATOMISP ISP VIDEO output

For example, here are the commands to reproduce this issue with
v4l2-compliance for device video4 or video10 (ACC node):

        v4l2-compliance -d /dev/video4
        # or
        v4l2-compliance -d /dev/video10

You may also reproduce this issue when you just log in to a GNOME desktop.
On my setup, someone calls gst-plugin-scanner app when logging in to the
desktop and it causes this issue.

The other examples are, just open camera apps such as guvcview, cheese,
etc.

So, add NULL checks for asd obtained from `atomisp_to_video_pipe(vdev)->asd`
to avoid kernel NULL pointer dereference.

In some parts, `pipe->isp` is used instead of `pipe->asd->isp` to avoid
using the asd which is potentially NULL.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 73 +++++++++++++++
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 90 +++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 366161cff560..7206d29ba263 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1715,6 +1715,12 @@ void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
 {
 	unsigned long next;
 
+	if(!pipe->asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, pipe->vdev.name);
+		return;
+	}
+
 	if (delay != ATOMISP_WDT_KEEP_CURRENT_DELAY)
 		pipe->wdt_duration = delay;
 
@@ -1777,6 +1783,12 @@ void atomisp_wdt_refresh(struct atomisp_sub_device *asd, unsigned int delay)
 /* ISP2401 */
 void atomisp_wdt_stop_pipe(struct atomisp_video_pipe *pipe, bool sync)
 {
+	if(!pipe->asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, pipe->vdev.name);
+		return;
+	}
+
 	if (!atomisp_is_wdt_running(pipe))
 		return;
 
@@ -4109,6 +4121,12 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	unsigned long irqflags;
 	bool need_to_enqueue_buffer = false;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, pipe->vdev.name);
+		return;
+	}
+
 	if (atomisp_is_vf_pipe(pipe))
 		return;
 
@@ -4196,6 +4214,12 @@ int atomisp_set_parameters(struct video_device *vdev,
 	struct atomisp_css_params *css_param = &asd->params.css_param;
 	int ret;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (!asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream) {
 		dev_err(asd->isp->dev, "%s: internal error!\n", __func__);
 		return -EINVAL;
@@ -4857,6 +4881,12 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	int source_pad = atomisp_subdev_source_pad(vdev);
 	int ret;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (!isp->inputs[asd->input_curr].camera)
 		return -EINVAL;
 
@@ -5198,6 +5228,12 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	const struct atomisp_in_fmt_conv *fc;
 	int ret, i;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	v4l2_fh_init(&fh.vfh, vdev);
 
 	isp_sink_crop = atomisp_subdev_get_rect(
@@ -5494,6 +5530,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 				  unsigned int dvs_env_w, unsigned int dvs_env_h)
 {
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
@@ -5512,6 +5549,12 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	struct v4l2_subdev_fh fh;
 	int ret;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	v4l2_fh_init(&fh.vfh, vdev);
 
 	stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
@@ -5602,6 +5645,12 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_subdev_fh fh;
 	int ret;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
 		return -EINVAL;
 
@@ -6034,6 +6083,12 @@ int atomisp_set_fmt_file(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_subdev_fh fh;
 	int ret;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	v4l2_fh_init(&fh.vfh, vdev);
 
 	dev_dbg(isp->dev, "setting fmt %ux%u 0x%x for file inject\n",
@@ -6359,6 +6414,12 @@ bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_sub_device *asd = pipe->asd;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, pipe->vdev.name);
+		return false;
+	}
+
 	if (pipe == &asd->video_out_vf)
 		return true;
 
@@ -6572,6 +6633,12 @@ static int atomisp_get_pipe_id(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_sub_device *asd = pipe->asd;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, pipe->vdev.name);
+		return -EINVAL;
+	}
+
 	if (ATOMISP_USE_YUVPP(asd)) {
 		return IA_CSS_PIPE_ID_YUVPP;
 	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
@@ -6609,6 +6676,12 @@ int atomisp_get_invalid_frame_num(struct video_device *vdev,
 	struct ia_css_pipe_info p_info;
 	int ret;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (asd->isp->inputs[asd->input_curr].camera_caps->
 	    sensor[asd->sensor_curr].stream_num > 1) {
 		/* External ISP */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 62535e0f4429..e5cc93b39299 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -1183,6 +1183,12 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 	u32 origin_size, new_size;
 	int ret;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
 		return -EACCES;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6fc64f0ccc31..01c6eda2c3cc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -646,6 +646,12 @@ static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
 	*input = asd->input_curr;
 	rt_mutex_unlock(&isp->mutex);
@@ -665,6 +671,12 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct v4l2_subdev *motor;
 	int ret;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
 	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
@@ -765,6 +777,12 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	unsigned int i, fi = 0;
 	int rval;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
 	rval = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
 				enum_mbus_code, NULL, &code);
@@ -1027,6 +1045,12 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 	u16 stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
 	int ret = 0, i = 0;
 
+	if(!asd) {
+		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (req->count == 0) {
 		mutex_lock(&pipe->capq.vb_lock);
 		if (!list_empty(&pipe->capq.stream))
@@ -1154,6 +1178,12 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	u32 pgnr;
 	int ret = 0;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
 	if (isp->isp_fatal_error) {
 		ret = -EIO;
@@ -1389,6 +1419,12 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret = 0;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
 
 	if (isp->isp_fatal_error) {
@@ -1640,6 +1676,12 @@ static int atomisp_streamon(struct file *file, void *fh,
 	int ret = 0;
 	unsigned long irqflags;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
@@ -1901,6 +1943,12 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	unsigned long flags;
 	bool first_streamoff = false;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	dev_dbg(isp->dev, "Stop stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
 
@@ -2150,6 +2198,12 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == control->id) {
 			ret = 0;
@@ -2229,6 +2283,12 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int i, ret = -EINVAL;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == control->id) {
 			ret = 0;
@@ -2310,6 +2370,12 @@ static int atomisp_queryctl(struct file *file, void *fh,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	switch (qc->id) {
 	case V4L2_CID_FOCUS_ABSOLUTE:
 	case V4L2_CID_FOCUS_RELATIVE:
@@ -2355,6 +2421,12 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
@@ -2466,6 +2538,12 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 	int i;
 	int ret = 0;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
@@ -2591,6 +2669,12 @@ static int atomisp_g_parm(struct file *file, void *fh,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
@@ -2613,6 +2697,12 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	int rval;
 	int fps;
 
+	if(!asd) {
+		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
-- 
2.33.1

