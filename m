Return-Path: <linux-media+bounces-15453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F593F5B5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C00B4B20AB9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2128814F115;
	Mon, 29 Jul 2024 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdIdYL+5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F49149DEA
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256940; cv=none; b=ZJtTd81JpF5V8qEAcFvKhYxQdQPnW6wf0GtsQdJi788QZP3p5SQfyXNeDhuXwpsrjCqHb0k8WU3iCCMY6KfWkhZZxT+Kg3eQXkxRj+Y0xh4L29rZyEqqQqc29yxRGvIshIAMZ3dDVyHO5owJowdxLtgDR/oCCOoI4J0VbLG1yrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256940; c=relaxed/simple;
	bh=XMtSAnQLUPLTjEcZ9/jJuTztPkljj4KBCEwVdIRm9FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhsrDXOcFu15Zv9A+xj7pKvwacHUuoVqlMzz6uGxe/07OSwK6Bw0ArMoqCDGKyrEvecCZe4+batj0ByIPe0VV5pEgEMgYw/awi0EenocCtBVxqZLNYWqAy6aIAJ2UdhAHrKb0cwGOCekxUbcclWxNHcL8AiPRj3qi1QiRwWQ5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdIdYL+5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3687fb526b9so1347633f8f.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 05:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722256937; x=1722861737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=zdIdYL+5faQpUDJZwI9HxYaAMurA7BiYm+TksSWvmQGV+37eD/VWOMxc71Z/GNIJY7
         6T808NtQfItXKarLR2yWJg63UioqK9129dtyXa2TKxQflgtmr1k66YSpdKhkrpwBdzk6
         /nA4cGBVgwe3DDGTTHD51/whL66ZH4wXzuB0OsuGVlulJGO1A7TbcIjxiCqm9uy86O4c
         d+TRsVLkhIvauVLiGi19uEI4FDWl0vDR4S0nAOf4dmSh3qu/7C9tHZF1/8xk2eItr5dX
         Xx8SmFfGQHCKrW667KKG76uYtFtU3KjgI/TnE/VzYKoQCduOjarIbPh+PZGCmViZezrM
         4+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256937; x=1722861737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N37H6kLbkNAIPuExxunsB7bhPLTHsDDj/8KnxxdH8yw=;
        b=NvG5TxK1gbs5CBeJ1CLky4C7vhYY1lT17cfrAfJ0k91zkzFqNbz5azdIDqn4reA1/+
         hN0fLUvvesl/0xkFyi2PB1fwl0l1My/hwuIy8to/wE4U/wYioA6Rm6a6RY8054kGzK3D
         TyHSrPYkDgOhLB2dEQVu8m2XuV2RIA+0lDmXd48E5aBITB9YLF4dPfKeRfKxx0vCH2uX
         JRJLNU6RTaFu2+ENuxIXjAY/0oZB2gZCj3SJBeKgKqHvHOLIrnZaw3YxADhiEyMqRdfq
         9c76EUHyD7B1RAEo6h2xGoWsGHHYrHlDpjAlX7uSAhW1UnBZqJFM9q2CdURESS+7d9F2
         Dl/Q==
X-Gm-Message-State: AOJu0YygaPbkJ+sPWQMKuCRAdWZ1vIH7oYn07Pt/k1J7iZbrq8+tz4zZ
	MEIizBDyosc+WCxlsHSaDYek89z+NBPfbJvR0bmCWfCClEm5w6AVrkHAHjYX4e7tZt1/3E5C0aY
	XEHA=
X-Google-Smtp-Source: AGHT+IFd9o55Nf2Yjsmn3MKtdq05hMAb79DL3MCHg9LTvgi6dSD5URw35jk1cVD61sFRmsWeY6X4Hw==
X-Received: by 2002:a05:6000:1a53:b0:367:9851:4f22 with SMTP id ffacd0b85a97d-36b5d0cc08cmr4558101f8f.58.1722256936868;
        Mon, 29 Jul 2024 05:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c092esm12106275f8f.13.2024.07.29.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:42:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 29 Jul 2024 13:42:03 +0100
Subject: [PATCH v3 2/2] media: qcom: camss: Fix ordering of
 pm_runtime_enable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-linux-next-24-07-13-camss-fixes-v3-2-38235dc782c7@linaro.org>
References: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
In-Reply-To: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-13183

pm_runtime_enable() should happen prior to vfe_get() since vfe_get() calls
pm_runtime_resume_and_get().

This is a basic race condition that doesn't show up for most users so is
not widely reported. If you blacklist qcom-camss in modules.d and then
subsequently modprobe the module post-boot it is possible to reliably show
this error up.

The kernel log for this error looks like this:

qcom-camss ac5a000.camss: Failed to power up pipeline: -13

Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..d64985ca6e88 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2283,6 +2283,8 @@ static int camss_probe(struct platform_device *pdev)
 
 	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
 
+	pm_runtime_enable(dev);
+
 	num_subdevs = camss_of_parse_ports(camss);
 	if (num_subdevs < 0) {
 		ret = num_subdevs;
@@ -2323,8 +2325,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	pm_runtime_enable(dev);
-
 	return 0;
 
 err_register_subdevs:
@@ -2332,6 +2332,7 @@ static int camss_probe(struct platform_device *pdev)
 err_v4l2_device_unregister:
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
+	pm_runtime_disable(dev);
 err_genpd_cleanup:
 	camss_genpd_cleanup(camss);
 

-- 
2.45.2


