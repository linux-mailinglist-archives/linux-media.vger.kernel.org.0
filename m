Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31CF2A4656
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729242AbgKCN21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 08:28:27 -0500
Received: from z5.mailgun.us ([104.130.96.5]:34116 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729220AbgKCN20 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 08:28:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604410104; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=AioMfTW+/+DxAJdzh43uxsKQqNPs+ONJhb/k0pUeDEI=; b=FfI1w9aXB2mwGpuOGjtGFhJ7jj/RxGIBBO+I2GtgSBewXNMbdPMyt3ncfoJtcGYJ20inpk9Z
 7vCPOx77EUKqOaZt5aze7KKUex8eBSWxEH+50A11l5Y9rfqWargynKBy1Vs/bO5mz9lAz3WH
 zuvptAMDt2cOVkAcmEVGhJv8hW8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa15af875bebe827a0015b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 13:28:24
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4952BC38526; Tue,  3 Nov 2020 07:43:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.118] (unknown [49.207.200.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EC7CC384FE;
        Tue,  3 Nov 2020 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EC7CC384FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH] venus: pm_helpers: Fix kernel module reload
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20201101130052.20974-1-stanimir.varbanov@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <a23bea60-6ddf-3e77-2bc4-0ffa8a99c2a7@codeaurora.org>
Date:   Tue, 3 Nov 2020 13:13:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201101130052.20974-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 11/1/2020 6:30 PM, Stanimir Varbanov wrote:
> After initial kernel module load during kernel boot and removing
> the module and try to load it again an Unable to handle kernel
> paging request is observed:
> 
> Unable to handle kernel paging request at virtual address ffffa44f7416eae0
>   Mem abort info:
>     ESR = 0x96000047
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>   Data abort info:
>     ISV = 0, ISS = 0x00000047
>     CM = 0, WnR = 1
>   swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008147c000
>   [ffffa44f7416eae0] pgd=000000017df9f003, p4d=000000017df9f003,
>   pud=000000017df9e003, pmd=000000017df9b003, pte=0000000000000000
>   Internal error: Oops: 96000047 [#1] PREEMPT SMP
>   Modules linked in: venus_core(+) snd_soc_wsa881x regmap_sdw af_alg
>    snd_soc_wcd934x soundwire_qcom gpio_wcd934x q6asm_dai q6routing
>    q6adm q6afe_dai snd_soc_hdmi_codec q6afe q6asm q6dsp_common q6cor
>    display_connector rmtfs_mem drm ip_tables x_tables ipv6
>    [last unloaded: venus_core]
>   CPU: 6 PID: 889 Comm: modprobe Tainted: G        W      5.10.0-rc1+ #8
>   Hardware name: Thundercomm Dragonboard 845c (DT)
>   pstate: 80400085 (Nzcv daIf +PAN -UAO -TCO BTYPE=--)
>   pc : queued_spin_lock_slowpath+0x1dc/0x3c8
>   lr : do_raw_spin_lock+0xc0/0x118
>   sp : ffff8000142cb7b0
>   x29: ffff8000142cb7b0 x28: 0000000000000013
>   x27: ffffa44f72de5690 x26: 0000000000000003
>   x25: ffff17c2d00f8080 x24: ffff17c2c0d78010
>   x23: ffff17c2c0d4f700 x22: ffff17c2d00f8080
>   x21: 0000000000000000 x20: ffffa44f74148000
>   x19: ffff17c2c0d4f8f8 x18: 0000000000000000
>   x17: 0000000000000000 x16: ffffa44f7342f158
>   x15: 0000000000000040 x14: ffffa44f746e8320
>   x13: 0000000000000228 x12: 0000000000000020
>   x11: 0000000000000000 x10: 00000000001c0000
>   x9 : 0000000000000000 x8 : ffff17c33d746ac0
>   x7 : ffff17c2c109b000 x6 : ffffa44f7416eac0
>   x5 : ffff17c33d746ac0 x4 : 0000000000000000
>   x3 : ffff17c2c0d4f8f8 x2 : ffffa44f7416eae0
>   x1 : ffffa44f7416eae0 x0 : ffff17c33d746ac8
>   Call trace:
>    queued_spin_lock_slowpath+0x1dc/0x3c8
>    do_raw_spin_lock+0xc0/0x118
>    _raw_spin_lock_irqsave+0x80/0x14c
>    __pm_runtime_resume+0x38/0xb8
>    device_link_add+0x3b8/0x5d0
>    core_get_v4+0x268/0x2d8 [venus_core]
>    venus_probe+0x108/0x458 [venus_core]
>    platform_drv_probe+0x54/0xa8
>    really_probe+0xe4/0x3b0
>    driver_probe_device+0x58/0xb8
>    device_driver_attach+0x74/0x80
>    __driver_attach+0x58/0xe8
>    bus_for_each_dev+0x70/0xc0
>    driver_attach+0x24/0x30
>    bus_add_driver+0x150/0x1f8
>    driver_register+0x64/0x120
>    __platform_driver_register+0x48/0x58
>    qcom_venus_driver_init+0x20/0x1000 [venus_core]
>    do_one_initcall+0x84/0x458
>    do_init_module+0x58/0x208
>    load_module+0x1ec0/0x26a8
>    __do_sys_finit_module+0xb8/0xf8
>    __arm64_sys_finit_module+0x20/0x30
>    el0_svc_common.constprop.0+0x7c/0x1c0
>    do_el0_svc+0x24/0x90
>    el0_sync_handler+0x180/0x188
>    el0_sync+0x174/0x180
>   Code: 91002100 8b0200c2 f861d884 aa0203e1 (f8246828)
>   ---[ end trace f1f687c15fd6b2ca ]---
>   note: modprobe[889] exited with preempt_count 1
> 
> After revisit the OPP part of the code I found that OPP pmdomain
> is detached with direct call to dev_pm_domain_detach instead of
> OPP wraper for detaching pmdomains with OPP table. Correct this
> by calling the OPP dev_pm_opp_detach_genpd.

ah, that seems like the right thing to do. Sorry, looks like I hadn't
really tested the cleanup path by loading/unloading the module :/

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
> Fixes: 9a538b83612c ('media: venus: core: Add support for opp tables/perf voting')
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 0ebba8e3bd75..2946547a0df4 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -804,7 +804,7 @@ static int vcodec_domains_get(struct device *dev)
>   	return 0;
>   
>   opp_dl_add_err:
> -	dev_pm_domain_detach(core->opp_pmdomain, true);
> +	dev_pm_opp_detach_genpd(core->opp_table);
>   opp_attach_err:
>   	if (core->pd_dl_venus) {
>   		device_link_del(core->pd_dl_venus);
> @@ -842,7 +842,7 @@ static void vcodec_domains_put(struct device *dev)
>   	if (core->opp_dl_venus)
>   		device_link_del(core->opp_dl_venus);
>   
> -	dev_pm_domain_detach(core->opp_pmdomain, true);
> +	dev_pm_opp_detach_genpd(core->opp_table);
>   }
>   
>   static int core_get_v4(struct device *dev)
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
