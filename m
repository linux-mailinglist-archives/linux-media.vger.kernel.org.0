Return-Path: <linux-media+bounces-57404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE3YJ91Hx2lAVAUAu9opvQ
	(envelope-from <linux-media+bounces-57404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 04:15:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46934D233
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 04:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A109303C432
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 03:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F33349AE1;
	Sat, 28 Mar 2026 03:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2AWAo+K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A97C34B426
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774667715; cv=none; b=t/Q0GJfDG8Zryk8vf9+shO+T4gpA8MrR5gxub77aqEC7tPjqCnNz2mXXhJjBMN0Q/ENLmpQ1M2YBB0kJ8tz09ZbPHyb6GPwPyyVfDMWX269cm89VSKx7+aH20vqyTmUvlHWuKSYf+eKfkiXxNwwG5PGSRlJW7GanJjnXd/B7RBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774667715; c=relaxed/simple;
	bh=/LFXMK0n/bqBjrwX5x4/VKz00/qbZaOE1rEhO8kOp04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK8hEX3t0IcQRwEQtBGGp9e6bTXBlwoM4amU5saIY/LAbA042XvzKAn3gGsuQqV605JnwgXOLkQARrCQAVAOV3XWPLebQA8s+KtKq3g7V0zxgNwfjMmHUibTs48Ss7siMVKNds+ty6sOsWqz7kFpp+dJj81XPtwkueWR3TNrEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2AWAo+K; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-66ee7b9af94so1134599eaf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774667709; x=1775272509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2rOZhfdE38JHPwKo9/bc2t+JJCFVgZzJT8oWO5wHLI=;
        b=K2AWAo+KjSMoPYmp+cRzWrHiIDaSKUp5jRIwa6Z3m6M6Kwcg0+yYg4vmmWlyzy7DW6
         QuL8xNWubEjUa2NGZ/BNl/5Hv7754eMeXwYaD/2TdjtZKDDpR18d/jBFMHBH3xfNgvd+
         Etqf3qMMgZb/mLKhnfB7qo03Q1vB7xh6s0dRvQrdFh1JesdcDWyhlhzB109QdBa6E9aG
         HZjkO8Dx/BeLvpLQAHLngQKsL/rkTiGEq/woI+XtJqOkUPjHksyn6KyuQ71FWz7ZAMwi
         cnjI2qQqqseVxs2q5sM8wdk/qViWGjxsECjF4S4d+5X/CIe4enEnzmeiCfV9Ho+Y9Hsv
         5FyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774667709; x=1775272509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o2rOZhfdE38JHPwKo9/bc2t+JJCFVgZzJT8oWO5wHLI=;
        b=e5sID/Osjvh0c8jOoSMtaZAhVJ/3wnmuhn2n7A2jzS5PAly1CCzt8ch6NI0uWs7ElR
         6FM070GR88/yg2Qpa69KhPcCeihGutcbv1dsfUoJtPNv+XZ+/oHVa2jVQ+2y5GHrREyp
         SAWSC8dZ0UpDAWl/I8FbUcXGErUXxTPZ7C7hAAwWgaOUjCkBDKzgUUwid58yDbLXrY1X
         eE5pHzaVygKBzfrPuKtTAZB1V7vbJcO5IoUXRTxfpRO1MBAT6+zBMZ7aE5rSknjoogkr
         SMyiX8yuHrEwduzWZCoDz/y0gVFJVXJGZd06ENugDMLb4kb3FBdCaxT3A+5W//kWa2oD
         X5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgk6szQzQvuI3knAEYb/LnRFvhQFTa+Uf012xxiDiSCgE1SmVIoxWY9Uu9KZ0fBScgYHBqWEdJgisexQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9Y45QCWrgM3m/HnaGzjK0LknY2YkCnCznet/6ove6AlXpZtO
	KVkxRknb8+J7/aTqp7FKIpszBQnSozIWJLDz9lkryAI10ef2Aws1XtA=
X-Gm-Gg: ATEYQzyY0kog3fB3sH43fQPWr0d8aDbs/Eb5g6oZtxUclPicL+dq2IFkaRJqdWsPFlr
	Y4/yCDho7C5DH8BDDzxgRN+9zEXIQMQrtVKCmKFAx1j1a0gdQTUXhR9ZFPGt9Fl8noxKqC990MD
	dcvPiRe1bWxeghtVjoapx2YN1s8gDPtzdysbavo6oJJ/t/VDAhi8DQfCmHusIycUKDQqX3qv49+
	c9nljGN+XU/8G/rLu5QjBWj4QuRRSQo0+GMbu5LGJCp+sQ3GrOC/Ebln/ejbITjAyAt2Hparu5L
	fZgYvZ6ygRyfjdPhThjqCsetV/qACWKZRS0kzdEKUTA95ual1ja8lrJuKfVK+QKvadG49UOnPjW
	/pe/RuGfln+Hpt7P5YvXoFSKL6hiarfyEozBTSZXzIZlsjCNhRJe867E2o2daZQBWGViGMcp0ES
	VGLpjnWFTRzF3RakE8g8TJXS8eeQlNBvlh6mXMqFrYMp1cqFCQOEE=
X-Received: by 2002:a05:6820:f09:b0:67e:cf9:ea2a with SMTP id 006d021491bc7-67e18629f9emr2628076eaf.17.1774667708239;
        Fri, 27 Mar 2026 20:15:08 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e231ad680sm726309eaf.10.2026.03.27.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 20:15:07 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v2 1/1] staging: media: add driver for StarTech USB3HDCAP
Date: Fri, 27 Mar 2026 22:14:18 -0500
Message-ID: <20260328031418.10459-2-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328031418.10459-1-matthew.laux@gmail.com>
References: <20260328031418.10459-1-matthew.laux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57404-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthewlaux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,infradead.org:email]
X-Rspamd-Queue-Id: 6F46934D233
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a V4L2 driver for the StarTech USB3HDCAP video capture device. This is
a popular capture card based on the MST3367 HDMI receiver and TW9900
composite video decoder. Support is included for the composite, S-Video,
component, and HDMI inputs, and these inputs have been tested at various
resolutions. Audio support is provided by an ALSA device.

Also includes preliminary support for the Micomsoft XCAPTURE-1 hardware
variant. I've provided a TODO containing the remaining items necessary to
get this out of staging.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
v2: remove unused CSC matrix control, remove version.h include,
    fix all remaining `check`-level checkpatch issues, update TODO


 MAINTAINERS                                   |    8 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/usb3hdcap/Kconfig       |   13 +
 drivers/staging/media/usb3hdcap/Makefile      |    4 +
 drivers/staging/media/usb3hdcap/TODO          |   15 +
 .../staging/media/usb3hdcap/usb3hdcap-audio.c |  301 +++++
 .../media/usb3hdcap/usb3hdcap-composite.c     |  182 +++
 .../staging/media/usb3hdcap/usb3hdcap-core.c  | 1002 +++++++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-hdmi.c  |  802 +++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-video.c |  505 +++++++++
 drivers/staging/media/usb3hdcap/usb3hdcap.h   |  234 ++++
 12 files changed, 3069 insertions(+)
 create mode 100644 drivers/staging/media/usb3hdcap/Kconfig
 create mode 100644 drivers/staging/media/usb3hdcap/Makefile
 create mode 100644 drivers/staging/media/usb3hdcap/TODO
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 750ac8c4a7b0..bab204eeab56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25303,6 +25303,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jh8100-intc.c
 
+STARTECH USB3HDCAP MEDIA DRIVER
+M:	Matthew Laux <matthew.laux@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+W:	https://linuxtv.org
+Q:	http://patchwork.linuxtv.org/project/linux-media/list/
+F:	drivers/staging/media/usb3hdcap/
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 1aa31bddf970..3f4cbc190a7a 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -38,6 +38,8 @@ source "drivers/staging/media/sunxi/Kconfig"
 
 source "drivers/staging/media/tegra-video/Kconfig"
 
+source "drivers/staging/media/usb3hdcap/Kconfig"
+
 menuconfig STAGING_MEDIA_DEPRECATED
 	bool "Media staging drivers (DEPRECATED)"
 	default n
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 6f78b0edde1e..e8c5fd2725f1 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-$(CONFIG_VIDEO_USB3HDCAP) += usb3hdcap/
diff --git a/drivers/staging/media/usb3hdcap/Kconfig b/drivers/staging/media/usb3hdcap/Kconfig
new file mode 100644
index 000000000000..edca098bd334
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_USB3HDCAP
+	tristate "USB3HDCAP video capture support"
+	depends on VIDEO_DEV && SND
+	select SND_PCM
+	select VIDEOBUF2_VMALLOC
+
+	help
+	  This is a video4linux2 driver for the StarTech USB3HDCAP video/audio
+	  capture device.
+
+	  To compile this driver as a module, choose M here; the
+	  module will be called usb3hdcap.
diff --git a/drivers/staging/media/usb3hdcap/Makefile b/drivers/staging/media/usb3hdcap/Makefile
new file mode 100644
index 000000000000..b72e2464ab1d
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+usb3hdcap-y := usb3hdcap-core.o usb3hdcap-video.o usb3hdcap-composite.o \
+               usb3hdcap-hdmi.o usb3hdcap-audio.o
+obj-$(CONFIG_VIDEO_USB3HDCAP) += usb3hdcap.o
diff --git a/drivers/staging/media/usb3hdcap/TODO b/drivers/staging/media/usb3hdcap/TODO
new file mode 100644
index 000000000000..92a35a3a0388
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/TODO
@@ -0,0 +1,15 @@
+* Prerequisite for using subdevices: i2c_algorithm/i2c_adapter that converts
+  to the correct USB vendor requests depending on whether the hardware has the
+  NUC100 or not
+* Use existing tw9900 subdevice
+    * Need to make the regulator optional
+    * Need to only call `v4l2_async_register_subdev` when registering from
+      device tree so this driver can call `v4l2_device_register_subdev`
+      directly
+    * Need to port over my additional functionality to tw9900.c
+* Write new subdevice for MST3367
+    * Won't be much use to any other driver initially
+* Generify CS53L21 support (can probably base it on sound/soc/codecs/cs53l30.c)
+* Use v4l2_fh
+* Investigate MST3367 situation with XCAPTURE-1 - hdmi signal disappears after
+  a frame or two - HDCP related?
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap-audio.c b/drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
new file mode 100644
index 000000000000..42bd1dcd70d8
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP audio support - CS53L21 init + ALSA capture device
+ *
+ * Audio is embedded in the isochronous video stream as 48kHz stereo
+ * 16-bit LE PCM. Each video line carries 8, 12, or 16 bytes of audio data.
+ */
+
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#include "usb3hdcap.h"
+
+/* ALSA buffer sizing */
+#define HDCAP_AUDIO_BUFSZ	(64 * 1024)
+
+static const struct snd_pcm_hardware snd_hdcap_hw = {
+	.info = SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP_VALID,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.period_bytes_min = 1024,
+	.period_bytes_max = 65536,
+	.periods_min = 2,
+	.periods_max = 128,
+	.buffer_bytes_max = HDCAP_AUDIO_BUFSZ,
+};
+
+/* ------------------------------------------------------------------ */
+/* PCM ops                                                            */
+/* ------------------------------------------------------------------ */
+
+static int snd_hdcap_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	hdcap->snd_substream = substream;
+	substream->runtime->hw = snd_hdcap_hw;
+
+	return 0;
+}
+
+static int snd_hdcap_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	atomic_set(&hdcap->snd_stream, 0);
+	hdcap->snd_substream = NULL;
+
+	return 0;
+}
+
+static int snd_hdcap_prepare(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	hdcap->snd_buffer_pos = 0;
+	hdcap->snd_period_pos = 0;
+
+	return 0;
+}
+
+static int snd_hdcap_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		atomic_set(&hdcap->snd_stream, 1);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		atomic_set(&hdcap->snd_stream, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static snd_pcm_uframes_t snd_hdcap_pointer(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	return hdcap->snd_buffer_pos;
+}
+
+static const struct snd_pcm_ops snd_hdcap_pcm_ops = {
+	.open = snd_hdcap_pcm_open,
+	.close = snd_hdcap_pcm_close,
+	.prepare = snd_hdcap_prepare,
+	.trigger = snd_hdcap_trigger,
+	.pointer = snd_hdcap_pointer,
+};
+
+/* ------------------------------------------------------------------ */
+/* Audio data feed (called from ISO URB handler in usb3hdcap-core.c)  */
+/* ------------------------------------------------------------------ */
+
+void usb3hdcap_audio_data(struct usb3hdcap *hdcap, const u8 *data, int len)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	size_t frame_bytes, nframes;
+	size_t buffer_pos, period_pos;
+	int period_elapsed = 0;
+	unsigned long flags;
+
+	if (!atomic_read(&hdcap->snd_stream))
+		return;
+
+	substream = hdcap->snd_substream;
+	if (!substream)
+		return;
+
+	runtime = substream->runtime;
+	if (!runtime || !runtime->dma_area)
+		return;
+
+	frame_bytes = runtime->frame_bits >> 3;
+	nframes = len / frame_bytes;
+	if (!nframes)
+		return;
+
+	snd_pcm_stream_lock_irqsave(substream, flags);
+
+	buffer_pos = hdcap->snd_buffer_pos;
+	period_pos = hdcap->snd_period_pos;
+
+	/* Copy into ALSA ring buffer, handling wrap */
+	if (buffer_pos + nframes >= runtime->buffer_size) {
+		size_t cnt = (runtime->buffer_size - buffer_pos) * frame_bytes;
+
+		memcpy(runtime->dma_area + buffer_pos * frame_bytes, data, cnt);
+		memcpy(runtime->dma_area, data + cnt, nframes * frame_bytes - cnt);
+	} else {
+		memcpy(runtime->dma_area + buffer_pos * frame_bytes, data,
+		       nframes * frame_bytes);
+	}
+
+	buffer_pos += nframes;
+	period_pos += nframes;
+
+	if (buffer_pos >= runtime->buffer_size)
+		buffer_pos -= runtime->buffer_size;
+
+	if (period_pos >= runtime->period_size) {
+		period_pos -= runtime->period_size;
+		period_elapsed = 1;
+	}
+
+	hdcap->snd_buffer_pos = buffer_pos;
+	hdcap->snd_period_pos = period_pos;
+
+	snd_pcm_stream_unlock_irqrestore(substream, flags);
+
+	if (period_elapsed)
+		snd_pcm_period_elapsed(substream);
+}
+
+/* ------------------------------------------------------------------ */
+/* CS53L21 codec init                                                 */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_cs53l21_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+
+	/* MIC power control: power down mic B, mic A, and bias */
+	/* SPEED = "10 - Half-Speed Mode (HSM) - 12.5 to 25 kHz sample rates" */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_MIC_PWR_CTL, 0x4e);
+	if (ret)
+		return ret;
+
+	/* interface: I2S, master */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_IFACE_CTL, 0x44);
+	if (ret)
+		return ret;
+
+	/* ADC input select: default */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADC_IN_SEL, 0x00);
+	if (ret)
+		return ret;
+
+	/* ALC/PGA: 0 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_PGAA, 0x00);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_PGAB, 0x00);
+	if (ret)
+		return ret;
+
+	/* ADC attenuators: 0 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCA_ATT, 0x00);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCB_ATT, 0x00);
+	if (ret)
+		return ret;
+
+	/* ALC enable and attack rate = fastest attack */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_EN_ATK, 0xc0);
+	if (ret)
+		return ret;
+
+	/* interface: "SPE Processed ADC data to ADC serial port, SDOUT data." */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_IFACE_CTL, 0x46);
+	if (ret)
+		return ret;
+
+	/* SPE control: SPE enable, "Soft Ramp" turned on */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_SPE_CTL, 0x42);
+	if (ret)
+		return ret;
+
+	/* ADC mixer volume: +2.5 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCA_MIX_VOL, 0x05);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCB_MIX_VOL, 0x05);
+	if (ret)
+		return ret;
+
+	/* channel mixer: off */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_CH_MIXER, 0x00);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* ALSA card init / teardown                                          */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_audio_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+	struct snd_card *card;
+	struct snd_pcm *pcm;
+
+	atomic_set(&hdcap->snd_stream, 0);
+
+	ret = snd_card_new(hdcap->dev, SNDRV_DEFAULT_IDX1, "usb3hdcap",
+			   THIS_MODULE, 0, &card);
+	if (ret < 0)
+		return ret;
+
+	strscpy(card->driver, "usb3hdcap", sizeof(card->driver));
+	strscpy(card->shortname, "USB3HDCAP Audio", sizeof(card->shortname));
+	snprintf(card->longname, sizeof(card->longname),
+		 "USB3HDCAP Audio at bus %d device %d",
+		 hdcap->usb_dev->bus->busnum, hdcap->usb_dev->devnum);
+
+	hdcap->snd = card;
+
+	ret = snd_pcm_new(card, "USB3HDCAP Audio", 0, 0, 1, &pcm);
+	if (ret < 0)
+		goto err;
+
+	strscpy(pcm->name, "USB3HDCAP Audio Input", sizeof(pcm->name));
+	pcm->info_flags = 0;
+	pcm->private_data = hdcap;
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_hdcap_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS, NULL,
+				       HDCAP_AUDIO_BUFSZ, HDCAP_AUDIO_BUFSZ);
+
+	ret = snd_card_register(card);
+	if (ret)
+		goto err;
+
+	dev_info(hdcap->dev, "ALSA audio device registered\n");
+	return 0;
+
+err:
+	hdcap->snd = NULL;
+	snd_card_free(card);
+	return ret;
+}
+
+void usb3hdcap_audio_free(struct usb3hdcap *hdcap)
+{
+	if (hdcap->snd && hdcap->usb_dev) {
+		snd_card_free_when_closed(hdcap->snd);
+		hdcap->snd = NULL;
+	}
+}
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap-composite.c b/drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
new file mode 100644
index 000000000000..0e7bc4c430b7
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP composite video init - CPLD + TW9900 setup, signal lock
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/usb.h>
+#include <media/v4l2-ctrls.h>
+
+#include "usb3hdcap.h"
+
+/* Detect PAL vs NTSC from TW9900 auto-detection result */
+static void usb3hdcap_detect_std(struct usb3hdcap *hdcap)
+{
+	int k, sdt, detected;
+
+	/* 0x80 = start detection */
+	/* 0x03 = enable recognition of PAL and NTSC only */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SDTR, 0x83);
+
+	for (k = 0; k < 10; k++) {
+		sdt = u3hc_i2c_read(hdcap, ADDR_TW9900, TW9900_SDT);
+		if (!(sdt & 0x80))
+			break;
+		msleep(100);
+	}
+
+	if (sdt & 0x80) {
+		dev_warn(hdcap->dev, "Detection not done after 1s, using NTSC\n");
+		hdcap->std = V4L2_STD_NTSC;
+		return;
+	}
+
+	detected = (sdt & TW9900_STDNOW_MASK) >> TW9900_STDNOW_SHIFT;
+	switch (detected) {
+	case TW9900_STD_NTSC_M:
+		hdcap->std = V4L2_STD_NTSC;
+		dev_info(hdcap->dev, "NTSC detected (SDT=0x%02x)\n", sdt);
+		break;
+	case TW9900_STD_PAL_BDGHI:
+		hdcap->std = V4L2_STD_PAL;
+		dev_info(hdcap->dev, "PAL detected (SDT=0x%02x)\n", sdt);
+		break;
+	default: /* not sure if this will be hit, because others are disabled */
+		hdcap->std = V4L2_STD_NTSC;
+		dev_info(hdcap->dev, "Non-PAL/NTSC detected (SDT=0x%02x)\n", sdt);
+		break;
+	}
+
+	hdcap->detected_timings_present = 0;
+}
+
+/* Detect 240p/288p (non-interlaced) vs 480i/576i */
+static void usb3hdcap_detect_size(struct usb3hdcap *hdcap)
+{
+	int status;
+	int full_h = (hdcap->std & V4L2_STD_PAL) ? PAL_HEIGHT : NTSC_HEIGHT;
+	int half_h = full_h / 2;
+
+	hdcap->width = SD_WIDTH;
+	hdcap->height = half_h;
+
+	status = u3hc_i2c_read(hdcap, ADDR_TW9900, TW9900_CSTATUS_II);
+	if (status >= 0 && (status & TW9900_NINTL)) {
+		hdcap->interlaced = 0;
+		dev_info(hdcap->dev, "NINTL=1: %dp detected (SDTR=0x%02x)\n",
+			 half_h, status);
+	} else {
+		hdcap->interlaced = 1;
+		dev_info(hdcap->dev, "NINTL=0: %di detected (SDTR=0x%02x)\n",
+			 full_h, status);
+	}
+}
+
+int usb3hdcap_composite_init(struct usb3hdcap *hdcap)
+{
+	int k, status;
+
+	/* disable MST3367 */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x00, 0x00); /* bank 0 */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x51, 0x80);
+
+	/* disable TW9900 */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_I, 0x0e);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_II, 0x40);
+
+	/* select TW9900 input of cpld? */
+	/* from windows driver */
+	status = u3hc_i2c_read(hdcap, ADDR_CPLD, 0x3b);
+	if (status != 0)
+		u3hc_i2c_write(hdcap, ADDR_CPLD, 0x3b, 0x80);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x00, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x10, 0xfe);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x75);
+
+	/* Main TW9900 configuration */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_I, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_OPFORM, 0xa2);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_OPCNTL_I, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VDELAY_LO, 0x14);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VACTIVE_LO, 0xf2);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HDELAY_LO, 0x0b);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HACTIVE_LO, 0xd2);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VBICNTL, 0x57);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_II, 0x0f);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_OPCNTL_II, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SDT, 0x07); /* auto-detect */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VCNTL1, 0x0c);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VCNTL2, 0x03);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_MISC1, 0x07);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_MISC2, 0x06);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ANAPLLCTL, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VVBI, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HSBEGIN, 0x26);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HSEND, 0x36);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_OVSDLY, 0xf0);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_OVSEND, 0x28);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_I, 0x80);
+	if (hdcap->input == INPUT_SVIDEO) {
+		/* "Input crystal clock frequency is 27MHz" */
+		/* IFSEL 01 for S-Video, YSEL 01 for Y on Mux1 */
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_INFORM, 0x54);
+		/* "internal current reference 2" + both luma and chroma ADCs on */
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_I, 0x40);
+
+	} else {
+		/* IFSEL 00 for composite, YSEL 00 for Y on Mux0 */
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_INFORM, 0x40);
+		/* "internal current reference 2" + chroma ADC off */
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_ACNTL_I, 0x42);
+	}
+	v4l2_ctrl_handler_setup(&hdcap->ctrl);
+
+	vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+
+	for (k = 0; k < 10; k++) {
+		status = u3hc_i2c_read(hdcap, ADDR_TW9900, TW9900_CSTATUS);
+
+		/*
+		 * 0x40 = "Horizontal sync PLL is locked to the incoming video source"
+		 * 0x08 = "Vertical logic is locked to the incoming video source"
+		 */
+		if (status >= 0 && (status & 0x48) == 0x48) {
+			dev_info(hdcap->dev, "Signal locked (%d ms)\n", k * 100);
+			break;
+		}
+		msleep(100);
+	}
+
+	if (k == 10) {
+		dev_err(hdcap->dev, "No signal lock after 1s (last status=0x%02x)\n",
+			status);
+		return -ETIMEDOUT;
+	}
+
+	usb3hdcap_detect_std(hdcap);
+	usb3hdcap_detect_size(hdcap);
+
+	/* Adjust for PAL vs NTSC */
+	if (hdcap->std & V4L2_STD_PAL) {
+		u3hc_i2c_rmw(hdcap, ADDR_TW9900, TW9900_CROP_HI, 0x0f, 0x10);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VDELAY_LO, 0x19);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VACTIVE_LO, 0x20);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HDELAY_LO, 0x0a);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HACTIVE_LO, 0xd0);
+		u3hc_i2c_rmw(hdcap, ADDR_TW9900, TW9900_VVBI, 0xef, 0x00);
+	} else {
+		u3hc_i2c_rmw(hdcap, ADDR_TW9900, TW9900_CROP_HI, 0x0f, 0x00);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VDELAY_LO, 0x14);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_VACTIVE_LO, 0xf2);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HDELAY_LO, 0x10);
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HACTIVE_LO, 0xd0);
+		u3hc_i2c_rmw(hdcap, ADDR_TW9900, TW9900_VVBI, 0xef, 0x10);
+	}
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_CNTRL2, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SDT_NOISE, 0x11);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_LUMA_CTL, 0x00);
+
+	return 0;
+}
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap-core.c b/drivers/staging/media/usb3hdcap/usb3hdcap-core.c
new file mode 100644
index 000000000000..134a4cc7f574
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap-core.c
@@ -0,0 +1,1002 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarTech USB3HDCAP USB 3.0 HD Video Capture Driver
+ * a.k.a. YUAN High-Tech Development Co., Ltd UB530
+ *
+ * Supported inputs are composite, S-Video, component, and HDMI. I haven't
+ * attempted to support DVI or VGA.
+ *
+ * Tested video modes (all at 60fps):
+ *     composite 240p and 480i
+ *     S-Video 240p and 480i
+ *     component 240p, 480i, 480p, 720p, 1080i
+ *     HDMI 1080p
+ *
+ * Other video modes will probably "just work" if the appropriate entries
+ * are added in the mode tables and code is added to disambiguate using
+ * htotal if necessary.
+ *
+ * Audio is supported and should work with all inputs.
+ *
+ * Also partially supports the Micomsoft XCAPTURE-1 for composite and
+ * S-Video only... HDMI is unusable, component is untested.
+ *
+ * Based on USBPcap analysis and reverse engineering of CY3014.X64.SYS
+ *   (version 1.1.0.193 of Fri, 04 Jun 2021 09:37:45 UTC)
+ * MST3367 HDMI path based on hdcapm
+ * Driver structure based heavily on usbtv
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/kref.h>
+#include <linux/uaccess.h>
+#include <linux/usb.h>
+#include <linux/mutex.h>
+#include <media/v4l2-common.h>
+#include <linux/v4l2-dv-timings.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "usb3hdcap.h"
+
+#define USB3HDCAP_VID 0x1164
+#define USB3HDCAP_PID 0xf533
+#define XCAPTURE1_PID 0xf531
+
+/* ------------------------------------------------------------------ */
+/* USB control transfer helpers                                       */
+/* ------------------------------------------------------------------ */
+
+int vendor_out(struct usb3hdcap *hdcap, u8 request, u16 value, u16 index,
+	       u8 *data, u16 len)
+{
+	int ret;
+	u8 *buf = NULL;
+
+	if (len > 0) {
+		buf = kmemdup(data, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	ret = usb_control_msg(hdcap->usb_dev,
+			      usb_sndctrlpipe(hdcap->usb_dev, 0),
+			      request,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      value, index, buf, len, 1000);
+
+	kfree(buf);
+
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x val=0x%04x idx=0x%04x: %d\n",
+			__func__, request, value, index, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vendor_in(struct usb3hdcap *hdcap, u8 request, u16 value, u16 index,
+		     u8 *data, u16 len)
+{
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = usb_control_msg(hdcap->usb_dev,
+			      usb_rcvctrlpipe(hdcap->usb_dev, 0),
+			      request,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      value, index, buf, len, 1000);
+
+	if (ret >= 0)
+		memcpy(data, buf, min_t(int, ret, len));
+
+	kfree(buf);
+	return ret;
+}
+
+/* ------------------------------------------------------------------ */
+/* MCU I2C tunnel (XCAPTURE-1)                                        */
+/*                                                                    */
+/* The Nuvoton NUC100 MCU intercepts I2C traffic. Transactions are    */
+/* tunneled through a different USB vendor protocol:                  */
+/*   Write: bRequest=0xC0, wValue=0x5066 or addr|0x5000               */
+/*   Read:  two-phase write+read, always through wValue=0x5066        */
+/*                                                                    */
+/* Some addresses need the 0x66 "gateway" (target addr in payload),   */
+/* others use the I2C addr directly in wValue with 0x5000 flag.       */
+/* ------------------------------------------------------------------ */
+
+static bool mcu_use_gateway(u8 addr)
+{
+	/* Matches Windows driver address routing logic */
+	return ((u8)(addr + 0x78) & 0xeb) || addr == 0x8c;
+}
+
+static int mcu_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val)
+{
+	u8 buf[3];
+
+	if (mcu_use_gateway(addr)) {
+		buf[0] = addr;
+		buf[1] = reg;
+		buf[2] = val;
+		return vendor_out(hdcap, REQ_I2C, 0x5066, 0, buf, 3);
+	}
+
+	buf[0] = reg;
+	buf[1] = val;
+	return vendor_out(hdcap, REQ_I2C, addr | 0x5000, 0, buf, 2);
+}
+
+static int mcu_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg)
+{
+	u8 tx[3] = { addr | 1, 1, reg };
+	u8 val;
+	int ret;
+
+	/* send target addr, rx length, and register */
+	ret = vendor_out(hdcap, REQ_I2C, 0x5066, 0, tx, 3);
+	if (ret < 0)
+		return ret;
+
+	/* Retrieve the result */
+	ret = vendor_in(hdcap, REQ_I2C, 0x5066, 0, &val, 1);
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x reg 0x%02x: %d\n",
+			__func__, addr, reg, ret);
+		return ret;
+	}
+
+	return val;
+}
+
+int u3hc_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val)
+{
+	if (hdcap->has_mcu)
+		return mcu_i2c_write(hdcap, addr, reg, val);
+	return vendor_out(hdcap, REQ_I2C, addr, reg, &val, 1);
+}
+
+int u3hc_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg)
+{
+	u8 val;
+	int ret;
+
+	if (hdcap->has_mcu)
+		return mcu_i2c_read(hdcap, addr, reg);
+
+	ret = vendor_in(hdcap, REQ_I2C, addr, reg, &val, 1);
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x reg 0x%02x: %d\n",
+			__func__, addr, reg, ret);
+		return ret;
+	}
+
+	return val;
+}
+
+int u3hc_i2c_rmw(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits)
+{
+	int val = u3hc_i2c_read(hdcap, addr, reg);
+
+	if (val < 0)
+		return val;
+	return u3hc_i2c_write(hdcap, addr, reg, (val & mask) | bits);
+}
+
+int u3hc_i2c_rmw_get_old(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits, u8 *old)
+{
+	int val = u3hc_i2c_read(hdcap, addr, reg);
+
+	if (val < 0)
+		return val;
+	*old = val;
+	return u3hc_i2c_write(hdcap, addr, reg, (val & mask) | bits);
+}
+
+/* CheckIsMCUExist() */
+static void usb3hdcap_probe_mcu(struct usb3hdcap *hdcap)
+{
+	u8 tx[5] = { 0xab, 0x03, 0x12, 0x34, 0x57 };
+	u8 rx[3] = {};
+	int k, ret;
+
+	hdcap->has_mcu = 0;
+
+	/* Assert CPLD GPIO 0x39 to wake MCU? */
+	vendor_out(hdcap, REQ_GPIO, 0xc039, 0, NULL, 0);
+	vendor_out(hdcap, REQ_GPIO, 0x4134, 0, NULL, 0);
+
+	/* Poll GPIO 0x39 until MCU signals ready */
+	for (k = 0; k < 50; k++) {
+		msleep(20);
+		ret = vendor_in(hdcap, REQ_GPIO, 0x39, 0, rx, 1);
+		if (ret >= 0 && rx[0] == 1)
+			break;
+	}
+
+	if (k == 50) {
+		dev_info(hdcap->dev, "MCU not detected (GPIO timeout)\n");
+		return;
+	}
+
+	dev_dbg(hdcap->dev, "MCU freed, wait count=%d\n", k);
+
+	/* Send probe: magic {0x12, 0x34, 0x57} to MCU at I2C 0xAA */
+	ret = vendor_out(hdcap, REQ_I2C, 0x5066, 0, tx, sizeof(tx));
+	if (ret < 0)
+		return;
+
+	memset(rx, 0, sizeof(rx));
+	ret = vendor_in(hdcap, REQ_I2C, 0x5066, 0, rx, 3);
+	if (ret < 0)
+		return;
+
+	if (rx[0] == 'Q' && rx[1] == 0x10) {
+		hdcap->has_mcu = 1;
+		dev_info(hdcap->dev, "Nuvoton NUC100 MCU detected\n");
+	} else {
+		dev_info(hdcap->dev,
+			 "Unrecognized MCU probe response: %02x %02x %02x\n",
+			 rx[0], rx[1], rx[2]);
+	}
+}
+
+/* Device-level init + GPIO pin state? shared between all inputs */
+static int usb3hdcap_device_init(struct usb3hdcap *hdcap)
+{
+	vendor_out(hdcap, REQ_INIT,   0x0000, 0, NULL, 0);
+	vendor_out(hdcap, REQ_UNK_C7, 0x0064, 0, NULL, 0);
+	/* Windows driver does this but is always fails? */
+	/* vendor_out(hdcap, 0xc5, 0x0000, 0, NULL, 0); */
+	vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+	vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+
+	/*
+	 * just replay what the windows driver does:
+	 *	FUN_14022e3f4(param_1,0x402d);
+	 *	FUN_14022e3f4(param_1,0x12d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x2d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x12d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x802d);
+	 */
+
+	vendor_out(hdcap, REQ_GPIO, 0x402d, 0, NULL, 0);
+	vendor_out(hdcap, REQ_GPIO, 0x012d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x002d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x012d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x802d, 0, NULL, 0);
+
+	/* Probe for MCU after GPIO reset (XCAPTURE-1 only) */
+	if (!hdcap->has_mcu &&
+	    le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID)
+		usb3hdcap_probe_mcu(hdcap);
+
+	return 0;
+}
+
+int usb3hdcap_hw_init(struct usb3hdcap *hdcap)
+{
+	/* Clear stale detection state from previous input */
+	hdcap->std = 0;
+	hdcap->requested_std = 0;
+	hdcap->detected_timings_present = 0;
+	hdcap->requested_timings_present = 0;
+
+	usb3hdcap_device_init(hdcap);
+	usb3hdcap_cs53l21_init(hdcap);
+
+	switch (hdcap->input) {
+	case INPUT_HDMI:
+		return usb3hdcap_hdmi_init(hdcap);
+	case INPUT_COMPONENT:
+		return usb3hdcap_component_init(hdcap);
+	case INPUT_COMPOSITE:
+	case INPUT_SVIDEO:
+	default:
+		return usb3hdcap_composite_init(hdcap);
+	}
+}
+
+/* ------------------------------------------------------------------ */
+/* V4L2 ioctls                                                        */
+/* ------------------------------------------------------------------ */
+
+static int usb3hdcap_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	strscpy(cap->driver, "usb3hdcap", sizeof(cap->driver));
+	strscpy(cap->card, hdcap->has_mcu ?
+		"Micomsoft XCAPTURE-1" : "StarTech USB3HDCAP",
+		sizeof(cap->card));
+	usb_make_path(hdcap->usb_dev, cap->bus_info, sizeof(cap->bus_info));
+	return 0;
+}
+
+static int usb3hdcap_enum_input(struct file *file, void *priv,
+				struct v4l2_input *i)
+{
+	if (i->index > INPUT_HDMI)
+		return -EINVAL;
+
+	i->type = V4L2_INPUT_TYPE_CAMERA;
+	switch (i->index) {
+	case INPUT_COMPOSITE:
+		strscpy(i->name, "Composite", sizeof(i->name));
+		i->std = USB3HDCAP_V4L2_STDS;
+		i->capabilities = V4L2_IN_CAP_STD;
+		break;
+	case INPUT_SVIDEO:
+		strscpy(i->name, "S-Video", sizeof(i->name));
+		i->std = USB3HDCAP_V4L2_STDS;
+		i->capabilities = V4L2_IN_CAP_STD;
+		break;
+	case INPUT_COMPONENT:
+		strscpy(i->name, "Component", sizeof(i->name));
+		i->std = 0;
+		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+		break;
+	case INPUT_HDMI:
+		strscpy(i->name, "HDMI", sizeof(i->name));
+		i->std = 0;
+		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+		break;
+	}
+	return 0;
+}
+
+static int usb3hdcap_enum_fmt_vid_cap(struct file *file, void  *priv,
+				      struct v4l2_fmtdesc *f)
+{
+	if (f->index > 0)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_YUYV;
+	return 0;
+}
+
+static int usb3hdcap_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	int width = hdcap->width;
+	int height = hdcap->height;
+	int interlaced = hdcap->interlaced;
+
+	/*
+	 * If timings were explicitly set, report format matching those
+	 * timings instead of what was detected from the signal
+	 */
+	if (hdcap->requested_timings_present) {
+		const struct v4l2_bt_timings *bt = &hdcap->requested_timings.bt;
+
+		width = bt->width;
+		height = bt->interlaced ? bt->height / 2 : bt->height;
+		interlaced = bt->interlaced;
+	}
+
+	f->fmt.pix.width = width;
+	f->fmt.pix.height = height;
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+	f->fmt.pix.field = interlaced ? V4L2_FIELD_ALTERNATE : V4L2_FIELD_NONE;
+	f->fmt.pix.bytesperline = width * 2;
+	f->fmt.pix.sizeimage = width * 2 * height;
+	f->fmt.pix.colorspace = (hdcap->input == INPUT_HDMI) ?
+		V4L2_COLORSPACE_REC709 : V4L2_COLORSPACE_SMPTE170M;
+
+	return 0;
+}
+
+static int usb3hdcap_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO))
+		return -ENODATA;
+
+	/* try what was explicitly set, if unavailable, use detected */
+	if (hdcap->requested_std)
+		*norm = hdcap->requested_std;
+	else if (hdcap->std)
+		*norm = hdcap->std;
+	else
+		*norm = V4L2_STD_NTSC;
+	return 0;
+}
+
+static int usb3hdcap_s_std(struct file *file, void *priv, v4l2_std_id norm)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO))
+		return -ENODATA;
+
+	if (!(norm & USB3HDCAP_V4L2_STDS))
+		return -EINVAL;
+
+	hdcap->requested_std = norm;
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* DV timings (HDMI + HD component)                                   */
+/* ------------------------------------------------------------------ */
+
+static const struct v4l2_dv_timings_cap usb3hdcap_timings_cap = {
+	.type = V4L2_DV_BT_656_1120,
+	.bt = {
+		.min_width = 720,
+		.max_width = 1920,
+		.min_height = 480,
+		.max_height = 1080,
+		.min_pixelclock = 13500000, /* 480i */
+		.max_pixelclock = 148500000, /* 1080p60 */
+		.standards = V4L2_DV_BT_STD_CEA861,
+		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
+				V4L2_DV_BT_CAP_INTERLACED,
+	},
+};
+
+const struct v4l2_dv_timings all_supported_dv_timings[] = {
+	/* component only */
+	V4L2_DV_BT_CEA_720X480I59_94,
+	V4L2_DV_BT_CEA_720X576I50,
+	V4L2_DV_BT_CEA_1920X1080I60,
+
+	/* hdmi only */
+	V4L2_DV_BT_CEA_640X480P59_94,
+	V4L2_DV_BT_CEA_1280X720P50,
+
+	/* both */
+	V4L2_DV_BT_CEA_720X480P59_94,
+	V4L2_DV_BT_CEA_720X576P50,
+	V4L2_DV_BT_CEA_1280X720P60,
+	V4L2_DV_BT_CEA_1920X1080P60,
+};
+
+static int usb3hdcap_g_dv_timings(struct file *file, void *priv,
+				  struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	/* composite/S-Video -> no DV timings */
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	/* nothing set with s_dv_timings and nothing detected? */
+	if (!(hdcap->requested_timings_present || hdcap->detected_timings_present))
+		return -ENODATA;
+
+	if (hdcap->requested_timings_present)
+		*timings = hdcap->requested_timings;
+	else
+		*timings = hdcap->detected_timings;
+	return 0;
+}
+
+static int usb3hdcap_s_dv_timings(struct file *file, void *priv,
+				  struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	hdcap->requested_timings = *timings;
+	hdcap->requested_timings_present = 1;
+	return 0;
+}
+
+static int usb3hdcap_enum_dv_timings(struct file *file, void *priv,
+				     struct v4l2_enum_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (timings->index >= ARRAY_SIZE(all_supported_dv_timings))
+		return -EINVAL;
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	timings->timings = all_supported_dv_timings[timings->index];
+	return 0;
+}
+
+static int usb3hdcap_dv_timings_cap(struct file *file, void *priv,
+				    struct v4l2_dv_timings_cap *cap)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	/* if you're not on HDMI/component, DV timings are not supported */
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	*cap = usb3hdcap_timings_cap;
+	return 0;
+}
+
+static int usb3hdcap_query_dv_timings(struct file *file, void *priv,
+				      struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!hdcap->detected_timings_present)
+		return -ENODATA;
+
+	*timings = hdcap->detected_timings;
+	return 0;
+}
+
+static void usb3hdcap_activate_ctrls(struct usb3hdcap *hdcap,
+				     enum usb3hdcap_input input)
+{
+	bool is_tw9900 = input == INPUT_COMPOSITE || input == INPUT_SVIDEO;
+
+	v4l2_ctrl_activate(hdcap->ctrl_brightness, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_contrast, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_saturation, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_hue, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_sharpness, is_tw9900);
+}
+
+static int usb3hdcap_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	*i = hdcap->input;
+	return 0;
+}
+
+static int usb3hdcap_s_input(struct file *file, void *priv, unsigned int i)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	enum usb3hdcap_input old_input = hdcap->input;
+	int ret;
+
+	if (i > INPUT_HDMI)
+		return -EINVAL;
+	if (vb2_is_busy(&hdcap->vb2q))
+		return -EBUSY;
+
+	hdcap->input = i;
+
+	usb3hdcap_activate_ctrls(hdcap, i);
+
+	ret = usb3hdcap_hw_init(hdcap);
+	if (ret < 0) {
+		hdcap->input = old_input;
+		hdcap->hw_inited = 0;
+		return ret;
+	}
+
+	hdcap->bpl = hdcap->width * 2;
+	hdcap->hw_inited = 1;
+
+	if (i == INPUT_COMPOSITE || i == INPUT_SVIDEO)
+		hdcap->video_dev.tvnorms = USB3HDCAP_V4L2_STDS;
+	else
+		hdcap->video_dev.tvnorms = 0;
+
+	return 0;
+}
+
+static int usb3hdcap_enum_framesizes(struct file *file, void *priv,
+				     struct v4l2_frmsizeenum *fsize)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (fsize->index > 0)
+		return -EINVAL;
+	if (fsize->pixel_format != V4L2_PIX_FMT_YUYV)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = hdcap->width;
+	fsize->discrete.height = hdcap->height;
+	return 0;
+}
+
+static void fill_timeperframe(struct usb3hdcap *hdcap, struct v4l2_fract *tf)
+{
+	/*
+	 * using the frame rate here even for interlaced, spec isn't super
+	 * clear on what to do, but adv7180.c does it this way
+	 */
+	if (hdcap->detected_timings.type) {
+		const struct v4l2_bt_timings *bt = &hdcap->detected_timings.bt;
+		u32 htotal = V4L2_DV_BT_FRAME_WIDTH(bt);
+		u32 vtotal = V4L2_DV_BT_FRAME_HEIGHT(bt);
+
+		tf->numerator = htotal * vtotal;
+		tf->denominator = (u32)bt->pixelclock;
+		v4l2_simplify_fraction(&tf->numerator, &tf->denominator, 8, 333);
+	} else if (hdcap->std & V4L2_STD_625_50) {
+		/* PAL: 25fps */
+		tf->numerator = 1;
+		tf->denominator = 25;
+	} else {
+		/* NTSC: 29.97fps */
+		tf->numerator = 1001;
+		tf->denominator = 30000;
+	}
+}
+
+static int usb3hdcap_g_parm(struct file *file, void *priv,
+			    struct v4l2_streamparm *sp)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (sp->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	sp->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe(hdcap, &sp->parm.capture.timeperframe);
+	sp->parm.capture.readbuffers = 4;
+	return 0;
+}
+
+static int usb3hdcap_s_parm(struct file *file, void *priv,
+			    struct v4l2_streamparm *sp)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (sp->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/* fixed framerate - just report what we have */
+	sp->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe(hdcap, &sp->parm.capture.timeperframe);
+	sp->parm.capture.readbuffers = 4;
+	return 0;
+}
+
+static int usb3hdcap_enum_frameintervals(struct file *file, void *priv,
+					 struct v4l2_frmivalenum *fival)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (fival->index > 0)
+		return -EINVAL;
+	if (fival->pixel_format != V4L2_PIX_FMT_YUYV)
+		return -EINVAL;
+	if (fival->width != hdcap->width || fival->height != hdcap->height)
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fill_timeperframe(hdcap, &fival->discrete);
+	return 0;
+}
+
+static int usb3hdcap_log_status(struct file *file, void *priv)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	dev_info(hdcap->dev,
+		 "status: iso_cbs=%u iso_bytes=%lu markers=%u frames=%u ",
+		 hdcap->iso_cb_count, hdcap->iso_bytes,
+		 hdcap->markers_found, hdcap->frames_delivered);
+	dev_info(hdcap->dev,
+		 "parse_len=%d frame_line=%d synced=%d was_blanking=%d ",
+		 hdcap->parse_len, hdcap->frame_line,
+		 hdcap->synced, hdcap->was_blanking);
+	dev_info(hdcap->dev, "cur_buf=%p\n", hdcap->cur_buf);
+	return 0;
+}
+
+static int usb3hdcap_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct usb3hdcap *hdcap = container_of(ctrl->handler,
+		struct usb3hdcap, ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_BRIGHTNESS:
+		return u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_BRIGHT, (u8)ctrl->val);
+	case V4L2_CID_CONTRAST:
+		return u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_CONTRAST, ctrl->val);
+	case V4L2_CID_SATURATION:
+		u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SAT_U, ctrl->val);
+		return u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SAT_V, ctrl->val);
+	case V4L2_CID_HUE:
+		return u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_HUE, (u8)ctrl->val);
+	case V4L2_CID_SHARPNESS:
+		return u3hc_i2c_write(hdcap, ADDR_TW9900, TW9900_SHARPNESS, ctrl->val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int usb3hdcap_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_DV_RX_POWER_PRESENT:
+		ctrl->val = 1;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ctrl_ops usb3hdcap_ctrl_ops = {
+	.s_ctrl = usb3hdcap_s_ctrl,
+	.g_volatile_ctrl = usb3hdcap_g_volatile_ctrl,
+};
+
+static int usb3hdcap_subscribe_event(struct v4l2_fh *fh,
+				     const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	}
+}
+
+static const struct v4l2_ioctl_ops usb3hdcap_ioctl_ops = {
+	.vidioc_querycap = usb3hdcap_querycap,
+	.vidioc_enum_input = usb3hdcap_enum_input,
+	.vidioc_enum_fmt_vid_cap = usb3hdcap_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_g_std = usb3hdcap_g_std,
+	.vidioc_s_std = usb3hdcap_s_std,
+	.vidioc_g_dv_timings = usb3hdcap_g_dv_timings,
+	.vidioc_s_dv_timings = usb3hdcap_s_dv_timings,
+	.vidioc_enum_dv_timings = usb3hdcap_enum_dv_timings,
+	.vidioc_dv_timings_cap = usb3hdcap_dv_timings_cap,
+	.vidioc_query_dv_timings = usb3hdcap_query_dv_timings,
+	.vidioc_g_input = usb3hdcap_g_input,
+	.vidioc_s_input = usb3hdcap_s_input,
+	.vidioc_g_parm = usb3hdcap_g_parm,
+	.vidioc_s_parm = usb3hdcap_s_parm,
+	.vidioc_enum_framesizes = usb3hdcap_enum_framesizes,
+	.vidioc_enum_frameintervals = usb3hdcap_enum_frameintervals,
+	.vidioc_log_status = usb3hdcap_log_status,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event = usb3hdcap_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations usb3hdcap_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+};
+
+static void usb3hdcap_release(struct v4l2_device *v4l2_dev)
+{
+	struct usb3hdcap *hdcap = container_of(v4l2_dev,
+		struct usb3hdcap, v4l2_dev);
+
+	v4l2_device_unregister(&hdcap->v4l2_dev);
+	v4l2_ctrl_handler_free(&hdcap->ctrl);
+	kfree(hdcap);
+}
+
+static int video_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+
+	mutex_init(&hdcap->v4l2_lock);
+	mutex_init(&hdcap->vb2q_lock);
+	spin_lock_init(&hdcap->buflock);
+	INIT_LIST_HEAD(&hdcap->bufs);
+
+	hdcap->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	hdcap->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	hdcap->vb2q.drv_priv = hdcap;
+	hdcap->vb2q.buf_struct_size = sizeof(struct hdcap_buf);
+	hdcap->vb2q.ops = &usb3hdcap_vb2_ops;
+	hdcap->vb2q.mem_ops = &vb2_vmalloc_memops;
+	hdcap->vb2q.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	hdcap->vb2q.min_queued_buffers = 2;
+	hdcap->vb2q.lock = &hdcap->vb2q_lock;
+	ret = vb2_queue_init(&hdcap->vb2q);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not initialize videobuf2 queue\n");
+		return ret;
+	}
+
+	v4l2_ctrl_handler_init(&hdcap->ctrl, 7);
+	hdcap->ctrl_brightness = v4l2_ctrl_new_std(&hdcap->ctrl,
+						   &usb3hdcap_ctrl_ops,
+						   V4L2_CID_BRIGHTNESS,
+						   -128, 127, 1, -9);
+	hdcap->ctrl_contrast = v4l2_ctrl_new_std(&hdcap->ctrl,
+						 &usb3hdcap_ctrl_ops,
+						 V4L2_CID_CONTRAST,
+						 0, 255, 1, 0x79);
+	hdcap->ctrl_saturation = v4l2_ctrl_new_std(&hdcap->ctrl,
+						   &usb3hdcap_ctrl_ops,
+						   V4L2_CID_SATURATION,
+						   0, 255, 1, 0x80);
+	hdcap->ctrl_hue = v4l2_ctrl_new_std(&hdcap->ctrl,
+					    &usb3hdcap_ctrl_ops,
+					    V4L2_CID_HUE,
+					    -128, 127, 1, 0);
+	hdcap->ctrl_sharpness = v4l2_ctrl_new_std(&hdcap->ctrl,
+						  &usb3hdcap_ctrl_ops,
+						  V4L2_CID_SHARPNESS,
+						  0, 255, 1, 0x52);
+	hdcap->ctrl_rx_power = v4l2_ctrl_new_std(&hdcap->ctrl,
+						 &usb3hdcap_ctrl_ops,
+						 V4L2_CID_DV_RX_POWER_PRESENT,
+						 0, 1, 0, 1);
+	if (hdcap->ctrl_rx_power)
+		hdcap->ctrl_rx_power->flags |= V4L2_CTRL_FLAG_VOLATILE |
+						V4L2_CTRL_FLAG_READ_ONLY;
+	ret = hdcap->ctrl.error;
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not initialize controls\n");
+		goto ctrl_fail;
+	}
+
+	hdcap->v4l2_dev.ctrl_handler = &hdcap->ctrl;
+	hdcap->v4l2_dev.release = usb3hdcap_release;
+	ret = v4l2_device_register(hdcap->dev, &hdcap->v4l2_dev);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not register v4l2 device\n");
+		goto v4l2_fail;
+	}
+
+	strscpy(hdcap->video_dev.name, "usb3hdcap", sizeof(hdcap->video_dev.name));
+	hdcap->video_dev.v4l2_dev = &hdcap->v4l2_dev;
+	hdcap->video_dev.release = video_device_release_empty;
+	hdcap->video_dev.fops = &usb3hdcap_fops;
+	hdcap->video_dev.ioctl_ops = &usb3hdcap_ioctl_ops;
+	hdcap->video_dev.tvnorms = USB3HDCAP_V4L2_STDS;
+	hdcap->video_dev.queue = &hdcap->vb2q;
+	hdcap->video_dev.lock = &hdcap->v4l2_lock;
+	hdcap->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING;
+	video_set_drvdata(&hdcap->video_dev, hdcap);
+	ret = video_register_device(&hdcap->video_dev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not register video device\n");
+		goto vdev_fail;
+	}
+
+	dev_info(hdcap->dev, "%s: registered as %s\n",
+		 __func__, video_device_node_name(&hdcap->video_dev));
+
+	return 0;
+
+vdev_fail:
+	v4l2_device_unregister(&hdcap->v4l2_dev);
+
+v4l2_fail:
+	v4l2_ctrl_handler_free(&hdcap->ctrl);
+
+ctrl_fail:
+	return ret;
+}
+
+static int usb3hdcap_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	struct device *dev;
+	struct usb3hdcap *hdcap;
+	int ret, is_xcapture;
+
+	/* not using the interrupt interface, just data */
+	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
+
+	/* none, Mult=0 for SD, Mult=1 for HD */
+	if (intf->num_altsetting != 3)
+		return -ENODEV;
+
+	dev = &intf->dev;
+
+	hdcap = kzalloc_obj(*hdcap, GFP_KERNEL);
+	if (!hdcap)
+		return -ENOMEM;
+
+	hdcap->dev = dev;
+	hdcap->usb_dev = usb_get_dev(interface_to_usbdev(intf));
+	hdcap->input = INPUT_COMPOSITE;
+	hdcap->std = 0;
+	hdcap->width = SD_WIDTH;
+	hdcap->height = NTSC_HEIGHT / 2;
+	hdcap->bpl = DEFAULT_BPL;
+
+	usb_set_intfdata(intf, hdcap);
+
+	ret = video_init(hdcap);
+	if (ret < 0)
+		goto video_fail;
+
+	ret = usb3hdcap_audio_init(hdcap);
+	if (ret < 0)
+		dev_warn(dev, "audio init failed: %d (continuing without audio)\n", ret);
+
+	/*
+	 * Take an extra ref so that disconnect's v4l2_device_put doesn't
+	 * immediately trigger usb3hdcap_release before cleanup is done - based on
+	 * usbtv driver
+	 */
+	v4l2_device_get(&hdcap->v4l2_dev);
+
+	is_xcapture = le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID;
+	dev_info(dev, "%s USB 3.0 HD Video Capture Device",
+		 is_xcapture ? "Micomsoft XCAPTURE-1" : "StarTech USB3HDCAP");
+
+	return 0;
+
+video_fail:
+	usb_set_intfdata(intf, NULL);
+	usb_put_dev(hdcap->usb_dev);
+	kfree(hdcap);
+	return ret;
+}
+
+static void usb3hdcap_disconnect(struct usb_interface *intf)
+{
+	struct usb3hdcap *hdcap = usb_get_intfdata(intf);
+
+	usb_set_intfdata(intf, NULL);
+
+	if (!hdcap)
+		return;
+
+	usb3hdcap_audio_free(hdcap);
+	vb2_video_unregister_device(&hdcap->video_dev);
+	v4l2_device_disconnect(&hdcap->v4l2_dev);
+
+	usb_put_dev(hdcap->usb_dev);
+	hdcap->usb_dev = NULL;
+
+	/* hdcap is freed by usb3hdcap_release when last user closes fd */
+	v4l2_device_put(&hdcap->v4l2_dev);
+}
+
+static const struct usb_device_id usb3hdcap_id_table[] = {
+	{ USB_DEVICE(USB3HDCAP_VID, USB3HDCAP_PID) },
+	{ USB_DEVICE(USB3HDCAP_VID, XCAPTURE1_PID) },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, usb3hdcap_id_table);
+
+MODULE_AUTHOR("Matthew Laux <matthew.laux@gmail.com>");
+MODULE_DESCRIPTION("StarTech USB3HDCAP Driver");
+MODULE_LICENSE("GPL");
+
+static struct usb_driver usb3hdcap_usb_driver = {
+	.name = "usb3hdcap",
+	.id_table = usb3hdcap_id_table,
+	.probe = usb3hdcap_probe,
+	.disconnect = usb3hdcap_disconnect,
+};
+module_usb_driver(usb3hdcap_usb_driver);
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c b/drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
new file mode 100644
index 000000000000..776ee7602ec2
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
@@ -0,0 +1,802 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP MST3367 support: HDMI and component
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/usb.h>
+#include <linux/v4l2-dv-timings.h>
+#include <media/v4l2-ctrls.h>
+
+#include "usb3hdcap.h"
+
+/* ------------------------------------------------------------------ */
+/* Component scaler mode table                                        */
+/* ------------------------------------------------------------------ */
+
+struct component_mode {
+	int vtotal_min, vtotal_max;
+	int width, height;
+	int refresh_rate;
+	int interlaced;
+	/* MST3367 bank 0 ADC/scaler registers (ref: SetADParameters) */
+	u8 pllgain, clpdly, clpdur, hsopw;
+	u8 adc_bw0, adc_bw1;
+	u16 scaler_htotal;
+	u16 hde_off;
+	u8 vde_off;
+	struct v4l2_dv_timings timings;
+};
+
+/*
+ * Values from Windows driver table $140303810
+ * TODO: add 50Hz variants
+ *
+ * The hardware supports 240p over component (one of the great things about
+ * this card), but the Windows driver doesn't attempt to distinguish. I
+ * won't either
+ */
+static const struct component_mode component_modes[] = {
+	/*                                pll   clp   clp   hsop  adc   adc                    */
+	/*                                gain  dly   dur   w     bw0   bw1   sclht  hde   vde */
+	/* 480i */
+	{  250,  275,   720,  240, 60, 1, 0x08, 0x08, 0x08, 0x18, 0x44, 0x04, 0x35a, 0x76, 0x12,
+	   V4L2_DV_BT_CEA_720X480I59_94 },
+	/* 576i */
+	{  300,  320,   720,  288, 50, 1, 0x08, 0x08, 0x08, 0x18, 0x44, 0x04, 0x360, 0x83, 0x16,
+	   V4L2_DV_BT_CEA_720X576I50 },
+	/* 480p */
+	{  515,  535,   720,  480, 60, 0, 0x20, 0x08, 0x08, 0x18, 0x33, 0x03, 0x35a, 0x79, 0x24,
+	   V4L2_DV_BT_CEA_720X480P59_94 },
+	/* 1080i */
+	{  555,  585,  1920,  540, 60, 1, 0x58, 0x38, 0x20, 0x30, 0x11, 0x01, 0x898, 0xeb, 0x14,
+	   V4L2_DV_BT_CEA_1920X1080I60 },
+	/* 576p */
+	{  615,  635,   720,  576, 50, 0, 0x18, 0x08, 0x08, 0x18, 0x33, 0x03, 0x360, 0x83, 0x2c,
+	   V4L2_DV_BT_CEA_720X576P50 },
+	/* 720p */
+	{  740,  760,  1280,  720, 60, 0, 0x58, 0x38, 0x20, 0x30, 0x11, 0x01, 0x672, 0x12b, 0x19,
+	   V4L2_DV_BT_CEA_1280X720P60 },
+	/* 1080p */
+	{ 1115, 1135,  1920, 1080, 60, 0, 0xe8, 0x38, 0x30, 0xa0, 0x00, 0x00, 0x898, 0xc1, 0x29,
+	   V4L2_DV_BT_CEA_1920X1080P60 },
+};
+
+/*
+ * Known CEA timing table - maps (htotal, vtotal, hactive) to full
+ * v4l2_dv_timings. HD htotal = standard * 1.5 (MST3367 counter rate?)
+ */
+struct hdmi_std {
+	int htotal_min, htotal_max;
+	int vtotal_min, vtotal_max;
+	int hactive;
+	struct v4l2_dv_timings timings;
+};
+
+static const struct hdmi_std hdmi_stds[] = {
+	/*  htotal      vtotal     ha */
+	{  790,  810,  520,  530,  640, V4L2_DV_BT_CEA_640X480P59_94 },
+	{  848,  868,  520,  530,  720, V4L2_DV_BT_CEA_720X480P59_94 },
+	{  854,  874,  620,  630,  720, V4L2_DV_BT_CEA_720X576P50 },
+	{ 2960, 2980,  745,  755, 1280, V4L2_DV_BT_CEA_1280X720P50 },
+	{ 2465, 2485,  745,  755, 1280, V4L2_DV_BT_CEA_1280X720P60 },
+	/*
+	 * not sure about this one. it matches the timings for 30, but my laptop
+	 * claims to be outputting 60...
+	 */
+	{ 2740, 2760, 1120, 1130, 1920, V4L2_DV_BT_CEA_1920X1080P30 },
+	{ 3290, 3310,  555,  570, 1920, V4L2_DV_BT_CEA_1920X1080I60 },
+	{ 3950, 3970, 1120, 1130, 1920, V4L2_DV_BT_CEA_1920X1080P50 },
+	{ 2190, 2210, 1120, 1130, 1920, V4L2_DV_BT_CEA_1920X1080P60 },
+	{ 3290, 3310, 1120, 1130, 1920, V4L2_DV_BT_CEA_1920X1080P60 },
+};
+
+/* ------------------------------------------------------------------ */
+/* MST3367 bank select helper                                         */
+/* ------------------------------------------------------------------ */
+
+static int mst_bank(struct usb3hdcap *hdcap, int bank)
+{
+	if (hdcap->mst_current_bank == bank)
+		return 0;
+	hdcap->mst_current_bank = bank;
+	return u3hc_i2c_write(hdcap, ADDR_MST3367, 0x00, bank);
+}
+
+/* ------------------------------------------------------------------ */
+/* MST3367 register configuration                                     */
+/* ------------------------------------------------------------------ */
+
+static void mst3367_config(struct usb3hdcap *hdcap)
+{
+	/*
+	 * Largely based on mst3367-drv.c by Steven Toth and Ghidra decompilation
+	 * of the Windows x64 driver
+	 */
+
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x51, 0x80);
+	/* RxTmdsHotPlug: all off */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xb7, 0xff, 0x02);
+	/* RxGeneralInit */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x41, 0x6f);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb8, 0x00);
+	/* RxVideoInit */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb0, 0x14);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xae, ~0x04, 0x04);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xad, 0x05); /* low-pass filter */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb1, 0xc0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb2, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb3, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb4, 0x55);
+	/* RxAudioInit */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xb4, ~0x03, 0x00);
+
+	/* RxTmdsInit */
+	mst_bank(hdcap, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0f, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x16, 0x30);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x17, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x18, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x19, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1a, 0x50);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x2a, ~0x07, 0x07);
+	/* RxHdcpInit */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x24, 0x40);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x25, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x30, 0x80);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x31, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x32, 0x00);
+
+	mst_bank(hdcap, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x08, 0x03);
+	/* RxAudioInit (cont'd) */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x01, 0x61);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x02, 0xf5);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x03, ~0x02, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x04, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x05, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x06, 0x08);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1c, 0x1a);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1d, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1e, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1f, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x25, (u8)~0xa2, 0xa2);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x07, ~0x04, 0x04);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x17, 0xc0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x19, 0xff);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1a, 0xff);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1b, 0xfc);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x20, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x21, ~0x03, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x22, 0x26);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x27, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x2e, (u8)~0xa1, 0xa1);
+
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xab, 0x15); /* COLOR.RANGE */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xac, 0x15); /* COLOR.RANGE */
+
+	/* RxHdcpReset */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb8, 0x10); /* HDCP.RESET */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb8, 0x00);
+
+	/* RxHdmiReset */
+	mst_bank(hdcap, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x07, 0xf4);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x07, 0x04);
+
+	/* RxSwitchSource: 0x81 = HDMI TMDS.A */
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x51, 0x81);
+	/* RxTmdsHotPlug: link on */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb7, 0x00);
+
+	/* RxHdmiInit */
+	mst_bank(hdcap, 0x02);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x01, 0x0f, 0x60);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x04, 0xff, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x06, 0x08);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x09, 0xff, 0x20);
+
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x54, 0xef, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xac, 0xff, 0x80);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xce, 0xff, 0x80);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xcf, 0xfa, 0x02);
+
+	/*
+	 * 8c28 is "CustomCompanyEndoCamProperty" (0 in my registry)
+	 * 7674 is "CustomAnalogVideoInputBandwidthProperty" (1 on my machine)
+	 * if (*(int *)(param_1 + 0x8c28) == 0) {
+	 *   uVar1 = *(uint *)(param_1 + 0x7674);
+	 *   local_18 = 0x3040006;
+	 *   uVar2 = (ulonglong)uVar1 / 6;
+	 *   local_14 = 0x107;
+	 *   bVar5 = read_mst(param_1,CONCAT71((int7)(uVar2 >> 8),0x80),0xd0);
+	 *   bVar4 = read_mst(param_1,0x80,0xcf);
+	 *   bVar3 = *(byte *)((longlong)&local_18 + (ulonglong)(uVar1
+	 *                 + (int)uVar2 * -6));
+	 *   bVar4 = bVar3 << 7 | bVar4 & 0x7f;
+	 *   bVar5 = (bVar3 >> 1 ^ bVar5) & 3 ^ bVar5;
+	 * }
+	 *
+	 * ... which has this effect:
+	 */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xd0, 0xfc, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xcf, 0x7f, 0x00);
+
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x00, 0x7f, 0x00);
+	mst_bank(hdcap, 0x00);
+}
+
+/* ------------------------------------------------------------------ */
+/* CPLD init + poll helper                                            */
+/* ------------------------------------------------------------------ */
+
+static void cpld_init(struct usb3hdcap *hdcap, u8 mux_val)
+{
+	int k, status;
+
+	/*
+	 * cVar3 = i2c_read(param_1,0x98,0x3b,0);
+	 * if (cVar3 != '\0') {
+	 *   uVar5 = *(uint *)(param_1 + 0x6840);
+	 *   if ((uVar5 == 2) || (uVar5 == 3)) {
+	 *     local_res8[0] = -0x80;
+	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
+	 *     uVar5 = *(uint *)(param_1 + 0x6840);
+	 *   }
+	 *   if (uVar5 < 2) {
+	 *     local_res8[0] = '\x02';
+	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
+	 *   }
+	 * }
+	 */
+
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x3b, mux_val);
+
+	/*
+	 * local_res8[0] = '\x05';
+	 * i2c_write(param_1,0x98,0x20,local_res8,1);
+	 * cVar3 = FUN_140226fc4(param_1);
+	 * local_res8[0] = '\x01';
+	 * i2c_write(param_1,0x98,0,local_res8,1);
+	 * local_res8[0] = (-(cVar3 != '\0') & 0xfeU) - 2;
+	 * i2c_write(param_1,0x98,0x10,local_res8,1);
+	 */
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x00, 0x01);
+
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x10, hdcap->has_mcu ? 0xfc : 0xfe);
+
+	for (k = 0; k < 50; k++) {
+		status = u3hc_i2c_read(hdcap, ADDR_CPLD, 0x01);
+		if (status >= 0x03)
+			break;
+		msleep(20);
+	}
+
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x01, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x11, 0xfc);
+}
+
+/* Identity CSC for component YPbPr */
+static const u8 csc_identity_component[] = {
+	0x10, 0x00,  0x00, 0x00,  0x00, 0x00, /* M11, M12, M13 */
+	0x00, 0x00,  0x10, 0x00,  0x00, 0x00, /* M21, M22, M23 */
+	0x00, 0x00,  0x00, 0x00,  0x10, 0x00, /* M31, M32, M33 */
+	0x20, 0x00,  0x03, 0x80,  0x20, 0x00, /*  A1,  A2,  A3 */
+};
+
+/* Identity CSC for HDMI YCbCr */
+static const u8 csc_identity_hdmi[] = {
+	0x10, 0x00,  0x00, 0x00,  0x00, 0x00,
+	0x00, 0x00,  0x10, 0x00,  0x00, 0x00,
+	0x00, 0x00,  0x00, 0x00,  0x10, 0x00,
+	0x20, 0x00,  0x04, 0x00,  0x20, 0x00,
+};
+
+/* BT.601 for SD (width <= 720) */
+static const u8 csc_r2y_sd[] = {
+	0x08, 0x02,  0x04, 0xc5,  0xfd, 0x4d,
+	0xf9, 0x4a,  0x09, 0x5b,  0xfa, 0xb1,
+	0xfe, 0xb4,  0x01, 0xd2,  0x08, 0x02,
+	0x20, 0x00,  0x00, 0x00,  0x20, 0x00,
+};
+
+/* BT.709 for HD (width > 720) */
+static const u8 csc_r2y_hd[] = {
+	0x08, 0x02,  0x03, 0x65,  0xfe, 0x28,
+	0xf8, 0xb9,  0x0b, 0x65,  0xf9, 0xd6,
+	0xff, 0x45,  0x01, 0x27,  0x08, 0x02,
+	0x20, 0x00,  0x00, 0x00,  0x20, 0x00,
+};
+
+void mst3367_write_csc(struct usb3hdcap *hdcap)
+{
+	bool comp = (hdcap->input == INPUT_COMPONENT);
+	const u8 *csc;
+	u8 old_ab, reg_92;
+	int k;
+
+	if (comp) {
+		reg_92 = 0x66;
+		csc = csc_identity_component;
+	} else {
+		/*
+		 * Auto-detect HDMI input colorspace:
+		 *
+		 * RxHdmiPacketStatus (0x02:0x0B/0x0C/0x0E): bit 3 indicates
+		 * an AVI InfoFrame has been received?
+		 * RxHdmiPacketColor (0x02:0x48 bits 6:5):
+		 *   0x00 = RGB, 0x20 = YUV422, 0x40 = YUV444
+		 */
+		int pkt_status, color = 0x00;
+
+		mst_bank(hdcap, 0x02);
+		pkt_status = (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x0c) & 0x3f) << 8 |
+			     (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x0b) & 0xff);
+		if (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x0e) & 0x08)
+			pkt_status |= 0x8000;
+
+		if (pkt_status & 0x0008)
+			color = u3hc_i2c_read(hdcap, ADDR_MST3367, 0x48) & 0x60;
+
+		dev_info(hdcap->dev,
+			 "CSC: pkt_status=0x%04x color=0x%02x\n",
+			 pkt_status, color);
+
+		if (color == 0x00) {
+			/* RGB: need R2Y conversion for YUV422 output */
+			reg_92 = 0x40;
+			csc = (hdcap->width <= 720) ? csc_r2y_sd : csc_r2y_hd;
+			dev_info(hdcap->dev, "CSC: HDMI RGB, %s R2Y\n",
+				 (hdcap->width <= 720) ? "BT.601" : "BT.709");
+		} else {
+			/* YCbCr input: identity passthrough */
+			reg_92 = 0x62;
+			csc = csc_identity_hdmi;
+			dev_info(hdcap->dev, "CSC: HDMI YCbCr (0x%02x), identity\n",
+				 color);
+		}
+	}
+
+	mst_bank(hdcap, 0x00);
+
+	/* BLANK.OUTPUT while changing CSC */
+	u3hc_i2c_rmw_get_old(hdcap, ADDR_MST3367, 0xab, 0x7f, 0x80, &old_ab);
+
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x90, 0x15); /* COLOR.RANGE */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x91, 0x15); /* COLOR.RANGE */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x92, reg_92);
+
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xac, ~0x3f, 0x15); /* COLOR.RANGE */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xad, 0x05); /* sharpness: low-pass filter */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1e, 0x11); /* sharpness */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1f, 0x01); /* sharpness */
+
+	for (k = 0; k < 24; k++)
+		u3hc_i2c_write(hdcap, ADDR_MST3367, 0x93 + k, csc[k]);
+
+	/* RX_OUTPUT_YUV422 / 08.BITS / EMBEDDED SYNC */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0xb0, 0xc2, 0x21);
+	/* NORMAL.OUTPUT (un-blank) */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xab, old_ab & 0x7f);
+
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0xb3, 0x00);
+
+	mst_bank(hdcap, 0x02);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x27, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x20, 0x00);
+}
+
+/* ------------------------------------------------------------------ */
+/* Signal detection polling                                           */
+/* ------------------------------------------------------------------ */
+
+static const struct v4l2_dv_timings *match_hdmi_timing(int htotal, int vtotal,
+						       int hactive)
+{
+	int k;
+
+	for (k = 0; k < ARRAY_SIZE(hdmi_stds); k++) {
+		const struct hdmi_std *s = &hdmi_stds[k];
+
+		if (htotal < s->htotal_min || htotal > s->htotal_max)
+			continue;
+		if (vtotal < s->vtotal_min || vtotal > s->vtotal_max)
+			continue;
+		if (hactive != s->hactive)
+			continue;
+		return &s->timings;
+	}
+	return NULL;
+}
+
+static int hdmi_poll_signal(struct usb3hdcap *hdcap)
+{
+	int k, status;
+
+	vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+
+	for (k = 0; k < 100; k++) {
+		mst_bank(hdcap, 0x00);
+		status = u3hc_i2c_read(hdcap, ADDR_MST3367, 0x55);
+		if (status < 0) {
+			msleep(100);
+			continue;
+		}
+
+		if (k % 10 == 0)
+			dev_info(hdcap->dev,
+				 "HDMI signal poll[%d]: lock=0x%02x\n",
+				 k, status);
+
+		if (status & 0x3c) {
+			const struct v4l2_dv_timings *std;
+			int htotal, vtotal, hactive;
+
+			htotal = (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x6a) << 8 |
+				  u3hc_i2c_read(hdcap, ADDR_MST3367, 0x6b)) & 0xfff;
+			vtotal = (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5b) << 8 |
+				  u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5c)) & 0x7ff;
+
+			mst_bank(hdcap, 0x02);
+			hactive = (u3hc_i2c_read(hdcap, ADDR_MST3367, 0x29) << 8 |
+				   u3hc_i2c_read(hdcap, ADDR_MST3367, 0x28)) & 0x1fff;
+
+			dev_info(hdcap->dev,
+				 "HDMI locked: htotal=%d vtotal=%d hactive=%d\n",
+				 htotal, vtotal, hactive);
+
+			std = match_hdmi_timing(htotal, vtotal, hactive);
+			if (!std) {
+				dev_err(hdcap->dev,
+					"unsupported HDMI timing: htotal=%d vtotal=%d hactive=%d\n",
+					htotal, vtotal, hactive);
+				return -ERANGE;
+			}
+			hdcap->detected_timings = *std;
+			hdcap->detected_timings_present = 1;
+			hdcap->std = 0; /* no SD standard */
+			hdcap->width = std->bt.width;
+			hdcap->interlaced = std->bt.interlaced;
+			hdcap->height = std->bt.interlaced
+				? std->bt.height / 2 : std->bt.height;
+			hdcap->bpl = hdcap->width * 2;
+
+			/* DISABLE AUTO POSITION */
+			mst_bank(hdcap, 0x00);
+			u3hc_i2c_write(hdcap, ADDR_MST3367, 0xe2, 0x00);
+
+			return 0;
+		}
+
+		/* Not locked yet, ENABLE AUTO POSITION */
+		u3hc_i2c_write(hdcap, ADDR_MST3367, 0xe2, 0x80);
+		msleep(100);
+	}
+
+	dev_err(hdcap->dev, "No HDMI signal lock after 10s\n");
+	return -ETIMEDOUT;
+}
+
+/* ------------------------------------------------------------------ */
+/* ADC front-end config (component/VGA only)                          */
+/* ------------------------------------------------------------------ */
+
+static void mst3367_adc_config(struct usb3hdcap *hdcap)
+{
+	/* RxAdcInit */
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x00, 0x80);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x24, 0xc0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x00, 0x00);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x21, ~0x07, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x04, 0x00); /* ADC phase */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x10, 0x0f, 0xd0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x11, 0x2d);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x20, 0xc0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x21, 0x04);
+	/* bits 5:4 = sync source: 0x30 = SOG for component */
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x0e, 0xcf, 0x30);
+}
+
+static const struct component_mode *match_component_mode(int vtotal)
+{
+	int k;
+
+	for (k = 0; k < ARRAY_SIZE(component_modes); k++) {
+		const struct component_mode *m = &component_modes[k];
+
+		if (vtotal < m->vtotal_min || vtotal > m->vtotal_max)
+			continue;
+		return m;
+	}
+	return NULL;
+}
+
+/* ------------------------------------------------------------------ */
+/* Component scaler register write                                    */
+/* ------------------------------------------------------------------ */
+
+static void component_write_scaler(struct usb3hdcap *hdcap,
+				   const struct component_mode *m)
+{
+	int ht = m->scaler_htotal - 1;
+	int is_720_low_rr = m->width == 1280 && m->height == 720 &&
+			(m->refresh_rate == 24 ||
+				m->refresh_rate == 25 ||
+				m->refresh_rate == 30);
+
+	mst_bank(hdcap, 0x00);
+
+	/*
+	 * edge case for low frame rate 720p:
+	 * if (((*(int *)(uVar30 + 0x30) == 0x500) && (*(int *)(uVar30 + 0x34) == 0x2d0)) &&
+	 *     ((*(int *)(uVar30 + 0x38) == 0x1e ||
+	 *     ((*(int *)(uVar30 + 0x38) == 0x19 || (*(int *)(uVar30 + 0x38) == 0x18)))))) {
+	 *   uVar37 = 0;
+	 * } else {
+	 *   uVar37 = 4;
+	 * }
+	 * send_mst(param_1,0,0x12,uVar37);
+	 */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x12, is_720_low_rr ? 0x00 : 0x04);
+
+	/* SetADParameters */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x03, m->pllgain);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x05, m->clpdly);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x06, m->clpdur);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x07, m->hsopw);
+
+	/* ADC gain: Y, Cb, Cr */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x08, 0xa0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x09, 0xc0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0a, 0xa0);
+
+	/* grade scale (clamp level): Y, Cb, Cr */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0b, 0x80);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0c, 0x60);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0d, 0x80);
+
+	/* clamp offset: Y, Cb, Cr */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x18, 0x10);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x19, 0x10);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1a, 0x10);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1b, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1c, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1d, 0x00);
+
+	/* ADCSetAutoDetectFormat: output htotal */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x01, ht >> 4);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x02, (ht & 0x0f) << 4);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1e, m->adc_bw0);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x1f, m->adc_bw1);
+
+	/* output data enable start pos after sync */
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x80, (m->hde_off >> 8) & 0x0f);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x81, m->hde_off & 0xff);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x82, (m->width >> 8) & 0xff);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x83, m->width & 0xff);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x84, m->vde_off);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x85,
+		       ((m->height >> 8) & 0x0f) | (m->interlaced ? 0x20 : 0x00));
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x86, m->height & 0xff);
+
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x2d, 0x11);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x2e, 0x11);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x39, (u8)(m->clpdly + m->clpdur - 0x78));
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x2c, 0x9d);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x3a, 0x0c);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x3b, 0x08);
+
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x10, 0xfa, 0x05);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x0f, 0xff, 0x20);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x17, 0xff, 0x02);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x2f, 0xff, 0x02);
+	u3hc_i2c_rmw(hdcap, ADDR_MST3367, 0x60, 0xfb, 0x00);
+}
+
+/* ------------------------------------------------------------------ */
+/* Component ADC signal polling                                       */
+/* ------------------------------------------------------------------ */
+
+static int component_poll_signal(struct usb3hdcap *hdcap,
+				 const struct component_mode **detected)
+{
+	const struct component_mode *mode;
+	int k, status, vtotal, htotal;
+	int signal_count = 0;
+
+	vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+
+	/*
+	 * RxAdcModeDetect()
+	 * Signal detection per decompiled Windows driver:
+	 *   0x14 & 0x90 == 0x90: H+V locked (status=1)
+	 *   0x14 & 0x90 == 0x80: H lock only (status=2)
+	 *   0x14 == 0x00 && 0x15 & 0x40: status=3
+	 */
+	for (k = 0; k < 100; k++) {
+		int signal_type;
+
+		mst_bank(hdcap, 0x00);
+
+		/* trigger timing measurement? */
+		u3hc_i2c_write(hdcap, ADDR_MST3367, 0x0e, 0x40);
+
+		status = u3hc_i2c_read(hdcap, ADDR_MST3367, 0x14);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x15);
+
+		/* Check signal presence from 0x14 bits 7,4 */
+		signal_type = status & 0x90;
+		if (signal_type == 0x90 || signal_type == 0x80 ||
+		    (signal_type == 0x00 && (status & 0x02)))
+			signal_count++;
+		else
+			signal_count = 0;
+
+		/* Read H period */
+		htotal = ((u3hc_i2c_read(hdcap, ADDR_MST3367, 0x57) & 0x3f) << 8) |
+			  u3hc_i2c_read(hdcap, ADDR_MST3367, 0x58);
+
+		/* scale ADC sample rate to H period */
+		if (htotal > 0)
+			u3hc_i2c_write(hdcap, ADDR_MST3367, 0x11,
+				       (htotal < 0x401 ? 0x400 : htotal) >> 7);
+
+		/* V period (timer counts) */
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x59);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5a);
+
+		/* V total (lines) */
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5b);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5c);
+
+		/* H total (pixels), interlace flag */
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5d);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5e);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5f);
+
+		mst_bank(hdcap, 0x02);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x11);
+		u3hc_i2c_read(hdcap, ADDR_MST3367, 0x12);
+		u3hc_i2c_write(hdcap, ADDR_MST3367, 0x20, 0x00);
+
+		if (k % 10 == 0)
+			dev_info(hdcap->dev,
+				 "component poll[%d]: 0x14=0x%02x count=%d\n",
+				 k, status, signal_count);
+
+		if (signal_count < 3) {
+			msleep(100);
+			continue;
+		}
+
+		/* Signal stable - read vtotal and determine format */
+		mst_bank(hdcap, 0x00);
+		vtotal = ((u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5b) & 0x07) << 8) |
+			  u3hc_i2c_read(hdcap, ADDR_MST3367, 0x5c);
+
+		dev_info(hdcap->dev,
+			 "component locked: vtotal=%d htotal=%d 0x14=0x%02x\n",
+			 vtotal, htotal, status);
+
+		mode = match_component_mode(vtotal);
+		if (!mode) {
+			dev_err(hdcap->dev,
+				"unsupported component timing: vtotal=%d\n",
+				vtotal);
+			return -ERANGE;
+		}
+		hdcap->width = mode->width;
+		hdcap->height = mode->height;
+		hdcap->interlaced = mode->interlaced;
+		hdcap->bpl = hdcap->width * 2;
+		hdcap->std = 0; /* no SD standard */
+		hdcap->detected_timings_present = 1;
+		hdcap->detected_timings = mode->timings;
+		*detected = mode;
+		return 0;
+	}
+
+	dev_err(hdcap->dev, "No component signal lock after 10s\n");
+	return -ETIMEDOUT;
+}
+
+/* ------------------------------------------------------------------ */
+/* Main HDMI init entry point                                         */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+
+	hdcap->mst_current_bank = -1;
+
+	mst3367_config(hdcap);
+
+	/* TW9900 power-down */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, 0x06, 0x0e);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, 0x1a, 0x40);
+
+	/* CPLD init with HDMI input mux */
+	cpld_init(hdcap, 0x02);
+
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+
+	/* probably not needed */
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+
+	ret = hdmi_poll_signal(hdcap);
+	if (ret < 0)
+		return ret;
+
+	v4l2_ctrl_handler_setup(&hdcap->ctrl);
+
+	dev_info(hdcap->dev, "hdmi_init: complete (%dx%d)\n",
+		 hdcap->width, hdcap->height);
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* Main component init entry point                                    */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_component_init(struct usb3hdcap *hdcap)
+{
+	const struct component_mode *mode;
+	int ret, use_height;
+
+	hdcap->mst_current_bank = -1;
+
+	mst3367_config(hdcap);
+
+	/* TW9900 power-down */
+	u3hc_i2c_write(hdcap, ADDR_TW9900, 0x06, 0x0e);
+	u3hc_i2c_write(hdcap, ADDR_TW9900, 0x1a, 0x40);
+
+	/* CPLD init with component input mux */
+	cpld_init(hdcap, 0x80);
+
+	/* RxSwitchSource: 0x21 = component ADC (YPbPr) */
+	mst_bank(hdcap, 0x00);
+	u3hc_i2c_write(hdcap, ADDR_MST3367, 0x51, 0x21);
+
+	/* Component CPLD routing, bit 4 = component input? */
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
+
+	mst3367_adc_config(hdcap);
+
+	/*
+	 * Wait for ADC to stabilize, windows driver does this but might be able
+	 * to decrease wait
+	 */
+	msleep(1000);
+
+	/* Final CPLD verify */
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
+
+	ret = component_poll_signal(hdcap, &mode);
+	if (ret < 0)
+		return ret;
+
+	u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x00, 0xff, 0x02);
+
+	component_write_scaler(hdcap, mode);
+
+	v4l2_ctrl_handler_setup(&hdcap->ctrl);
+
+	use_height = hdcap->interlaced ? hdcap->height * 2 : hdcap->height;
+	dev_info(hdcap->dev, "component_init: complete (%dx%d%s)\n",
+		 hdcap->width, use_height,
+		 hdcap->interlaced ? "i" : "p");
+	return 0;
+}
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap-video.c b/drivers/staging/media/usb3hdcap/usb3hdcap-video.c
new file mode 100644
index 000000000000..bcd61cea17f0
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap-video.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP video streaming - stream parser, ISO URB handling, vb2 ops
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "usb3hdcap.h"
+
+/* ------------------------------------------------------------------ */
+/* Stream parser                                                      */
+/* ------------------------------------------------------------------ */
+
+static void vyuy_to_yuyv(u8 *dst, const u8 *src, int len)
+{
+	int k;
+
+	/* VYUY: V Y0 U Y1 -> YUYV: Y0 U Y1 V */
+	for (k = 0; k < len; k += 4) {
+		dst[k + 0] = src[k + 1]; /* Y0 */
+		dst[k + 1] = src[k + 2]; /* U */
+		dst[k + 2] = src[k + 3]; /* Y1 */
+		dst[k + 3] = src[k + 0]; /* V */
+	}
+}
+
+static struct hdcap_buf *get_next_buf(struct usb3hdcap *hdcap)
+{
+	struct hdcap_buf *buf = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	if (!list_empty(&hdcap->bufs)) {
+		buf = list_first_entry(&hdcap->bufs, struct hdcap_buf, list);
+		list_del(&buf->list);
+	}
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+
+	return buf;
+}
+
+static void deliver_frame(struct usb3hdcap *hdcap)
+{
+	struct hdcap_buf *buf = hdcap->cur_buf;
+	u8 *vaddr;
+	int k;
+
+	if (!buf)
+		return;
+
+	hdcap->frames_delivered++;
+
+	/* Pad remaining lines with black */
+	vaddr = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	while (hdcap->frame_line < hdcap->height) {
+		u8 *row = vaddr + hdcap->frame_line * hdcap->bpl;
+
+		for (k = 0; k < hdcap->bpl; k += 4) {
+			row[k + 0] = 0x10;
+			row[k + 1] = 0x80;
+			row[k + 2] = 0x10;
+			row[k + 3] = 0x80;
+		}
+		hdcap->frame_line++;
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0,
+			      hdcap->bpl * hdcap->height);
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	if (hdcap->interlaced) {
+		buf->vb.field = hdcap->is_second_field ? V4L2_FIELD_BOTTOM : V4L2_FIELD_TOP;
+		buf->vb.sequence = hdcap->sequence;
+		if (hdcap->is_second_field)
+			hdcap->sequence++;
+		hdcap->is_second_field ^= 1;
+	} else {
+		buf->vb.field = V4L2_FIELD_NONE;
+		buf->vb.sequence = hdcap->sequence++;
+	}
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	hdcap->cur_buf = NULL;
+}
+
+/*
+ * Process one video line (shared between composite and HDMI).
+ * 'video' points to the XY byte followed by pixel data.
+ */
+static void process_video_line(struct usb3hdcap *hdcap, const u8 *video)
+{
+	u8 sav_xy = video[0];
+	int blanking = sav_xy & BT656_V_BIT;
+
+	/* Blanking -> active transition */
+	if (!blanking && hdcap->was_blanking) {
+		if (!hdcap->synced)
+			hdcap->synced = 1;
+		if (hdcap->cur_buf && hdcap->frame_line >= 100)
+			deliver_frame(hdcap);
+		hdcap->frame_line = 0;
+		if (!hdcap->cur_buf)
+			hdcap->cur_buf = get_next_buf(hdcap);
+	}
+	hdcap->was_blanking = blanking;
+
+	if (!hdcap->synced || !hdcap->cur_buf || blanking)
+		return;
+
+	/* Deliver when field is full */
+	if (hdcap->frame_line >= hdcap->height) {
+		deliver_frame(hdcap);
+		hdcap->frame_line = 0;
+		hdcap->cur_buf = get_next_buf(hdcap);
+		if (!hdcap->cur_buf)
+			return;
+	}
+
+	vyuy_to_yuyv(vb2_plane_vaddr(&hdcap->cur_buf->vb.vb2_buf, 0)
+			+ hdcap->frame_line * hdcap->bpl,
+		     video, hdcap->bpl);
+	hdcap->frame_line++;
+}
+
+static void process_data(struct usb3hdcap *hdcap)
+{
+	u8 *buf = hdcap->parse_buf;
+	int line_size = SAV_LEN + hdcap->bpl;
+	int pos = 0;
+
+	while (pos + 3 <= hdcap->parse_len) {
+		if (buf[pos] != 0xff || buf[pos + 1] != 0x00) {
+			pos++;
+			continue;
+		}
+
+		if (buf[pos + 2] == 0x00) {
+			/* SAV: video line */
+			if (pos + line_size > hdcap->parse_len)
+				break;
+			/*
+			 * -1 because on this hardware, XY byte occupies the first pixel's
+			 * V position
+			 */
+			process_video_line(hdcap, buf + pos + SAV_LEN - 1);
+			pos += line_size;
+		} else if (buf[pos + 2] == 0xff) {
+			u8 type;
+			int alen;
+
+			if (pos + MARKER_LEN > hdcap->parse_len)
+				break;
+			type = buf[pos + 3];
+			if (type < 0x02 || type > 0x04) {
+				pos++;
+				continue;
+			}
+			alen = type * 4;
+			if (pos + MARKER_LEN + alen > hdcap->parse_len)
+				break;
+			hdcap->markers_found++;
+			usb3hdcap_audio_data(hdcap, buf + pos + MARKER_LEN, alen);
+			pos += MARKER_LEN + alen;
+		} else {
+			pos++;
+		}
+	}
+
+	/* Shift unconsumed data to front */
+	if (pos > 0) {
+		hdcap->parse_len -= pos;
+		if (hdcap->parse_len > 0)
+			memmove(buf, buf + pos, hdcap->parse_len);
+	}
+}
+
+/* ------------------------------------------------------------------ */
+/* Isochronous URB handling                                           */
+/* ------------------------------------------------------------------ */
+
+static void usb3hdcap_iso_cb(struct urb *urb)
+{
+	struct usb3hdcap *hdcap = urb->context;
+	int k, ret;
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -ENODEV:
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		return;
+	default:
+		dev_warn(hdcap->dev, "ISO URB status %d\n", urb->status);
+		goto resubmit;
+	}
+
+	hdcap->iso_cb_count++;
+
+	for (k = 0; k < urb->number_of_packets; k++) {
+		int status = urb->iso_frame_desc[k].status;
+		int len = urb->iso_frame_desc[k].actual_length;
+		u8 *data = urb->transfer_buffer +
+			   urb->iso_frame_desc[k].offset;
+
+		if (status != 0 || len == 0)
+			continue;
+
+		if (hdcap->parse_len + len > PARSE_BUF_SIZE) {
+			hdcap->parse_len = 0;
+			continue;
+		}
+
+		memcpy(hdcap->parse_buf + hdcap->parse_len, data, len);
+		hdcap->parse_len += len;
+		hdcap->iso_bytes += len;
+	}
+
+	process_data(hdcap);
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret < 0)
+		dev_warn(hdcap->dev, "ISO URB resubmit: %d\n", ret);
+}
+
+static struct urb *usb3hdcap_alloc_urb(struct usb3hdcap *hdcap)
+{
+	struct urb *urb;
+	int size = hdcap->iso_size;
+	int k;
+
+	urb = usb_alloc_urb(NUM_ISO_PKTS, GFP_KERNEL);
+	if (!urb)
+		return NULL;
+
+	urb->dev = hdcap->usb_dev;
+	urb->context = hdcap;
+	urb->pipe = usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO);
+	urb->interval = 1;
+	urb->transfer_flags = URB_ISO_ASAP;
+	urb->transfer_buffer = kcalloc(NUM_ISO_PKTS, size, GFP_KERNEL);
+	if (!urb->transfer_buffer) {
+		usb_free_urb(urb);
+		return NULL;
+	}
+	urb->complete = usb3hdcap_iso_cb;
+	urb->number_of_packets = NUM_ISO_PKTS;
+	urb->transfer_buffer_length = size * NUM_ISO_PKTS;
+	for (k = 0; k < NUM_ISO_PKTS; k++) {
+		urb->iso_frame_desc[k].offset = size * k;
+		urb->iso_frame_desc[k].length = size;
+	}
+
+	return urb;
+}
+
+static void usb3hdcap_stop(struct usb3hdcap *hdcap)
+{
+	int k;
+	unsigned long flags;
+
+	for (k = 0; k < NUM_XFERS; k++) {
+		struct urb *urb = hdcap->isoc_urbs[k];
+
+		if (!urb)
+			continue;
+		usb_kill_urb(urb);
+		kfree(urb->transfer_buffer);
+		usb_free_urb(urb);
+		hdcap->isoc_urbs[k] = NULL;
+	}
+
+	/* already NULL if this stop came from a disconnect */
+	if (hdcap->usb_dev) {
+		vendor_out(hdcap, REQ_STREAM, 0x0000, 0, NULL, 0);
+		usb_set_interface(hdcap->usb_dev, 0, 0);
+	}
+
+	/* Return any in-progress buffer */
+	if (hdcap->cur_buf) {
+		vb2_buffer_done(&hdcap->cur_buf->vb.vb2_buf,
+				VB2_BUF_STATE_ERROR);
+		hdcap->cur_buf = NULL;
+	}
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	while (!list_empty(&hdcap->bufs)) {
+		struct hdcap_buf *buf = list_first_entry(&hdcap->bufs,
+						struct hdcap_buf, list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		list_del(&buf->list);
+	}
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+
+	vfree(hdcap->parse_buf);
+	hdcap->parse_buf = NULL;
+}
+
+static int usb3hdcap_start(struct usb3hdcap *hdcap)
+{
+	struct usb_host_endpoint *ep;
+	int maxp, burst, mult;
+	int k, ret, alt;
+
+	if (!hdcap->hw_inited) {
+		ret = usb3hdcap_hw_init(hdcap);
+		if (ret < 0) {
+			dev_err(hdcap->dev, "open: hw_init failed: %d\n", ret);
+			return ret;
+		}
+		hdcap->hw_inited = 1;
+	}
+
+	hdcap->parse_buf = vzalloc(PARSE_BUF_SIZE);
+	if (!hdcap->parse_buf)
+		return -ENOMEM;
+	hdcap->parse_len = 0;
+	hdcap->frame_line = 0;
+	hdcap->synced = 0;
+	hdcap->was_blanking = 0;
+	hdcap->is_second_field = 0;
+	hdcap->cur_buf = NULL;
+
+	if (hdcap->input == INPUT_HDMI) {
+		/*
+		 * this is a register watchlist, interrupt generated n endpoint 1 when
+		 * (value & mask) changes.
+		 *
+		 * struct reg_watch {
+		 *   uint8_t reg;
+		 *   // 0x80-0x82: MST3367 bank n&0x7f, 0x40: look at I2C addr
+		 *   uint8_t bank_or_source;
+		 *   uint8_t value_mask;
+		 *   uint8_t i2c_addr; // for bank_or_source == 0x40
+		 * };
+		 */
+		u8 stream_payload[] = {
+			0x55, 0x80, 0x3c, 0x00,  0x6a, 0x80, 0x0f, 0x00,
+			0x6b, 0x80, 0xfe, 0x00,  0x57, 0x80, 0x3f, 0x00,
+			0x58, 0x80, 0x80, 0x00,  0x59, 0x80, 0x3f, 0x00,
+			0x5a, 0x80, 0xf0, 0x00,  0x5b, 0x80, 0x07, 0x00,
+			0x5c, 0x80, 0xfe, 0x00,  0x5f, 0x80, 0x02, 0x00,
+			0x01, 0x81, 0x07, 0x00,  0x29, 0x82, 0x1f, 0x00,
+			0x28, 0x82, 0xff, 0x00,  0x0b, 0x82, 0xdf, 0x00,
+			0x0c, 0x82, 0x3f, 0x00,  0x0e, 0x82, 0x08, 0x00,
+			0x48, 0x82, 0x60, 0x00,  0x9b, 0x82, 0xf0, 0x00,
+			0x11, 0x82, 0xff, 0x00,  0x12, 0x82, 0xff, 0x00,
+			0x11, 0x82, 0xff, 0x00,  0x12, 0x82, 0xff, 0x00,
+		};
+		ret = vendor_out(hdcap, REQ_STREAM, 0x0032, 1,
+				 stream_payload, sizeof(stream_payload));
+	} else if (hdcap->input == INPUT_COMPONENT) {
+		/* Component: monitor MST3367 ADC registers */
+		u8 stream_payload[] = {
+			0x14, 0x80, 0x90, 0x00,  0x15, 0x80, 0x46, 0x00,
+			0x5b, 0x80, 0x07, 0x00,  0x5c, 0x80, 0xf8, 0x00,
+			0x57, 0x80, 0x3f, 0x00,  0x5f, 0x80, 0x12, 0x00,
+			0x11, 0x82, 0xff, 0x00,  0x12, 0x82, 0xff, 0x00,
+		};
+		ret = vendor_out(hdcap, REQ_STREAM, 0x0032, 1,
+				 stream_payload, sizeof(stream_payload));
+	} else {
+		u8 stream_payload[] = {
+			0x01, 0x40, 0xe9, 0x88,
+			0x1c, 0x40, 0xf0, 0x88,
+			0x30, 0x40, 0x0f, 0x88,
+		};
+		v4l2_ctrl_handler_setup(&hdcap->ctrl);
+		ret = vendor_out(hdcap, REQ_STREAM, 0x0032, 1,
+				 stream_payload, sizeof(stream_payload));
+	}
+
+	if (ret < 0) {
+		vfree(hdcap->parse_buf);
+		hdcap->parse_buf = NULL;
+		return ret;
+	}
+
+	/*
+	 * Select alt setting based on bandwidth:
+	 * alt 1: maxp=1024 burst=16 mult=1 -> 16KB/pkt (SD)
+	 * alt 2: maxp=1024 burst=16 mult=2 -> 32KB/pkt (HD)
+	 */
+	alt = (hdcap->width > 720 || hdcap->height > 576) ? 2 : 1;
+	dev_info(hdcap->dev, "%s: setting alt %d\n", __func__, alt);
+	ret = usb_set_interface(hdcap->usb_dev, 0, alt);
+
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s: usb_set_interface failed: %d\n",
+			__func__, ret);
+		vfree(hdcap->parse_buf);
+		hdcap->parse_buf = NULL;
+		return ret;
+	}
+
+	/* Compute ISO packet size from SS endpoint companion descriptor */
+	ep = usb_pipe_endpoint(hdcap->usb_dev,
+			       usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO));
+	if (!ep) {
+		dev_err(hdcap->dev, "ISO endpoint 0x%02x not found\n",
+			EP_VIDEO);
+		return -ENODEV;
+	}
+
+	maxp = usb_endpoint_maxp(&ep->desc);
+	burst = ep->ss_ep_comp.bMaxBurst;
+	mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
+	hdcap->iso_size = maxp * (burst + 1) * mult;
+
+	for (k = 0; k < NUM_XFERS; k++) {
+		struct urb *urb = usb3hdcap_alloc_urb(hdcap);
+
+		if (!urb) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+		hdcap->isoc_urbs[k] = urb;
+
+		ret = usb_submit_urb(urb, GFP_KERNEL);
+		if (ret < 0)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	usb3hdcap_stop(hdcap);
+	return ret;
+}
+
+/* ------------------------------------------------------------------ */
+/* vb2 ops                                                            */
+/* ------------------------------------------------------------------ */
+
+static int usb3hdcap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+	struct device *alloc_devs[])
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+	unsigned int img_size = hdcap->bpl * hdcap->height;
+
+	if (*nplanes) {
+		dev_info(hdcap->dev, "queue_setup: recheck sizes[0]=%u vs %u\n",
+			 sizes[0], img_size);
+		return sizes[0] < img_size ? -EINVAL : 0;
+	}
+	*nplanes = 1;
+	sizes[0] = img_size;
+
+	return 0;
+}
+
+static void usb3hdcap_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vb->vb2_queue);
+	struct hdcap_buf *buf = container_of(vbuf, struct hdcap_buf, vb);
+	unsigned long flags;
+
+	if (!hdcap->usb_dev) {
+		dev_warn(hdcap->dev, "buf_queue: usb_dev is NULL\n");
+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	list_add_tail(&buf->list, &hdcap->bufs);
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+}
+
+static int usb3hdcap_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+	int ret;
+
+	if (!hdcap->usb_dev) {
+		dev_err(hdcap->dev, "start_streaming: usb_dev is NULL\n");
+		return -ENODEV;
+	}
+
+	hdcap->sequence = 0;
+	ret = usb3hdcap_start(hdcap);
+	return ret;
+}
+
+static void usb3hdcap_stop_streaming(struct vb2_queue *vq)
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+
+	if (hdcap->usb_dev)
+		usb3hdcap_stop(hdcap);
+}
+
+const struct vb2_ops usb3hdcap_vb2_ops = {
+	.queue_setup = usb3hdcap_queue_setup,
+	.buf_queue = usb3hdcap_buf_queue,
+	.start_streaming = usb3hdcap_start_streaming,
+	.stop_streaming = usb3hdcap_stop_streaming,
+};
diff --git a/drivers/staging/media/usb3hdcap/usb3hdcap.h b/drivers/staging/media/usb3hdcap/usb3hdcap.h
new file mode 100644
index 000000000000..2ebe91cd6673
--- /dev/null
+++ b/drivers/staging/media/usb3hdcap/usb3hdcap.h
@@ -0,0 +1,234 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef USB3HDCAP_H
+#define USB3HDCAP_H
+
+#include <linux/usb.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+struct snd_card;
+struct snd_pcm_substream;
+
+#define USB3HDCAP_V4L2_STDS (V4L2_STD_NTSC | V4L2_STD_PAL)
+
+/* NTSC SD frame format */
+#define SD_WIDTH       720
+#define NTSC_HEIGHT    480
+/* YUYV = 4 bytes/2 pixels */
+#define DEFAULT_BPL    (SD_WIDTH * 2)
+/* PAL SD frame format */
+#define PAL_HEIGHT    576
+
+enum usb3hdcap_input {
+	INPUT_COMPOSITE = 0,
+	INPUT_SVIDEO    = 1,
+	INPUT_COMPONENT = 2,
+	INPUT_HDMI      = 3,
+};
+
+/* I2C 8-bit addresses */
+#define ADDR_MST3367 0x9c
+#define ADDR_TW9900  0x88
+#define ADDR_CS53L21 0x94
+#define ADDR_CPLD    0x98
+#define ADDR_MCU     0x64 /* Nuvoton NUC100 on XCAPTURE-1 */
+
+/* TW9900 registers */
+#define TW9900_CSTATUS    0x01
+#define TW9900_INFORM     0x02
+#define TW9900_OPFORM     0x03
+#define TW9900_OPCNTL_I   0x05
+#define TW9900_ACNTL_I    0x06
+#define TW9900_CROP_HI    0x07
+#define TW9900_VDELAY_LO  0x08
+#define TW9900_VACTIVE_LO 0x09
+#define TW9900_HDELAY_LO  0x0a
+#define TW9900_HACTIVE_LO 0x0b
+#define TW9900_CNTRL2     0x0d
+#define TW9900_SDT_NOISE  0x0e
+#define TW9900_LUMA_CTL   0x0f
+#define TW9900_BRIGHT     0x10
+#define TW9900_CONTRAST   0x11
+#define TW9900_SHARPNESS  0x12
+#define TW9900_SAT_U      0x13
+#define TW9900_SAT_V      0x14
+#define TW9900_HUE        0x15
+#define TW9900_VBICNTL    0x19
+#define TW9900_ACNTL_II   0x1a
+#define TW9900_OPCNTL_II  0x1b
+#define TW9900_SDT        0x1c
+#define TW9900_SDTR       0x1d
+#define TW9900_VCNTL1     0x28
+#define TW9900_VCNTL2     0x29
+#define TW9900_MISC1      0x2d
+#define TW9900_MISC2      0x2f
+#define TW9900_CSTATUS_II 0x31
+#define TW9900_ANAPLLCTL  0x4c
+#define TW9900_VVBI       0x55
+#define TW9900_HSBEGIN    0x6b
+#define TW9900_HSEND      0x6c
+#define TW9900_OVSDLY     0x6d
+#define TW9900_OVSEND     0x6e
+
+/* TW9900 bit definitions */
+#define TW9900_NINTL         0x08
+#define TW9900_STDNOW_SHIFT  4
+#define TW9900_STDNOW_MASK   0x70
+#define TW9900_STD_NTSC_M    0
+#define TW9900_STD_PAL_BDGHI 1
+#define TW9900_STD_SECAM     2
+#define TW9900_STD_NTSC_4_43 3
+#define TW9900_STD_PAL_M     4
+#define TW9900_STD_PAL_CN    5
+#define TW9900_STD_PAL_60    6
+
+/* CS53L21 registers */
+#define CS53L21_MIC_PWR_CTL  0x03
+#define CS53L21_IFACE_CTL    0x04
+#define CS53L21_ADC_IN_SEL   0x07
+#define CS53L21_SPE_CTL      0x09
+#define CS53L21_ALC_PGAA     0x0a
+#define CS53L21_ALC_PGAB     0x0b
+#define CS53L21_ADCA_ATT     0x0c
+#define CS53L21_ADCB_ATT     0x0d
+#define CS53L21_ADCA_MIX_VOL 0x0e
+#define CS53L21_ADCB_MIX_VOL 0x0f
+#define CS53L21_CH_MIXER     0x18
+#define CS53L21_ALC_EN_ATK   0x1c
+
+/* Vendor request codes */
+#define REQ_I2C    0xc0
+#define REQ_GPIO   0xc1
+#define REQ_INIT   0xc2
+#define REQ_STREAM 0xc6
+#define REQ_UNK_C7 0xc7
+
+/* Isochronous transfer parameters */
+#define EP_VIDEO     0x83
+#define NUM_XFERS    8
+#define NUM_ISO_PKTS 64
+
+/*
+ * Stream framing: two element types in the byte stream, both
+ * starting with ff 00:
+ *   SAV (ff 00 00 XY): bpl-1 pixel bytes, -1 because the XY is actually
+ *   in the first pixel's V position... weird but it's correct
+ *   Marker (ff 00 ff NN):  audio - NN = number of stereo s16le
+ *                          samples, audio data = NN * 4 bytes
+ */
+#define SAV_LEN        4
+#define MARKER_LEN     4
+#define PARSE_BUF_SIZE (2 * 1024 * 1024)
+
+/* BT.656 SAV XY bits */
+#define BT656_F_BIT 0x40
+#define BT656_V_BIT 0x20
+
+struct hdcap_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+};
+
+struct usb3hdcap {
+	struct device *dev;
+	struct usb_device *usb_dev;
+	struct v4l2_device v4l2_dev;
+	struct video_device video_dev;
+	struct vb2_queue vb2q;
+
+	struct v4l2_ctrl_handler ctrl;
+	struct v4l2_ctrl *ctrl_brightness;
+	struct v4l2_ctrl *ctrl_contrast;
+	struct v4l2_ctrl *ctrl_saturation;
+	struct v4l2_ctrl *ctrl_hue;
+	struct v4l2_ctrl *ctrl_sharpness;
+	struct v4l2_ctrl *ctrl_rx_power;
+
+	/* protects V4L2 ioctls and device state */
+	struct mutex v4l2_lock;
+	/* protects videobuf2 queue operations */
+	struct mutex vb2q_lock;
+
+	/* buffer list */
+	spinlock_t buflock;
+	struct list_head bufs;
+
+	/* ISO URBs */
+	int iso_size;
+	struct urb *isoc_urbs[NUM_XFERS];
+
+	/* frame tracking */
+	unsigned int sequence;
+
+	/* input selection + format */
+	enum usb3hdcap_input input;
+	v4l2_std_id std;
+	v4l2_std_id requested_std;
+	int width;
+	int height;
+	int interlaced;
+	int bpl; /* width * 2 */
+
+	/* stream parser state */
+	u8 *parse_buf;
+	int parse_len;
+	struct hdcap_buf *cur_buf;
+	int frame_line;
+	int synced;
+	int was_blanking;
+	int is_second_field;
+
+	/* hardware init state */
+	int hw_inited;
+	int has_mcu; /* Nuvoton MCU present (XCAPTURE-1) */
+
+	/* MST3367 state */
+	int mst_current_bank;
+	struct v4l2_dv_timings detected_timings;
+	int detected_timings_present;
+	struct v4l2_dv_timings requested_timings;
+	int requested_timings_present;
+
+	/* ALSA audio */
+	struct snd_card *snd;
+	struct snd_pcm_substream *snd_substream;
+	atomic_t snd_stream;
+	size_t snd_buffer_pos;
+	size_t snd_period_pos;
+
+	/* diagnostics */
+	unsigned int iso_cb_count;
+	unsigned long iso_bytes;
+	unsigned int markers_found;
+	unsigned int frames_delivered;
+};
+
+/* USB control helpers (usb3hdcap-core.c) */
+int vendor_out(struct usb3hdcap *hdcap, u8 request, u16 value, u16 index,
+	       u8 *data, u16 len);
+int u3hc_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val);
+int u3hc_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg);
+int u3hc_i2c_rmw(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits);
+int u3hc_i2c_rmw_get_old(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits, u8 *old);
+int usb3hdcap_hw_init(struct usb3hdcap *hdcap);
+
+/* Composite (usb3hdcap-composite.c) */
+int usb3hdcap_composite_init(struct usb3hdcap *hdcap);
+
+/* HDMI + Component (usb3hdcap-hdmi.c) */
+int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap);
+int usb3hdcap_component_init(struct usb3hdcap *hdcap);
+void mst3367_write_csc(struct usb3hdcap *hdcap);
+
+/* Video/streaming (usb3hdcap-video.c) */
+extern const struct vb2_ops usb3hdcap_vb2_ops;
+
+/* Audio (usb3hdcap-audio.c) */
+int usb3hdcap_cs53l21_init(struct usb3hdcap *hdcap);
+int usb3hdcap_audio_init(struct usb3hdcap *hdcap);
+void usb3hdcap_audio_free(struct usb3hdcap *hdcap);
+void usb3hdcap_audio_data(struct usb3hdcap *hdcap, const u8 *data, int len);
+
+#endif
-- 
2.47.3


