Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6C479BA0A
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235428AbjIKUtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241565AbjIKPKr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 11:10:47 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221B9E40
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 08:10:42 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52bcb8b199aso5854757a12.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694445040; x=1695049840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqksqqet9giP3P0XUk93/EO90DV32S65YoklfEthG48=;
        b=PEaa9Hx9TPG6zdx7IL9Bhj96ejuQ/g2a9c9PJ7/rMTSPRb5VAY30ocux9bX67LGiz2
         i6Hu9+Fksk2i6VPOKnz0OphxrxN5a4UvZNqweB2ygwpLTe1BMknU8lYdApo4oNmrwe6H
         dWFLRauaSNljpZDKpOjANwKXLwddvKKEZemIINiTPFXzQG87OMAyr3bFNr+z8wbSE+Hp
         2+7RTrpkWoSjMh1QOd+rp0BcGDxio2WU1ZyxugmMFzU6ukFwiF2sW2a3DIxPjq3+11qd
         c0NaeL7NtWYIk1GGNTUR1w3pxDdvrTmZEdqXDft5MulcsekKONj1WHj+kfN6080yE4mR
         wEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445040; x=1695049840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqksqqet9giP3P0XUk93/EO90DV32S65YoklfEthG48=;
        b=L/fLvpJ1230Ns7xvB6a4v/O9UklKlBJRKpUiBM+UdAMUvhx9jWXBsVnftjop8ACDbY
         jBo4P5jPP+rokpiNM2scv7zGGSXU6rYlkqu7T0WhGHGtg41YKUpElivTT005WCl1+tZs
         S+8ZLRjbTmqOWlXG10UXxhrh7Q/8PVlqYeYu3BX4vXOU6AplglYuEmqcnQmQNsEQsUdQ
         R7mm1bjy9nSiOBlKMmJTr25+lnV2rBPZ0vPgcZ6F5lZJjNuvMLQvMdGakrcjE0NbaPl1
         XbOMUqcPLpvEILstThtO8tF30tg2E8cMe09h3BoX68OQaHBvJ09d07nECAvcFAGoaU2M
         2uDQ==
X-Gm-Message-State: AOJu0YyXm39EazEKfaAUW31FLCOVkQEOMvLYo/WlssMXlC3vALcBn8gI
        8KUoh4x4mvE/zUFIhI8wnkTjIw==
X-Google-Smtp-Source: AGHT+IE+jaw7ewPd1k+s1HIhFxPDeTMpckNkvOy0b0OZFZgjpqByn02zIajpJpJNMZQlXzZ1K2kFhQ==
X-Received: by 2002:aa7:dd12:0:b0:52e:5b10:23ac with SMTP id i18-20020aa7dd12000000b0052e5b1023acmr8561749edv.36.1694445040649;
        Mon, 11 Sep 2023 08:10:40 -0700 (PDT)
Received: from [10.167.154.1] (178235177061.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.61])
        by smtp.gmail.com with ESMTPSA id n4-20020a056402060400b0052a3ad836basm4681281edv.41.2023.09.11.08.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:10:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 11 Sep 2023 17:10:21 +0200
Subject: [PATCH RFT 07/20] media: venus: pm_helpers: Use reset_bulk API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v1-7-a7d38bf87bdb@linaro.org>
References: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
In-Reply-To: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694445027; l=3875;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6SOAIR/YhjKNkqDg755glJQs4TpNo65/AFLcjoekzPI=;
 b=wqZ3x2u5JYMEJJayRe/YHzz6FOWYQf8wpqU38EmrFxVlwAa7Qk8rxo4z+QaAzyvTpEsAiU3fs
 +vd7vaWRJxjD2aqUtu9qFRdDChQJXF7YzAqTZhZD2Y/crOK1RfEJapR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All of the resets are toggled together. Use the bulk api to save on some
code complexity.

Note, this change is not exactly a NOP. Instead of waiting 150-250us
between each reset toggle, the behavior now is to assert all the resets,
wait 150-250us and deassert all the resets. This should be fine, but the
logic here is really abusive, as such assertion requirements should be
expressed per-reset_control, in the provider driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 15 ++++++++++-----
 drivers/media/platform/qcom/venus/core.h       |  4 ++--
 drivers/media/platform/qcom/venus/pm_helpers.c | 17 +++++------------
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 2445a814b39f..be633e62263c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -323,11 +323,16 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < core->res->resets_num; i++) {
-		core->resets[i] = devm_reset_control_get_exclusive(dev, core->res->resets[i]);
-		if (IS_ERR(core->resets[i]))
-			return PTR_ERR(core->resets[i]);
-	}
+	core->resets = devm_kcalloc(dev, core->res->resets_num, sizeof(*core->resets), GFP_KERNEL);
+	if (core->res->resets_num && !core->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < core->res->resets_num; i++)
+		core->resets[i].id = core->res->resets[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, core->res->resets_num, core->resets);
+	if (ret)
+		return ret;
 
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(core);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 4a633261ece4..515e7d78b7ab 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -137,7 +137,7 @@ struct venus_format {
  * @pmdomains:	an array of pmdomains struct device pointers
  * @opp_dl_venus: an device-link for device OPP
  * @opp_pmdomain: an OPP power-domain
- * @resets: an array of reset signals
+ * @resets: a reset_control_bulk_data array of hardware reset signals
  * @vdev_dec:	a reference to video device structure for decoder instances
  * @vdev_enc:	a reference to video device structure for encoder instances
  * @v4l2_dev:	a holder for v4l2 device structure
@@ -190,7 +190,7 @@ struct venus_core {
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	struct device_link *opp_dl_venus;
 	struct device *opp_pmdomain;
-	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
+	struct reset_control_bulk_data *resets;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 0e04da8d7eb5..7f22a078b38a 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -934,22 +934,15 @@ static void vcodec_domains_put(struct venus_core *core)
 static int core_resets_reset(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	unsigned int i;
 	int ret;
 
-	for (i = 0; i < res->resets_num; i++) {
-		ret = reset_control_assert(core->resets[i]);
-		if (ret)
-			goto err;
+	ret = reset_control_bulk_assert(res->resets_num, core->resets);
+	if (ret)
+		return ret;
 
-		usleep_range(150, 250);
-		ret = reset_control_deassert(core->resets[i]);
-		if (ret)
-			goto err;
-	}
+	usleep_range(150, 250);
 
-err:
-	return ret;
+	return reset_control_bulk_deassert(res->resets_num, core->resets);
 }
 
 static int core_get_v4(struct venus_core *core)

-- 
2.42.0

