Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10CF22C195
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 11:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGXJDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 05:03:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48243 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbgGXJDE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 05:03:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595581384; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Xc5yYihoFQKsI3WcXXnhfGRJQ4HmrBmbd0VVip4O/eI=; b=UiBFZQWfHIuJOeE1+qzPWILNGaVHjHe3nDdsVblpYx6llOe0yF4m7X5yD7/ZlWuN6ueEgLiG
 Zk/QJhNtvqHmK2CTP9kCaoJdb7wAAzIgBiYHGyJPwQ8ZoHnnhufefI2uddbqlAlk5JGoXOWr
 Bkf5YmZ+FAG3OI0DgFWMzIbAp+Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5f1aa3c65b75bcda6030642d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 09:03:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 51508C43395; Fri, 24 Jul 2020 09:03:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [61.3.19.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B68CBC433C9;
        Fri, 24 Jul 2020 09:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B68CBC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
Date:   Fri, 24 Jul 2020 14:32:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maulik/Lina,

On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
> Hi Rajendra,
> 
> After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
> below messages on db845:
> 
> qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
> current OPP for freq 533000097 (-34)
> 
> ^^^ This one is new.
> 
> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> 
> ^^^ and this message is annoying, can we make it pr_debug in rpmh?

Would you be fine with moving this message to a pr_debug? Its currently
a pr_info_ratelimited()

thanks,
Rajendra

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
