Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208048CEC8
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfHNIrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:47:40 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37048 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfHNIrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:47:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id z11so8362829wrt.4
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G0a6gblQbbIzUwDe3eeqwGYgG4v78FyPDrriBQXOIMg=;
        b=XvAJi7R+VJgktQ0Y82Eu13fxn0IhgnzTdR1XAVRk0J8aHkA3iRirsKSBrJswDtvYeR
         rp9rzEDjOTd52FqmXnDCmfSGxQSywri/wVFzQ0uORjEmQ54etjzyfIvNZ90oFTznREbd
         Zd2126UNTD0kqADU9JNleOQewo6FgmVzphll1AwAV8KzdNrHWhGxAFZPBpi5netMnRKl
         KjLUwGWrstW/0S8BsnFwOuaLU+rrs6eMhu81X04wwcFzxizG+GFBB5Zqb01i2giQkjSJ
         yJ05Zz5CNY2Hi2d6nqLvIuupt+twnnXDRN78kn8fP09GQJGiwns770ChGFo0dRVK9unw
         nBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G0a6gblQbbIzUwDe3eeqwGYgG4v78FyPDrriBQXOIMg=;
        b=NyPCXadJYupQibbheeeh2QDniIVOZZiagEdQthBTteLlUWMqJoSQv4Dzgc5uUQk3ac
         yeM4M2scqOgzk5Tr6DPOPDdpBaiYVM6bBplxNmPAw4KP7z5UAOLutCCG0SDsR//oq/1P
         dDO58ctLdkb+f8LMjI2HJnXMlyERkVJpjk3K/FiQzFqO6VV/8SvP6NvquO/J/8oAlqOm
         vjujRPZlvVc7Grn3CEbgQyeVQf0iG9gg/uXDkL4LOr9K6RxqBJz9CR4kXe3PSZhZ6yaQ
         3sa/Rn3WUVDbrdjXjQ/EL5+OCkF/YR3ltYyFYxMEhbqfEzRQuTB1ATSbz3QXJNHHCg4I
         vhlw==
X-Gm-Message-State: APjAAAXTpI+lhz4wYO7Mr3gd6BKth9lIWid6G6PNl0vbbarUvQ0d9aXe
        q/4HV+wwAySpkZGBH4HWWXBAAeSgPPY=
X-Google-Smtp-Source: APXvYqwBgH3qKuhjUwo1Y6dzBQGw2rtTihnsDDilzjf99lxoRerVHH8y6aEAN78D/IO91ALE4FU9Bw==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr51359543wrq.110.1565772449309;
        Wed, 14 Aug 2019 01:47:29 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id u186sm7176141wmu.26.2019.08.14.01.47.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 01:47:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] arm64: dts: sdm845: Add interconnect properties for Venus
Date:   Wed, 14 Aug 2019 11:47:01 +0300
Message-Id: <20190814084701.25455-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Populate Venus DT node with interconnect properties.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0323e3da190a..567bfc89bd77 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2039,6 +2039,9 @@
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
+			interconnects = <&rsc_hlos MASTER_VIDEO_P0 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_VENUS_CFG>;
+			interconnect-names = "video-mem", "cpu-cfg";
 
 			video-core0 {
 				compatible = "venus-decoder";
-- 
2.17.1

