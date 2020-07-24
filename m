Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C57922CB08
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 18:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgGXQ2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 12:28:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34674 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbgGXQ2o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 12:28:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595608124; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=2Tluwc+dc7SaCkWp19noOVVMBfhBEvUZgNi3cdWouqw=; b=q5h0emJy/hrY4na8zOahOrip+6RBSPsynizq0w71OYR9Trz+YQmWqQwnDlY3fBOQ6QMTrvDB
 30ww9Jdq/Rv62O/s9BM2XP86sEnJM94kIAGQ1X2cqv1lC1D5B7dacNohl+i/c4PWuZNMgfnO
 sd3kvjmyowPDoBaDQfc5LoPrdic=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f1b0c2b7186ea1ee18605a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 16:28:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8296C433C6; Fri, 24 Jul 2020 16:28:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EBE5C433C9;
        Fri, 24 Jul 2020 16:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3EBE5C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 24 Jul 2020 10:28:25 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
Message-ID: <20200724162825.GH9185@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
>Hi Maulik/Lina,
>
>On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
>>Hi Rajendra,
>>
>>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
>>below messages on db845:
>>
>>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
>>current OPP for freq 533000097 (-34)
>>
>>^^^ This one is new.
>>
>>qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>
>>^^^ and this message is annoying, can we make it pr_debug in rpmh?
>
How annoyingly often do you see this message?
Usually, this is an indication of bad system state either on remote
processors in the SoC or in Linux itself. On a smooth sailing build you
should not see this 'warning'.

>Would you be fine with moving this message to a pr_debug? Its currently
>a pr_info_ratelimited()
I would rather not, moving this out of sight will mask a lot serious
issues that otherwise bring attention to the developers.

--Lina
