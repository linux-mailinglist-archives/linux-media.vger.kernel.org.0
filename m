Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1232F784B00
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 22:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjHVUGf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 16:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjHVUGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD7DCED
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:32 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3159d5e409dso3765275f8f.0
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734791; x=1693339591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRW3uVyacKVMz0n3X0Q3Lp2slVRo4x30QDLpyV/AFPs=;
        b=pyv40EeRUk5sNTQJgdpPPpXUXCt1QuMXExoWqPiS+aXi/LZ4ckuejF57/teXbrgiUA
         qcqkFyYKuAzOoPhgYJj6Jkm/+kE0teR6j8GuBtQr/XQhABol9Hxi0LdycC16aMViKpBX
         V6QW5DWyEWRfDPkhfEKK+AOQHTyAlVhz6KRVkA6yMsgKdJ71Wv++wD8FM3wknT1Cu/I6
         EEFaEUZ6YpU2S2WhSBBqhJ0Sfw31FhIN0D750TPBuiFRvzqJbGkGQxY+9TYFoeuZQCVs
         IJKSopZVVZH3YWz+F0MK7SZEPkiE62Lz7tj7jTzeb5feFTm2+mTgF8j9z5YVEoWfVkE7
         ngbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734791; x=1693339591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRW3uVyacKVMz0n3X0Q3Lp2slVRo4x30QDLpyV/AFPs=;
        b=YSrlyjEmQAMhh58fwUw3aGHqbsYaRD1SdaPM2KU8sKjMdSAVEk8iGWGeDdLxQzGP6D
         peAFg8P6CrkLJdlihy1sZ6e6uq8YGyrp5kAcz1Z+rb3aAMFvRZ2RmRj6VFrICatpuF7m
         9MSSpFJ42GeBO6EpiACvwjCPjjkb8Z+r4uZLoeZUlaxZmATBM+jcGhi2yqZZC0YzJG18
         4+fNEcPm3IJiWdXgbErud2aujNnJwQlfa7ul1cgRWq4Lz9HjO+lZaFDKTFyfAnH4fK5H
         iEHy4YQHR0r2XohKtAjpJ9zvW8ebQcPLYEbjZ9ALIcORMdcQ0Zzu8NT8Ken4uk95qKcw
         njDQ==
X-Gm-Message-State: AOJu0Yw5DazsOLiL8w6INciw8g9UdCdYYy9E1CJm/pAiBbTWU26tRdp5
        GZR5a3IDHa4l7BeI5Pkcgyt0ew==
X-Google-Smtp-Source: AGHT+IHnTe7HEmNxFWZ0B8YEYVbUAhQ/N/bPmVChcUUgLQPvHCaklpQEnCIzgQbOl0hUYuNia2+EMA==
X-Received: by 2002:a5d:5450:0:b0:313:f38d:555f with SMTP id w16-20020a5d5450000000b00313f38d555fmr9346672wrv.24.1692734790910;
        Tue, 22 Aug 2023 13:06:30 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 1/9] media: qcom: camss: Fix pm_domain_on sequence in probe
Date:   Tue, 22 Aug 2023 21:06:18 +0100
Message-ID: <20230822200626.1931129-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to make sure camss_configure_pd() happens before
camss_register_entities() as the vfe_get() path relies on the pointer
provided by camss_configure_pd().

Fix the ordering sequence in probe to ensure the pointers vfe_get() demands
are present by the time camss_register_entities() runs.

In order to facilitate backporting to stable kernels I've moved the
configure_pd() call pretty early on the probe() function so that
irrespective of the existence of the old error handling jump labels this
patch should still apply to -next circa Aug 2023 to v5.13 inclusive.

Fixes: 2f6f8af67203 ("media: camss: Refactor VFE power domain toggling")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f11dc59135a5a..75991d849b571 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1619,6 +1619,12 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_cleanup;
 
+	ret = camss_configure_pd(camss);
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure power domains: %d\n", ret);
+		goto err_cleanup;
+	}
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1678,12 +1684,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = camss_configure_pd(camss);
-	if (ret < 0) {
-		dev_err(dev, "Failed to configure power domains: %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.41.0

