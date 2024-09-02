Return-Path: <linux-media+bounces-17381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84C968B69
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB99B283CA4
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F571A265F;
	Mon,  2 Sep 2024 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikyftJkn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AEB1AB6F2;
	Mon,  2 Sep 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292663; cv=none; b=BPOyTmxiqLBVQcpGTBP6pBiLISb5AZcZ+Oocrlw0Qkk3kNkGloVwdMY6ywRpFEUKS+eHw40/FqBohOnsMOn87I3Jm+MCc3EYfFEOiS7vWDSGguqRYNxE7vGtdL0G5waCQ7KRXbdQfioBqatwRDbefh+INGPPeb4iH3AbUK+W9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292663; c=relaxed/simple;
	bh=ElOxBofJFS3FqIivMvaZANT2xPW9ATldUSTSCIy5YXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVicrHd8uc1+QQRsDubQ7PujUSlWB/RzR60ClKB+JXgkoSxIcX+P53tk4c+caPC68n8U103WZkHMQ5UNUHtlAe9xE5wuh8dSVlZo5wD8Gl7lAnFltAUs6ZX81ZcY9MB5JjvJdlsXAIg8j53EIvaHXRZL6T3nSkNCIpCGGi5WEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikyftJkn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86c476f679so515039566b.1;
        Mon, 02 Sep 2024 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292659; x=1725897459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH91BWlbNf9k3CqoGaHxhWlCV3pTOvd9OXWFBubCGPg=;
        b=ikyftJknGRxyhzWZEc65cAFncQDEJuRPJ3BMKO4AunJE20C9L/EXbkTVpn3JaI3GNN
         iUc22x1Peeq+O4nAyOOA1LB6erz0DwtN4PiVRKiIgBX4ixnptNTmBdrhWl2m3fiOCtLJ
         8HdUhJRg4dYUzq86dl57/e4UYzWR6Ocw/8GBzEwljK2eCkWR5ewd7ZrRtHDfyw8U+ha/
         jMRNmXxoCmmEfBwbb4hH6L2kOxzi0WWqvkbPOnFTfUnmFs3E+nWUOv+ASotoDrrFKU4H
         sE65/4REP5DTI5LbWC3/N/E/O0Euj2PpuGyYykLfxL6OP6cO2n1wRC1VTJdV6kooj/Zq
         nPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292659; x=1725897459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UH91BWlbNf9k3CqoGaHxhWlCV3pTOvd9OXWFBubCGPg=;
        b=lVlTlz5SxMf8Zo4rgV5hTJs/wxhOGcfB4U5sKvdEpO3Kx5lDZCjzTM5zYfqLwxmipB
         IXhAtEnGBKnXkRPEtKvNT2LMnenCQV4gBG41Uf1TWKUok2Q0gsjl5pnIwli5JNdhgU8F
         t1i2edb5+yJujW1P+EazEe20GlPg6HMDJW9l253OLrVHP5EZxDgyi9TglDriTYQUsQ1g
         zjFcAIAMddtIVYUA6SZdnekJp0tgPTlHor3duj68lmHYX/nAD4VpwF1njtA8u2jzxD2Z
         CTRA4cbR5IBDBys4i1puAeXyJr/HToiKuoCkLfIcOf2c4a1eQwMF7MArrMt3qdJ0U3wq
         osVw==
X-Forwarded-Encrypted: i=1; AJvYcCVutaQScsKZTR4+LvqP+8BMxjDLYMpz+6Lnq0kIl6GmcNzMT/1IT07eELArFIq2c0Bx763eGIynEr8h3is=@vger.kernel.org, AJvYcCWUQyx79OnghB/mn5MZgsZwQtJJccNB0ITsCrmem5eOWncvD5smD2DT7enxteFlStW4ViSU+ML1dF5QYeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YziTbNovj+YLzneuEnChQesdS0ZUyTNezmpHBKu+9qYibH698Id
	xgJs0VqGPi7V0EL3OXsNBarJU+hRFpsqygA3k1cGnW3tdfdSnCPS
X-Google-Smtp-Source: AGHT+IF/avJyViP33NxlB7JIvafCpQ62Qk7c3tV78whp3DOCwDoGgx03vbyld+NkellYNus7gNflYw==
X-Received: by 2002:a17:907:7d8e:b0:a72:6849:cb0f with SMTP id a640c23a62f3a-a89b9729537mr544000366b.62.1725292659125;
        Mon, 02 Sep 2024 08:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:38 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:31 +0200
Subject: [PATCH v3 6/7] media: i2c: imx290: Check for availability in
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-6-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

Currently, the V4L2 subdevice is also created when the device is not
available/connected. From userspace perspective, there is no visible
difference between a working and not-working subdevice (except when
trying it out).

This commit adds a simple availability check before starting with the
subdev initialization to error out instead.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- the new 1/8 is split out
- use dev_err_probe() (thx Laurent)
---
 drivers/media/i2c/imx290.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 9610e9fd2059..6b292bbb0856 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1571,6 +1571,7 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx290 *imx290;
+	u64 val;
 	int ret;
 
 	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
@@ -1631,6 +1632,17 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	/* Make sure the sensor is available before V4L2 subdev init. */
+	ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
+	if (ret) {
+		ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
+		goto err_pm;
+	}
+	if (val != IMX290_STANDBY_STANDBY) {
+		ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
+		goto err_pm;
+	}
+
 	/* Initialize the V4L2 subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)

-- 
2.46.0


