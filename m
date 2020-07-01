Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E35210A67
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 13:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgGALlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 07:41:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12240 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730360AbgGALlG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 07:41:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593603665; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jqNdzefTAdehLQ8LTA4BvpPDcWAceoPTN9qIVHE8Vu0=; b=lW266t73eCNLql6AjS7xEVqfYtL5sbUciwTl99D7WTJbzmJuC4mweNISCfFhekWwrFQNfFly
 76B6cII11DKLELePambV7azqcXMo4kODHFDy/NPejY4eiT3zy0v2AVl7ic9YJGCa+trkYc4Z
 1w0m5lj4mcE3UYVuLiC7naKYCDw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5efc7647bfb34e631ca9a0df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 11:40:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D5A7C4339C; Wed,  1 Jul 2020 11:40:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DBFCC433C8;
        Wed,  1 Jul 2020 11:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DBFCC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/3] DVFS support for Venus
Date:   Wed,  1 Jul 2020 17:10:35 +0530
Message-Id: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These patches add DVFS support for Venus. Where posted
earlier as part of a series with multiple different drivers [1]
I have split them into specific driver changes in order to avoid
confusion on dependencies. Also added the corresponding device tree
changes for sdm845 and sc7180 platforms.

These patches are dependent on the bindings update [2] which is still
pending an ack from Rob.

Patch 1/3 will need to be picked by Stan and pushed via the linux-media tree.

DT patches (2/3 and 3/3) will need to land via the msm tree.

[1] https://lkml.org/lkml/2020/6/15/535
[2] https://lore.kernel.org/patchwork/patch/1241077/

Rajendra Nayak (3):
  media: venus: core: Add support for opp tables/perf voting
  arm64: dts: sdm845: Add OPP tables and power-domains for venus
  arm64: dts: sc7180: Add OPP tables and power-domains for venus

 arch/arm64/boot/dts/qcom/sc7180.dtsi           | 35 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi           | 40 ++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.c       | 43 +++++++++++++++++---
 drivers/media/platform/qcom/venus/core.h       |  5 +++
 drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
 5 files changed, 163 insertions(+), 14 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

