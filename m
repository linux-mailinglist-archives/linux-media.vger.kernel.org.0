Return-Path: <linux-media+bounces-25791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516AA2BF49
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 10:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B61D7163188
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A322343B3;
	Fri,  7 Feb 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntYJUBZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD049481B6
	for <linux-media@vger.kernel.org>; Fri,  7 Feb 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920532; cv=none; b=Ins+ObceqHxCF7+cGATsZvvE9fceUyf9IOUhVB370Pgs9PziBknNefBKjQ/wsu6ptYpq2oVeidpEbURPWol5uxNChTJsCoExNXlMnTpwZZynxcg0ZBDouSJfqxIFvWfTMG0d9W9EbaD55a6X9ZHrt3nwgP4Omn3fLWwpcs9SmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920532; c=relaxed/simple;
	bh=eIHTE8qRxDWKcq6Qy29TlpDPdetAC+KeKbRIcSkyUKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b4rbRKx6VPW4AFCt0dBlIqDdzbXm9GMYQUjEnbETx32htN74ggYB9FMM3dEHwG1ZN8O4AeCglbSWS9NgJ2xTKzAeS3en5iLUiopynDdGVIwSBm0wnwI4jYiPe1ta23/vkntQhw+AZs2cC0+UYvo39bYaLyX8bcmbeeGm7YLaV9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntYJUBZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770afW018024
	for <linux-media@vger.kernel.org>; Fri, 7 Feb 2025 09:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NqxrxK3xet8+h8NdpIJWE0d4FKW87vOgxxpkOISpEs=; b=ntYJUBZBAEroMqow
	mnj8ab2Di391eqecP8vTQu5LJSa060xRl0VQGhxs+O6xRd8uaUSJcUl29fpAz5s8
	2Y7lmBlyW5/iTaKCBmCtVO0hdf70ViVbw6VLCz8b7EuYNLNDCC4d+n0VVdyY+dLK
	+ri611+AnFNBPJEOMvwwdmAZKgNr5umdwvs1JsTDbR4KQhHMuqDBTmXb8FjJ5yuo
	1DXxrMMZHK4fRBqVT2QeJAAv3QE3tu8s/0sTJ4A9ocWa1Or58+SYk06IetzoZ8BR
	7yo3+PU8POBIFbMzo13M1wkehrdCbZgd3uScAKcZRrdF+wAStF/uzYK2m0c3sR7i
	M9dsAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddkrc38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Feb 2025 09:28:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f5067e443so10202375ad.0
        for <linux-media@vger.kernel.org>; Fri, 07 Feb 2025 01:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920528; x=1739525328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NqxrxK3xet8+h8NdpIJWE0d4FKW87vOgxxpkOISpEs=;
        b=WYIUMKEWL+fouW7LtM+dXHcnh4F6JbVEeKcYDrs0+fPngQzly708qE/PYemoSncy0d
         gsWFAmFfyvMcPeOed2KsR8Qd5y6k247spuAVZIlpUxxyndnoaS9B4jzA80h06Gm+j3aI
         heA3gCAsUA9BZt79iFhlFnc3QUOSDad4hD6/4byCUi8PY0Mw7vhOqLvw3rClDW2Jfrg9
         cKohvvEcyQjHEI2osFOUFLgc9z27TkYbKDy0Z4U6PVI/Dss6iYBlAoycj0MufKn47d77
         PYF7ekp1LB8Gva54tEzOvc+PIvLhV9RCYCTU4YZ0zEB0vcVu/9wPU8e6GBLUKuITcDN2
         neRw==
X-Forwarded-Encrypted: i=1; AJvYcCVCJOmI/QVCyXxlOJcsQOrLvaX/gO5WRN/gC9SanERRCzuDAMc1KcZ0sGHAZQgyux41shX7F2PLiLARUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNbMmswT5G7HS9jlPyHDZDvUBtEaHUdPROPZHnDD3Ia5YeRPSh
	TVd5HR+npdIF56p6NPShJUTR+DEK3vsLEsvNRsfbP5apK3ntTlZDy4Reddr0ucbtd36KJcep+IH
	rYamGfLLLaxfUrqHmLZCCYo8AbKNkcZrT3YgV7fFmOqlv/wUH0FJXWmN67RvgHw==
X-Gm-Gg: ASbGncsCLGEhrvNaV18WK2hn69Wwdck8GEtKJhP4VEcUXiQANysDHJW+DkWvY467mdz
	2OOMV6DZ77zlKOqXQ281od4ToyKeyFHCJGSzeYPXTZepi2ppSU9U/eOcBjbMBDLEDsyQfAgaira
	fDKCf/VUMWHu/+ohxmqmueROALzhIZujBQb6q66wUDet4U0rtN2H0g1EAcRNCPmW0gTZWTxivdf
	n+ZiIEDPJf0CsLR2CE6nhbbDwmPGSH56pw41RzEih1An0okjMXv0Ggbmccroo9qtgBAUj3IW/RK
	JT8BPryQloYjTVKiWI8J1DtoPRqNk5owIgvxWdKiL9EvZ4Ec5Mrmc+Cgn9nGdHI=
X-Received: by 2002:a17:902:fc4f:b0:21a:8769:302e with SMTP id d9443c01a7336-21f4e6ad349mr47724405ad.14.1738920527822;
        Fri, 07 Feb 2025 01:28:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdITSY3Xbsq3qeExulM7OKAMdr3dJ0xmAXSbW0AXp7CYFXVCNY98Q+WzzN9OaitkXgQXgptQ==
X-Received: by 2002:a17:902:fc4f:b0:21a:8769:302e with SMTP id d9443c01a7336-21f4e6ad349mr47724115ad.14.1738920527391;
        Fri, 07 Feb 2025 01:28:47 -0800 (PST)
Received: from [10.133.33.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36896b86sm26147275ad.212.2025.02.07.01.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:28:46 -0800 (PST)
Message-ID: <61045cc3-d030-4c63-8a1b-103ff8c374f3@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 17:28:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250207090422.1609260-1-quic_vikramsa@quicinc.com>
 <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250207090422.1609260-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: chR2JXJZWLG4XruGqlVbnzusLzReO4m_
X-Proofpoint-GUID: chR2JXJZWLG4XruGqlVbnzusLzReO4m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070072



On 2/7/2025 5:04 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 89 +++++++++++++++++++
>   2 files changed, 93 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 140b0b2abfb5..213d941b1b79 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -116,6 +116,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> new file mode 100644
> index 000000000000..2a59d2f22eb8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
It's 2025 now, it should be 2024-2025.

Thanks,
Jie

> + */
> +
> +/*
> + * Camera Sensor overlay on top of rb3gen2 core kit.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* The port index denotes CSIPHY id i.e. csiphy3 */
> +		port@3 {
> +			reg = <3>;
> +
> +			csiphy3_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_suspend>;
> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_l18b_1p8>;
> +		avdd-supply = <&vph_pwr>;
> +		dvdd-supply = <&vph_pwr>;
> +
> +		port {
> +			imx577_ep: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		pins = "gpio67";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		pins = "gpio67";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +};


