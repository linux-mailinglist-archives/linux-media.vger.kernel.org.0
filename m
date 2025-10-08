Return-Path: <linux-media+bounces-43928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6DBC3AE1
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D46C4F8848
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319022FC01D;
	Wed,  8 Oct 2025 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i18RR1W/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F52FB632
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908713; cv=none; b=F07s9loRPbMayuyBfi/LxSNRCjBQP/3L4dQDuJN6z+/N+K4lBQB4Gxls6h3shO7QOOI5JzHDWoKsdfqTgsIccdorzf7mv4AwBKw1RHgo9Au9CX4NDWKQeaya+nAiOqHIsO66co4mpwPCZpvXQ1NjQFYDnuerz6nys5QUhH6UX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908713; c=relaxed/simple;
	bh=HgP9VExlthvNBigzlv7uekYUM102sO9tWVmQkT6CmuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dx7TyRsdoJPQWdbF1dge48ieS3YMxQPYV7dy43Z5UFFCq7q0wo+eZhzg1QBD9fj2/16ric5nnMsdzyCNYsQ0iq7vTsjz9uAnodlTtQldZnKCTVAWOHXbz4aE3PNth5Ks502U7n1XYb26gNG2PkMcNjQEuo8Ud0QJl+zKlqiQKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i18RR1W/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58d29830058so7164417e87.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908707; x=1760513507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Z7JUaghezQ8iAuA7uRKlyBeeVsFfzYhFmFiduOSBE=;
        b=i18RR1W/mEcnrC0i3KsS695S3ZFUJXSdeObW6CZO+4Bi28fwTaZEFifNaogTgHQbLv
         EWrqzhEEo0OMndgOz8V06nT5OQ4gTOq4PtnNawPe+RDLR7ZWxvKhtDiDct54rg563xW4
         JJW5FH5sUjnLHlWi5DUS4tw0HfxD0OShc9MDIBU8R+VkBbUeBZMUwZZutnOirzVhAo5A
         SZgNh3xMNceR5Yrxufw/+qApIqDRY9q4ycX40RiN7dBb5sOqfMfyBtT2pwBZ94vkYDhj
         3FcxfqhSQvYFI7EMhQ1dQ07q5++nIfSnpjh6tWd4hyXO+iFxid45q0lFE3WHwnEkywUG
         n+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908707; x=1760513507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Z7JUaghezQ8iAuA7uRKlyBeeVsFfzYhFmFiduOSBE=;
        b=dtn6sm/+Jq6z88jnn70ahDFLrPi0dX/38pviHrpipAJxuBtiFkhGd2HYDOqf5kklN0
         0EvnWLzWGSgc4wiaPvkc7GaedTN9obGFo/DsDbC/lmiL/ePti0Uj0p7AQKt7hrWmpv45
         wSwLNDAxQKpdD98n5cLa4prilsmEnehBK7YCat9ynLLUR3rDtjCavIo1Z+7EjmglRT+f
         35Cim5s0wbgVVs9aZdCRs2SaieDfeZU4P9Bn2cAnVcYTHNo4M4gCF0dCTMfYMy1fSob5
         Y8KOBWDRlwC2CUeqKA1Rjq96NhnR64ERzdMuoKxDAIsRbX1pZAOpkDaqlVG2fvYudKH9
         Elyg==
X-Forwarded-Encrypted: i=1; AJvYcCWnH0Hdcmk8jYYxiQJWIaiPX4XaLPcKkY6Tru24ZL41uaxjVBNGmKta2FgZu+iqRsUDt6idtDdjMg7Y9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+Bl7i8rcKdhjuvFuF6btLveMxA9EtbnpYFXOl/ZwKPmvaFrB
	3msA1jow3CkN3BTcK7akFHo8mmaI3D+qDvvpGMH/OcOR8YuGj1eMi7oJ
X-Gm-Gg: ASbGncvPELiJa9c+moQ7XsIA5d2uSzr7pvbIDdAevkvk5XdQpBE5qA1AvCCOtm2UMk/
	mMit1IJggQM4DvIg3MQE9A6l8lO7nWWIfA4mhMKeY1bTSmTlwvfrSsLLkufsf5VTuo6wRI5jtdZ
	K+Cc2qKnE0D5bW/Q3twruneaR2yu0cMMqvCiE5jXCGXjUxM4fXDR9RokxdOCtUjOHiN8EuqzWMG
	atULCu6My+JmHJmDMvnas30o3g5oIS0/C+oQNvY6gsAOBGO+P6B3yuvtT6PGIBcCFgfwLLLKHMB
	nqaB5yFatwN0b8UkG0igCKcsBqoZ8nkm9LGP3isWo8LitHcu7Cvn060HAxwPk2PTfC+DMGlSyeb
	NkZkRk9988LjYYmzNXYG+gVrg2SOj3KFpI8N+RQ==
X-Google-Smtp-Source: AGHT+IEH9UVYbfDLwh87i0wsk9VxXsv9oB5uMQmawr9zG5c24dYjIpaK2BqYZT15/6lZRjaIDuZRfw==
X-Received: by 2002:a05:6512:3082:b0:57b:e70c:8431 with SMTP id 2adb3069b0e04-5906d77e013mr684210e87.2.1759908707206;
        Wed, 08 Oct 2025 00:31:47 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 20/24] staging: media: tegra-video: tegra20: expand format support with RAW8/10 and YUV422/YUV420p 1X16
Date: Wed,  8 Oct 2025 10:30:42 +0300
Message-ID: <20251008073046.23231-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Bayer formats (RAW8 and RAW10) and YUV422/420p 1X16
versions of existing YUV422/YUV420p 2X8.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 74 ++++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 149386a15176..0457209b789a 100644
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
 
@@ -308,6 +332,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
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
@@ -373,6 +407,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
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
 
@@ -454,12 +501,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
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
 
@@ -586,9 +636,25 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 2, YVYU),
 	/* YUV420P */
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 1, YVU420),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 2, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 2, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 2, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 2, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 2, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 2, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 2, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 2, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -615,10 +681,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
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


