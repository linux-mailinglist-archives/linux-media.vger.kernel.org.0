Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42FE22C2EE
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 12:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGXKQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 06:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgGXKQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 06:16:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE6C0619E5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 03:16:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a14so7806077wra.5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/crr1B0GqubjNwG43KatHyRCC39WbnEB7v+bZrA77SA=;
        b=Y/rInoxsn92r02GUndlt2TNOypplp+8emBTWlbR2c0Wew3bKj8Sr2RSzFpxMI5Wdf1
         56VXN131Cn3xSmujxU/KVzkhQtyvXLIgKLw/JQoExLR95fd7MNzGz55+2h39ogEqON9y
         eS/4HB9KdFUymYt2gaE3XOoOOy7hkcM9zGzArxAvPVsrSdaIUoa2ERgS5Q4Q1QwVhNs8
         yvVp+UccvZ/lTEwwihjy3Ti6MSKomGhr5MkYpXvuLqsZKUOBUMCJgtc8uNMJm0lz/JeX
         vsyzqHZUZHq65GHF3xA37hGBz9aiGqwrsq+vDpU8IjqSMuNQVdqMQB8haK1TRqoEljIk
         ExyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/crr1B0GqubjNwG43KatHyRCC39WbnEB7v+bZrA77SA=;
        b=YlpiBi5IZhaM2u1LRRaI6qcrUlKBKV4Gqp9XH/bytkY4L/2bevwepnMDwVQRJ2Avj9
         85duCzOEIfimMxvC5+mSQdII1qpoxB+4V9udaAtJueDKjT/7extVux0OhGrMon2T+FR4
         5duooCPi0Q2LbBB0sdSwmdyxSHO0/bqFDU1qHUXb/+x2jZ/+GqrcppKndAs9OX4LAvX3
         14PbztNo3e85TZm2vcfTXmDOr7E/PsITYy2WehkvR2k2sLrhzrCRRe7dGZRT0hIx4XKa
         c26dMbzqWGQPf+RG+fmIgf0UYfrlbjJzuxirW/Ss1MbWWP+Rvb+cw6jeNmZDQ7Z0Lmcy
         pP0A==
X-Gm-Message-State: AOAM530fVG40veJNBw4mc5BCIjKpV2iNEiwKhYEp2U/QBQL4RsbdT8Lh
        1d8lQCmarqOcIoRQBblcNg95iQ==
X-Google-Smtp-Source: ABdhPJz4y+AV7oH5TqR49qAmZppza0iAQtDgZzmmFAPnCpOfFNS/dkNyqoaFZUFkPp+CMzp7c4/nmQ==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr7786164wrl.129.1595585784885;
        Fri, 24 Jul 2020 03:16:24 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id x4sm953873wru.81.2020.07.24.03.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 03:16:24 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Rajendra Nayak <rnayak@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <a2935e9c-6908-05cb-a137-7dd2d5e50a33@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8b60fc8b-7c7e-f904-3444-fc35641a3a08@linaro.org>
Date:   Fri, 24 Jul 2020 13:16:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a2935e9c-6908-05cb-a137-7dd2d5e50a33@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/24/20 11:49 AM, Rajendra Nayak wrote:
> Hey Stan,
> 
> On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
>> Hi Rajendra,
>>
>> After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
>> below messages on db845:
>>
>> qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
>> current OPP for freq 533000097 (-34)
>>
>> ^^^ This one is new.
> 
> I was hoping to be able to reproduce this on the 845 mtp (I don't have
> a db845), but I can;t seem to get venus working on mainline [1]
> (neither with linux-next, nor with linaro integration)

The driver should at least load without errors on -next and
linaro-integration for db845. As to MTP and haven't checked because I
don't have such board with me.

I will try to debug dev_pm_opp_set_rate -ERANGE error.

> Do you know if I might be missing some fix?
> 
>>
>> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>
>> ^^^ and this message is annoying, can we make it pr_debug in rpmh?
> 
> Sure, I'll send a patch for that and see what the rpmh owners have to say.
> 
> [1]
> 
> [    1.632147] qcom-venus aa00000.video-codec: Adding to iommu group 2
> [    1.638920] qcom-venus aa00000.video-codec: non legacy binding
> [    1.648313] ------------[ cut here ]------------
> [    1.652976] video_cc_venus_ctl_axi_clk status stuck at 'off'

I guess this means that venus_gdsc is not powered on.

> [    1.653068] WARNING: CPU: 7 PID: 1 at
> drivers/clk/qcom/clk-branch.c:92 clk_b8
> [    1.667977] Modules linked in:
> [    1.671076] CPU: 7 PID: 1 Comm: swapper/0 Not tainted
> 5.8.0-rc6-00254-gc43551
> [    1.678704] Hardware name: Qualcomm Technologies, Inc. SDM845 MTP (DT)
> [    1.685294] pstate: 60c00085 (nZCv daIf +PAN +UAO BTYPE=--)
> [    1.690911] pc : clk_branch_toggle+0x14c/0x168
> [    1.695397] lr : clk_branch_toggle+0x14c/0x168
> [    1.699881] sp : ffff80001005b900
> [    1.703232] x29: ffff80001005b900 x28: ffffb58586ac2f38
> [    1.708594] x27: ffff0000f86c6d48 x26: ffffb58586f09000
> [    1.713953] x25: ffffb585867c0bd8 x24: 0000000000000000
> [    1.719312] x23: ffffb5858702df28 x22: ffffb58585a3c6a8
> [    1.724672] x21: 0000000000000001 x20: ffffb58586f09000
> [    1.730031] x19: 0000000000000000 x18: ffffb58586f09948
> [    1.735390] x17: 0000000000000001 x16: 0000000000000019
> [    1.740749] x15: ffff80009005b5a7 x14: 0000000000000006
> [    1.746107] x13: ffff80001005b5b5 x12: ffffb58586f21d68
> [    1.751466] x11: 0000000000000000 x10: 0000000005f5e0ff
> [    1.756825] x9 : ffff80001005b900 x8 : 2766666f27207461
> [    1.762184] x7 : 206b637574732073 x6 : ffffb58587141848
> [    1.767543] x5 : 0000000000000000 x4 : 0000000000000000
> [    1.772902] x3 : 00000000ffffffff x2 : ffff4a7b76cd8000
> [    1.778261] x1 : ad405f90446fcf00 x0 : 0000000000000000
> [    1.783624] Call trace:
> [    1.786103]  clk_branch_toggle+0x14c/0x168
> [    1.790241]  clk_branch2_enable+0x18/0x20
> [    1.794306]  clk_core_enable+0x60/0xa8
> [    1.798090]  clk_core_enable_lock+0x20/0x40
> [    1.802316]  clk_enable+0x14/0x28
> [    1.805682]  core_clks_enable+0x94/0xd8
> [    1.809562]  core_power_v4+0x48/0x50
> [    1.813178]  venus_runtime_resume+0x24/0x40
> [    1.817417]  pm_generic_runtime_resume+0x28/0x40
> [    1.822079]  __rpm_callback+0xa0/0x138
> [    1.825861]  rpm_callback+0x24/0x98
> [    1.829390]  rpm_resume+0x32c/0x490
> [    1.832917]  __pm_runtime_resume+0x38/0x88
> [    1.837051]  venus_probe+0x1f0/0x34c
> [    1.840667]  platform_drv_probe+0x4c/0xa8
> [    1.844727]  really_probe+0x100/0x388
> [    1.848428]  driver_probe_device+0x54/0xb8
> [    1.852563]  device_driver_attach+0x6c/0x78
> [    1.856790]  __driver_attach+0xb0/0xf0
> [    1.860576]  bus_for_each_dev+0x68/0xc8
> [    1.864456]  driver_attach+0x20/0x28
> [    1.868064]  bus_add_driver+0x148/0x200
> [    1.871941]  driver_register+0x60/0x110
> [    1.875819]  __platform_driver_register+0x44/0x50
> [    1.880576]  qcom_venus_driver_init+0x18/0x20
> [    1.884990]  do_one_initcall+0x58/0x1a0
> [    1.888878]  kernel_init_freeable+0x1fc/0x28c
> [    1.893292]  kernel_init+0x10/0x108
> [    1.896821]  ret_from_fork+0x10/0x1c
> [    1.900441] ---[ end trace f12a7e5e182f3e4e ]---
> [    1.906415] qcom-venus: probe of aa00000.video-codec failed with
> error -16
> 
>>
>> On 7/23/20 2:26 PM, Rajendra Nayak wrote:
>>> Add the OPP tables in order to be able to vote on the performance
>>> state of
>>> a power-domain.
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 40
>>> ++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index e506793..5ca2265 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -3631,8 +3631,10 @@
>>>               interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>               power-domains = <&videocc VENUS_GDSC>,
>>>                       <&videocc VCODEC0_GDSC>,
>>> -                    <&videocc VCODEC1_GDSC>;
>>> -            power-domain-names = "venus", "vcodec0", "vcodec1";
>>> +                    <&videocc VCODEC1_GDSC>,
>>> +                    <&rpmhpd SDM845_CX>;
>>> +            power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
>>> +            operating-points-v2 = <&venus_opp_table>;
>>>               clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>>                    <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>>                    <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>>> @@ -3654,6 +3656,40 @@
>>>               video-core1 {
>>>                   compatible = "venus-encoder";
>>>               };
>>> +
>>> +            venus_opp_table: venus-opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-100000000 {
>>> +                    opp-hz = /bits/ 64 <100000000>;
>>> +                    required-opps = <&rpmhpd_opp_min_svs>;
>>> +                };
>>> +
>>> +                opp-200000000 {
>>> +                    opp-hz = /bits/ 64 <200000000>;
>>> +                    required-opps = <&rpmhpd_opp_low_svs>;
>>> +                };
>>> +
>>> +                opp-320000000 {
>>> +                    opp-hz = /bits/ 64 <320000000>;
>>> +                    required-opps = <&rpmhpd_opp_svs>;
>>> +                };
>>> +
>>> +                opp-380000000 {
>>> +                    opp-hz = /bits/ 64 <380000000>;
>>> +                    required-opps = <&rpmhpd_opp_svs_l1>;
>>> +                };
>>> +
>>> +                opp-444000000 {
>>> +                    opp-hz = /bits/ 64 <444000000>;
>>> +                    required-opps = <&rpmhpd_opp_nom>;
>>> +                };
>>> +
>>> +                opp-533000000 {
>>> +                    opp-hz = /bits/ 64 <533000000>;
>>> +                    required-opps = <&rpmhpd_opp_turbo>;
>>> +                };
>>> +            };
>>>           };
>>>             videocc: clock-controller@ab00000 {
>>>
>>
> 

-- 
regards,
Stan
