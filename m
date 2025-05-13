Return-Path: <linux-media+bounces-32394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67466AB56F4
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3573A5132
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529DC2BE0E7;
	Tue, 13 May 2025 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cio8mBlS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA421F1932
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146246; cv=none; b=NCCEq8qjiEcjwkkF/u7c6+rdgQXbWYHRk+AWvcJ+Ol/nHlt7wbTRRdozTWtD7xcC14zJK3wZjXi6OIq11ihVU6JTTvwBDMEXDRMLPxtRQ+cGXvU0nJ+D9vVVRZY/A3b/LB8CiK92om4JJHQ84sPaYgwCYgTmq6zR4qpLAXt88zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146246; c=relaxed/simple;
	bh=TEtk0BAez4A9tbONJb+ibjQlQfyN/iZx4xrxbWn0Z5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5LicVoTC8GREOA2YjGMPtNQOaxwKpRvHqvN1aaTf10sFh8LQOBT2ORFDpWLRgXa8GlQMIMvBEncFHykYgdoFck99LemrakDYD1Ceqqh0j0E1p1reuG0J7XatI1ovqqgO+Yj/4UnF4DqK34wb6WYXFEqAlC44xFxoZW7A/ZRFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cio8mBlS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54fccaf9278so469110e87.0
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146243; x=1747751043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87PeNSaoARSO0xJcDgxfba3OS94iBFvi7PfmwqCHUmQ=;
        b=cio8mBlSTllkz4DWRti2TqDfgmP3xcLsZoPnt67S8yS8fVSR6a1n7xh17mudDkS/z8
         sMCdCCZR3huskBa1YsHzCDv6sjYdjz/auEH6iOAsfGjurZtZzve/C1VZSbWRp0hSLTQf
         0cqy/KMwMgvObEjCEcW/QObTMRnTIvCJsqfI6EYF75IW+gdvwRchskgnqDbhz0uTxeAd
         PZsGeeB9ieMpYKA353z4zTzCObxk2If7jRKj96mzIJ6RPO/VDxJhEx7+O5bXmtKnJOTO
         GcLvYj5WqDpi//ya/S22vYYvnEguvxHHVLsH2tfwe8oFBpm6xV7rvJtQ4oub8CuqW2vY
         L4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146243; x=1747751043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87PeNSaoARSO0xJcDgxfba3OS94iBFvi7PfmwqCHUmQ=;
        b=vw9PjKwizAyKDT7SpZAFF1tZLyQXkbz5Cz7OsmA3P7AJAitsSLYDJSxi55B1Dj/Cj9
         fSpThDPbbHL7UOILPIKzuxLriD5BvXln99DV6H48EcumzWhHEMbWN0p4LwbfgBJMxezi
         beiU8pVfyIyHVpg2mwyCAzsyJeZtx8frkRYDx/KWFUJN/Bv2xQOPjcUGx6XWqSfNKCBI
         tlz+CyKPuiZift3onF07cbfZ9d4pVvuypVQ6BW5UHjPkQXNy5J0GeLRdWdINtwv1vjVC
         0nQwu33tFadUd1PsyXR0DJRIxrvsJ+RGqNIka2L7GLC4xmg2OMFBiQNcocVIiRd5RFIr
         AYLQ==
X-Gm-Message-State: AOJu0YwthsGoVfmJio7zK4u0wiUn9oohI5XwvVyxw94iGGgv1kOFNph9
	O7rwE//uXEkip4EeLu9J2WzoshHH0x/0s6ALGBBc42I7mW6l/wOV2/od4Xgk1Tk=
X-Gm-Gg: ASbGncvipYXxbaMkQLlUt0c/QI4j1Zaqu0XfdOvsvgiYZY8s4M29fbH3inKlqphluNr
	qFvmGGLOES1UUXfH2cl9MqcstFeAayUC1UuA72mDvcoMys0i/izJAocUCr5pWzhVwZmnNPxAl/5
	mvEiWG6QW0iuycMaqjjyfgwoCMmHcEEht4ii5p/lULV5pQun5N+Z8zcXi5eHLv86/ni9xtWygk6
	qlpbO6i7nOPEQiR4d8qKKaYgTMJwQGm3LcghBVGc8M4tbOCsV4atwRALQjEg0mISSqkBC9EUruY
	n0681Dkbna4QUR4XuP2/106/6KdmgIdEEktLtbLFTJTyNcahf49lO3bX8E0nbMwR9KNwoQEUtm2
	nT3jTmJFYnxPJ3Eh/cTx4PjxnovJgoSU9s5+rydxT
X-Google-Smtp-Source: AGHT+IFCj6ItwkApXIPWgFlOj214q7Cn7XzHyhJB7R1HfvQX2QzqVdxWqZtWqd1cP42fxdofZLJTcA==
X-Received: by 2002:a05:6512:acc:b0:545:2f92:ff5 with SMTP id 2adb3069b0e04-54fc67cead0mr1820285e87.11.1747146242900;
        Tue, 13 May 2025 07:24:02 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/9] media: qcom: camss: cleanup media device allocated resource on error path
Date: Tue, 13 May 2025 17:23:45 +0300
Message-ID: <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
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

A call to media_device_init() requires media_device_cleanup() counterpart
to complete cleanup and release any allocated resources.

This has been done in the driver .remove() right from the beginning, but
error paths on .probe() shall also be fixed.

Fixes: a1d7c116fcf7 ("media: camms: Add core files")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f..f76773dbd296 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3625,7 +3625,7 @@ static int camss_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
-		goto err_genpd_cleanup;
+		goto err_media_device_cleanup;
 	}
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
@@ -3680,6 +3680,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 	pm_runtime_disable(dev);
+err_media_device_cleanup:
+	media_device_cleanup(&camss->media_dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 
-- 
2.45.2


