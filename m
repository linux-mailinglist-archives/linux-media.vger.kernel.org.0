Return-Path: <linux-media+bounces-26475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA7A3DC7A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F9318902D5
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B50A211A05;
	Thu, 20 Feb 2025 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMkNXDnu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9220CCE6;
	Thu, 20 Feb 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061081; cv=none; b=P7QhG9erD8oeZbbje+l4uUton3Kv11md2/QeRzn+2PX3YMR6TjhwMdTV7nzMxUJA9KmkQZoLG31S+DwoxDBNZobcIW6wXIcafgvL2aIn8rAzQ/wJaxWrU4DqejI0LIuC8U36RmEePEzxtI51SDbuo7O0V5Cx2EJluelBKc5fjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061081; c=relaxed/simple;
	bh=c2oJdhEAPkgZHieAm+Hz9dCi2VAJ3Im9nKjJmOfI5T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edV0qIDmzxB9MfLfoQJkIsL5cnd78Lw7iYCagxg9BRnf4YUazn4vvMnZz96dBfGPwoMuDatLr0Zo3wkyao/sL00SEO/n716KH4xe6MjK9+v6tObjO812kLfW3yzs1TpA0jQu5Yn/hjE2yRP9rCNfMlmL8TU48YifH2R4pbdDq5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMkNXDnu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so1649507a12.3;
        Thu, 20 Feb 2025 06:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061078; x=1740665878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=FMkNXDnu38ZSvBmRDdGoqvl/oHV2PITsQddB+Su4vSQCahy8Cff5nTq3nTnI/dAExQ
         3UpZTb+RZQTB7AVDoE1d6g3DOaTXNeIynfexPYZ6Lzb0HXNzs3wXIEG1KH2JrwVWnURY
         +MfqvjYMubxg/7EAB8eRGRcZwnjcK4ZUQi5GNd2iNCDcW0zn0rxAyeW109JVE5M7rg+m
         D9WpB1kBjkh+wwRYiogXfXHrX6ho/dhtBHZaeLzMakL1Wg2i1hykwE9wh6mpJ0uL1Imk
         ZI5L9788aD+dBJgG2OhDIUefJ/hX4eEvFgjB5wrk7elJzPppVAVfL4XORPCKIauH9YfR
         whWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061078; x=1740665878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=th+517ZC0V4fbqH9CgBsf81RO0nRc/LViRgQwQPk9dM=;
        b=cHU+6UgItWVhE1cV1oAAtcOvd0JlkFqJq6B4Ald6ki2ZdPI5vN8S/EMTk1YjLS7riI
         0+KTRhp2D87pWFOsgUDjaFPSv5477Iu49qGCaz0jNlLX03t/LBj7Xh8QTT8ZRtWIkkEI
         UUXjgcRRO6s66ZjKCrkjyoSgklwpUksCBCtLmwxGicGSGQ+NfhaSZtar0ZFiDXwPPW5K
         szssQoDJk8Sn1zgaxxop/QpLWJr1HftvY8bgpkPx8SzI0iKCMqObEW2eLQT+58my974i
         0v3reuJioh1EAlcpElME829ce6Kr1ZD5u7UJd60lVIaT1EMkpwqyvv3GMdxQt72Eew5G
         eYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3QQsp3kuIqlBlEr1oK7h1jaSIsiVWE2YQjIrpJRdS6ksc/gy1iasdcUHUuArq+FHjctPYqAjfT1EuqRE=@vger.kernel.org, AJvYcCVNOacZK18VPKisPKumQs8R79Hka6ErHVnFd0KQMYvfU4b/+3gGR5Tqqeqj4wrvCPNt87RgmP6wbOeOMQsz@vger.kernel.org, AJvYcCVZg3dJ0he91gS1rpV1xy2P+0yY67YppHeDomtwKPK6OzXpOSZJWMYrqfy5vc9KCsDYiXazWEWPgGib@vger.kernel.org
X-Gm-Message-State: AOJu0YyRvnnDcdKpjjbgteSN8Dam1S+3L4zaKkWXa04yOTyw3/2x1Ks+
	fv5dn7r5K4xJd2Xs0jhYBX3ehoNpsmj6m6Q6olrsl3XikB/y0Q8X
X-Gm-Gg: ASbGnctNxucdgcT4LTPp1DZ1DgjKT5uT+T/YoMZl3V3OKUANbWJu5puyHvKbvLRvuX/
	2Jl+/bQLVkNFSX5srM3HQpy+jTPlI7RKBBXxSXPB2qzyTeiEkGlgT0MfAFNOTWfM/9bUzznRJac
	j3zgJ/0lkljQPf7Nq11g/bTgGtdnp0DmD6rz7bJZa5JqR6agutAcMd2D8ACUcAfpuXAcFm36Hpy
	fuAulFoCOsiTiuRexvICrPe7cr1sRJeXfflnORAveuI165JCVJK9wREwsGGgNdhzGcHmz+No30n
	CEX7jaxp+PaHndpyPNzR8vIbJ/M0
X-Google-Smtp-Source: AGHT+IG+yJuG5x65qDSW6wpTU4i8GdeI5QaF0F4bU7rg7alr8iRr1hZM5jP7CSW2D5EyG71m2P93dg==
X-Received: by 2002:a05:6402:2084:b0:5e0:8c55:52b with SMTP id 4fb4d7f45d1cf-5e08c5515cemr6215804a12.15.1740061077904;
        Thu, 20 Feb 2025 06:17:57 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:56 -0800 (PST)
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
Subject: [PATCH 5/6] media: i2c: imx219: Report streams using frame descriptors
Date: Thu, 20 Feb 2025 16:17:27 +0200
Message-ID: <20250220141739.228714-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
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


