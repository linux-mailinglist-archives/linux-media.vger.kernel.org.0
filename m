Return-Path: <linux-media+bounces-5673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A730685FF17
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 18:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FC54B28B9E
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8378B1586CA;
	Thu, 22 Feb 2024 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLX9RatS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783B15698C
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708622234; cv=none; b=tTuHG1iHhng4q2MDRNE47eKW9ZvGCFcSuurkhEC5WA7YAAnXnIAvvq3S5wapKCXp7MbD4PsUJnIDReGaxf3Ydw2X9JVsWc3LboI6QGmo3+3DIDDze29ZBwrYRWrIW8WC63FDYeEHB4NUlqteubjC6j8+B0NP5FmsLRA3gycFlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708622234; c=relaxed/simple;
	bh=0x5HWXoc511jl4jE7uso/3SgLJlKyb8qm95/klfqjDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7dsnYEkSSHFwiyNoT5vRdSjKM+s05CX6yFq/gratNlwznHYq8NJ5dEswQ7EJIGL2JqAyydv4zGrzepZbsbeV2WGxjS/ijg1eAXPQUIN2u+dKiYxjc2YmY1DOQuDOMQpRcwpaliBs/7dep2iCxMw2xxIQKH9obAuhXD5jUBJwwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLX9RatS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0e520362cso82364531fa.2
        for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708622231; x=1709227031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sKnlIWSG3cDDttRD88r2Dst39+N3v1HHp1u9xculfM=;
        b=QLX9RatSNm3XpogF5XrGdb96rtXkp8jBBsO2c0XxMe0UV4mgEQtsVtSh8riCa0a+dk
         at5N3qYxKAzGB4octPLLsNL2fuFXGrGb+gnJcdXeAGPmZDbLKWVYtz3P+tRfwHJJdAu/
         ZYufvzVTejf/BVKFK5Vv+pb6HpdQccu5234HQQFC+q/BgWPCbG2XCPTsx8vwa4hBIzGy
         do3LmEIHZlLinyn6lWAu5AitIf0bUPvaY7ovQPdnbhoRcoJwSkoGWW8dl3kT78K1fXA8
         /v1CJGbCfUgm4tygFkvNIsro+0IXJ6H+Ee8F9xYZ78m5UDgqdlNxSRtxJqwmlJhi/n+M
         f11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622231; x=1709227031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sKnlIWSG3cDDttRD88r2Dst39+N3v1HHp1u9xculfM=;
        b=XEXBdgegFB2MWVOqnp8rbx1yt85iHk7c0CF5kOcyEZ8EJr7VfDD7T5EGRIW5zT4ZbL
         ABxTngI6YdOTsj4jnd5vazQlSR0k4RKdKlr9Q0CrBROE1cJ93o8p8YlDwmpchcrIzEbN
         4mReanX7+3MxDPMZDuKD6tAH+Sh60ncdHZ3rW3LSfKUpqIcqfcGVJtQJDn4FIv11ZMNL
         AiAjGFeOXnulJfA4IqqeuzKWfKCLwW9olkPlHFy6aJDm3KVYRNo8lEJz2vZGn4dth4cp
         Wepub5GniB4Iq4zamX1bn9GCQ5ieM0LlJFq/UgOBXjzRs0m770VQ3iZObYU4sBvF18ao
         EScw==
X-Forwarded-Encrypted: i=1; AJvYcCW38g0yLgxCbv9LSEvP4cKl1JmYE/JFTBKNfeK1mR/HIzya6mMFTuYxVta/hReSzcj1/bwUzPqIcmdglexsB+ytyRqan8xufH4i0Ds=
X-Gm-Message-State: AOJu0Yxul7S+SG4l7s1Gd/2IrT0PJQrDwJuhzyEQJqF6S+Z+EGMrKtQ6
	w+/GuNZR5C0oYIhPtD7aIy84f8iuqWp0k6p3CauCHA8b7WNvycR8iBeohS4FV+Y=
X-Google-Smtp-Source: AGHT+IGUGxR/KXG/kYoe5QqSBG9DbahCUsjNOp28B1sSu5GjjTAROZnKHr57tiYG5k5R2X9+XDZcXg==
X-Received: by 2002:a2e:a7d2:0:b0:2d2:402d:2239 with SMTP id x18-20020a2ea7d2000000b002d2402d2239mr9329460ljp.25.1708622230812;
        Thu, 22 Feb 2024 09:17:10 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bc047000000b0040fe4b733f4sm6656512wmc.26.2024.02.22.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:17:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 22 Feb 2024 17:17:01 +0000
Subject: [PATCH v6 3/6] media: qcom: camss: Add CAMSS_SC8280XP enum
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-b4-camss-sc8280xp-v6-3-0e0e6a2f8962@linaro.org>
References: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
In-Reply-To: <20240222-b4-camss-sc8280xp-v6-0-0e0e6a2f8962@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-4e032

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f0..ac15fe23a702 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.43.0


