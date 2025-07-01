Return-Path: <linux-media+bounces-36452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C077BAEFEE3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA3B4416E6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20DA27F728;
	Tue,  1 Jul 2025 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="U9bUGy2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96D27E040
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385728; cv=none; b=QYP8Hl2L5i3rtfaHCVbw+rWK67iYb28dLLwRsEF7YfWdlfhJYZnkzov32M79gIoMm3DGed4UNON+gwTzpy/GlQhvUuD6HypWV/tUoBuIwr4zuQVh+GVRv9jbMHsN+kMNsoADFPzn+7HvJwGWG5xGyuGHgYH0wcsidFZEkL08n24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385728; c=relaxed/simple;
	bh=7uOB2Iw2lMV+Pi6apoMiLdzrY9dCNnxEHoX8uR/Lr+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrNUwBhBvVrRVI7BzSoHNx3IdaOii+Zrfd/GYxWA5ChTa3u8nN1mqrgQi4DtF5idMnrDMmNXkgaf1IB8ztwTKSHU95qNoUVbjkDIBsBKV8zp/xTj1bai3oaIKoLUzffGwUI+GpsBoHXJLlmEx4Ln5YDklB2O24chxIl6UvGEXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=U9bUGy2J; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453643020bdso51043385e9.1
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385723; x=1751990523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=;
        b=U9bUGy2J84O+Ap3z4HmxsQLQ6EtNz61dowQSWDf/SAB6abCZxwSGzP8PhPgg1YxbF4
         OWb45p5MaeLPkUS/EaThC4fu13MglRc/w1UWad4Y1jwrKwIX/m8UEvNPxZpQu3DgD9x4
         w0GAxMcHRCtxGK2OSxT03SqYrJNgmbGhqsuVoY8l2sIbUYL7A2Satxf7g45j/Aa+NOps
         hwkH4cn8SGtBCR8vnyKNF08/t/5c/J9tIvByE66L6VCfk0YDqDMo1NYbwlgtT0aV+8oh
         LJJvb9fjiGEllJ5jVyGsH+T4qrp/8v/lv+A83XqF3hqmDQdze/3h/bTU/p+NIin3Mpr+
         hJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385723; x=1751990523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=;
        b=TQQGiMLTZZJvpld1gcSUQLlwXji9iyhTdfTo85/WZs0X7JC9DCWEw8643ADUO7zNAS
         mN/dYWgVET1potDT3vduPqKtQW+5GozEI2EUFJoRENW/L6+NnODIVWxaKBSzLVDgIYf/
         p6gyUDDW6SMV6KMvhzpr4xkgEnbImhqWUVFryTMNnDZyP6BdOd3mZprZ3rvwXGgBgWhT
         A40SV/wlzW2PHGdcob67OSYcd1b8ClwS3r//r8dL69GwmPcOCJda797+5R1Nl0JbC0/Q
         ZBSf5DVA5CBTDXxvy4zkTIlV6egH80TLkL0rfl4lrgJg2TUpV4ZLYqDFv0aMJgA406Bv
         YLVw==
X-Forwarded-Encrypted: i=1; AJvYcCXZq9k1Jel72zrOV+4w0W1CFrxVHf5kzTgAmgarNCpDFMSCl64aMI9Y29RINb6j3x1QPVmB10ZXmjPpjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUj6g1UH7sfxlQSTidfoDUBOLzwZ9Dch+Wfh8ZRgkiyB5FHy+z
	pI1YYnq9ToUd8YeMSqqvyOGNACBxAMIKkMDTPJ/le6wtH84Kax46XdkjHrJhbHuQ/YI=
X-Gm-Gg: ASbGncshnWDey80ohOoYUahBa3b0wMXTJdGXjDqv4jKgOfTfivMd/lsNwmBYk8+1sFo
	8cIZ5Jq3oo634DGJmDGDQNgnJpEWGB9EEnbg4eqI4J59E5lnvdyjTB8c9lqVWJmGBz+s0MyYGks
	3ddZmK64INErwABRPSfId/fJiJNopC3MM/KtxsuU/eNNqFPuSk64uPwqgCmQfodqq6HzlWdRPe2
	GPw0LWjteg4smKp6yq9k/7zZdp+D/RcIulaRdwIcIs2v1TtS1ifbVb7lTpFCwUIK0TNOGGrHtKs
	ii/x90RFBR3UdfelAp0UA00AOw/oaCM7cMXmJ6aaTt2LR8lg8DYJtQ==
X-Google-Smtp-Source: AGHT+IE146BA9nfk2sth4Vr26o/ypIBHWd57X4CUtemwbh0xYtrD7BwQ6IkyNJhKZXFlcPZr5B86Jg==
X-Received: by 2002:a05:600c:3b07:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-454a19df49dmr10490475e9.7.1751385722446;
        Tue, 01 Jul 2025 09:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:37 +0100
Subject: [PATCH v4 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 650dc1956f73..3bdcbb12bb30 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1381,7 +1381,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9e3b366d5fc7..f0934d647d75 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -697,6 +697,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
+#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
+			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixel wide column */
+
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
2.34.1


