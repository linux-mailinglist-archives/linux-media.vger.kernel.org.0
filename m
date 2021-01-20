Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7412FDBA5
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733312AbhATU5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732050AbhATNxP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:53:15 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E6CC061365
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:08 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id v184so2903427wma.1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=GeA1nrZDn5Mw+d/D0blGs/1gVL4pz510wdwvHr25rU5qoylxnIly9AKpEv5QFABFRp
         bkdnRqtd8pUxVWZ7Mmb2GatkA8fseQmOwBUcS5mrMwRbG2UL4dkF/y78vGbN+JCftdxS
         Jzc5bLA5RkDBI7LNDAWo0sDiS8acHkTtgzZdjInvbt6paRViHKP87pm+vEW07htffVEY
         r4SioxTMAlLJ428qNjLY+xcBI8Nw1uou9HpdAelbiH4zGEojwLPlUjTFhycKR5Dztvv4
         wj7kA0+DEKbi4EOiFqH+KM7WqgydJNfSKm6lnKWRySla5F8JqALhOelgjnsonsTVIEPY
         fQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtnlfnM1gUAXVxSsCOu/wsiGW/5dkOKL2/2b79ivYgU=;
        b=MgxgQVf9d3CWP/P23l6zyHpj4w7zPQ5q1CknH5kO/96J78KKYKo/PnF9r4YXodnmSw
         ozIadLkzZxjQz8Du+n0KG4ODydLyRJqbdBF9Oe1kL+H5PoVo0CUvPT22VOXgA8sfR4IO
         5zh23Dt6T+gCavTBxB9XD8hnbJPmdZqGdlRfZLZGcsMnyhwlEV/f0HjiMj5anecKr0iK
         Dz8jeul2bxz5PIT3nTE8kKv7RkVAtpXMM/EtNatWb1UEEKa73bk/iqrkcTnuhgYRLCHN
         s7OietSI8Oy9vIqxD7i8PG07Dvj2hIkLK+HQxqnAXAfWT9mXkrzHd5m4cAIMs+i09aYu
         A5Uw==
X-Gm-Message-State: AOAM533Mnh044+kYw5ewSO+o1mhng2EvU9Y3fKh9uS5BERBIHr79gawe
        MpXWvorCo+dLQxgFzsOaHG2m6g==
X-Google-Smtp-Source: ABdhPJzjnayKU/QFteF13v4bhWviv+X36Ofwm0dPN+lgNT01WrRNNAoEJtLJIB/O5XOTJTJKP9Lm0Q==
X-Received: by 2002:a1c:e055:: with SMTP id x82mr3227439wmg.185.1611150307326;
        Wed, 20 Jan 2021 05:45:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:45:06 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 21/22] arm64: dts: sdm845-db845c: Configure regulator for camss node
Date:   Wed, 20 Jan 2021 14:43:56 +0100
Message-Id: <20210120134357.1522254-21-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulator to camss device tree node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a943b3f353ce..5842ab65789c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1106,6 +1106,10 @@ &cci {
 	status = "okay";
 };
 
+&camss {
+	vdda-supply = <&vreg_l1a_0p875>;
+};
+
 &cci_i2c0 {
 	camera@10 {
 		compatible = "ovti,ov8856";
-- 
2.27.0

