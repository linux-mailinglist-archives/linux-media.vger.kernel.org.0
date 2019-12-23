Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5CF1293CA
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 10:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWJuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 04:50:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:52950 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726802AbfLWJuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 04:50:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577094622; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KJ1U0ZRQgXwWQsUptcXeQV98BEoXo5TChpOyayX6HDw=;
 b=l3IQDzF5t0+SYUW7SgZHhF0W+I0YzaC9tZmJ/34AQnmHV+O7GQgqjqgtcM0vbaS6XmFk3GT0
 qK89j+sc06+aK1te++hZMVMxSVrmLXLKfXCNDQ1Kt94loR291At4nEu0kb11dQ9u4RO9JvZ1
 niw0nRui6aWXAUN8WUlVjIoGmv0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e008dd8.7f5b105241f0-smtp-out-n01;
 Mon, 23 Dec 2019 09:50:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4C58C433A2; Mon, 23 Dec 2019 09:50:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 805B0C43383;
        Mon, 23 Dec 2019 09:50:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 15:20:14 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org, linux-media-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
In-Reply-To: <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
 <17a371c0-d73a-75eb-34f2-c9afb51d46f5@linaro.org>
Message-ID: <3f41daa245ed9df52a513c99ee6c0749@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

Thanks for the review!
I will address all the comments in the next version.

On 2019-12-20 15:04, Stanimir Varbanov wrote:
> Hi Dikshita,
> 
> Thanks for the patch.
> 
> On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
>> This adds Venus video codec DT node for sc7180.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 
>> ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 6876aae2..42c70f5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -10,6 +10,7 @@
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/clock/qcom,videocc-sc7180.h>
>> 
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -66,6 +67,11 @@
>>  			compatible = "qcom,cmd-db";
>>  			no-map;
>>  		};
>> +
>> +		venus_mem: memory@8F600000 {
>> +			reg = <0 0x8F600000 0 0x500000>;
> 
> Please use lower-case for hex numbers.
> 
>> +			no-map;
>> +		};
>>  	};
>> 
>>  	cpus {
>> @@ -1042,6 +1048,36 @@
>>  			};
>>  		};
>> 
>> +		venus: video-codec@aa00000 {
>> +			compatible = "qcom,sc7180-venus";
>> +			reg = <0 0x0aa00000 0 0xff000>;
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&videocc VENUS_GDSC>,
>> +					<&videocc VCODEC0_GDSC>;
>> +			power-domain-names = "venus", "vcodec0";
>> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>> +				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
>> +				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>> +				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
>> +				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> 
> could you align those entries to the first one (you can use tabs and
> after that spaces to align)
> 
>> +			clock-names = "core", "iface", "bus",
>> +					"vcodec0_core", "vcodec0_bus";
>> +			iommus = <&apps_smmu 0x0C00 0x60>;
> 
> lower-case please
> 
>> +			memory-region = <&venus_mem>;
>> +
>> +			video-core0 {
>> +					compatible = "venus-decoder";
> 
> something is wrong with the indentation?
> 
> Please run checkpatch with --strict
> 
>> +			};
>> +
>> +			video-core1 {
>> +					compatible = "venus-encoder";
>> +			};
>> +
>> +			video-firmware {
>> +					iommus = <&apps_smmu 0x0C42 0x0>;
> 
> lower-case
> 
>> +			};
> 
> This subnode should be in sc7180-idp.dts, because we assume that by
> default the qcom platforms have TZ.
> 
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>>  			reg = <0 0x0b220000 0 0x30000>;
>> 
