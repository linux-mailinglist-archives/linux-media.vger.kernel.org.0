Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE53C7DF167
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 12:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbjKBLmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 07:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234916AbjKBLmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 07:42:38 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338CC1AD
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 04:42:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso124315466b.0
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 04:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698925347; x=1699530147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8dxEzYVSeFJZ3l8QowPz73oS6HbY0588zpxHkYzDJg=;
        b=WDoIU/mzD6KYWLqVeD+VqqdMLoaq9gV8qFnUX4RHnINPuvrZRYEOAEmqC7zCR2JlZQ
         BAvNs7Z9TM5X+vUVa8IJI/Lk6bOusrefUAJNSsAW966jUdLozemzoL3jrwNFMR05Cs5Z
         UBfnznZsXtmL9xj7AENXWxw+Tno68pmzkKf13d4I2Y45DwAnuu5dGRah7d9c3dyWdQPE
         QnwD61z53ax//LlI2xOLaSMKlfJ6tIvi7xMyrlz5+noRoP/C4ax7dxO98197cEnTcDa/
         +R/I3FHmO/i9lIeh/TToB3lAJ8UMZVlJR8WHMCz+Z0ZntYoLKXk4W+V0+IxHnOMLCN1d
         S6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698925347; x=1699530147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8dxEzYVSeFJZ3l8QowPz73oS6HbY0588zpxHkYzDJg=;
        b=cR6fGHJKXTXz4U+b7GWkye8pEJ/IddjFJ055/IrO2Pd3ZD6SLYSLY+htZVNpofB/D0
         ASCAKNXQcPqxih9R0v/DOeCFeyMwsZ1fPmG6AIJWhfFk3ugDq7e7YD7T7pHYMb2+4xO8
         TRV84qqZ4LhcyfDIUYPLH0Vn6V1NmbkaVDcvqfGq1OC1MlS5cGz4++0vUOEPQj3i7CFE
         rOPTFTlQAwZMizZlBlGXCopEimAN88EWjYLyN1derFPwC7A1eq8GBTsHAtQZyAxJlund
         fGK/J5ECO5qp8v+08YS80heZv9vozUnTnm/FG2gFAOkgyLyEacLBcdYyO/qgs7KmzROP
         1fkg==
X-Gm-Message-State: AOJu0YyZ72ZIfXRzFwqxPaHVx+Iz0UdSPL5BRmT4dCD+IzGVLrBms0CG
        aBm/qaSf6Nr0VDDIUrBqCdXHLH2qvmDDVIRVMxyR7w==
X-Google-Smtp-Source: AGHT+IF+Nqgh2qvRrp3oGM6gzwl8LfwxtdCMH0YDfKUm6K9IhmLAwyJp3QIkCPDsvq7BCWVHc2aEkA==
X-Received: by 2002:a2e:494a:0:b0:2c5:1a89:41c0 with SMTP id b10-20020a2e494a000000b002c51a8941c0mr12903032ljd.23.1698925327124;
        Thu, 02 Nov 2023 04:42:07 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j41-20020a05600c1c2900b004060f0a0fdbsm2717720wms.41.2023.11.02.04.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 04:42:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Thu, 02 Nov 2023 11:41:59 +0000
Subject: [PATCH 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170 to
 camss-vfe-17x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231102-b4-camss-sc8280xp-v1-6-9996f4bcb8f4@linaro.org>
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
In-Reply-To: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-83828
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e22223589739..0d4389ab312d1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.42.0

