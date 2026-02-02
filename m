Return-Path: <linux-media+bounces-52060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHh9L/4AgWlyDgMAu9opvQ
	(envelope-from <linux-media+bounces-52060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:54:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EDD0D7A
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2729D3065DE7
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 19:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7384530DD21;
	Mon,  2 Feb 2026 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFvxUsoH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92130C35E
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 19:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061630; cv=none; b=NOERxbQ0Ma8U2TtjxF1zkW1hyUmrVuO1zDsWflzyE07KixFwFGV+C2OKn2Aona4uSYFzQ3ftlWULezRzKJ6XHZEqhZHNQHqGuAbEKtbeYzykMCmV3zqABmAFR3DYEGGf/3/4O8iEssQVFymbrIkmuQvQyDQZobuWD0jztsxsjgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061630; c=relaxed/simple;
	bh=tKCi4tZRBEiUJVkeeqRe/r3JrwTleP9fceRJKLOJJHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYTZlRjw39WaSTFXtvvQExTEsEWyd7WiQMOJaH2ojWbXZ9HXlRvbEGVsA3u6Gdfhq2I1fYauhbIGfGzXBXC830v9fLuTClbxWzQSo9xod5xBzWGk0qomjWClO7amu2ZgxYhRmAQa/Qwy+1hKY6cJBcvZRMEQnWFYgHsmMKBeFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFvxUsoH; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c1e0e7f21dfso289277a12.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 11:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770061629; x=1770666429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkX201pGc8zZ3+cPLNIedhLkaj9hw8wjTG/zVIPjTJE=;
        b=BFvxUsoHWogxvb2+c1jt1pBHY3+UfQbwdtS9TeAM0ajhQ5YbkdMLGpuG1LVOR8U1cj
         V+5H8iK8uc9/cuupwfosiF5YY9AUN4IX6u3cvTqeHght1Mzx7AfkHdnrOqyPdhquJlCt
         0xahu5ZQKAE+DJVBPG2oRmtiKhSSHiUnCJOqUKitCJtwHkYIlLelfwlrjsZ5q/lyv2CK
         C4HYrp5NL6iznVzb8+W1KlssBE2+kq+fapngZzOxDwfP/KL4lbq4B4LI/oes9bcsc1Iw
         JBfSDftGK3G5HWfqp/6QxussKam8p4am158jxT9dO2cSH6e31tdTVpu+JCwu5lhwEwHx
         Y2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061629; x=1770666429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BkX201pGc8zZ3+cPLNIedhLkaj9hw8wjTG/zVIPjTJE=;
        b=wIAG9ivkdw6vjLpI4NR4lwWgOw8FzzcZG1YQuxJf31hito6nrepAUIhBFzBY43k92K
         Yw3oghq2eId16jb3qT4CYO+A8nJz0z0QtoLKylOkaWMSWPeNBob1OXGBk8eR5dvt3/BP
         VHMQQc3ZlbHL1rcKaXz+qTK5vgHHKcdg2iZq1DTxrhao2xx58pcLbPPv3ezaWzajvVp3
         2lLTZsNJ3JxBi80VpZfme6aSUDtTrYRyoCU7iI+Ugy9QswkFLzlQq50Wbl3q8hhAJS63
         oGYHq+K6N+fVg52kKfoZGj42kCOCneqp70fE6RejT/fu70cjn5WLxeMXnBpPEX/0YISL
         1JNg==
X-Forwarded-Encrypted: i=1; AJvYcCU9/Wc9a5iJofPlj2PZlyFlOcW2gaAcQoI64xR6dI+CNDZe42DdILWdIDwyDB862HQE3xqbV4Z1QEbZ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbxMhuHmygxfrI5EMV8AB3nnP/4UczJWQ4+Yuva+OXEiEvvrh
	MATxfNTEcOOlElJ1PLbr60vyoSykT3RzxYedejanYgA+WN9OMR0uYiwu
X-Gm-Gg: AZuq6aKqoCwNNOotQ2Veaj+QGA2eXNReLFfePNdR7B6oFhOqfygZeaMAk+Q1FHVvUs9
	54gBiyERmNB9KvY8fkqAzFz0h4l5zQG1S97H17NxMhVzcz39EyTf1Q72f3s7b1FS4P9mORi/nBB
	aRRZroXDYBe91f7hb62I7/btqzBju3RlUWgDfTRfMUwlc+y0k49rA0NhEyE6rJtTSJTyMcfqWwL
	IfxV0YyQDn1Uv9lbkNr3yez7TXOdrCxLbfROdxnV5lvdygR9bsPuN2pi3Hpgq+Tn9wFyDbSSHkc
	z647oppdY+b7OAdGay3Cc+LOfoLdePF5v3J6uO04ekoip7J1wfigHZOSA9xBlrQMohIPoF9xrwF
	fIKhRWu4HNObY6x9Oopv+nhzn26zdfOZynEhshNoWFHcDNMHvwlqySfW1J3K2IlXcnSSQtVR2iU
	rhzTZUYTRaKXSKeo/+E9D4/MatAgOK57vUQlYaz8r3DjzYv9L0RYONvA==
X-Received: by 2002:a05:6a20:734b:b0:38e:9a8b:248d with SMTP id adf61e73a8af0-392e0163a22mr9055261637.5.1770061628779;
        Mon, 02 Feb 2026 11:47:08 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:af0:4465:b482:1e01])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm16667416b3a.2.2026.02.02.11.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:47:08 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 2/3] media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
Date: Mon,  2 Feb 2026 11:46:44 -0800
Message-ID: <20260202194645.1287757-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202194645.1287757-1-faizel.kb@gmail.com>
References: <20260202194645.1287757-1-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52060-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.libcamera.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faizelkb@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF5EDD0D7A
X-Rspamd-Action: no action

pixel_rate and hblank as read only parameter. vblank can be configured
to match the desired frame rate.

Default values are, pixel_rate - 160 MHz, hblank - 800.
vblank defaults to an equivalent value of 30 fps for resolutions less than
or equal to 1920x1080 and 10 fps for higher resolutions. For higher
resolutions, modify pixel_rate in the driver code.
fps = pixel_rate / ((width + hblank) * (height + vblank))
minimum vblank - 4, maximum vblank - 65535

The configured fps delay is pre-calculated into jiffies and
stored in the sensor's hw structure for efficient access by the
streamer thread.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-common.h | 13 +++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 82 +++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 35789add6b4a..861b334ffc65 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -29,6 +29,15 @@
 #define VIMC_FRAME_MIN_WIDTH 16
 #define VIMC_FRAME_MIN_HEIGHT 16
 
+#define VIMC_PIXEL_RATE_FIXED		160000000	/* 160 MHz */
+#define VIMC_HBLANK_FIXED		800
+/* VBLANK - vertical blanking (primary FPS control) */
+#define VIMC_VBLANK_MIN			4
+#define VIMC_VBLANK_MAX			65535
+#define VIMC_VBLANK_STEP		1
+#define VIMC_VBLANK_DEFAULT	        3223           /* 30fps vga */
+#define VIMC_PIXELS_THRESHOLD_30FPS	(1920 * 1080) /* 2073600 pixels */
+
 #define VIMC_FRAME_INDEX(lin, col, width, bpp) ((lin * width + col) * bpp)
 
 /* Source and sink pad checks */
@@ -173,6 +182,9 @@ struct vimc_sensor_device {
 	struct tpg_data tpg;
 	struct v4l2_ctrl_handler hdl;
 	struct media_pad pad;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 
 	u8 *frame;
 
@@ -184,6 +196,7 @@ struct vimc_sensor_device {
 		struct v4l2_area size;
 		enum vimc_sensor_osd_mode osd_value;
 		u64 start_stream_ts;
+		unsigned long fps_jiffies;
 	} hw;
 };
 
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 2b07dc1f1278..84cef55b68f8 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -25,10 +25,15 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 static int vimc_sensor_init_state(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state)
 {
+	struct vimc_sensor_device *vsensor =
+		container_of(sd, struct vimc_sensor_device, sd);
+
 	struct v4l2_mbus_framefmt *mf;
 
 	mf = v4l2_subdev_state_get_format(sd_state, 0);
 	*mf = fmt_default;
+	vsensor->hw.size.width = fmt_default.width;
+	vsensor->hw.size.height = fmt_default.height;
 
 	return 0;
 }
@@ -87,6 +92,26 @@ static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor,
 	tpg_s_xfer_func(&vsensor->tpg, format->xfer_func);
 }
 
+static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
+					   u32 width, u32 height)
+{
+	struct vimc_sensor_device *vsensor =
+		container_of(sd, struct vimc_sensor_device, sd);
+	u64 pixel_rate = vsensor->pixel_rate->val;
+	u32 hts = width + vsensor->hblank->val;
+	u32 vts = height + vsensor->vblank->val;
+	u64 total_pixels = (u64)hts * vts;
+	u64 frame_interval_ns;
+
+	frame_interval_ns = total_pixels * NSEC_PER_SEC;
+	do_div(frame_interval_ns, pixel_rate);
+	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
+	if (vsensor->hw.fps_jiffies == 0)
+		vsensor->hw.fps_jiffies = 1;
+
+	return 0;
+}
+
 static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 {
 	const struct vimc_pix_map *vpix;
@@ -108,6 +133,18 @@ static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 	vimc_colorimetry_clamp(fmt);
 }
 
+static u32 vimc_calc_vblank(u32 width, u32 height,
+			    s64 pixel_rate, s32 hblank)
+{
+	u32 hts = width + hblank;
+	u32 target_fps;
+	u32 vblank_def;
+
+	target_fps = (width * height <= VIMC_PIXELS_THRESHOLD_30FPS) ? 30 : 10;
+	vblank_def = (pixel_rate / (target_fps * hts)) - height;
+	return clamp(vblank_def, VIMC_VBLANK_MIN, VIMC_VBLANK_MAX);
+}
+
 static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
@@ -137,6 +174,20 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 		fmt->format.xfer_func, fmt->format.ycbcr_enc);
 
 	*mf = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 vblank_def = vimc_calc_vblank(fmt->format.width,
+						  fmt->format.height,
+						  vsensor->pixel_rate->val,
+						  vsensor->hblank->val);
+		vsensor->hw.size.width = fmt->format.width;
+		vsensor->hw.size.height = fmt->format.height;
+		__v4l2_ctrl_modify_range(vsensor->vblank,
+					 VIMC_VBLANK_MIN,
+					 VIMC_VBLANK_MAX,
+					 VIMC_VBLANK_STEP,
+					 vblank_def);
+		__v4l2_ctrl_s_ctrl(vsensor->vblank, vblank_def);
+	}
 
 	return 0;
 }
@@ -222,6 +273,8 @@ static int vimc_sensor_s_stream(struct v4l2_subdev *sd, int enable)
 
 		vsensor->hw.size.width = format->width;
 		vsensor->hw.size.height = format->height;
+		vimc_sensor_update_frame_timing(sd, format->width,
+						format->height);
 
 		v4l2_subdev_unlock_state(state);
 
@@ -293,6 +346,15 @@ static int vimc_sensor_s_ctrl(struct v4l2_ctrl *ctrl)
 	case VIMC_CID_OSD_TEXT_MODE:
 		vsensor->hw.osd_value = ctrl->val;
 		break;
+	case V4L2_CID_PIXEL_RATE:
+		break;
+	case V4L2_CID_HBLANK:
+		break;
+	case V4L2_CID_VBLANK:
+		vimc_sensor_update_frame_timing(&vsensor->sd,
+						vsensor->hw.size.width,
+						vsensor->hw.size.height);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -377,6 +439,26 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
 			  V4L2_CID_HUE, -128, 127, 1, 0);
 	v4l2_ctrl_new_std(&vsensor->hdl, &vimc_sensor_ctrl_ops,
 			  V4L2_CID_SATURATION, 0, 255, 1, 128);
+	/* Timing controls for frame interval configuration */
+	vsensor->pixel_rate = v4l2_ctrl_new_std(&vsensor->hdl, &vimc_sensor_ctrl_ops,
+						V4L2_CID_PIXEL_RATE,
+						VIMC_PIXEL_RATE_FIXED, VIMC_PIXEL_RATE_FIXED,
+						1, VIMC_PIXEL_RATE_FIXED);
+	if (vsensor->pixel_rate)
+		vsensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vsensor->hblank = v4l2_ctrl_new_std(&vsensor->hdl, &vimc_sensor_ctrl_ops,
+					    V4L2_CID_HBLANK,
+					    VIMC_HBLANK_FIXED, VIMC_HBLANK_FIXED,
+					    1, VIMC_HBLANK_FIXED);
+	if (vsensor->hblank)
+		vsensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vsensor->vblank = v4l2_ctrl_new_std(&vsensor->hdl, &vimc_sensor_ctrl_ops,
+					    V4L2_CID_VBLANK,
+					    VIMC_VBLANK_MIN, VIMC_VBLANK_MAX,
+					    VIMC_VBLANK_STEP, VIMC_VBLANK_DEFAULT);
+
 	vsensor->sd.ctrl_handler = &vsensor->hdl;
 	if (vsensor->hdl.error) {
 		ret = vsensor->hdl.error;
-- 
2.43.0


