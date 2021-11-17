Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 848894545D0
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 12:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbhKQLlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 06:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236847AbhKQLlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 06:41:08 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F770C061208
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 03:38:10 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id az33-20020a05600c602100b00333472fef04so4500505wmb.5
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Yj1E+7leUXuCLv33wLKqEaM7WfS5ZHoS6sCkflnwxs=;
        b=SMhMAYe8bLUcp5dWmlcj6BilmsccoCNaDkawsWLk/jQaRX2RJ2p0J6tgoqCsJGhTox
         t4J1O2R48iP7kXNh7vDOHP5D7ez6/4cLFSl4BQJbC9fR2oqG1Ku//MV17lU2ljGqbuUj
         SB+o0Y6ScsbN52w0crjBHl59SpDo0kGVspINZZGL+VyiTeoeaOKzCD+rOIfx4UN4/q30
         CWNoYqWGeaGZAFA/B6gzI/xpFwnTUcVJt0tjKs37cQaoX5YreqL5iPkezjeJ348nbdAl
         W2oU5e4zGFh0Z6EwiAFONoy1b2WmhIwbSKF5OVczNzV5GaTfJ0vu+vGSScaa/Qq0MnhO
         i7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Yj1E+7leUXuCLv33wLKqEaM7WfS5ZHoS6sCkflnwxs=;
        b=3eDiNBYOwsA4JCpugVma3JP/G/hv3ivFU6cqvEtf4UChC/BuIg9HUu/8qmBM9nQho/
         HYb8E62dvoJUL0YngzhjURz81r9q7M7HRz0UUp5h7I5DR0SvF1uHhFldDKimsgs+swnt
         yZ4Br0RHvlGgZcuxkvnr0s8SjW4ZQMQF8vIHq0LBOcb73qednTNBEbcga5rccg1fcefe
         EMgOL9jXcCLflRa9LunovFqJGXQj3wuVo+pmWsAN8dtWI8p6HO1+neDdxo8L/Oa2nbrb
         seby2IyuRJAwot/ZBU657CeNpomolhM1VqNDeldQow03EkJZEUDmWqD95cbAMRDohbOr
         5/WA==
X-Gm-Message-State: AOAM530yfzLuBAEwXMvCok5rHTgaPwmT2FmZwbCoUg4bld4CB94Wgynp
        Q32gSlJ3CW3X7vJFXzfhAc2NOQ==
X-Google-Smtp-Source: ABdhPJyaLzUnAjPg9EjuinF1Qv7XY8txM/DgNF7EjNWsZbhWJZVHeG/n7+4frZw0kBAjF+Lnri77TA==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr16396171wmk.93.1637149088633;
        Wed, 17 Nov 2021 03:38:08 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id t8sm6560453wmq.32.2021.11.17.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 03:38:08 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8916: Remove clock-lanes property from &camss node
Date:   Wed, 17 Nov 2021 12:37:59 +0100
Message-Id: <20211117113800.260741-4-robert.foss@linaro.org>
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
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index f8d8f3e3664e..faf86ce165a8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -248,7 +248,6 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&ov5640_ep>;
 				status = "okay";
@@ -284,7 +283,6 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
-- 
2.32.0

