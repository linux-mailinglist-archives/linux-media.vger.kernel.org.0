Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE25B6F667F
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 10:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjEDIBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 04:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjEDIBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 04:01:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E553AB7
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 01:01:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso193415e87.0
        for <linux-media@vger.kernel.org>; Thu, 04 May 2023 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187287; x=1685779287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=708w9bx/Wu04zRxH+k1/smuWapQNc4JobQVr0bsQL/8=;
        b=OGR0tw0cEPJ5IWTGefJN3lh+ujc/nM4fchGGHuc04tW3JNrfrS77NsIXQGeFOKG1hF
         EUKXnKwxtzC+3qFTqNPiW00PTDig9FhjZTlFqJASN+jpCbXv1W0itvU9M82lEqtFd6DL
         jNJf8YtAvUIxDbC5csuTCl8CxNFmlDhSeGOmxvWhrkPv0JLJoL74Oci2/sHwDj+9ScCj
         tZgKEKBD0MffKm3wmMhMlt/wFo5oJZ86vXX4sso4WBrJgS4AeA+fi0IAKyxbm2xMsb48
         2dEeN9g/QZzsdNjrEc6aO+R2guU5aCvcYIAOJ93h8cQdLIrUyqyTxwJBaEd/qhzZqUwL
         Kjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187287; x=1685779287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=708w9bx/Wu04zRxH+k1/smuWapQNc4JobQVr0bsQL/8=;
        b=Tuo46yUp9FnaEtmvcqGSRdzVDXkSX+eldmcrMZLJAmNPGj9qcX2rSN9r1stz0qQ6L+
         khKiA1eHlaW++sV/pJn7QhIvRNmms3jmT81jvnnAwSz+fxWFofcE0XUOJViezYd2jFIF
         39FPLPVRitpZnhvq62PIKkVq9G6U82X7iGSvV3+Kl2UQlN7SmJcVjqtAfpK6u/4LOW4p
         Vbd4Bwvkajzgndm85EmlMa0OcByCMWqCUp/uLkYHfUQXcYLMUoADFVwk10xuF/5OY3lq
         jbh0KIeKqYpaX9B6lX1ejl/SLvkoZwadeRsZkAJaiv98yoKgqaB4xNbRYN0/YLu3L7oA
         FF5A==
X-Gm-Message-State: AC+VfDwCt3u/P/cH57V4X/U+uu1+oyVM5fFhVsNgJJL24hpg8eq1bKjy
        rGm7wb0m8KwOubaUIwziYmjyjg==
X-Google-Smtp-Source: ACHHUZ6xPL1r6L+pLfcqK3QNzpyNbP9lYB+h9l7o6PVl0pwNOc0N4aZkHTFIwz8mAeFF8xzoK4cakA==
X-Received: by 2002:ac2:42ca:0:b0:4ec:8853:136 with SMTP id n10-20020ac242ca000000b004ec88530136mr1300300lfl.12.1683187287469;
        Thu, 04 May 2023 01:01:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:00:57 +0200
Subject: [PATCH v2 01/18] media: venus: hfi_venus: Only consider
 sys_idle_indicator on V1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-1-d95d14949c79@linaro.org>
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
In-Reply-To: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=2458;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=LQtQ1yE07Bg59BEEMI3NIlj9dkGtgWhznhuEDogV/mw=;
 b=Kws3buj9gak4YkC02btsKAwvOm9JWfGiV7pvaPoDuS0Xql4ESb80+IRE7Gica1xethqYxktGt
 ixyW96vm1WpDAjk47aOSfERSfhh6F+OY4cCW+lyjeIxcYcv5o7x853N
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per information from Qualcomm [1], this property is not really
supported beyond msm8916 (HFI V1) and some newer HFI versions really
dislike receiving it, going as far as crashing the device.

Only consider toggling it (via the module option) on HFIV1.
While at it, get rid of the global static variable (which defaulted
to zero) which was never explicitly assigned to for V1.

Note: [1] is a reply to the actual message in question, as lore did not
properly receive some of the emails..

[1] https://lore.kernel.org/lkml/955cd520-3881-0c22-d818-13fe9a47e124@linaro.org/
Fixes: 7ed9e0b3393c ("media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations")
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 2ad40b3945b0..bff435abd59b 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -131,7 +131,6 @@ struct venus_hfi_device {
 
 static bool venus_pkt_debug;
 int venus_fw_debug = HFI_DEBUG_MSG_ERROR | HFI_DEBUG_MSG_FATAL;
-static bool venus_sys_idle_indicator;
 static bool venus_fw_low_power_mode = true;
 static int venus_hw_rsp_timeout = 1000;
 static bool venus_fw_coverage;
@@ -947,17 +946,12 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
 	if (ret)
 		dev_warn(dev, "setting fw debug msg ON failed (%d)\n", ret);
 
-	/*
-	 * Idle indicator is disabled by default on some 4xx firmware versions,
-	 * enable it explicitly in order to make suspend functional by checking
-	 * WFI (wait-for-interrupt) bit.
-	 */
-	if (IS_V4(hdev->core) || IS_V6(hdev->core))
-		venus_sys_idle_indicator = true;
-
-	ret = venus_sys_set_idle_message(hdev, venus_sys_idle_indicator);
-	if (ret)
-		dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
+	/* HFI_PROPERTY_SYS_IDLE_INDICATOR is not supported beyond 8916 (HFI V1) */
+	if (IS_V1(hdev->core)) {
+		ret = venus_sys_set_idle_message(hdev, false);
+		if (ret)
+			dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
+	}
 
 	ret = venus_sys_set_power_control(hdev, venus_fw_low_power_mode);
 	if (ret)

-- 
2.40.1

