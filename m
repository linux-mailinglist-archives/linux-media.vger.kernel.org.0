Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A82486E1C
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 00:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343605AbiAFXxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 18:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245661AbiAFXxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 18:53:36 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2ADC061201
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 15:53:36 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id l10so7835119wrh.7
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 15:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=nBpQ5R96wjA7v8we0vDgpADTO4FG8EmUknV1uOTY4F9urxVFnwoww7Seg9bM+fzVXk
         mBkBijjcmK8NN+hS0xg3/sldvz7LbYr9fydbj6OCoBljvy0Tg9jtL530Dlk6dYkbrlgQ
         E3msZfHtvNF9jnXcMDfTQL4F3HEYPbA7beGfdfs5TDMyLwTj99JXk/hcttxfy3rApeWV
         cuYFLaPFi4Au89w/CV1Zx8rKw0tZuivYtqBfBHMBvo21F25jJbWlzx6GDHV84RcnjAS6
         +85hhYojv9VEa7n8Vhgzio656hf4lenor4vkB5El+dxVa7WwkKzV9ciJThta3xKSn/2u
         oEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=OyVQ2Zlj5aJvn46U4qKkiNWT9Nk7CHI6hVmo03FUdW8U5TaR6/Zw5uTKvX71ECQtph
         nnz8qyX7dS23OmeZaNUTUvPDqpjdup/EpL92pQ/F98J0NXheFhuLJeQff9TTVXoxHAuV
         vOMiUUIt596VV3IZj0Bx0Fnuv5s3XIw8+4JKeDlxqlsvDrhljONkC5ttwAYr0dKOcGin
         zDLU3teteYn/rbHFZ1Zz+wvgtLvrx3W5EjJvSThLHyxRTuilDoRYmR3OPIbZB7dfKxen
         iFzhva1zz7VCFFq+bl6XSS/3ms3ogXVYe0JGLa1FDhbhXl7cajP5gp3LIZ7K1s7jS/Ae
         TV2Q==
X-Gm-Message-State: AOAM5330RS2ORddY+nVINT/XMZKpWQ4FKwaUE9PYCVx+j9GgcvKHeR4y
        K9uy3WORSmI+NIpjOWCcJEkwkw==
X-Google-Smtp-Source: ABdhPJzQ2zwvo7AzH07iONQTwtWjXq10u4Twx68ECRQit2ZdOapMSYdJ/IZvpkGsgfZPrcP83MsilQ==
X-Received: by 2002:a05:6000:1b02:: with SMTP id f2mr495022wrz.496.1641513214966;
        Thu, 06 Jan 2022 15:53:34 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:34 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 3/7] arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
Date:   Thu,  6 Jan 2022 23:55:36 +0000
Message-Id: <20220106235540.1567839-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dts entry vdda-supply connects to a common vdda-phy-supply rail. Rename
to reflect what the functionality is.

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

