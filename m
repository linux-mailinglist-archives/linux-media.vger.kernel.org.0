Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9C648ADDE
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239864AbiAKMuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239800AbiAKMuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:09 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D82C061748
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:08 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p18so4159533wmg.4
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3J0iR8CZ/SPxuoJH0dKoQEaxyyD2J8kywG8W64X0rY=;
        b=shZrjg1plL49dAnGufQ0MNkaj9RLYOjJkZ7HtkjLxt/+fIYrW0bk1FX0EhByXbXe4d
         T79bxG/N2o/aYOoZLBjTm1xuKA0RBezifRdVIIGulmkjDyMVDFVCZq2IgDfOAUR3tEw8
         c/Ll0Ahpw3mfwj0ytk0UUincMgC1FEZsYpTcnoMsfSczTaUlmJMIWXTdMBIsrdchMK7j
         QutLcnZXY6VkFgnOswmedgUoEzJ9PNEcNhdz2CuKuEnUVryZTpQ5BU97RYPRzgNWkNcz
         nC/KWefFaBtQCv7KuqORc3ZNjfZyn78jmv+s4bwjQmdgdGnnSQpDf+aOuJIPI0A8yjAp
         wcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3J0iR8CZ/SPxuoJH0dKoQEaxyyD2J8kywG8W64X0rY=;
        b=pX4t22YqIFn5smSMYF1tL5a+Y7GuIsRkLNhDTt/VWAnjL5Ogt8V8xYlAW9IjQkOsAq
         shnic9KuXbfATMZZE3DdBM8M1Vip1ZLrY5z0AxQjlJ6neTIIcG4yrC2hZRof3yGPZq2x
         cfHl4OdbIbmPYoVsQ2o8AThOX55ekBhO4AKBMZ0wnj3UO6zanMSN8BBZchhV3WkQQ/bx
         H9IxYmhClUoh1UpM/MmHGbYPrZg4nO/TgtwjfbFBy2b+zhxtgmKK1cZ87PrUV8lGzb5+
         JpJcT31zvNo+hTmYdBNFqJStWLqP09QR/Fj+NYtSF3fUmn8GyyiBjsN+3ZB7qd7yLpQu
         yYWA==
X-Gm-Message-State: AOAM53382y7kNmkuJ2eBjGX9iCLIEHWsubXDpHuUQU3XnMN6ouBK4fek
        q9HGgde1a0oxo52p72Wt/wcgig==
X-Google-Smtp-Source: ABdhPJyPBRKbf11gsf2QHn4SarCr499bW+nTDvfWZ5f0aCyvGplsKVLMRQ2PCEq3u7ZEnQZ7PdKwwg==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2363160wmj.23.1641905407364;
        Tue, 11 Jan 2022 04:50:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/8] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
Date:   Tue, 11 Jan 2022 12:52:08 +0000
Message-Id: <20220111125212.2343184-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add in the missing vdda-pll-supply rail description.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4db88dbf8766..f7bfd69b13620 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1116,6 +1116,7 @@ &cci {
 
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
 
 	status = "ok";
 
-- 
2.33.0

