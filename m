Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFFA2313A0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 22:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgG1ULr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 16:11:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51689 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728163AbgG1ULr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 16:11:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595967106; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=z/j1eXS9EsRM+o+Wag/W7GMKYxap+SCTtlHOOgi+aoQ=; b=qwcL/WmG9zvJoQq/c5hYVjks7erU+ZIjt/HgJGfRGGcN1CIy3cU/BZr2mZ86P4HtMg/WhqzH
 IqrZyy2Kor0y0h0Gh6rEJVBO0oEJwT5kIhxM7fBCIE5lkVoIP4S/GToJ+C5Xg07/CWixoHJI
 Lep3Rpby60Zw7bvDouCncoqhA34=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f208677aa44a6db05bd5e36 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 20:11:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DA97C43391; Tue, 28 Jul 2020 20:11:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B8721C433C6;
        Tue, 28 Jul 2020 20:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8721C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Tue, 28 Jul 2020 14:11:33 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
Message-ID: <20200728201133.GB32586@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
 <20200724162825.GH9185@codeaurora.org>
 <159589714088.1360974.13205114501389777927@swboyd.mtv.corp.google.com>
 <20200728165212.GA32586@codeaurora.org>
 <159596590401.1360974.283437162250734878@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <159596590401.1360974.283437162250734878@swboyd.mtv.corp.google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28 2020 at 13:51 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2020-07-28 09:52:12)
>> On Mon, Jul 27 2020 at 18:45 -0600, Stephen Boyd wrote:
>> >Quoting Lina Iyer (2020-07-24 09:28:25)
>> >> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
>> >> >Hi Maulik/Lina,
>> >> >
>> >> >On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
>> >> >>Hi Rajendra,
>> >> >>
>> >> >>After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
>> >> >>below messages on db845:
>> >> >>
>> >> >>qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
>> >> >>current OPP for freq 533000097 (-34)
>> >> >>
>> >> >>^^^ This one is new.
>> >> >>
>> >> >>qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>> >> >>
>> >> >>^^^ and this message is annoying, can we make it pr_debug in rpmh?
>> >> >
>> >> How annoyingly often do you see this message?
>> >> Usually, this is an indication of bad system state either on remote
>> >> processors in the SoC or in Linux itself. On a smooth sailing build you
>> >> should not see this 'warning'.
>> >>
>> >> >Would you be fine with moving this message to a pr_debug? Its currently
>> >> >a pr_info_ratelimited()
>> >> I would rather not, moving this out of sight will mask a lot serious
>> >> issues that otherwise bring attention to the developers.
>> >>
>> >
>> >I removed this warning message in my patch posted to the list[1]. If
>> >it's a serious problem then I suppose a timeout is more appropriate, on
>> >the order of several seconds or so and then a pr_warn() and bail out of
>> >the async call with an error.
>> >
>> The warning used to capture issues that happen within a second and it
>> helps capture system related issues. Timing out after many seconds
>> overlooks the system issues that generally tend to resolve itself, but
>> nevertheless need to be investigated.
>>
>
>Is it correct to read "system related issues" as performance problems
>where the thread is spinning forever trying to send a message and it
>can't? So the problem is mostly that it's an unbounded amount of time
>before the message is sent to rpmh and this printk helps identify those
>situations where that is happening?
>
Yes, but mostly a short period of time like when other processors are in
the middle of a restart or resource states changes have taken unusual
amounts of time. The system will generally recover from this without
crashing in this case. User action is investigation of the situation
leading to these messages.

>Otherwise as you say above it's a bad system state where the rpmh
>processor has gotten into a bad state like a crash? Can we recover from
>that? Or is the only recovery a reboot of the system? Does the rpmh
>processor reboot the system if it crashes?
We cannot recover from such a state. The remote processor will reboot if
it detects a failure at it's end. If the system entered a bad state, it
is possible that RPMH requests start timing out in Linux and remote
processor may not detect it. Hence, the timeout in rpmh_write() API. The
advised course of action is a restart as there is no way to recover from
this state.

--Lina


