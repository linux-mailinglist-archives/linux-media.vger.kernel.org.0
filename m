Return-Path: <linux-media+bounces-30851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761AA99666
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79561B85A78
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D93281344;
	Wed, 23 Apr 2025 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="c8L33zSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F8E28A41A
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428843; cv=none; b=bo7yvTF9i5Pvkpvoc+mkpA52WRQzpdXM5G7PkHjkIaGv9DIKW66Gmebi0Ksn7mCYxcBIEuC6CQCbzqiU6x2qAY1Cjr+d0ScDr1C8rpsnsbXRd3vL+rz1+mHmTLEtR1844OGFNWA01ZK1xZbAuN+gvvxkWWyGfGbc6qLJ4b2m0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428843; c=relaxed/simple;
	bh=wMlOFTd70RMJCXwC9bQyxic8c20g9i+LxAT9YJ/SitA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQKID+yTofxwj85JwitP5ouacWoxEDhKkpUz4SLPPMHZ+YhT5/y4cmvW0mUBlv7sbuVwbR7Y3LuWZFwgNY1/oviWDUUoT3rIQm6xL/lzBihasrsv6zst+cBhrNc/vIgTgst+oH0fe0O1Qd5gQPAPh/DZya26VxdUXkh+iucwktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=c8L33zSM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso405945e9.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428839; x=1746033639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=c8L33zSMO7eBTCkikx0lf1XRNoJbXj03CtzDDctCMwcHc3gjFSli27MkySsPCTwO/G
         GdDN5t8RFhw7R2mT8qbZHB+Rm7q/1d9/3+zMSLd7Ty8907C2ceGVEQAR3JUKhZzRBXR1
         EoLsrgd27v6OWh4MOI/aY7PFpxDFdZmRsbA3IVhMoRlFDdPbaPvBd0qQCX2zEAn7m/7j
         xDzCPmVU+liM3qrOuNIpyndGW3Cz7VaL4LzgFyCYPuQMs+Rw7w3ixTm4Z8rRP+RO2xH+
         tdwtQuDU3u3Cp3a3eRtjH114oisIiOqGUG7FmZ89dT743bwSlA/iUSI7KOEaAcxCX+Ae
         b/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428839; x=1746033639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=cr0HdMLKDQr7bPlSaK+WxWIdn9HJfEsR4R0Oc2Wun6INs8jZF2mGZabH2lRDG0APMZ
         60Y1JQSjx9CiXP5Dp2woC7Onr0GHCGnZ97ewhQRqnpTQ5U//9JJGdIGvMtrxLwhH4fFj
         MmohovKAIXtfEX/YemsTNRFXcK6wiz02rcfdC1ZubKIj9Qg7mhwqJTlIyijX+pFrEkPD
         garXcdpXYk702rikqnF9xEt3uFnKpKIvsLF6wYwSAhD/2CJ4mJc5B2RXeumd9xJCREjH
         IpezgnAlB5Qllz5zN+HPfXIlNMxdwPU6tkx97PLTq49bzLsvUWJwOjbpR+3YFQ+vifjH
         6e4w==
X-Forwarded-Encrypted: i=1; AJvYcCWRZsVrDG1bVR/+DdNFyC2rYeZQwDgpFuZKL0karncyQdG5awBbCdJk0WQ02OS+8ksH1ac2e3YprYPBZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ndUqImZ/DBfyQKkBGjUFcVNv+Tfe1NhF4/OHvRDA7b6F1tQC
	T7Db6Nq2wiEMwAZaHp7uNl2E228YG3tzGFnjJG8s8/FoAre7WO8/4qpcRXkDGRQ=
X-Gm-Gg: ASbGncsX2On02fpxedYuLQof2lpNzbEi8z4UB64IkSIJub7PzdVmZDjTy5IPH+OTCkz
	kexp5D55Weu2r8iE1gAZ23vhaIZiysiBlUuXVQnyDnudDYdsiiC1hLMZbz8eFYsWYPBD+Q+rzTM
	I8QVxVYTwKkW8rE9Y354RgYpxSyJ/sDxEALkKUVRybjhskZ60W92MHfMbQWDfrhHgVmAh15J8v1
	Xe3z/EZCtN2SHapE3ddsyB7lEnIdmXaWd33JCCrNHy+SF3lQMvGA52//kgYP/dbNg5ELI+dCRtr
	ybrKKQb5FCICcByGgMg3Ai1vlHHffit6
X-Google-Smtp-Source: AGHT+IGrixIUdFwDqxJsP0Mh+PleUdGsoK+ZibZSwUPFmb7HHGdjv1z9p7Q1wXmc1rZnucAiLmqGBA==
X-Received: by 2002:a05:600c:34c6:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4409a1c4da7mr3750025e9.30.1745428839115;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:19 +0100
Subject: [PATCH v3 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-2-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
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
index a16fb44c7246..9405e1391617 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1379,7 +1379,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index c8cb2796130f..fbccb471e3cb 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -687,6 +687,10 @@ struct v4l2_pix_format {
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


