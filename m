Return-Path: <linux-media+bounces-15868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1ED949AFF
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 00:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9791C219FE
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5621D17166E;
	Tue,  6 Aug 2024 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+yfIpi6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F2170A02
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982334; cv=none; b=Pcj2Spz0mgwIA/4gjK1WA7nG/lJQqAJ/5UIH3HF75NPKqMIj9s2/Mpi092BB1fkfYSNGuCKVAwzrWq7TmxuD3ajnBdGjVQDjGqKh7YRmgACjgtuL342SFfMletCRtc51u4q3YWgmOVfxdE9IvL+yoF1WOHcJ+r51xhU85o7q02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982334; c=relaxed/simple;
	bh=5aJc4EHpj1vONHQREXTuOWOsMSgpiahd582rZLbutcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mS2dyvzUpbebtpVqz8IIGBgN5BMco5MxAFpMWc2Shdf/+47+im73HOyqo52CND/+su60J/jJv4KO2zvYXs00Hp8Kr0OpBEKTSuLuu+SMsk9iRNSpm2FprR8xIgFPhwW8WsinumEi7CvPFp4K8mwcD3VD9753gLwyNKgax51vrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+yfIpi6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ef9714673so149983e87.0
        for <linux-media@vger.kernel.org>; Tue, 06 Aug 2024 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722982330; x=1723587130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLn7OVhOIMRd/L579K/B7JfPiLgZys/OGn3zlhndMAQ=;
        b=V+yfIpi6R8wAgJcl6HD/Tf5LAwNYgtsj7AfImnUCCGgec8tlOHvd8C7Xd/IEfyQEpN
         6wihCA6DMrCPR6IX4IoxrvVF7mA2mcRI11zcNYLU4ozWQuUslaNwiK0V6tHy0jWYmWQC
         z4gzk1x/dkukNZtcIhX+gwUw2bcme2760Il07cQjAoX80KnuJLQEm5kDQ/TDUONc9F8s
         ORak852oSMkknDgAG7vJjU8cGRaUoSYLT9HQqvCPCCsoD+YzrIsdhTMC3Gc3yJx7ut1H
         g/F3yDTzCjwczEeos2/cQyamdpfs+qT02YK88Elz+akgvMHI+OjXbm+erWhqvSoWYcvw
         Hjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722982330; x=1723587130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLn7OVhOIMRd/L579K/B7JfPiLgZys/OGn3zlhndMAQ=;
        b=wCIFN3+9b0YgkxUj4kFb+KirYPX6wNKLn6Jk9FqsC2Xx1EQ69CuC+/k9rYDRASEqI1
         5q4d4rPYdMxDZzBZqAX4msLvUO/QFgrkrP1z/KT8udAPOQA0/Ek3zDuh/OG/EaTnzJGb
         2KbAMwNXXITCz1Ik5IxPHzm5stG16U20/ibkGFGp5nEuaYh6nioJp61Xcs5nDLQqwngT
         3hAD/FuG5OLrH66XnxijgktO4u3i/TTy0Y3409qgapVTHqt1Vhfd7KFylca7Ngzm2SWx
         Lp/TjxeSIii+SrLhgWB+w4baBVQ2aIxNP/bQFKq8dyM2geh/lAkvCKTKhraUz1/mMY5M
         KN6A==
X-Forwarded-Encrypted: i=1; AJvYcCVfmfIjSsCH4D4k0yO9e+mdTxslolNhaDpjbWMfeTyDpd9fljOrH0ynpQ1ynMD5Jd6oFHjaVjGdcyc4CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbG9/unIMy+XE8RaK8tDWUI6EsK/LqdElG5N7fWD9fk0ZvgLA
	fF8sLUx7EQwvPKA6i/IejHHRtdCbVy3HE+C449IhQIkBgVWyoEnPoF8aGd+HnOs2TXROeAb5hkq
	G
X-Google-Smtp-Source: AGHT+IFEx99eut+K85G0Of7/hdM4QziKPyBHUCtX6nuQ2eIenUQKbjMcNELUhhJCJfd3dC7rHeDZYA==
X-Received: by 2002:a05:6512:39ca:b0:52f:3c:a81 with SMTP id 2adb3069b0e04-530bb36e47dmr5886196e87.3.1722982329983;
        Tue, 06 Aug 2024 15:12:09 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530de465863sm3012e87.203.2024.08.06.15.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:12:09 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Todor Tomov <todor.too@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: fix error path on configuration of power domains
Date: Wed,  7 Aug 2024 01:12:04 +0300
Message-ID: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a chance to meet runtime issues during configuration of CAMSS
power domains, because on the error path dev_pm_domain_detach() is
unexpectedly called with NULL or error pointer.

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..aa894be1461d 100644
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
@@ -2143,14 +2141,13 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
-		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
-	}
+
+	if (!camss->genpd)
+		return -ENODEV;
+
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					    DL_FLAG_RPM_ACTIVE);
-- 
2.45.2


