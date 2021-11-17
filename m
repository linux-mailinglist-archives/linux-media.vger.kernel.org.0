Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956124545CA
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 12:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236836AbhKQLlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 06:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbhKQLlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 06:41:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B63C061766
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 03:38:11 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id c4so4043226wrd.9
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XyOjQunOpo2TS4TFjfja+I3SgK50zUH2kPWfXvVevW0=;
        b=D96vSlf+lsm5RcOTrab0sbR7/7wjR2DMnG92fryYaAbJrWg96DULGxRftLJ7b4qab0
         4ZjdqzbE5YkymZ7fLTWXe9L1NBP1Dc6gjFI/6l61zQzc6sR7AFPYNX7JIdFyjxza/Rnl
         yXsCur2C0w4p1M8DCs51hSQGe7Hg0B4ie5AMQXSd9W7JuAhv8vJwqrLSwK5ER07nMd2v
         CjL8Eoi13G0V1vO3oPk16mb7xuy12XW+lZb01d6D/9ceAs0b9oFh/DmQVOFz9Li/lQwe
         b00ROcvijENFmFfcmW7V2TmbIUCqbmyVjwBbzhtb16ZhVhQoK7K4Y59gCwpxlrCVEezV
         9sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyOjQunOpo2TS4TFjfja+I3SgK50zUH2kPWfXvVevW0=;
        b=M2YOUnwczHsLAEriTwtkkVddMINqB5WOpvT8IYXCQKVydStoE+tVrqenIuYg2QWviB
         /tyGQErwA4AZismR21RxlibGaYgaEXkWTOHSTLS8w1b53/6R4Ohy2hJtVmIAI/F+qmne
         RIegYr51OrKsSmffIkHFtaHORyTp1vzmCoYJLsxOs3J4/x9OJVAa1DPzC5hDAbXIDRZ5
         Q5Ifg9AHor0HmEaPoC4ixug6v+DXid7UzQSuPsK17heASp+AqYp3taDiI/DGIoywm1i3
         ezUidl6YRO7R/IceI5l3wFUW7607OTbEptiT8ioQ6SVfwC2ruGbGnxfK08fyaOIbvFag
         PFAg==
X-Gm-Message-State: AOAM5327Q+ISQV+Z0uTxVOq2Y++cyVup73UpMeZSsPSJXWjQvC/LL1nJ
        SPgTVEzzwe1NUwwXkdweuqig4A==
X-Google-Smtp-Source: ABdhPJxyMbNrrS7ybS4Euxd0IGlcdzgUJ/5eUgoA6UGuz09w0vFXJPSB8JRJEaPT61mVbGW9QLDoVw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr19272427wrt.31.1637149089870;
        Wed, 17 Nov 2021 03:38:09 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id t8sm6560453wmq.32.2021.11.17.03.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 03:38:09 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm845-db845c: Remove clock-lanes property from &camss node
Date:   Wed, 17 Nov 2021 12:38:00 +0100
Message-Id: <20211117113800.260741-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211117113800.260741-1-robert.foss@linaro.org>
References: <20211117113800.260741-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The clock-lanes property is no longer used as it is not programmable by
the CSIPHY hardware block of Qcom ISPs and should be removed.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 2d5533dd4ec2..0ac084f2f926 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1119,7 +1119,6 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <7>;
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;
 			};
@@ -1160,7 +1159,6 @@ camera@10 {
 
 		port {
 			ov8856_ep: endpoint {
-				clock-lanes = <1>;
 				link-frequencies = /bits/ 64
 					<360000000 180000000>;
 				data-lanes = <1 2 3 4>;
@@ -1205,7 +1203,6 @@ camera@60 {
 
 		port {
 			ov7251_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 1>;
 //				remote-endpoint = <&csiphy3_ep>;
 			};
-- 
2.32.0

