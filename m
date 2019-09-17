Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC3B4540
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 03:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391350AbfIQBdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 21:33:51 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34161 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730648AbfIQBdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 21:33:51 -0400
Received: by mail-qt1-f193.google.com with SMTP id j1so2397105qth.1
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 18:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7wSAgehHo1E/gndFAv73quxOgaxL2KBOzCl0tlHa4I=;
        b=JuCC9dOpB3uPA5OqFbpWkYBPQQVMiPeu43VS3iAy+763+l+yypST/JrRPOC1zBP+51
         HRCI1Nq1d1E/RlOMHNa9GeTrCTqadf2qE9bFYWlKcjgbGer3MN3sBRzpeN96MIr7VrQG
         MD/QcAfPgRv022evfk0JPyVwMbt15OXq3PaFWRHD6Ne7lLWhv8BddcBMrr//iB4YxCd1
         1oTn192RBcQqCHf17JLCC9K6TUbCroxJPp4IJD/BLGRuFg24TT8GBOggR9xHvCLZDPGA
         Ja3nWgoRU8/ph7cmh+r0Et5/qL9LtLIYnA6OVnV3ZVv6jgkTXDkFlIBXxY7DBLgR20YY
         OOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7wSAgehHo1E/gndFAv73quxOgaxL2KBOzCl0tlHa4I=;
        b=kzhvJZ6r6+RsLs1YamGhsJzGNSrz6c5fDm1RifiW3wEPGLqcpw55fkS36469GX2F0L
         +ySNgYC3hRjHrHbUzgpTuWAovsF0Fo3YC8ya8jKFYiQAca6dut0mCSdwpYlvG+oCmN+2
         blDWEcqe89kUK2yRxbBkOYxEWWM4CJN/60JQqLdA49I2DTpvbg+EcLz7e7joAQe9j91I
         1ORmtFRMLKqtqGulT3bVg/3Lda4HdwNemtxucDNRbz0hEINmbPFqUQ/hxLJqh+7hvJER
         IVTaRlaqwCPkfn2rt17HCeexzxyNO7ModwdsYXBQ05a2jAgkOllLQPBV8wK7lqjmI0Me
         +Gfw==
X-Gm-Message-State: APjAAAVoYsdiU272TTg8QnRCb2GO8Yg8VHNUfEFF0RpuQazrVSZL0ou0
        FqzErNGH4YKuy8rxFeEYTT/AvMaL
X-Google-Smtp-Source: APXvYqzP1erz4zEzD3OV7q5zm3kKn3DHPEZcEJyhQP6dbhYCyMwojj61cuJvXtDe9Aq/7IAoVKS+Aw==
X-Received: by 2002:ac8:1a2e:: with SMTP id v43mr1393695qtj.204.1568684029641;
        Mon, 16 Sep 2019 18:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7d3:d218:fd63:67c2:d1c4:fb7a])
        by smtp.gmail.com with ESMTPSA id g19sm604031qtb.2.2019.09.16.18.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 18:33:48 -0700 (PDT)
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, lkcamp@lists.libreplanetbr.org,
        helen.koike@collabora.com, mchehab@kernel.org
Subject: [RFC] media: vimc: Implement frame rate control
Date:   Mon, 16 Sep 2019 22:33:41 -0300
Message-Id: <20190917013341.26626-1-gagallo7@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to make the frame rate changeable, this patch implements the
ioctls VIDIOC_ENUM_FRAMEINTERVALS, VIDIOC_S_PARM and VIDIOC_G_PARM.
Most of the implementation was based on vivid driver.

The frame rate control is mainly made in vimc_force_frame_rate function,
which sleeps how long is needed to achieve the desired frame rate, or do
not sleep at all if it is unnecessary.

There are some issues:
1. v4l2-compliance is giving one warning. See below.
2. qv4l2 is setting the frame rate to -1 FPS when it starts to stream.

Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>

---
NOTE: This patch was made on top of Shuah's patch
"Collapse component structure into a single monolithic driver".
https://patchwork.kernel.org/patch/11136201/

v4l2-compliance output:
v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits

Compliance test for vimc device /dev/video0:

Driver Info:
	Driver name      : vimc
	Card type        : vimc
	Bus info         : platform:vimc
	Driver version   : 5.3.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : vimc
	Model            : VIMC MDEV
	Serial           :
	Bus info         : platform:vimc
	Media version    : 5.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.3.0
Interface Info:
	ID               : 0x0300000d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000b (11)
	Name             : Raw Capture 0
	Function         : V4L2 I/O
	Pad 0x0100000c   : 0: Sink
	  Link 0x0200001e: from remote pad 0x1000002 of entity 'Sensor A': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		warn: v4l2-test-formats.cpp(1320): S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for vimc device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 1

---
---
 drivers/media/platform/vimc/vimc-capture.c  | 129 +++++++++++++++++++-
 drivers/media/platform/vimc/vimc-common.h   |  27 ++++
 drivers/media/platform/vimc/vimc-streamer.c |  73 ++++++++++-
 drivers/media/platform/vimc/vimc-streamer.h |   3 +
 4 files changed, 229 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 602f80323031..b600e0dc2f1d 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -165,8 +165,9 @@ static int vimc_cap_enum_framesizes(struct file *file, void *fh,
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	vpix = vimc_pix_map_by_code(fsize->pixel_format);
+	vpix = vimc_pix_map_by_pixelformat(fsize->pixel_format);
 	if (!vpix)
+		pr_err("Invalid pixelformat given to %s.", __func__);
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -190,6 +191,122 @@ static const struct v4l2_file_operations vimc_cap_fops = {
 	.mmap           = vb2_fop_mmap,
 };
 
+static int vimc_enum_frameintervals(struct file *file, void *fh,
+				    struct v4l2_frmivalenum *fival)
+{
+	const struct vimc_pix_map *vpix =
+		vimc_pix_map_by_pixelformat(fival->pixel_format);
+	const struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_dir != VFL_DIR_RX)
+		return -ENOTTY;
+
+	/* Using step-wise frame rates. Only the first index is retrieved by the
+	 * application.
+	 */
+	if (fival->index)
+		return -EINVAL;
+
+	if (!vpix) {
+		pr_err("Invalid pixelformat given to %s.", __func__);
+		return -EINVAL;
+	}
+
+	/* TODO: Check the given frame dimensions when VIDIOC_ENUM_FRAMESIZES
+	 * is done
+	 */
+	if (fival->width < VIMC_FRAME_MIN_WIDTH ||
+	    fival->width > VIMC_FRAME_MAX_WIDTH ||
+	    fival->height < VIMC_FRAME_MIN_HEIGHT ||
+	    fival->height > VIMC_FRAME_MAX_HEIGHT) {
+		pr_err("Invalid frame size given to %s.", __func__);
+		return -EINVAL;
+	}
+
+	/*Setting a continuous step-wise approach to enumerate the frame rates*/
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
+	fival->stepwise.min.numerator = tpf_min.numerator;
+	fival->stepwise.min.denominator = tpf_min.denominator;
+	fival->stepwise.max.numerator = tpf_max.numerator;
+	fival->stepwise.max.denominator = tpf_max.denominator;
+	fival->stepwise.step.numerator = 1;
+	fival->stepwise.step.denominator = 1;
+
+	return 0;
+}
+
+static int vimc_vid_cap_g_parm(struct file *file, void *priv,
+			       struct v4l2_streamparm *parm)
+{
+	struct vimc_cap_device *vcap = video_drvdata(file);
+
+	/* TODO: Update allowed types when multiplanar feature is done. */
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe = vcap->stream.timeperframe_vid_cap;
+	pr_debug("g_parm tpf_vid_cap: %u/%u",
+		 vcap->stream.timeperframe_vid_cap.numerator,
+		 vcap->stream.timeperframe_vid_cap.denominator);
+	/* Setting readbuffers to 0, because read capability is not supported */
+	parm->parm.capture.readbuffers = 0;
+	return 0;
+}
+
+static int vimc_vid_cap_s_parm(struct file *file, void *priv,
+			       struct v4l2_streamparm *parm)
+{
+	struct vimc_cap_device *vcap = video_drvdata(file);
+	struct v4l2_fract tpf;
+
+	/* TODO: Update allowed types when multiplanar feature is done. */
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -ENOTTY;
+
+	tpf = parm->parm.capture.timeperframe;
+
+	pr_debug("s_parm %u / %u", tpf.numerator, tpf.denominator);
+
+	if (tpf.denominator == 0) {
+		tpf = tpf_max;
+	} else {
+		tpf = V4L2_FRACT_COMPARE(tpf, <, tpf_min) ? tpf_min : tpf;
+		tpf = V4L2_FRACT_COMPARE(tpf, >, tpf_max) ? tpf_max : tpf;
+	}
+
+	pr_debug("final s_parm %u / %u.", tpf.numerator, tpf.denominator);
+	/* resync the thread's timings */
+	vcap->stream.timeperframe_vid_cap = tpf;
+	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe = tpf;
+	/* Setting readbuffers to 0, because read capability is not supported */
+	parm->parm.capture.readbuffers = 0;
+	return 0;
+}
+
+static int vimc_g_parm(struct file *file, void *fh,
+		       struct v4l2_streamparm *parm)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_dir == VFL_DIR_RX)
+		return vimc_vid_cap_g_parm(file, fh, parm);
+
+	return -ENOTTY;
+}
+
+static int vimc_s_parm(struct file *file, void *fh,
+		       struct v4l2_streamparm *parm)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_dir == VFL_DIR_RX)
+		return vimc_vid_cap_s_parm(file, fh, parm);
+
+	return -ENOTTY;
+}
+
 static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_querycap = vimc_cap_querycap,
 
@@ -199,6 +316,10 @@ static const struct v4l2_ioctl_ops vimc_cap_ioctl_ops = {
 	.vidioc_enum_fmt_vid_cap = vimc_cap_enum_fmt_vid_cap,
 	.vidioc_enum_framesizes = vimc_cap_enum_framesizes,
 
+	.vidioc_enum_frameintervals = vimc_enum_frameintervals,
+	.vidioc_g_parm = vimc_g_parm,
+	.vidioc_s_parm = vimc_s_parm,
+
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
@@ -240,6 +361,10 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 		return ret;
 	}
 
+	pr_debug("s_stream begin. Timeperframe: %u / %u",
+		 vcap->stream.timeperframe_vid_cap.numerator,
+		 vcap->stream.timeperframe_vid_cap.denominator);
+
 	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
 	if (ret) {
 		media_pipeline_stop(entity);
@@ -446,6 +571,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->format.bytesperline = vcap->format.width * vpix->bpp;
 	vcap->format.sizeimage = vcap->format.bytesperline *
 				 vcap->format.height;
+	vcap->stream.timeperframe_vid_cap.numerator = 1;
+	vcap->stream.timeperframe_vid_cap.denominator = 60;
 
 	/* Fill the vimc_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 236412ad7548..930206bc925b 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -25,6 +25,33 @@
 #define VIMC_FRAME_MIN_WIDTH 16
 #define VIMC_FRAME_MIN_HEIGHT 16
 
+/* Maximum allowed frame rate
+ *
+ * vimc will allow setting timeperframe in [1/FPS_MAX - FPS_MAX/1] range.
+ *
+ * Ideally FPS_MAX should be infinity, i.e. practically UINT_MAX, but that
+ * might hit application errors when they manipulate these values.
+ *
+ */
+#define VIMC_FPS_MAX 100
+#define VIMC_FPS_MIN 1
+
+#define DIV64_1000(val)		(div_u64(val, 1000))
+#define MS_TO_S(msec)		(DIV64_1000(msec))
+#define US_TO_MS(usec)		(DIV64_1000(usec))
+#define NS_TO_US(nsec)		(DIV64_1000(nsec))
+#define NS_TO_MS(nsec)		(DIV64_1000(DIV64_1000(nsec)))
+#define US_TO_NS(usec)		((usec) * 1000)
+#define MS_TO_US(msec)		((msec) * 1000)
+#define MS_TO_NS(msec)		((msec) * 1000 * 1000)
+#define S_TO_MS(sec)		((sec) * 1000)
+#define S_TO_US(sec)		((sec) * 1000 * 1000)
+
+/* timeperframe: min/max and default */
+static const struct v4l2_fract
+	tpf_min     = {.numerator = 1,		.denominator = VIMC_FPS_MAX},
+	tpf_max     = {.numerator = VIMC_FPS_MAX,	.denominator = 1};
+
 #define VIMC_FRAME_INDEX(lin, col, width, bpp) ((lin * width + col) * bpp)
 
 /* Source and sink pad checks */
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 048d770e498b..2b1cc7727880 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/freezer.h>
@@ -125,6 +126,52 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	return -EINVAL;
 }
 
+static int vimc_force_frame_rate(u64 target_interval_ms, u64 tick)
+{
+	const u64 tock = ktime_get_ns();
+	const u64 target_timespan_usec = MS_TO_US(target_interval_ms);
+	s64 freeze_time_usec = MS_TO_US(target_interval_ms) - NS_TO_US(tock -
+								       tick);
+	u64 frame_current_timespan_usec = 0;
+
+	if (target_interval_ms < S_TO_MS(1) / VIMC_FPS_MAX) {
+		pr_warn("Invalid timespan given. Don't limit the FPS.");
+		return -EINVAL;
+	}
+
+	if (tick > tock) {
+		pr_err("Wrong tick timing given to calculate the frame rate.");
+		return -EINVAL;
+	}
+
+	if (freeze_time_usec < 0LL) {
+		/*No need to skip frames.*/
+		return 0;
+	} else if (freeze_time_usec > MS_TO_US(20)) {
+		/* From: Documentation/timers/timers-howto.rst
+		 * If the freeze time is greater than 20 milliseconds, use
+		 * msleep or msleep_interruptible.
+		 */
+		msleep_interruptible(US_TO_MS(freeze_time_usec));
+	} else {
+		/* From: Documentation/timers/timers-howto.rst
+		 * If the freeze time is between 0.01 and 20 milliseconds, use
+		 * usleep_range.
+		 * For FPS greater than 50.
+		 */
+		frame_current_timespan_usec = NS_TO_US(ktime_get_ns() - tick);
+		while (frame_current_timespan_usec < target_timespan_usec) {
+			usleep_range(0, target_timespan_usec -
+				     frame_current_timespan_usec);
+			frame_current_timespan_usec = NS_TO_US(ktime_get_ns() -
+							       tick);
+		}
+	}
+
+	/*Frames have been skipped to achieve the target FPS.*/
+	return 0;
+}
+
 /**
  * vimc_streamer_thread - Process frames through the pipeline
  *
@@ -143,6 +190,23 @@ static int vimc_streamer_thread(void *data)
 	u8 *frame = NULL;
 	int i;
 
+	u64 tick;
+	u32 interval_ms = 0;
+
+	if (V4L2_FRACT_COMPARE(stream->timeperframe_vid_cap, <, tpf_min) ||
+	    V4L2_FRACT_COMPARE(stream->timeperframe_vid_cap, >, tpf_max)) {
+		pr_err("Zero timeperframe_vid_cap numerator or denominator");
+		return -EINVAL;
+	}
+
+	interval_ms = S_TO_MS(stream->timeperframe_vid_cap.numerator) /
+		stream->timeperframe_vid_cap.denominator;
+
+	pr_debug("Got interval = %u s / %u fps = %u ms.",
+		 stream->timeperframe_vid_cap.numerator,
+		 stream->timeperframe_vid_cap.denominator,
+		 interval_ms);
+
 	set_freezable();
 
 	for (;;) {
@@ -150,15 +214,20 @@ static int vimc_streamer_thread(void *data)
 		if (kthread_should_stop())
 			break;
 
+		interval_ms = S_TO_MS(stream->timeperframe_vid_cap.numerator) /
+			stream->timeperframe_vid_cap.denominator;
+		tick = ktime_get_ns();
+
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
 			frame = stream->ved_pipeline[i]->process_frame(
 					stream->ved_pipeline[i], frame);
 			if (!frame || IS_ERR(frame))
 				break;
 		}
-		//wait for 60hz
+
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ / 60);
+
+		vimc_force_frame_rate(interval_ms, tick);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/vimc/vimc-streamer.h b/drivers/media/platform/vimc/vimc-streamer.h
index fe3c51f15fad..04d3d0ecb65c 100644
--- a/drivers/media/platform/vimc/vimc-streamer.h
+++ b/drivers/media/platform/vimc/vimc-streamer.h
@@ -9,6 +9,7 @@
 #ifndef _VIMC_STREAMER_H_
 #define _VIMC_STREAMER_H_
 
+#include <linux/videodev2.h>
 #include <media/media-device.h>
 
 #include "vimc-common.h"
@@ -35,6 +36,8 @@ struct vimc_stream {
 	struct vimc_ent_device *ved_pipeline[VIMC_STREAMER_PIPELINE_MAX_SIZE];
 	unsigned int pipe_size;
 	struct task_struct *kthread;
+
+	struct v4l2_fract timeperframe_vid_cap;
 };
 
 int vimc_streamer_s_stream(struct vimc_stream *stream,
-- 
2.21.0

