Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4AD6206A8
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 03:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbiKHCTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 21:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiKHCS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 21:18:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AF22655C
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 18:18:29 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id v1so18782025wrt.11
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 18:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBPzEJgiWfjtAktmaY0i7D+rymUnH5U+VEJCblgWE9o=;
        b=QlWgi93nspr2p+X+jtjXMvOPYnBV/7HK7ScEdSG8elRiFp7nGfodiNaQ8e4KpUl2+v
         05jArYaf/Zi7gMAR7GUTILQEmhhsGauF6Vdy+f+3Hz8tto4b3Db72R78HhWyF0bKANmL
         xGS95CTh556VTRA8WCRa9UPKynqwMiLixdOr6c1K+7IBOwz3HAG3h0BC4Wc5j/geDgZy
         PhtRS7537HxxyI/Ltp6yHbwFMhoxUX+rbFDUvomdOFDe8AU3sNwea56tZaiZPfcaZ7Md
         YBTeCQ9t2ipJ1Xu9SRJvL2waupGHqXfZaa5daGIu/BILeD8e9N4NRycQBzk1kVBy5V8s
         gJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBPzEJgiWfjtAktmaY0i7D+rymUnH5U+VEJCblgWE9o=;
        b=xxCxc4uL78jyvZQtbzAUmPoqiLQZ1/qhX3UNTBqj30F/mfbAr8KV9fKlAUIGCo+Vj8
         8SOmP7dtD80KbVKz6WWc9Y6x7HVR9dv7FWzmcnfwY9I2ux0R5oOv7XFRxo5RGEX1kuRS
         GtGdeyC2Wa2Lpuoxub0AiQWZFE3bvi5PKi9W4tS1c2NePXnUOl5Dtgea5Njj8q21WuK/
         B4CN2lbfQ1X/ER3B+FQ0tS4f+n3XN//OVsvW3ZM9jbDIc1gX+gDVil8touqhMmY7VWaq
         sApi1eKZzJ7jgTy9iZV9Ffn9HyNZXFk4dZMheMKjyj/YnB37DywDXczaARAJS9zaAvHb
         nQnA==
X-Gm-Message-State: ANoB5pm3Hacce8aiRSYF4Dh+8CgPYPbNxbl28wxvMVgKe4LjVYLhkWMg
        p0z7RPO73rCnEJ4M+nLUZHK9+A==
X-Google-Smtp-Source: AA0mqf7C+C06qhT9GNVVJeCAtGhqeyJQq91NiNEq/f0+r2myPK0vD9Ca9qpFV5J7jqto4oO9MShhcQ==
X-Received: by 2002:a05:6000:d:b0:236:6662:5bb9 with SMTP id h13-20020a056000000d00b0023666625bb9mr10313441wrx.619.1667873908013;
        Mon, 07 Nov 2022 18:18:28 -0800 (PST)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d6-20020adfe2c6000000b0022cc6b8df5esm8890354wrj.7.2022.11.07.18.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:18:27 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8250: camss: Define ports address/size cells
Date:   Tue,  8 Nov 2022 02:18:14 +0000
Message-Id: <20221108021816.213084-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
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

The ports {} address and size cells definition is the same for every
derived 8250 board so, we should define it in the core sm8250.dtsi.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index eb5a10cbcd71..8ef0a9fe67dd 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3415,6 +3415,11 @@ camss: camss@ac6a000 {
 					     "cam_hf_0_mnoc",
 					     "cam_sf_0_mnoc",
 					     "cam_sf_icp_mnoc";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1

