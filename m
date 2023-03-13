Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40AB6B7AE4
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 15:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjCMOtq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 10:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjCMOth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 10:49:37 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC57659821
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 07:49:29 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id fd5so15874630edb.7
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678718968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVDEkwpSNBnNA5bvC0eSecX/xh6oUxrJTLdGIKP8nY4=;
        b=RXRkd3oQBZNGIksLWfy2ollTwlLx9KqZB/gsoL56C2mLEiy3owePjpNvyP9Q61uls6
         ugV1YmgSSIroPFv4zbSXYYoTxtQvgyF4lCo00ZCDS4J5tc8DM2Gu8Iwhfw7aetLpexLc
         Gx+htkR7g7YyAH3iyaOpNIiLVFzggbUcT1Rj9rxwL6K+K3T1gwDFHV2pWMcBQ4OxDCC/
         ZjM6bcJoiOUgu+YcB0xbA3tbujpl/waZKH4QvWGPy5Be9E0iSohARcIDn0XTAxmMec4P
         eV72mcrrPo9Hh3SUgOz1wGV8HMdCnkAwV+MCfDV645CGRBDwV5s6uQFE1XPqArOFg7KF
         aIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVDEkwpSNBnNA5bvC0eSecX/xh6oUxrJTLdGIKP8nY4=;
        b=G0WbgXj3k6DBP9mTTqNLqIEvIfg8mPK2EWogmmWBOcE5IZmFCmnggw2t2DkqmZpiFm
         5TYYReD1CgmL1KudXHBqQ+PSIuvH+4ULzvdMi7oCNNFtbU95lO1iawKIioGHtLhcoyRw
         GQkdc+gn+WWncpQ7xejC2tPSQKAbop4wXAJZOmBfnyKMRk6QuuMJEvicfK5WaSgglVy/
         eYVcmrR19vrYs69O6k2KXtcsReujKlgDnbbtxUiHK/Fosp086xTALkRgotk2C3gE3KwE
         lpoC97Uzuq+Vlh4GegMA8OrrGi9RQibdwln13rT4t874rsJLOvighAtEvQI7Za731dbI
         HzeA==
X-Gm-Message-State: AO0yUKWJS15yS54J/DDpxd9RTg/Gv+lI/F9RQ+BZPQD8cCYJlmHmstE8
        EwTQq8OaXRYOpbKi5gKx3nUksw==
X-Google-Smtp-Source: AK7set++v8/EB+kN3w2/0EoKTF5BjtsQ6bLq3M5TVeZZT3X5plQYEdy63NbxOG1PMBnqA9bc5oh0jA==
X-Received: by 2002:a17:907:787:b0:8dd:76d5:a82 with SMTP id xd7-20020a170907078700b008dd76d50a82mr46118862ejb.47.1678718968371;
        Mon, 13 Mar 2023 07:49:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id ia17-20020a170907a07100b0092153c6b549sm3030164ejc.22.2023.03.13.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:49:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/10] media: samsung: exynos4-is: drop simple-bus from compatibles
Date:   Mon, 13 Mar 2023 15:49:09 +0100
Message-Id: <20230313144916.511884-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313144916.511884-1-krzysztof.kozlowski@linaro.org>
References: <20230313144916.511884-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The FIMC camera node wrapper is not a bus, so using simple-bus fallback
compatible just to instantiate its children nodes was never correct.
Driver should explicitly populate all its children devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Do not depopulate on errors because it causes several errors.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 22baa429ed5d..6839007edf1d 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1440,6 +1440,10 @@ static int fimc_md_probe(struct platform_device *pdev)
 	if (!fmd)
 		return -ENOMEM;
 
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret < 0)
+		return -ENOMEM;
+
 	spin_lock_init(&fmd->slock);
 	INIT_LIST_HEAD(&fmd->pipelines);
 	fmd->pdev = pdev;
-- 
2.34.1

