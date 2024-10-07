Return-Path: <linux-media+bounces-19185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 080769936C8
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78061F23C9C
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEC61DFD9F;
	Mon,  7 Oct 2024 18:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExbbmM03"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA01DE2CF;
	Mon,  7 Oct 2024 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326954; cv=none; b=kTsI4YC6K7jEQ7TeSx2r+/Vm8JiCrdg6ze3waI7tx14inTCq5oWuT58qSh66NhaKQAuonc9hzQKzgblnx3zuWmmoEPpNtjmoZNNyTRHvtIP4K/iNop4PbCThd0hUjK2zvIRC4EdSDGNBhx0K8yCWF2e3KYitQn8OElx5HpGDHOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326954; c=relaxed/simple;
	bh=74HnUwgStXV2S/0djHYPe5cHNilDGV2N11glgUpAaJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdtO5uxE+DvDiki2zsaEu6vzmztevZjo1/CYWWtHqJDdLuVLJ+oigd1S14bTrrLswGECgPphKUh0a5BVDRn4sVchSWWJyd4Gpu6bNJ9WqFUBrZeEshN+ZfO6zo0hpG7aeldKq9v+xSS6kP7KpdK0eexQOFH4GY6g3IdWCvIWVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExbbmM03; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso825345666b.0;
        Mon, 07 Oct 2024 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326950; x=1728931750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SdC8NARTpJGb0nXuSPzHlKh8nAUqNB9+p6zjHGsAME=;
        b=ExbbmM03fz5G8pN3/iKGMnBE7BoKt0YoJ6RKxCUFPI8WgLP9ytiflzryZPMaIcSZRW
         dLwjCapqSO0R3MMS2LmzTZAwNP9hEaPQ8koHNuZuJRxwwsennHHeMm+EDyobdvujLjzo
         4PG8KC9h9Z5R4Fkqrk/QLa0cjvY4XGXvWZgnOv4MCa8Dpf2M5EFcmBpjx/H968Fz79UC
         v6TRzauIwferwRQkQ6ZNoMD9V2ZV0JxgOPpuYunQpkVhiZWr+UYv/3yPViZoCDNGdQzt
         q9Q8SdW9mpiDIDTiGJTgN2UJdnpDjs/mmgU59/le8tUa9I2ZAbVcX2hdN1Nazq7tBI9i
         0l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326950; x=1728931750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SdC8NARTpJGb0nXuSPzHlKh8nAUqNB9+p6zjHGsAME=;
        b=XL0Q1S6hhR8kzOM5VMThR0sodLJfrAgKi+4MF8cHjGXACANcEf3fG4NjnNxlZ/bVlu
         Kv+S/8PMiEikGB9tHUiIZCDkzNgxURrUhRNBK9GIawBBS5V8M/JXj2rVjMT4vHW5DV+W
         UEQi/GDwI6RWUnas8RHAoEIxxS8t+/arjSG+r4daoPlWSFsmSAigKLp6O2wlCls9oHOr
         mPY1iTF+Qkfl9uqW2Jk65zBclj0MOcpBZZK+0V1A08epu2+MjozMtvMxt1c1G+mEXU8R
         BvCUoNsEEZs7FEn9CFIo4SeHNn/BN1m3HidpRTK1n8BNCmMaz48+B+G7SHqxeXCbEcWY
         dz/g==
X-Forwarded-Encrypted: i=1; AJvYcCVOlIQVGxL8bRn2lEJCcIeLkUxpJgBEvjKkG78QDHXb4Pp6Kzzqs5MFw9lA4R+G4hEBgjXLeY0fw1uOyHQ=@vger.kernel.org, AJvYcCW3WZF007E8W1V03XIRr6PUezp47fVwBRCy7DnHuUPF7gGwgCsaj5cZgKNczqE+80sTafuTg8gj2jbhst1Mqz7h4zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykwviRz6jtnU6ICwf1pyMSjCXsra6qXqEzudJJOQobt9N0WRSQ
	qo1Kvjkg9kuVBkMXoIAUnlZNLJF0PRRNpOT2MBa7RTQBbafuKShsP/4TqA==
X-Google-Smtp-Source: AGHT+IEKZfhFv6fqAw6v9Iv29/q28Ziq7Nrie15hPqjgW3rCpAQTUaYvyN2Upd3KBT5rl4W831GGCA==
X-Received: by 2002:a17:906:f59a:b0:a91:161d:7e7a with SMTP id a640c23a62f3a-a9967860a94mr69768566b.3.1728326950374;
        Mon, 07 Oct 2024 11:49:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 16/17] media: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Mon,  7 Oct 2024 19:48:38 +0100
Message-ID: <20241007184839.190519-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to capture 8bit Bayer formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e21142d3b67d..84230926875a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -188,6 +188,10 @@ struct rzg2l_csi2_format {
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 383f4b30e2ee..87c194961edf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -19,6 +19,34 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.bpp = 2,
 		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.format = V4L2_PIX_FMT_SBGGR8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.format = V4L2_PIX_FMT_SGBRG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.format = V4L2_PIX_FMT_SGRBG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.format = V4L2_PIX_FMT_SRGGB8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


