Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84A077BDF5
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 18:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjHNQ3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 12:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjHNQ3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 12:29:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3478D10CE
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe8a158fcbso27430935e9.2
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692030553; x=1692635353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqmcrIOgwT4P/m/Qo0pGRwGzeNac3H+8rfjS3Os1OQE=;
        b=lVylwUoPcHqSk5F2gMB5oQ+4rf1xoT03hIVlQ0nH7RWxTPTXOkWaF2ArLEjE9/XfBv
         Pho1vZn21uCsBzinj09JqrBxvIronc/CDzjEkSty7NaIkpmitMUEOo0n6SylgVfCZaYE
         z1K3jIZBoRTpJzRtJm9H5lCoJnVsnqQZRAIBGh/NFWOFZ0GV9bsulpHVs+kSU+HK08e4
         dMquqhPDuDaA0kKeCJOkAhXu7uMG9tdqSkQ/v9uuY1/WdnRlcMx1auWwyrRYS66xGh1b
         J/iizd1MNy4HaVGLAGtoVyMrnj9GY/VXJajzJ7LJabHP4Bq9ObiOmz/j7GiPVQ/GIqSG
         o6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030553; x=1692635353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqmcrIOgwT4P/m/Qo0pGRwGzeNac3H+8rfjS3Os1OQE=;
        b=IVy9e8wnXDBGdSkTLM8O2nBBMZQGtD3b+w985DT5L/dslNonH1bEUzTnDCm73Wxb/L
         1Yqyj5alnMz+ecK+UEQghoYp2lmCVfBoaLar6uqjX6JKRSBuafrEibb920CBq7HFFM/9
         CD7CamMtbikyDY4liTd/YmE8qPha385R7ZXXELZCiSO+MBw3as7BnXRxP+ghgCjIwDgM
         XVHZmJfeD+yjttQMu013WG6zFhPWbI9yXibYOcXPFDvkqtBijkQUt1YE33Lj7lleqmqy
         Y9R6leccZMUNyWVrAxOSRcRXXESrw/7PiZ9rYF5qGNLP/X+mlnTaVnzAeQGzNXCGT5T3
         b86A==
X-Gm-Message-State: AOJu0YywoL5EnVFOFi00opaDbI2u+g3xZOJsKh3eKNpoD2g5SeVyxBMc
        hqwT0NaL91Vr7IxApRNOF4122y8Ox+gMUg5sEUk=
X-Google-Smtp-Source: AGHT+IFqeySrjeuMrAJtZDtfzevKsZGX50dzPFfzPupHnYq/yBFk6VCEBeZrWxNQNsJZdLIAmvJJfg==
X-Received: by 2002:a05:600c:2207:b0:3fe:6199:939f with SMTP id z7-20020a05600c220700b003fe6199939fmr8238659wml.33.1692030553643;
        Mon, 14 Aug 2023 09:29:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fc16ee2864sm14743475wme.48.2023.08.14.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 09:29:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/14] media: qcom: camss: Drop useless NULL assignment for ispif resources
Date:   Mon, 14 Aug 2023 17:28:56 +0100
Message-ID: <20230814162907.3878421-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
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

The NULL pointer assignement is a redundant step our compiler will
initialize unpopulated fields as zero. We check for logical ! later on
in the code as opposed to NULL anyway.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d9e1672b74bd7..68eb45b2c0aaa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1729,14 +1729,12 @@ static const struct camss_resources sdm660_resources = {
 static const struct camss_resources sdm845_resources = {
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
-	.ispif_res = NULL,
 	.vfe_res = vfe_res_845,
 };
 
 static const struct camss_resources sm8250_resources = {
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
-	.ispif_res = NULL,
 	.vfe_res = vfe_res_8250,
 };
 
-- 
2.41.0

