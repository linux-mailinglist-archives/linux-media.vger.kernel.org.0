Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5611B6A5BB1
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjB1PZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjB1PYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:24:52 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2582CC6F
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:45 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t11so13741337lfr.1
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOZJv5Al1O3Nf++ajfeJZ7JKg8b2Wm5p9dwHgpwfHnI=;
        b=T7ur33ww7+Maj6xcpM1Jp5Se+aSgDMOHmTLf1HO1vei0brYJ2BDAluQ9iq8UbEjiCC
         IEVEYVn1C3T6jUhwOxiPAO9sQ8c7CNrppHI1auLgv5yhH3M0mhljelAlW8kMJx7ECJ4r
         EAzNz+VyG/YI3u1ZoN9nUDWKNJhMymXn+wA7PeJGDhOuFvHnZbFTzB7YylrHTPKN8gpC
         6w07B1KgEBxMyugRRdTaC8Bngjo5Yocmmaxq4q90QgcR7/S10pLcBw7hZzJ10nzPwYMC
         /aft9RXS/0Nv8Sw1iJTKKrDXKvCYm7cx4+6BtHORQZ3tH6kNIbXHGwR8UUYJtc3AaR7q
         HClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOZJv5Al1O3Nf++ajfeJZ7JKg8b2Wm5p9dwHgpwfHnI=;
        b=GymEurDsKftqX5YBWUuD+qtxg9o3hdNo5xDolEZ7dkR+/FVRodk7ccAZo5gnpQrDq1
         dnUnAAAmOidUWOu8UAIxLkDidZ1VuGhGg7odVevkbfP8VGKv7Cb9Vr+11c+U25HEtsLs
         Pq/i0HCmk/SGiodJ87a5BiA9NgcaG9CJPHUuFySMR2OCxD/wY9nc9rF9N8uIwU7BiJxG
         2Plr/zC10W9ztHAXU7H7PzUpdaWmCokau4SaCG7o30016e5eKe0i+ozVWKbkfMCNTBti
         zVZE5l8eXYJJTqh4ki1NqJajypKJ1OqUL46rVj7MOXWfXZ7vAoL7Tdk0SOq+qi6vsuJd
         vm5w==
X-Gm-Message-State: AO0yUKWcE5dU2EhPlVFjEjloaPHxYr8jR/i64CG1jkgqYXIaZkIkJyJm
        kRB53hBdd48Bthad+sW4ZZhBtg==
X-Google-Smtp-Source: AK7set+O868kh/0KamQVaXo+Z+pRaMIpeU1oSERhi2KFO4LYHMFct3n5rQwzSHvyQzeY9WpQ268myw==
X-Received: by 2002:a05:6512:1021:b0:4a4:68b7:d64b with SMTP id r1-20020a056512102100b004a468b7d64bmr838403lfr.50.1677597885374;
        Tue, 28 Feb 2023 07:24:45 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:43 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:31 +0100
Subject: [PATCH 07/18] media: venus: core: Assign registers based on VPU
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-7-58c2c88384e9@linaro.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=889;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sx/AsEeutDVEzb05mFqQidBHgnDp5m3CRWWH6EqqBeA=;
 b=m4cuQUCpvYiAZQbjgycB0N68xXrrz6IIK6w4NiPk96vWScEx1BdCbbgSAriCj8PHJlR7g3nxtMqb
 //Wbg3VED9QLsRST2RgL4dngMe81BMwYI8DxA/obxxyOj59mrOtw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IRIS2(_1) has a different register map compared to other HFI6XX-
using VPUs. Take care of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c13436d58ed3..bdc14acc8399 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -246,7 +246,7 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_V6(core)) {
+	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;

-- 
2.39.2

