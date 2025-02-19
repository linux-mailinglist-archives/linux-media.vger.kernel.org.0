Return-Path: <linux-media+bounces-26339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35332A3BACE
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76870189ADDF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AA41CCEF0;
	Wed, 19 Feb 2025 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUtLwaUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFFE1BDA91
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958414; cv=none; b=JmM/iz8ECm2iJBTzq9BeMobPWrbjoBG9SczTKr+dH5NVRQYto7o9BXJX7D19DbkZiZkxdI0JWHtHSoiIfPk7FFiGeNd9G47ny5cV+3biC+iyB6MCQ3eNIZm6AHpI074NcP8yEdLEYtRBa/d47lRgKC5sBEPSXabnO7G2COBgK1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958414; c=relaxed/simple;
	bh=7aVrX+tsiYUypnK79wOrxQjOeILMuWsPKifx4wjp8AA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N3T4bBk76BY1UKOBhfwWD3HMo2WvnR0dp2Q/144HkDYr9hKT46cVfeL7wD2QNupopyovEv+rAwt5eQ32b4l46ZwE3sssC3Mm1nKZyXvUXKoRHK+ZsFxEKffctyzg+xcXr/DfWymIc3EbyR6tlNsCoKB5wBE0Drgnx4sL3VVM2mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUtLwaUl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54622829175so2799081e87.0
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958411; x=1740563211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwQQHgcgyVvybzwjPohbyEnIVBvtAls979ypIqY6TOU=;
        b=kUtLwaUlUwXPq6N/IdIrqblCpxsPtGj6GMbHxSK8nCjyfvLJd1F3U6L3/D6g0EpP/J
         D6+sZiFv8cHCR+BYX3wj4ZZQuAVydEMPCxjcFBQk9w8qxKb0vrmoI3Ero8V5+LeGZWtM
         zPAQkNmE4zoob9BaAW6z65oj/Fe3tP6kUIIs/ZBhblCh/q2BS1Y3Z869IxnsdDRyqvG1
         zyx5P94FidZowduDTI1vgAA6B0PhA4n6mbOypFXoBWzBJgKbkpxtNOvoy1ytUxgPHfLA
         owQcp6erzak4IX2IWpDn2Yk8Uda96Sqeq0BkTMwwT8DORUFvTIK8Q+A/rtx4LrqzugN9
         zyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958411; x=1740563211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwQQHgcgyVvybzwjPohbyEnIVBvtAls979ypIqY6TOU=;
        b=unnLdoKi8jPpc5yAvl6ol+V+Y7Dm7O6frUKAgrJwYzogcGDAwO5jubCH86/nejT+iO
         dlsPY004teulQDXZ+gACmv/Izhr0Oj1yXKK7ZMn+iG9Pb2qJDZoYlVmZRwPNqeerA5ht
         oAIZh7Ok1tFGEJBj8sA+pzgGQyacDpn1XERzTkNS/tmYj41arImi+x28uhk+Ge3tSSFr
         tlGUSDacVh/2JFYWVAG0In4oVNTXbwTQEkIeHg8T7AJVrQPeEeVFQaJ6vnwOHzHBiQzk
         41DkTn5cWfqYPoMmLDD019xOnDsnkcJmRaxFAtEWuO12sVEEVo+98KYb7Y+USeKYQdIe
         PFbA==
X-Gm-Message-State: AOJu0YxIsWunQFJek/XJr+QTu0Z65P6I3FxCz8+h/RDiMt18wbGMwots
	4rPnUDdvEq2Et0xnWo9P6SU2p2wJfzDV8ZWJug+DVZX9+vaqiRGd3BJJdQ==
X-Gm-Gg: ASbGncsTQixEYdbl1nuMZVB+xG3HCzd1JCG8+oQg+g7UbvZcNHhSyTTlPKeZQ0z9zg2
	CBnCAFbK8wwdthfJy4xx3o1nSES3s59/Z+B7tMcQrkC9MDpuFAgQcFfVZeaNh/9bSWSAxC5mWJT
	Fc+I/5pZo0vUBjpMFb7egXM/PzScyVQugUP9m1dxlEJeEjozlaWKPT44dRjES+Pik1SLWqKHvIs
	yRWXv2yGtoKzNz4drKmjC7XEuUukJOEBetm8RsWyaHBQ5oQcxhcbZaXH+uI2HXCPqb4rWQWpoAa
	hFCfWJXXqOMi5BbKVMYPQwCZsWPHfKv0mzi7wg==
X-Google-Smtp-Source: AGHT+IHn3xo7xDyMEo4MP1VMnDZOCqW281J6pI2vuA4zswUqqkSslDY/AL+yQdz0/+hF9tKcXTWv4w==
X-Received: by 2002:a19:910e:0:b0:546:2f4c:7f4f with SMTP id 2adb3069b0e04-5462f4c807amr787731e87.28.1739958410446;
        Wed, 19 Feb 2025 01:46:50 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105fe5sm2095131e87.138.2025.02.19.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:46:48 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/4] media: i2c: imx415: Add get_mbus_config() pad operation support
Date: Wed, 19 Feb 2025 12:46:34 +0300
Message-Id: <20250219094637.607615-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the driver to report static media bus configuration using
pad get_mbus_config() operation.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 9f37779bd611..16a52900c61c 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1076,6 +1076,18 @@ static int imx415_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx415_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad_id,
+				  struct v4l2_mbus_config *config)
+{
+	struct imx415 *sensor = to_imx415(sd);
+
+	config->type = V4L2_MBUS_CSI2_DPHY;
+	config->bus.mipi_csi2.flags = 0;
+	config->bus.mipi_csi2.num_data_lanes = sensor->num_data_lanes;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx415_subdev_video_ops = {
 	.s_stream = imx415_s_stream,
 };
@@ -1086,6 +1098,7 @@ static const struct v4l2_subdev_pad_ops imx415_subdev_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx415_set_format,
 	.get_selection = imx415_get_selection,
+	.get_mbus_config = imx415_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops imx415_subdev_ops = {
-- 
2.39.1


