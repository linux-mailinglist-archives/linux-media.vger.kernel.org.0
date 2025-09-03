Return-Path: <linux-media+bounces-41616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59773B4114C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2AAC4881D5
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A7D19004E;
	Wed,  3 Sep 2025 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BogbOvWN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A25153BD9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858985; cv=none; b=nvXDOomZg8NB/a+pD3XUmUQSsIOkkisz7GC+LzjZlz1ryFxrwdLUTJEOTTsho1FZt5/pCrufK0x4r+fzh0o4GVwKF0M+IotCAZSeq+pieTrjpaJJ+4wJ4KQwtXaQ0E7gKRkezRUJwBZQy/j6VJGiOg6It1eOwzWrPpFiJtiZZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858985; c=relaxed/simple;
	bh=ItDuIzkAMqI4qhudvDEQpCDeZktM5bnSnYhcN82xNzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gL9a75ZJ290ecwnoW75xFWuhPVbqvrpf/UciiqxiSVYGdSS9Y5aT9f7gcHzzDpfUmYKmUS/z7M6fw7LhrrhiQj2LY7SAvRCsZsEjFteSCF4TZq8vL92lVa0QIpviUgeGDC29jJWMz2HVZuFFULQ/rolxMAiNr0aDHrYUPcV03M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BogbOvWN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7c8b38a0so195703e87.2
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858982; x=1757463782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYiTlBqSqi4UmKkRdPwsgwuRwJ/h9AHJojKVB5RqLYI=;
        b=BogbOvWNheqI1tlVmtpzXzO+3YCF70iCOfXJJxhqLZ7hzo+1StkRlWGQvl6mg8UtxL
         11SCxeshADRnKw9VHmJDMNXAUveF19FufejJVZlxMyT+LtQ0jTsLEaaPVmQFS7of7nsu
         4mzKYsw7nirJO4nxcNe7VH0E4raFDOc9uN6dkiB/RCNRA5CoSDt3PGHWTmJJsj6D2nRW
         8kaH9IQakpfEXs3KcQJRZMwPUtY5hseI7E0q6rFz/hHvj8clIdSqoweO4+MwO9y62Wkj
         47iR1/pvOwe+EsLvClIgBseWVhU2Sz+DS2/UeA1m3qj39UmeajdryCyr9iGse4pKyjoq
         2obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858982; x=1757463782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYiTlBqSqi4UmKkRdPwsgwuRwJ/h9AHJojKVB5RqLYI=;
        b=rwM9ANHRyqWV/id2+q5buMVt+GdVim/DPPTj3AO/3ab1/um8SI9Yaf6gN2/WTphiAC
         Js+aYpxq3gGZ8fTOt7vywqv0l0I8bbqqt4jvxaS99v7EJpuwaAQL7Caj0QTrETc8U5Ru
         uVjIQx3pOnI6kt6lVahm5WGlh7gy6lNOUU7Zl95qaF4x365D1q5bi2FmcUgbBgpWDnBu
         76ZSGWMX8zCky1R72Q9vL6OIKuh+OCb4Xx+FKCTvSDzTjNjFwEy30V7x14ZHWSfE72zi
         iNQHqs7tYWNixoFrGpjgwx53i54hEc7EeSZv7cYmPgU12KtNbluVCqmpZtFdDWnoL8Zr
         oQWw==
X-Forwarded-Encrypted: i=1; AJvYcCX0mZBcMGiqiJJKysK1+X50zRDCdRN9t/oPO729i384kucc4p8zubvc+J/iRINSpzAr0/0UM+9wmunFtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoF+kkn/A36xp48zP/z5WEFHnQEqSWKy4CRAMU0+4NYqyeA++A
	cwVRW2x0hg07vJLkeXdDemd5gErP6McSnmt36lFQu0cUZ/IGQwehsIhVjJiEhv8GOuY=
X-Gm-Gg: ASbGncvGSrQ851XqwNNun92zqo9RlKtwqtxiXDiwKOwgLlSLcT4bap2NBnTT6g3Kq4s
	p1w3HWxGJ34KLa9l3OkhPiBX+hLw+F/jZ8/+C32TnZOBVwKuBtE5DRXh+YN50UCCkHdc8evssHy
	V/bid+Tlf84qEUQp7vq35+Hbrd100uP9Kjl6EpK3sNazxiBoQ7tQCuoZaKe7Ho22548LsYxXWAb
	f7l1keQUD3AyT4aMSB3MQd6y2+Guqr/HQxluy/VNN+bmLynMIBA4zb/tSYenrnqQC1A9AUTAUZA
	VVow/gg2ad0af2LpyySoDIX91EIDeVSTVpIO6hz5csp0H6H9bmugZDz/J8eJfhZrHVak5DGqV8T
	f6DwjNl4I01BMdMz8T5vSfsPJ3CkRPh3EeydC5/cbJ0ctw1k2Ie8/yBDqlIV3dXpMPEnwutEbWL
	b+w7K8wA==
X-Google-Smtp-Source: AGHT+IEHOc90PUEdOLfGFV/Vsa6nH63GOoEniZw5hBiN03ARsjlyJ7qk2VSx0O/iyQYPDLUI8e9Y9w==
X-Received: by 2002:a05:6512:3b1f:b0:560:7eec:274 with SMTP id 2adb3069b0e04-5607eec05a3mr1064596e87.11.1756858982173;
        Tue, 02 Sep 2025 17:23:02 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:00 -0700 (PDT)
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
Subject: [PATCH v2 1/5] media: qcom: camss: remove .link_entities callback
Date: Wed,  3 Sep 2025 03:22:51 +0300
Message-ID: <20250903002255.346026-2-vladimir.zapolskiy@linaro.org>
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

There is no potential for a custom .link_entities callback, remove it
by replacing with a common camss_link_entities().

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 14 +-------------
 drivers/media/platform/qcom/camss/camss.h |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e08e70b93824..aa0f6e2e3d28 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3143,7 +3143,6 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -3638,7 +3637,7 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-	ret = camss->res->link_entities(camss);
+	ret = camss_link_entities(camss);
 	if (ret < 0)
 		goto err_register_subdevs;
 
@@ -3723,7 +3722,6 @@ static const struct camss_resources msm8916_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
 	.csid_num = ARRAY_SIZE(csid_res_8x16),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8953_resources = {
@@ -3737,7 +3735,6 @@ static const struct camss_resources msm8953_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x53),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8996_resources = {
@@ -3749,7 +3746,6 @@ static const struct camss_resources msm8996_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x96),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm660_resources = {
@@ -3761,7 +3757,6 @@ static const struct camss_resources sdm660_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
 	.csid_num = ARRAY_SIZE(csid_res_660),
 	.vfe_num = ARRAY_SIZE(vfe_res_660),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm670_resources = {
@@ -3772,7 +3767,6 @@ static const struct camss_resources sdm670_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
 	.csid_num = ARRAY_SIZE(csid_res_670),
 	.vfe_num = ARRAY_SIZE(vfe_res_670),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm845_resources = {
@@ -3784,7 +3778,6 @@ static const struct camss_resources sdm845_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8250_resources = {
@@ -3798,7 +3791,6 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc8280xp_resources = {
@@ -3813,7 +3805,6 @@ static const struct camss_resources sc8280xp_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc7280_resources = {
@@ -3827,7 +3818,6 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8550_resources = {
@@ -3842,7 +3832,6 @@ static const struct camss_resources sm8550_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources x1e80100_resources = {
@@ -3857,7 +3846,6 @@ static const struct camss_resources x1e80100_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
-	.link_entities = camss_link_entities
 };
 
 static const struct of_device_id camss_dt_match[] = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..1d0f83e4a2c9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,7 +107,6 @@ struct camss_resources {
 	const unsigned int csiphy_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
-	int (*link_entities)(struct camss *camss);
 };
 
 struct camss {
-- 
2.49.0


