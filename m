Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0766477BE0C
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 18:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjHNQ3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 12:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjHNQ32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 12:29:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43E71715
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:23 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso40706845e9.3
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692030562; x=1692635362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIpw90Bh2xViXJnbQ5nWex1TBW8RXK/K06cNQuH8aJM=;
        b=zv0UdT8cU4B1emaIFFn2U40x/r6KMVhhrRPL84WWK1jMdaScDd3xz+1lnzXXU2pR1w
         DwsZLDi3ifSFVNM01YqOkXQrRuc0WfYrVvk5FSE/KRHpD9nwTLVzcO/IcuazWbbVsV0+
         KqLDQZcVzLjxSM9G4MScdlUq3sPVR1SlrXRV5Ko8jZrjxbywVxCto+J4DgXad4t22zI4
         Rl7QnhTdzAR0oIKPo701x2r/jmzSArrtXEjqGmH7iLjmRLAWM9s7901Xgk4ni8hMA5K3
         sKM7IAytgzR9SAImdcVEIIGLx9vVIoXqXWSzt2/2aQ5DlaM8ZRGem82ArEqemJZMbiUZ
         03kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030562; x=1692635362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIpw90Bh2xViXJnbQ5nWex1TBW8RXK/K06cNQuH8aJM=;
        b=Q2HL1ZQrLKLbTS/mLPTjEJyTvsdN/H/gA8AvIcpepHnVCLCGMeiKcSNxb3lNG56bqm
         Z1JuJTG+PlaHtAzFHo1UcJN93Q+vgi1HU0Xb5DKwmmO6WtUOtOZ/pACJZzOql46o75kp
         xein7a5nZf2H3/lvxuPB2CTPLUsfiryIV21QpzoJt6vlfGOeK/IWlra2vZE6tPEbyASD
         mNk9vfPRyisGaArDjljT2rFLcU5/eXHi+bhcwJes4gHoyap/N4Ynz6Mai18paEhSuoWF
         S6nDrng0mjDejdKJFP2iC7cYcPRiTU4xWbC6m6Y/BPUIPl4t+qZZxUZzgiiTcZJ/S4Oy
         NTxg==
X-Gm-Message-State: AOJu0Yxg6eoBVMeoFscN91kJ7teoIjJZGiAsnvy1vVLG1sMxH6Kz9kGE
        MSv9CKHNTqEmFRkZQRZxSezCOA==
X-Google-Smtp-Source: AGHT+IECoMn8HV1r7XAFBGwtKYR2TnzZR4SvUL69mUbVJiybowWdfkF2YKKyciPTbBaB523EhEaetw==
X-Received: by 2002:a7b:c44f:0:b0:3fb:abd0:2b52 with SMTP id l15-20020a7bc44f000000b003fbabd02b52mr8152475wmi.13.1692030562227;
        Mon, 14 Aug 2023 09:29:22 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fc16ee2864sm14743475wme.48.2023.08.14.09.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 09:29:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/14] media: qcom: camss: Improve error printout on icc_get fail
Date:   Mon, 14 Aug 2023 17:29:03 +0100
Message-ID: <20230814162907.3878421-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If icc_get() fails print the name of the failing path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6114ea15fd4a0..d0f149db908c1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1503,8 +1503,11 @@ static int camss_icc_get(struct camss *camss)
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		camss->icc_path[i] = devm_of_icc_get(camss->dev,
 						     icc_res[i].name);
-		if (IS_ERR(camss->icc_path[i]))
+		if (IS_ERR(camss->icc_path[i])) {
+			dev_err(camss->dev, "Unable to icc_get %s\n",
+				icc_res[i].name);
 			return PTR_ERR(camss->icc_path[i]);
+		}
 	}
 
 	return 0;
-- 
2.41.0

