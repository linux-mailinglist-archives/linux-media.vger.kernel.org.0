Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F226D48876A
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbiAICrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbiAICrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:06 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14909C061747
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:06 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n19-20020a7bc5d3000000b003466ef16375so7686338wmk.1
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=s4QDAkrsbWWo6Op4Bso41dYSVGBQ6LLu61q/iu0h/7q4ZEr5wvuSBdqC7UlxMYWe9F
         LsuuEAgyokh8rIVuXJyLR0/cG8+EAOkfGzxMyBgPyUFjuT04JiL7JqAKLmaGbvMBzCEs
         87sYK+95NA5L5+pEhcui2NeiAGQc5iRfkDyMzFDU7wOgZQeg4t3XZgmjED2RdzevL8+j
         efZ8f/hmlEggdblxpC3VNOB22/Ui6DHapKJb6wk51sthiYCDRILqs3YaeT3KT29pNQWt
         lTJO+ZBddOy4FLA4F1M2BrZeqQ1jqx7Qu/KkH8v+snagVxEov3NqdB9I7GAqcaGskT1r
         iJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5MT7rEoiiCVz2gFm3EQaB2V5VAMjaCUk3cu8vjhwBg=;
        b=4wbrVTTG7cGzXGMkISzYrw0CKWi1bTYeX06YqsCjp0RB2ukNgrIT4xXBuGa59ciQol
         lgrTiD/60Tnghg4UTTyD+mODJpfpeYpJ56ads/OFFP2nomfsCiKRyii8ex6Hmns00RM/
         1+XYdy1HVEpKkduMEO7NBxlGjBnpPJoNpWRYVG72vEz/AzoVh3dt1xikrlMt6MDMArE9
         S6VMmIW1RQ1UM2UoJJpR1Rl+zxtQhF0tTtwBRgUB3AOM33RRDbtT5U1sPyGgiZjj/XCd
         jbMVQe6ibgOyvL87NTjPOJC3mG9S+qA2RhZfvrbLhyQX/Ff/4kj34xYN2mqPsl2lwvoA
         yQOQ==
X-Gm-Message-State: AOAM533O0c7AHgdXWYK84FiAW6hi6AakApv9RRT42v7dRjZ2AXihQdC8
        U1zPxGzUL0wbS5kVxwxwhfRMsGd+JghoxQ==
X-Google-Smtp-Source: ABdhPJySua1hDFonprSsYul58orghyPVu/tAE9uq2rOtsCJ4iSxANWWAFHGV03Benjfn+g3o310Big==
X-Received: by 2002:a05:600c:5027:: with SMTP id n39mr16622051wmr.148.1641696424723;
        Sat, 08 Jan 2022 18:47:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/8] arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
Date:   Sun,  9 Jan 2022 02:49:05 +0000
Message-Id: <20220109024910.2041763-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
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

