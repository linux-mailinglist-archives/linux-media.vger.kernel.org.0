Return-Path: <linux-media+bounces-41905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AEB46FBB
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3CC5812F4
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3287B3043D1;
	Sat,  6 Sep 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q37VOCrx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA693019CD;
	Sat,  6 Sep 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166876; cv=none; b=rvG4uHSZed7cOaKSvZg5+nmuqhx609/goqbOxGA3Ou1+721546QYMTa2zV3eV2cdhA5+/gN5ZTAMp6I4xN7MRqSA3P8WeUsPN83jUPO2Hjf/B/J0N7eizrgeccst4lwtXAy3hptBv1CZdKBnnEusJeIz4Sk2SCymWqCom8rRzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166876; c=relaxed/simple;
	bh=SvDFLEgxF0izBM8J/lD7SBLmL8BiQ7LVadnuNwxfWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFa9Y448XdPVVy/xxZiRmkqEdW+vSzx6mHgdSUNrjV7X/u0H3vPuKQiY6w1zS7GqMF8UqUtfW7S/hZk+mTJJtkLL7Q8qQcfZKQZpdJ4pG3RIafMQJQC48dwSctHf5GQaHoZNbsFGdCOZ5rdOluQtf05Drpb8CrmD7lW/LEtD3fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q37VOCrx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3094776e87.2;
        Sat, 06 Sep 2025 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166872; x=1757771672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B93viYoCKInxHXzGqwXSKJNYX0dg2YEnhhGb8EZWz7k=;
        b=Q37VOCrx7XyXnk2KpgB5GrNh3jeIeN6Jw7NQhdVosdUJQH2d9pTQsdXVS6kgKh3jlo
         sQbC+vEw5CJbJavl7VELL1dV9O8yqow9PEm/354NobHGcOmwjhJ7T8QV76l8dGqnRLTB
         wXZYgzZ6gkibEo/9gbsAmtMhn3+EFyyIh+nknI0SmNUA01bia7dnx4mcq6rSruZ4I4h8
         Rnx+FnWQTLe393WLunJd8+sWqzr3yVeKldk0oQ/xLD0Pcndo7ccL08i+8JgVttILOXNd
         6WMv/WuOgO7fPP3iZ6m0BT+jPf/mY3eX9mXzw/VRVlQ9aL5XDOoBpyVA/gte136+SPqe
         ibWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166872; x=1757771672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B93viYoCKInxHXzGqwXSKJNYX0dg2YEnhhGb8EZWz7k=;
        b=aseVmFE0dpI8WLHvj3YackSdpQSMRIwLNnsRaPrWZC3aFzK6dV0RejBKpZZ21XnBZH
         0Ob0X/0vlc0tIbdA0lHCbAnEllVc4PE63beedEiZv+4tt/ZCXhIDGDit3c9p705QW4/s
         LqXePvz5XDYmHtUWr/OL7Zjj2SKq9L8jln1NrfzIbUQNvjYMPqSGZhXshxAo4vLuHGB3
         0JGOm9jkHfQEkNCDR5GdjcjjRj+Bm89pbX4C57+v0p8wacedozOW2RHfOiTg9efNowCw
         Mn/AI814rdnwYGoGw4YG9zo7cljApvIAVVwV1G+Bk1sJzCA70cvr6AsRIr4ZjVwJXFFD
         817w==
X-Forwarded-Encrypted: i=1; AJvYcCUwcmUg0eMfR4by7xu0fmFRV8JscMBRgR8xLXuXL+FHW+YdjQicdyN43ReA9teX0w7Bjs1WdFE5pOEy+p8=@vger.kernel.org, AJvYcCVQgNdpMAwnA2GJ+OnAETeiVFYTmRYyOG4vHUXhdJYTrmX+a8ffKzhlQejr8cuNb3yxryEND4j0zU/nw+Cs@vger.kernel.org, AJvYcCVgFz7a2r8axxR7CZ7iSIRZSBGYuY0QrCuFecFeFsk+4oPLyxJxiEjt4ZE2m+TJQmt9dElHg9r6Zt9O@vger.kernel.org, AJvYcCXIAFj+PMLC6fvW79/IpuWhBUiVyo5RHrkldaKNFwucQeVuvJKzKBbCWDY/muLSQb61DOU1f+pQZPMJ@vger.kernel.org, AJvYcCXZLe4oZPQhcUfQFDtC+kMXcHr84eaGsrM+wMy7DKoJ5QqxTxBzt/gNDb4GMihVa9O3sJhjrB744SHQ8o0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtHgVTPn/4zQtchf4nPbbIukG84g3+9TOKBOVKOSwxCXbXVBE
	uZgVpJosG/5oUalZyrLhYwPncgtEbIrFxbiaHuNiHAS4iSi32oD+2HJb
X-Gm-Gg: ASbGnct5B0t/oWVV6vrQ7kXm0yzsh6CjfmDNJjTi2cb9sQgAHB7ieDSbg++4wrRX8ie
	HrioZyQa3qo9ZbDP05/YtLgLMBWaYZTkAS3GqqYDeGaE6mvzqC8zc/VjlW1n/22OfmWyeMWPxbI
	wssuce2CNAncgDSmjvnonj+LspbqOY+yvwCTA3KWTI547/QlNNOqaAAdnVHCTD1EVIgB38dPG0j
	O+hjsJFu/ZJv+Jp/SZCDB8+i3fOlR092tzX5SajRSOCLT37+0luOQoasVVbrKfKfKs1qmeNx81A
	jiVE88OFm31pRezf2l0NP+UeuuEiSCpgXL/6k1SNbJCFGwmndbPsNBdA1cV043SEuqw4NK8Zw2m
	deosapQc4JSzGbg==
X-Google-Smtp-Source: AGHT+IF2hG/32Ms4Uer2DNckfO9Chc9JaFOCl1iPssMuql//ZO2c3+1tjxpKQ9azyuJf7MEViKLFyQ==
X-Received: by 2002:a05:6512:3b0b:b0:55f:4e8a:19ad with SMTP id 2adb3069b0e04-56260a6233fmr564619e87.13.1757166872270;
        Sat, 06 Sep 2025 06:54:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:31 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 19/23] staging: media: tegra-video: tegra20: expand format support with RAW8/10 and YUV422 1X16
Date: Sat,  6 Sep 2025 16:53:40 +0300
Message-ID: <20250906135345.241229-20-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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
 drivers/staging/media/tegra-video/tegra20.c | 72 ++++++++++++++++++++-
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 3c5bafebfcd8..f9adb0611638 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -187,6 +187,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
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
+		(*main_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -221,6 +233,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
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
 
@@ -301,6 +325,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
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
@@ -366,6 +400,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
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
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -447,12 +494,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -581,6 +631,20 @@ static const struct tegra_video_format tegra20_video_formats[] = {
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
@@ -607,10 +671,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
-
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
 
-- 
2.48.1


