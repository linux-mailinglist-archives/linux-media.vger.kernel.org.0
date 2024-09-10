Return-Path: <linux-media+bounces-18134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A5974162
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8AB51C255A1
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F111AE873;
	Tue, 10 Sep 2024 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlQByKeS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A91ACDE2;
	Tue, 10 Sep 2024 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990881; cv=none; b=iBHr1MIIWYX/qcq4HChLzPZ/9WS1k4E4FVNkTJt9TG7bPhn4J8vzT08tM1Z612kSx0mx/TUBfOR4pMZU5l4NP2/oixM0LOkBE2hWNHiXYcQnY7imZkY/8QsRvCalDmeCN48XN2npYUjP3yHL9idficKvb/6ByxHUYxHQXsR2Fdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990881; c=relaxed/simple;
	bh=btQfCavCwM7F4Z1EU4V7koqZbZVMdlatdXFGeH8GtP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GV++WrA+Z/bGn3payy9RlLAro2hogp5lTDJrt54Rb/GRI750kqmR8wfe6cU2L2m2gGRelon3uUfSW4y4qFUWnL2EFbawhU9tWuiFalCudXIJad0WGyKU7XUHFaX7Czq+NgNez5blNOWGSZzFJkSKukjGApiTuvSH+W2+f7iRPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlQByKeS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso10202185e9.1;
        Tue, 10 Sep 2024 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990877; x=1726595677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLJn4K6OxMNAg/6NgI7KlpPGUijXI80GlBkh2HpGxtY=;
        b=OlQByKeSwKVrYsm6976hAyUkSFxM7WTB8gl6NUmUZcYKkC91B6QfP8NfHvcZY8p1ik
         xq7xYqy7FSukAAEVMb48AM274XJeWP1gTp3Kazd+qakenB3Aj7BX8r+TPxHAmNtiIc6N
         qW/fPVB1vIBPNVR3jLtoB1DR6TxJPAPW4kH+C4aCq08issiq/7bS7xolE550VZhEctp2
         lHB92xlKvo7tyhJKe+MAwZxNU8HkpYJdb2KdYuUHQ40bxKAxE/LsGY7IEL60tOAXj8ki
         PU5ERi8JmABGUJXmNS3dT5kHxUlbtMqh6y8kAwDPI9ItCm8CL5QhVSglbjgYFAbQyHma
         8VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990877; x=1726595677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLJn4K6OxMNAg/6NgI7KlpPGUijXI80GlBkh2HpGxtY=;
        b=v9GrGPxklHW/jALCac8oskzb6S/uKVYJO5i4UYh8Ijv5bQfGO4COt4LBrk2x0PqeBY
         D3dgJPDo8G7V3l8OQeW3HFeBo7ADYbHDTj6ryG/W7rIV8YUAQvKlXDapkCXnOtmqYkgs
         G3beHNOv/89+si6XH/tri67aSo4rVDJLQoXzGuMarRAE0TLKmoiF6ZtRHA6YZuCca5cW
         kyBzx98iVxUHWTHO9DF8MDgvhuja1VBuEi7OiXUVJZqeht7kxED6tG9I0f4xscTODzbC
         FQPG1aCgBNaUd4/u+mYy0H8lSIP65UAvyGcjNkvNsxSl4zipSd/K1GIxQ8gcXpu6fFq5
         OZDw==
X-Forwarded-Encrypted: i=1; AJvYcCW948Mh8Sl482Vg0d9gW4F9lhQoKI+mqAEbua7+4FxPhl9CbDMjhuctJ64wHwRd6vDZRCOPxGfoZsQ9m0wgAMECDMM=@vger.kernel.org, AJvYcCX3gMtwVut3TsOuLwR1pQ+kd4NvL8Y7cq4EOvDtDuJc0AbZ0BID1/gUp6cct/eD2NUd2fWcbbyfacER8BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrmT4Ylk6+jvtgXqNd5t62MK01YRp77b7MDt7PP5BVdNN4WIC
	VRk/4aSwtR9bCwj86jFq0eiBBOlJ816DYHkkxVLF9Ot8ziSQF0M5
X-Google-Smtp-Source: AGHT+IFU4Iu8XvBOQgmZ8DtiQ7elW7WkvJbAXLGsWCtwGPrB/ej0kTqeruFaqVfqB4uSj25ewkvTow==
X-Received: by 2002:a05:600c:1547:b0:42c:b2fa:1c0a with SMTP id 5b1f17b1804b1-42ccd35ae2amr3238015e9.23.1725990877661;
        Tue, 10 Sep 2024 10:54:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 16/16] media: platform: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Tue, 10 Sep 2024 18:53:57 +0100
Message-Id: <20240910175357.229075-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e630283dd1f1..d46f0bd10cec 100644
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
index 9b0563198b50..9bb192655f25 100644
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
2.34.1


