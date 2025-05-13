Return-Path: <linux-media+bounces-32399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80093AB5701
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769837AFD54
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0A02BE119;
	Tue, 13 May 2025 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5fJgXZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6FC2BD018
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146253; cv=none; b=glyc1rcmkM8Vtl3IrVgmAwiKGP0kZ0mQnhPdBE/fiB05H+WTx66fkGPOtL7FS/DuuXoZ4m360bIwXxkNTL/rdLz4SzDMvlSTn2dU1vE4Wus89ttGuJl17X7R5bW7gM7dzPSv/A2ylpNgd6IYivJOSZk4RZ1L/CGPGYHsVNrJavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146253; c=relaxed/simple;
	bh=n5GbW9547xms/973wpMFEJ+iyozutW75ILZ3e5FuJag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWF/nHCzojXA7rDQ+T/v8cpCnWePWvBU42BZq7ytjynPW6ZgZ4xtZlx4v0Tot63mmb7c5T5vF3mFatx/K7/3WkCO0pwxWT6xJ0aNtU7+K8CupqnO13kFXEvIf0vYrJEM3Z71h0WPtY93s0UF1SUr6nQX++WXfBrOOTliB85u+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5fJgXZG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54fcffcbe14so446612e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146250; x=1747751050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je1pnbYGeDSwO8l0nWcUWFR3rRs+nLJrQdN1nv9aVoQ=;
        b=n5fJgXZGNwfmbKs+Ga9tFehNOy7onWR9RNIgdZbdchKERdnzJHaTgL8+LrxADT02gy
         bByHIe/ohE8pssKrZV0ynxNvNQWhVWRXaxhSnJEqauVb82wkZLMgpefMiyfIAGA2INAS
         AYQXZmcpTqyvbQAoPjxps4k1AJgp4HKpOhJfB3ORWQDYXRwbQ/UVU1Wd0I5YNy4PhDUs
         5ih+0Mx/2AvQg+i1242OYSs2QDDd7ky/UJOKT+TTKJB7sDrkZGYRoFjm87BiI0iGGTLF
         wc7BaXBrv7LrsNqUrR7fedmyJCPOJX4izU6rE5VrgO1mN96m1ad9DbUGtlvHvbi8L8cV
         sTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146250; x=1747751050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Je1pnbYGeDSwO8l0nWcUWFR3rRs+nLJrQdN1nv9aVoQ=;
        b=I6D+NtsEPRWHomWN/cWXwSmSKcoJ5jHPFcvSsaauHIUAEUng5hOoP07ctUcnBwV0Z+
         LifS1Q02ge+bMBoymvAZ05ghDXPCKY1GhSBG4rqFEyVvo3IFQXIwdWodp15XItN+FrjJ
         tU3eXytjbKweTsd1969IbpLvy4rJkSWPuxDeImD8Jl/oenY2syAoROLJ1LyzFxMhjKx9
         KAckiz1Rq7f+CvN6StWmvTP5FzGcQoDUUfoXZ9DEI+EGKM0qOLUsAIxxqIK2Cqo6q+xy
         MafLp33Y6hLdnZuCJ60Ouxz536/JIwoOBWDNsmsAyhQO+/Q1yiTMaCyVAnhX/p3aaSG/
         78yQ==
X-Gm-Message-State: AOJu0Yzo+Ea0vMl9gwO37HxocawAiBhOTDjmbZ8+l42PkXaJzjK+n/JT
	dWZOhF1BN4AkDsefH6uWFd88dxfqX6b0Z3fm6biHqGLVLr4ahLumFUkmzNVDFx8=
X-Gm-Gg: ASbGncvf29gJ4tJiCn3X3d8Pzh49UyCVkNQaRDNOchCC7pEhZnWTut9lDTYuTyjkcGH
	7tnJ+mDUL1ZiR4h+sGRzoqES4RhcBg5nlmvlve5o24Cg8Tt6nhvS9qzAESk2ORajzyR4DADMdQk
	H3KOg0s+uYXtyrldkCehnSFOmHUnSfg7Gqoe52KW/1f+IhjqfAQMgmH5B2nNgjnKuwvFMOsCuD1
	145BmDMrmKVeIQ7mrufT3WzORUwEe1lRHxdB0dNlWY4xLtPQ/HIRU+nUfqk29Ko+TuU2qArTDg3
	Bhp/hMkXH3MKRvz/yym+xvDgjEOr6e9JSbgRRSclv8jVbBCt/6ZZ8YZTYm+90Uk+aLs3EvUwjdC
	zVqcDebwfutxgCbMdirm/o/8NaVG6aFkTEE0X5qecVBJ2iOG6BpA=
X-Google-Smtp-Source: AGHT+IHTeW9zs26KYKOPDOT1amI557o7iaow9p3jy/WNJzSFNHOCm9k+ajDzGAdoM1UDpUNvywcrSQ==
X-Received: by 2002:a05:6512:10c5:b0:54f:c088:fb11 with SMTP id 2adb3069b0e04-54fc67d3101mr2037761e87.13.1747146249850;
        Tue, 13 May 2025 07:24:09 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:09 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/9] media: qcom: camss: simplify camss_subdev_notifier_complete() function
Date: Tue, 13 May 2025 17:23:50 +0300
Message-ID: <20250513142353.2572563-7-vladimir.zapolskiy@linaro.org>
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

For sake of code simplicity and readability reduce the function code by
one level of indentation, the change is non-functional.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4e91e4b6ef52..39c5472f4552 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3385,35 +3385,35 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	struct camss *camss = container_of(async, struct camss, notifier);
 	struct v4l2_device *v4l2_dev = &camss->v4l2_dev;
 	struct v4l2_subdev *sd;
-	int ret;
 
 	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (sd->host_priv) {
-			struct media_entity *sensor = &sd->entity;
-			struct csiphy_device *csiphy =
-					(struct csiphy_device *) sd->host_priv;
-			struct media_entity *input = &csiphy->subdev.entity;
-			unsigned int i;
-
-			for (i = 0; i < sensor->num_pads; i++) {
-				if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
-					break;
-			}
-			if (i == sensor->num_pads) {
-				dev_err(camss->dev,
-					"No source pad in external entity\n");
-				return -EINVAL;
-			}
+		struct csiphy_device *csiphy = sd->host_priv;
+		struct media_entity *input, *sensor;
+		unsigned int i;
+		int ret;
+
+		if (!csiphy)
+			continue;
+
+		input = &csiphy->subdev.entity;
+		sensor = &sd->entity;
+
+		for (i = 0; i < sensor->num_pads; i++) {
+			if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
+				break;
+		}
+		if (i == sensor->num_pads) {
+			dev_err(camss->dev,
+				"No source pad in external entity\n");
+			return -EINVAL;
+		}
 
-			ret = media_create_pad_link(sensor, i,
-				input, MSM_CSIPHY_PAD_SINK,
+		ret = media_create_pad_link(sensor, i, input,
+				MSM_CSIPHY_PAD_SINK,
 				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
-			if (ret < 0) {
-				camss_link_err(camss, sensor->name,
-					       input->name,
-					       ret);
-				return ret;
-			}
+		if (ret < 0) {
+			camss_link_err(camss, sensor->name, input->name, ret);
+			return ret;
 		}
 	}
 
-- 
2.45.2


