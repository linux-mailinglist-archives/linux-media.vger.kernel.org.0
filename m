Return-Path: <linux-media+bounces-52216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJMZCUOug2lOswMAu9opvQ
	(envelope-from <linux-media+bounces-52216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1CEC80F
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF48301E214
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 20:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C560B436352;
	Wed,  4 Feb 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw6Qo9Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067027B4FA
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237492; cv=none; b=p3mGVuT87VYVeHwvqO9RRgvxeRqmalO2SkLht7Lg2xbfuC38vusXN79qiU3bnyCZa0rCxXvYv+QQlot5IgzjykYBr18P0rYWPhh8REPkmMvtEh2bX1fFdjZ46tZM3bUFL2FYbbvy/so93fH4nyiGw6r6XbJ4Vn4N6WOLWVtbCfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237492; c=relaxed/simple;
	bh=7BXMgLsxaiZkDQXu1QIXEyfBsrlq/9hsR3mtcmjtcVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgxp6oXt3PWhtbKH1F4HuLW53btWyS3jA+exs9+6I1ETJrV4PhZm3oj2CNt+wsGX+oil7WcBBierYgBhiizTpu7vjRGjdkctEkVv0GJs0Yglk850/PTKPWN5L+FwbIB3MfnC7x+478+cLqlSZzPEZbsz0lR+eQV4DsqLYMpoXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw6Qo9Y0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a07fb1527cso503775ad.3
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237491; x=1770842291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YiPQWXH9LfFe5Ipw86gccMFuVs2bYaP/flxUeZTgEw=;
        b=hw6Qo9Y0QWBm4dVHD9YQMolJEhfhfCn9adyyc+wa/8kt4Tzb+xpJmxYROyDPSkPJX6
         uN3KZ8deiiyAKKcPcohJztU2ym47SLy+wvIgZwgC1XW0r8MfPzlI+1tsaRjd2cHyZASs
         bI4zF1ggKT+YlJ3FI+upJ/qaIGgP4z05+GKiFaGEoa8qAHfl+1El1kB8wTlNR+XwWVnJ
         8mCVBixYBJ2Hv9Wh14Buf4/dpwHLyOS9h4GgiUyY5YkYD5nZ8WW2NLA2p7mYW0nwYa81
         bh2HHxrxbduboQr+ZJA5LcD4TePZSn+nXjWRGdVyfGj6HikuJ+zQ7ex9zD8HPVLvJm7M
         zM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237491; x=1770842291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+YiPQWXH9LfFe5Ipw86gccMFuVs2bYaP/flxUeZTgEw=;
        b=qCZnADbu9Ir96dy8kxHb1/N53eeXFdcGp59ENqgST+g7TzQ2IdZLHxtVjpov/Wzlmt
         59bxaCNTMlbMfN4lhqoSDBAi3IbRFHkWe/oFZnYDkljWUF8vGXkBRO11RNdc4OhL+fwt
         CjzCPh+QUrr2RNA1guLNCgbOcVYalTWi5XutCY63giGpiVHdW/TfkZm8L49FPp1hJQXt
         0YvX54UfJ8EMt+6hwtC0D3ynfI+iZNi7M58jisZ+p4rgecxR1XRyes5So9XZEvNkh0xq
         ZD4AIzFtGux+gaiP+U/pPYsAmWI+fw2l9wi/Yd3QDZWn0TBRAF6zhZBNDG1qH3y7c4X4
         UU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxkKdkI1jT5whgj4TdrABs2nYS+13kBOImd1oAlH5S3skfWGAy47p5LnoQbAU7AAljG6FxkYketAoTpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMwJXvAhgt+QPcLv6RjTRtagdJ3HFLLpSXOKjRBo/hor3UtQC
	6V2AuOW0NBkqeJ8P9Po+FfGxfTmiLIg8wv3hUdqlqoBNOmU5sXA4atMV
X-Gm-Gg: AZuq6aIZlpOfXP8julZ2TZsWdnPkUOctOM7WYXZqKtb0nUgPh/PPv70STjSOQ3GyXnV
	2wMxAgcBx7sbeauL1V5khCArX/MfSd4InAGDrmlTLsWY/Knie52Z9qvi4jnygLumtmI6LI8c9nK
	v32LoCsWiAGN8T30o0ip7BGp4qxV9pqKhYhda3MLeo3R46roUXjRPySPeqjg+4AsAPzX4IrMOgU
	YWsO2ct8zMoxgS61CInG0lFTOOl1/3qr9CJ+K38RW4Mk37KzxfGJMm6hlSxaI3lsiLhklj18mA0
	VUzvqNbSiI3mW3Qk/GMIX0Z3Hx7GSPlDsI7O5KMHWnrrYU80+dJ32mpDtaocooqEPzBQSifJkFm
	B4YhUNWIl6SRYzTiucS+WtHqIPoAmNjqWmTNM3W0jN1Ikzz9Uc6mOjd/exl4RXbENPgN7Sqt0Gk
	vD3tKTxwb5wC/TLP25F2Z7XnPCa9OegWCaHqR4+cs0Ze9t
X-Received: by 2002:a17:902:cf07:b0:29a:56a:8b81 with SMTP id d9443c01a7336-2a93400b5c5mr30910985ad.8.1770237491410;
        Wed, 04 Feb 2026 12:38:11 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:876b:c389:85e5:7957])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a933974884sm31136955ad.83.2026.02.04.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:38:10 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v3 2/3] media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
Date: Wed,  4 Feb 2026 12:37:25 -0800
Message-ID: <20260204203726.1820226-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204203726.1820226-1-faizel.kb@gmail.com>
References: <20260204203726.1820226-1-faizel.kb@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52216-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0D1CEC80F
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
index 2b07dc1f1278..6c3e6066eaa5 100644
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


