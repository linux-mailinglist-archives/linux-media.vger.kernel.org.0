Return-Path: <linux-media+bounces-18137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D41689743C4
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 21:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 049081C2560F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB4C1A7AEE;
	Tue, 10 Sep 2024 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb7Ejeyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DF1A727D
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998147; cv=none; b=rz56HmRI54w3Kx0NbdOs2oIgWnLdT7mA/fMX/odpjWY4QtIFhLpFL+CjIMLml6omb5CAubk781aPe6exMvKh/jOd/RKL1boW2Lu8qOWSUDGvVIviVW6CwOM8m289tQm3QdAXO+p62zt5h9Nsfi3JPQ3T9Gn7OPx4ppfdCrOTNsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998147; c=relaxed/simple;
	bh=SQHIuWB8On75QUniwMi3d1+7+u2v2YJclqur56rL6T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCldh1KVrPCLOadI5mGzRX6kaUZY50Lk8P9+mgNQg9hrPQW8/NN9iUvSQA0bvaYt1fna6VofEGtwavCnk5XO9iWduuWjyDr1N9Wm0O3kaXIc/fANMBBBjdA2SWGOK00zGAfcb4FmsjU8khMYJWM6gwCtHna2kZEi3TweoykLrJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb7Ejeyp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bbffe38e6so46098685e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725998143; x=1726602943; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=Zb7EjeyppXDcAK8U5kNI84fgK+WEG2zaPkOipGegQK6pSL3J0wS4F4qO2i2I86K04I
         K0gOWximOSqDkBPf1Nm3EEPYQ0M8HUgQkdkuig4d+muBsAYy8Owsw7ch0QI6CpuxQhsy
         X6pISqGJdxGMBBsXPof+kNz0AMiSnxnso49OjbgI3kVfgTaiapKxijChgOZAtZr7c84v
         ccsCW8PljBU7U4/IzhW7yVkxamTrUejtOf4apq7YxhgNr9uIdaNBtR/E9Gg235X3Khv2
         ShY9Ev0NAU6CFPhO41/vP0oVpEa5u/DhViIqSI5++mq0zM+X5HKY0Yd/wxUUvH9Bv1cY
         RsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725998143; x=1726602943;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=KyV9uWflhNI4N4WP5fvA0osYXV/4smSjArLi3CU3+zYEx9JVdeUwSkoELl1bdGbfmB
         60Jru/F8u0zmeNyhC5s6z/EKTTdwHiYyOQUdKzqJz6ByJnIvtjGT6FyVWOX3Vx0N9+mJ
         XZpRvKutcCxhvyx0fZDjVs3vzdTPw5ieIcMAqS+ycZUAwIVo3eRaI/ZIVrGRWPzl9spW
         gd1iezchqz0rjs4cQtWJrkn6UEeB/JxCauraDvuuUeaLiByQIgV1NcueZm8IwoXo+vYF
         OlCrxTIe3hZH5OYlgaebBmhz9GtVlAf6WIHNB1vmNugisw9QW/FV5XyGD98q+AQShkCo
         HsYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsPKqB4Qkk9jrhDdBkrDmos3y8qCS/jpodupivWSoJu+kPuJd/+eTkXAZqM7kxdGTCJDyT57y/F4LFEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFWbejkPASQ8YO9DYfl1ebRf+yV4QdBMBfwBi73qMvMi6fBE8A
	YK+6uDpEpKdiO79dx/GqgXyB93zvOu+WhisPzCmpLDVueUqzazwUhlLURzQXg+k=
X-Google-Smtp-Source: AGHT+IHfa7an1E1e45tkw7rHMrJLHbG0XUJoGGSMzFbF9+pV358YwqYsahM2BcKviwirPqbq4V+EQg==
X-Received: by 2002:adf:f64f:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-3789268f0a6mr6925506f8f.24.1725998143221;
        Tue, 10 Sep 2024 12:55:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de262sm9687135f8f.112.2024.09.10.12.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:55:42 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Fix potential crash in cleanup in
 camss_configure_pd()
Message-ID: <7883f30a-0646-440c-95d5-937062ce10b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function calls dev_pm_domain_detach(camss->genpd, true) in the
cleanup path.  But calling detach is only necessary if the attach
succeeded.  If it didn't succeed then "camss->genpd" is either an error
pointer or NULL and it leads to a crash.

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..f4531e7341d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2130,10 +2130,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->res->pd_name) {
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
-		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
-		}
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
 
 	if (!camss->genpd) {
@@ -2141,13 +2141,10 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
-	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
+			return -ENODEV;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-- 
2.43.0


