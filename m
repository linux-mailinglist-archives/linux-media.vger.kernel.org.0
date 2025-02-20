Return-Path: <linux-media+bounces-26529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEAA3E817
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D7C19C1BE0
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FE9267F63;
	Thu, 20 Feb 2025 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k98tVZW5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08811267B86;
	Thu, 20 Feb 2025 23:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092935; cv=none; b=Ke7oyajdd7SJ5batZFnnplHnlmRlcWJrmy123tiOQWCPJUNjF14uBNk0l6koQ5tqkmUiZID2CRfkUjhga6wORt3In66iPwxwoN93OlkmNWR0lZbz33nesWAQTpk9nuKtYolp1zBEp0Bjw+yDhbJh5wVt9UcPDMQR9j84cERpm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092935; c=relaxed/simple;
	bh=c2oJdhEAPkgZHieAm+Hz9dCi2VAJ3Im9nKjJmOfI5T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZKinQp4c2v4RpHcd2MruwOKMfrFbwDHZJ/N/vy/z2IU3Rmk7aTjZ/Hu8SFXl61eJ3n7MJmBV46J90EsvTFw9NSnFshEFXRLsYCB90k+zODcAwfaa+l/BeBoxvcAlLC4TRXduwzoWFjA8IvwbpvjEJqHcoFCg+/BLoofx468z6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k98tVZW5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so2762707a12.0;
        Thu, 20 Feb 2025 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092932; x=1740697732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=k98tVZW5vY55Lll6g4sCaMUz3X+rXpctZx8IlDTl0TrgtGcqgfQ9U0lodroDEGTbd7
         ahGpHch7UUWcoD0iLDuw9JBO55tfA8pTG7q/Q94bdFRhNfo/HQ1YpwDZwxtjHhLZ46CV
         7Sl0Jm43ZhFK0hrWRHjKDEXX1eeof6bU8XXrssFAVYxEpA1zRTyBF0ceh3CWW43cCFxp
         r7eqhLIwH+/fi0vyQLur0wPSAJ9IfUuYvUc8Jh3UNzkFXVpDpoKGeL27wAwwkYHMMUl8
         3KxnFmQdTIv1+MG2kyqQOaOoeGHh8/fmwnTDXyS77pstw+r8p6d6W+eMvkCoXYee9Lb5
         AFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092932; x=1740697732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=Ah3t5qCchEmCv9nLbsGaskNz5Qz/ec2Kedz0YlKag8ZizZ3Uwl+26RqoXy9e/eCaG6
         jtlzrVdXUAup7S6sM0V3Xp3qUdGuVV8HctpbUKC8YH3nHFXfLYUlJyTNBGCGGToyr5RX
         cdTVC1GbdHHTCMPdumEa0MOI5S3V5W7BQyXQD8r9hB9lSce+b4LaA/vSlcEMTFltISIn
         LbrXhwb/JYjyLIohigLGXvVaCLah7T9qih9P6XARlPIr7WfZ7KPVo/hCy0/HaKRwIv4Q
         80UWW4hra9hoiZYMmJLjU/sdyz7V1q3XyL2V5WETsVV6vpp6XcC6VLe7hgm7N+5FP5QI
         XqIw==
X-Forwarded-Encrypted: i=1; AJvYcCVaiSg0Pr7KN35X5UDG4kb1pC6kcsD0a4zSOYoqS7paDbpojB9RhEuDytk7MxxkHtAkRgZktayIGFDhwskW@vger.kernel.org, AJvYcCXGTjOH9btuM6QtbTh6bcd5P7Uh/GcATJqR/omEgqs0+jUt4aiBdfXy2wreyHHmmLNu+/BiRftzWe5l@vger.kernel.org, AJvYcCXMbHa2fea1TOqkyI9vi0FOrUK/IWsTwCQrYESpY+dgh9mgi9a1W7d9pI9/u2VAdA9Tu1XqkvZv7I/tnqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mnvGgQC53nZEND2UM2SfPBW2w5EYF0Q4NVfXtZM65WYZL3jH
	Xc0fHbB2/Q/LKIGyezjkVg1ORDU+hduvCrxzauLyGBtxpwJf6tMA
X-Gm-Gg: ASbGncvKLKPOXb4A/LGfclqOuqHweFNcTBBrRFksDrDuxdZeHIvp0dKQCIWp0q96rA+
	KFkZ2itu7O+sIGAEr87YQ6R0UueApogp9AmsWcWwsRc1O01NeaybWh+2yjY40hOp+IlnDpqy1Jx
	j0Ewoze4V5FWHivcP7xOT/zU5i4josmcaSUlGPyw0UUniqpDF9YG3mBmJeptf3wMy4FKrBkxtp3
	7DFXgd25n1Uv/AGYjmTXb7+MK0zdIn+JcKBV3UDytTNDqHz4FkSWquz4Bagigcjj8kp96Fssdpm
	HDZe/XUxmrb4bAd5AksU4yz/XgCU
X-Google-Smtp-Source: AGHT+IFfE/1JdGnfUcNxpjJHL3/DYWaNKaOhzV3vJxEUOthUy2riBK/uCS6Yxc/sSSL3TdBg0rq7Nw==
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-abc0de19516mr43067066b.40.1740092932201;
        Thu, 20 Feb 2025 15:08:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:51 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Fri, 21 Feb 2025 01:08:13 +0200
Message-ID: <20250220230818.275262-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Implement the .get_frame_desc() subdev operation to report information
about streams to the connected CSI-2 receiver. This is required to let
the CSI-2 receiver driver know about virtual channels and data types for
each stream.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ad1965a91ae3c..4c4ebe54f191b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -990,6 +991,28 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	u32 code;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	code = v4l2_subdev_state_get_format(state, 0)->code;
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	fd->entry[0].pixelcode = code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_format_bpp(code) == 8
+				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -1000,6 +1023,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
 	.enum_frame_size = imx219_enum_frame_size,
+	.get_frame_desc = imx219_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.48.1


