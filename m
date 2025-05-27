Return-Path: <linux-media+bounces-33465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF0DAC5059
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 15:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AFC018992EF
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 13:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01B02749D9;
	Tue, 27 May 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7AujiWH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417E13A41F
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354246; cv=none; b=cZTvPBPKOEgbK7apc4hTi/Bope26EQpUpGrCyAfLGG9KQOO8OI8o6dVA24VarxGHFv5WtzkyLS7pPswLUsNZu/EiSQ1FgoGFRSEYFwofJ98l9NmlzwaKU6qTr7HEd2OXBDqc5j0rzfY1TqX4qYoMSv8swVenV7Qq7VPWY2iLQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354246; c=relaxed/simple;
	bh=Jf0YCPf8g0x+7itY5WOSav/lMYNDlkwoS2veAsYnXII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMc9bVb1HVJth+s6qgPX7wxnZW5mgEqFaieDN4SSrg7tR6kXHs7HaX6yyL0ihUDREtJRi/ZmPfK97Nvpx794bAK/eLOc866nYAyAsIH/Wp82FbNOg9qxQkG+sHa/+Rj82+2k6FKM9UmiqZefdb1+ViOY4Td6r0oS2oMJ/dhaOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7AujiWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAGEgC013673
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 13:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyW9uKYhLOSUBJHa/KU3PEprBrYxrl5Dljp8vZpViOU=; b=a7AujiWHdvmjqQnv
	cEknsSF/Aq3dRo0wPjl7o6AHVK2Z2UUKs5YzTfI9nyEbtB4CBm3LkKtJobx0yLrd
	DmP4IoifQAT+9t822m+ZTVYsK94Nor4yNM3XIxc3tw/JsycII4/EMoPlPFjeJhJx
	49hGHT9ZdOGLGTVE99O7UNbQmFfTRNQ62EudwCA05J1zDNcvfZSmin2/3U+YxyBc
	DeeX/vLxo0VK/bPxCRzM9SU1wQ609ZM7L0r5WnJReQBG1RJQF4wrsg3Qvgc4/2Rl
	gxydZ4UxjM2NYLY3kBkayoH5QE9KB60PoJcc+dW92sGhaU9u6uopWdi6j+Qoa7P9
	KLKmTw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq77vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 13:57:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fa9cc8eb70so1666736d6.0
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 06:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748354243; x=1748959043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyW9uKYhLOSUBJHa/KU3PEprBrYxrl5Dljp8vZpViOU=;
        b=A8iUWy96SLz8ybwqmrKjJxiGA8WgQTLYgyqMYq6VUuQJOvOys4xcxxuYXRWWRJ9X5G
         6q++dSX2IXpnmZdpyWpQsbd8CSXh/B0hXabnY0Cf1CuajR1KmPAxDHnhYfHc0wcehOY7
         JalGb90yd8tMm2f2mAHz7bmOX8COxMh2lgieBfhz+TeX0B9G48jid3CbIVS8pR7yNK+y
         sAsm8spW7fni5piXy8MyMPcPW0r9vnmhLiUDZHuu9oFulrVzf/6qDwgGJDPSY//xPwnh
         VM2ez9gQUUZqIRf3y55AAB3C3x8e8tyS182gAWJX27EDG1Zw/uNKTRjbZKi7iz6ZWiQp
         sqRg==
X-Gm-Message-State: AOJu0YwWH8QogY77E+2TA5PO3hDs6eWHYjdRiT088wl0Lz+yNKAWra75
	tRlbygSazS4prlCHyxWFO480rmDXsxXtf6ePTlf0PNXTq43oNonI2ZogpOoY+VHBIpJDgd38E3i
	qgRY3cb9gZJWzXmkiF3yUpo+J9CFAhLnOICYX9rs7MkjZa0DMDuLBsDWKUkbo39xdiw==
X-Gm-Gg: ASbGncsZ/Zc+kwohPFa5WlOguwATpTwmMSXWdsbDCH/N8DRPDwOb6Kvf7C0vslsCski
	rNHzqID0CyznJX4qCBBJM3OYRd9paWvuERaNNlFIKJbqys6buadbtAZ+TQwjm8pGWRWxltOJ+Kp
	pStknQN03JAXQ2JsUH4Fu4AGr18mKQ1IUJF95/ltBUwbcGvW8niqSQ9NS1cQKiOfJeZ56KNSea6
	BYBg3qaypNJ6tI1PFrIJQYLQuUppb948ZlZQUfO68vVVJrSxdNTUZjTw6sQKEjof2c1Wefb+zLp
	tdxO0Um5JiFGFz3XojlsKmVBq7t0fgoER/+vcUosEIacucMyYUP7XDkr0k/V7daCpA==
X-Received: by 2002:a05:6214:2025:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fa9d35e356mr81224686d6.9.1748354242752;
        Tue, 27 May 2025 06:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy8CpXFq9dIDx07jLGkQ8eE6QzLzCZcUSNuxAodp8IkcqCYpVd2hVBDPcVrD9eccP7q+X0qA==
X-Received: by 2002:a05:6214:2025:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fa9d35e356mr81224466d6.9.1748354242360;
        Tue, 27 May 2025 06:57:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d443a0fsm1868061866b.97.2025.05.27.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:57:21 -0700 (PDT)
Message-ID: <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3InoczdVJQDyJ5xG_E9v-b75YYPil5AU
X-Proofpoint-ORIG-GUID: 3InoczdVJQDyJ5xG_E9v-b75YYPil5AU
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6835c4c3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=pe7rIdR15tyH1Ib53uMA:9
 a=6SDWfad8ZZyXS8WB:21 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExNCBTYWx0ZWRfX1GKJwTEmdBwV
 IzaZTaYzj7TKYPM4lV7DJ6KEboL3ORLmuc+icFclhonuRDV3zcM/jg4+g11wu3bPwkIobfutneG
 RhbtusoJvjgUumfAi5lACtZY0O210y7jifgd7Zm1IU4hEeV13cn9q+JEu+PsljF+qjPfcJpKM6l
 /l3ZeeYXGkyhIpvcDQyJhRUE7NrwrVTgN5HiZk0vmYlmtDONg1ksnDJrOdIdM6v9G+SSlIdQv1w
 DSwpIrkrlKfWsJ/PxLj5FFMQKhKhlZPIQ0KTrkwSPDyE90ZQj2pr6uFL9pfSfjw4oWL8/NChC6+
 2RwPYMhV/5iTbJuZL7CmBwuZJxmw1a50bw2d2uYRW7n53foIS1W3Ic5rR1Fd/G012ccZGKBUTC3
 3A5ZiDmc+FMbWZadThiQGwGwvZbyyL5LNGm0S65LXIt7R8dwOghg8/aUzHSVmduprfR/c2HV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270114

On 5/27/25 5:32 AM, Renjiang Han wrote:
> Add the venus node to the devicetree for the qcs615 platform to enable
> video functionality. The qcs615 platform currently lacks video
> functionality due to the absence of the venus node. Fallback to sc7180 due
> to the same video core.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---

[...]

> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;

QCOM_ICC_TAG_ACTIVE_ONLY on the second path

> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus = <&apps_smmu 0xe40 0x20>;

fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)

> +
> +			memory-region = <&pil_video_mem>;
> +
> +			status = "disabled";
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <380000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-410000000 {
> +					opp-hz = /bits/ 64 <410000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;

nom_l1

> +				};
> +
> +				opp-460000000 {
> +					opp-hz = /bits/ 64 <460000000>;
> +					required-opps = <&rpmhpd_opp_turbo_l1>;

turbo

Konrad

