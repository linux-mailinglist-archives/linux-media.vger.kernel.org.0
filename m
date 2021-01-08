Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17D92EF1F3
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbhAHMHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbhAHMHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:07:14 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDD2C06123D
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 04:05:27 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id g20so14288017ejb.1
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JiPADPqpi1TRGFTQtXGKOKkcLtBBeVBMJJcpBBX75Jc=;
        b=Zih668ZsAFh4a35FiyenhxLDOf1WnU1F1CGqxfUvcooA4HS8NOJ3LYMwjI0epR9EBL
         eXNqM3a0DxZo5xijsY75HpjGB3yHeYA9iXTfKnpM4cmy9C2Sulpe59z7IixQLoG1olmF
         Q3OBdiAvKiY+G1dSxZLJ30Ai6ESTDe9VFWdXoqpcC5GGafJr8beGPAo1nBhhjX8zkjNC
         4VbPZQX9uxzcrr1tuQxUnHZs+gnNAPXOqa/R/8/Cgqh10udams9zTdhybpdTf8u2+amV
         51du/dYkpGjF8NrbWnL6AOV8ibnqMMKBUEZQelcYyVCBFnjr3xERjcjcwT7cl5elc3U6
         gW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JiPADPqpi1TRGFTQtXGKOKkcLtBBeVBMJJcpBBX75Jc=;
        b=Y0UcWwy8383AtfVoQst07ak6da7sqDFEHTV53cDmJ/N40HTvbU30GAWebXZckaPSiM
         ts6raDgI3FnBoQT+wAWFziO5EbBP6IyFqIhB8Sz977V/icPGA47JBS9dUbco4Pmre9Fs
         JG6lOGfTLRMZSoh5vFCAmZUXolOaswzPDhE1gbPlHLF1B667p7A+0HCFrorf9W7u/+OQ
         Ycm9V1ShbF6xrqMPuscgWSPo3WgdU1yu2MwlgtiXsutQr3EDnGaIv5Wjcwd5JikcVckW
         WEKQqci9dZIx429ox3ksBbQNbL2nUb4qNM/AEGVJdl3PPedmwM2B/IvhLb+QImzEchpN
         kG9g==
X-Gm-Message-State: AOAM531NI28NWkDvTHHRtdsyIoWFpy39gQyetyDTwITGFyvSkfsaNZxW
        7dhggxs7fjN7hxD+arFgNkNutw==
X-Google-Smtp-Source: ABdhPJytmqOnkAPiWJ4RDajeCv0dL/dM6swMndUhDE19gIayP0PkAwa+D228FpmL+AXUxMJ7WiB22w==
X-Received: by 2002:a17:906:4d47:: with SMTP id b7mr2364303ejv.420.1610107526705;
        Fri, 08 Jan 2021 04:05:26 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:26 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 16/17] arm64: dts: sdm845-db845c: Add CAMSS ISP node
Date:   Fri,  8 Jan 2021 13:04:28 +0100
Message-Id: <20210108120429.895046-17-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulators and camss DT node.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a943b3f353ce..7bad0515345e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -294,6 +294,9 @@ vreg_s7a_1p025: smps7 {
 			regulator-max-microvolt = <1028000>;
 		};
 
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -1106,6 +1109,15 @@ &cci {
 	status = "okay";
 };
 
+&camss {
+	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
+	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
+	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
+
+	status = "disabled";
+
+};
+
 &cci_i2c0 {
 	camera@10 {
 		compatible = "ovti,ov8856";
-- 
2.27.0

