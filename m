Return-Path: <linux-media+bounces-41617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC73B41147
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA151A882D7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFD9199FAC;
	Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSJ75jDS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FB1891A9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858987; cv=none; b=J65keDTg+X3LPpb0bKNwZfEaUg1ML62PTDK/iNLC9YXu4Ianq1yfPhFE0J/xVEcG9S8fW4xlOeI+q4omLplQlXLNxxCCOyTYG/sDwwjiyx4D+KI+5X6qyi+Zm6K4pbLVSAuLRG6Kamz2g520QtW4rhLOrprOgxrNNuQzqOIZDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858987; c=relaxed/simple;
	bh=MrqujfyIeXhqk5oCeyv1Cv2fDbkVstu2LZMPVN62TY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4+0HnLxNqHSUePSnLUJXKDb8wf3sWSgZwjaHk0xplLUirGl+bhJ8V+0Z1IzfNjGZwX911PmBi4W7yhLqCtaRO+odLHIdpW6vLs0CGfTbCOQZYRbf+399giDjre9MpoMwnnBB+/9Zj3ivdIL4AGGncC5Xun+zIuzoM8CdPQ9qCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSJ75jDS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6d164d37so1011459e87.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858984; x=1757463784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2fFRcX7qFBHFTu74PAu9P5/ewS65NCYhDHH50BUCrk=;
        b=hSJ75jDSZstGh/yDaJ27N8v4Cl+MDxe1+k1ME/XItanZ+cCdBFp2lJ3EuwIlZGATm/
         ISWRd6Tildqbj48Q4fKStgY33QmcDq0FmRnuOJoHbuFuPSLL72Ccs4yKxhU2rQHAZmPz
         yHwUffZ6mPUtZ9+NreFFtR9R0Wk8ib/tVR5bzMQrUDWAK85fdF3gfFvV8x2fq01zqz0F
         OMaGqAzxcNWtXOxqCRo5KC1fJ3XBq8kP/zZYbLkgBP7JkefpR0p17dnKg3hXeH4vTLT3
         CU2essZ60anJtsubJQ6+K2iIKpJrt6gFlvUp5kpPe1fTwT2872daXT7bqJki5BS7XMnx
         Tg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858984; x=1757463784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2fFRcX7qFBHFTu74PAu9P5/ewS65NCYhDHH50BUCrk=;
        b=Ei50s1ur/uW1N3tFQvtfsMcSU/fIcw5nl5E15LSuW/8ToIyAc6Q3ashLtZlASkBnwm
         jfxDzDQOrvU7s+uk/FIn17Mhfe2Rkk1Ete1sY89tdzAqM7TkmqRge9UjMgxf6GDN/LFv
         /ITVLw6BXHTw76jg57NifNBzsJr0eB53YRMcQkygVycIeMcAQGBBjRNqcpmzI6u/g2gu
         RxJQqswhCqS8Ha/O5pH0KvHwJu6eZtQnnqPM/gSbx0e6UBfBcc59pKKZFy3+LdnJ57wj
         xRZyeD3C5De9c/h9PaeS0f38wYEmptreXG/SReYCNOc4dFqa6EEccmGfadlVcwJggVTR
         ckqw==
X-Forwarded-Encrypted: i=1; AJvYcCV3QBFVz8OlgUaB+aFxaNoSGWiF9XXTNZvcDo5qe7AFB7ssm/jx8FuJwHO2uYLu/3IgdiJw45rU2bFDPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8f7LetVI9or/0aHGS0gbYPfHqnVOuYqRkuzPyhdj2ed1f7gAa
	nV6J7vEd8aDfwIscqguDJFz5cyXthmiL251qTLOF4Rrx0G+YRMGEwm/KhivZNVmgY/s=
X-Gm-Gg: ASbGncsN/LVqrC0q9b7z2Ppwdzc5xOlhvlUmmI4UoZFdix1peyvm41Ux/1lgqpldI3L
	fmkaLCLKcd/sNKeL77wyR2rNLe1iJiLsu6eHr5mEjMsXxAykVESzWV4dPtv2bIaS1tOHy7I3dQ9
	TF0mApnVvRd/JgP5UC9k5vBuYDKa68faWbuECuUT+r3BN1tlEjWjw851GP45OUM3y7fRhghawjY
	4nFE1XNJDfPAjdLTBUX0BFGOo0GMhI8jzeX4j9O4r4goiuntgCEtf9ntWEg5fXvyK6j7+gHEPqd
	UKEFK3BI7M+OVyAsBzCkRraoaEDPyYZloTCPPaV/ALUe2Rx0qnGi44PRUW/4RHCDEyngpkEZoeE
	C8eLJhRLkR5SGz0qpZLmNKc87J1/xOAYHHPziwAaLvlKOkAl//RJUR93YOgjnz2Qdm5Z/f5Whem
	0cqErcyw==
X-Google-Smtp-Source: AGHT+IFUBV51tAxNdpwtLPbgQZBv2eJjDNVnvZn0MG+EzVmpy3X+Bq0V3/UAGc3fHv9w9WLjO5H2CQ==
X-Received: by 2002:a05:6512:ad3:b0:55f:45dd:6f18 with SMTP id 2adb3069b0e04-55f6b22e981mr2348374e87.9.1756858984201;
        Tue, 02 Sep 2025 17:23:04 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/5] media: qcom: camss: unconditionally set async notifier of subdevices
Date: Wed,  3 Sep 2025 03:22:52 +0300
Message-ID: <20250903002255.346026-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For sake of simplicity it makes sense to register all CAMSS subdevices
from its async notifier, this will cover all possible use cases, even
if there is no connected sensors to the CAMSS ISP.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index aa0f6e2e3d28..898d90410551 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct camss *camss;
-	int num_subdevs;
 	int ret;
 
 	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
@@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
+	ret = camss_of_parse_ports(camss);
+	if (ret < 0)
 		goto err_v4l2_device_unregister;
-	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
@@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_register_subdevs;
 	}
 
-	if (num_subdevs) {
-		camss->notifier.ops = &camss_subdev_notifier_ops;
-
-		ret = v4l2_async_nf_register(&camss->notifier);
-		if (ret) {
-			dev_err(dev,
-				"Failed to register async subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
-	} else {
-		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(dev, "Failed to register subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
+	camss->notifier.ops = &camss_subdev_notifier_ops;
+	ret = v4l2_async_nf_register(&camss->notifier);
+	if (ret) {
+		dev_err(dev,
+			"Failed to register async subdev nodes: %d\n", ret);
+		goto err_media_device_unregister;
 	}
 
 	return 0;
-- 
2.49.0


