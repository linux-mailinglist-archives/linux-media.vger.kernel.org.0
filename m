Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DACF22C13B
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 10:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgGXItx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 04:49:53 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49297 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgGXItx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 04:49:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595580592; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GCBnX2g9QeYHPeSpMruhaYqftRGwomHScHEzMJHok68=; b=V+5AKUjv20NKB9v6Rg6HncgQNQLfvbX1FV2XhjGeXbNEKOG83bWl3ZZfr44UQauoKmeQXRta
 PNEgQhRiKyeekN/xI/E7zM527UYPQTkmwE5Lj/FRge0zJRU4VSMJxZh/aseKVGad3RWCfhjW
 knRq03ZgkpfwbJ4F9TiHe87WM9k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f1aa09c3dbcb593a97711d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 08:49:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3067BC433C9; Fri, 24 Jul 2020 08:49:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [61.3.19.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DD16C433C6;
        Fri, 24 Jul 2020 08:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DD16C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a2935e9c-6908-05cb-a137-7dd2d5e50a33@codeaurora.org>
Date:   Fri, 24 Jul 2020 14:19:25 +0530
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

Hey Stan,

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

I was hoping to be able to reproduce this on the 845 mtp (I don't have
a db845), but I can;t seem to get venus working on mainline [1]
(neither with linux-next, nor with linaro integration)
Do you know if I might be missing some fix?

> 
> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
> 
> ^^^ and this message is annoying, can we make it pr_debug in rpmh?

Sure, I'll send a patch for that and see what the rpmh owners have to say.

[1]

[    1.632147] qcom-venus aa00000.video-codec: Adding to iommu group 2
[    1.638920] qcom-venus aa00000.video-codec: non legacy binding
[    1.648313] ------------[ cut here ]------------
[    1.652976] video_cc_venus_ctl_axi_clk status stuck at 'off'
[    1.653068] WARNING: CPU: 7 PID: 1 at drivers/clk/qcom/clk-branch.c:92 clk_b8
[    1.667977] Modules linked in:
[    1.671076] CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc6-00254-gc43551
[    1.678704] Hardware name: Qualcomm Technologies, Inc. SDM845 MTP (DT)
[    1.685294] pstate: 60c00085 (nZCv daIf +PAN +UAO BTYPE=--)
[    1.690911] pc : clk_branch_toggle+0x14c/0x168
[    1.695397] lr : clk_branch_toggle+0x14c/0x168
[    1.699881] sp : ffff80001005b900
[    1.703232] x29: ffff80001005b900 x28: ffffb58586ac2f38
[    1.708594] x27: ffff0000f86c6d48 x26: ffffb58586f09000
[    1.713953] x25: ffffb585867c0bd8 x24: 0000000000000000
[    1.719312] x23: ffffb5858702df28 x22: ffffb58585a3c6a8
[    1.724672] x21: 0000000000000001 x20: ffffb58586f09000
[    1.730031] x19: 0000000000000000 x18: ffffb58586f09948
[    1.735390] x17: 0000000000000001 x16: 0000000000000019
[    1.740749] x15: ffff80009005b5a7 x14: 0000000000000006
[    1.746107] x13: ffff80001005b5b5 x12: ffffb58586f21d68
[    1.751466] x11: 0000000000000000 x10: 0000000005f5e0ff
[    1.756825] x9 : ffff80001005b900 x8 : 2766666f27207461
[    1.762184] x7 : 206b637574732073 x6 : ffffb58587141848
[    1.767543] x5 : 0000000000000000 x4 : 0000000000000000
[    1.772902] x3 : 00000000ffffffff x2 : ffff4a7b76cd8000
[    1.778261] x1 : ad405f90446fcf00 x0 : 0000000000000000
[    1.783624] Call trace:
[    1.786103]  clk_branch_toggle+0x14c/0x168
[    1.790241]  clk_branch2_enable+0x18/0x20
[    1.794306]  clk_core_enable+0x60/0xa8
[    1.798090]  clk_core_enable_lock+0x20/0x40
[    1.802316]  clk_enable+0x14/0x28
[    1.805682]  core_clks_enable+0x94/0xd8
[    1.809562]  core_power_v4+0x48/0x50
[    1.813178]  venus_runtime_resume+0x24/0x40
[    1.817417]  pm_generic_runtime_resume+0x28/0x40
[    1.822079]  __rpm_callback+0xa0/0x138
[    1.825861]  rpm_callback+0x24/0x98
[    1.829390]  rpm_resume+0x32c/0x490
[    1.832917]  __pm_runtime_resume+0x38/0x88
[    1.837051]  venus_probe+0x1f0/0x34c
[    1.840667]  platform_drv_probe+0x4c/0xa8
[    1.844727]  really_probe+0x100/0x388
[    1.848428]  driver_probe_device+0x54/0xb8
[    1.852563]  device_driver_attach+0x6c/0x78
[    1.856790]  __driver_attach+0xb0/0xf0
[    1.860576]  bus_for_each_dev+0x68/0xc8
[    1.864456]  driver_attach+0x20/0x28
[    1.868064]  bus_add_driver+0x148/0x200
[    1.871941]  driver_register+0x60/0x110
[    1.875819]  __platform_driver_register+0x44/0x50
[    1.880576]  qcom_venus_driver_init+0x18/0x20
[    1.884990]  do_one_initcall+0x58/0x1a0
[    1.888878]  kernel_init_freeable+0x1fc/0x28c
[    1.893292]  kernel_init+0x10/0x108
[    1.896821]  ret_from_fork+0x10/0x1c
[    1.900441] ---[ end trace f12a7e5e182f3e4e ]---
[    1.906415] qcom-venus: probe of aa00000.video-codec failed with error -16

> 
> On 7/23/20 2:26 PM, Rajendra Nayak wrote:
>> Add the OPP tables in order to be able to vote on the performance state of
>> a power-domain.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index e506793..5ca2265 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -3631,8 +3631,10 @@
>>   			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>   			power-domains = <&videocc VENUS_GDSC>,
>>   					<&videocc VCODEC0_GDSC>,
>> -					<&videocc VCODEC1_GDSC>;
>> -			power-domain-names = "venus", "vcodec0", "vcodec1";
>> +					<&videocc VCODEC1_GDSC>,
>> +					<&rpmhpd SDM845_CX>;
>> +			power-domain-names = "venus", "vcodec0", "vcodec1", "cx";
>> +			operating-points-v2 = <&venus_opp_table>;
>>   			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>>   				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>>   				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>> @@ -3654,6 +3656,40 @@
>>   			video-core1 {
>>   				compatible = "venus-encoder";
>>   			};
>> +
>> +			venus_opp_table: venus-opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>;
>> +					required-opps = <&rpmhpd_opp_min_svs>;
>> +				};
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <200000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-320000000 {
>> +					opp-hz = /bits/ 64 <320000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-380000000 {
>> +					opp-hz = /bits/ 64 <380000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533000000 {
>> +					opp-hz = /bits/ 64 <533000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +				};
>> +			};
>>   		};
>>   
>>   		videocc: clock-controller@ab00000 {
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
