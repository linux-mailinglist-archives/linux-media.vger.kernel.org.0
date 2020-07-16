Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C96221C14
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 07:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgGPFpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 01:45:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64215 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgGPFpx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 01:45:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594878352; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QCdzWtaoCFQUbVW6Q4oVXM+yOcrN8PD2KCUkLjOvy2I=; b=Mo/Fg7lk7bwH8ysX4dHBNJNFvtTVIZIkcuR187zPafOT7bmBPr2FerxBOFXaoUvWBC/u3IYD
 f44X+jOlBMcYhmzaf8LCtxvX2ESd61JmKbrPgQJRp3NfAseR3B/uX6Aqo4Ewka/Em8+hJAY/
 hNnACl8DzMERraWI8PprNZf/h+g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f0fe97fc7a053446a791c9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 05:45:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D2A1EC43395; Thu, 16 Jul 2020 05:45:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80335C433C9;
        Thu, 16 Jul 2020 05:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80335C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 0/4] DVFS support for Venus
Date:   Thu, 16 Jul 2020 11:12:15 +0530
Message-Id: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v2: Fixed up the labels of OPP nodes in patch 4
    Included the bindings update patch as part of this series,
    a resend of https://lore.kernel.org/patchwork/patch/1241077/

These patches add DVFS support for Venus

Patch 1 will need to be picked by Rob.
Patch 2 will need to be picked by Stan,
Patch 3 and 4 should land via the qcom tree.

Rajendra Nayak (4):
  dt-bindings: media: venus: Add an optional power domain for perf
    voting
  media: venus: core: Add support for opp tables/perf voting
  arm64: dts: sdm845: Add OPP tables and power-domains for venus
  arm64: dts: sc7180: Add OPP tables and power-domains for venus

 .../bindings/media/qcom,sc7180-venus.yaml          |  6 ++-
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  6 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 35 +++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 40 +++++++++++++++-
 drivers/media/platform/qcom/venus/core.c           | 43 ++++++++++++++---
 drivers/media/platform/qcom/venus/core.h           |  5 ++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 54 ++++++++++++++++++++--
 7 files changed, 173 insertions(+), 16 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

