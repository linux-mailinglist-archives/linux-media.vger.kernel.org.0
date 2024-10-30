Return-Path: <linux-media+bounces-20580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3B39B6125
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8A11C21C0B
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795BD1E47B9;
	Wed, 30 Oct 2024 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyFjLMwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8E01E32D8
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286658; cv=none; b=Dbx5GkGI1qP7EAsG9VMZpBYiaJgywzOXm9gnqn8AZo9HdTOCRQxs89+LrJJOMZL7wtQCErtFKI/6xxIDUqlqSoh/Z/NASFlIUdrqzipoongubmCnDLvNO24KCSHFr2t5QoEXw3w/mLk2m7Km8k8MxwakfyZWYfPLvyf9tRC3UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286658; c=relaxed/simple;
	bh=mXkD6+ddr41U5PViIBTU9BU6uT/vbTsDOmmsfhhEJwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nisnlyIBDdyOFC76548aojq5IBNLbsdOuKFSriLyT4qEDbwOm2VQyrUNzrThUm26HgEJwmYIYlbkmDWp0mlVsF4A5yqkD+dWFm5xuPMkacylKBGsG9FgI27WtYUz/rM41AFaK3o8iI1yEsmqbdijHTcUFItEB8+3QDz4f7Ut+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyFjLMwP; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb49c7d4deso4598501fa.2
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730286654; x=1730891454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOnTk9a6lwE+fikfwNbQZenhWDbjRYFsjjyWWoDZ0tI=;
        b=lyFjLMwPgeu5xYtRzN/tuNtYrAWSZw0VsA+RdTgOJ775wXREvHZxYtKhKrOAgpLqjX
         Ba4sbrUWQ+uwcoIImDIRFSmCYe3CEQs46gNqaBVuvfZbHNBwR8/0HMXeR+Czn7YCYyyJ
         SdIa+GXzeAHBtcjj64c3CqQrizPkf22rgD9QwYwBkTahTbYFZNQtApQgljhlXKkEWdHc
         uEdMmPE1z/7aGUmiljulz/htzXzo8KvHjl7tTgoj24jgx7xpEMB3fvD4GddkNPVPyuc3
         nuVGHuaD80WQM5tNIC387bHOO3yP5h7hGqL6YSYp/s3KULi5ihbaXR1udj2cMaUHxIXe
         F8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286654; x=1730891454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnTk9a6lwE+fikfwNbQZenhWDbjRYFsjjyWWoDZ0tI=;
        b=EKc4CKRWEW47G3rAtMi/odCleO3vRQbYM/gxzclLUBdYdK4Df2JmUCB7kwvkyxLF44
         4oVR4EX7gTIKycxfGcckmwlsrYSziIG1ZKpa5K61UygtzZ14YPZeNlGa5vl2oROzpR1I
         wVM4mN5YeiAVQE5k4T65SbKsMtXo6E2cMVCYCp8ggdWlWoMw6nZK8GvvJoMCla78iGq8
         aV4vy/e+Ok2PCZwQEw0fs7oClYdn0oQoVKwohPEf5XG/RQg4ZiyHU9g5/i6jkZIIfyNp
         Svt8O4C3Ii7XdqnWZvgHYRnTOH/Vpa8SpZSgFoBhWkETHBHrVtiusPhNL1Hfk4KTM3HK
         58iw==
X-Forwarded-Encrypted: i=1; AJvYcCWNa226B1E07ihksQj11uSUAu14WhNlNn6960/QHxocEXqSpm+j6NPBQXekr5UtzZf9E5khx+aJciDbxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4yCcq3NAzlEMQaBhH3RdI9TeBBeOCdyB2jAA3LYSIZNEkRD9M
	5vyHZt/3Tjdecg0kGK2KwlfXQUc+ExzmkaP3Z3JqaFXh1PA4aNIAlXoXczQlIf8=
X-Google-Smtp-Source: AGHT+IEzJbN78pas3iBKE3f0DF1PHH7hK5iUIwcfZk1R7VOhJ+ChO8DW/VFwGmpEUrcrPWlQ5+q1rA==
X-Received: by 2002:a2e:a983:0:b0:2fa:d1f9:9fb9 with SMTP id 38308e7fff4ca-2fcbdf5bf6bmr22883061fa.2.1730286654441;
        Wed, 30 Oct 2024 04:10:54 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb818ff46sm227061e87.45.2024.10.30.04.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:10:53 -0700 (PDT)
Message-ID: <812499a0-b87e-45e3-b491-5f369b6de5ca@linaro.org>
Date: Wed, 30 Oct 2024 13:10:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 10/30/24 12:53, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss to support the camera subsystem
> on the SC7280 platform.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

<snip>

> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domains-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply

These supplies shall be split into pad specific ones.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/interconnect/qcom,sc7280.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@acaf000 {

Unit address is not the first one from the list of addresses from,
reg values nor it even in the list.

I kindly suggest to sort the list of reg values in address increase
order, this will immediately make visible problems of this type.

> +            compatible = "qcom,sc7280-camss";
> +
> +            clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&clock_camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
> +                     <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +                          "csi0",
> +                          "csi1",
> +                          "csi2",
> +                          "csi3",
> +                          "csi4",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "soc_ahb",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe0_lite",
> +                          "vfe0_lite_cphy_rx",
> +                          "vfe1_lite",
> +                          "vfe1_lite_cphy_rx";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +
> +            interconnect-names = "ahb", "hf_0";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            iommus = <&apps_smmu 0x800 0x4e0>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domains-names = "ife0", "ife1", "ife2", "top";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0accf000 0x0 0x1000>,
> +                  <0x0 0x0ace0000 0x0 0x2000>,
> +                  <0x0 0x0ace2000 0x0 0x2000>,
> +                  <0x0 0x0ace4000 0x0 0x2000>,
> +                  <0x0 0x0ace6000 0x0 0x2000>,
> +                  <0x0 0x0ace8000 0x0 0x2000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0accb000 0x0 0x4000>;
> +
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";

reg and reg-names properties come right after the compatible property.

> +
> +            vdda-phy-supply = <&vreg_l10c_0p88>;
> +            vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };

--
Best wishes,
Vladimir

