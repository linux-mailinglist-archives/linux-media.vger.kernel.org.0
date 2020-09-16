Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA0F26BBD3
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 07:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgIPFdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 01:33:23 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:12159 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726133AbgIPFdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 01:33:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600234400; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3j+QTm64Oi/tUW8ti81ih3zzkyWdq/GkExlCHs4LZkI=; b=E3c781CY1lywqUH8jirFJbP1gDQrK+15M3vo82BqtPVcaAaXStviBTU8+V3Xhu48ViIc1PRc
 adudMTcRaoE0cTA8EF+8D5URIVLOGLnMkNqmYYq8fb7QLx1zYyqH/BH0u3DZ7vfXwX6sypLG
 HaCifpo+JYzOkVjwh0/fXbBlqL0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f61a39f73afa3417e2510a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Sep 2020 05:33:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9D8AC433CA; Wed, 16 Sep 2020 05:33:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.203.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA0A8C433C8;
        Wed, 16 Sep 2020 05:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA0A8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 0/5] DVFS support for Venus
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <34ed34bd-90fd-0e84-6020-c487d612ad2f@codeaurora.org>
Date:   Wed, 16 Sep 2020 11:03:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/1/2020 7:50 PM, Rajendra Nayak wrote:
> Rob, can you pick PATCH 1 since its already reviewed by you.
> Stan, Patch 2 and 3 will need to be picked by you and they both have your ACKs

Rob/Stan, any plans to get the patches merged for 5.10?

> Patch 4 and 5 will need to be merged via the qcom tree once we have them reviewed.
> 
> v6: No changes, rebased on 5.9-rc3
> 
> v5: Fixed the opp-tables (patch 4/5) to avoid -ERANGE from
> dev_pm_opp_set_rate
> 
> v4: Moved code from probe/remove/runtime_suspend into
> different pm_ops callbacks
> 
> v3: Renamed the optional power domain as cx
> 
> v2: Fixed up the labels of OPP nodes in patch 4
>      Included the bindings update patch as part of this series,
>      a resend of https://lore.kernel.org/patchwork/patch/1241077/
> 
> These patches add DVFS support for Venus
> 
> Rajendra Nayak (5):
>    dt-bindings: media: venus: Add an optional power domain for perf
>      voting
>    media: venus: core: Fix error handling in probe
>    media: venus: core: Add support for opp tables/perf voting
>    arm64: dts: sdm845: Add OPP tables and power-domains for venus
>    arm64: dts: sc7180: Add OPP tables and power-domains for venus
> 
>   .../bindings/media/qcom,sc7180-venus.yaml          |  6 +-
>   .../bindings/media/qcom,sdm845-venus-v2.yaml       |  6 +-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi               | 35 +++++++-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi               | 40 +++++++++-
>   drivers/media/platform/qcom/venus/core.c           | 17 ++--
>   drivers/media/platform/qcom/venus/core.h           |  5 ++
>   drivers/media/platform/qcom/venus/pm_helpers.c     | 92 ++++++++++++++++++++--
>   7 files changed, 183 insertions(+), 18 deletions(-)
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
