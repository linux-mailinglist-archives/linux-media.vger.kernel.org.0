Return-Path: <linux-media+bounces-17483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6196A14D
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 16:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8511C23E2B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 14:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A3818732D;
	Tue,  3 Sep 2024 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gra/Mf6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BACD155742;
	Tue,  3 Sep 2024 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375279; cv=none; b=Mr3mOiZ7sgCcmPeUBqtAMofQDgxrijOgdPVIoGmHzZRpg1y2zTMKK+dIeN1NkfPiUX8iRRQXH+RZon3//r9rTwQC1+Vgg0I3O6vqKOOAW5HcYdYswD7ySEZPenO8Yz0IZgB+lYWW29qyk0rLP+j2ze7/AxXGMN3zm8ZS7AZ2wKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375279; c=relaxed/simple;
	bh=mLbRsAuEZn2az+xO/hpNkX2JQeOIrVUPVKAx//Ce0wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYtwie0wiq7Gp65ykTHb4OQT4UZuuKm4QgifLSWF1HOYENmwc5ont0kFwtWhItBOOU3Ca8Ew69pWVWxLajPk/hG/NIsFryQnk0/OcJUP9Aw3lLrTZj/3Hvew4JPrI/Oe/SY/1csvuimf+8gIdkIARcQB+PcpswAkHYc12tBqlc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gra/Mf6i; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a868d7f92feso601885766b.2;
        Tue, 03 Sep 2024 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725375276; x=1725980076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nTi4hFkusjt4S30oWCJic3EDfgZvusKx0tJOE2LNyM=;
        b=Gra/Mf6igq8dnblOoZPwVPlw6GG0vAZg6hrTxuUiWXedz7xxVGM47lIcN12epTh4nB
         81v/OVAMZw1tuzX0sn8+HTn+2aGvOXK3Yxnkp3lckppQRhcQgFuf/5zGHmtD5IDFvx3E
         ESvtiYoW66LiK+t0R8z53RpecGpJAhO09Lz74KAZBR+Z5HuYBUIICeBSmCx6wRYlOTV2
         xcfQa86spqN04WN0H4IpfWcTEesy8rgN6ucZlvaofqXH4PUjoEW3DXiKr2UBKOfRzLF1
         EiRhc9c2/MFf6ZDovcA/5BxY/d5V6Sk7mrHgbIFNHYALwXZk2xszggV3VimPf62CWXOl
         k67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375276; x=1725980076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nTi4hFkusjt4S30oWCJic3EDfgZvusKx0tJOE2LNyM=;
        b=qpq1pWS15QHZyesFjZJ8lVJ/iNt76mMUoZs3Ji4waulw7DlnI4zFNwANJLKO4o5J35
         oF5wkJpQ0xQar+n3bHz22sXsGDe9wsAvmOVqRJiWbaF/XjSZ1M5HS/wbEMgORyH2Ppxy
         ERcC75l2TNe/+YHABk7BmU0DfuN4KoSSvC34nLqV6t9pse1WDIm4fZDGtgrB6Kt5Aj8n
         iXkzyFCSeA3mnrbXGeKhLQm/mSST582AV8LtUPEqQlsKvUTrct7zBHVEOohjmbq9ATSw
         Q+19HCltJnku3uUhEzo3q+SML2xYoRSfa0YKr00fnl9Wu9Z1hzkTPFWY5+g6JVbpOM8Q
         J/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMEPpVe6YkRIPd9J77ItcQ+rCEn/zAnZhfFiviw2Yrn9FSz4N3OzPw+CGb0swkVrnl4p6DFV81n9xjCFA=@vger.kernel.org, AJvYcCWhsd99ilYCgr6eMiz9hUqLVS4sIyABs3LrXCVWNWI2tUjty8dSmP4xqev/g1P/K4Bt8TJRaGmcNAqr39A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2kn8R5+02saa8E+2HwGdDnlevfVuC903J47eW4K2/BMW8D/C2
	73C33RggVYUbMGdkqk1z8I25kVlQGcmlbTXIl/Vq60KzgvSw+Nou
X-Google-Smtp-Source: AGHT+IGScmabSCWkYPauIOqYsUzTxILK5G8FcaD2OP6WWbfjfryUIYGF59KpjLlhQhtbbSOH1nQIGQ==
X-Received: by 2002:a17:907:72c9:b0:a7a:83f8:cfd5 with SMTP id a640c23a62f3a-a897f83506cmr1387676866b.18.1725375276273;
        Tue, 03 Sep 2024 07:54:36 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d86cesm704677166b.171.2024.09.03.07.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:54:35 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
Date: Tue, 03 Sep 2024 16:54:33 +0200
Subject: [PATCH v4 2/3] media: i2c: imx290: Avoid communication during
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-imx290-avail-v4-2-e4a6c0837f0b@skidata.com>
References: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
In-Reply-To: <20240903-imx290-avail-v4-0-e4a6c0837f0b@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

As we don't know the mode during probe(), it doesn't make sense to
update the sensors' registers with assumptions. As imx290_set_ctrl(),
which is responsible for the happening communication, already ensures that
there is no communication with a suspended sensor, put the sensor to
suspend before calling it.

To clarify the dependency of the PM runtime to the link of the subdev
and the imx290 instance, put the block together.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v3:
- just rely on the already available runtime PM check in
  imx290_set_ctrl(), as suggested by Laurent.
- add S-b for Laurent (thanks for the idea and the feedback).
- reword commit message.
---
 drivers/media/i2c/imx290.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 5e4aa7237152..47cfb6a9e9b5 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1249,11 +1249,21 @@ static int imx290_subdev_init(struct imx290 *imx290)
 
 	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
 
+	/*
+	 * After linking the subdev with the imx290 instance, we are allowed to
+	 * use the pm_runtime functions. Decrease the PM usage count. The device
+	 * will get suspended after the autosuspend delay, turning the power
+	 * off. However, the communication happening in imx290_ctrl_update()
+	 * will already be prevented even before the delay.
+	 */
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
+	imx290->sd.dev = imx290->dev;
+	pm_runtime_mark_last_busy(imx290->dev);
+	pm_runtime_put_autosuspend(imx290->dev);
+
 	imx290->sd.internal_ops = &imx290_internal_ops;
 	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
-	imx290->sd.dev = imx290->dev;
 	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
 	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
@@ -1598,13 +1608,6 @@ static int imx290_probe(struct i2c_client *client)
 		goto err_subdev;
 	}
 
-	/*
-	 * Decrease the PM usage count. The device will get suspended after the
-	 * autosuspend delay, turning the power off.
-	 */
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
-
 	return 0;
 
 err_subdev:

-- 
2.46.0


