Return-Path: <linux-media+bounces-17376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AAB968B5F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51D8283DB0
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708C31A303D;
	Mon,  2 Sep 2024 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXWkPO18"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FB19C56C;
	Mon,  2 Sep 2024 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292658; cv=none; b=II1GMyDQarXAyXylxk4ILRitzE1SsqMDSwH9bkXVAto7ycQOkzzvwn742mXHjjPQHSaI4tMVyiw40nEL7+sv5CzAibMf9n4KVK5CwdxXMZ+CYj/zDf43C8JPUFHtXLr/phWqjrV2aLMJdypsTx7bifaS9rAT4yxjzMG0wdXfhIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292658; c=relaxed/simple;
	bh=TjTzZ6RkcIen3xbkPeqen6B14I4PyzrsLM9e/EvlDLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mg+ovn+XQJykCVNxzgREuFGpiYxj4/R2qUPnVjrSGNaIbsZju3ERon7fIgPk8KB2cC8Jo2mhhTVl+fL3lQKkY/zux8GYHLcchCXrTHfb6BWRSid4cHyI+GK6c7XFGI10CB6SPRF9IcyDnUj0GZ3EBCPnVYJmgVMFJBzqhfcGLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXWkPO18; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c26b5f1ea6so121446a12.0;
        Mon, 02 Sep 2024 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292655; x=1725897455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4xtMGXLEzp83kpWPxfV24dy9j1c1Bq2RgsAdYrXBIg=;
        b=YXWkPO18du5gAv1G2r9Cr2rbrrqKOHcnXdDzm6fW/vH2sQaO//SkTbNzmTMRKlDeiE
         WFu/iMZdDNZuej4zKUu163MsJzU73bA1mVsefEVTZCFs9CBRMB/97C9Izqa4q5OWx4RT
         K+2E+IEMM59/5fqMzd1VcfgLiLeqi+TNvBix2Eri7bmLpbE6iB+qYpPsROLeWKLyGVYD
         QoKSF1pvjxmskOGPnpDnB9gBxPJgsEFXj9/XzOcxncy/F9rebSgdvhU58OZite2PnU7A
         dds01BkoilC1x+KvrZBsaMhQjNw837JOIAf+ef7I4D86CxuCqSZpXGteaww1ShqT4Bha
         Sngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292655; x=1725897455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4xtMGXLEzp83kpWPxfV24dy9j1c1Bq2RgsAdYrXBIg=;
        b=QUleqrb819S9A7X6AUDxVM1kBV/bZwDd2Om6g2Lm50EQvd6vF86nncis6+p/QHegL1
         GcSb3bHS6Xqa1TFUMlXzbqzZW+Lnhvty949Qq+z5wzTj/SbGR6h8clhp5L+lyCf3aFTs
         Ixrv6RoRTMI6bTScI5W5ONvValvGEd6CcbGoW8DqYjHzwYEqD43vmFl44+gOKwp6PJNc
         4tOS0InOd8siWjhUTD/4AoHg7csvPcV26OE8/MnaRXL/quk1/FONbCIJSSkC0Xav+6+l
         gUb+jcQlMCoY8lPx/b41ACqNSdFzacdqhrmrF+oCM7MoN9W6Ec58y9lbQ5Dtp1UdXYI5
         1fnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzVgRcxDJhnUlmb4xXrM1uQf7gpROJqaX1hNxLUPwLt+LGcmMxMvlMsHsxaEC5bbrOtzMUHclzfa+wd5o=@vger.kernel.org, AJvYcCWHGGMm942nEbs/Fx12epa1jeRaer5m+vXBU1PqvSLAY/28S2eIxbDCW2J9xZq3H1VUprr4t60YGRIBv4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu2WtgsMfLwEG7xeXhdanDPfYFP2vKnuKnyC3q8froGZ4nez81
	TZeYRdkfSOYWZFp+NNrp/qWeapb2oo6+Rnyd6oN48vxEq8DSLD/h
X-Google-Smtp-Source: AGHT+IEVR5MgwnaBnoGQ5m3oht3U3vai0mM4pGf4q5024sK3Grw7V9SqYdcZtsmDA2KzyPqdMpZxRw==
X-Received: by 2002:a17:907:d08:b0:a86:6d39:cbfd with SMTP id a640c23a62f3a-a89fafad393mr351438266b.57.1725292655503;
        Mon, 02 Sep 2024 08:57:35 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:35 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:26 +0200
Subject: [PATCH v3 1/7] media: i2c: imx290: Define standby mode values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-1-b32a12799fed@skidata.com>
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

The imx290 datasheet states that the IMX290_STANDBY register has two
values: 0 for operating and 1 for standby. Define and use them.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- new, split out from the previous 1/2
---
 drivers/media/i2c/imx290.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4150e6e4b9a6..1c97f9650eb4 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -29,6 +29,8 @@
 #include <media/v4l2-subdev.h>
 
 #define IMX290_STANDBY					CCI_REG8(0x3000)
+#define IMX290_STANDBY_OPERATING			0x00
+#define IMX290_STANDBY_STANDBY				BIT(0)
 #define IMX290_REGHOLD					CCI_REG8(0x3001)
 #define IMX290_XMSTA					CCI_REG8(0x3002)
 #define IMX290_ADBIT					CCI_REG8(0x3005)
@@ -1016,7 +1018,8 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
-	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING,
+		  &ret);
 
 	msleep(30);
 
@@ -1029,7 +1032,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
 {
 	int ret = 0;
 
-	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
 
 	msleep(30);
 

-- 
2.46.0


