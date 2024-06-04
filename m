Return-Path: <linux-media+bounces-12498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B828FA9D7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44CBE1F25370
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C2140366;
	Tue,  4 Jun 2024 05:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeWBkxiC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90CB13F447;
	Tue,  4 Jun 2024 05:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717478144; cv=none; b=bTdZM+zIX9bOMoaYCnCR3JmtF1+C19ySUyNqUcFGO765BpPV1/udqGoi9oXnNVfDwoncfjhoh7aa6LJtNnS6hIt7ayBhDki4c3QnQqhxwb3fkhLrO8k/nq+J5NmBAch1oUIZ8i3uc1rTNtwDiBdzxdsF7KBLztWkWsmb2RcteqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717478144; c=relaxed/simple;
	bh=DEfGGNbbf6mS0MilM1GKmovkDe2QE6KoBd+BZ/dvfkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YH70zHCSTMIlsROYn05KKqSjZWkk5osKp8JdI9teprEZ8L9WvSqNWkS/mpTlnEjWI0yDUw9ZAdjGsej1NjRjTHJFLt/qKr0RtdOq+TxQC0+6SNKgy8h3saahyYVGfIqlAXbrrJqh03uTVX+zQkrIRbsrPv6SHV1pOCryEiHolKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeWBkxiC; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a30b3a6cbso653735a12.1;
        Mon, 03 Jun 2024 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478141; x=1718082941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=YeWBkxiCV+yXIJff/qQMwLJntNEqwQkE+SBwP9ZCGHVdYAFeMUGo9OvlCCG4y8NfLP
         wzaujEoXxKrmHzaI4IdOs4JQ50xtpKrOU9fl3eZOmwjUwMxGRKs8JWc58zi9apIwHJO6
         h8lPae4UeowoPKozFCEtaRO8jj8DAdhJHb4FWU9ci/WkNRa4+dGJhfTG+u1SLjsEZQj+
         b1iFeHbB1kA9SPGZg8KO3rTYC2gNW1i0fecl6v4DreXeALsqXzhehzbhSYLcgzxqR5/3
         cb36BZtx5AambKXYxOheR8Hupfub2rAMv2HOxTcw39CSJJZZjEymXo3hhr3eqGC4fh5E
         Ogpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478141; x=1718082941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=o/OHlxduiVN9N7x/mehBJwBWxLMAfeaNlzBbwoIjt/X0Rfvh77gVvntSVZkrYpcJ+d
         gRbJiU/x+FgICl/pZtwrc8pVKuAl8ub/nL6G4Syx8hKb8uSyh0tmUCFvjwxYKAQW8qMt
         c36p0Xlt9HbeD2z69vewFdavz0O3XA5r/yVyOm7mEjNy+d7dUaqEVuQd9r5o8LmBuxdY
         JysD7QCIrkgvsFrgfECvv7jb5Q8ltScoMozyKAQERLRJIy+x575ScyvEElVDwyNEeNhK
         tDKY+XW1fXOlWoexYCIGQMqusWrcTgqZzbSlr1G5gh0VUHEAdqBB05S1L1jH2gBCKxl7
         WwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTyxwsjhCslPPxh3s8/7ewfbQ1MZwX+aQe1IVJbXQcjYBSVFfUX3QuN6xnNk4TSlq2Y9gEPKY97yXd5z5sX1PAM1kniVDv38qJjNlKthg/ehAD9Ov4WzzIbBqQI5/gkgNupZg/Xwh3rUQkM1iV8hlVzqjOhrQnpn1ew06nqO+SLVj5qDM1
X-Gm-Message-State: AOJu0YzEWZH9miykdXXkLDNbCGXN/F/PI8iNr++/LubunCKIbLQXQzxT
	f8iDxxLj//R+mKh78riIk4VzNHbG2P5Li3hUJ6Dy/CMUgxtDiel5
X-Google-Smtp-Source: AGHT+IGZ8TPHTibom2cLxGJgP0J5h41ltwlDrg51oTsOx+WeTH4ROT9lb8ZKceTCPjvT/pMzBjeQoQ==
X-Received: by 2002:a17:906:3718:b0:a68:cf22:ebdb with SMTP id a640c23a62f3a-a68cf22ee12mr383305766b.43.1717478140978;
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
Date: Tue,  4 Jun 2024 05:15:33 +0000
Message-Id: <20240604051533.3312944-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604051533.3312944-1-christianshewitt@gmail.com>
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c       |  2 +
 .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index de3e0345ab7c..5e5b296f93ba 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxm },
 	{ .compatible = "amlogic,gxl-vdec",
 	  .data = &vdec_platform_gxl },
+	{ .compatible = "amlogic,gxlx-vdec",
+	  .data = &vdec_platform_gxlx },
 	{ .compatible = "amlogic,g12a-vdec",
 	  .data = &vdec_platform_g12a },
 	{ .compatible = "amlogic,sm1-vdec",
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 70c9fd7c8bc5..66bb307db85a 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_gxlx[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.min_buffers = 2,
+		.max_buffers = 24,
+		.max_width = 3840,
+		.max_height = 2160,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_h264_ops,
+		.firmware_path = "meson/vdec/gxl_h264.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED |
+			 V4L2_FMT_FLAG_DYN_RESOLUTION,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG1,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	},
+};
+
 static const struct amvdec_format vdec_formats_gxm[] = {
 	{
 		.pixfmt = V4L2_PIX_FMT_VP9,
@@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
 	.revision = VDEC_REVISION_GXL,
 };
 
+const struct vdec_platform vdec_platform_gxlx = {
+	.formats = vdec_formats_gxlx,
+	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
+	.revision = VDEC_REVISION_GXLX,
+};
+
 const struct vdec_platform vdec_platform_gxm = {
 	.formats = vdec_formats_gxm,
 	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index 731877a771f4..88ca4a9db8a8 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -14,6 +14,7 @@ struct amvdec_format;
 enum vdec_revision {
 	VDEC_REVISION_GXBB,
 	VDEC_REVISION_GXL,
+	VDEC_REVISION_GXLX,
 	VDEC_REVISION_GXM,
 	VDEC_REVISION_G12A,
 	VDEC_REVISION_SM1,
@@ -28,6 +29,7 @@ struct vdec_platform {
 extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
+extern const struct vdec_platform vdec_platform_gxlx;
 extern const struct vdec_platform vdec_platform_g12a;
 extern const struct vdec_platform vdec_platform_sm1;
 
-- 
2.34.1


