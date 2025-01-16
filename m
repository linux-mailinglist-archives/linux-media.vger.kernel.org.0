Return-Path: <linux-media+bounces-24847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04EA13A7E
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D785167BE4
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CA31F472C;
	Thu, 16 Jan 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fAI4YV4T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com [209.85.221.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF781F37B5
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032876; cv=none; b=f8BXkeoBRf0ELSdhGC+tNkbiuCsOsLO3rKDJSEaVz/VuT6UjCqIoACaaZRc9sMsKa1mClmq9vKHq6Jic/6pN8GhzW1dikRk1JkPm+/YkY1M9cpUIdlq6a8kKpnZIRY3dI+AKfq2s+WH/DkYRQ0l3ZAk+zNm6P8JAUyfEIOIfbJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032876; c=relaxed/simple;
	bh=E0P4gTnW/NOiMb7huM3e1AYQ5K3fNlt0nq2Tm8trH1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lZ9jRVhv+/pQI5NMnJ5NWaFZq1EuW35mIo5RApc4JIO4TtbRLQIZyd+5cPb7QUqjwDLxRrcfgdaUl3xU7tOi0dnHE8nfNPcZXE9eQQ84cxyYbQGBgdRTXX9f6VxJHQvaDfoeUMb5ygC38PA14kbEYgCzGHW2qVdVzETNN/zS2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fAI4YV4T; arc=none smtp.client-ip=209.85.221.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f100.google.com with SMTP id ffacd0b85a97d-3862f32a33eso426049f8f.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737032872; x=1737637672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HxNgVGZwH/KqwnSlM0sxwj6zn21A4I2jmnb/ZwvBTg=;
        b=fAI4YV4TzB3e6IXTpneLd/H2a5WZ8DhVGtQLtFhQ5uUmBLFNE9v233xJP1irTWVbuA
         pqF7UAkm6s160aHPqM7rrzfYEXVAu2/UjeN+kF+RWjlRDkgtt8Lc79jnKDHo5hqBSnxT
         YEB+dfnmjlfzMkoTaASXdDnBibJJ5v2gR93rkQnLQXX1D9fB9nkXDG0R6eEd1ckYlySi
         FJ3Mjs8A500OvNqh/MYUNDatW5T8aMJ8bz61WyNwePqwh4/pZ4aABEI6LQz8PPpDTmWQ
         K7PM+BWCDIYOQnY8TxpT6VeyMVvkZ2J0oqaUTmaqYtbOyoG/+iNoSTKFAM3+r2JoSBGW
         zgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737032872; x=1737637672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HxNgVGZwH/KqwnSlM0sxwj6zn21A4I2jmnb/ZwvBTg=;
        b=aZU2ER7773pudvASZwSGChZHtiwGfyBWpvWjuO2hvs6qjcS8vufJNx7Z2+Gl/xPmWr
         VppAxh3bFt6DOyYMX4wmOatGDwdIMi7UeDA1OgR1rgGYZkWXOoCujuyxOA3tf7GQDZyn
         4Kn+vf6ujld17rhA/q3zg/tpWZ+QZjJmuyTCjWbqApq4n6hr3O4qHvqPeA+pjp3IXBtg
         bLTLfIi15iHFBS9XX9QuIRLcwnMqJnqvmuhtnGKpbPdFCORRqUSw+NAtr7jDR/uiLIst
         TqyDzwYrjDkrXyEX1I8tuHyegFUUiBUx7tHBHva1I2jqgChHOUW3SD01KqzdWyiKGsPa
         01Kw==
X-Gm-Message-State: AOJu0YxGJp2IJAdaCV0CZeRVxgNYjLyIiP8BM1Aze2zh47X0+HPE34+o
	qpP4MbfbFFZpOxZ7xRMv6JeP8M+K7guo2R6pD6DSGDZTm13GHV7UyRNyKExcWikteHATBXgUZDo
	Hdw7fX7jheRo2rkZ8c1v1dPspwpF3eS4t
X-Gm-Gg: ASbGncuzjFaLMme8H6gW3eE1LRrBBh1ceD50yRxYvXKHtII2584uWqxzgrQoQqDORgR
	MKjDjOdO0cC8o6hVP0VfEgkjIO7Q/uCihraEvEqG6pJEFdRLPFL+vnfhfrGh4Wmxr7eORnEIrrw
	2+A7l7/vejwzPa3Y5IzNBIVOjb40YzI5se3vWEp0nBCneWwtjt3mV5I1qWCiKGAbu95QLW22FfW
	9Yl9BPqGh6aMr5ALzVeQr3vQz4Y8UijbrNkNi+G3NPRCR7B9fh64VN4vj2+SaTHuMxuYgHF
X-Google-Smtp-Source: AGHT+IHiAaTiBf25Gwr72JHYoKPV4xCSfTK59cClLVoa72fNVex51rii9yV5aQj5c6YmFQNoO2WZlXxc84Q0
X-Received: by 2002:a5d:6da8:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38a872f7ef2mr29722324f8f.2.1737032872303;
        Thu, 16 Jan 2025 05:07:52 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-437c74b94a9sm4463345e9.22.2025.01.16.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:07:52 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1] media: pisp_be: Add support for YUV422 planar format
Date: Thu, 16 Jan 2025 13:07:48 +0000
Message-Id: <20250116130748.3426194-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List V4L2_PIX_FMT_YUV422P as supported by the PiSP backend hardware.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../platform/raspberrypi/pisp_be/pisp_be_formats.h     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
index b5cb7b8c7531..09edc2774668 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
@@ -129,6 +129,16 @@ static const struct pisp_be_format supported_formats[] = {
 		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
 		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 	},
+	{
+		.fourcc		    = V4L2_PIX_FMT_YUV422P,
+		/* 128 alignment to ensure U/V planes are 64 byte aligned. */
+		.align		    = 128,
+		.bit_depth	    = 8,
+		.plane_factor	    = { P3(1), P3(0.5), P3(0.5) },
+		.num_planes	    = 1,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+	},
 	/* Multiplane YUV formats */
 	{
 		.fourcc		    = V4L2_PIX_FMT_YUV420M,
-- 
2.34.1


