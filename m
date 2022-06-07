Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9BD540042
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 15:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244847AbiFGNlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 09:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243668AbiFGNlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 09:41:05 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125ECBBCF4
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 06:41:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k19so24214618wrd.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yHhpnE3ZGoGrvzDhV4NP/nzD3vM7kpqOZlaREnhoQY0=;
        b=gQAfK2ZOiazGohPpp6VRZ/kpQrAejiW+Qpq5KT1xRympXKTSMu/Xp+B3sxQ85v4e9E
         28/PIDOFbXaOS8ygg2LsA5PtOgiOLpmHGoOiDsyEAlgx/GYC97g8yDdIevpMRXkWNxwL
         tvAVKWSIw1Sz2BhzFuV/LUTGVQwqBU7rzVddCn/JmOjgBRC/p6GH5Gkole0IhAIdmdjb
         o/cxuj3mp1jzg1qN6eTE7QKTpyI5xAJ853sXNClLeEcXPN8NXCa5b00C82k/XLl3q0CT
         thbxpQlfNkL9G9nz2Xw9RuQq5Ael7ZwIs81cqoGzD1ywCHZvUo4TvirtDaMlWDUbUKtl
         QmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHhpnE3ZGoGrvzDhV4NP/nzD3vM7kpqOZlaREnhoQY0=;
        b=1HtzMMfBEIZsTLlUu6criA9Lu6NcWKHaMyZUPzwdLrbOcoY/BvdK+wG0cBy1rPJ6Pr
         D0gOyl1ay6gWp3qgLJSsHV7vmXmdELrGRYPa6SMWySZyJkDjblSKuEyqYyGBfjSlMRdt
         UPlDQldHxryDR2TYD+cMEjw/JFQV8VTb/nRIch5a8jIOyc3znI9/+KZMZI7dReqjFVYZ
         53MyjE2Ie7dcpPWQFVQXERohcvWzN+XRhpQfe7Mhc9oa4epmRIefdHw/Fc7sf9VXEv4p
         dgngjf7erlpRD24v1NhYlWZPe/fvFYrrxQQUNEH70S9e+Hg3/5bAd14ckaf5klP3oakI
         Bc1w==
X-Gm-Message-State: AOAM5313mi5INYsg5uD6cNwPAZgmlMM9Iizws4OvZ/T9+ol3FaR48/73
        89A4zptPHZMdDiQfpUaRp3gfGQ==
X-Google-Smtp-Source: ABdhPJyP5Qh5pg6XinTmumB5XFCgRZc1lxZeylfUypDYGHsl45Fk9zqVp1OTsdQUBGWwcd3O1l+BpA==
X-Received: by 2002:adf:e9c5:0:b0:217:56ae:c661 with SMTP id l5-20020adfe9c5000000b0021756aec661mr13931983wrn.513.1654609263287;
        Tue, 07 Jun 2022 06:41:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d6d47000000b0020e5e906e47sm17818792wri.75.2022.06.07.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:41:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
Date:   Tue,  7 Jun 2022 14:40:57 +0100
Message-Id: <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony IMX577 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx577 compatible string and re-use the existing imx412 code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index a1394d6c1432..3b7011ab0a8f 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1282,6 +1282,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412" },
+	{ .compatible = "sony,imx577" },
 	{ }
 };
 
-- 
2.36.1

