Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C459B12E37F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 08:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgABHyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 02:54:14 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:39492 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727731AbgABHyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 02:54:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577951653; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yJYJDd1Z2YXAv6jesy41e54rJyXI82cXXASQ0/OaVFU=;
 b=i8k+0GdbTGbblw1C6SZ07XX+CQAEZ5HTwmu/0k4cru43UY4ZKPvOHQHku6LZQ8nzJgfMN37d
 528hUUp1bRjgkIbRkEDtyVQwh6q0VXKIsJNrC9TF2N6/aVLjKEH44RRhLy+xtgxvc1ph4shs
 6waTqL94i9vM7DPTNeMXSaYTXF8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0da1a2.7fb722093458-smtp-out-n02;
 Thu, 02 Jan 2020 07:54:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0A10C4479C; Thu,  2 Jan 2020 07:54:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 062CEC433CB;
        Thu,  2 Jan 2020 07:54:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 02 Jan 2020 13:24:08 +0530
From:   vgarodia@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
In-Reply-To: <20191229031853.GL3755841@builder>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
 <20191229031853.GL3755841@builder>
Message-ID: <17bc9ed78316f483fea273849d39d6a8@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bjorn,

Thanks for your review comments.

On 2019-12-29 08:48, Bjorn Andersson wrote:
> On Thu 19 Dec 23:59 PST 2019, Dikshita Agarwal wrote:
> 
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
> 
> Should this be aligned with the DT refactoring done for sdm845, where
> the GDSC is moved into the *-core subnodes etc?
This is already aligned to new refactored design i.e clocks/GDSCs are no 
more
core specific.

> Regards,
> Bjorn
> 
>> +					<&videocc VCODEC0_GDSC>;
>> +			power-domain-names = "venus", "vcodec0";
>> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>> +				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
>> +				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
>> +				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
>> +				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
>> +			clock-names = "core", "iface", "bus",
>> +					"vcodec0_core", "vcodec0_bus";
>> +			iommus = <&apps_smmu 0x0C00 0x60>;
>> +			memory-region = <&venus_mem>;
>> +
>> +			video-core0 {
>> +					compatible = "venus-decoder";
>> +			};
>> +
>> +			video-core1 {
>> +					compatible = "venus-encoder";
>> +			};
>> +
>> +			video-firmware {
>> +					iommus = <&apps_smmu 0x0C42 0x0>;
>> +			};
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>>  			reg = <0 0x0b220000 0 0x30000>;
>> --
>> 1.9.1
>> 
