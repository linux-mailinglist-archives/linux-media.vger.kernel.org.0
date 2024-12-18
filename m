Return-Path: <linux-media+bounces-23694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6D9F63BC
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 11:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04F1166894
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B0A19D091;
	Wed, 18 Dec 2024 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LX4JUP/v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D618CC0B;
	Wed, 18 Dec 2024 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734518793; cv=none; b=C6ipfUcrhRIpduuos4+XNU9yC+Gwr93rBnYRSJfAta8bsRVayaG9+Nf/L8Z23Xik0+l+VgWoTaLiqJekLGcPnZyzNGuV9RFVWVNyqjzAPBHoa3qI62alDPBulew+dwxjSCJ00+tl6d/47UcG3/4T7EUmhFkeQor7XfI5pwYdd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734518793; c=relaxed/simple;
	bh=LeiZxD2SS3cnNCc/TjgOhlqPqcTTP3BwDJy26ihMB+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BvVmqF1vbXUvO2MLNueqouupOe3B74uk57qUXB2cedbSibPTGSYFGZ7zAitwW7ouqWMISv+FGDaB7q8dRsHgNviFKyuiWdrKPVSfPW9BhWQ91QEbeNn4Nd7fzAMjoBqqKDAqtoPCbU+OFlAzi8iD9f1DeUKXeun87SDWCcQvF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LX4JUP/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI8Z694014089;
	Wed, 18 Dec 2024 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/eXvcoGmIBVKFH6y4YfisOJWEdByPj+xqRty+twjcn4=; b=LX4JUP/vRTgAbPZ3
	iNLWB5+Qb2eeUXNp+oi/iLjbyGGmVatwoeUMP/HJO3XohuRjgWrIWR90qTeMTpIV
	8Dln5qQejOBHPu+AsBG4cK0D9nPVTX0LWJW9zJ5OU/ENtaZj6vhaofAbCxpplc7A
	OKfJ0W6x04cMwMtsLYzQ5aA3WMidQGxhowG3PU4Y/pvZWW3o6DsnrRLCe2T1EJII
	6SVSsO/v+Ez1l5zAkOkwXlB4Js++N96SVr+HxQpwlftt4+z/cz9SuzYpY4I/DvTD
	5Q3AfOFS8f8c4462eHSlQaknHuiQcDOy1tAeOXDJo/MFs3QPX4YMq+D5Q1FqkgxH
	Vzj7RQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ku0p0avj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:46:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAkQ1Q009568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:46:26 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 02:46:22 -0800
Message-ID: <283a54b2-6e00-4d3a-95a3-df4a06bc1292@quicinc.com>
Date: Wed, 18 Dec 2024 18:46:20 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_vnagar@quicinc.com>, <quic_dikshita@quicinc.com>,
        <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ksa4pbXwkKoXrJeGdx5DbJmuO3bfNXKa
X-Proofpoint-GUID: ksa4pbXwkKoXrJeGdx5DbJmuO3bfNXKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180087


On 12/9/2024 7:52 PM, Bryan O'Donoghue wrote:
> For the list of yaml files here the video-decoder and video-encoder nodes
> provide nothing more than configuration input for the driver. These entries
> do not in fact impart hardware specific data and should be deprecated.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 12 ++----------
>   .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 12 ++----------
>   .../devicetree/bindings/media/qcom,sc7280-venus.yaml         | 12 ++----------
>   .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 12 ++----------
>   .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 ++----------
>   5 files changed, 10 insertions(+), 50 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> index 9410f13ca97c181973c62fe62d0399fc9e82f05d..da140c2e3d3f3c3e886496e3e2303eda1df99bb4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -45,6 +45,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>     video-encoder:
> @@ -57,13 +58,12 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>   required:
>     - compatible
>     - iommus
> -  - video-decoder
> -  - video-encoder
>   
>   unevaluatedProperties: false
>   
> @@ -83,12 +83,4 @@ examples:
>           power-domains = <&gcc VENUS_GDSC>;
>           iommus = <&apps_iommu 5>;
>           memory-region = <&venus_mem>;
> -
> -        video-decoder {
> -            compatible = "venus-decoder";
> -        };
> -
> -        video-encoder {
> -            compatible = "venus-encoder";
> -        };
>       };
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index 5cec1d077cda77817f6d876109defcb0abbfeb2c..83c4a5d95f020437bd160d6456850bc84a2cf5ff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -70,6 +70,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>     video-encoder:
> @@ -82,14 +83,13 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>   required:
>     - compatible
>     - power-domain-names
>     - iommus
> -  - video-decoder
> -  - video-encoder
>   
>   unevaluatedProperties: false
>   
> @@ -114,12 +114,4 @@ examples:
>                         "vcodec0_core", "vcodec0_bus";
>           iommus = <&apps_smmu 0x0c00 0x60>;
>           memory-region = <&venus_mem>;
> -
> -        video-decoder {
> -            compatible = "venus-decoder";
> -        };
> -
> -        video-encoder {
> -            compatible = "venus-encoder";
> -        };
>       };
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> index 10c334e6b3dcf25967fa438f8e6e5035448af1b9..413c5b4ee6504ba1d5fe9f74d5be04ad8c90c318 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> @@ -68,6 +68,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>     video-encoder:
> @@ -80,14 +81,13 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>   required:
>     - compatible
>     - power-domain-names
>     - iommus
> -  - video-decoder
> -  - video-encoder
>   
>   unevaluatedProperties: false
>   
> @@ -125,14 +125,6 @@ examples:
>   
>           memory-region = <&video_mem>;
>   
> -        video-decoder {
> -            compatible = "venus-decoder";
> -        };
> -
> -        video-encoder {
> -            compatible = "venus-encoder";
> -        };
> -
>           video-firmware {
>               iommus = <&apps_smmu 0x21a2 0x0>;
>           };
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> index 6228fd2b324631f3138e128c918266da58f6b544..c839cb1ebc0999e10b865f4bb43ea76ffa2bf46d 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
> @@ -70,6 +70,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>     video-core1:
> @@ -82,14 +83,13 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>   required:
>     - compatible
>     - power-domain-names
>     - iommus
> -  - video-core0
> -  - video-core1
>   
>   unevaluatedProperties: false
>   
> @@ -119,12 +119,4 @@ examples:
>           iommus = <&apps_smmu 0x10a0 0x8>,
>                    <&apps_smmu 0x10b0 0x0>;
>           memory-region = <&venus_mem>;
> -
> -        video-core0 {
> -            compatible = "venus-decoder";
> -        };
> -
> -        video-core1 {
> -            compatible = "venus-encoder";
> -        };
>       };
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> index f66033ae8b590e7b6f1e344c368994744411aca2..da54493220c9dc90e7d9f5fcfce7590acb241c85 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> @@ -73,6 +73,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>     video-encoder:
> @@ -85,6 +86,7 @@ properties:
>       required:
>         - compatible
>   
> +    deprecated: true
>       additionalProperties: false
>   
>   required:
> @@ -95,8 +97,6 @@ required:
>     - iommus
>     - resets
>     - reset-names
> -  - video-decoder
> -  - video-encoder
>   
>   unevaluatedProperties: false
>   
> @@ -132,12 +132,4 @@ examples:
>           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>                    <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>           reset-names = "bus", "core";
> -
> -        video-decoder {
> -            compatible = "venus-decoder";
> -        };
> -
> -        video-encoder {
> -            compatible = "venus-encoder";
> -        };
>       };
It is working fine on QCS615.
Tested-by: Renjiang Han <quic_renjiang@quicinc.com>

-- 
Best Regards,
Renjiang


