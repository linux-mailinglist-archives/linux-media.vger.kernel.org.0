Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A8E48ADD8
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239712AbiAKMuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239815AbiAKMuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:08 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED3C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:07 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h10so22610163wrb.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/cxgb/RYVu6eXa5WDy0gVyKnEzfZc97E8y8XV7wScS4=;
        b=XcrryWL50qN5s0MrcfF1SA0I/2bzCbMZqp/d37UF9ZnepfDiRVPybA2baHAWH3s2oC
         i8uDIXT9NkeVgkAujZJKiqzCvzk7ZStGK/QIBCWO5n9u+oVyhLEhbRVXx1otin9NjMSZ
         pG0ggUKc7qXwHJ9FFqJ8NSTjjGpV1ryORgRWVFIo0r1wtc4SVTT9Uy9UvAtY9V9fiLrx
         D21n7QsBVCnvrL92jCsp7GY/1l91zFKEquyYQjBJzWpJA7SGT+mOV2W5zopm0KigKQw2
         bxpmPFynH5kErURGKwniywYe8m0rLVhHwXFccJ7sMwKZ0xvmdgFBWVAWzsS21URVV/Ou
         ag9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/cxgb/RYVu6eXa5WDy0gVyKnEzfZc97E8y8XV7wScS4=;
        b=b7JxnWGc+UWJM7nozRJiq8twHTB3QL35a7bpdnhO+ctTWdRhlkV6UldjeBS96jUFLQ
         +z2JCSnLeb2yQRDOnvCGdGQ2SHQKPgqcsRMtLDmhTpSI7Zk8SiDYPdfBf/YHs13y9Ral
         Q1lhINBFNEKvrF3uukpj+ucA4KQCF9YS0tiBbV8mNTBWqg6YJNofXgkkXev9++MTRMS/
         4xnfNfTuR0lC4aup3I0Gd7rsN/mztuJY9n6dsc41RbctoKKv/natqFOTieR/dejIXJvQ
         WY19FIWcGQ5+rVe5CH7sweUqXOyFZN7xVMZOgaREPnm0+suzM7cLjwPcIS+IKt96z7ve
         TfuA==
X-Gm-Message-State: AOAM530XlVmatA8nety/E7Cve7idV/RCOptOfvtyTSOxWeiJ9ECQkPWn
        hXxCL6O3HqzT13MnQc+j4VefRw==
X-Google-Smtp-Source: ABdhPJyUpjDtgCXLo+qIBHE11TTM5/hidBFOlOXQLURLmNJL4Dzzg/eNdEH2LU7jYCvZX9xsQwkyaQ==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr3650169wrt.456.1641905406243;
        Tue, 11 Jan 2022 04:50:06 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:05 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 3/8] arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
Date:   Tue, 11 Jan 2022 12:52:07 +0000
Message-Id: <20220111125212.2343184-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dts entry vdda-supply connects to a common vdda-phy-supply rail. Rename
to reflect what the functionality is.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faaa..c4db88dbf8766 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1115,7 +1115,7 @@ &cci {
 };
 
 &camss {
-	vdda-supply = <&vreg_l1a_0p875>;
+	vdda-phy-supply = <&vreg_l1a_0p875>;
 
 	status = "ok";
 
-- 
2.33.0

