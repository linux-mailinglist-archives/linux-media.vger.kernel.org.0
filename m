Return-Path: <linux-media+bounces-50383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 167ADD10556
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 03:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BD63043F4E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 02:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7241630216D;
	Mon, 12 Jan 2026 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkYo0iHh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9F30171C
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768184683; cv=none; b=l/QtqQypWzKQoCk78n/Qb86LE0jefG/jBvRsPj+I/wfs7gWJVgZCYJEXhpohWku+O7kWE8B1ej/C4b/Cbv8g06dHkyzfcugUbC6AKoGWN6Zkq3egjqLusfnKRKjULluEAgEfD7NhvSsBq3QfzliY9+NDIn68FVnVc1CdJzWqDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768184683; c=relaxed/simple;
	bh=gZ3KHO7Mo4KFGbTz7E+1jpGfLXrz3glcPsaUPsp4PzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z72CEe4QhpfpKimrqMQmH6gpxLzXPo6IbdqKWVkjx+fAj3UlWPeRx1zvPZ01d648kyTt7R4J6kgfJ9AUqc8+ZYdd/j7+YiIeKi0pN7a5JYNaONeHKnki98+X2jm5X9fCgu0zTOVskcnpyWmjUIVO8SVG8Dw1y/DlcCure0HPe1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkYo0iHh; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ff4acb6eebso3777343fac.0
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 18:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768184677; x=1768789477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grEzemzsdzmJILqO+rdjzXW7J2f3mniynWkMNKTmHXo=;
        b=LkYo0iHh93BaIZGOkOaq7YpyU17bIhMMThYxM2hUfwBTYCR9teAMA92eP0d6JgzK0F
         O6LTWEB2sW/Ij7zMHh4cgBBGANgLZhqU+/Fhk/CoY/ut4Eo4jvj4T6NjMNaNeyUfdLZW
         9nB0JEUe3g7bwMdumzq2j885Znj4drpEjlry7Bt4nW0Ts0cFBL66KxI627T+SdT260Je
         XwySfvChHSe/hZXZk4A0VPMbvFMmSO55t3xA5wUc1L2RchCREExgfB7nwXUoleVSTEpV
         qUZcl9XFTnmZdo7wtNJhASCTyG4clueRVqNKRpEbEOcZEKr3nMw8L+D8oMuE7C06iATE
         amNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768184677; x=1768789477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=grEzemzsdzmJILqO+rdjzXW7J2f3mniynWkMNKTmHXo=;
        b=nqHgRfsIlxUXJcCWOZ+Tflw3u1s+CRmU5vYQnbv/+adqQo5xU5HriIiss4jmyHT6Yv
         akkl6Lps1KmyIaKWklfX5+iQ/Q0O/ZPFAlx0GFnyXrIYADNEiE20QSPBaTW3NwKEnMvJ
         K5sWqnWxu/TFiEmtV6AKrQrzhjJRmRSKfRAnQCN1ttSzx/wegLJ7fjzqim6WwhiSU2mS
         5nH394JwmuwvcBRdBeV4qPjjzageD35zlvM2pAKmS6W8JXeGKel204y8Ybce57vZY4rB
         uOTlB2BzFfgpBMFeb0MN/TwZuGvHLZyw0zkoenfgohRsOV28Dks2VhYkzLXfiDIoWBOw
         1I2Q==
X-Gm-Message-State: AOJu0YxhtBxzCu9LV/yfbiwdS1VDlWLyH3T9EPKZvQW7WJnckJxvxSug
	oeIc0ai9KWQ1pqXP7mwgVG1+z7wWli6GdMD4kiyq6C8w9EeNRJU+A/sb2tcr6g==
X-Gm-Gg: AY/fxX7rNX1Y7H4W3EYCXH0MdVTe54GoXntSaOcRfv/52Lq2FzuspJ9yxhGlEc4cRNL
	PAXyfQja/jsjq5WCBJQNOZ0AAhOMxOW6lkR+vziVwtF8EeDSjTkBBCY31wU0Pde1cxjO3BZs+7E
	/gkwyUyg4SJ2LHpebxmGfB+JkZk1BrcCKguTtygNgrkcLHuYixsZmJAjj/UQ5HZKDBZcapLype+
	4a+zO/W2HFeutO/cRn+4VnSf9mqqgy6kPKCrkTKYZYSde8Qe23HbEBGVy1QfC/3FuO7wftq0xae
	WGA2DhTzq4u3OS6J/H6/iOwCB4q3ZHYj3oJik7ZGH23L11PDlRSkbnYy+quFqH784KSQKaDY53x
	VQwiSunH98AQhMbzRTodxkvc0Kowj3/bfMPHXKPS01NHfLsw0a5tBqttURqBgHXvEn46eLrza8l
	b1TenSksYDSNWIyTMaOtCkQtXKXp+E3nQ3rJt4SS4uKyznsF4p3J/o9Xg1go28QAQ=
X-Google-Smtp-Source: AGHT+IG6ImEEsyu8TrJ5SgKXOtAPtsa4BJ88hKkpQ8B5uRwJRYx+LVVnhAEuRxoZG9WQUXwPWUmH0g==
X-Received: by 2002:a05:6871:6a9:b0:3e0:788f:2615 with SMTP id 586e51a60fabf-3ffc091457cmr7373151fac.3.1768184675967;
        Sun, 11 Jan 2026 18:24:35 -0800 (PST)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa50ecb58sm11293354fac.18.2026.01.11.18.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:24:35 -0800 (PST)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v1 1/2] media: pci: add AVMatrix HWS capture driver
Date: Sun, 11 Jan 2026 21:24:19 -0500
Message-ID: <20260112022420.390854-2-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an in-tree variant of the AVMatrix HWS PCIe capture module.
The driver supports up to four HDMI inputs and exposes them through V4L2.

Major pieces include:
  - PCI glue with capability discovery, BAR setup, interrupt handling
    and power-management hooks.
  - A vb2-dma-contig based video pipeline with DV timings support,
    per-channel controls, two-buffer management and loss-of-signal
    recovery.
  - Runtime suspend/resume handling and hotplug status propagation for
    the multi-channel boards.

The driver is wired into the media PCI build via a new Kconfig option
(CONFIG_VIDEO_HWS) and the subdirectory Makefile entry.

The baseline GPL out-of-tree driver is available at:
  https://github.com/benhoff/hws/tree/baseline
A vendor driver bundle is available at:
  https://www.acasis.com/pages/acasis-product-drivers

Vendor was not involved in this upstreaming effort.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/Kconfig              |    1 +
 drivers/media/pci/Makefile             |    1 +
 drivers/media/pci/hws/Kconfig          |   12 +
 drivers/media/pci/hws/Makefile         |    4 +
 drivers/media/pci/hws/hws.h            |  175 +++
 drivers/media/pci/hws/hws_irq.c        |  268 ++++
 drivers/media/pci/hws/hws_irq.h        |   10 +
 drivers/media/pci/hws/hws_pci.c        |  722 +++++++++++
 drivers/media/pci/hws/hws_reg.h        |  144 +++
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  755 ++++++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h |   38 +
 drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
 drivers/media/pci/hws/hws_video.h      |   29 +
 13 files changed, 3701 insertions(+)
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
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
index 000000000000..8d599ffdbcf1
--- /dev/null
+++ b/drivers/media/pci/hws/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_HWS
+	tristate "AVMatrix HWS PCIe capture devices"
+	depends on PCI && VIDEO_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_DMA_SG
+	help
+	  Enable support for AVMatrix HWS series multi-channel PCIe capture
+	  devices that provide HDMI video capture.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be named hws.
diff --git a/drivers/media/pci/hws/Makefile b/drivers/media/pci/hws/Makefile
new file mode 100644
index 000000000000..f9c7dc4f2d8d
--- /dev/null
+++ b/drivers/media/pci/hws/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+hws-objs := hws_pci.o hws_irq.o hws_video.o hws_v4l2_ioctl.o
+
+obj-$(CONFIG_VIDEO_HWS) += hws.o
diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
new file mode 100644
index 000000000000..1c18edeefa53
--- /dev/null
+++ b/drivers/media/pci/hws/hws.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_PCIE_H
+#define HWS_PCIE_H
+
+#include <linux/types.h>
+#include <linux/compiler.h>
+#include <linux/dma-mapping.h>
+#include <linux/kthread.h>
+#include <linux/pci.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/sizes.h>
+#include <linux/atomic.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "hws_reg.h"
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
+struct hws_video;
+
+struct hwsvideo_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	int slot;		/* for two-buffer approach */
+};
+
+struct hws_video {
+	/* ----- linkage ----- */
+	struct hws_pcie_dev *parent;	/* parent device */
+	struct video_device *video_device;
+
+	struct vb2_queue buffer_queue;
+	struct list_head capture_queue;
+	struct hwsvideo_buffer *active;
+	struct hwsvideo_buffer *next_prepared;
+
+	/* ----- locking ----- */
+	struct mutex state_lock;	/* primary state */
+	spinlock_t irq_lock;	/* ISR-side */
+
+	/* ----- indices ----- */
+	int channel_index;
+
+	/* ----- colour controls ----- */
+	int current_brightness;
+	int current_contrast;
+	int current_saturation;
+	int current_hue;
+
+	/* ----- V4L2 controls ----- */
+	struct v4l2_ctrl_handler control_handler;
+	struct v4l2_ctrl *hotplug_detect_control;
+	struct v4l2_ctrl *ctrl_brightness;
+	struct v4l2_ctrl *ctrl_contrast;
+	struct v4l2_ctrl *ctrl_saturation;
+	struct v4l2_ctrl *ctrl_hue;
+	/* ----- capture queue status ----- */
+	struct hws_pix_state pix;
+	struct v4l2_dv_timings cur_dv_timings; /* last configured DV timings */
+	u32 current_fps; /* Hz, derived from mode or HW rate reg */
+	u32 alloc_sizeimage;
+
+	/* ----- per-channel capture state ----- */
+	bool cap_active;
+	bool stop_requested;
+	u8 last_buf_half_toggle;
+	bool half_seen;
+	atomic_t sequence_number;
+	u32 queued_count;
+
+	/* ----- timeout and error handling ----- */
+	u32 timeout_count;
+	u32 error_count;
+
+	bool window_valid;
+	u32 last_dma_hi;
+	u32 last_dma_page;
+	u32 last_pci_addr;
+	u32 last_half16;
+
+	/* ----- misc counters ----- */
+	int signal_loss_cnt;
+};
+
+static inline void hws_set_current_dv_timings(struct hws_video *vid,
+					      u32 width, u32 height,
+					      bool interlaced)
+{
+	if (!vid)
+		return;
+
+	vid->cur_dv_timings = (struct v4l2_dv_timings) {
+		.type = V4L2_DV_BT_656_1120,
+		.bt = {
+			.width = width,
+			.height = height,
+			.interlaced = interlaced,
+		},
+	};
+}
+
+struct hws_scratch_dma {
+	void *cpu;
+	dma_addr_t dma;
+	size_t size;
+};
+
+struct hws_pcie_dev {
+	/* ----- core objects ----- */
+	struct pci_dev *pdev;
+	struct hws_video video[MAX_VID_CHANNELS];
+
+	/* ----- BAR & workqueues ----- */
+	void __iomem *bar0_base;
+
+	/* ----- device identity / capabilities ----- */
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
+	bool start_run;
+
+	bool buf_allocated;
+
+	/* ----- V4L2 framework objects ----- */
+	struct v4l2_device v4l2_device;
+
+	/* ----- kernel thread ----- */
+	struct task_struct *main_task;
+	struct hws_scratch_dma scratch_vid[MAX_VID_CHANNELS];
+
+	bool suspended;
+	int irq;
+
+	/* ----- error flags ----- */
+	int pci_lost;
+
+};
+
+#endif
diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
new file mode 100644
index 000000000000..54b25416b3ad
--- /dev/null
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/compiler.h>
+#include <linux/moduleparam.h>
+#include <linux/io.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/minmax.h>
+#include <linux/string.h>
+
+#include <media/videobuf2-dma-contig.h>
+
+#include "hws_irq.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws.h"
+
+#define MAX_INT_LOOPS 100
+
+static bool hws_toggle_debug;
+module_param_named(toggle_debug, hws_toggle_debug, bool, 0644);
+MODULE_PARM_DESC(toggle_debug,
+		 "Read toggle registers in IRQ handler for debug logging");
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
+	list_del_init(&buf->list);	/* keep buffer safe for later cleanup */
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
+	spin_lock_irqsave(&v->irq_lock, flags);
+	hws_prime_next_locked(v);
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+	return 0;
+}
+
+static void hws_video_handle_vdone(struct hws_video *v)
+{
+	struct hws_pcie_dev *hws = v->parent;
+	unsigned int ch = v->channel_index;
+	struct hwsvideo_buffer *done;
+	unsigned long flags;
+	bool promoted = false;
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
+	spin_lock_irqsave(&v->irq_lock, flags);
+	done = v->active;
+	if (done && v->next_prepared) {
+		v->active = v->next_prepared;
+		v->next_prepared = NULL;
+		promoted = true;
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	/* 1) Complete the buffer the HW just finished (if any) */
+	if (done) {
+		struct vb2_v4l2_buffer *vb2v = &done->vb;
+		size_t expected = v->pix.sizeimage;
+		size_t plane_size = vb2_plane_size(&vb2v->vb2_buf, 0);
+
+		if (unlikely(expected > plane_size)) {
+			dev_warn_ratelimited(&hws->pdev->dev,
+					     "bh_video(ch=%u): sizeimage %zu > plane %zu, dropping seq=%u\n",
+					     ch, expected, plane_size,
+					     (u32)atomic_read(&v->sequence_number) + 1);
+			vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_ERROR);
+			goto arm_next;
+		}
+		vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
+
+		dma_rmb();	/* device writes visible before userspace sees it */
+
+		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
+		vb2v->vb2_buf.timestamp = ktime_get_ns();
+		dev_dbg(&hws->pdev->dev,
+			"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
+			ch, done, vb2v->sequence, v->half_seen,
+			v->last_buf_half_toggle);
+
+		if (!promoted)
+			v->active = NULL;	/* channel no longer owns this buffer */
+		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
+	if (unlikely(READ_ONCE(hws->suspended)))
+		return;
+
+	if (promoted) {
+		dev_dbg(&hws->pdev->dev,
+			"bh_video(ch=%u): promoted pre-armed buffer active=%p\n",
+			ch, v->active);
+		spin_lock_irqsave(&v->irq_lock, flags);
+		hws_prime_next_locked(v);
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		return;
+	}
+
+arm_next:
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
+	/* On success the engine now points at v->active's DMA address */
+}
+
+irqreturn_t hws_irq_handler(int irq, void *info)
+{
+	struct hws_pcie_dev *pdx = info;
+	u32 int_state;
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
+		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
+		if (int_state) {
+			writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
+			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
+		}
+		return int_state ? IRQ_HANDLED : IRQ_NONE;
+	}
+	// u32 sys_status = readl(pdx->bar0_base + HWS_REG_SYS_STATUS);
+
+	int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
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
+			if (likely(READ_ONCE(pdx->video[ch].cap_active) &&
+				   !READ_ONCE(pdx->video[ch].stop_requested))) {
+				if (unlikely(hws_toggle_debug)) {
+					u32 toggle =
+					    readl_relaxed(pdx->bar0_base +
+						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
+					WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
+						   toggle);
+				}
+				dma_rmb();
+				WRITE_ONCE(pdx->video[ch].half_seen, true);
+				dev_dbg(&pdx->pdev->dev,
+					"irq: VDONE ch=%u toggle=%u handling inline (cap=%d)\n",
+					ch,
+					READ_ONCE(pdx->video[ch].last_buf_half_toggle),
+					READ_ONCE(pdx->video[ch].cap_active));
+				hws_video_handle_vdone(&pdx->video[ch]);
+			} else {
+				dev_dbg(&pdx->pdev->dev,
+					"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
+					ch,
+					READ_ONCE(pdx->video[ch].cap_active),
+					READ_ONCE(pdx->video[ch].stop_requested));
+			}
+
+			writel(vbit, pdx->bar0_base + HWS_REG_INT_STATUS);
+			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
+		}
+
+		/* Re-read in case new interrupt bits popped while processing */
+		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
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
index 000000000000..a42867aa0c46
--- /dev/null
+++ b/drivers/media/pci/hws/hws_irq.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_INTERRUPT_H
+#define HWS_INTERRUPT_H
+
+#include <linux/pci.h>
+#include "hws.h"
+
+irqreturn_t hws_irq_handler(int irq, void *info);
+
+#endif /* HWS_INTERRUPT_H */
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
new file mode 100644
index 000000000000..61334a694b0e
--- /dev/null
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -0,0 +1,722 @@
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
+/*
+ * PCI IDs for HWS family cards.
+ *
+ * The subsystem IDs are fixed at 0x8888:0x0007 for this family. Some boards
+ * enumerate with vendor ID 0x8888 or 0x1f33. Exact SKU names are not fully
+ * pinned down yet; update these comments when vendor documentation or INF
+ * strings are available.
+ */
+static const struct pci_device_id hws_pci_table[] = {
+	/* HWS family, SKU unknown. */
+	MAKE_ENTRY(0x8888, 0x9534, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8534, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x8554, 0x8888, 0x0007, NULL),
+
+	/* HWS 2x2 HDMI family. */
+	MAKE_ENTRY(0x8888, 0x8524, 0x8888, 0x0007, NULL),
+	/* HWS 2x2 SDI family. */
+	MAKE_ENTRY(0x1F33, 0x6524, 0x8888, 0x0007, NULL),
+
+	/* HWS X4 HDMI family. */
+	MAKE_ENTRY(0x8888, 0x8504, 0x8888, 0x0007, NULL),
+	/* HWS X4 SDI family. */
+	MAKE_ENTRY(0x8888, 0x6504, 0x8888, 0x0007, NULL),
+
+	/* HWS family, SKU unknown. */
+	MAKE_ENTRY(0x8888, 0x8532, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8512, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x8888, 0x8501, 0x8888, 0x0007, NULL),
+	MAKE_ENTRY(0x1F33, 0x6502, 0x8888, 0x0007, NULL),
+
+	/* HWS X4 HDMI family (alternate vendor ID). */
+	MAKE_ENTRY(0x1F33, 0x8504, 0x8888, 0x0007, NULL),
+	/* HWS 2x2 HDMI family (alternate vendor ID). */
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
+	case 0x8504:
+	case 0x6504:
+		hdev->cur_max_video_ch = 4;
+		break;
+	case 0x8532:
+		hdev->cur_max_video_ch = 2;
+		break;
+	case 0x8512:
+	case 0x6502:
+		hdev->cur_max_video_ch = 2;
+		break;
+	case 0x8501:
+		hdev->cur_max_video_ch = 1;
+		break;
+	default:
+		hdev->cur_max_video_ch = 4;
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
+	hdev->start_run = false;
+	hdev->pci_lost = 0;
+
+	writel(0x00, hdev->bar0_base + HWS_REG_DEC_MODE);
+	writel(0x10, hdev->bar0_base + HWS_REG_DEC_MODE);
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
+static void hws_free_irq_vectors_action(void *data)
+{
+	pci_free_irq_vectors((struct pci_dev *)data);
+}
+
+static bool hws_any_capture_active(const struct hws_pcie_dev *pdx)
+{
+	unsigned int ch, max;
+
+	if (!pdx)
+		return false;
+
+	max = READ_ONCE(pdx->cur_max_video_ch);
+	if (max > pdx->max_channels)
+		max = pdx->max_channels;
+
+	for (ch = 0; ch < max; ch++) {
+		if (READ_ONCE(pdx->video[ch].cap_active))
+			return true;
+	}
+
+	return false;
+}
+
+static int main_ks_thread_handle(void *data)
+{
+	struct hws_pcie_dev *pdx = data;
+
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		/* If we're suspending, don't touch hardware; just sleep/freeeze */
+		if (READ_ONCE(pdx->suspended)) {
+			try_to_freeze();
+			schedule_timeout_interruptible(msecs_to_jiffies(1000));
+			continue;
+		}
+
+		/* avoid MMIO when suspended (guarded above) */
+		check_video_format(pdx);
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
+	struct hws_pcie_dev *hws = data;
+	struct task_struct *t;
+
+	if (!hws)
+		return;
+
+	t = READ_ONCE(hws->main_task);
+	if (!IS_ERR_OR_NULL(t)) {
+		WRITE_ONCE(hws->main_task, NULL);
+		kthread_stop(t);
+	}
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
+	/* half size: use either the current format's half or half of scratch */
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
+	int i, ret, nvec, irq;
+	unsigned long irqf = 0;
+	bool has_msix_cap, has_msi_cap, using_msi;
+	bool v4l2_registered = false;
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
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		dev_warn(&pdev->dev,
+			 "64-bit DMA mask unavailable, falling back to 32-bit (%d)\n",
+			 ret);
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "No suitable DMA configuration\n");
+	} else {
+		dev_dbg(&pdev->dev, "Using 64-bit DMA mask\n");
+	}
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
+	/* 5) Init channels (video state, locks, vb2, ctrls) */
+	for (i = 0; i < hws->max_channels; i++) {
+		ret = hws_video_init_channel(hws, i);
+		if (ret) {
+			dev_err(&pdev->dev, "video channel init failed (ch=%d)\n", i);
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
+	/* 11) Register V4L2 */
+	ret = hws_video_register(hws);
+	if (ret) {
+		dev_err(&pdev->dev, "video_register: %d\n", ret);
+		goto err_unwind_channels;
+	}
+	v4l2_registered = true;
+
+	/* 12) Background monitor thread (managed) */
+	hws->main_task = kthread_run(main_ks_thread_handle, hws, "hws-mon");
+	if (IS_ERR(hws->main_task)) {
+		ret = PTR_ERR(hws->main_task);
+		hws->main_task = NULL;
+		dev_err(&pdev->dev, "kthread_run: %d\n", ret);
+		goto err_unregister_va;
+	}
+	ret = devm_add_action_or_reset(&pdev->dev, hws_stop_kthread_action, hws);
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
+	hws_video_unregister(hws);
+	hws_free_seed_buffers(hws);
+	return ret;
+err_unwind_channels:
+	hws_free_seed_buffers(hws);
+	if (!v4l2_registered) {
+		while (--i >= 0)
+			hws_video_cleanup_channel(hws, i);
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
+/* Publish stop so ISR/BH won't touch video buffers anymore. */
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
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush */
+
+	/* Let any in-flight DMAs finish (best-effort). */
+	(void)hws_check_busy(hws);
+
+	/* Ack any latched VDONE. */
+	for (i = 0; i < hws->cur_max_video_ch; ++i)
+		ackmask |= HWS_INT_VDONE_BIT(i);
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
+
+	if (!hws)
+		return;
+
+	/* Stop the monitor thread before tearing down V4L2/vb2 objects. */
+	WRITE_ONCE(hws->suspended, true);
+	hws_stop_kthread_action(hws);
+
+	/* Stop hardware / capture cleanly (your helper) */
+	hws_stop_device(hws);
+
+	/* Unregister subsystems you registered */
+	hws_video_unregister(hws);
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
+	/* Re-seed BAR remaps/DMA windows and restart the capture core */
+	hws_seed_all_channels(hws);
+	hws_init_video_sys(hws, true);
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
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_reg.h
new file mode 100644
index 000000000000..224573595240
--- /dev/null
+++ b/drivers/media/pci/hws/hws_reg.h
@@ -0,0 +1,144 @@
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
+#define MAX_L_VIDEO_SIZE            0x200000U
+
+#define PCI_E_BAR_PAGE_SIZE 0x20000000
+#define PCI_E_BAR_ADD_MASK 0xE0000000
+#define PCI_E_BAR_ADD_LOWMASK 0x1FFFFFFF
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
+/* Core/global status. */
+#define HWS_REG_SYS_STATUS            (CVBS_IN_BASE +  0 * PCIE_BARADDROFSIZE)
+/* bit3: DMA busy, bit2: int, ... */
+
+#define HWS_SYS_DMA_BUSY_BIT          BIT(3) /* 0x08 = DMA busy flag */
+
+#define HWS_REG_DEC_MODE       (CVBS_IN_BASE +  0 * PCIE_BARADDROFSIZE)
+/* Main control register */
+#define HWS_REG_CTL            (CVBS_IN_BASE +  4 * PCIE_BARADDROFSIZE)
+#define HWS_CTL_IRQ_ENABLE_BIT BIT(0)   /* Global interrupt enable bit */
+/*  Write 0x00 to fully reset decoder,
+ *  set bit 31=1 to "start run",
+ *  low byte=0x13 selects YUYV/BT.709/etc,
+ *  in ReadChipId() we also write 0x00 and 0x10 here for chip-ID sequencing.
+ */
+
+/* per-pipe base: 0x4000, stride 0x800 ------------------------------------ */
+#define HWS_REG_PIPE_BASE(n)   (CVBS_IN_BASE + ((n) * 0x800))
+#define HWS_REG_HPD(n)         (HWS_REG_PIPE_BASE(n) + 0x14)  /* +5 V & HPD */
+
+/* handy bit masks */
+#define HWS_HPD_BIT            BIT(0)      /* hot-plug detect */
+#define HWS_5V_BIT             BIT(3)      /* cable +5-volt */
+
+/* Per-channel done flags. */
+#define HWS_REG_INT_STATUS            (CVBS_IN_BASE +  1 * PCIE_BARADDROFSIZE)
+#define HWS_SYS_BUSY_BIT          BIT(2)      /* matches old 0x04 test   */
+
+/* Capture enable switches. */
+/* bit0-3: CH0-CH3 video enable */
+#define HWS_REG_VCAP_ENABLE           (CVBS_IN_BASE +  2 * PCIE_BARADDROFSIZE)
+/* bits0-3: signal present, bits8-11: interlace */
+#define HWS_REG_ACTIVE_STATUS          (CVBS_IN_BASE +  5  * PCIE_BARADDROFSIZE)
+/* bits0-3: HDCP detected */
+#define HWS_REG_HDCP_STATUS            (CVBS_IN_BASE +  8  * PCIE_BARADDROFSIZE)
+#define HWS_REG_DMA_MAX_SIZE   (CVBS_IN_BASE +  9 * PCIE_BARADDROFSIZE)
+
+/* Buffer addresses (written once during init/reset). */
+/* Base of host-visible buffer. */
+#define HWS_REG_VBUF1_ADDR            (CVBS_IN_BASE + 25 * PCIE_BARADDROFSIZE)
+/* Per-channel DMA address. */
+#define HWS_REG_DMA_ADDR(ch)          (CVBS_IN_BASE + (26 + (ch)) * PCIE_BARADDROFSIZE)
+
+/* Per-channel live buffer toggles (read-only). */
+#define HWS_REG_VBUF_TOGGLE(ch)       (CVBS_IN_BASE + (32 + (ch)) * PCIE_BARADDROFSIZE)
+/*
+ * Returns 0 or 1 = which half of the video ring the DMA engine is
+ * currently filling for channel *ch* (0-3).
+ */
+
+/* Per-interrupt bits (video 0-3). */
+#define HWS_INT_VDONE_BIT(ch)     BIT(ch)         /* 0x01,0x02,0x04,0x08  */
+
+#define HWS_REG_INT_ACK           (CVBS_IN_BASE + 0x4000 + 1 * PCIE_BARADDROFSIZE)
+
+/* 16-bit W | 16-bit H. */
+#define HWS_REG_IN_RES(ch)             (CVBS_IN_BASE + (90  + (ch) * 2) * PCIE_BARADDROFSIZE)
+/* B|C|H|S packed bytes. */
+#define HWS_REG_BCHS(ch)               (CVBS_IN_BASE + (91  + (ch) * 2) * PCIE_BARADDROFSIZE)
+
+/* Input fps. */
+#define HWS_REG_FRAME_RATE(ch)         (CVBS_IN_BASE + (110 + (ch))    * PCIE_BARADDROFSIZE)
+/* Programmed out W|H. */
+#define HWS_REG_OUT_RES(ch)            (CVBS_IN_BASE + (120 + (ch))    * PCIE_BARADDROFSIZE)
+/* Programmed out fps. */
+#define HWS_REG_OUT_FRAME_RATE(ch)     (CVBS_IN_BASE + (130 + (ch))    * PCIE_BARADDROFSIZE)
+
+/* Device version/port ID/subversion register. */
+#define HWS_REG_DEVICE_INFO   (CVBS_IN_BASE +  88 * PCIE_BARADDROFSIZE)
+/*
+ * Reading this 32-bit word returns:
+ *   bits 7:0   = "device version"
+ *   bits 15:8  = "device sub-version"
+ *   bits 23:24 = "HW key / port ID" etc.
+ *   bits 31:28 = "support YV12" flags
+ */
+
+/* Convenience aliases for individual channels. */
+#define HWS_REG_VBUF_TOGGLE_CH0       HWS_REG_VBUF_TOGGLE(0)
+#define HWS_REG_VBUF_TOGGLE_CH1       HWS_REG_VBUF_TOGGLE(1)
+#define HWS_REG_VBUF_TOGGLE_CH2       HWS_REG_VBUF_TOGGLE(2)
+#define HWS_REG_VBUF_TOGGLE_CH3       HWS_REG_VBUF_TOGGLE(3)
+
+#endif /* _HWS_PCIE_REG_H */
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/hws/hws_v4l2_ioctl.c
new file mode 100644
index 000000000000..23139540041a
--- /dev/null
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
@@ -0,0 +1,755 @@
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
+
+struct hws_dv_mode {
+	struct v4l2_dv_timings timings;
+	u32 refresh_hz;
+};
+
+static const struct hws_dv_mode *
+hws_find_dv_by_wh(u32 w, u32 h, bool interlaced);
+
+static const struct hws_dv_mode hws_dv_modes[] = {
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1920,
+				.height = 1080,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1280,
+				.height = 720,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 720,
+				.height = 480,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 720,
+				.height = 576,
+				.interlaced = 0,
+			},
+		},
+		50,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 800,
+				.height = 600,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 640,
+				.height = 480,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1024,
+				.height = 768,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1280,
+				.height = 768,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1280,
+				.height = 800,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1280,
+				.height = 1024,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1360,
+				.height = 768,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1440,
+				.height = 900,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1680,
+				.height = 1050,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+	/* Portrait */
+	{
+		{
+			.type = V4L2_DV_BT_656_1120,
+			.bt = {
+				.width = 1080,
+				.height = 1920,
+				.interlaced = 0,
+			},
+		},
+		60,
+	},
+};
+
+static const size_t hws_dv_modes_cnt = ARRAY_SIZE(hws_dv_modes);
+
+/* YUYV: 16 bpp; align to 64 as you did elsewhere */
+static inline u32 hws_calc_bpl_yuyv(u32 w)     { return ALIGN(w * 2, 64); }
+static inline u32 hws_calc_size_yuyv(u32 w, u32 h) { return hws_calc_bpl_yuyv(w) * h; }
+static inline u32 hws_calc_half_size(u32 sizeimage)
+{
+	return sizeimage / 2;
+}
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
+static const struct hws_dv_mode *
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
+/* Helper: find a supported DV mode by W/H + interlace flag */
+static const struct hws_dv_mode *
+hws_find_dv_by_wh(u32 w, u32 h, bool interlaced)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
+		const struct hws_dv_mode *t = &hws_dv_modes[i];
+		const struct v4l2_bt_timings *bt = &t->timings.bt;
+
+		if (t->timings.type != V4L2_DV_BT_656_1120)
+			continue;
+
+		if (bt->width == w && bt->height == h &&
+		    !!bt->interlaced == interlaced)
+			return t;
+	}
+	return NULL;
+}
+
+static bool hws_get_live_dv_geometry(struct hws_video *vid,
+				     u32 *w, u32 *h, bool *interlaced)
+{
+	struct hws_pcie_dev *pdx;
+	u32 reg;
+
+	if (!vid)
+		return false;
+
+	pdx = vid->parent;
+	if (!pdx || !pdx->bar0_base)
+		return false;
+
+	reg = readl(pdx->bar0_base + HWS_REG_IN_RES(vid->channel_index));
+	if (!reg || reg == 0xFFFFFFFF)
+		return false;
+
+	if (w)
+		*w = reg & 0xFFFF;
+	if (h)
+		*h = (reg >> 16) & 0xFFFF;
+	if (interlaced) {
+		reg = readl(pdx->bar0_base + HWS_REG_ACTIVE_STATUS);
+		*interlaced = !!(reg & BIT(8 + vid->channel_index));
+	}
+	return true;
+}
+
+static u32 hws_pick_fps_from_mode(u32 w, u32 h, bool interlaced)
+{
+	const struct hws_dv_mode *m = hws_find_dv_by_wh(w, h, interlaced);
+
+	if (m && m->refresh_hz)
+		return m->refresh_hz;
+	/* Fallback to a sane default */
+	return 60;
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
+	const struct hws_dv_mode *m;
+	u32 w, h;
+	bool interlace, live_ok;
+
+	if (!timings)
+		return -EINVAL;
+
+	w = vid->pix.width;
+	h = vid->pix.height;
+	interlace = vid->pix.interlaced;
+	live_ok = hws_get_live_dv_geometry(vid, &w, &h, &interlace);
+	/* Map current (live if available, otherwise cached) WxH/interlace
+	 * to one of our supported modes.
+	 */
+	m = hws_find_dv_by_wh(w, h, !!interlace);
+	if (!m)
+		return -ENOLINK;
+
+	*timings = m->timings;
+	vid->cur_dv_timings = m->timings;
+	vid->current_fps = m->refresh_hz;
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
+	edv->timings = hws_dv_modes[edv->index].timings;
+	return 0;
+}
+
+/* Get the *currently configured* DV timings. */
+int hws_vidioc_g_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings)
+{
+	struct hws_video *vid = video_drvdata(file);
+
+	if (!timings)
+		return -EINVAL;
+
+	*timings = vid->cur_dv_timings;
+	return 0;
+}
+
+static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
+{
+	bool sd = p->height <= 576;
+
+	p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
+	p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
+	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
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
+	const struct hws_dv_mode *m;
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
+	bt = &m->timings.bt;
+	if (bt->interlaced)
+		return -EINVAL; /* only progressive modes are advertised */
+	new_w = bt->width;
+	new_h = bt->height;
+	interlaced = false;
+
+	lockdep_assert_held(&vid->state_lock);
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
+	vid->pix.half_size    = hws_calc_half_size(vid->pix.sizeimage);
+	vid->cur_dv_timings   = m->timings;
+	vid->current_fps      = m->refresh_hz;
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
+		const struct v4l2_bt_timings *bt = &hws_dv_modes[i].timings.bt;
+
+		if (hws_dv_modes[i].timings.type != V4L2_DV_BT_656_1120)
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
+	.s_ctrl = hws_s_ctrl,
+};
+
+int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	struct hws_video *vid = video_drvdata(file);
+	struct hws_pcie_dev *pdev = vid->parent;
+	int vi_index = vid->channel_index + 1; /* keep it simple */
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card),
+		 "AVMatrix HWS Capture %d", vi_index);
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", dev_name(&pdev->pdev->dev));
+
+	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f)
+{
+	if (f->index != 0)
+		return -EINVAL; /* only one format */
+
+	f->pixelformat = V4L2_PIX_FMT_YUYV;
+	return 0;
+}
+
+int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+{
+	struct hws_video *vid = video_drvdata(file);
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
+	p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
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
+		w = 640; /* hard fallback in case macros are odd */
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
+	size = (size_t)bpl * (size_t)h;
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
+	/* Don't allow size changes while buffers are queued */
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
+	vid->pix.bytesperline = f->fmt.pix.bytesperline; /* aligned */
+	vid->pix.sizeimage    = f->fmt.pix.sizeimage;    /* logical */
+	vid->pix.half_size    = hws_calc_half_size(vid->pix.sizeimage);
+	vid->pix.interlaced   = false;
+	hws_set_current_dv_timings(vid, vid->pix.width, vid->pix.height,
+				   vid->pix.interlaced);
+	vid->current_fps = hws_pick_fps_from_mode(vid->pix.width,
+						  vid->pix.height,
+						  vid->pix.interlaced);
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
+	struct hws_video *vid = video_drvdata(file);
+	u32 fps;
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	fps = vid->current_fps ? vid->current_fps : 60;
+
+	/* Report cached frame rate; expose timeperframe capability */
+	param->parm.capture.capability           = V4L2_CAP_TIMEPERFRAME;
+	param->parm.capture.capturemode          = 0;
+	param->parm.capture.timeperframe.numerator   = 1;
+	param->parm.capture.timeperframe.denominator = fps;
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
+int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
+{
+	struct hws_video *vid = video_drvdata(file);
+	struct v4l2_captureparm *cap;
+	u32 fps;
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	cap = &param->parm.capture;
+
+	fps = vid->current_fps ? vid->current_fps : 60;
+	cap->timeperframe.denominator = fps;
+	cap->timeperframe.numerator   = 1;
+	cap->capability               = V4L2_CAP_TIMEPERFRAME;
+	cap->capturemode              = 0;
+	cap->extendedmode             = 0;
+	/* readbuffers left unchanged or zero; vb2 handles queue depth */
+
+	return 0;
+}
diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/hws/hws_v4l2_ioctl.h
new file mode 100644
index 000000000000..745acab9f057
--- /dev/null
+++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
@@ -0,0 +1,38 @@
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
+int vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
+int hws_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorms);
+int hws_vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorms);
+int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *setfps);
+int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i);
+int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
+int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
+int hws_vidioc_g_ctrl(struct file *file, void *fh, struct v4l2_control *a);
+int hws_vidioc_s_ctrl(struct file *file, void *fh, struct v4l2_control *a);
+int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
+			      struct v4l2_dv_timings_cap *cap);
+int hws_vidioc_s_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings);
+
+int hws_vidioc_queryctrl(struct file *file, void *fh, struct v4l2_queryctrl *a);
+int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a);
+int hws_vidioc_g_dv_timings(struct file *file, void *fh,
+			    struct v4l2_dv_timings *timings);
+int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
+			       struct v4l2_enum_dv_timings *edv);
+int hws_vidioc_query_dv_timings(struct file *file, void *fh,
+				struct v4l2_dv_timings *timings);
+int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
+
+#endif
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
new file mode 100644
index 000000000000..42f3a756a85c
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
+#include <linux/interrupt.h>
+#include <linux/moduleparam.h>
+#include <linux/sysfs.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "hws.h"
+#include "hws_reg.h"
+#include "hws_video.h"
+#include "hws_irq.h"
+#include "hws_v4l2_ioctl.h"
+
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
+/* DMA helper functions */
+static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
+static struct hwsvideo_buffer *
+hws_take_queued_buffer_locked(struct hws_video *vid);
+
+#if IS_ENABLED(CONFIG_SYSFS)
+static ssize_t resolution_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct video_device *vdev = to_video_device(dev);
+	struct hws_video *vid = video_get_drvdata(vdev);
+	struct hws_pcie_dev *hws;
+	u32 res_reg;
+	u16 w, h;
+	bool interlaced;
+
+	if (!vid)
+		return -ENODEV;
+
+	hws = vid->parent;
+	if (!hws || !hws->bar0_base)
+		return sysfs_emit(buf, "unknown\n");
+
+	res_reg = readl(hws->bar0_base + HWS_REG_IN_RES(vid->channel_index));
+	if (!res_reg || res_reg == 0xFFFFFFFF)
+		return sysfs_emit(buf, "unknown\n");
+
+	w = res_reg & 0xFFFF;
+	h = (res_reg >> 16) & 0xFFFF;
+
+	interlaced =
+	    !!(readl(hws->bar0_base + HWS_REG_ACTIVE_STATUS) &
+	       BIT(8 + vid->channel_index));
+
+	return sysfs_emit(buf, "%ux%u%s\n", w, h, interlaced ? "i" : "p");
+}
+static DEVICE_ATTR_RO(resolution);
+
+static inline int hws_resolution_create(struct video_device *vdev)
+{
+	return device_create_file(&vdev->dev, &dev_attr_resolution);
+}
+
+static inline void hws_resolution_remove(struct video_device *vdev)
+{
+	device_remove_file(&vdev->dev, &dev_attr_resolution);
+}
+#else
+static inline int hws_resolution_create(struct video_device *vdev)
+{
+	return 0;
+}
+
+static inline void hws_resolution_remove(struct video_device *vdev)
+{
+}
+#endif
+
+static bool dma_window_verify;
+module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
+MODULE_PARM_DESC(dma_window_verify,
+		 "Read back DMA window registers after programming (debug)");
+
+void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
+			  dma_addr_t dma, const char *tag)
+{
+	iowrite32(lower_32_bits(dma), hws->bar0_base + HWS_REG_DMA_ADDR(ch));
+	dev_dbg(&hws->pdev->dev, "dma_doorbell ch%u: dma=0x%llx tag=%s\n", ch,
+		(u64)dma, tag ? tag : "");
+}
+
+static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
+{
+	const u32 addr_mask = PCI_E_BAR_ADD_MASK;	// 0xE0000000
+	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;	// 0x1FFFFFFF
+	struct hws_pcie_dev *hws = vid->parent;
+	unsigned int ch = vid->channel_index;
+	u32 table_off = HWS_REMAP_SLOT_OFF(ch);
+	u32 lo = lower_32_bits(dma);
+	u32 hi = upper_32_bits(dma);
+	u32 pci_addr = lo & addr_low_mask;	// low 29 bits inside 512MB window
+	u32 page_lo = lo & addr_mask;	// bits 31..29 only (page bits)
+
+	bool wrote = false;
+
+	/* Remap entry only when DMA crosses into a new 512 MB page */
+	if (!vid->window_valid || vid->last_dma_hi != hi ||
+	    vid->last_dma_page != page_lo) {
+		writel(hi, hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+		writel(page_lo,
+		       hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+		       PCIE_BARADDROFSIZE);
+		vid->last_dma_hi = hi;
+		vid->last_dma_page = page_lo;
+		wrote = true;
+	}
+
+	/* Base pointer only needs low 29 bits */
+	if (!vid->window_valid || vid->last_pci_addr != pci_addr) {
+		writel((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
+		       hws->bar0_base + HWS_BUF_BASE_OFF(ch));
+		vid->last_pci_addr = pci_addr;
+		wrote = true;
+	}
+
+	/* Half-size only changes when resolution changes */
+	if (!vid->window_valid || vid->last_half16 != vid->pix.half_size / 16) {
+		writel(vid->pix.half_size / 16,
+		       hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+		vid->last_half16 = vid->pix.half_size / 16;
+		wrote = true;
+	}
+
+	vid->window_valid = true;
+
+	if (unlikely(dma_window_verify) && wrote) {
+		u32 r_hi =
+		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off);
+		u32 r_lo =
+		    readl(hws->bar0_base + PCI_ADDR_TABLE_BASE + table_off +
+			  PCIE_BARADDROFSIZE);
+		u32 r_base = readl(hws->bar0_base + HWS_BUF_BASE_OFF(ch));
+		u32 r_half = readl(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+
+		dev_dbg(&hws->pdev->dev,
+			"ch%u remap verify: hi=0x%08x page_lo=0x%08x exp_page=0x%08x base=0x%08x exp_base=0x%08x half16B=0x%08x exp_half=0x%08x\n",
+			ch, r_hi, r_lo, page_lo, r_base,
+			(ch + 1) * PCIEBAR_AXI_BASE + pci_addr, r_half,
+			vid->pix.half_size / 16);
+	} else if (wrote) {
+		/* Flush posted writes before arming DMA */
+		readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
+	}
+}
+
+static struct hwsvideo_buffer *
+hws_take_queued_buffer_locked(struct hws_video *vid)
+{
+	struct hwsvideo_buffer *buf;
+
+	if (!vid || list_empty(&vid->capture_queue))
+		return NULL;
+
+	buf = list_first_entry(&vid->capture_queue,
+			       struct hwsvideo_buffer, list);
+	list_del_init(&buf->list);
+	if (vid->queued_count)
+		vid->queued_count--;
+	return buf;
+}
+
+void hws_prime_next_locked(struct hws_video *vid)
+{
+	struct hws_pcie_dev *hws;
+	struct hwsvideo_buffer *next;
+	dma_addr_t dma;
+
+	if (!vid)
+		return;
+
+	hws = vid->parent;
+	if (!hws || !hws->bar0_base)
+		return;
+
+	if (!READ_ONCE(vid->cap_active) || !vid->active || vid->next_prepared)
+		return;
+
+	next = hws_take_queued_buffer_locked(vid);
+	if (!next)
+		return;
+
+	vid->next_prepared = next;
+	dma = vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
+	hws_program_dma_for_addr(hws, vid->channel_index, dma);
+	iowrite32(lower_32_bits(dma),
+		  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
+	dev_dbg(&hws->pdev->dev,
+		"ch%u pre-armed next buffer %p dma=0x%llx\n",
+		vid->channel_index, next, (u64)dma);
+}
+
+static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
+{
+	struct hws_pcie_dev *hws;
+	unsigned long flags;
+	struct hwsvideo_buffer *buf = NULL, *next = NULL;
+	bool have_next = false;
+	bool doorbell = false;
+
+	if (!v)
+		return false;
+	hws = v->parent;
+	if (!hws || READ_ONCE(v->stop_requested) || !READ_ONCE(v->cap_active))
+		return false;
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
+	if (v->next_prepared) {
+		next = v->next_prepared;
+		v->next_prepared = NULL;
+		next->slot = 0;
+		v->active = next;
+		have_next = true;
+	} else if (!list_empty(&v->capture_queue)) {
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
+		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
+		vb2v->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+	}
+	if (have_next && next) {
+		dma_addr_t dma =
+		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(hws, v->channel_index, dma);
+		hws_set_dma_doorbell(hws, v->channel_index, dma,
+				     tag ? tag : "nosignal_zero");
+		doorbell = true;
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
+	struct v4l2_ctrl_handler *hdl;
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
+	spin_lock_init(&vid->irq_lock);
+	INIT_LIST_HEAD(&vid->capture_queue);
+	atomic_set(&vid->sequence_number, 0);
+	vid->active = NULL;
+
+	/* DMA watchdog removed; retain counters for diagnostics */
+	vid->timeout_count = 0;
+	vid->error_count = 0;
+
+	vid->queued_count = 0;
+	vid->window_valid = false;
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
+	vid->pix.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	vid->pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	vid->pix.interlaced = false;
+	vid->pix.half_size = vid->pix.sizeimage / 2;
+	vid->alloc_sizeimage = vid->pix.sizeimage;
+	hws_set_current_dv_timings(vid, vid->pix.width,
+				   vid->pix.height, vid->pix.interlaced);
+	vid->current_fps = 60;
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
+	/* 3) Ensure the IRQ handler finished any in-flight completions */
+	if (vid->parent && vid->parent->irq >= 0)
+		synchronize_irq(vid->parent->irq);
+
+	/* 4) Drain SW capture queue & in-flight under lock */
+	spin_lock_irqsave(&vid->irq_lock, flags);
+	hws_video_drain_queue_locked(vid);
+	spin_unlock_irqrestore(&vid->irq_lock, flags);
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
+	/* 8) Reset simple state (don't memset the whole struct here) */
+	mutex_destroy(&vid->state_lock);
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
+	WRITE_ONCE(hws->video[chan].cap_active, on);
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
+	/* If cur_max_video_ch isn't set yet, default to max_channels */
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
+			 * Prefer the current channel's computed half_size if available.
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
+	/* Route all sources to vector 0 (same value you're already using) */
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
+	hws_seed_dma_windows(hws);
+
+	/* 3) on a full reset, clear all per-channel status and indices */
+	if (!enable) {
+		for (i = 0; i < hws->max_channels; i++) {
+			/* helpers to arm/disable capture engines */
+			hws_enable_video_capture(hws, i, false);
+		}
+	}
+
+	/* 4) "Start run": set bit31, wait a bit, then program low 24 bits */
+	writel(0x80000000, hws->bar0_base + HWS_REG_DEC_MODE);
+	// udelay(500);
+	writel(0x80FFFFFF, hws->bar0_base + HWS_REG_DEC_MODE);
+	writel(0x13, hws->bar0_base + HWS_REG_DEC_MODE);
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
+	/* Common "device missing" pattern */
+	if (unlikely(status == 0xFFFFFFFF)) {
+		hws->pci_lost = true;
+		dev_err(&hws->pdev->dev, "PCIe device not responding\n");
+		return -ENODEV;
+	}
+
+	/* If RUN/READY bit (bit0) isn't set, (re)initialize the video core */
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
+			/* No active video; optionally feed neutral frames to keep streaming. */
+			if (pdx->video[i].signal_loss_cnt == 0)
+				pdx->video[i].signal_loss_cnt = 1;
+			if (READ_ONCE(pdx->video[i].cap_active))
+				hws_force_no_signal_frame(&pdx->video[i],
+							  "monitor_nosignal");
+		} else {
+			if (pdx->hw_ver > 0)
+				handle_hwv2_path(pdx, i);
+			else
+				/* Legacy path stub; see handle_legacy_path() comment. */
+				handle_legacy_path(pdx, i);
+
+			update_live_resolution(pdx, i);
+			pdx->video[i].signal_loss_cnt = 0;
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
+	/* 1) Input frame rate (read-only; log or export via debugfs if wanted) */
+	in_fps = readl(hws->bar0_base + HWS_REG_FRAME_RATE(ch));
+	if (in_fps)
+		vid->current_fps = in_fps;
+	/* dev_dbg(&hws->pdev->dev, "ch%u input fps=%u\n", ch, in_fps); */
+
+	/* 2) Output resolution programming
+	 * If your HW expects a separate "scaled" size, add fields to track it.
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
+	/* bool hdcp = !!(reg & BIT(ch)); // use if you later add a field/control */
+}
+
+static void handle_legacy_path(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	/*
+	 * Legacy (hw_ver == 0) expected behavior:
+	 * - A per-channel SW FPS accumulator incremented on each VDONE.
+	 * - A once-per-second poll mapped the count to discrete FPS:
+	 *   >55*2 => 60, >45*2 => 50, >25*2 => 30, >20*2 => 25, else 60,
+	 *   then reset the accumulator to 0.
+	 * - The *2 factor assumed VDONE fired per-field; if legacy VDONE is
+	 *   per-frame, drop the factor.
+	 *
+	 * Current code keeps this path as a no-op; vid->current_fps stays at the
+	 * default or mode-derived value. If accurate legacy FPS reporting is
+	 * needed (V4L2 g_parm/timeperframe), reintroduce the accumulator in the
+	 * IRQ path and perform the mapping/reset here.
+	 *
+	 * No-op by default. If you introduce a SW FPS accumulator, map it here.
+	 *
+	 * Example skeleton:
+	 *
+	 *   u32 sw_rate = READ_ONCE(hws->sw_fps[ch]); // incremented elsewhere
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
+	struct hwsvideo_buffer *buf = NULL;
+	struct list_head done;
+	struct hwsvideo_buffer *b, *tmp;
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
+	if (!mutex_trylock(&v->state_lock))
+		return;
+	INIT_LIST_HEAD(&done);
+
+	WRITE_ONCE(v->stop_requested, true);
+	WRITE_ONCE(v->cap_active, false);
+	/* Publish software stop first so the IRQ completion path sees the stop
+	 * before we touch MMIO or the lists. Pairs with READ_ONCE() checks in the
+	 * VDONE handler and hws_arm_next() to prevent completions while modes
+	 * change.
+	 */
+	smp_wmb();
+
+	hws_enable_video_capture(pdx, ch, false);
+	readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+
+	if (v->parent && v->parent->irq >= 0)
+		synchronize_irq(v->parent->irq);
+
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (v->active) {
+		INIT_LIST_HEAD(&v->active->list);
+		list_add_tail(&v->active->list, &done);
+		v->active = NULL;
+	}
+	while (!list_empty(&v->capture_queue)) {
+		b = list_first_entry(&v->capture_queue, struct hwsvideo_buffer,
+				     list);
+		list_move_tail(&b->list, &done);
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	/* Update software pixel state */
+	v->pix.width = w;
+	v->pix.height = h;
+	v->pix.interlaced = interlaced;
+	hws_set_current_dv_timings(v, w, h, interlaced);
+	/* Try to reflect the live frame rate if HW reports it; otherwise default
+	 * to common rates (50 Hz for 576p, else 60 Hz).
+	 */
+	{
+		u32 fps = readl(pdx->bar0_base + HWS_REG_FRAME_RATE(ch));
+
+		if (fps)
+			v->current_fps = fps;
+		else
+			v->current_fps = (h == 576) ? 50 : 60;
+	}
+
+	new_size = hws_calc_sizeimage(v, w, h, interlaced);
+	v->window_valid = false;
+
+	/* Notify listeners that the resolution changed whenever we have
+	 * an active queue, regardless of whether we can continue streaming
+	 * with the existing buffers. This ensures user space sees a source
+	 * change event instead of an empty queue (VIDIOC_DQEVENT -> -ENOENT).
+	 */
+	if (vb2_is_busy(&v->buffer_queue)) {
+		struct v4l2_event ev = {
+			.type = V4L2_EVENT_SOURCE_CHANGE,
+		};
+		ev.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION;
+		v4l2_event_queue(v->video_device, &ev);
+
+		/* If buffers are smaller than new requirement, error the queue
+		 * so users re-request buffers before we restart streaming.
+		 */
+		if (new_size > v->alloc_sizeimage) {
+			vb2_queue_error(&v->buffer_queue);
+			goto out_unlock;
+		}
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
+	atomic_set(&v->sequence_number, 0);
+
+	/* Re-prime first VB2 buffer if present */
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (!list_empty(&v->capture_queue)) {
+		buf = list_first_entry(&v->capture_queue,
+				       struct hwsvideo_buffer, list);
+		v->active = buf;
+		list_del_init(&v->active->list);
+		if (v->queued_count)
+			v->queued_count--;
+		reenable = true;
+	}
+	spin_unlock_irqrestore(&v->irq_lock, flags);
+
+	if (!reenable)
+		goto out_unlock;
+	{
+		dma_addr_t dma;
+
+		dma = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(pdx, ch, dma);
+		iowrite32(lower_32_bits(dma),
+			  pdx->bar0_base + HWS_REG_DMA_ADDR(ch));
+	}
+
+	WRITE_ONCE(v->stop_requested, false);
+	WRITE_ONCE(v->cap_active, true);
+	/* Publish stop_requested/cap_active before HW disable; pairs with
+	 * BH/ISR reads in the VDONE handler/hws_arm_next.
+	 */
+	smp_wmb();
+	wmb(); /* ensure DMA window/address writes visible before enable */
+	hws_enable_video_capture(pdx, ch, true);
+	readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+
+out_unlock:
+	mutex_unlock(&v->state_lock);
+
+	list_for_each_entry_safe(b, tmp, &done, list) {
+		list_del_init(&b->list);
+		vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
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
+	return v4l2_fh_open(file);
+}
+
+static const struct v4l2_file_operations hws_fops = {
+	.owner = THIS_MODULE,
+	.open = hws_open,
+	.release = vb2_fop_release,
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
+	.vidioc_expbuf = vb2_ioctl_expbuf,
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
+	.vidioc_log_status = v4l2_ctrl_log_status,
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
+	u32 sizeimage, half0;
+
+	/* publish into pix, since we now carry these in-state */
+	v->pix.bytesperline = bytesperline;
+	sizeimage = bytesperline * lines;
+
+	half0 = sizeimage / 2;
+
+	v->pix.sizeimage = sizeimage;
+	v->pix.half_size = half0;	/* first half; second = sizeimage - half0 */
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
+
+	(void)num_buffers;
+	(void)alloc_devs;
+
+	if (!vid->pix.sizeimage) {
+		vid->pix.bytesperline = ALIGN(vid->pix.width * 2, 64);
+		vid->pix.sizeimage = vid->pix.bytesperline * vid->pix.height;
+	}
+	if (*nplanes) {
+		if (sizes[0] < vid->pix.sizeimage)
+			return -EINVAL;
+	} else {
+		*nplanes = 1;
+		sizes[0] = PAGE_ALIGN(vid->pix.sizeimage);
+	}
+
+	vid->alloc_sizeimage = PAGE_ALIGN(vid->pix.sizeimage);
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
+	struct hws_pcie_dev *hws = vid->parent;
+	unsigned long flags;
+
+	dev_dbg(&hws->pdev->dev,
+		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
+		vid->channel_index, vb, vid->pix.sizeimage,
+		READ_ONCE(vid->cap_active));
+
+	/* Initialize buffer slot */
+	buf->slot = 0;
+
+	spin_lock_irqsave(&vid->irq_lock, flags);
+	list_add_tail(&buf->list, &vid->capture_queue);
+	vid->queued_count++;
+
+	/* If streaming and no in-flight buffer, prime HW immediately */
+	if (READ_ONCE(vid->cap_active) && !vid->active) {
+		dma_addr_t dma_addr;
+
+		dev_dbg(&hws->pdev->dev,
+			"buffer_queue(ch=%u): priming first vb=%p\n",
+			vid->channel_index, &buf->vb.vb2_buf);
+		list_del_init(&buf->list);
+		vid->queued_count--;
+		vid->active = buf;
+
+		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+		hws_program_dma_for_addr(vid->parent, vid->channel_index,
+					 dma_addr);
+		iowrite32(lower_32_bits(dma_addr),
+			  hws->bar0_base + HWS_REG_DMA_ADDR(vid->channel_index));
+
+		wmb(); /* ensure descriptors visible before enabling capture */
+		hws_enable_video_capture(hws, vid->channel_index, true);
+		hws_prime_next_locked(vid);
+	} else if (READ_ONCE(vid->cap_active) && vid->active) {
+		hws_prime_next_locked(vid);
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
+
+	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
+		v->channel_index, count);
+
+	ret = hws_check_card_status(hws);
+	if (ret) {
+		struct hwsvideo_buffer *b, *tmp;
+		unsigned long f;
+		LIST_HEAD(queued);
+
+		spin_lock_irqsave(&v->irq_lock, f);
+		if (v->active) {
+			list_add_tail(&v->active->list, &queued);
+			v->active = NULL;
+		}
+		if (v->next_prepared) {
+			list_add_tail(&v->next_prepared->list, &queued);
+			v->next_prepared = NULL;
+		}
+		while (!list_empty(&v->capture_queue)) {
+			b = list_first_entry(&v->capture_queue,
+					     struct hwsvideo_buffer, list);
+			list_move_tail(&b->list, &queued);
+		}
+		spin_unlock_irqrestore(&v->irq_lock, f);
+
+		list_for_each_entry_safe(b, tmp, &queued, list) {
+			list_del_init(&b->list);
+			vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+		}
+		return ret;
+	}
+	(void)hws_update_active_interlace(hws, v->channel_index);
+
+	lockdep_assert_held(&v->state_lock);
+	/* init per-stream state */
+	WRITE_ONCE(v->stop_requested, false);
+	WRITE_ONCE(v->cap_active, true);
+	WRITE_ONCE(v->half_seen, false);
+	WRITE_ONCE(v->last_buf_half_toggle, 0);
+
+	/* Try to prime a buffer, but it's OK if none are queued yet */
+	spin_lock_irqsave(&v->irq_lock, flags);
+	if (!v->active && !list_empty(&v->capture_queue)) {
+		to_program = list_first_entry(&v->capture_queue,
+					      struct hwsvideo_buffer, list);
+		list_del_init(&to_program->list);
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
+		{
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
+		wmb(); /* ensure descriptors visible before enabling capture */
+		hws_enable_video_capture(hws, v->channel_index, true);
+		{
+			unsigned long pf;
+
+			spin_lock_irqsave(&v->irq_lock, pf);
+			hws_prime_next_locked(v);
+			spin_unlock_irqrestore(&v->irq_lock, pf);
+		}
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
+	lockdep_assert_held(&v->state_lock);
+	WRITE_ONCE(v->cap_active, false);
+	WRITE_ONCE(v->stop_requested, true);
+
+	hws_enable_video_capture(v->parent, v->channel_index, false);
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
+	if (v->next_prepared) {
+		list_add_tail(&v->next_prepared->list, &done);
+		v->next_prepared = NULL;
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
+	// .buf_finish = hws_buffer_finish,
+	.buf_queue = hws_buffer_queue,
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
+		 * Don't reinitialize any of those here.
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
+		vdev->release = video_device_release;
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
+		q->lock = &ch->state_lock;
+		q->min_queued_buffers = 1;
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
+
+		ret = hws_resolution_create(vdev);
+		if (ret) {
+			dev_err(&dev->pdev->dev,
+				"device_create_file(resolution) ch%u failed: %d\n",
+				i, ret);
+			video_unregister_device(vdev);
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
+			hws_resolution_remove(ch->video_device);
+		if (video_is_registered(ch->video_device))
+			vb2_video_unregister_device(ch->video_device);
+		v4l2_ctrl_handler_free(&ch->control_handler);
+		if (ch->video_device) {
+			/* If not registered, we must free the alloc'd vdev ourselves */
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
+
+		if (ch->video_device)
+			hws_resolution_remove(ch->video_device);
+		if (ch->video_device) {
+			vb2_video_unregister_device(ch->video_device);
+			ch->video_device = NULL;
+		}
+		v4l2_ctrl_handler_free(&ch->control_handler);
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
+	/* Nothing mandatory to do here for vb2 -- userspace will STREAMON again.
+	 * If you track per-channel 'auto-restart' policy, re-arm it here.
+	 */
+}
diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
new file mode 100644
index 000000000000..5c6be38c2fd7
--- /dev/null
+++ b/drivers/media/pci/hws/hws_video.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HWS_VIDEO_H
+#define HWS_VIDEO_H
+
+struct hws_video;
+
+int hws_video_register(struct hws_pcie_dev *dev);
+void hws_video_unregister(struct hws_pcie_dev *dev);
+void hws_enable_video_capture(struct hws_pcie_dev *hws,
+			      unsigned int chan,
+			      bool on);
+void hws_prime_next_locked(struct hws_video *vid);
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
+void hws_set_dma_doorbell(struct hws_pcie_dev *hws, unsigned int ch,
+			  dma_addr_t dma, const char *tag);
+
+int hws_video_pm_suspend(struct hws_pcie_dev *hws);
+void hws_video_pm_resume(struct hws_pcie_dev *hws);
+
+#endif // HWS_VIDEO_H
-- 
2.51.0


