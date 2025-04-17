Return-Path: <linux-media+bounces-30475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17657A920B6
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 17:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74DC25A5259
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 15:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3D253332;
	Thu, 17 Apr 2025 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0n/PhxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FCB253F0A
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901954; cv=none; b=X1ayEU9JKiBExlKMCT2+lIksUYeCIYfcUuLnfIhjJnZT17w9+rT+ZVjtWeavWs23Ai+3nEj98X7ZQvGI9uXtghUNJpau8Ba6QEoVvWBvAHVtZ8eSWkvI+gqGagnpBG4aGEvMZL7O3dKOvPH7ypq+wtcI5ri9LFTKV5trrp13gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901954; c=relaxed/simple;
	bh=BkPI/jsquuEutSKBtBhp6i3QMEWYVqAxUsn/1OzDN8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLpBuv0tct0Hc4zAQclssU54kNSardUEV4qLst19TZrmBbtIv4R8id2VnNQLVUnvSkRJdqHaNkhY98yowwA8WMzoC9RcwNC+IdKxNe4ecB0YWb5buF2Ue2zGCfPYIGNh6RyMkmXeq8CR97xOtFIeBssgpD3m+4+5ySez0QMwudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b0n/PhxN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso7234495e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744901950; x=1745506750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyzpF2Qut9pQweK7+yF+cavtVIaW5lSQPao3nmOF6h4=;
        b=b0n/PhxNkfGySEtAIxir60Fs5sOpTMpply1lt0+jKVw8RV8BB6LXWDMtXGCE87lRz9
         Izjuwp29N2vjULlw1otnzWUQGD7oXQqu0zCSkLxVnXO8kxOSUjs2ErFkEJnpveqiP0+i
         nQsDtr9cquSM/XQ8XygCNNYifDD4OhXgwcR+JYt8ZZckCC2dWnLsQAV6aMTodKcs31Hm
         LCKs8MFvXHgrNYHnOEemPhrkYX0GJXJXtwcRnGewBTjkmQQzKuyB0RQ3d5/aF8EBxGO2
         +er75+UHGvfNN7SEL4HikQWxGATrZ7yTA6M0D3W4Ni/HYeUXqoDC7ywdyd/6QFB268gd
         Q6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901950; x=1745506750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyzpF2Qut9pQweK7+yF+cavtVIaW5lSQPao3nmOF6h4=;
        b=cDCOw/KkG1xtT/smCyKrR5S16r25jOAvkZkbXIN7URlZ7mH0tmOfCXi3nsQVilWjS/
         Bu3MASjzy1oX/2jLPvz3XqHy6YUAe8LyeOZNyMp3Ovb2bQ1ldIhO2TW9147Bjv96z4OZ
         MLp0tire3g26/4Nj2/v+4ygNp758f7TugVuOozAwHdLwbuTCjGcV3I5q4QRdzDvIUVie
         k2evd/f4w818G/616UI2BPossry7rWwMNchEE8oR3ZZ9Ns+Yo60GI71cjpJBkvhbkQ0V
         vgie/wYDQPX26XW0rm4ZCODch9SUFjpJZDhAxCO/oeqYcbNwZsgdwEC6LGDC5inFm2J5
         JggQ==
X-Gm-Message-State: AOJu0YwkzzjKPFlPL1hW+LeeHsnqU+7bCjTfuBv2rSbGMddfOaZrKNgk
	aaQPvbBP0U0JC5eQKi9wEXENq1W9aWk2oulEMP+C8KVZqXbc1Y8Ll7H2b2aqM0M=
X-Gm-Gg: ASbGncv111D34FaBgBHy4k3/TcbNOQqmoZQGTGTiSAL008/1gon2nO2wxBJ1y58R656
	RMvJWTw610ueXVCrn/aOPbuk0Kc/m4biMslDOehC2Fe2OMxogaaofTP5JWXfToWtVCDXAP0+kV6
	bXMToGAjVTpo1/JTzCNWCOttveb7W62bwTP6ze7ztxNX4rLJsyvO6fTdwQfdJP//nbIUWhebJJX
	70rLF9dFJfgkVnr7ubIDfeHXCFcn/aoUVX+0emoyfw0p0NR/Jv5k8ZtgnVfWeGDXeFBoHRntJnA
	oylfubR9xVwXxeYYYO+/905ld0iAH9VSDk0vChKSHAFd26oB/ls/HuoiwR1IDg==
X-Google-Smtp-Source: AGHT+IHsDlEgq/lXBB2FGijLI5IwhPP+iocnNLoFicssvtZVoJBPOCmWPgpivKarz7tpAXj0r5KIEg==
X-Received: by 2002:a05:6000:40dd:b0:390:f460:77b0 with SMTP id ffacd0b85a97d-39ee5b3718fmr5582972f8f.26.1744901950441;
        Thu, 17 Apr 2025 07:59:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447914sm20497743f8f.97.2025.04.17.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:59:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 17 Apr 2025 16:59:06 +0200
Subject: [PATCH v7 6/7] media: platform: qcom/iris: rename platform_sm8550
 to platform_gen2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-topic-sm8x50-iris-v10-v7-6-f020cb1d0e98@linaro.org>
References: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
In-Reply-To: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BkPI/jsquuEutSKBtBhp6i3QMEWYVqAxUsn/1OzDN8g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoARc3TBe13AsFo6AQ6CZWAhNvmpz77+OGK0fIPZKL
 shxtL36JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaAEXNwAKCRB33NvayMhJ0REaD/
 90OpMPjwxDBgo33Uvw+sRg3hBxJkn1b0HonR/FZiZall5doa0bQJrzTGWx3d0nVQDCeaWLt2xHcf1F
 nkfW/7fwdQOVJqt/0tXzPBll+m4JG6KU9M0ek5p5bMQWKfq2GVcQjRItlk+3a62lgsfTP2hW0wjxSg
 czS0yAFzncpz1vXjdtMfBc3vpLtzVyS+NGNl2uDdASei/gvzzMyXlNoz8fk/htLxXjL+tAiCcavFwv
 5V8e8J21v652IsXm0vpjUMtLYBI5D97cx9H+vV6/SrKxRT/+fvg36oplYJ6i8uWqJhC66IfS6hvWZp
 dQtGyLxm8rNLfyg6KEX1IHTE+G9ln2TXDzOC9AoD6M2BvjOmyBUTZ0zPGPaEclOA51KNaN2HVfsXE/
 R+Hz7L29wZzwbHRGe4lCdTLSJKeJB+McyTanfTi7YMla/1/7o6HH+gO9kxizLftefGo5XTexMriWQk
 WkVPnjuWVURRmtDk2IUPVlZYbakt/7ytoEitV48ODKdlQsNbNHLUAgo1cgMYYI2Z3UXLJ1pgTXjPCC
 v6hxMMiKjB52q+RXbyPO0wiA9wTzhOxNXczV+bKQ5E2IqRyieUoq64xH0I6oYjZ+M9cbpQ9Tf3yqZ6
 5VLNWb4t1Gf4ZnIf2klzrS0tTt+8fTz7NaG408OkKsichLviHfwEXNu9GJKg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to prepare for supporting the SM8650 SoC, move the
iris_platform_sm8550.c file into iris_platform_gen2.c that will
contain all the common HFI GEN2x structures.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8550.c => iris_platform_gen2.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 473aaf655448180ade917e642289677fc1277f99..e86d00ee6f15dda8bae2f25f726feb0d427b7684 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,7 +10,7 @@ qcom-iris-objs += \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
-             iris_platform_sm8550.o \
+             iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8550.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen2.c

-- 
2.34.1


