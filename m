Return-Path: <linux-media+bounces-48856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE10CC1537
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 08:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7406E306501A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807B02749FE;
	Tue, 16 Dec 2025 07:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKcJHQ7d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03930E820
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870563; cv=none; b=aUEFPsyM0ommjeMpBa78YNgrXJCN4DaiiEe1lscNN9N4dHCoSHiKlXfW5CoLVXUqHwFmWjsFRk7l9bm6tEPAq+yDAevOt8KcAPb3jJtvn9zgESb9fsGDoQHpuToo6Yjzy360yvV3rXILvqNfOlJzblsTbNKKXkRCy2vz95Cl0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870563; c=relaxed/simple;
	bh=TSTZH3ha7P3zf07UuAzzCe0DuOTPhq7Iu4ok3zeXQDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RslbAHh0RPaecKS2/gmXDwaEcQlOPr1aSnqW3fXzVzh9O9BCpmG7ESwfe8bCucNdCpheHveC6fDfkgzbcwLUu4Ekh7GtH0mfv4RxJqk4Tu/EgIciDf3SD5oKmnJwfP3I9dZ8uLwKlYHhfHLwfsPps0jnyoRs++vaitFrcRyBLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKcJHQ7d; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37fda2853c0so3875981fa.2
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 23:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765870558; x=1766475358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=MKcJHQ7dLs5AtE6b7YT3ZDf5h3PkL5su1lXUpP+J9VClf9fUGrUYX/MCeT25FVhJ59
         ix5+KNe4tgJt9cMfVy97/AGeAN4oWklYOkb1haEjrQw7GQ2AirIl0auSmTAiOJdfs5qs
         EyTj9dpJL8XCkVyenr9nT9+wqYB8b5rSc5Wo8eHRXeeVG1bMCCRZpy8ya+H/egpEVxOo
         wVBusbwblb89K4aQbImL0/m08ndrZJetUbbzoYawmltU8hCUaKg5YMzjoBWW5tI8okVX
         h+pqLqKB9CKBQsOhBwDbK7tWFpWkGNah57K/MMfGDFXmsAP7QOORbzl07LHEavKzUJhd
         QjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870558; x=1766475358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n16XrMflW8K8mCPPIig2n79GG39zI0dw0k9fySATJAk=;
        b=wyIPbVbgEgrIAgT4dGmVJQOZQTmwWXY7qfUQXXdoSkaNtgiOLPWitI2SBlDHy9UI1q
         wIN8eNmFtPkw27jaCClhjMHFk6azwY1FyFvwUEEuTJaqxQ8O55VhN/QCSFXRq6Xy4I5t
         tK30RIUp6MNx9KKVwUJfh5HTd+MubdoIkKbz4znTaFD7q/qTTCfVaSrmB120SGWKdiH+
         zQfwdWH4Mq2Te/YJK4shp/hFgiz0d7M3o8QYWhdesmhLodm30xo5In10gXPYPZkLfM0M
         +ADFePug10252UoLqoKBZtl3QyMrW3u+aHwnRz3xSQxdOi0ykBEyAqm6nwx1O2DKonK7
         5H1A==
X-Forwarded-Encrypted: i=1; AJvYcCXTC6EbJlEPQXPrZkreOsBNKTkC4aT4hbbm1Ra8iUcufcwWhmgZNYJwlSK6zzBBPRgIPCGUJdarlAbeXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXC59yGXf3U615OPchuvLfWJVgmXrjBnm2WOeRKNL1VYuPiBOn
	w1om/ajWJPpv6NI81Kv7zVOaE8Q1//GzSs+bnLv6QsogAi3YMsF4oOIferXp5EXPF18=
X-Gm-Gg: AY/fxX5KVaBstQzU6h9BzV1ByYjOjdSp1/6xIEEd+I+2Oy/qnTjSrk5OpD21esv7/BH
	HdVAgK1mSTr1/fXjV8NjVUgtdqBJmBrd1XxAPTwgupx8mQsXuAUOKNDyb4frPEYUrV6HOHjFTDQ
	5Pp6xho3VmPBVjcHZd59ODLjvhFfoFC0uUx82MKNtUUaB18wj5fvV1VvVFOjTwZjzp95c38aT7h
	xJTTMfYlYX7n2amWqdVjTuYKENLUTj7Nyo77TMUMqquXPEderYmuvLyODMfsrzn4yI1iWoWMa4r
	2bGKibriNUifx6Vv3VrjHsqk5qEiCuC0JOyuKX3OmBk1FCexi6uL3EJXBhLWvZsZGjxan6PT2sI
	FBGtiiq+MGgTcWtfvk46QQ9QkYXu5zqBUE4euc5hQ9L1vpwkGzw9RBr1ggoOr/e4Bk/pxzr7BZ1
	TJTzm810xtimST4GW0htQqU5EKi0hc8QNFyZQnoT5jivS2EmDxD7s0LeKdWaHu+FE5Yg==
X-Google-Smtp-Source: AGHT+IEA3Aizumvo2C29apLGRfL5f4cmKkJaCe7dpJMQ1br+YvsIHx4NhcZQQJWEH/cY0jbWIL6pIw==
X-Received: by 2002:a05:6512:3e27:b0:598:e3ed:b43e with SMTP id 2adb3069b0e04-598faa98e36mr2872191e87.6.1765870557425;
        Mon, 15 Dec 2025 23:35:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5040bsm639372e87.65.2025.12.15.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:35:56 -0800 (PST)
Message-ID: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Date: Tue, 16 Dec 2025 09:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 08:22, Nihal Kumar Gupta wrote:
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>   .../dts/qcom/monaco-evk-camera-imx577.dtso    | 67 +++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..b1ba182a0d8d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -38,6 +38,10 @@ lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
> +
> +monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> new file mode 100644
> index 000000000000..351eb5ee70ba
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Year is missing.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property here.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_cam1_2p8>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;

data-lanes property value should be '1 2 3 4>', 0 is for the clock lane.

On CAMSS side this cannot be changed, unfortunately it's a lingering issue.

> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};

If only one of 3 defined from 4/5 regulators is used, do you really wish
to describle all 3 in advance? You may consider to remove 2 currently unused
GPIO controlled regulator descriptions, and squash this change with 4/5.

-- 
Best wishes,
Vladimir

