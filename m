Return-Path: <linux-media+bounces-55557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAUAOqdJs2kJUQAAu9opvQ
	(envelope-from <linux-media+bounces-55557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740D27B3AD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A87331459D1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C41D3AF663;
	Thu, 12 Mar 2026 23:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoDS+HG2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8839D6ED
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357460; cv=none; b=ua2s//lHM1i3eKREb2IiLqmqkULmEJmm5LibbfkOaCugBlSuQHMOP5gaqIlgRlq9x1xJFw1WrvpWtV/9JzN36LXMCG9CIP+Rpe9d7dSC7Yk7lAYHpl5zU9I047wVKAoIkrssNGAh/lzg92bxUL5WOkX7GEj4+KKEY0dBGIWqf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357460; c=relaxed/simple;
	bh=Bo1SnDNSAj5ZYWepzjHdv3hBFUNwfXUROgxanB1Rwhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la3ASVSPes8FyFeC3D2tN+UjLU5iAdMWbQPDJXWpwnNWj5TVs0RFSAqFN3mtLV2rZzoR6O4gEBmTYVEYw1AtJzapgJ5KVVkBLnOtFgBEeXXOq+HjBg+5q3y6i0wDOMScXXbHTmVRxhhZ7R4MTx+zu74yDvkKDoyXbjuU8knXvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoDS+HG2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358dff8447cso169114a91.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773357458; x=1773962258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIaf3x8xjAlsrE68JYAsh8jSNNqCyGPC00OSVKpEMxc=;
        b=JoDS+HG2rJ0BkYZVjiA2ibA6KFtymMXmVXnWC3i0jTOF4Gv53nBp6OVsF5ipi+Yfq9
         rZb6e/GVZgbGVoTK//lYCgFsQYHEUUUjC+5fo2CJH/Lj57b/WhQ63jtcRb0+s3w/ypBq
         mC8p340/3IDJzI3i6FzCJ0lNtkOZosJMIo1sT1/wSI/fZxzhLqCgmAzsFw/cleDKHNBF
         /bYoPgd4JsXR+tPLg6nvDMZWf8y9rkhO/c1sUigD3cSg6srMid+PfPflurWjySIjrD1u
         C7C/LpLqQQ+gY/jlJ/eiT5TT3Omxg2s1a6FbPRRLcfyWpo0dnO00cOsUq7B4x+CYXnt5
         +5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357458; x=1773962258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dIaf3x8xjAlsrE68JYAsh8jSNNqCyGPC00OSVKpEMxc=;
        b=c6hon+Gh3n6oKLAFETylKz2dQ4GhoPaZ852+7fUigc5kHzSwFp5BXOs52oez3rQFAZ
         s9KU18EJl+C5nWWRPDAe8KP0pqyxhEeJkSnGrHVtyqaNLIW9P1/dV6MuJn+EF4fnM2Nc
         c9XCQqz/iI077u/LnkhtKgp57N7JHSrVw9IdgShhnF15ArevT/Xfoi6ltGrF7EFSGFGv
         onfy57LT+1SeX8izisdiMMeqjJcL0XNBxicSceWLj8DS5WJtmPp5+quH5zJEwCRisNDj
         Ew7bXbYTStP82dnYvbuv91nuuSCyi7YcAFBuAczaysWoC6liaFdSgr4dUbdrIX/BVt34
         3t/A==
X-Forwarded-Encrypted: i=1; AJvYcCWtFeLsSUEu38UZj3XWRGsqVEU1/PwVFmmlI6vAIzXoSMIOEWi7o7K6yPK1kcowIUWlH3Xfb5QJvtcwug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFlx89uiIq2GMLSrNXRsc+6lkyER06xYE8isO7uATLEZ4BxOF8
	y1EnV8Hy7Z7P2uPYah3nMRy1cBqa7CsPHox40DFjt30yMCkHgjVlcPi9
X-Gm-Gg: ATEYQzwPcGN8tjSwkXPe7c9SLovltXcr1oJS/vCu03pmMGbE3gqeQ7F3uZzM8NgBmm7
	Sw7oSRS35EMmitJ19FDbkQ721ktbrYDbsljRpIsQyJZl0Jak9TK+kIDp88e/lvyOmEpNWlQCwEc
	EBB6IaQUFoitBNRCyp32TzFqu3L8YwCQ+WQwZgsDfFsiXeRF7TZP1BlKHAj3E88c6tmrr3B7I2h
	rN/EbPyOl0JmYAemqY+w8jByOSkXfHFq4olljrkwhH7JvTigphQad93IxsGU93WN3vTmQSGxkDF
	F4RUK/Xwu9pB2CRmq9/WqWDeC4rRSnh4cDAvI7jQjCS0o1uZj8Mjr31b835TFNZeiE9KYXMQn33
	L0ys5ej+Zd4Vtn40eo5+syQ2CwPymwDvmOE+rYWHlvW76/Mw0uAuwmrLLKa+cfpRjkWOxr7dlBm
	YRlGN9mq+sku0lgIxRWoI6sOuMs0yTiGKMFf+v3uP9n7EQMVzjmwna+Fg=
X-Received: by 2002:a17:902:e810:b0:2ae:44dd:3377 with SMTP id d9443c01a7336-2aeca90943bmr7406165ad.1.1773357458023;
        Thu, 12 Mar 2026 16:17:38 -0700 (PDT)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:3685:315:53bf:61fc])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aece81cde8sm619395ad.70.2026.03.12.16.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 16:17:37 -0700 (PDT)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH RESEND v3 2/3] media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
Date: Thu, 12 Mar 2026 16:16:15 -0700
Message-ID: <20260312231616.3590215-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312231616.3590215-1-faizel.kb@gmail.com>
References: <20260312231616.3590215-1-faizel.kb@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55557-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5740D27B3AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/media/test-drivers/vimc/vimc-sensor.c | 88 +++++++++++++++++++
 2 files changed, 101 insertions(+)

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
index 4c64cdab8cda..5deebcc78a33 100644
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
@@ -108,6 +133,24 @@ static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)
 	vimc_colorimetry_clamp(fmt);
 }
 
+static u32 vimc_calc_vblank(u32 width, u32 height,
+			    s64 pixel_rate, s32 hblank)
+{
+	u32 hts = width + hblank;
+	u32 target_fps;
+	u64 vts;
+
+	target_fps = (width * height <= VIMC_PIXELS_THRESHOLD_30FPS) ? 30 : 10;
+
+	vts = (u64)pixel_rate;
+	do_div(vts, target_fps * hts);
+
+	if (vts > height)
+		return clamp((u32)(vts - height), VIMC_VBLANK_MIN, VIMC_VBLANK_MAX);
+
+	return VIMC_VBLANK_MIN;
+}
+
 static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state,
 			       struct v4l2_subdev_format *fmt)
@@ -137,6 +180,20 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
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
@@ -222,6 +279,8 @@ static int vimc_sensor_s_stream(struct v4l2_subdev *sd, int enable)
 
 		vsensor->hw.size.width = format->width;
 		vsensor->hw.size.height = format->height;
+		vimc_sensor_update_frame_timing(sd, format->width,
+						format->height);
 
 		v4l2_subdev_unlock_state(state);
 
@@ -293,6 +352,15 @@ static int vimc_sensor_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -377,6 +445,26 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
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


