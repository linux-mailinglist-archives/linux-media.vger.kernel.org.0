Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2271E129476
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 11:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLWK4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 05:56:37 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35958 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726717AbfLWK4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 05:56:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577098596; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NiJfAY1Jaqnfgr+KNz/woUb2dC2lG4O1oUiFhjKVbSI=;
 b=jZRaRg/EqnDI9Hg+0PcjwQdPCGF7OVCfryy9JTk+wsMW59XYS9MijhhMfvpTKV6LLcwGR3wH
 L1XWBRqg5n2VKpBbeNQoLvReMz9K2+vP2Dr1jVT2sKuSrbWJt30Vu3pFgFFGHlR7gexk/2uv
 IaK+Dp6lR/xjzH+XgqVLaYY79L4=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e009d62.7f2672f31928-smtp-out-n03;
 Mon, 23 Dec 2019 10:56:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE398C433CB; Mon, 23 Dec 2019 10:56:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25FA9C43383;
        Mon, 23 Dec 2019 10:56:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 16:26:34 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: media: venus: Add sc7180 DT schema
In-Reply-To: <0b38ad39-4601-2b1b-2710-63796ed0c730@linaro.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-3-git-send-email-dikshita@codeaurora.org>
 <0b38ad39-4601-2b1b-2710-63796ed0c730@linaro.org>
Message-ID: <98d3b2e393eec448b96ac520108688a8@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

Thanks for the review.
Sure, I will apply the same changes to this file as well once
you update DT schema for msm8916 in the next version.

On 2019-12-20 15:07, Stanimir Varbanov wrote:
> Hi Dikshita,
> 
> Thanks for the patch!
> 
> Please see Rob's comments about DT schema for msm8916. You have to
> address them too.
> 
> On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
>> Add new qcom,sc7180-venus DT binding schema.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  .../bindings/media/qcom,venus-sc7180.yaml          | 131 
>> +++++++++++++++++++++
>>  1 file changed, 131 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml 
>> b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
>> new file mode 100644
>> index 0000000..a609739
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
>> @@ -0,0 +1,131 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/media/qcom,venus-sc7180.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Venus video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> +
>> +description: |
>> +  The Venus IP is a video encode and decode accelerator present
>> +  on Qualcomm platforms
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sc7180-venus
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    maxItems: 2
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +
>> +  clocks:
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    maxItems: 5
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +      - const: vcodec0_core
>> +      - const: vcodec0_bus
>> +
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 20
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  video-core0:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: "venus-decoder"
>> +
>> +    required:
>> +      - compatible
>> +
>> +  video-core1:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: "venus-encoder"
>> +
>> +    required:
>> +      - compatible
>> +
>> +  video-firmware:
>> +    type: object
>> +
>> +    description: |
>> +      Firmware subnode is needed when the platform does not
>> +      have TrustZone.
>> +
>> +    properties:
>> +      iommus:
>> +        minItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - power-domain-names
>> +  - clocks
>> +  - clock-names
>> +  - iommus
>> +  - memory-region
>> +  - video-core0
>> +  - video-core1
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        #include <dt-bindings/clock/qcom,videocc-sc7180.h>
>> +
>> +		venus: video-codec@aa00000 {
>> +			compatible = "qcom,sc7180-venus";
>> +			reg = <0 0x0aa00000 0 0xff000>;
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&videocc VENUS_GDSC>,
>> +					<&videocc VCODEC0_GDSC>;
>> +
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
>> +			video-core0 {
>> +					compatible = "venus-decoder";
>> +			};
>> +			video-core1 {
>> +					compatible = "venus-encoder";
>> +			};
>> +			video-firmware {
>> +					iommus = <&apps_smmu 0x0C42 0x0>;
>> +			};
>> +		};
>> 
