Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76AB0A58
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 10:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730359AbfILIaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 04:30:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37578 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbfILIaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 04:30:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id r195so6553058wme.2
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2019 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G0a6gblQbbIzUwDe3eeqwGYgG4v78FyPDrriBQXOIMg=;
        b=tJMDrj6f2iMOjPqxETkZTNFQt3wxOi25KfpL8VfuTphKT3MsMVg96UL1KShQ5pTS8+
         q3mP3dBQ9h3eFZ3/2yLU1vRznguNjf8aMxVssv6wBYKmXRGyUXOUc/tujufkl1n0RuiX
         mW8d34Eq1lfVt6EVEKNadBFBmRhDrOBbkgYCCE6oCi3u9RqBwJxxtJPR1LACJeCalPgg
         wSUxyqqnVxqlVaVjtspdKw2kYp0VdKZYNL1lh2/GTYxcTh2LN4ELZjOBQFzDPT455N7O
         n0AM5TdKAokqzdVNKQWf3qcZXh4Jf0e/qE3goSfD+Moke/v69hdaVJOpupMc5mdLYoZO
         /WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G0a6gblQbbIzUwDe3eeqwGYgG4v78FyPDrriBQXOIMg=;
        b=dRnzaWR5hWq/Rf0q3AZAIHFCgkCDYXcvlpq6nfG9bxX0NcnqpMNK0GXY2RvlnLwG0G
         PvLS21vO+9E2ZFUnZ8c9yeBzir3L86cZ5vAQ7n6AHLcra/FbVKcuVJ7ZxbXSCzZArOiu
         vhtnjvVGEnzAKvADwl5FBWRRPo9A15RR8vmj30zpuxnQTRhZTHVrgxLbOKtErD9kK1rP
         46l2Zh5x/+/tRCA7Bl4uu07rrr29OCDwadH9MieTgmtWAAct1aTU7QV3dGT8spMCCQ3k
         Vj+TdAYi2ihIG59wtjBv8SbsMM58sw9JzMf4SI2m8awkBBqsdwdovpj+6pYddUFBGY11
         HBUQ==
X-Gm-Message-State: APjAAAVX2farSADtukplUxs6NBwIkVQ65P3j8pZTYeQE3X1whpcY8TgZ
        d2fii8uLZIKPpcHYjkcz0mmT4lZuJj4=
X-Google-Smtp-Source: APXvYqzb8A6UO67zAzYjMyYvpUXZjEFSjFv61OtlUPan0vt5nW+c8PXOHLOTVfucxaiLVGANwjXyQQ==
X-Received: by 2002:a1c:9988:: with SMTP id b130mr7735411wme.164.1568277010827;
        Thu, 12 Sep 2019 01:30:10 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id 189sm7100877wmz.19.2019.09.12.01.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 01:30:10 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/2] arm64: dts: sdm845: Add interconnect properties for Venus
Date:   Thu, 12 Sep 2019 11:29:48 +0300
Message-Id: <20190912082948.22836-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
References: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
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

