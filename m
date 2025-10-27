Return-Path: <linux-media+bounces-45717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56593C114A8
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 20:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4C01A62F80
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F8B3161B9;
	Mon, 27 Oct 2025 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6jsTnhZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78523507C
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761595121; cv=none; b=gKwykROddY/jlWkoZjVSoew+QY/naR/xIV9X0/1KVkf97emU6+kIIwM+wNRniOZ6xjhH/a3lqAIMIUSintsG5E/vmk3yMhaB0OgbxbGFMSMySXCp/DgIytmjS+x64pl7RAv366Z8voIK4HWgNrEebyKp429M/rML1Q6cFl/PJ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761595121; c=relaxed/simple;
	bh=NA/uDc8zKE3q0kIL1aOb9hM6NJlL/6Qt/zMRdgTs5fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=othmVTEvLQHuYWu74UlR8PG7hK0BL53chmjNncQ8gz71vz7ZiymcltbEKDyZXCfDG6fze4TYdaNntjw/uRhx7Ssxs8AiM+MKw3A3pOkxpXSIGYcgF5pgaK1fcnWhc+Mp5gMdiRnnBAHfzdPOhlVFuHlz5TxVap69p24WOWxj9j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6jsTnhZ; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso458118439f.3
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595115; x=1762199915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/J2QpEs7C8RkaqghcvYTbrsOo1QRJ7Cgy95h+/81DE=;
        b=A6jsTnhZJMugcrjNlskgdQ9KfMuDOP+iSMug4wC4+M9OMqJcf9Ad6yN85pZoqkPxmZ
         LzJMpROrRqTBJBhHMHHIvQEHQPitAqm3sc5yuKJuH9h8p//8DOA4BFS4pF+NzG9HUPqV
         08tWfna7vJ0l/yjBDPTAos0liPRAhwW/0rtIauMTegH8pywZQYrssBaykwQHQFDBLXzl
         cKnje8FuyyPgyM/9IJcrX2i6Qt8GB44Ul5a7jefWFzkugBQTUDKW7xi77lzGczdt5lzd
         qHt891kyO6rRJQEScgbPjuE0vCGwzUPX2rMaqPlNe+3ZAN2dvABE7MCGV0Djrlttk3px
         shkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595115; x=1762199915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/J2QpEs7C8RkaqghcvYTbrsOo1QRJ7Cgy95h+/81DE=;
        b=mklvXKZRld50R8Kh0wITYY85YM3KmJpRksvMnJE33gRtefSuUoTCxUHryUx+8lQjaj
         mbwnU4X4VFkCNOtinu4IT4AIFRRVqAg6h4HFFi7v/l38ZShLSN6lKPyEXGkBlLV3CmPi
         DgUmElPPKvA/FgYrBf0Xyo3KxTZEJnZacMd60hbc25+stEDldL48rJiL8ZJNsztx5NFW
         T7844dRDX7na/QKjtzaszyI+kR5tdPuJb0pCQLMUSExJtEa+E1cHhetrtK5QgBQmPgkc
         YKjPe7+N5h7BopepqR2X8bNi0UeRScY36JcYtup8LV46BEiEyvqSybP51tVznBdv2BFH
         CZZQ==
X-Gm-Message-State: AOJu0YyFTWcgaE4EukzAXdvN/FMB/JRI5oBnl38Db4Ew+UHeQeFmVbrl
	JDQem+bZcat2KNu3zmLyk5zgqrEmufS1x4OYsk6vVsqNjiSIFx47xRXzZCtrAak6yA4=
X-Gm-Gg: ASbGnctRye8GNoI16+nH9zfajP5bHVaJnn7wk2Ey/qdp6lYzcH55v+kOVck/umB84aV
	BiLarFFduOd3GvKiccUzxS/XYLF57/Al0cdSg4g+qKeRDwmLubTX4D4t0sZFIP6cjmSHAa/O0/u
	FmJpEqfjFkAbczFpS7aYoxS4N8XtghoBuCZTe78SdWpePIU7ekUjGgoa+LEXF8DSDWMtNwMjPdV
	3ufDL8IwF6gm9juoosy4F8Sp66UFAeDGsU8IY9x/Wobs+Z5ZseKLJp+L0Mn0m0qYTsregQ37X6G
	fUJ13F/MajzRlEgOCdrukAQDv23Ul+mqndlWHnArztHQnUpoC9w3jqfWGgJM5h8JcxQw0zb1FJ6
	jcWuA8CFtASY7H1GLg3WIMJP1nedBmDk/eGzNU9hAC5f7p/f694kZlByZYDzLZRPQOdZo0FGS91
	6sLk4BXOMO8jCo+haec8XuPIimm7YcrWTwHgahoHQRrQXQE0ADPU7taCsbKlta1Qc=
X-Google-Smtp-Source: AGHT+IEBi64lkXkJaL1pY6XDJiO3LFGoqwN1g2I87TA8a/58kG0tghVQnKnnfY6UyFMSqTeu2hIh0Q==
X-Received: by 2002:a05:6602:1344:b0:892:6e7e:c59c with SMTP id ca18e2360f4ac-945b832e8ddmr215848239f.19.1761595113530;
        Mon, 27 Oct 2025 12:58:33 -0700 (PDT)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea9e37cd4sm3482853173.60.2025.10.27.12.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 12:58:32 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	lukas.bulwahn@redhat.com,
	hoff.benjamin.k@gmail.com
Subject: [RFC PATCH v1 1/2] media: pci: add AVMatrix HWS capture driver
Date: Mon, 27 Oct 2025 15:56:36 -0400
Message-ID: <20251027195638.481129-3-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
References: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce an in-tree variant of the AVMatrix HWS PCIe capture module.
The driver supports up to four HDMI inputs with paired stereo audio and
exposes them through V4L2 and ALSA.

Major pieces include:
  - PCI glue with capability discovery, BAR setup, interrupt handling
    and power-management hooks.
  - A vb2-dma-contig based video pipeline with DV timings support,
    per-channel controls, two-buffer management and loss-of-signal
    recovery.
  - ALSA capture support implementing the PCM callbacks and programming
    the legacy DMA tables.
  - Runtime suspend/resume handling and hotplug status propagation for
    the multi-channel boards.

The driver is wired into the media PCI build via a new Kconfig option
(CONFIG_VIDEO_HWS) and the subdirectory Makefile entry.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/Kconfig              |    1 +
 drivers/media/pci/Makefile             |    1 +
 drivers/media/pci/hws/Kconfig          |   13 +
 drivers/media/pci/hws/Makefile         |    4 +
 drivers/media/pci/hws/hws.h            |  194 +++
 drivers/media/pci/hws/hws_audio.c      |  571 +++++++++
 drivers/media/pci/hws/hws_audio.h      |   22 +
 drivers/media/pci/hws/hws_irq.c        |  281 +++++
 drivers/media/pci/hws/hws_irq.h        |   12 +
 drivers/media/pci/hws/hws_pci.c        |  708 +++++++++++
 drivers/media/pci/hws/hws_reg.h        |  142 +++
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  576 +++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h |   32 +
 drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
 drivers/media/pci/hws/hws_video.h      |   24 +
 15 files changed, 4123 insertions(+)
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
 create mode 100644 drivers/media/pci/hws/hws_audio.c
 create mode 100644 drivers/media/pci/hws/hws_audio.h
 create mode 100644 drivers/media/pci/hws/hws_irq.c
 create mode 100644 drivers/media/pci/hws/hws_irq.h
 create mode 100644 drivers/media/pci/hws/hws_pci.c
 create mode 100644 drivers/media/pci/hws/hws_reg.h
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
 create mode 100644 drivers/media/pci/hws/hws_video.c
 create mode 100644 drivers/media/pci/hws/hws_video.h

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index eebb16c58f3d..87050f171e18 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -15,6 +15,7 @@ if MEDIA_CAMERA_SUPPORT
 
 source "drivers/media/pci/mgb4/Kconfig"
 source "drivers/media/pci/solo6x10/Kconfig"
+source "drivers/media/pci/hws/Kconfig"
 source "drivers/media/pci/tw5864/Kconfig"
 source "drivers/media/pci/tw68/Kconfig"
 source "drivers/media/pci/tw686x/Kconfig"
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index 02763ad88511..c4508b6723a9 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_VIDEO_CX23885) += cx23885/
 obj-$(CONFIG_VIDEO_CX25821) += cx25821/
 obj-$(CONFIG_VIDEO_CX88) += cx88/
 obj-$(CONFIG_VIDEO_DT3155) += dt3155/
+obj-$(CONFIG_VIDEO_HWS) += hws/
 obj-$(CONFIG_VIDEO_IVTV) += ivtv/
 obj-$(CONFIG_VIDEO_MGB4) += mgb4/
 obj-$(CONFIG_VIDEO_SAA7134) += saa7134/
diff --git a/drivers/media/pci/hws/Kconfig b/drivers/media/pci/hws/Kconfig
new file mode 100644
index 000000000000..569af697b0fa
--- /dev/null
+++ b/drivers/media/pci/hws/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_HWS
+	tristate "AVMatrix HWS PCIe capture devices"
+	depends on PCI && VIDEO_DEV && SND
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
+	select SND_PCM
+	help
+	  Enable support for AVMatrix HWS series multi-channel PCIe capture
+	  devices that provide HDMI video and stereo audio capture.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be named hws.
diff --git a/drivers/media/pci/hws/Makefile b/drivers/media/pci/hws/Makefile
new file mode 100644
index 000000000000..51aa2a3a0517
--- /dev/null
+++ b/drivers/media/pci/hws/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+hws-objs := hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o hws_audio.o
+
+obj-$(CONFIG_VIDEO_HWS) += hws.o
diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
new file mode 100644
index 000000000000..c3542e1253e0
--- /dev/null
+++ b/drivers/media/pci/hws/hws.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_PCIE_H
+#define HWS_PCIE_H
+
+#include <linux/types.h>
+#include <linux/dma-mapping.h>
+#include <linux/kthread.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/sizes.h>
+
+#include <sound/pcm.h>
+#include <sound/core.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "hws_reg.h"
+
+struct snd_pcm_substream;
+
+struct hwsmem_param {
+	u32 index;
+	u32 type;
+	u32 status;
+};
+
+struct hws_pix_state {
+	u32 width;
+	u32 height;
+	u32 fourcc;		/* V4L2_PIX_FMT_* (YUYV only here) */
+	u32 bytesperline;	/* stride */
+	u32 sizeimage;		/* full frame */
+	enum v4l2_field field;	/* V4L2_FIELD_NONE or INTERLACED */
+	enum v4l2_colorspace colorspace;	/* e.g., REC709 */
+	enum v4l2_ycbcr_encoding ycbcr_enc;	/* V4L2_YCBCR_ENC_DEFAULT */
+	enum v4l2_quantization quantization;	/* V4L2_QUANTIZATION_LIM_RANGE */
+	enum v4l2_xfer_func xfer_func;	/* V4L2_XFER_FUNC_DEFAULT */
+	bool interlaced;	/* cached hardware state */
+	u32 half_size;		/* optional: if your HW needs it */
+};
+
+#define	UNSET	(-1U)
+
+struct hws_pcie_dev;
+struct hws_adapter;
+
+struct hwsvideo_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	int slot;		/* for two-buffer approach */
+};
+
+struct hws_video {
+	/* ───── linkage ───── */
+	struct hws_pcie_dev *parent;	/* parent device */
+	struct video_device *video_device;
+
+	struct vb2_queue buffer_queue;
+	struct list_head capture_queue;
+	struct hwsvideo_buffer *active;
+
+	/* ───── locking ───── */
+	struct mutex state_lock;	/* primary state */
+	spinlock_t irq_lock;	/* ISR-side */
+	struct mutex qlock;
+
+	/* ───── indices ───── */
+	int channel_index;
+
+	/* ───── async helpers ───── */
+	struct tasklet_struct bh_tasklet;
+
+	/* ───── colour controls ───── */
+	int current_brightness;
+	int current_contrast;
+	int current_saturation;
+	int current_hue;
+
+	/* ───── V4L2 controls ───── */
+	struct v4l2_ctrl_handler control_handler;
+	struct v4l2_ctrl *hotplug_detect_control;
+	struct v4l2_ctrl *ctrl_brightness;
+	struct v4l2_ctrl *ctrl_contrast;
+	struct v4l2_ctrl *ctrl_saturation;
+	struct v4l2_ctrl *ctrl_hue;
+	/* ───── capture queue status ───── */
+	struct hws_pix_state pix;
+	u32 alloc_sizeimage;
+
+	/* ───── per-channel capture state ───── */
+	bool cap_active;
+	bool stop_requested;
+	u8 last_buf_half_toggle;
+	bool half_seen;
+	u32 sequence_number;
+
+	/* ───── timeout and error handling ───── */
+	u32 timeout_count;
+	u32 error_count;
+
+	/* ───── two-buffer approach ───── */
+	dma_addr_t ring_dma;
+	void *ring_cpu;
+	size_t ring_size;
+	u32 ring_toggle_prev;
+	u32 ring_toggle_hw;
+	bool ring_first_half_copied;
+	unsigned long ring_last_toggle_jiffies;
+	u32 queued_count;
+
+	/* ───── misc counters ───── */
+	int signal_loss_cnt;
+};
+
+struct hws_audio {
+	/* linkage */
+	struct hws_pcie_dev *parent;
+	int channel_index;
+
+	/* ALSA */
+	struct snd_pcm_substream *pcm_substream;
+	/* ring geometry (set in prepare/hw_params) */
+	u32 periods;
+	u32 period_bytes;
+	u32 next_period;
+
+	/* stream state */
+	bool cap_active;
+	bool stream_running;
+	bool stop_requested;
+
+	/* minimal HW period tracking  */
+	u8 last_period_toggle;
+	snd_pcm_uframes_t ring_wpos_byframes;
+	/* PCM format (for HW programming) */
+	u32 output_sample_rate;
+	u16 channel_count;
+	u16 bits_per_sample;
+};
+
+struct hws_scratch_dma {
+	void *cpu;
+	dma_addr_t dma;
+	size_t size;
+};
+
+struct hws_pcie_dev {
+	/* ───── core objects ───── */
+	struct pci_dev *pdev;
+	struct hws_audio audio[MAX_VID_CHANNELS];
+	struct hws_video video[MAX_VID_CHANNELS];
+
+	/* ───── BAR & workqueues ───── */
+	void __iomem *bar0_base;
+
+	/* ───── device identity / capabilities ───── */
+	u16 vendor_id;
+	u16 device_id;
+	u16 device_ver;
+	u16 hw_ver;
+	u32 sub_ver;
+	u32 port_id;
+	// TriState, used in `set_video_format_size`
+	u32 support_yv12;
+	u32 max_hw_video_buf_sz;
+	u8 max_channels;
+	u8 cur_max_video_ch;
+	u8 cur_max_linein_ch;
+	bool start_run;
+
+	bool buf_allocated;
+	u32 audio_pkt_size;
+
+	/* ───── V4L2 framework objects ───── */
+	struct v4l2_device v4l2_device;
+
+	struct snd_card *snd_card;
+
+	/* ───── kernel thread ───── */
+	struct task_struct *main_task;
+	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
+
+	bool suspended;
+	int irq;
+
+	/* ───── error flags ───── */
+	int pci_lost;
+
+};
+
+#endif
diff --git a/drivers/media/pci/hws/hws_audio.c b/drivers/media/pci/hws/hws_audio.c
new file mode 100644
index 000000000000..bfbc83f35f15
--- /dev/null
+++ b/drivers/media/pci/hws/hws_audio.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "hws_audio.h"
+
+#include "hws.h"
+#include "hws_reg.h"
+
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/rawmidi.h>
+#include <sound/initval.h>
+#include "hws_video.h"
+
+static const struct snd_pcm_hardware audio_pcm_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER | SNDRV_PCM_INFO_RESUME |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.buffer_bytes_max = 64 * 1024,
+	.period_bytes_min = 512,
+	.period_bytes_max = 16 * 1024,
+	.periods_min = 2,
+	.periods_max = 64,
+};
+
+static void hws_audio_hw_stop(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	if (!hws || ch >= hws->cur_max_linein_ch)
+		return;
+
+	/* Disable the channel */
+	hws_enable_audio_capture(hws, ch, false);
+
+	/* Flush posted write */
+	readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	/* Ack any latched ADONE so we don't get re-triggers */
+	{
+		u32 abit = HWS_INT_ADONE_BIT(ch);
+		u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+		if (st & abit) {
+			writel(abit, hws->bar0_base + HWS_REG_INT_ACK);
+			readl(hws->bar0_base + HWS_REG_INT_STATUS);
+		}
+	}
+}
+
+void hws_audio_program_next_period(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	struct hws_audio *a;
+	struct snd_pcm_substream *ss;
+	struct snd_pcm_runtime *rt;
+	u32 period_idx, axi_index;
+	dma_addr_t dma;
+	u32 addr_low;
+	const u32 addr_high = 0; /* 32-bit DMA mask => HIGH always 0 */
+	u32 pci_addr_lowmasked, bar_low_masked;
+	u32 table_off;
+	u32 length_units;
+
+	if (WARN_ON(!hws || ch >= hws->cur_max_linein_ch))
+		return;
+
+	a  = &hws->audio[ch];
+	ss = READ_ONCE(a->pcm_substream);
+	if (WARN_ON(!ss || !ss->runtime || !a->periods || !a->period_bytes))
+		return;
+
+	rt = ss->runtime;
+
+	/* Contiguous ALSA DMA buffer; offset = period_idx * period_bytes */
+	period_idx = a->next_period % a->periods;
+	dma = rt->dma_addr + (dma_addr_t)((size_t)period_idx * a->period_bytes);
+
+	/* 32-bit DMA mask guarantees upper_32_bits(dma) == 0 */
+	addr_low = lower_32_bits(dma);
+
+	pci_addr_lowmasked = (addr_low & PCI_E_BAR_ADD_LOWMASK); /* into AXI base */
+	bar_low_masked     = (addr_low & PCI_E_BAR_ADD_MASK);    /* into table LOW */
+
+	/* Legacy address-table layout: start 0x208, step 8 per channel */
+	table_off = 0x208u + (ch * 8u);
+
+	/* 1) Program PCIe address table: HIGH (0) then LOW (BAR-masked) */
+	writel(addr_high, hws->bar0_base + (PCI_ADDR_TABLE_BASE + table_off));
+	writel(bar_low_masked,
+	       hws->bar0_base + (PCI_ADDR_TABLE_BASE + table_off + PCIE_BARADDROFSIZE));
+
+	/* Optional posted-write flush/readback */
+	(void)readl(hws->bar0_base + (PCI_ADDR_TABLE_BASE + table_off));
+	(void)readl(hws->bar0_base + (PCI_ADDR_TABLE_BASE + table_off + PCIE_BARADDROFSIZE));
+
+	/* 2) Program AXI-visible base for AUDIO slot (8 + ch) */
+	axi_index = 8u + ch;
+	writel(((ch + 1u) * PCIEBAR_AXI_BASE) + pci_addr_lowmasked,
+	       hws->bar0_base + CVBS_IN_BUF_BASE + (axi_index * PCIE_BARADDROFSIZE));
+
+	/* 3) Program period length (legacy: bytes/16 granularity) */
+	length_units = (a->period_bytes / 16u);
+	writel(length_units,
+	       hws->bar0_base + (CVBS_IN_BUF_BASE2 + (ch * PCIE_BARADDROFSIZE)));
+
+	/* Optional flush */
+	(void)readl(hws->bar0_base + (CVBS_IN_BUF_BASE  + (axi_index * PCIE_BARADDROFSIZE)));
+	(void)readl(hws->bar0_base + (CVBS_IN_BUF_BASE2 + (ch * PCIE_BARADDROFSIZE)));
+
+	/* 4) Advance ring */
+	a->next_period = (period_idx + 1u) % a->periods;
+}
+
+int hws_audio_init_channel(struct hws_pcie_dev *pdev, int ch)
+{
+	struct hws_audio *aud;
+
+	if (!pdev || ch < 0 || ch >= pdev->max_channels)
+		return -EINVAL;
+
+	aud = &pdev->audio[ch];
+	memset(aud, 0, sizeof(*aud));     /* ok: no embedded locks yet */
+
+	/* identity */
+	aud->parent        = pdev;
+	aud->channel_index = ch;
+
+	/* defaults */
+	aud->output_sample_rate = 48000;
+	aud->channel_count      = 2;
+	aud->bits_per_sample    = 16;
+
+	/* ALSA linkage */
+	aud->pcm_substream = NULL;
+
+	/* ring geometry (set later in .prepare) */
+	aud->periods      = 0;
+	aud->period_bytes = 0;
+	aud->next_period  = 0;
+
+	/* stream state */
+	aud->cap_active     = false;
+	aud->stream_running = false;
+	aud->stop_requested = false;
+
+	/* HW readback sentinel */
+	aud->last_period_toggle = 0xFF;
+
+	return 0;
+}
+
+void hws_audio_cleanup_channel(struct hws_pcie_dev *pdev, int ch, bool device_removal)
+{
+	struct hws_audio *aud;
+
+	if (!pdev || ch < 0 || ch >= pdev->cur_max_linein_ch)
+		return;
+
+	aud = &pdev->audio[ch];
+
+	/* 1) Make IRQ path a no-op first */
+	WRITE_ONCE(aud->stream_running, false);
+	WRITE_ONCE(aud->cap_active,     false);
+	WRITE_ONCE(aud->stop_requested, true);
+	smp_wmb();  /* publish flags before touching HW */
+
+	/* 2) Quiesce hardware (disable ch, flush, ack pending ADONE) */
+	hws_audio_hw_stop(pdev, ch);  /* should disable capture and ack pending */
+
+	/* 3) If device is going away and stream was open, tell ALSA */
+	if (device_removal && aud->pcm_substream) {
+		unsigned long flags;
+
+		snd_pcm_stream_lock_irqsave(aud->pcm_substream, flags);
+		if (aud->pcm_substream->runtime)
+			snd_pcm_stop(aud->pcm_substream, SNDRV_PCM_STATE_DISCONNECTED);
+		snd_pcm_stream_unlock_irqrestore(aud->pcm_substream, flags);
+		aud->pcm_substream = NULL;
+	}
+
+	/* 4) Clear book-keeping (optional) */
+	aud->next_period        = 0;
+	aud->last_period_toggle = 0xFF;
+	aud->periods            = 0;
+	aud->period_bytes       = 0;
+}
+
+static inline bool hws_check_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 reg = readl(hws->bar0_base + HWS_REG_ACAP_ENABLE);
+
+	return !!(reg & BIT(ch));
+}
+
+int hws_start_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	int ret;
+
+	if (!hws || ch >= hws->cur_max_linein_ch)
+		return -EINVAL;
+
+	/* Already running? Re-assert HW if needed. */
+	if (READ_ONCE(hws->audio[ch].stream_running)) {
+		if (!hws_check_audio_capture(hws, ch)) {
+			hws_check_card_status(hws);
+			hws_enable_audio_capture(hws, ch, true);
+		}
+		dev_dbg(&hws->pdev->dev, "audio ch%u already running (re-enabled)\n", ch);
+		return 0;
+	}
+
+	ret = hws_check_card_status(hws);
+	if (ret)
+		return ret;
+
+	hws->audio[ch].ring_wpos_byframes = 0;
+
+	/* Prime first period before enabling the engine */
+	hws->audio[ch].next_period = 0;
+	hws_audio_program_next_period(hws, ch);
+
+	/* Flip state visible to IRQ */
+	WRITE_ONCE(hws->audio[ch].stop_requested, false);
+	WRITE_ONCE(hws->audio[ch].stream_running, true);
+	WRITE_ONCE(hws->audio[ch].cap_active, true);
+
+	/* Kick HW */
+	hws_enable_audio_capture(hws, ch, true);
+	return 0;
+}
+
+static inline void hws_audio_ack_pending(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 abit = HWS_INT_ADONE_BIT(ch);
+
+	u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	if (st & abit) {
+		writel(abit, hws->bar0_base + HWS_REG_INT_ACK);
+		/* flush posted write */
+		readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+static inline void hws_audio_ack_all(struct hws_pcie_dev *hws)
+{
+	u32 mask = 0;
+
+	for (unsigned int ch = 0; ch < hws->cur_max_linein_ch; ch++)
+		mask |= HWS_INT_ADONE_BIT(ch);
+	if (mask) {
+		writel(mask, hws->bar0_base + HWS_REG_INT_ACK);
+		readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+void hws_stop_audio_capture(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	if (!hws || ch >= hws->cur_max_linein_ch)
+		return;
+
+	if (!READ_ONCE(hws->audio[ch].stream_running))
+		return;
+
+	/* 1) Publish software state so IRQ path becomes a no-op */
+	WRITE_ONCE(hws->audio[ch].stream_running, false);
+	WRITE_ONCE(hws->audio[ch].cap_active,     false);
+	WRITE_ONCE(hws->audio[ch].stop_requested, true);
+	smp_wmb(); /* make sure flags are visible before HW disable */
+
+	/* 2) Disable channel in HW */
+	hws_enable_audio_capture(hws, ch, false);
+	/* flush posted write */
+	readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	/* 3) Ack any latched ADONE to prevent retrigger storms */
+	hws_audio_ack_pending(hws, ch);
+	hws->audio[ch].ring_wpos_byframes = 0;
+
+	dev_dbg(&hws->pdev->dev, "audio capture stopped on ch %u\n", ch);
+}
+
+void hws_enable_audio_capture(struct hws_pcie_dev *hws,
+			      unsigned int ch, bool enable)
+{
+	u32 reg, mask = BIT(ch);
+
+	if (!hws || ch >= hws->cur_max_linein_ch || hws->pci_lost)
+		return;
+
+	reg = readl(hws->bar0_base + HWS_REG_ACAP_ENABLE);
+	if (enable)
+		reg |= mask;
+	else
+		reg &= ~mask;
+
+	writel(reg, hws->bar0_base + HWS_REG_ACAP_ENABLE);
+
+	dev_dbg(&hws->pdev->dev, "audio capture %s ch%u, reg=0x%08x\n",
+		enable ? "enabled" : "disabled", ch, reg);
+}
+
+static snd_pcm_uframes_t hws_pcie_audio_pointer(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+
+	return READ_ONCE(a->ring_wpos_byframes);
+}
+
+static int hws_pcie_audio_open(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *rt = substream->runtime;
+
+	rt->hw = audio_pcm_hardware;
+	a->pcm_substream = substream;
+
+	snd_pcm_hw_constraint_integer(rt, SNDRV_PCM_HW_PARAM_PERIODS);
+	snd_pcm_hw_constraint_step(rt, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	snd_pcm_hw_constraint_step(rt, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	return 0;
+}
+
+static int hws_pcie_audio_close(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+
+	a->pcm_substream = NULL;
+	return 0;
+}
+
+static int hws_pcie_audio_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *hw_params)
+{
+	/* Using preallocation done at registration time; nothing to do. */
+	return 0;
+}
+
+static int hws_pcie_audio_hw_free(struct snd_pcm_substream *substream)
+{
+	return 0;
+}
+
+static int hws_pcie_audio_prepare(struct snd_pcm_substream *substream)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *rt = substream->runtime;
+
+	a->period_bytes = frames_to_bytes(rt, rt->period_size);
+	a->periods      = rt->periods;
+	a->next_period  = 0;
+
+	a->ring_wpos_byframes = 0;
+
+	/* Optional: clear HW toggle readback */
+	a->last_period_toggle = 0;
+	return 0;
+}
+
+static int hws_pcie_audio_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct hws_audio *a = snd_pcm_substream_chip(substream);
+	struct hws_pcie_dev *hws = a->parent;
+	unsigned int ch = a->channel_index;
+
+	dev_dbg(&hws->pdev->dev, "audio trigger %d on ch %u\n", cmd, ch);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		return hws_start_audio_capture(hws, ch);
+	case SNDRV_PCM_TRIGGER_STOP:
+		hws_stop_audio_capture(hws, ch);
+		return 0;
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		return hws_start_audio_capture(hws, ch);
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		hws_stop_audio_capture(hws, ch);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct snd_pcm_ops hws_pcie_pcm_ops = {
+	.open      = hws_pcie_audio_open,
+	.close     = hws_pcie_audio_close,
+	.ioctl     = snd_pcm_lib_ioctl,
+	.hw_params = hws_pcie_audio_hw_params,
+	.hw_free   = hws_pcie_audio_hw_free,
+	.prepare   = hws_pcie_audio_prepare,
+	.trigger   = hws_pcie_audio_trigger,
+	.pointer   = hws_pcie_audio_pointer,
+};
+
+int hws_audio_register(struct hws_pcie_dev *hws)
+{
+	struct snd_card *card = NULL;
+	struct snd_pcm  *pcm  = NULL;
+	char card_id[16];
+	char card_name[64];
+	int i, ret;
+
+	if (!hws)
+		return -EINVAL;
+
+	/* ---- Create a single ALSA card for this PCI function ---- */
+	snprintf(card_id, sizeof(card_id), "hws%u", hws->port_id);     /* <=16 chars */
+	snprintf(card_name, sizeof(card_name), "HWS HDMI Audio %u", hws->port_id);
+
+	ret = snd_card_new(&hws->pdev->dev, -1 /* auto index */,
+			   card_id, THIS_MODULE, 0, &card);
+	if (ret < 0) {
+		dev_err(&hws->pdev->dev, "snd_card_new failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_card_set_dev(card, &hws->pdev->dev);
+	strscpy(card->driver,   KBUILD_MODNAME, sizeof(card->driver));
+	strscpy(card->shortname, card_name,      sizeof(card->shortname));
+	strscpy(card->longname,  card->shortname, sizeof(card->longname));
+
+	/* ---- Create one PCM capture device per HDMI input ---- */
+	for (i = 0; i < hws->cur_max_linein_ch; i++) {
+		char pcm_name[32];
+
+		snprintf(pcm_name, sizeof(pcm_name), "HDMI In %d", i);
+
+		/* device number = i → userspace sees hw:X,i */
+		ret = snd_pcm_new(card, pcm_name, i,
+				  0 /* playback */, 1 /* capture */, &pcm);
+		if (ret < 0) {
+			dev_err(&hws->pdev->dev, "snd_pcm_new(%d) failed: %d\n", i, ret);
+			goto error_card;
+		}
+
+		/* Tie this PCM to channel i */
+		hws->audio[i].parent        = hws;
+		hws->audio[i].channel_index = i;
+		hws->audio[i].pcm_substream = NULL;
+		hws->audio[i].cap_active    = false;
+		hws->audio[i].stream_running = false;
+		hws->audio[i].stop_requested = false;
+		hws->audio[i].last_period_toggle = 0;
+		hws->audio[i].output_sample_rate = 48000;
+		hws->audio[i].channel_count      = 2;
+		hws->audio[i].bits_per_sample    = 16;
+
+		pcm->private_data = &hws->audio[i];
+		strscpy(pcm->name, pcm_name, sizeof(pcm->name));
+		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &hws_pcie_pcm_ops);
+
+		/* ALSA-owned DMA buffer, device-visible (no scratch buffer) */
+		snd_pcm_lib_preallocate_pages_for_all(pcm,
+						      SNDRV_DMA_TYPE_DEV,
+						      &hws->pdev->dev,
+						      audio_pcm_hardware.buffer_bytes_max,
+						      audio_pcm_hardware.buffer_bytes_max);
+	}
+
+	/* Register the card once all PCMs are created */
+	ret = snd_card_register(card);
+	if (ret < 0) {
+		dev_err(&hws->pdev->dev, "snd_card_register failed: %d\n", ret);
+		goto error_card;
+	}
+
+	/* Store the single card handle (optional: also mirror to each channel if you like) */
+	hws->snd_card = card;
+	dev_info(&hws->pdev->dev, "audio registration complete (%d HDMI inputs)\n",
+		 hws->cur_max_linein_ch);
+	return 0;
+
+error_card:
+	/* Frees all PCMs created on it as well */
+	snd_card_free(card);
+	return ret;
+}
+
+void hws_audio_unregister(struct hws_pcie_dev *hws)
+{
+	if (!hws)
+		return;
+
+	/* Prevent new opens and mark existing streams disconnected */
+	if (hws->snd_card)
+		snd_card_disconnect(hws->snd_card);
+
+	for (unsigned int i = 0; i < hws->cur_max_linein_ch; i++) {
+		struct hws_audio *a = &hws->audio[i];
+
+		/* Flip flags first so IRQ path won’t call ALSA anymore */
+		WRITE_ONCE(a->stream_running, false);
+		WRITE_ONCE(a->cap_active,     false);
+		WRITE_ONCE(a->stop_requested, true);
+		/* Publish stop flags before disabling capture in HW.
+		 * Ensures that any CPU/core handling an ADONE IRQ or bottom half
+		 * observes stream_running/cap_active=false before it sees the
+		 * effect of the MMIO write below. Pairs with READ_ONCE() checks
+		 * in the IRQ/BH paths so ALSA callbacks are never invoked after
+		 * the stream has been marked stopped.
+		 */
+		smp_wmb();
+		hws_enable_audio_capture(hws, i, false);
+	}
+	/* Flush and ack any pending audio interrupts across all channels */
+	readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	hws_audio_ack_all(hws);
+	if (hws->snd_card) {
+		snd_card_free_when_closed(hws->snd_card);
+		hws->snd_card = NULL;
+	}
+
+	dev_info(&hws->pdev->dev, "audio unregistered (%u channels)\n",
+		 hws->cur_max_linein_ch);
+}
+
+int hws_audio_pm_suspend_all(struct hws_pcie_dev *hws)
+{
+	struct snd_pcm *seen[ARRAY_SIZE(hws->audio)];
+	int seen_cnt = 0;
+	int i, j, ret = 0;
+
+	if (!hws || !hws->snd_card)
+		return 0;
+
+	/* Iterate audio channels and suspend each unique PCM device */
+	for (i = 0; i < hws->cur_max_linein_ch && i < ARRAY_SIZE(hws->audio); i++) {
+		struct hws_audio *a = &hws->audio[i];
+		struct snd_pcm_substream *ss = READ_ONCE(a->pcm_substream);
+		struct snd_pcm *pcm;
+		bool already = false;
+
+		if (!ss)
+			continue;
+
+		pcm = ss->pcm;
+		if (!pcm)
+			continue;
+
+		/* De-duplicate in case multiple channels share a PCM */
+		for (j = 0; j < seen_cnt; j++) {
+			if (seen[j] == pcm) {
+				already = true;
+				break;
+			}
+		}
+		if (already)
+			continue;
+
+		if (seen_cnt < ARRAY_SIZE(seen))
+			seen[seen_cnt++] = pcm;
+
+		if (!ret) {
+			int r = snd_pcm_suspend_all(pcm);
+
+			if (r)
+				ret = r;  /* remember first error, keep going */
+		}
+
+		if (seen_cnt == ARRAY_SIZE(seen))
+			break; /* defensive: shouldn't happen with sane config */
+	}
+
+	return ret;
+}
diff --git a/drivers/media/pci/hws/hws_audio.h b/drivers/media/pci/hws/hws_audio.h
new file mode 100644
index 000000000000..58072fe37dc0
--- /dev/null
+++ b/drivers/media/pci/hws/hws_audio.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_AUDIO_PIPELINE_H
+#define HWS_AUDIO_PIPELINE_H
+
+#include <linux/workqueue.h>
+#include <sound/pcm.h>
+#include "hws.h"
+
+void hws_audio_program_next_period(struct hws_pcie_dev *hws, unsigned int ch);
+int hws_audio_register(struct hws_pcie_dev *dev);
+void hws_audio_unregister(struct hws_pcie_dev *hws);
+void hws_enable_audio_capture(struct hws_pcie_dev *hws,
+			      unsigned int ch,
+			      bool enable);
+
+int  hws_start_audio_capture(struct hws_pcie_dev *pdx, unsigned int index);
+void hws_stop_audio_capture(struct hws_pcie_dev *pdx, unsigned int index);
+int hws_audio_init_channel(struct hws_pcie_dev *pdev, int ch);
+void hws_audio_cleanup_channel(struct hws_pcie_dev *pdev, int ch, bool device_removal);
+int hws_audio_pm_suspend_all(struct hws_pcie_dev *hws);
+
+#endif /* HWS_AUDIO_PIPELINE_H */
diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
new file mode 100644
index 000000000000..167516a449e8
--- /dev/null
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/compiler.h>
+#include <linux/io.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+
+#include <sound/pcm.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "hws_irq.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws_audio.h"
+
+#define MAX_INT_LOOPS 100
+
+static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
+{
+	struct hws_video *v = &hws->video[ch];
+	unsigned long flags;
+	struct hwsvideo_buffer *buf;
+
+	dev_dbg(&hws->pdev->dev,
+		"arm_next(ch=%u): stop=%d cap=%d queued=%d\n",
+		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
+		!list_empty(&v->capture_queue));
+
+	if (unlikely(READ_ONCE(hws->suspended))) {
+		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): suspended\n", ch);
+		return -EBUSY;
+	}
+
+	if (unlikely(READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active))) {
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): stop=%d cap=%d -> cancel\n", ch,
+			v->stop_requested, v->cap_active);
+		return -ECANCELED;
+	}
+
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (list_empty(&v->capture_queue)) {
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): queue empty\n", ch);
+		return -EAGAIN;
+	}
+
+	buf = list_first_entry(&v->capture_queue, struct hwsvideo_buffer, list);
+	list_del(&buf->list);
+	v->active = buf;
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): picked buffer %p\n", ch,
+		buf);
+
+	/* Publish descriptor(s) before doorbell/MMIO kicks. */
+	wmb();
+
+	/* Avoid MMIO during suspend */
+	if (unlikely(READ_ONCE(hws->suspended))) {
+		unsigned long f;
+
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): suspended after pick\n", ch);
+		spin_lock_irqsave(&v->irq_lock, f);
+		if (v->active) {
+			list_add(&buf->list, &v->capture_queue);
+			v->active = NULL;
+		}
+		spin_unlock_irqrestore(&v->irq_lock, f);
+		return -EBUSY;
+	}
+
+	/* Also program the DMA address register directly */
+	{
+		dma_addr_t dma_addr =
+		    vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(hws, ch, dma_addr);
+		iowrite32(lower_32_bits(dma_addr),
+			  hws->bar0_base + HWS_REG_DMA_ADDR(ch));
+	}
+
+	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
+		buf);
+	return 0;
+}
+
+void hws_bh_video(struct tasklet_struct *t)
+{
+	struct hws_video *v = from_tasklet(v, t, bh_tasklet);
+	struct hws_pcie_dev *hws = v->parent;
+	unsigned int ch = v->channel_index;
+	struct hwsvideo_buffer *done;
+
+	dev_dbg(&hws->pdev->dev,
+		"bh_video(ch=%u): stop=%d cap=%d active=%p\n",
+		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
+		v->active);
+
+	int ret;
+
+	dev_dbg(&hws->pdev->dev,
+		"bh_video(ch=%u): entry stop=%d cap=%d\n", ch,
+		v->stop_requested, v->cap_active);
+	if (unlikely(READ_ONCE(hws->suspended)))
+		return;
+
+	if (unlikely(READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active)))
+		return;
+
+	/* 1) Complete the buffer the HW just finished (if any) */
+	done = v->active;
+	if (done) {
+		struct vb2_v4l2_buffer *vb2v = &done->vb;
+
+		dma_rmb();	/* device writes visible before userspace sees it */
+
+		vb2v->sequence = ++v->sequence_number;	/* BH-only increment */
+		vb2v->vb2_buf.timestamp = ktime_get_ns();
+		dev_dbg(&hws->pdev->dev,
+			"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
+			ch, done, vb2v->sequence, v->half_seen,
+			v->last_buf_half_toggle);
+
+		v->active = NULL;	/* channel no longer owns this buffer */
+		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	if (unlikely(READ_ONCE(hws->suspended)))
+		return;
+
+	/* 2) Immediately arm the next queued buffer (if present) */
+	ret = hws_arm_next(hws, ch);
+	if (ret == -EAGAIN) {
+		dev_dbg(&hws->pdev->dev,
+			"bh_video(ch=%u): no queued buffer to arm\n", ch);
+		return;
+	}
+	dev_dbg(&hws->pdev->dev,
+		"bh_video(ch=%u): armed next buffer, active=%p\n", ch,
+		v->active);
+	/* On success the engine now points at v->active’s DMA address */
+}
+
+irqreturn_t hws_irq_handler(int irq, void *info)
+{
+	struct hws_pcie_dev *pdx = info;
+	u32 int_state, ack_mask = 0;
+
+	dev_dbg(&pdx->pdev->dev, "irq: entry\n");
+	if (likely(pdx->bar0_base)) {
+		dev_dbg(&pdx->pdev->dev,
+			"irq: INT_EN=0x%08x INT_STATUS=0x%08x\n",
+			readl(pdx->bar0_base + INT_EN_REG_BASE),
+			readl(pdx->bar0_base + HWS_REG_INT_STATUS));
+	}
+
+	/* Fast path: if suspended, quietly ack and exit */
+	if (unlikely(READ_ONCE(pdx->suspended))) {
+		int_state = readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+		if (int_state) {
+			writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
+			(void)readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+		}
+		return int_state ? IRQ_HANDLED : IRQ_NONE;
+	}
+	// u32 sys_status = readl(pdx->bar0_base + HWS_REG_SYS_STATUS);
+
+	int_state = readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+	if (!int_state || int_state == 0xFFFFFFFF) {
+		dev_dbg(&pdx->pdev->dev,
+			"irq: spurious or device-gone int_state=0x%08x\n",
+			int_state);
+		return IRQ_NONE;
+	}
+	dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=0x%08x\n", int_state);
+
+	/* Loop until all pending bits are serviced (max 100 iterations) */
+	for (u32 cnt = 0; int_state && cnt < MAX_INT_LOOPS; ++cnt) {
+		for (unsigned int ch = 0; ch < pdx->cur_max_video_ch; ++ch) {
+			u32 vbit = HWS_INT_VDONE_BIT(ch);
+
+			if (!(int_state & vbit))
+				continue;
+
+			ack_mask |= vbit;
+			/* Always schedule BH while streaming; don't gate on toggle bit */
+			if (likely(READ_ONCE(pdx->video[ch].cap_active) &&
+				   !READ_ONCE(pdx->video[ch].stop_requested))) {
+				/* Optional: snapshot toggle for debug visibility */
+				u32 toggle =
+				    readl(pdx->bar0_base +
+					  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
+				dma_rmb();	/* ensure DMA writes visible before we inspect */
+				WRITE_ONCE(pdx->video[ch].half_seen, true);
+				WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
+					   toggle);
+				dev_dbg(&pdx->pdev->dev,
+					"irq: VDONE ch=%u toggle=%u scheduling BH (cap=%d)\n",
+					ch, toggle,
+					READ_ONCE(pdx->video[ch].cap_active));
+				tasklet_schedule(&pdx->video[ch].bh_tasklet);
+			} else {
+				dev_dbg(&pdx->pdev->dev,
+					"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
+					ch,
+					READ_ONCE(pdx->video[ch].cap_active),
+					READ_ONCE(pdx->video[ch].stop_requested));
+			}
+		}
+
+		for (unsigned int ch = 0; ch < pdx->cur_max_linein_ch; ++ch) {
+			u32 abit = HWS_INT_ADONE_BIT(ch);
+
+			if (!(int_state & abit))
+				continue;
+
+			ack_mask |= abit;
+
+			/* Only service running streams */
+			if (!READ_ONCE(pdx->audio[ch].cap_active) ||
+			    !READ_ONCE(pdx->audio[ch].stream_running))
+				continue;
+
+			/* If your HW exposes a 0/1 toggle, read it (optional) */
+			pdx->audio[ch].last_period_toggle =
+			    readl(pdx->bar0_base +
+				  HWS_REG_ABUF_TOGGLE(ch)) & 0x01;
+
+			/* Make device writes visible before notifying ALSA */
+			dma_rmb();
+			/* Period accounting + rearm + notify ALSA. */
+			{
+				struct hws_audio *a = &pdx->audio[ch];
+				struct snd_pcm_substream *ss;
+				struct snd_pcm_runtime *rt;
+				snd_pcm_uframes_t pos;
+
+				ss = READ_ONCE(a->pcm_substream);
+				if (!ss)
+					continue;
+
+				rt = READ_ONCE(ss->runtime);
+				if (!rt)
+					continue;
+
+				/* Advance write pointer by exactly one period (frames). */
+				pos = READ_ONCE(a->ring_wpos_byframes);
+				pos += rt->period_size;
+				if (pos >= rt->buffer_size)
+					pos -= rt->buffer_size;
+				WRITE_ONCE(a->ring_wpos_byframes, pos);
+
+				/* Program the period the HW will fill next. */
+				if (likely(!READ_ONCE(a->stop_requested)))
+					hws_audio_program_next_period(pdx, ch);
+
+				/* Notify ALSA now that the hardware advanced. */
+				snd_pcm_period_elapsed(ss);
+			}
+		}
+
+		/* Acknowledge (clear) all bits we just handled */
+		writel(ack_mask, pdx->bar0_base + HWS_REG_INT_STATUS);
+		(void)readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+		dev_dbg(&pdx->pdev->dev, "irq: ACK mask=0x%08x\n", ack_mask);
+
+		/* Immediately clear ack_mask to avoid re-acknowledging stale bits */
+		ack_mask = 0;
+
+		/* Re‐read in case new interrupt bits popped while processing */
+		int_state = readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+		dev_dbg(&pdx->pdev->dev,
+			"irq: loop cnt=%u new INT_STATUS=0x%08x\n", cnt,
+			int_state);
+		if (cnt + 1 == MAX_INT_LOOPS)
+			dev_warn_ratelimited(&pdx->pdev->dev,
+					     "IRQ storm? status=0x%08x\n",
+					     int_state);
+	}
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/pci/hws/hws_irq.h b/drivers/media/pci/hws/hws_irq.h
new file mode 100644
index 000000000000..a85a196efa44
--- /dev/null
+++ b/drivers/media/pci/hws/hws_irq.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_INTERRUPT_H
+#define HWS_INTERRUPT_H
+
+#include <linux/pci.h>
+#include "hws.h"
+
+irqreturn_t hws_irq_handler(int irq, void *info);
+void hws_dpc_audio(unsigned long data);
+void hws_bh_video(struct tasklet_struct *t);
+
+#endif /* HWS_INTERRUPT_H */
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
new file mode 100644
index 000000000000..4b2d94e02ff0
--- /dev/null
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -0,0 +1,708 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/pci.h>
+#include <linux/types.h>
+#include <linux/iopoll.h>
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kthread.h>
+#include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm.h>
+#include <linux/freezer.h>
+#include <linux/pci_regs.h>
+
+#include <media/v4l2-ctrls.h>
+
+#include "hws.h"
+#include "hws_audio.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws_irq.h"
+#include "hws_v4l2_ioctl.h"
+
+#define DRV_NAME "hws"
+#define HWS_BUSY_POLL_DELAY_US 10
+#define HWS_BUSY_POLL_TIMEOUT_US 1000000
+
+/* register layout inside HWS_REG_DEVICE_INFO */
+#define DEVINFO_VER GENMASK(7, 0)
+#define DEVINFO_SUBVER GENMASK(15, 8)
+#define DEVINFO_YV12 GENMASK(31, 28)
+#define DEVINFO_HWKEY GENMASK(27, 24)
+#define DEVINFO_PORTID GENMASK(25, 24) /* low 2 bits of HW-key */
+
+#define MAKE_ENTRY(__vend, __chip, __subven, __subdev, __configptr) \
+	{ .vendor = (__vend),                                       \
+	  .device = (__chip),                                       \
+	  .subvendor = (__subven),                                  \
+	  .subdevice = (__subdev),                                  \
+	  .driver_data = (unsigned long)(__configptr) }
+
+#define LOG_DEC(tag)							\
+	dev_dbg(&hdev->pdev->dev, "DEC_MODE %s = 0x%08x\n",		\
+		(tag), readl(hdev->bar0_base + HWS_REG_DEC_MODE))
+
+static const struct pci_device_id hws_pci_table[] = {
+	MAKE_ENTRY(0x8888, 0x9534, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8534, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8554, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8524, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x6524, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8504, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x6504, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8532, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8512, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8501, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x6502, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8504, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8524, 0x8888, 0x0007, NULL),
+
+	{}
+};
+
+static void enable_pcie_relaxed_ordering(struct pci_dev *dev)
+{
+	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
+}
+
+static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
+{
+	u16 id = hdev->device_id;
+
+	/* select per-chip channel counts */
+	switch (id) {
+	case 0x9534:
+	case 0x6524:
+	case 0x8524:
+		hdev->cur_max_video_ch = 4;
+		hdev->cur_max_linein_ch = 1;
+		break;
+	case 0x8532:
+		hdev->cur_max_video_ch = 2;
+		hdev->cur_max_linein_ch = 1;
+		break;
+	case 0x8512:
+	case 0x6502:
+		hdev->cur_max_video_ch = 2;
+		hdev->cur_max_linein_ch = 0;
+		break;
+	case 0x8501:
+		hdev->cur_max_video_ch = 1;
+		hdev->cur_max_linein_ch = 0;
+		break;
+	default:
+		hdev->cur_max_video_ch = 4;
+		hdev->cur_max_linein_ch = 0;
+		break;
+	}
+
+	/* universal buffer capacity */
+	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
+
+	/* decide hardware-version and program DMA max size if needed */
+	if (hdev->device_ver > 121) {
+		if (id == 0x8501 && hdev->device_ver == 122) {
+			hdev->hw_ver = 0;
+		} else {
+			hdev->hw_ver = 1;
+			u32 dma_max = (u32)(MAX_VIDEO_SCALER_SIZE / 16);
+
+			writel(dma_max, hdev->bar0_base + HWS_REG_DMA_MAX_SIZE);
+			/* readback to flush posted MMIO write */
+			(void)readl(hdev->bar0_base + HWS_REG_DMA_MAX_SIZE);
+		}
+	} else {
+		hdev->hw_ver = 0;
+	}
+}
+
+static void hws_stop_device(struct hws_pcie_dev *hws);
+
+static int read_chip_id(struct hws_pcie_dev *hdev)
+{
+	u32 reg;
+	/* mirror PCI IDs for later switches */
+	hdev->device_id = hdev->pdev->device;
+	hdev->vendor_id = hdev->pdev->vendor;
+
+	reg = readl(hdev->bar0_base + HWS_REG_DEVICE_INFO);
+
+	hdev->device_ver = FIELD_GET(DEVINFO_VER, reg);
+	hdev->sub_ver = FIELD_GET(DEVINFO_SUBVER, reg);
+	hdev->support_yv12 = FIELD_GET(DEVINFO_YV12, reg);
+	hdev->port_id = FIELD_GET(DEVINFO_PORTID, reg);
+
+	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
+	hdev->max_channels = 4;
+	hdev->buf_allocated = false;
+	hdev->main_task = NULL;
+	hdev->audio_pkt_size = MAX_DMA_AUDIO_PK_SIZE;
+	hdev->start_run = false;
+	hdev->pci_lost = 0;
+
+	writel(0x00, hdev->bar0_base + HWS_REG_DEC_MODE);  LOG_DEC("after 0x00");
+	writel(0x10, hdev->bar0_base + HWS_REG_DEC_MODE); LOG_DEC("after 0x10");
+
+	hws_configure_hardware_capabilities(hdev);
+
+	dev_info(&hdev->pdev->dev,
+		 "chip detected: ver=%u subver=%u port=%u yv12=%u\n",
+		 hdev->device_ver, hdev->sub_ver, hdev->port_id,
+		 hdev->support_yv12);
+
+	return 0;
+}
+
+static int main_ks_thread_handle(void *data)
+{
+	struct hws_pcie_dev *pdx = data;
+	int i;
+	bool need_check;
+
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		/* If we’re suspending, don’t touch hardware; just sleep/freeeze */
+		if (READ_ONCE(pdx->suspended)) {
+			try_to_freeze();
+			schedule_timeout_interruptible(msecs_to_jiffies(1000));
+			continue;
+		}
+
+		need_check = false;
+
+		/* See if any channel is running */
+		for (i = 0; i < pdx->max_channels; i++) {
+			if (pdx->video[i].cap_active) {
+				need_check = true;
+				break;
+			}
+		}
+
+		if (need_check)
+			/* avoid MMIO when suspended (guarded above) */
+			check_video_format(pdx);
+
+		try_to_freeze(); /* cooperate with freezer each loop */
+
+		/* Sleep 1s or until signaled to wake/stop */
+		schedule_timeout_interruptible(msecs_to_jiffies(1000));
+	}
+
+	dev_dbg(&pdx->pdev->dev, "%s: exiting\n", __func__);
+	return 0;
+}
+
+static void hws_stop_kthread_action(void *data)
+{
+	struct task_struct *t = data;
+
+	if (!IS_ERR_OR_NULL(t))
+		kthread_stop(t);
+}
+
+static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
+{
+	int ch;
+	/* 64 KiB is plenty for a safe dummy; align to 64 for your HW */
+	const size_t need = ALIGN(64 * 1024, 64);
+
+	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
+#if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
+		void *cpu = dma_alloc_coherent(&hws->pdev->dev, need,
+					       &hws->scratch_vid[ch].dma,
+					       GFP_KERNEL);
+#else
+		void *cpu = NULL;
+#endif
+		if (!cpu) {
+			dev_warn(&hws->pdev->dev,
+				 "scratch: dma_alloc_coherent failed ch=%d\n", ch);
+			/* not fatal: free earlier ones and continue without seeding */
+			while (--ch >= 0) {
+				if (hws->scratch_vid[ch].cpu)
+					dma_free_coherent(&hws->pdev->dev,
+							  hws->scratch_vid[ch].size,
+							  hws->scratch_vid[ch].cpu,
+							  hws->scratch_vid[ch].dma);
+				hws->scratch_vid[ch].cpu = NULL;
+				hws->scratch_vid[ch].size = 0;
+			}
+			return -ENOMEM;
+		}
+		hws->scratch_vid[ch].cpu  = cpu;
+		hws->scratch_vid[ch].size = need;
+	}
+	return 0;
+}
+
+static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
+{
+	int ch;
+
+	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
+		if (hws->scratch_vid[ch].cpu) {
+			dma_free_coherent(&hws->pdev->dev,
+					  hws->scratch_vid[ch].size,
+					  hws->scratch_vid[ch].cpu,
+					  hws->scratch_vid[ch].dma);
+			hws->scratch_vid[ch].cpu = NULL;
+			hws->scratch_vid[ch].size = 0;
+		}
+	}
+}
+
+static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
+{
+	dma_addr_t paddr = hws->scratch_vid[ch].dma;
+	u32 lo = lower_32_bits(paddr);
+	u32 hi = upper_32_bits(paddr);
+	u32 pci_addr = lo & PCI_E_BAR_ADD_LOWMASK;
+
+	lo &= PCI_E_BAR_ADD_MASK;
+
+	/* Program 64-bit BAR remap entry for this channel (table @ 0x208 + ch * 8) */
+	writel_relaxed(hi, hws->bar0_base +
+			    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8);
+	writel_relaxed(lo, hws->bar0_base +
+			    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8 +
+			    PCIE_BARADDROFSIZE);
+
+	/* Program capture engine per-channel base/half */
+	writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
+		       hws->bar0_base + CVBS_IN_BUF_BASE +
+		       ch * PCIE_BARADDROFSIZE);
+
+	/* half size: use either the current format’s half or half of scratch */
+	{
+		u32 half = hws->video[ch].pix.half_size ?
+			hws->video[ch].pix.half_size :
+			(u32)(hws->scratch_vid[ch].size / 2);
+
+		writel_relaxed(half / 16,
+			       hws->bar0_base + CVBS_IN_BUF_BASE2 +
+			       ch * PCIE_BARADDROFSIZE);
+	}
+
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush posted writes */
+}
+
+static void hws_seed_all_channels(struct hws_pcie_dev *hws)
+{
+	int ch;
+
+	for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
+		if (hws->scratch_vid[ch].cpu)
+			hws_seed_channel(hws, ch);
+	}
+}
+
+static void hws_irq_mask_gate(struct hws_pcie_dev *hws)
+{
+	writel(0x00000000, hws->bar0_base + INT_EN_REG_BASE);
+	(void)readl(hws->bar0_base + INT_EN_REG_BASE);
+}
+
+static void hws_irq_unmask_gate(struct hws_pcie_dev *hws)
+{
+	writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
+	(void)readl(hws->bar0_base + INT_EN_REG_BASE);
+}
+
+static void hws_irq_clear_pending(struct hws_pcie_dev *hws)
+{
+	u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	if (st) {
+		writel(st, hws->bar0_base + HWS_REG_INT_STATUS); /* W1C */
+		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
+{
+	struct hws_pcie_dev *hws;
+	int i, ret, irq;
+	unsigned long irqf = 0;
+
+	/* devres-backed device object */
+	hws = devm_kzalloc(&pdev->dev, sizeof(*hws), GFP_KERNEL);
+	if (!hws)
+		return -ENOMEM;
+
+	hws->pdev = pdev;
+	hws->irq = -1;
+	hws->suspended = false;
+	pci_set_drvdata(pdev, hws);
+
+	/* 1) Enable device + bus mastering (managed) */
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pcim_enable_device\n");
+	pci_set_master(pdev);
+
+	/* 2) Map BAR0 (managed) */
+	ret = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pcim_iomap_regions BAR0\n");
+	hws->bar0_base = pcim_iomap_table(pdev)[0];
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "No 32-bit DMA support\n");
+
+	/* 3) Optional PCIe tuning (same as before) */
+	enable_pcie_relaxed_ordering(pdev);
+#ifdef CONFIG_ARCH_TI816X
+	pcie_set_readrq(pdev, 128);
+#endif
+
+	/* 4) Identify chip & capabilities */
+	read_chip_id(hws);
+	dev_info(&pdev->dev, "Device VID=0x%04x DID=0x%04x\n",
+		 pdev->vendor, pdev->device);
+	hws_init_video_sys(hws, false);
+
+	/* 5) Init channels (video/audio state, locks, vb2, ctrls) */
+	for (i = 0; i < hws->max_channels; i++) {
+		ret = hws_video_init_channel(hws, i);
+		if (ret) {
+			dev_err(&pdev->dev, "video channel init failed (ch=%d)\n", i);
+			goto err_unwind_channels;
+		}
+		ret = hws_audio_init_channel(hws, i);
+		if (ret) {
+			dev_err(&pdev->dev, "audio channel init failed (ch=%d)\n", i);
+			goto err_unwind_channels;
+		}
+	}
+
+	/* 6) Allocate scratch DMA and seed BAR table + channel base/half (legacy SetDMAAddress) */
+	ret = hws_alloc_seed_buffers(hws);
+	if (!ret)
+		hws_seed_all_channels(hws);
+
+	/* 7) Start-run sequence (like InitVideoSys) */
+	hws_init_video_sys(hws, false);
+
+	/* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., IRQF_SHARED) */
+	pci_intx(pdev, 1);
+	irqf = IRQF_SHARED;
+	irq = pdev->irq;
+	hws->irq = irq;
+	dev_info(&pdev->dev, "IRQ mode: legacy INTx (shared), irq=%d\n", irq);
+
+	/* B) Mask the device's global/bridge gate (INT_EN_REG_BASE) */
+	hws_irq_mask_gate(hws);
+
+	/* C) Clear any sticky pending interrupt status (W1C) before we arm the line */
+	hws_irq_clear_pending(hws);
+
+	/* D) Request the legacy shared interrupt line (no vectors/MSI/MSI-X) */
+	ret = devm_request_irq(&pdev->dev, irq, hws_irq_handler, irqf,
+			       dev_name(&pdev->dev), hws);
+	if (ret) {
+		dev_err(&pdev->dev, "request_irq(%d) failed: %d\n", irq, ret);
+		goto err_unwind_channels;
+	}
+
+	/* E) Set the global interrupt enable bit in main control register */
+	{
+		u32 ctl_reg = readl(hws->bar0_base + HWS_REG_CTL);
+
+		ctl_reg |= HWS_CTL_IRQ_ENABLE_BIT;
+		writel(ctl_reg, hws->bar0_base + HWS_REG_CTL);
+		(void)readl(hws->bar0_base + HWS_REG_CTL); /* flush write */
+		dev_info(&pdev->dev, "Global IRQ enable bit set in control register\n");
+	}
+
+	/* F) Open the global gate just like legacy did */
+	hws_irq_unmask_gate(hws);
+	dev_info(&pdev->dev, "INT_EN_GATE readback=0x%08x\n",
+		 readl(hws->bar0_base + INT_EN_REG_BASE));
+
+	/* 11) Register V4L2/ALSA */
+	ret = hws_video_register(hws);
+	if (ret) {
+		dev_err(&pdev->dev, "video_register: %d\n", ret);
+		goto err_unwind_channels;
+	}
+	ret = hws_audio_register(hws);
+	if (ret) {
+		dev_err(&pdev->dev, "audio_register: %d\n", ret);
+		hws_video_unregister(hws);
+		goto err_unwind_channels;
+	}
+
+	/* 12) Background monitor thread (managed) */
+	hws->main_task = kthread_run(main_ks_thread_handle, hws, "hws-mon");
+	if (IS_ERR(hws->main_task)) {
+		ret = PTR_ERR(hws->main_task);
+		hws->main_task = NULL;
+		dev_err(&pdev->dev, "kthread_run: %d\n", ret);
+		goto err_unregister_va;
+	}
+	ret = devm_add_action_or_reset(&pdev->dev, hws_stop_kthread_action, hws->main_task);
+	if (ret) {
+		dev_err(&pdev->dev, "devm_add_action kthread_stop: %d\n", ret);
+		goto err_unregister_va; /* reset already stopped the thread */
+	}
+
+	/* 13) Final: show the line is armed */
+	dev_info(&pdev->dev, "irq handler installed on irq=%d\n", irq);
+	return 0;
+
+err_unregister_va:
+	hws_stop_device(hws);
+	hws_audio_unregister(hws);
+	hws_video_unregister(hws);
+	hws_free_seed_buffers(hws);
+err_unwind_channels:
+	hws_free_seed_buffers(hws);
+	while (--i >= 0) {
+		hws_video_cleanup_channel(hws, i);
+		hws_audio_cleanup_channel(hws, i, true);
+	}
+	return ret;
+}
+
+static int hws_check_busy(struct hws_pcie_dev *pdx)
+{
+	void __iomem *reg = pdx->bar0_base + HWS_REG_SYS_STATUS;
+	u32 val;
+	int ret;
+
+	/* poll until !(val & BUSY_BIT), sleeping HWS_BUSY_POLL_DELAY_US between reads */
+	ret = readl_poll_timeout(reg, val, !(val & HWS_SYS_DMA_BUSY_BIT),
+				 HWS_BUSY_POLL_DELAY_US,
+				 HWS_BUSY_POLL_TIMEOUT_US);
+	if (ret) {
+		dev_err(&pdx->pdev->dev,
+			"SYS_STATUS busy bit never cleared (0x%08x)\n", val);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void hws_stop_dsp(struct hws_pcie_dev *hws)
+{
+	u32 status;
+
+	/* Read the decoder mode/status register */
+	status = readl(hws->bar0_base + HWS_REG_DEC_MODE);
+	dev_dbg(&hws->pdev->dev, "%s: status=0x%08x\n", __func__, status);
+
+	/* If the device looks unplugged/stuck, bail out */
+	if (status == 0xFFFFFFFF)
+		return;
+
+	/* Tell the DSP to stop */
+	writel(0x10, hws->bar0_base + HWS_REG_DEC_MODE);
+
+	if (hws_check_busy(hws))
+		dev_warn(&hws->pdev->dev, "DSP busy timeout on stop\n");
+	/* Disable video capture engine in the DSP */
+	writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
+}
+
+/* Publish stop so ISR/BH won’t touch ALSA/VB2 anymore. */
+static void hws_publish_stop_flags(struct hws_pcie_dev *hws)
+{
+	unsigned int i;
+
+	for (i = 0; i < hws->cur_max_video_ch; ++i) {
+		struct hws_video *v = &hws->video[i];
+
+		WRITE_ONCE(v->cap_active,     false);
+		WRITE_ONCE(v->stop_requested, true);
+	}
+
+	for (i = 0; i < hws->cur_max_linein_ch; ++i) {
+		struct hws_audio *a = &hws->audio[i];
+
+		WRITE_ONCE(a->stream_running, false);
+		WRITE_ONCE(a->cap_active,     false);
+		WRITE_ONCE(a->stop_requested, true);
+	}
+
+	smp_wmb(); /* make flags visible before we touch MMIO/queues */
+}
+
+/* Drain engines + ISR/BH after flags are published. */
+static void hws_drain_after_stop(struct hws_pcie_dev *hws)
+{
+	u32 ackmask = 0;
+	unsigned int i;
+
+	/* Mask device enables: no new DMA starts. */
+	writel(0x0, hws->bar0_base + HWS_REG_VCAP_ENABLE);
+	writel(0x0, hws->bar0_base + HWS_REG_ACAP_ENABLE);
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush */
+
+	/* Let any in-flight DMAs finish (best-effort). */
+	(void)hws_check_busy(hws);
+
+	/* Kill video tasklets to avoid late BH completions. */
+	for (i = 0; i < hws->cur_max_video_ch; ++i)
+		tasklet_kill(&hws->video[i].bh_tasklet);
+
+	/* Ack any latched VDONE/ADONE. */
+	for (i = 0; i < hws->cur_max_video_ch; ++i)
+		ackmask |= HWS_INT_VDONE_BIT(i);
+	for (i = 0; i < hws->cur_max_linein_ch; ++i)
+		ackmask |= HWS_INT_ADONE_BIT(i);
+	if (ackmask) {
+		writel(ackmask, hws->bar0_base + HWS_REG_INT_STATUS);
+		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+
+	/* Ensure no hard IRQ is still running. */
+	if (hws->irq >= 0)
+		synchronize_irq(hws->irq);
+}
+
+static void hws_stop_device(struct hws_pcie_dev *hws)
+{
+	u32 status = readl(hws->bar0_base + HWS_REG_PIPE_BASE(0));
+
+	dev_dbg(&hws->pdev->dev, "%s: status=0x%08x\n", __func__, status);
+	if (status == 0xFFFFFFFF) {
+		hws->pci_lost = true;
+		goto out;
+	}
+
+	/* Make ISR/BH a no-op, then drain engines/IRQ. */
+	hws_publish_stop_flags(hws);
+	hws_drain_after_stop(hws);
+
+	/* 1) Stop the on-board DSP */
+	hws_stop_dsp(hws);
+
+out:
+	hws->start_run = false;
+	dev_dbg(&hws->pdev->dev, "%s: complete\n", __func__);
+}
+
+static void hws_remove(struct pci_dev *pdev)
+{
+	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
+	int i;
+
+	if (!hws)
+		return;
+
+	/* Stop hardware / capture cleanly (your helper) */
+	hws_stop_device(hws);
+
+	/* Unregister subsystems you registered */
+	hws_audio_unregister(hws);
+	hws_video_unregister(hws);
+
+	/* Per-channel teardown */
+	for (i = 0; i < hws->max_channels; i++) {
+		hws_video_cleanup_channel(hws, i);
+		hws_audio_cleanup_channel(hws, i, true);
+	}
+
+	/* Release seeded DMA buffers */
+	hws_free_seed_buffers(hws);
+	/* kthread is stopped by the devm action you added in probe */
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int hws_pm_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
+
+	/* Block monitor thread / any hot path from MMIO */
+	WRITE_ONCE(hws->suspended, true);
+	if (hws->irq >= 0)
+		disable_irq(hws->irq);
+
+	/* Gracefully quiesce userspace I/O first */
+	hws_audio_pm_suspend_all(hws);          /* ALSA: stop substreams */
+	hws_video_pm_suspend(hws);               /* VB2: streamoff + drain + discard */
+
+	/* Quiesce hardware (DSP/engines) */
+	hws_stop_device(hws);
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+
+	return 0;
+}
+
+static int hws_pm_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct hws_pcie_dev *hws = pci_get_drvdata(pdev);
+	int ret;
+
+	/* Back to D0 and re-enable the function */
+	pci_set_power_state(pdev, PCI_D0);
+
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		dev_err(dev, "pci_enable_device: %d\n", ret);
+		return ret;
+	}
+	pci_restore_state(pdev);
+	pci_set_master(pdev);
+
+	/* Reapply any PCIe tuning lost across D3 */
+	enable_pcie_relaxed_ordering(pdev);
+
+	/* Reinitialize chip-side capabilities / registers */
+	read_chip_id(hws);
+
+	/* IRQs can be re-enabled now that MMIO is sane */
+	if (hws->irq >= 0)
+		enable_irq(hws->irq);
+
+	WRITE_ONCE(hws->suspended, false);
+
+	/* vb2: nothing mandatory; userspace will STREAMON again when ready */
+	hws_video_pm_resume(hws);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(hws_pm_ops, hws_pm_suspend, hws_pm_resume);
+# define HWS_PM_OPS (&hws_pm_ops)
+#else
+# define HWS_PM_OPS NULL
+#endif
+
+static struct pci_driver hws_pci_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = hws_pci_table,
+	.probe = hws_probe,
+	.remove = hws_remove,
+	.driver = {
+		.pm = HWS_PM_OPS,
+	},
+};
+
+MODULE_DEVICE_TABLE(pci, hws_pci_table);
+
+static int __init pcie_hws_init(void)
+{
+	return pci_register_driver(&hws_pci_driver);
+}
+
+static void __exit pcie_hws_exit(void)
+{
+	pci_unregister_driver(&hws_pci_driver);
+}
+
+module_init(pcie_hws_init);
+module_exit(pcie_hws_exit);
+
+MODULE_DESCRIPTION(DRV_NAME);
+MODULE_AUTHOR("Ben Hoff <hoff.benjamin.k@gmail.com>");
+MODULE_AUTHOR("Sales <sales@avmatrix.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
new file mode 100644
index 000000000000..f81ebddfc41d
--- /dev/null
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _HWS_PCIE_REG_H
+#define _HWS_PCIE_REG_H
+
+#include <linux/bits.h>
+#include <linux/sizes.h>
+
+#define XDMA_CHANNEL_NUM_MAX (1)
+#define MAX_NUM_ENGINES (XDMA_CHANNEL_NUM_MAX * 2)
+
+#define  PCIE_BARADDROFSIZE 4u
+
+#define PCI_BUS_ACCESS_BASE       0x00000000U
+#define INT_EN_REG_BASE           (PCI_BUS_ACCESS_BASE + 0x0134U)
+#define PCIEBR_EN_REG_BASE        (PCI_BUS_ACCESS_BASE + 0x0148U)
+#define PCIE_INT_DEC_REG_BASE     (PCI_BUS_ACCESS_BASE + 0x0138U)
+
+#define HWS_INT_EN_MASK           0x0003FFFFU
+
+#define PCIEBAR_AXI_BASE 0x20000000U
+
+#define CTL_REG_ACC_BASE 0x0
+#define PCI_ADDR_TABLE_BASE CTL_REG_ACC_BASE
+
+#define CVBS_IN_BASE              0x00004000U
+#define CVBS_IN_BUF_BASE          (CVBS_IN_BASE + (16U * PCIE_BARADDROFSIZE))
+#define CVBS_IN_BUF_BASE2         (CVBS_IN_BASE + (50U * PCIE_BARADDROFSIZE))
+
+/* 2 Mib */
+#define MAX_L_VIDEO_SIZE			0x200000U
+
+#define PCI_E_BAR_PAGE_SIZE 0x20000000
+#define PCI_E_BAR_ADD_MASK 0xE0000000
+#define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
+
+#define MAX_DMA_AUDIO_PK_SIZE      (128U * 16U * 2U)
+
+#define MAX_VID_CHANNELS            4
+
+#define MAX_MM_VIDEO_SIZE            SZ_4M
+
+#define MAX_VIDEO_HW_W 1920
+#define MAX_VIDEO_HW_H 1080
+#define MAX_VIDEO_SCALER_SIZE     (1920U * 1080U * 2U)
+
+#define MIN_VAMP_BRIGHTNESS_UNITS   0
+#define MAX_VAMP_BRIGHTNESS_UNITS   0xff
+
+#define MIN_VAMP_CONTRAST_UNITS     0
+#define MAX_VAMP_CONTRAST_UNITS     0xff
+
+#define MIN_VAMP_SATURATION_UNITS   0
+#define MAX_VAMP_SATURATION_UNITS   0xff
+
+#define MIN_VAMP_HUE_UNITS          0
+#define MAX_VAMP_HUE_UNITS          0xff
+
+#define HWS_BRIGHTNESS_DEFAULT       0x80
+#define HWS_CONTRAST_DEFAULT         0x80
+#define HWS_SATURATION_DEFAULT       0x80
+#define HWS_HUE_DEFAULT              0x00
+
+/* Core/global status registers */
+#define HWS_REG_SYS_STATUS           (CVBS_IN_BASE + 0 * PCIE_BARADDROFSIZE)
+/* Bit 3 indicates DMA busy; bit 2 indicates an interrupt. */
+#define HWS_SYS_DMA_BUSY_BIT         BIT(3)   /* 0x08 = DMA busy flag */
+
+#define HWS_REG_DEC_MODE             (CVBS_IN_BASE + 0 * PCIE_BARADDROFSIZE)
+#define HWS_REG_CTL                  (CVBS_IN_BASE + 4 * PCIE_BARADDROFSIZE)
+/* Global interrupt enable bit inside HWS_REG_CTL. */
+#define HWS_CTL_IRQ_ENABLE_BIT       BIT(0)
+/*
+ * Write 0x00 to fully reset the decoder.
+ * Set bit 31=1 to "start run".
+ * Low byte=0x13 selects YUYV/BT.709/etc.
+ * During chip ID sequencing we also write 0x00 and 0x10 here.
+ */
+
+/* Per-pipe base: 0x4000, stride 0x800. */
+#define HWS_REG_PIPE_BASE(n)         (CVBS_IN_BASE + ((n) * 0x800))
+#define HWS_REG_HPD(n)               (HWS_REG_PIPE_BASE(n) + 0x14)  /* +5 V & HPD */
+
+/* Handy bit masks */
+#define HWS_HPD_BIT                  BIT(0)      /* hot-plug detect */
+#define HWS_5V_BIT                   BIT(3)      /* cable +5-volt */
+
+/* Per-channel done flags */
+#define HWS_REG_INT_STATUS           (CVBS_IN_BASE + 1 * PCIE_BARADDROFSIZE)
+#define HWS_SYS_BUSY_BIT             BIT(2)      /* matches legacy 0x04 test */
+
+/* Capture enable switches */
+#define HWS_REG_VCAP_ENABLE          (CVBS_IN_BASE + 2 * PCIE_BARADDROFSIZE)
+#define HWS_REG_ACAP_ENABLE          (CVBS_IN_BASE + 3 * PCIE_BARADDROFSIZE)
+#define HWS_REG_ACTIVE_STATUS        (CVBS_IN_BASE + 5 * PCIE_BARADDROFSIZE)
+#define HWS_REG_HDCP_STATUS          (CVBS_IN_BASE + 8 * PCIE_BARADDROFSIZE)
+#define HWS_REG_DMA_MAX_SIZE         (CVBS_IN_BASE + 9 * PCIE_BARADDROFSIZE)
+
+/* Buffer addresses written during init/reset */
+#define HWS_REG_VBUF1_ADDR           (CVBS_IN_BASE + 25 * PCIE_BARADDROFSIZE)
+#define HWS_REG_DMA_ADDR(ch)         (CVBS_IN_BASE + (26 + (ch)) * PCIE_BARADDROFSIZE)
+
+/* Per-channel live buffer toggles */
+#define HWS_REG_VBUF_TOGGLE(ch)      (CVBS_IN_BASE + (32 + (ch)) * PCIE_BARADDROFSIZE)
+/* Returns 0 or 1 to indicate which half of the video ring DMA is filling. */
+#define HWS_REG_ABUF_TOGGLE(ch)      (CVBS_IN_BASE + (40 + (ch)) * PCIE_BARADDROFSIZE)
+/* Returns 0 or 1 to indicate which half of the audio ring DMA is filling. */
+
+/* Interrupt bits (video 0-3, audio 0-3) */
+#define HWS_INT_VDONE_BIT(ch)        BIT(ch)         /* 0x01,0x02,0x04,0x08 */
+#define HWS_INT_ADONE_BIT(ch)        BIT(8 + (ch))   /* 0x100 .. 0x800 */
+
+#define HWS_REG_INT_ACK              (CVBS_IN_BASE + 0x4000 + 1 * PCIE_BARADDROFSIZE)
+
+/* Miscellaneous per-channel registers */
+#define HWS_REG_IN_RES(ch)           (CVBS_IN_BASE + (90 + (ch) * 2) * PCIE_BARADDROFSIZE)
+#define HWS_REG_BCHS(ch)             (CVBS_IN_BASE + (91 + (ch) * 2) * PCIE_BARADDROFSIZE)
+#define HWS_REG_FRAME_RATE(ch)       (CVBS_IN_BASE + (110 + (ch)) * PCIE_BARADDROFSIZE)
+#define HWS_REG_OUT_RES(ch)          (CVBS_IN_BASE + (120 + (ch)) * PCIE_BARADDROFSIZE)
+#define HWS_REG_OUT_FRAME_RATE(ch)   (CVBS_IN_BASE + (130 + (ch)) * PCIE_BARADDROFSIZE)
+
+/* Device version / port ID / subversion register */
+#define HWS_REG_DEVICE_INFO          (CVBS_IN_BASE + 88 * PCIE_BARADDROFSIZE)
+/*
+ * Reading this 32-bit word returns:
+ *   bits  7:0   = device version
+ *   bits 15:8   = device sub-version
+ *   bits 23:24  = HW key / port ID
+ *   bits 31:28  = support YV12 flags
+ */
+
+/* Convenience aliases for individual channels */
+#define HWS_REG_VBUF_TOGGLE_CH0      HWS_REG_VBUF_TOGGLE(0)
+#define HWS_REG_VBUF_TOGGLE_CH1      HWS_REG_VBUF_TOGGLE(1)
+#define HWS_REG_VBUF_TOGGLE_CH2      HWS_REG_VBUF_TOGGLE(2)
+#define HWS_REG_VBUF_TOGGLE_CH3      HWS_REG_VBUF_TOGGLE(3)
+
+#define HWS_REG_ABUF_TOGGLE_CH0      HWS_REG_ABUF_TOGGLE(0)
+#define HWS_REG_ABUF_TOGGLE_CH1      HWS_REG_ABUF_TOGGLE(1)
+#define HWS_REG_ABUF_TOGGLE_CH2      HWS_REG_ABUF_TOGGLE(2)
+#define HWS_REG_ABUF_TOGGLE_CH3      HWS_REG_ABUF_TOGGLE(3)
+
+#endif /* _HWS_PCIE_REG_H */
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
new file mode 100644
index 000000000000..fefe60d4469b
--- /dev/null
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/pci.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "hws.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws_v4l2_ioctl.h"
+
+static const struct v4l2_dv_timings hws_dv_modes[] = {
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1920, .height = 1080, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1280, .height =  720, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width =  720, .height =  480, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width =  720, .height =  576, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width =  800, .height =  600, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width =  640, .height =  480, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1024, .height =  768, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1280, .height =  768, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1280, .height =  800, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1280, .height = 1024, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1360, .height =  768, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1440, .height =  900, .interlaced = 0 } },
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1680, .height = 1050, .interlaced = 0 } },
+	/* Portrait */
+	{ .type = V4L2_DV_BT_656_1120, .bt = { .width = 1080, .height = 1920, .interlaced = 0 } },
+};
+
+static const size_t hws_dv_modes_cnt = ARRAY_SIZE(hws_dv_modes);
+
+/* YUYV: 16 bpp; align to 64 as you did elsewhere */
+static inline u32 hws_calc_bpl_yuyv(u32 w)     { return ALIGN(w * 2, 64); }
+static inline u32 hws_calc_size_yuyv(u32 w, u32 h) { return hws_calc_bpl_yuyv(w) * h; }
+
+static inline void hws_hw_write_bchs(struct hws_pcie_dev *hws, unsigned int ch,
+				     u8 br, u8 co, u8 hu, u8 sa)
+{
+	u32 packed = (sa << 24) | (hu << 16) | (co << 8) | br;
+
+	if (!hws || !hws->bar0_base || ch >= hws->max_channels)
+		return;
+	writel_relaxed(packed, hws->bar0_base + HWS_REG_BCHS(ch));
+	(void)readl(hws->bar0_base + HWS_REG_BCHS(ch)); /* post write */
+}
+
+/* Helper: find a supported DV mode by W/H + interlace flag */
+static const struct v4l2_dv_timings *
+hws_find_dv_by_wh(u32 w, u32 h, bool interlaced)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
+		const struct v4l2_dv_timings *t = &hws_dv_modes[i];
+		const struct v4l2_bt_timings *bt = &t->bt;
+
+		if (t->type != V4L2_DV_BT_656_1120)
+			continue;
+
+		if (bt->width == w && bt->height == h &&
+		    !!bt->interlaced == interlaced)
+			return t;
+	}
+	return NULL;
+}
+
+/* Helper: validate the requested timings against our table.
+ * We match strictly on type, width, height, and interlace flag.
+ */
+static const struct v4l2_dv_timings *
+hws_match_supported_dv(const struct v4l2_dv_timings *req)
+{
+	const struct v4l2_bt_timings *bt;
+
+	if (!req || req->type != V4L2_DV_BT_656_1120)
+		return NULL;
+
+	bt = &req->bt;
+	return hws_find_dv_by_wh(bt->width, bt->height, !!bt->interlaced);
+}
+
+/* Query the *current detected* DV timings on the input.
+ * If you have a real hardware detector, call it here; otherwise we
+ * derive from the cached pix state and map to the closest supported DV mode.
+ */
+int hws_vidioc_query_dv_timings(struct file *file, void *fh,
+				struct v4l2_dv_timings *timings)
+{
+	struct hws_video *vid = video_drvdata(file);
+	const struct v4l2_dv_timings *m;
+
+	if (!timings)
+		return -EINVAL;
+
+	/* Map current cached WxH/interlace to one of our supported modes. */
+	m = hws_find_dv_by_wh(vid->pix.width, vid->pix.height,
+			      !!vid->pix.interlaced);
+	if (!m)
+		return -ENOLINK;
+
+	*timings = *m;
+	return 0;
+}
+
+/* Enumerate the Nth supported DV timings from our static table. */
+int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
+			       struct v4l2_enum_dv_timings *edv)
+{
+	if (!edv)
+		return -EINVAL;
+
+	if (edv->pad)
+		return -EINVAL;
+
+	if (edv->index >= hws_dv_modes_cnt)
+		return -EINVAL;
+
+	edv->timings = hws_dv_modes[edv->index];
+	return 0;
+}
+
+/* Get the *currently configured* DV timings. */
+int hws_vidioc_g_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings)
+{
+	struct hws_video *vid = video_drvdata(file);
+	const struct v4l2_dv_timings *m;
+
+	if (!timings)
+		return -EINVAL;
+
+	m = hws_find_dv_by_wh(vid->pix.width, vid->pix.height,
+			      !!vid->pix.interlaced);
+	if (!m)
+		return -ENOLINK;
+
+	*timings = *m;
+	return 0;
+}
+
+static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
+{
+	bool sd = p->height <= 576;
+
+	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
+	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
+	p->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
+}
+
+/* Set DV timings: must match one of our supported modes.
+ * If buffers are queued and this implies a size change, we reject with -EBUSY.
+ * Otherwise we update pix state and (optionally) reprogram the HW.
+ */
+int hws_vidioc_s_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings)
+{
+	struct hws_video *vid = video_drvdata(file);
+	const struct v4l2_dv_timings *m;
+	const struct v4l2_bt_timings *bt;
+	u32 new_w, new_h;
+	bool interlaced;
+	int ret = 0;
+	unsigned long was_busy;
+
+	if (!timings)
+		return -EINVAL;
+
+	m = hws_match_supported_dv(timings);
+	if (!m)
+		return -EINVAL;
+
+	bt = &m->bt;
+	new_w = bt->width;
+	new_h = bt->height;
+	interlaced = !!bt->interlaced;
+
+	lockdep_assert_held(&vid->qlock);
+
+	/* If vb2 has active buffers and size would change, reject. */
+	was_busy = vb2_is_busy(&vid->buffer_queue);
+	if (was_busy &&
+	    (new_w != vid->pix.width || new_h != vid->pix.height ||
+	     interlaced != vid->pix.interlaced)) {
+		ret = -EBUSY;
+		return ret;
+	}
+
+	/* Update software pixel state (and recalc sizes) */
+	vid->pix.width      = new_w;
+	vid->pix.height     = new_h;
+	vid->pix.field      = interlaced ? V4L2_FIELD_INTERLACED
+					 : V4L2_FIELD_NONE;
+	vid->pix.interlaced = interlaced;
+	vid->pix.fourcc     = V4L2_PIX_FMT_YUYV;
+
+	hws_set_colorimetry_state(&vid->pix);
+
+	/* Recompute stride/sizeimage/half_size using your helper */
+	vid->pix.bytesperline = hws_calc_bpl_yuyv(new_w);
+	vid->pix.sizeimage    = hws_calc_size_yuyv(new_w, new_h);
+	if (!was_busy)
+		vid->alloc_sizeimage = vid->pix.sizeimage;
+	return ret;
+}
+
+/* Report DV timings capability: advertise BT.656/1120 with
+ * the min/max WxH derived from our table and basic progressive support.
+ */
+int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
+			      struct v4l2_dv_timings_cap *cap)
+{
+	u32 min_w = ~0U, min_h = ~0U;
+	u32 max_w = 0,       max_h = 0;
+	size_t i, n = 0;
+
+	if (!cap)
+		return -EINVAL;
+
+	memset(cap, 0, sizeof(*cap));
+	cap->type = V4L2_DV_BT_656_1120;
+
+	for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
+		const struct v4l2_bt_timings *bt = &hws_dv_modes[i].bt;
+
+		if (hws_dv_modes[i].type != V4L2_DV_BT_656_1120)
+			continue;
+		n++;
+
+		if (bt->width  < min_w)
+			min_w = bt->width;
+		if (bt->height < min_h)
+			min_h = bt->height;
+		if (bt->width  > max_w)
+			max_w = bt->width;
+		if (bt->height > max_h)
+			max_h = bt->height;
+	}
+
+	/* If the table was empty, fail gracefully. */
+	if (!n || min_w == U32_MAX)
+		return -ENODATA;
+
+	cap->bt.min_width  = min_w;
+	cap->bt.max_width  = max_w;
+	cap->bt.min_height = min_h;
+	cap->bt.max_height = max_h;
+
+	/* We support both CEA-861- and VESA-style modes in the list. */
+	cap->bt.standards =
+		V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT | V4L2_DV_BT_STD_CVT;
+
+	/* Progressive only, unless your table includes interlaced entries. */
+	cap->bt.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE;
+
+	/* Leave pixelclock/porch limits unconstrained (0) for now. */
+	return 0;
+}
+
+static int hws_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_DV_RX_IT_CONTENT_TYPE:
+		/* TODO: add DV content type reporting when hardware supports it */
+		return -EINVAL;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hws_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct hws_video *vid =
+		container_of(ctrl->handler, struct hws_video, control_handler);
+	struct hws_pcie_dev *pdx = vid->parent;
+	bool program = false;
+
+	switch (ctrl->id) {
+	case V4L2_CID_BRIGHTNESS:
+		vid->current_brightness = ctrl->val;
+		program = true;
+		break;
+	case V4L2_CID_CONTRAST:
+		vid->current_contrast = ctrl->val;
+		program = true;
+		break;
+	case V4L2_CID_SATURATION:
+		vid->current_saturation = ctrl->val;
+		program = true;
+		break;
+	case V4L2_CID_HUE:
+		vid->current_hue = ctrl->val;
+		program = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (program) {
+		hws_hw_write_bchs(pdx, vid->channel_index,
+				  (u8)vid->current_brightness,
+				  (u8)vid->current_contrast,
+				  (u8)vid->current_hue,
+				  (u8)vid->current_saturation);
+	}
+	return 0;
+}
+
+const struct v4l2_ctrl_ops hws_ctrl_ops = {
+	.s_ctrl          = hws_s_ctrl,
+	.g_volatile_ctrl = hws_g_volatile_ctrl,
+};
+
+int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	struct hws_video *vid = video_drvdata(file);
+	struct hws_pcie_dev *pdev = vid->parent;
+	int vi_index = vid->channel_index + 1; /* keep it simple */
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "%s %d", KBUILD_MODNAME, vi_index);
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", dev_name(&pdev->pdev->dev));
+
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f)
+{
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	if (f->index != 0)
+		return -EINVAL; /* only one format */
+
+	strscpy(f->description, "YUYV 4:2:2", sizeof(f->description));
+	f->pixelformat = V4L2_PIX_FMT_YUYV;
+	return 0;
+}
+
+int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+{
+	struct hws_video *vid = video_drvdata(file);
+
+	if (fmt->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	fmt->fmt.pix.width        = vid->pix.width;
+	fmt->fmt.pix.height       = vid->pix.height;
+	fmt->fmt.pix.pixelformat  = V4L2_PIX_FMT_YUYV;
+	fmt->fmt.pix.field        = vid->pix.field;
+	fmt->fmt.pix.bytesperline = vid->pix.bytesperline;
+	fmt->fmt.pix.sizeimage    = vid->pix.sizeimage;
+	fmt->fmt.pix.colorspace   = vid->pix.colorspace;
+	fmt->fmt.pix.ycbcr_enc    = vid->pix.ycbcr_enc;
+	fmt->fmt.pix.quantization = vid->pix.quantization;
+	fmt->fmt.pix.xfer_func    = vid->pix.xfer_func;
+	return 0;
+}
+
+static inline void hws_set_colorimetry_fmt(struct v4l2_pix_format *p)
+{
+	bool sd = p->height <= 576;
+
+	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
+	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
+	p->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
+}
+
+int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct hws_video *vid = file ? video_drvdata(file) : NULL;
+	struct hws_pcie_dev *pdev = vid ? vid->parent : NULL;
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	u32 req_w = pix->width, req_h = pix->height;
+	u32 w, h, min_bpl, bpl;
+	size_t size; /* wider than u32 for overflow check */
+	size_t max_frame = pdev ? pdev->max_hw_video_buf_sz : MAX_MM_VIDEO_SIZE;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/* Only YUYV */
+	pix->pixelformat = V4L2_PIX_FMT_YUYV;
+
+	/* Defaults then clamp */
+	w = (req_w ? req_w : 640);
+	h = (req_h ? req_h : 480);
+	if (w > MAX_VIDEO_HW_W)
+		w = MAX_VIDEO_HW_W;
+	if (h > MAX_VIDEO_HW_H)
+		h = MAX_VIDEO_HW_H;
+	if (!w)
+		w = 640;  /* hard fallback in case macros are odd */
+	if (!h)
+		h = 480;
+
+	/* Field policy */
+	pix->field = V4L2_FIELD_NONE;
+
+	/* Stride policy for packed 16bpp, 64B align */
+	min_bpl = ALIGN(w * 2, 64);
+
+	/* Bound requested bpl to something sane, then align */
+	bpl = pix->bytesperline;
+	if (bpl < min_bpl) {
+		bpl = min_bpl;
+	} else {
+		/* Cap at 16x width to avoid silly values that overflow sizeimage */
+		u32 max_bpl = ALIGN(w * 2 * 16, 64);
+
+		if (bpl > max_bpl)
+			bpl = max_bpl;
+		bpl = ALIGN(bpl, 64);
+	}
+	if (h && max_frame) {
+		size_t max_bpl_hw = max_frame / h;
+
+		if (max_bpl_hw < min_bpl)
+			return -ERANGE;
+		max_bpl_hw = rounddown(max_bpl_hw, 64);
+		if (!max_bpl_hw)
+			return -ERANGE;
+		if (bpl > max_bpl_hw) {
+			if (pdev)
+				dev_dbg(&pdev->pdev->dev,
+					"try_fmt: clamp bpl %u -> %zu due to hw buf cap %zu\n",
+					bpl, max_bpl_hw, max_frame);
+			bpl = (u32)max_bpl_hw;
+		}
+	}
+	/* Overflow-safe sizeimage = bpl * h */
+	if (__builtin_mul_overflow((size_t)bpl, (size_t)h, &size) || size == 0)
+		return -ERANGE; /* compliance-friendly: reject impossible requests */
+
+	if (size > max_frame)
+		return -ERANGE;
+
+	pix->width        = w;
+	pix->height       = h;
+	pix->bytesperline = bpl;
+	pix->sizeimage    = (u32)size; /* logical size, not page-aligned */
+
+	hws_set_colorimetry_fmt(pix);
+	if (pdev)
+		dev_dbg(&pdev->pdev->dev,
+			"try_fmt: w=%u h=%u bpl=%u size=%u field=%u\n",
+			pix->width, pix->height, pix->bytesperline,
+			pix->sizeimage, pix->field);
+	return 0;
+}
+
+int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct hws_video *vid = video_drvdata(file);
+	int ret;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/* Normalize the request */
+	ret = hws_vidioc_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	/* Don’t allow size changes while buffers are queued */
+	if (vb2_is_busy(&vid->buffer_queue)) {
+		if (f->fmt.pix.width       != vid->pix.width  ||
+		    f->fmt.pix.height      != vid->pix.height ||
+		    f->fmt.pix.pixelformat != V4L2_PIX_FMT_YUYV) {
+			return -EBUSY;
+		}
+	}
+
+	/* Apply to driver state */
+	vid->pix.width        = f->fmt.pix.width;
+	vid->pix.height       = f->fmt.pix.height;
+	vid->pix.fourcc       = V4L2_PIX_FMT_YUYV;
+	vid->pix.field        = f->fmt.pix.field;
+	vid->pix.colorspace   = f->fmt.pix.colorspace;
+	vid->pix.ycbcr_enc    = f->fmt.pix.ycbcr_enc;
+	vid->pix.quantization = f->fmt.pix.quantization;
+	vid->pix.xfer_func    = f->fmt.pix.xfer_func;
+
+	/* Update sizes (use helper if you prefer strict alignment math) */
+	vid->pix.bytesperline = f->fmt.pix.bytesperline;          /* aligned */
+	vid->pix.sizeimage    = f->fmt.pix.sizeimage;             /* logical */
+	vid->pix.half_size    = vid->pix.sizeimage / 2;
+	vid->pix.interlaced   = false;
+	/* Or:
+	 * hws_calc_sizeimage(vid, vid->pix.width, vid->pix.height, false);
+	 */
+
+	/* Refresh vb2 watermark when idle */
+	if (!vb2_is_busy(&vid->buffer_queue))
+		vid->alloc_sizeimage = PAGE_ALIGN(vid->pix.sizeimage);
+	dev_dbg(&vid->parent->pdev->dev,
+		"s_fmt:   w=%u h=%u bpl=%u size=%u alloc=%u\n",
+		vid->pix.width, vid->pix.height, vid->pix.bytesperline,
+		vid->pix.sizeimage, vid->alloc_sizeimage);
+
+	return 0;
+}
+
+int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
+{
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/* Fixed 60 Hz; expose timeperframe capability */
+	param->parm.capture.capability           = V4L2_CAP_TIMEPERFRAME;
+	param->parm.capture.capturemode          = 0;
+	param->parm.capture.timeperframe.numerator   = 1;
+	param->parm.capture.timeperframe.denominator = 60;
+	param->parm.capture.extendedmode         = 0;
+	param->parm.capture.readbuffers          = 0;
+
+	return 0;
+}
+
+int hws_vidioc_enum_input(struct file *file, void *priv,
+			  struct v4l2_input *input)
+{
+	if (input->index)
+		return -EINVAL;
+	input->type         = V4L2_INPUT_TYPE_CAMERA;
+	strscpy(input->name, KBUILD_MODNAME, sizeof(input->name));
+	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+	input->status       = 0;
+
+	return 0;
+}
+
+int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *index)
+{
+	*index = 0;
+	return 0;
+}
+
+int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+
+int vidioc_log_status(struct file *file, void *priv)
+{
+	return 0;
+}
+
+int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
+{
+	struct v4l2_captureparm *cap;
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	cap = &param->parm.capture;
+
+	cap->timeperframe.numerator   = 1;
+	cap->timeperframe.denominator = 60;
+	cap->capability               = V4L2_CAP_TIMEPERFRAME;
+	cap->capturemode              = 0;
+	cap->extendedmode             = 0;
+	/* readbuffers left unchanged or zero; vb2 handles queue depth */
+
+	return 0;
+}
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/hws/hws_v4l2_ioctl.h
new file mode 100644
index 000000000000..ecac2f77338b
--- /dev/null
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_V4L2_IOCTL_H
+#define HWS_V4L2_IOCTL_H
+
+#include <media/v4l2-ctrls.h>
+#include <linux/fs.h>
+
+extern const struct v4l2_ctrl_ops hws_ctrl_ops;
+
+int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap);
+int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f);
+int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt);
+int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f);
+int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
+int hws_vidioc_query_dv_timings(struct file *file, void *fh,
+				struct v4l2_dv_timings *timings);
+int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
+			       struct v4l2_enum_dv_timings *edv);
+int hws_vidioc_g_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings);
+int hws_vidioc_s_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings);
+int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
+			      struct v4l2_dv_timings_cap *cap);
+int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *setfps);
+int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a);
+int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i);
+int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
+int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
+int vidioc_log_status(struct file *file, void *priv);
+
+#endif
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
new file mode 100644
index 000000000000..b961b60324b3
--- /dev/null
+++ b/drivers/media/pci/hws/hws_video.c
@@ -0,0 +1,1542 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/pci.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/compiler.h>
+#include <linux/overflow.h>
+#include <linux/delay.h>
+#include <linux/bits.h>
+#include <linux/jiffies.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "hws.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws_audio.h"
+#include "hws_irq.h"
+#include "hws_v4l2_ioctl.h"
+
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/rawmidi.h>
+#include <sound/initval.h>
+
+#define HWS_MAX_BUFS 32
+#define HWS_REMAP_SLOT_OFF(ch)   (0x208 + (ch) * 8)	/* one 64-bit slot per ch */
+#define HWS_BUF_BASE_OFF(ch)     (CVBS_IN_BUF_BASE  + (ch) * PCIE_BARADDROFSIZE)
+#define HWS_HALF_SZ_OFF(ch)      (CVBS_IN_BUF_BASE2 + (ch) * PCIE_BARADDROFSIZE)
+
+static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned int ch);
+static bool hws_update_active_interlace(struct hws_pcie_dev *pdx,
+					unsigned int ch);
+static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch);
+static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch);
+static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
+			      bool interlaced);
+
+/* Two-buffer approach helper functions */
+static void hws_ring_release(struct hws_video *vid);
+static int hws_ring_setup(struct hws_video *vid);
+static bool hws_use_ring(struct hws_video *vid);
+static void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
+				 dma_addr_t dma, const char *tag);
+static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
+
+static bool hws_use_ring(struct hws_video *vid)
+{
+	/* Use ring buffer approach for legacy hardware compatibility */
+	return true;
+}
+
+static void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
+				 dma_addr_t dma, const char *tag)
+{
+	iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(ch));
+	dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=0x%llx tag=%s\n", ch,
+		(u64)dma, tag ? tag : "");
+}
+
+static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
+{
+	const u32 addr_mask = PCI_E_BAR_ADD_MASK;	/* 0xE0000000 */
+	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;	/* 0x1FFFFFFF */
+	struct hws_pcie_dev *hws = vid->parent;
+	unsigned int ch = vid->channel_index;
+	u32 table_off = HWS_REMAP_SLOT_OFF(ch);
+	u32 lo = lower_32_bits(dma);
+	u32 hi = upper_32_bits(dma);
+	u32 pci_addr = lo & addr_low_mask;	/* low 29 bits inside 512MB window */
+	u32 page_lo = lo & addr_mask;	/* bits 31..29 only (page bits) */
+
+	/* Remap entry: HI then page_LO (legacy order) */
+	writel(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+	(void)readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+	writel(page_lo,
+	       hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+	       PCIE_BARADDROFSIZE);
+	(void)readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+		    PCIE_BARADDROFSIZE);
+
+	/* Program per-channel base and half-size */
+	writel((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
+	       hws->bar0_base + HWS_BUF_BASE_OFF(ch));
+	(void)readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch));
+
+	writel(vid->pix.half_size / 16, hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+	(void)readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+
+	/* Optional: verify and log */
+	{
+		u32 r_hi =
+		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+		u32 r_lo =
+		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+			  PCIE_BARADDROFSIZE);
+		u32 r_base = readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch));
+		u32 r_half = readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+
+		dev_dbg(&hws->pdev->dev,
+			"ch%u remap: hi=0x%08x(lo exp 0x%08x got 0x%08x) base=0x%08x exp=0x%08x half16B=0x%08x\n",
+			ch, r_hi, page_lo, r_lo, r_base,
+			(ch + 1) * PCIEBAR_AXI_BASE + pci_addr, r_half);
+	}
+}
+
+static int hws_ring_setup(struct hws_video *vid)
+{
+	struct hws_pcie_dev *hws = vid->parent;
+	size_t need;
+
+	if (vid->ring_cpu)
+		return 0;	/* already allocated */
+
+	need = PAGE_ALIGN(vid->pix.sizeimage * 2);	/* double buffer */
+	vid->ring_cpu =
+	    dma_alloc_coherent(&hws->pdev->dev, need, &vid->ring_dma,
+			       GFP_KERNEL);
+	if (!vid->ring_cpu)
+		return -ENOMEM;
+
+	vid->ring_size = need;
+	vid->ring_toggle_prev = 0;
+	vid->ring_toggle_hw = 0;
+	vid->ring_first_half_copied = false;
+	vid->ring_last_toggle_jiffies = jiffies;
+
+	dev_dbg(&hws->pdev->dev,
+		"ring_setup: ch%u allocated %zu bytes dma=0x%llx\n",
+		vid->channel_index, need, (u64)vid->ring_dma);
+	return 0;
+}
+
+static void hws_ring_release(struct hws_video *vid)
+{
+	struct hws_pcie_dev *hws = vid->parent;
+
+	if (vid->ring_cpu) {
+		dma_free_coherent(&hws->pdev->dev, vid->ring_size,
+				  vid->ring_cpu, vid->ring_dma);
+		vid->ring_cpu = NULL;
+		vid->ring_size = 0;
+		vid->ring_dma = 0;
+	}
+}
+
+static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
+{
+	struct hws_pcie_dev *hws;
+	unsigned long flags;
+	struct hwsvideo_buffer *buf = NULL, *next = NULL;
+	bool ring_mode;
+	bool have_next = false;
+	bool doorbell = false;
+
+	if (!v)
+		return false;
+	hws = v->parent;
+	if (!hws || READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active))
+		return false;
+	ring_mode = hws_use_ring(v);
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (v->active) {
+		buf = v->active;
+		v->active = NULL;
+		buf->slot = 0;
+	} else if (!list_empty(&v->capture_queue)) {
+		buf = list_first_entry(&v->capture_queue,
+				       struct hwsvideo_buffer, list);
+		list_del_init(&buf->list);
+		if (v->queued_count)
+			v->queued_count--;
+		buf->slot = 0;
+	}
+	if (!list_empty(&v->capture_queue)) {
+		next = list_first_entry(&v->capture_queue,
+					struct hwsvideo_buffer, list);
+		list_del_init(&next->list);
+		if (v->queued_count)
+			v->queued_count--;
+		next->slot = 0;
+		v->active = next;
+		have_next = true;
+	} else {
+		v->active = NULL;
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+	/* Reset toggle tracking so the next real VDONE is observed */
+	WRITE_ONCE(v->ring_toggle_prev, 0);
+	WRITE_ONCE(v->ring_toggle_hw, 0);
+	if (!buf)
+		return false;
+	/* Complete buffer with a neutral frame so dequeuers keep running. */
+	{
+		struct vb2_v4l2_buffer *vb2v = &buf->vb;
+		void *dst = vb2_plane_vaddr(&vb2v->vb2_buf, 0);
+
+		if (dst)
+			memset(dst, 0x10, v->pix.sizeimage);
+		vb2_set_plane_payload(&vb2v->vb2_buf, 0, v->pix.sizeimage);
+		vb2v->sequence = ++v->sequence_number;
+		vb2v->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+	}
+	WRITE_ONCE(v->ring_first_half_copied, false);
+	WRITE_ONCE(v->ring_last_toggle_jiffies, jiffies);
+	if (ring_mode && v->ring_cpu) {
+		hws_program_dma_window(v, v->ring_dma);
+		hws_set_dma_doorbell(hws, v->channel_index, v->ring_dma,
+				     tag ? tag : "nosignal_ring");
+		doorbell = true;
+	} else if (have_next && next) {
+		dma_addr_t dma =
+		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(hws, v->channel_index, dma);
+		hws_set_dma_doorbell(hws, v->channel_index, dma,
+				     tag ? tag : "nosignal_zero");
+		doorbell = true;
+	} else if (ring_mode && !v->ring_cpu) {
+		dev_warn(&hws->pdev->dev,
+			 "nosignal: ch%u ring buffer missing, cannot doorbell\n",
+			 v->channel_index);
+	}
+	if (doorbell) {
+		wmb(); /* ensure descriptors visible before enabling capture */
+		hws_enable_video_capture(hws, v->channel_index, true);
+	}
+	return true;
+}
+
+static int hws_ctrls_init(struct hws_video *vid)
+{
+	struct v4l2_ctrl_handler *hdl = &vid->control_handler;
+
+	/* Create BCHS + one DV status control */
+	v4l2_ctrl_handler_init(hdl, 4);
+
+	vid->ctrl_brightness = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
+						 V4L2_CID_BRIGHTNESS,
+						 MIN_VAMP_BRIGHTNESS_UNITS,
+						 MAX_VAMP_BRIGHTNESS_UNITS, 1,
+						 HWS_BRIGHTNESS_DEFAULT);
+
+	vid->ctrl_contrast =
+	    v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_CONTRAST,
+			      MIN_VAMP_CONTRAST_UNITS, MAX_VAMP_CONTRAST_UNITS,
+			      1, HWS_CONTRAST_DEFAULT);
+
+	vid->ctrl_saturation = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops,
+						 V4L2_CID_SATURATION,
+						 MIN_VAMP_SATURATION_UNITS,
+						 MAX_VAMP_SATURATION_UNITS, 1,
+						 HWS_SATURATION_DEFAULT);
+
+	vid->ctrl_hue = v4l2_ctrl_new_std(hdl, &hws_ctrl_ops, V4L2_CID_HUE,
+					  MIN_VAMP_HUE_UNITS,
+					  MAX_VAMP_HUE_UNITS, 1,
+					  HWS_HUE_DEFAULT);
+
+	if (hdl->error) {
+		int err = hdl->error;
+
+		v4l2_ctrl_handler_free(hdl);
+		return err;
+	}
+	return 0;
+}
+
+int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch)
+{
+	struct hws_video *vid;
+
+	/* basic sanity */
+	if (!pdev || ch < 0 || ch >= pdev->max_channels)
+		return -EINVAL;
+
+	vid = &pdev->video[ch];
+
+	/* hard reset the per-channel struct (safe here since we init everything next) */
+	memset(vid, 0, sizeof(*vid));
+
+	/* identity */
+	vid->parent = pdev;
+	vid->channel_index = ch;
+
+	/* locks & lists */
+	mutex_init(&vid->state_lock);
+	mutex_init(&vid->qlock);
+	spin_lock_init(&vid->irq_lock);
+	INIT_LIST_HEAD(&vid->capture_queue);
+	vid->sequence_number = 0;
+	vid->active = NULL;
+
+	/* typed tasklet: bind handler once */
+	tasklet_setup(&vid->bh_tasklet, hws_bh_video);
+
+	/* DMA watchdog removed; retain counters for diagnostics */
+	vid->timeout_count = 0;
+	vid->error_count = 0;
+
+	/* Two-buffer approach initialization */
+	vid->ring_cpu = NULL;
+	vid->ring_dma = 0;
+	vid->ring_size = 0;
+	vid->ring_toggle_prev = 0;
+	vid->ring_toggle_hw = 0;
+	vid->ring_first_half_copied = false;
+	vid->ring_last_toggle_jiffies = jiffies;
+	vid->queued_count = 0;
+
+	/* default format (adjust to your HW) */
+	vid->pix.width = 1920;
+	vid->pix.height = 1080;
+	vid->pix.fourcc = V4L2_PIX_FMT_YUYV;
+	vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);
+	vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
+	vid->pix.field = V4L2_FIELD_NONE;
+	vid->pix.colorspace = V4L2_COLORSPACE_REC709;
+	vid->pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	vid->pix.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	vid->pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	vid->pix.interlaced = false;
+	vid->pix.half_size = vid->pix.sizeimage / 2;	/* if HW uses halves */
+	vid->alloc_sizeimage = vid->pix.sizeimage;
+
+	/* color controls default (mid-scale) */
+	vid->current_brightness = 0x80;
+	vid->current_contrast = 0x80;
+	vid->current_saturation = 0x80;
+	vid->current_hue = 0x80;
+
+	/* capture state */
+	vid->cap_active = false;
+	vid->stop_requested = false;
+	vid->last_buf_half_toggle = 0;
+	vid->half_seen = false;
+	vid->signal_loss_cnt = 0;
+
+	/* Create BCHS + DV power-present as modern controls */
+	{
+		int err = hws_ctrls_init(vid);
+
+		if (err) {
+			dev_err(&pdev->pdev->dev,
+				"v4l2 ctrl init failed on ch%d: %d\n", ch, err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static void hws_video_drain_queue_locked(struct hws_video *vid)
+{
+	/* Return in-flight first */
+	if (vid->active) {
+		vb2_buffer_done(&vid->active->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vid->active = NULL;
+	}
+
+	/* Then everything queued */
+	while (!list_empty(&vid->capture_queue)) {
+		struct hwsvideo_buffer *b =
+		    list_first_entry(&vid->capture_queue,
+				     struct hwsvideo_buffer,
+				     list);
+		list_del_init(&b->list);
+		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch)
+{
+	struct hws_video *vid;
+	unsigned long flags;
+
+	if (!pdev || ch < 0 || ch >= pdev->max_channels)
+		return;
+
+	vid = &pdev->video[ch];
+
+	/* 1) Stop HW best-effort for this channel */
+	hws_enable_video_capture(vid->parent, vid->channel_index, false);
+
+	/* 2) Flip software state so IRQ/BH will be no-ops if they run */
+	WRITE_ONCE(vid->stop_requested, true);
+	WRITE_ONCE(vid->cap_active, false);
+
+	/* 3) Make sure the tasklet can’t run anymore (prevents races with drain) */
+	tasklet_kill(&vid->bh_tasklet);
+
+	/* 4) Drain SW capture queue & in-flight under lock */
+	spin_lock_irqsave(&vid->irq_lock, flags);
+	hws_video_drain_queue_locked(vid);
+	spin_unlock_irqrestore(&vid->irq_lock, flags);
+
+	/* 4.5) Release ring buffer */
+	hws_ring_release(vid);
+
+	/* 5) Release VB2 queue if initialized */
+	if (vid->buffer_queue.ops)
+		vb2_queue_release(&vid->buffer_queue);
+
+	/* 6) Free V4L2 controls */
+	v4l2_ctrl_handler_free(&vid->control_handler);
+
+	/* 7) Unregister the video_device if we own it */
+	if (vid->video_device && video_is_registered(vid->video_device))
+		video_unregister_device(vid->video_device);
+	/* If you allocated it with video_device_alloc(), release it here:
+	 * video_device_release(vid->video_device);
+	 */
+	vid->video_device = NULL;
+
+	/* 8) Reset simple state (don’t memset the whole struct here) */
+	mutex_destroy(&vid->state_lock);
+	mutex_destroy(&vid->qlock);
+	INIT_LIST_HEAD(&vid->capture_queue);
+	vid->active = NULL;
+	vid->stop_requested = false;
+	vid->last_buf_half_toggle = 0;
+	vid->half_seen = false;
+	vid->signal_loss_cnt = 0;
+}
+
+/* Convenience cast */
+static inline struct hwsvideo_buffer *to_hwsbuf(struct vb2_buffer *vb)
+{
+	return container_of(to_vb2_v4l2_buffer(vb), struct hwsvideo_buffer, vb);
+}
+
+static int hws_buf_init(struct vb2_buffer *vb)
+{
+	struct hwsvideo_buffer *b = to_hwsbuf(vb);
+
+	INIT_LIST_HEAD(&b->list);
+	return 0;
+}
+
+static void hws_buf_finish(struct vb2_buffer *vb)
+{
+	/* vb2 core handles cache maintenance for dma-contig buffers */
+	(void)vb;
+}
+
+static void hws_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct hwsvideo_buffer *b = to_hwsbuf(vb);
+
+	if (!list_empty(&b->list))
+		list_del_init(&b->list);
+}
+
+void hws_program_dma_for_addr(struct hws_pcie_dev *hws, unsigned int ch,
+			      dma_addr_t dma)
+{
+	struct hws_video *vid = &hws->video[ch];
+
+	hws_program_dma_window(vid, dma);
+}
+
+void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int chan,
+			      bool on)
+{
+	u32 status;
+
+	if (!hws || hws->pci_lost || chan >= hws->max_channels)
+		return;
+
+	status = readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
+	status = on ? (status | BIT(chan)) : (status & ~BIT(chan));
+	writel(status, hws->bar0_base + HWS_REG_VCAP_ENABLE);
+	(void)readl(hws->bar0_base + HWS_REG_VCAP_ENABLE);
+
+	hws->video[chan].cap_active = on;
+
+	dev_dbg(&hws->pdev->dev, "vcap %s ch%u (reg=0x%08x)\n",
+		on ? "ON" : "OFF", chan, status);
+}
+
+static void hws_seed_dma_windows(struct hws_pcie_dev *hws)
+{
+	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
+	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
+	u32 table = 0x208;	/* one 64-bit entry per channel */
+	unsigned int ch;
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	/* If cur_max_video_ch isn’t set yet, default to max_channels */
+	if (!hws->cur_max_video_ch || hws->cur_max_video_ch > hws->max_channels)
+		hws->cur_max_video_ch = hws->max_channels;
+
+	for (ch = 0; ch < hws->cur_max_video_ch; ch++, table += 8) {
+		/* 1) Ensure a tiny, valid DMA buf exists (1 page is plenty) */
+		if (!hws->scratch_vid[ch].cpu) {
+			hws->scratch_vid[ch].size = PAGE_SIZE;
+			hws->scratch_vid[ch].cpu =
+			    dma_alloc_coherent(&hws->pdev->dev,
+					       hws->scratch_vid[ch].size,
+					       &hws->scratch_vid[ch].dma,
+					       GFP_KERNEL);
+			if (!hws->scratch_vid[ch].cpu) {
+				dev_warn(&hws->pdev->dev,
+					 "ch%u: scratch DMA alloc failed, skipping seed\n",
+					 ch);
+				continue;
+			}
+		}
+
+		/* 2) Program 64-bit BAR remap entry for this channel */
+		{
+			dma_addr_t p = hws->scratch_vid[ch].dma;
+			u32 lo = lower_32_bits(p) & addr_mask;
+			u32 hi = upper_32_bits(p);
+			u32 pci_addr_low = lower_32_bits(p) & addr_low_mask;
+
+			writel_relaxed(hi,
+				       hws->bar0_base + PCI_ADDR_TABLE_BASE +
+				       table);
+			writel_relaxed(lo,
+				       hws->bar0_base + PCI_ADDR_TABLE_BASE +
+				       table + PCIE_BARADDROFSIZE);
+
+			/* 3) Per-channel AXI base + PCI low */
+			writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE +
+				       pci_addr_low,
+				       hws->bar0_base + CVBS_IN_BUF_BASE +
+				       ch * PCIE_BARADDROFSIZE);
+
+			/* 4) Half-frame length in /16 units.
+			 * Prefer the current channel’s computed half_size if available.
+			 * Fall back to PAGE_SIZE/2.
+			 */
+			{
+				u32 half_bytes = hws->video[ch].pix.half_size ?
+				    hws->video[ch].pix.half_size :
+				    (PAGE_SIZE / 2);
+				writel_relaxed(half_bytes / 16,
+					       hws->bar0_base +
+					       CVBS_IN_BUF_BASE2 +
+					       ch * PCIE_BARADDROFSIZE);
+			}
+		}
+	}
+
+	/* Post writes so device sees them before we move on */
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+}
+
+#define LOG_DEC(tag)							\
+	dev_info(&hws->pdev->dev, "DEC_MODE %s = 0x%08x\n",		\
+		 (tag), readl(hws->bar0_base + HWS_REG_DEC_MODE))
+
+static void hws_ack_all_irqs(struct hws_pcie_dev *hws)
+{
+	u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
+
+	if (st) {
+		writel(st, hws->bar0_base + HWS_REG_INT_STATUS);	/* W1C */
+		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+	}
+}
+
+static void hws_open_irq_fabric(struct hws_pcie_dev *hws)
+{
+	/* Route all sources to vector 0 (same value you’re already using) */
+	writel(0x00000000, hws->bar0_base + PCIE_INT_DEC_REG_BASE);
+	(void)readl(hws->bar0_base + PCIE_INT_DEC_REG_BASE);
+
+	/* Turn on the bridge if your IP needs it */
+	writel(0x00000001, hws->bar0_base + PCIEBR_EN_REG_BASE);
+	(void)readl(hws->bar0_base + PCIEBR_EN_REG_BASE);
+
+	/* Open the global/bridge gate (legacy 0x3FFFF) */
+	writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
+	(void)readl(hws->bar0_base + INT_EN_REG_BASE);
+}
+
+void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable)
+{
+	int i;
+
+	if (hws->start_run && !enable)
+		return;
+
+	/* 1) reset the decoder mode register to 0 */
+	writel(0x00000000, hws->bar0_base + HWS_REG_DEC_MODE);
+	LOG_DEC("after reset");
+	hws_seed_dma_windows(hws);
+
+	/* 3) on a full reset, clear all per-channel status and indices */
+	if (!enable) {
+		for (i = 0; i < hws->max_channels; i++) {
+			/* helpers to arm/disable capture engines */
+			hws_enable_video_capture(hws, i, false);
+			hws_enable_audio_capture(hws, i, false);
+		}
+	}
+
+	/* 4) “Start run”: set bit31, wait a bit, then program low 24 bits */
+	writel(0x80000000, hws->bar0_base + HWS_REG_DEC_MODE);
+	LOG_DEC("start run");
+	/* udelay(500); */
+	writel(0x80FFFFFF, hws->bar0_base + HWS_REG_DEC_MODE);
+	LOG_DEC("after mask");
+	writel(0x13, hws->bar0_base + HWS_REG_DEC_MODE);
+	LOG_DEC("final");
+	hws_ack_all_irqs(hws);
+	hws_open_irq_fabric(hws);
+	/* 6) record that we're now running */
+	hws->start_run = true;
+}
+
+int hws_check_card_status(struct hws_pcie_dev *hws)
+{
+	u32 status;
+
+	if (!hws || !hws->bar0_base)
+		return -ENODEV;
+
+	status = readl(hws->bar0_base + HWS_REG_SYS_STATUS);
+
+	/* Common “device missing” pattern */
+	if (unlikely(status == 0xFFFFFFFF)) {
+		hws->pci_lost = true;
+		dev_err(&hws->pdev->dev, "PCIe device not responding\n");
+		return -ENODEV;
+	}
+
+	/* If RUN/READY bit (bit0) isn’t set, (re)initialize the video core */
+	if (!(status & BIT(0))) {
+		dev_dbg(&hws->pdev->dev,
+			"SYS_STATUS not ready (0x%08x), reinitializing\n",
+			status);
+		hws_init_video_sys(hws, true);
+		/* Optional: verify the core cleared its busy bit, if you have one */
+		/* int ret = hws_check_busy(hws); */
+		/* if (ret) return ret; */
+	}
+
+	return 0;
+}
+
+void check_video_format(struct hws_pcie_dev *pdx)
+{
+	int i;
+
+	for (i = 0; i < pdx->cur_max_video_ch; i++) {
+		if (!hws_update_active_interlace(pdx, i)) {
+			/* return 1; */                       /* no active video */
+			if (pdx->video[i].signal_loss_cnt == 0)
+				pdx->video[i].signal_loss_cnt = 1;
+		} else {
+			if (pdx->hw_ver > 0)
+				handle_hwv2_path(pdx, i);
+			else
+				/* FIXME: legacy struct names in subfunction */
+				handle_legacy_path(pdx, i);
+
+			update_live_resolution(pdx, i);
+			pdx->video[i].signal_loss_cnt = 0;
+		}
+
+		/* If we just detected a loss on an active capture channel… */
+		if (pdx->video[i].signal_loss_cnt == 1 &&
+		    pdx->video[i].cap_active) {
+			/* Use the two-buffer approach for signal loss handling */
+			hws_force_no_signal_frame(&pdx->video[i],
+						  "monitor_nosignal");
+			pdx->video[i].signal_loss_cnt = 2;
+		}
+	}
+}
+
+static inline void hws_write_if_diff(struct hws_pcie_dev *hws, u32 reg_off,
+				     u32 new_val)
+{
+	void __iomem *addr;
+	u32 old;
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	addr = hws->bar0_base + reg_off;
+
+	old = readl(addr);
+	/* Treat all-ones as device gone; avoid writing garbage. */
+	if (unlikely(old == 0xFFFFFFFF)) {
+		hws->pci_lost = true;
+		return;
+	}
+
+	if (old != new_val) {
+		writel(new_val, addr);
+		/* Post the write on some bridges / enforce ordering. */
+		(void)readl(addr);
+	}
+}
+
+static bool hws_update_active_interlace(struct hws_pcie_dev *pdx,
+					unsigned int ch)
+{
+	u32 reg;
+	bool active, interlace;
+
+	if (ch >= pdx->cur_max_video_ch)
+		return false;
+
+	reg = readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
+	active = !!(reg & BIT(ch));
+	interlace = !!(reg & BIT(8 + ch));
+
+	WRITE_ONCE(pdx->video[ch].pix.interlaced, interlace);
+	return active;
+}
+
+/* Modern hardware path: keep HW registers in sync with current per-channel
+ * software state. Adjust the OUT_* bits below to match your HW contract.
+ */
+static void handle_hwv2_path(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	struct hws_video *vid;
+	u32 reg, in_fps, cur_out_res, want_out_res;
+
+	if (!hws || !hws->bar0_base || ch >= hws->max_channels)
+		return;
+
+	vid = &hws->video[ch];
+
+	/* 1) Input frame rate (read-only; log for debugging) */
+	in_fps = readl(hws->bar0_base + HWS_REG_FRAME_RATE(ch));
+	dev_dbg(&hws->pdev->dev, "ch%u input fps=%u\n", ch, in_fps);
+
+	/* 2) Output resolution programming
+	 * If your HW expects a separate “scaled” size, add fields to track it.
+	 * For now, mirror the current format (fmt_curr) to OUT_RES.
+	 */
+	want_out_res = (vid->pix.height << 16) | vid->pix.width;
+	cur_out_res = readl(hws->bar0_base + HWS_REG_OUT_RES(ch));
+	if (cur_out_res != want_out_res)
+		hws_write_if_diff(hws, HWS_REG_OUT_RES(ch), want_out_res);
+
+	/* 3) Output FPS: only program if you actually track a target.
+	 * Example heuristic (disabled by default):
+	 *
+	 *   u32 out_fps = (vid->fmt_curr.height >= 1080) ? 60 : 30;
+	 *   hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), out_fps);
+	 */
+
+	/* 4) BCHS controls: pack from per-channel current_* fields */
+	reg = readl(hws->bar0_base + HWS_REG_BCHS(ch));
+	{
+		u8 br = reg & 0xFF;
+		u8 co = (reg >> 8) & 0xFF;
+		u8 hu = (reg >> 16) & 0xFF;
+		u8 sa = (reg >> 24) & 0xFF;
+
+		if (br != vid->current_brightness ||
+		    co != vid->current_contrast || hu != vid->current_hue ||
+		    sa != vid->current_saturation) {
+			u32 packed = (vid->current_saturation << 24) |
+			    (vid->current_hue << 16) |
+			    (vid->current_contrast << 8) |
+			    vid->current_brightness;
+			hws_write_if_diff(hws, HWS_REG_BCHS(ch), packed);
+		}
+	}
+
+	/* 5) HDCP detect: read only (no cache field in your structs today) */
+	reg = readl(hws->bar0_base + HWS_REG_HDCP_STATUS);
+	/* bool hdcp = !!(reg & BIT(ch)); use if you later add a field/control */
+}
+
+static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	/* No-op by default. If you introduce a SW FPS accumulator, map it here.
+	 *
+	 * Example skeleton:
+	 *
+	 *   u32 sw_rate = READ_ONCE(hws->sw_fps[ch]); incremented elsewhere
+	 *   if (sw_rate > THRESHOLD) {
+	 *       u32 fps = pick_fps_from_rate(sw_rate);
+	 *       hws_write_if_diff(hws, HWS_REG_OUT_FRAME_RATE(ch), fps);
+	 *       WRITE_ONCE(hws->sw_fps[ch], 0);
+	 *   }
+	 */
+	(void)hws;
+	(void)ch;
+}
+
+static void hws_video_apply_mode_change(struct hws_pcie_dev *pdx,
+					unsigned int ch, u16 w, u16 h,
+					bool interlaced)
+{
+	struct hws_video *v = &pdx->video[ch];
+	unsigned long flags;
+	u32 new_size;
+	bool reenable = false;
+
+	if (!pdx || !pdx->bar0_base)
+		return;
+	if (ch >= pdx->max_channels)
+		return;
+	if (!w || !h || w > MAX_VIDEO_HW_W ||
+	    (!interlaced && h > MAX_VIDEO_HW_H) ||
+	    (interlaced && (h * 2) > MAX_VIDEO_HW_H))
+		return;
+
+	WRITE_ONCE(v->stop_requested, true);
+	WRITE_ONCE(v->cap_active, false);
+	/* Publish software stop first so the hardirq/BH see the stop before
+	 * we touch MMIO or the lists. Pairs with READ_ONCE() checks in
+	 * hws_bh_video() and hws_arm_next(). Required to prevent the BH/ISR
+	 * from completing/arming buffers while we are changing modes.
+	 */
+	smp_wmb();
+
+	hws_enable_video_capture(pdx, ch, false);
+	readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+
+	tasklet_kill(&v->bh_tasklet);
+
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (v->active) {
+		vb2_buffer_done(&v->active->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		v->active = NULL;
+	}
+	while (!list_empty(&v->capture_queue)) {
+		struct hwsvideo_buffer *b = list_first_entry(&v->capture_queue,
+							     struct
+							     hwsvideo_buffer,
+							     list);
+		list_del_init(&b->list);
+		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	/* Update software pixel state */
+	v->pix.width = w;
+	v->pix.height = h;
+	v->pix.interlaced = interlaced;
+
+	new_size = hws_calc_sizeimage(v, w, h, interlaced);
+
+	/* If buffers are smaller than new requirement, signal src-change & error the queue */
+	if (vb2_is_busy(&v->buffer_queue) && new_size > v->alloc_sizeimage) {
+		struct v4l2_event ev = {
+			.type = V4L2_EVENT_SOURCE_CHANGE,
+		};
+		ev.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
+
+		v4l2_event_queue(v->video_device, &ev);
+		vb2_queue_error(&v->buffer_queue);
+		return;
+	}
+
+	/* Program HW with new resolution */
+	hws_write_if_diff(pdx, HWS_REG_OUT_RES(ch), (h << 16) | w);
+
+	/* Legacy half-buffer programming */
+	writel(v->pix.half_size / 16,
+	       pdx->bar0_base + CVBS_IN_BUF_BASE2 + ch * PCIE_BARADDROFSIZE);
+	(void)readl(pdx->bar0_base + CVBS_IN_BUF_BASE2 +
+		    ch * PCIE_BARADDROFSIZE);
+
+	/* Reset per-channel toggles/counters */
+	WRITE_ONCE(v->last_buf_half_toggle, 0);
+	v->sequence_number = 0;
+
+	/* Re-prime first VB2 buffer if present */
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (!list_empty(&v->capture_queue)) {
+		struct hwsvideo_buffer *buf;
+		dma_addr_t dma;
+
+		buf = list_first_entry(&v->capture_queue,
+				       struct hwsvideo_buffer, list);
+		v->active = buf;
+		list_del_init(&v->active->list);
+		dma = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(pdx, ch, dma);
+		iowrite32(lower_32_bits(dma),
+			  pdx->bar0_base + HWS_REG_DMA_ADDR(ch));
+		reenable = true;
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	if (!reenable)
+		return;
+
+	WRITE_ONCE(v->stop_requested, false);
+	WRITE_ONCE(v->cap_active, true);
+	/* Publish stop_requested/cap_active before HW disable; pairs with
+	 * BH/ISR reads in hws_bh_video/hws_arm_next.
+	 */
+	smp_wmb();
+	wmb(); /* ensure DMA window/address writes visible before enable */
+	hws_enable_video_capture(pdx, ch, true);
+	readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+}
+
+static void update_live_resolution(struct hws_pcie_dev *pdx, unsigned int ch)
+{
+	u32 reg = readl(pdx->bar0_base + HWS_REG_IN_RES(ch));
+	u16 res_w = reg & 0xFFFF;
+	u16 res_h = (reg >> 16) & 0xFFFF;
+	bool interlace = READ_ONCE(pdx->video[ch].pix.interlaced);
+
+	bool within_hw = (res_w <= MAX_VIDEO_HW_W) &&
+	    ((!interlace && res_h <= MAX_VIDEO_HW_H) ||
+	     (interlace && (res_h * 2) <= MAX_VIDEO_HW_H));
+
+	if (!within_hw)
+		return;
+
+	if (res_w != pdx->video[ch].pix.width ||
+	    res_h != pdx->video[ch].pix.height) {
+		hws_video_apply_mode_change(pdx, ch, res_w, res_h, interlace);
+	}
+}
+
+static int hws_open(struct file *file)
+{
+	int ret;
+	struct hws_video *vid;
+
+	/* Create V4L2 file handle so events & priorities work */
+	ret = v4l2_fh_open(file);
+	if (ret)
+		return ret;
+
+	vid = video_drvdata(file);
+
+	/* Hard-fail additional opens while a capture is active */
+	if (!v4l2_fh_is_singular_file(file) && vb2_is_busy(&vid->buffer_queue)) {
+		v4l2_fh_release(file);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int hws_release(struct file *file)
+{
+	return vb2_fop_release(file);
+}
+
+static const struct v4l2_file_operations hws_fops = {
+	.owner = THIS_MODULE,
+	.open = hws_open,
+	.release = hws_release,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int hws_subscribe_event(struct v4l2_fh *fh,
+			       const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops hws_ioctl_fops = {
+	/* Core caps/info */
+	.vidioc_querycap = hws_vidioc_querycap,
+
+	/* Pixel format: still needed to report YUYV etc. */
+	.vidioc_enum_fmt_vid_cap = hws_vidioc_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = hws_vidioc_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = hws_vidioc_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = hws_vidioc_try_fmt_vid_cap,
+
+	/* Buffer queueing / streaming */
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	/* Inputs */
+	.vidioc_enum_input = hws_vidioc_enum_input,
+	.vidioc_g_input = hws_vidioc_g_input,
+	.vidioc_s_input = hws_vidioc_s_input,
+
+	/* DV timings (HDMI/DVI/VESA modes) */
+	.vidioc_query_dv_timings = hws_vidioc_query_dv_timings,
+	.vidioc_enum_dv_timings = hws_vidioc_enum_dv_timings,
+	.vidioc_g_dv_timings = hws_vidioc_g_dv_timings,
+	.vidioc_s_dv_timings = hws_vidioc_s_dv_timings,
+	.vidioc_dv_timings_cap = hws_vidioc_dv_timings_cap,
+
+	.vidioc_log_status = vidioc_log_status,
+	.vidioc_subscribe_event = hws_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_g_parm = hws_vidioc_g_parm,
+	.vidioc_s_parm = hws_vidioc_s_parm,
+};
+
+static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
+			      bool interlaced)
+{
+	/* example for packed 16bpp (YUYV); replace with your real math/align */
+	u32 lines = h;		/* full frame lines for sizeimage */
+	u32 bytesperline = ALIGN(w * 2, 64);
+
+	/* publish into pix, since we now carry these in-state */
+	v->pix.bytesperline = bytesperline;
+	v->pix.sizeimage = bytesperline * lines;
+	v->pix.half_size = v->pix.sizeimage / 2;	/* if HW uses halves */
+	v->pix.field = interlaced ? V4L2_FIELD_INTERLACED : V4L2_FIELD_NONE;
+
+	return v->pix.sizeimage;
+}
+
+static int hws_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			   unsigned int *nplanes, unsigned int sizes[],
+			   struct device *alloc_devs[])
+{
+	struct hws_video *vid = q->drv_priv;
+	struct hws_pcie_dev *hws = vid->parent;
+	size_t need_min = vid->pix.sizeimage;
+	size_t need_alloc = PAGE_ALIGN(vid->pix.sizeimage);
+	unsigned int have;
+	unsigned int room;
+
+	if (!need_min) {
+		vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);
+		vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
+		need_min = vid->pix.sizeimage;
+		need_alloc = PAGE_ALIGN(vid->pix.sizeimage);
+	}
+
+	if (*nplanes) {
+		if (*nplanes != 1)
+			return -EINVAL;
+		if (!sizes[0])
+			sizes[0] = need_min;	/* publish minimal, not page-aligned */
+		if (sizes[0] < need_min)
+			return -EINVAL;
+		vid->alloc_sizeimage = need_alloc;	/* keep internal aligned size */
+	} else {
+		*nplanes = 1;
+		sizes[0] = need_min;	/* report minimal requirement */
+		vid->alloc_sizeimage = need_alloc;
+	}
+
+	if (alloc_devs)
+		alloc_devs[0] = &hws->pdev->dev;	/* vb2-dma-contig device */
+
+	/* Make sure we have a reasonable minimum queue depth. */
+	if (*num_buffers < 1)
+		*num_buffers = 1;
+
+	have = vb2_get_num_buffers(q);	/* instead of q->num_buffers */
+	room = (have < HWS_MAX_BUFS) ? (HWS_MAX_BUFS - have) : 0;
+
+	if (*num_buffers > room)
+		*num_buffers = room;
+	if (*num_buffers == 0) {
+		dev_dbg(&hws->pdev->dev,
+			"queue_setup: reject, no room (have=%u, max=%u)\n", have,
+			HWS_MAX_BUFS);
+		return -ENOBUFS;	/* or -ENOMEM; either is fine for CREATE_BUFS clamp */
+	}
+	return 0;
+}
+
+static int hws_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct hws_video *vid = vb->vb2_queue->drv_priv;
+	struct hws_pcie_dev *hws = vid->parent;
+	size_t need = vid->pix.sizeimage;
+	dma_addr_t dma_addr;
+
+	if (vb2_plane_size(vb, 0) < need)
+		return -EINVAL;
+
+	/* Validate DMA address alignment */
+	dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+	if (dma_addr & 0x3F) {	/* 64-byte alignment required */
+		dev_err(&hws->pdev->dev,
+			"Buffer DMA address 0x%llx not 64-byte aligned\n",
+			(unsigned long long)dma_addr);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, need);
+	return 0;
+}
+
+static void hws_buffer_queue(struct vb2_buffer *vb)
+{
+	struct hws_video *vid = vb->vb2_queue->drv_priv;
+	struct hwsvideo_buffer *buf = to_hwsbuf(vb);
+	struct vb2_buffer *vb2_buf = &buf->vb.vb2_buf;
+	struct hws_pcie_dev *hws = vid->parent;
+	unsigned long flags;
+	bool ring_mode;
+
+	dev_dbg(&hws->pdev->dev,
+		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
+		vid->channel_index, vb, vid->pix.sizeimage,
+		READ_ONCE(vid->cap_active));
+
+	/* Initialize buffer slot */
+	buf->slot = 0;
+	ring_mode = hws_use_ring(vid);
+
+	spin_lock_irqsave(&vid->irq_lock, flags);
+	list_add_tail(&buf->list, &vid->capture_queue);
+	vid->queued_count++;
+
+	/* If streaming and no in-flight buffer, prime HW immediately */
+	if (READ_ONCE(vid->cap_active) && !vid->active) {
+		dev_dbg(&hws->pdev->dev,
+			"buffer_queue(ch=%u): priming first vb=%p\n",
+			vid->channel_index, vb2_buf);
+		list_del_init(&buf->list);
+		vid->queued_count--;
+		vid->active = buf;
+
+		if (ring_mode && vid->ring_cpu) {
+			hws_program_dma_window(vid, vid->ring_dma);
+		} else {
+			dma_addr_t dma_addr;
+
+			if (ring_mode && !vid->ring_cpu)
+				dev_warn(&hws->pdev->dev,
+					 "buffer_queue(ch=%u): ring buffer missing, using direct mode\n",
+					 vid->channel_index);
+
+			dma_addr = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
+			hws_program_dma_for_addr(vid->parent,
+						 vid->channel_index,
+						 dma_addr);
+			iowrite32(lower_32_bits(dma_addr),
+				  hws->bar0_base +
+				  HWS_REG_DMA_ADDR(vid->channel_index));
+			ring_mode = false;
+		}
+
+		if (ring_mode)
+			hws_set_dma_doorbell(hws, vid->channel_index,
+					     vid->ring_dma,
+					     "buffer_queue_ring");
+
+		wmb(); /* ensure descriptors visible before enabling capture */
+		hws_enable_video_capture(hws, vid->channel_index, true);
+	}
+	spin_unlock_irqrestore(&vid->irq_lock, flags);
+}
+
+static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct hws_video *v = q->drv_priv;
+	struct hws_pcie_dev *hws = v->parent;
+	struct hwsvideo_buffer *to_program = NULL;	/* local copy */
+	struct vb2_buffer *prog_vb2 = NULL;
+	unsigned long flags;
+	int ret;
+	bool ring_mode;
+
+	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
+		v->channel_index, count);
+
+	ret = hws_check_card_status(hws);
+	if (ret)
+		return ret;
+	(void)hws_update_active_interlace(hws, v->channel_index);
+
+	ring_mode = hws_use_ring(v);
+
+	mutex_lock(&v->state_lock);
+	/* init per-stream state */
+	WRITE_ONCE(v->stop_requested, false);
+	WRITE_ONCE(v->cap_active, true);
+	WRITE_ONCE(v->half_seen, false);
+	WRITE_ONCE(v->last_buf_half_toggle, 0);
+	mutex_unlock(&v->state_lock);
+
+	/* Try to prime a buffer, but it's OK if none are queued yet */
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (!v->active && !list_empty(&v->capture_queue)) {
+		to_program = list_first_entry(&v->capture_queue,
+					      struct hwsvideo_buffer, list);
+		list_del(&to_program->list);
+		v->queued_count--;
+		v->active = to_program;
+		prog_vb2 = &to_program->vb.vb2_buf;
+		dev_dbg(&hws->pdev->dev,
+			"start_streaming: ch=%u took buffer %p\n",
+			v->channel_index, to_program);
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	/* Only program/enable HW if we actually have a buffer */
+	if (to_program) {
+		if (!prog_vb2)
+			prog_vb2 = &to_program->vb.vb2_buf;
+
+		if (ring_mode) {
+			ret = hws_ring_setup(v);
+			if (ret) {
+				dev_warn(&hws->pdev->dev,
+					 "start_streaming: ch=%u ring setup failed (%d), switching to direct mode\n",
+					 v->channel_index, ret);
+				ring_mode = false;
+			}
+		}
+
+		if (ring_mode) {
+			hws_program_dma_window(v, v->ring_dma);
+		} else {
+			dma_addr_t dma_addr;
+
+			dma_addr = vb2_dma_contig_plane_dma_addr(prog_vb2, 0);
+			hws_program_dma_for_addr(hws, v->channel_index, dma_addr);
+			iowrite32(lower_32_bits(dma_addr),
+				  hws->bar0_base +
+				  HWS_REG_DMA_ADDR(v->channel_index));
+			dev_dbg(&hws->pdev->dev,
+				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
+				v->channel_index, to_program,
+				lower_32_bits(dma_addr));
+			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+		}
+
+		if (ring_mode) {
+			hws_set_dma_doorbell(hws, v->channel_index,
+					     v->ring_dma,
+					     "start_streaming_ring");
+			dev_dbg(&hws->pdev->dev,
+				"start_streaming: ch=%u ring mode active\n",
+				v->channel_index);
+		}
+
+		wmb(); /* ensure descriptors visible before enabling capture */
+		hws_enable_video_capture(hws, v->channel_index, true);
+	} else {
+		dev_dbg(&hws->pdev->dev,
+			"start_streaming: ch=%u no buffer yet (will arm on QBUF)\n",
+			v->channel_index);
+	}
+
+	return 0;
+}
+
+static inline bool list_node_unlinked(const struct list_head *n)
+{
+	return n->next == LIST_POISON1 || n->prev == LIST_POISON2;
+}
+
+static void hws_stop_streaming(struct vb2_queue *q)
+{
+	struct hws_video *v = q->drv_priv;
+	unsigned long flags;
+	struct hwsvideo_buffer *b, *tmp;
+	LIST_HEAD(done);
+
+	/* 1) Quiesce SW/HW first */
+	mutex_lock(&v->state_lock);
+	WRITE_ONCE(v->cap_active, false);
+	WRITE_ONCE(v->stop_requested, true);
+	mutex_unlock(&v->state_lock);
+
+	hws_enable_video_capture(v->parent, v->channel_index, false);
+
+	/* Release ring buffer if allocated */
+	hws_ring_release(v);
+
+	/* 2) Collect in-flight + queued under the IRQ lock */
+	spin_lock_irqsave(&v->irq_lock, flags);
+
+	if (v->active) {
+		/*
+		 * v->active may not be on any list (only referenced by v->active).
+		 * Only move it if its list node is still linked somewhere.
+		 */
+		if (!list_node_unlinked(&v->active->list)) {
+			/* Move directly to 'done' in one safe op */
+			list_move_tail(&v->active->list, &done);
+		} else {
+			/* Not on a list: put list node into a known state for later reuse */
+			INIT_LIST_HEAD(&v->active->list);
+			/*
+			 * We'll complete it below without relying on list pointers.
+			 * To unify flow, push it via a temporary single-element list.
+			 */
+			list_add_tail(&v->active->list, &done);
+		}
+		v->active = NULL;
+	}
+
+	while (!list_empty(&v->capture_queue)) {
+		b = list_first_entry(&v->capture_queue, struct hwsvideo_buffer,
+				     list);
+		/* Move (not del+add) to preserve invariants and avoid touching poisons */
+		list_move_tail(&b->list, &done);
+	}
+
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	/* 3) Complete outside the lock */
+	list_for_each_entry_safe(b, tmp, &done, list) {
+		/* Unlink from 'done' before completing */
+		list_del_init(&b->list);
+		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops hwspcie_video_qops = {
+	.queue_setup = hws_queue_setup,
+	.buf_prepare = hws_buffer_prepare,
+	.buf_init = hws_buf_init,
+	.buf_finish = hws_buf_finish,
+	.buf_cleanup = hws_buf_cleanup,
+	/* .buf_finish = hws_buffer_finish, */
+	.buf_queue = hws_buffer_queue,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = hws_start_streaming,
+	.stop_streaming = hws_stop_streaming,
+};
+
+int hws_video_register(struct hws_pcie_dev *dev)
+{
+	int i, ret;
+
+	ret = v4l2_device_register(&dev->pdev->dev, &dev->v4l2_device);
+	if (ret) {
+		dev_err(&dev->pdev->dev, "v4l2_device_register failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	for (i = 0; i < dev->cur_max_video_ch; i++) {
+		struct hws_video *ch = &dev->video[i];
+		struct video_device *vdev;
+		struct vb2_queue *q;
+
+		/* hws_video_init_channel() should have set:
+		 * - ch->parent, ch->channel_index
+		 * - locks (state_lock, irq_lock)
+		 * - capture_queue (INIT_LIST_HEAD)
+		 * - control_handler + controls
+		 * - fmt_curr (width/height)
+		 * Don’t reinitialize any of those here.
+		 */
+
+		vdev = video_device_alloc();
+		if (!vdev) {
+			dev_err(&dev->pdev->dev,
+				"video_device_alloc ch%u failed\n", i);
+			ret = -ENOMEM;
+			goto err_unwind;
+		}
+		ch->video_device = vdev;
+
+		/* Basic V4L2 node setup */
+		snprintf(vdev->name, sizeof(vdev->name), "%s-hdmi%u",
+			 KBUILD_MODNAME, i);
+		vdev->v4l2_dev = &dev->v4l2_device;
+		vdev->fops = &hws_fops;	/* your file_ops */
+		vdev->ioctl_ops = &hws_ioctl_fops;	/* your ioctl_ops */
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		vdev->lock = &ch->state_lock;	/* serialize file ops */
+		vdev->ctrl_handler = &ch->control_handler;
+		vdev->vfl_dir = VFL_DIR_RX;
+		vdev->release = video_device_release_empty;
+		if (ch->control_handler.error)
+			goto err_unwind;
+		video_set_drvdata(vdev, ch);
+
+		/* vb2 queue init (dma-contig) */
+		q = &ch->buffer_queue;
+		memset(q, 0, sizeof(*q));
+		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		q->io_modes = VB2_MMAP | VB2_DMABUF;
+		q->drv_priv = ch;
+		q->buf_struct_size = sizeof(struct hwsvideo_buffer);
+		q->ops = &hwspcie_video_qops;	/* your vb2_ops */
+		q->mem_ops = &vb2_dma_contig_memops;
+		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		q->lock = &ch->qlock;
+		q->max_num_buffers = HWS_MAX_BUFS;
+		q->min_queued_buffers = 1;
+		q->min_reqbufs_allocation = 1;
+		q->dev = &dev->pdev->dev;
+
+		ret = vb2_queue_init(q);
+		vdev->queue = q;
+		if (ret) {
+			dev_err(&dev->pdev->dev,
+				"vb2_queue_init ch%u failed: %d\n", i, ret);
+			goto err_unwind;
+		}
+
+		/* Make controls live (no-op if none or already set up) */
+		if (ch->control_handler.error) {
+			ret = ch->control_handler.error;
+			dev_err(&dev->pdev->dev,
+				"ctrl handler ch%u error: %d\n", i, ret);
+			goto err_unwind;
+		}
+		v4l2_ctrl_handler_setup(&ch->control_handler);
+		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+		if (ret) {
+			dev_err(&dev->pdev->dev,
+				"video_register_device ch%u failed: %d\n", i,
+				ret);
+			goto err_unwind;
+		}
+	}
+
+	return 0;
+
+err_unwind:
+	for (i = i - 1; i >= 0; i--) {
+		struct hws_video *ch = &dev->video[i];
+
+		if (video_is_registered(ch->video_device))
+			video_unregister_device(ch->video_device);
+
+		if (ch->buffer_queue.ops)
+			vb2_queue_release(&ch->buffer_queue);
+		v4l2_ctrl_handler_free(&ch->control_handler);
+		if (ch->video_device) {
+			/* If not registered, we must free the alloc’d vdev ourselves */
+			if (!video_is_registered(ch->video_device))
+				video_device_release(ch->video_device);
+			ch->video_device = NULL;
+		}
+	}
+	v4l2_device_unregister(&dev->v4l2_device);
+	return ret;
+}
+
+void hws_video_unregister(struct hws_pcie_dev *dev)
+{
+	int i;
+
+	if (!dev)
+		return;
+
+	for (i = 0; i < dev->cur_max_video_ch; i++) {
+		struct hws_video *ch = &dev->video[i];
+		unsigned long flags;
+
+		/* 1) Stop hardware capture for this channel (if running). */
+		if (ch->cap_active)
+			hws_enable_video_capture(dev, i, false);
+
+		/* 2) Drain SW queue + complete in-flight buffer as ERROR. */
+		spin_lock_irqsave(&ch->irq_lock, flags);
+
+		if (ch->active) {
+			vb2_buffer_done(&ch->active->vb.vb2_buf,
+					VB2_BUF_STATE_ERROR);
+			ch->active = NULL;
+		}
+		while (!list_empty(&ch->capture_queue)) {
+			struct hwsvideo_buffer *b =
+			    list_first_entry(&ch->capture_queue,
+					     struct hwsvideo_buffer, list);
+			list_del(&b->list);
+			vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		spin_unlock_irqrestore(&ch->irq_lock, flags);
+
+		/* 3) Release vb2 queue (safe to call once if it was inited). */
+		if (ch->buffer_queue.ops)
+			vb2_queue_release(&ch->buffer_queue);
+
+		/* 4) Free V4L2 controls. */
+		v4l2_ctrl_handler_free(&ch->control_handler);
+
+		/* 5) Unregister the video node (if it was registered). */
+		if (ch->video_device) {
+			if (video_is_registered(ch->video_device))
+				video_unregister_device(ch->video_device);
+			else
+				video_device_release(ch->video_device);
+			ch->video_device = NULL;
+		}
+		/* 6) Reset lightweight state (optional). */
+		ch->cap_active = false;
+		ch->stop_requested = false;
+		ch->last_buf_half_toggle = 0;
+		ch->half_seen = false;
+		ch->signal_loss_cnt = 0;
+		INIT_LIST_HEAD(&ch->capture_queue);
+	}
+	v4l2_device_unregister(&dev->v4l2_device);
+}
+
+int hws_video_pm_suspend(struct hws_pcie_dev *hws)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < hws->cur_max_video_ch; i++) {
+		struct hws_video *vid = &hws->video[i];
+		struct vb2_queue *q = &vid->buffer_queue;
+
+		if (!q || !q->ops)
+			continue;
+		if (vb2_is_streaming(q)) {
+			/* Stop via vb2 (runs your .stop_streaming) */
+			int r = vb2_streamoff(q, q->type);
+
+			if (r && !ret)
+				ret = r;
+		}
+	}
+	return ret;
+}
+
+void hws_video_pm_resume(struct hws_pcie_dev *hws)
+{
+	/* Nothing mandatory to do here for vb2 — userspace will STREAMON again.
+	 * If you track per-channel 'auto-restart' policy, re-arm it here.
+	 */
+}
diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
new file mode 100644
index 000000000000..2fa3c688c53e
--- /dev/null
+++ b/drivers/media/pci/hws/hws_video.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_VIDEO_H
+#define HWS_VIDEO_H
+
+int hws_video_register(struct hws_pcie_dev *dev);
+void hws_video_unregister(struct hws_pcie_dev *dev);
+void hws_enable_video_capture(struct hws_pcie_dev *hws,
+			      unsigned int chan,
+			      bool on);
+
+int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch);
+void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch);
+void check_video_format(struct hws_pcie_dev *pdx);
+int hws_check_card_status(struct hws_pcie_dev *hws);
+void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
+
+void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
+			      unsigned int ch,
+			      dma_addr_t dma);
+
+int hws_video_pm_suspend(struct hws_pcie_dev *hws);
+void hws_video_pm_resume(struct hws_pcie_dev *hws);
+
+#endif /* HWS_VIDEO_H */
-- 
2.51.0


