Return-Path: <linux-media+bounces-15896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0594A270
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E37E1C23165
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9566E1C9DE7;
	Wed,  7 Aug 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aODcmQvC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D21B86C9;
	Wed,  7 Aug 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018253; cv=none; b=uXwsYk9wLd0ue4yRR+DPvzIYKUqeOzH46ZjaoKs6QarZJpADyM9v+ouczNocY/sNXhuw8gQxuoQ4TAjHJSdSn3VTBoEHfR+rKt/YhQwO0VMOMpPY/tmi+d2CzV7M+glSAWc7whl5bTJO0THYCL7MWbg0D70q2yifIkGu9flbueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018253; c=relaxed/simple;
	bh=PEMqCmRVAw1rpxfC54jIDW8gTnytjyYMnTaMQHMPWuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hywQ4wSLl3RoZ/sZ7Dqu+RkvCLx2Vd5KLqXLFk/pTHS0s29nvztQmkOvVZBor1qLpSUzZgGdElnqY+MF7QpH/YIUzxlH6kxOz+xiCEdvG35RvAPhwp8a/TUzlgP9Buwo6Mxq3oLCZp8QgtDWi+5LmxQfx8pzpzfl6xRM3QF0KLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aODcmQvC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a9a369055so148381766b.3;
        Wed, 07 Aug 2024 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723018250; x=1723623050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGSVZyOpmh0+cqXmKYFb2OfTSrkpNOO07Ob5AHjePxA=;
        b=aODcmQvCK2KWk66Bd3U3ylZS0UcsDpfIJkTIUSbRx8WX0DV6a2kDAawI30bA5Cjcin
         dBlracpCnTDc9ph+EmpgVtjRPA9r0XT02uiQcc5oQSzWvDeGoBOQLkkjXEaML0f4Nn1j
         1IBNUVIhz4lElaW8RzPdZ8nrRPigyrOYByufvpTS+ZcVs3tsrv+28K9qYGdVa3JewKHL
         37J/hyqs30NuS0Vg+/pg/8zZ5X4HYEIOYI6sgTmdKC5OsKfAfy4+SKMngAk5h8zh4bfH
         A0qD4ciBW9FS5ZqiRm7eQCOCuAYQtDbLO+FBAyGYR/97UobEb6EJ9KC0U83UquMoROsB
         iwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723018250; x=1723623050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGSVZyOpmh0+cqXmKYFb2OfTSrkpNOO07Ob5AHjePxA=;
        b=e2DYvpX/Vpjgvj94Vp3dMxFLxNuVptTy0j+cjAHsZs1aHjV2l3qK3kTY5y5tVosY5F
         t50plziiZnrGW2aNDBFKqvle6EGs1apCsHNEvPuT8Yced39Nk398XeLpU3lVcHzHbM7/
         D707l5H4ZrJcLBV/SwptPb0H6K5Zelin/uqkDXvdNTslGhYExXcv0BFwP0nR5BiCp3gS
         gW1WuYLBq6ZKFCIqmZGpnS3WfjPuzstIH7usR5fLPMhdRuRr2LuLRFdAvu1rLqtENPAa
         aDGAAKsJRQccqs/9GxHHyHs9uK4G1XVvS44nNyE5/BCFbaHjh69vEnHTuqbxiO5Xv7Ou
         srBA==
X-Forwarded-Encrypted: i=1; AJvYcCVBXisvGTkelpbn5gpHRsRq8SxHUh0UPHuL4kJRKhZ5swJbAwhURwm4UjrVS9Y10p26b/2GYnC6bek6TckNlNUJAaQHqNGrTmS3FHIWUY6gYKvwzp6EAtxcjujIs4ODe4XMg6JEc0xhbXc=
X-Gm-Message-State: AOJu0Yxkw02tr8pWpzlF9h6AaW5Ob19mADvISGh+X6TyMGXIPH4nvaUA
	VxlZLz2pbZ4+iQiXblCtXEiGB0aWz7CDsISb9J73Wvavgc7ME0WA
X-Google-Smtp-Source: AGHT+IHxbpGXVbEL5/pkuX2GuUlfz8WtyB+j3kS7B4dFzJJVe+6bcB7hrwpgIpbvmCnDITgklhMzWQ==
X-Received: by 2002:a17:907:3e9e:b0:a72:5967:b3a with SMTP id a640c23a62f3a-a7dc4e6cc17mr1442608766b.22.1723018249644;
        Wed, 07 Aug 2024 01:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c12be2sm614118666b.89.2024.08.07.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:10:49 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Date: Wed, 07 Aug 2024 10:10:28 +0200
Subject: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-imx290-avail-v1-2-666c130c7601@skidata.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
In-Reply-To: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

Currently, the V4L2 subdevice is also created when the device is not
available/connected. In this case, dmesg shows the following:

[   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
[   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
[   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
[   10.454018] imx290 7-001a: Error writing reg 0x3020: -6

which seems to come from imx290_ctrl_update() after the subdev init is
finished. However, as the errors are ignored, the subdev is initialized
but simply does not work. From userspace perspective, there is no
visible difference between a working and not-working subdevice (except
when trying it out or watching for the error message).

This commit adds a simple availability check before starting with the
subdev initialization to error out instead.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/media/i2c/imx290.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4150e6e4b9a6..a86076e42a36 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	/* Make sure the sensor is available before V4L2 subdev init. */
+	ret = cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL);
+	if (ret)
+		goto err_pm;
+
 	/* Initialize the V4L2 subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)

-- 
2.46.0


