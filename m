Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7842FC4B0
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 00:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbhASXVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 18:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730664AbhASXT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 18:19:58 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B55FC061573;
        Tue, 19 Jan 2021 15:19:13 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6DB131F9D2;
        Wed, 20 Jan 2021 00:19:11 +0100 (CET)
Subject: Re: [PATCH 2/2] media: dt-bindings: media: venus: Add sdm660 DT
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-3-angelogioacchino.delregno@somainline.org>
 <20210119231709.GA2775697@robh.at.kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <22723c30-514e-5181-adb0-414fb5e32a26@somainline.org>
Date:   Wed, 20 Jan 2021 00:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210119231709.GA2775697@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 20/01/21 00:17, Rob Herring ha scritto:
> On Fri, Jan 15, 2021 at 07:52:52PM +0100, AngeloGioacchino Del Regno wrote:
>> Add new qcom,sdm660-venus DT binding schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>>
>> base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
>> prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
>> prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
>> prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
>> prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
>> prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>> new file mode 100644
>> index 000000000000..e7568d4007af
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
>> @@ -0,0 +1,164 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/media/qcom,sdm660-venus.yaml#"
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
>> +    const: qcom,sdm660-venus
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: iface
>> +      - const: bus
>> +      - const: bus_throttle
>> +      - const: vcodec0_core
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: video-mem
>> +      - const: cpu-cfg
>> +
>> +  iommus:
>> +    maxItems: 20
> 
> Perhaps some explanation as to what all these are. Looks like it is just
> 1 iommu, but lots of ids?
> 

Sincerely? I have no idea. These are all of the non-secure IDs that
are used downstream, but as you can imagine, there is zero documentation
about them.

Though, that's what works and that's what I've pushed... that's all :\

>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 3
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: vcodec0
>> +      - const: venus
>> +
>> +  video-decoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-decoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>> +  video-encoder:
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        const: venus-encoder
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
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
>> +        maxItems: 2
>> +
>> +    required:
>> +      - iommus
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
>> +  - video-decoder
>> +  - video-encoder
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +        #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>> +        #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +        video-codec@cc00000 {
>> +                compatible = "qcom,sdm660-venus";
>> +                reg = <0x0cc00000 0xff000>;
>> +                interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>> +                power-domains = <&rpmpd SDM660_VDDCX>,
>> +                                <&mmcc VENUS_CORE0_GDSC>,
>> +                                <&mmcc VENUS_GDSC>;
>> +                power-domain-names = "cx", "vcodec0", "venus";
>> +                clocks = <&mmcc VIDEO_CORE_CLK>,
>> +                         <&mmcc VIDEO_AHB_CLK>,
>> +                         <&mmcc VIDEO_AXI_CLK>,
>> +                         <&mmcc THROTTLE_VIDEO_AXI_CLK>,
>> +                         <&mmcc VIDEO_SUBCORE0_CLK>;
>> +                clock-names = "core", "iface", "bus", "bus_throttle",
>> +                              "vcodec0_core";
>> +                iommus = <&mmss_smmu 0x400>,
>> +                         <&mmss_smmu 0x401>,
>> +                         <&mmss_smmu 0x40a>,
>> +                         <&mmss_smmu 0x407>,
>> +                         <&mmss_smmu 0x40e>,
>> +                         <&mmss_smmu 0x40f>,
>> +                         <&mmss_smmu 0x408>,
>> +                         <&mmss_smmu 0x409>,
>> +                         <&mmss_smmu 0x40b>,
>> +                         <&mmss_smmu 0x40c>,
>> +                         <&mmss_smmu 0x40d>,
>> +                         <&mmss_smmu 0x410>,
>> +                         <&mmss_smmu 0x421>,
>> +                         <&mmss_smmu 0x428>,
>> +                         <&mmss_smmu 0x429>,
>> +                         <&mmss_smmu 0x42b>,
>> +                         <&mmss_smmu 0x42c>,
>> +                         <&mmss_smmu 0x42d>,
>> +                         <&mmss_smmu 0x411>,
>> +                         <&mmss_smmu 0x431>;
>> +                memory-region = <&venus_region>;
>> +
>> +                video-decoder {
>> +                        compatible = "venus-decoder";
>> +                };
>> +
>> +                video-encoder {
>> +                        compatible = "venus-encoder";
>> +                };
>> +        };
>> -- 
>> 2.29.2
>>

