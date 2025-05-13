Return-Path: <linux-media+bounces-32397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD17AB56FA
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E325189A950
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFEC28F538;
	Tue, 13 May 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vr2C19Q8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5452BDC2E
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146251; cv=none; b=rNDvz7wgpUcmO9omPCFMTM5PeJqS6oSJQ/5I6ZBgj08w2te6cHiHROiJSFjerYG4hKG7m2pRNkodINqBWK88eokDwqr4wMuF52chSKay7uHNuS6CSxbYyTiKIIUHhyZJvOc8y68onjGBkBjGKfKCYXUbdEYRdrUrJPbuQHRICUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146251; c=relaxed/simple;
	bh=V+yA0wwcS/bVf5oT8EHOGAo5JiL/HicUzO3XXCHGScE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1gDaJfNB8nYRwqsbdSBDw/iAiRuoA/HeiVEWE/Cn1rc7SHYqS6QgiVtOsK2uPrW8KBZJ71EcgR/48v5hGGWfcxhKSQsPCQr1147Q2WiPqPvm9hp6xCwzflAno+KCcwmhSyGOCffgV9IwhRa5y8Erb9RNFZTaxLaendMvOEt6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vr2C19Q8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-327e66237e9so744251fa.2
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146248; x=1747751048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+mIWe4f7/ePA4eiTd6mBWZ/3eo5UNvBmTQDWz6UZOo=;
        b=Vr2C19Q8UQrlRGw30BYh5g29Z+4kEMYE9XewAWBKBjrstcr3s+O+J+SReRrVgIpjKy
         ahCFUFnFRB+e/cM+1U5K39V48VRmKf+gDHZPAIbEdS9WJAnEQa+8UHudDVYP2z6EvHjU
         R476q71FoTuhEFHJ90kAUeBmwsT2I8L2Zj8Hdt+SthICmAPdX27e1ELRGLhS3Tyi46Y8
         8ly41YHABoaF86ZyqSxYhTjdQf2ijut3M858ZOv9C9iNZ6s+dEWG7wKMsRuzzu6jkC3+
         30BZF3AwqdyZevXojPG1x1vOk4vzgHxXmIHStnl/NS7UiwX+jwKL6+efOxrHOV/XN1b+
         Ib+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146248; x=1747751048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+mIWe4f7/ePA4eiTd6mBWZ/3eo5UNvBmTQDWz6UZOo=;
        b=gMhnLUWwT8I4zrMGf1FQk9BeyyuSmN0JmeYecmt6Y7q1HgfANJglTj6fhLgUqX/gFr
         TDIyMe+zdcTNrqLmzIoOKaLfqYp6K3EqviLNK0h3bxK05HrtqnuVcxpAa62a2XiHs2Sh
         akgp5WJDPk3jyPkTldhBStuU0BxkUa+SOaGuKnk1FFh55NhlneMLOaWvEfQnhv1sW13U
         aIJDG18rH+PrXedGHKWZ9Z56Jg4ukV5bG2Fd9ZrHAzOXN1gCYf3F2Ye185I0LWzv0aqq
         XXKAfJJMD3cAf/PbpFONfIj3j7WB24T1byGjoL1xQKyfeUyeK9WhR1Er3QTwGF055c7R
         wL8g==
X-Gm-Message-State: AOJu0Yy1qFgvrSjIZ5NG86BLhmzRRzoXPwoi8IcYBLa5n1lrfM5Bb8Gh
	4ZWYIKe9+IbPAIa/IEpQ5x7zYUZGOrsAVxl5hMv2okahxFsFGm1QsG5EtleUP5I=
X-Gm-Gg: ASbGncuvOXCz6nrr3VckECmJiil2syjYmS11FUX56w1rUH+OKFZZH7qa3B4aqGmgajA
	kqAFiRoLPQkSCEoeaPOcWeJ3scONb2TKXUv6cLAUlqqcg05JZbODGtnjXOGmfXA1W+87mPXs02m
	qdbq0Y8o+l6IaCVOz7C+3aLZB1XBQQ4lyDGFY7pjh/KP3Zyhwp5kEYMIOaZ3XPXaTGccXltSIXK
	DgWD/rXMNQvF+KxOxEow8PFlOAmVgndCgAkjMeyNlO3RteU7X0YbHQ1MUPrA/fGeGR2sPIujLZs
	yu/Jmvl29bJFh9K1r5KDU/ez4RoDEktj3DktX7/4QrCLtUZa1HFPTqWS/amYWfv/QrPtDziPFAf
	Fmbn8YsJ4UZ99AExOFWyWxcyAeyf7eaaJ+MP5+gk5
X-Google-Smtp-Source: AGHT+IETgSn1urVnMun+WYtNS1QXqt+HyQMwe0j+DtEuUcdRDUPi7bIqRr9TigWkClOwQ9fQ4/Hijg==
X-Received: by 2002:a05:6512:4019:b0:54f:c2ab:c6be with SMTP id 2adb3069b0e04-54fc67bee89mr2089901e87.7.1747146247658;
        Tue, 13 May 2025 07:24:07 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:07 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/9] media: qcom: camss: register camss media device before subdevices
Date: Tue, 13 May 2025 17:23:48 +0300
Message-ID: <20250513142353.2572563-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A media device can and at least for sake of simplicity should be registered
before V4L2 devices including the ones added on async completion.

The change removes the second and out of camss_probe() media device
registration path, and it allows to get a working ISP media device
independently from connected or not sensor devices.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++-------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2977aeaf27e1..976b70cc6d6a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3417,11 +3417,7 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 		}
 	}
 
-	ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
-	if (ret < 0)
-		return ret;
-
-	return media_device_register(&camss->media_dev);
+	return v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations camss_subdev_notifier_ops = {
@@ -3645,6 +3641,12 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_register_subdevs;
 
+	ret = media_device_register(&camss->media_dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register media device: %d\n", ret);
+		goto err_register_subdevs;
+	}
+
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
 
@@ -3653,26 +3655,21 @@ static int camss_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"Failed to register async subdev nodes: %d\n",
 				ret);
-			goto err_register_subdevs;
+			goto err_media_device_unregister;
 		}
 	} else {
 		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev nodes: %d\n",
 				ret);
-			goto err_register_subdevs;
-		}
-
-		ret = media_device_register(&camss->media_dev);
-		if (ret < 0) {
-			dev_err(dev, "Failed to register media device: %d\n",
-				ret);
-			goto err_register_subdevs;
+			goto err_media_device_unregister;
 		}
 	}
 
 	return 0;
 
+err_media_device_unregister:
+	media_device_unregister(&camss->media_dev);
 err_register_subdevs:
 	camss_unregister_entities(camss);
 err_v4l2_device_unregister:
-- 
2.45.2


