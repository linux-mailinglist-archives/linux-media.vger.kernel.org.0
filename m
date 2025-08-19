Return-Path: <linux-media+bounces-40272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77AB2C35D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B520F1BC2357
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C333570AC;
	Tue, 19 Aug 2025 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deRRtE1P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70EA34AB18;
	Tue, 19 Aug 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605832; cv=none; b=OE1Oyckf7qSIEL2njkKIB+lBskB8X4/iDblks2U0eFkmQmkiGsulrmY3d3hqpYpw3FV+VjfOskyz3h5szhG2Nwm23J7w09xk+q10EWF2xDc1wmmk0Ik26ojZQ6qwmGYz8YKzeuJRHoe5b/y4yhyWJ/EkwQGXWjel+fUoyh2M3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605832; c=relaxed/simple;
	bh=5eMIrV/Hmou9pbnnvpgrd18OG+4DTH4njRIDU87uaNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8JhVB4E4rLdkMCVxF3S9J3S8lLWpyf9hmE36733r1n0a54dfz1r9UqeTC1jQNHWQ12QwcPOUFll9anPYbw/MVixNFfyB1kFU3AHXEcyTHlz5mUJIhQQ0+1FItbKhLXBmg8tCNJgptK5eU9y2PSur+5XCHKtSnmRPQPzHjZmcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deRRtE1P; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso744872566b.3;
        Tue, 19 Aug 2025 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605828; x=1756210628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVmGik8S1Lubg88N013Hy9120GSgzZiOul8C7FSni6U=;
        b=deRRtE1PQRqTMoJHsc1cvplZeYi81I+/2GvQ0wFEr5iekgNwSaHyHcRk+3subUjj3Y
         JaLINEtY+lz9PMQ8kcODiWws090BgJU318IURg7lSbJK9tqsNZ6enkHX2FAbdKTwsFa/
         hYTIxv99CSq35mmPfjw7/md2wyVGn2+wRKrxld0akrjT9e7eOI6f7oyjq2WaEDNwY63U
         rWP1t9vUFIcWumXgqQCsXbmfU7+Ol7KueOq0tD2A0VU3ZtWMl3rgm57i9tF1OoGNPMPl
         9Mojs3QHuMoabT3iK5nPYj7m2pfbx3ejZJ1XZ63mvUTXh4L8Cig9UyOcYQEKI6UbZhit
         5zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605828; x=1756210628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVmGik8S1Lubg88N013Hy9120GSgzZiOul8C7FSni6U=;
        b=uGSGmw9k1bhWPouqhnrUneSF75LNqrmF5td+h4ZbgECUxd/AIyJMnh7IVUReNjc7QF
         o3a6BlHbr9BuNPq0C0AcmHbRo6KEPUBk1YbMTC3GYzVUUZHM1F9SnWw9agFCu5XWhjfM
         9lrv8eglVz4OdeO//8izxnyDVUXkSRNUEzPxFYc1Srpin7MMA/kIQKTs94Jfb5qBpoed
         owZtVde5dwI3zktdNnJOMMCCV+QaIogINhE+yIty6293my05tdoXFC+GblfOoHzLGSrp
         pBnNgaF5qSRsJsLCXDE0q1BkBZ5Dk/Zvil5WLdnPO4fWsAj12HX+g2KzRY+8E/0zNkgf
         tVag==
X-Forwarded-Encrypted: i=1; AJvYcCUHAuyzJh1uhVnySRfMkZgFbQl+Yrw+J+G5k47RHPRQymPC6ixksDtzl97AeQCOkuJv9+8lacG+i+r1@vger.kernel.org, AJvYcCV/IaYN5luGDPWkd6xo7cFg8jW7KZgNApxOlorFFtDcmkCtHxhBLNLn9SPsmVICEtzQgz6ekZOn+p5A9YJd@vger.kernel.org, AJvYcCWQnD+oL+cdByuYaUcuiduef5oAFREeQh7aqtL6BB884mIwV+VQABp9zQqVdEDvrx0mP1pcVatUX7gw5zQ=@vger.kernel.org, AJvYcCXO4SG9NdmKVTvu0rqOLk/xVZH/dMuRsMtjRxFyfMtJ7QsTAT0G8NkjBS+RJFqmxBWkIgSK1KFW6b7G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhk4ZoRCn3xYcwh56lwItWKgVQwBQWhWJoG+oQtEURwIKejMHm
	FcNrQvP6RtUYJcunWulFz2GOKiuoTtnowxWDqYKvSEpOxUJKCKtlYjqol71bEg==
X-Gm-Gg: ASbGncs8q4JunDpZTHG8m5rIP0uUnNbI08icYzUJpjfy6/54WYjfm+nNpc4SqdDoXNo
	TZ251kCquGhK/hoklGSZAu32GxL+4nmcECnIQv7df0Qba+I3Z19QIe4KZmXMyOsmGNjkYa8gCIp
	FKKbqlD+K98U9sUEsIHqI8q1Pj/TQeeauy88Q/6aQrNSH4lbiuK+VqjiLt6MWdQv/m923WdWi1a
	w7k3ZOA6oL4jbZQK+vI76KoKodx8T/7OTNa7N/hAnK6aiAjucid19hVQ/hhil8ISQp/2U9w7E4s
	zyRMPCwuOhZ/cpNsPrr3lZe5QvVI+aG5+E2bBPR6jkYVfCZ1uKgAFifrlhnUuF4rp+5B915Ksaf
	HTmGFwrheiP3LQw==
X-Google-Smtp-Source: AGHT+IGNsZPmHUgUqv/mb+jehNWgcZIV+ojA6g1QddNCsq4qKvg62r9qmL1bBHys91nwZmL1Bm8feQ==
X-Received: by 2002:a17:907:1c26:b0:af9:686a:52a7 with SMTP id a640c23a62f3a-afddcb895f9mr206314166b.14.1755605828049;
        Tue, 19 Aug 2025 05:17:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand format support with RAW8/10 and YUV422 1X16
Date: Tue, 19 Aug 2025 15:16:27 +0300
Message-ID: <20250819121631.84280-16-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versions
of existing YUV422_8 2X8.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 67631e0c9ffc..b466fe7f4504 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
+	/* RAW8 */
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	/* RAW10 */
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		(*yuv_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YVU420:
 		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
+		break;
 	}
 }
 
@@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
 		if (chan->vflip)
 			chan->start_offset += stride * (height - 1);
 		if (chan->hflip)
@@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset);
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	int output_channel = OUT_1;
+	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+			      data_type == TEGRA_IMAGE_DT_RAW10) ?
+			      OUT_2 : OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -580,6 +630,20 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	int output_channel = OUT_1;
+	int output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+			      data_type == TEGRA_IMAGE_DT_RAW10) ?
+			      OUT_2 : OUT_1;
 
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
-- 
2.48.1


