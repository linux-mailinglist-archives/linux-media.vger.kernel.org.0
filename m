Return-Path: <linux-media+bounces-36564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1AAF1601
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A93407AC3C0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15ACD274FD1;
	Wed,  2 Jul 2025 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/5x6WQx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D484414
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460354; cv=none; b=CtLhqGoITJFzgD5rXfdQwtVSAc4ecjb8TeddChE5m+IcHbr4OSc5/8YVO5VyT7Z4bkRDZlms5FAhkIfewbgF3As8lDcuwXwLL519hoAlaz1KQ0uqEiFhkdO16FJLLl5RPwvrpScUyUEmsOM/H18kxlZEmhiT2i6PP9zLC2Faqxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460354; c=relaxed/simple;
	bh=L6hhUirJkO/7sMRAQX56jA6n5wv/jVQ37SKFMn2Twmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2z6bIqI3FhHJ+ChYwCm3R9KPBPn+mmespfU+k8Cnvxg7ihDZF1LDllMSFfTEI5buug+eYt4e1LfzCjiJTeD4WPveW7c+aJsmSs5/RyhXiBsZ0dhZqlmzk9lzn5uISw8qxef0daehbqqa+xssi3Dzp3m72ZfAM13CNmdMzGZ1fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/5x6WQx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625oqeF007227
	for <linux-media@vger.kernel.org>; Wed, 2 Jul 2025 12:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aPyaghMl71l2+WzfUFrAleiaGBW4YqofoCOldr6ncM=; b=X/5x6WQxi9fGjLKr
	rheR6uxLJBHs7sCO/OqCjPbI3v0159zQ59jiEx2Qc7IbQiRAGxaVHL0f981YgjQI
	7/vIXPtP0KlBPab7cdrQHK2+O9VmDiyjnNNNNsgVmw8n8ThUcie7QmffSJMRH7i9
	T1pnTkMvWCYnjc+s/QjUbIlnsY2jRBcvlbc9VXR+2mFdCGhg4N8aS9ORaHfZytdY
	EBgwc1t1uTQ/qmk/kgtIeaqDJ+XatGLU2Tc6mpy6XUXk7n/ksouzXz7TZ6fdycUu
	bRUGaiDbIiWNWLRJIit9T/a66HJgcWUMOMGZybp2ZVLzCtnbORFgHWkQf2klhfD4
	z4OiUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jh0yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 12:45:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso149477885a.0
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 05:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460349; x=1752065149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aPyaghMl71l2+WzfUFrAleiaGBW4YqofoCOldr6ncM=;
        b=Dw/eNVJQlhBK5qoIKMuCEYh5T2cRiuDixxOKungzY/70/dL40rULM+RBJSgTWeF8VW
         6IzlD+CW53ln8GnotWY7NibWwzLKTqWShr8ToLHm1v7Q5EAEkvNmr9FoxXZKNSmGYDUr
         6oh8k7fcUdGUMQ9YMwNdVG4j4oy37Js8N6Oe+OE2gDaY65zBxv6bys2z6bcz7EFh3Fbe
         l5dBeT9m189hb9zeW09K/C8hOntqV4rVpUwArzrST5XUT0q0gqd0zXXhLfYQxCMBqKq9
         chkApYYv/kU+IPpVBKnC/3u03gWZErd8y188dp6KolUvKN04OGJ0GLAjBT19QSUjMAVq
         QC9w==
X-Gm-Message-State: AOJu0Ywe6MCN97DyGpanp5P5bY83sihaMnLTFh2VigLRyQNC1QnaKgLI
	Tm91VPEB0KW0GwQHFCl3hlfguUG35frFw0NmQu2cXL/A7+3pApwIhD4lsr9G58NWe6JQ8nb4fMy
	NsuTQIJs/Kp7JutJ5s4d6ZDZv4YBbuxsLv2r4gdEryxSe23ousjJ/a2OTrYB4AhjZ8A==
X-Gm-Gg: ASbGncuOy9ylELACtoEE0hzo9TuxM5YFP6t5KZExeBiUAghMeqgMLumiOSZXOsh/ldU
	hDrBoHqPCxJEttH+TYGCSJAP+KNc0fQHQTORvt61dYkWFQHK7TNARhnC2G3Y1JSvw9ov3+Dz8Ee
	x3Ha07RjpkcGsJeMeqqMFeIVkX8gVYlD4gutrKd/o5cL3cKk9d8bL356ukwVnjBqwna3px9bI1i
	bbpfBNpT7vgzgG4+DTjeydOjZk19LCyoxF8m2ttDCDW9gGP0jrDQAPhR9HWMrV3Q8hNm9Ua6gzg
	vgWKug5qJSDg/hJeWnuUnqxghqTyJm5vDHPXiWjzaS8cKTJuGhTdIT2wSntavecO0N2k8jC6Isl
	L32Q=
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr162613585a.3.1751460349403;
        Wed, 02 Jul 2025 05:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGenMXUQ0DABCm6z4G1Os0/aj+Iw9lPISHCubjt8QuuBByfXmzEI7utX9xCWSS65elyzu6UuA==
X-Received: by 2002:a05:620a:3954:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d5c471292emr162611685a.3.1751460348937;
        Wed, 02 Jul 2025 05:45:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bfafsm1081492366b.130.2025.07.02.05.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:45:48 -0700 (PDT)
Message-ID: <13046a5b-f66e-42f6-90e3-17f7adb709b4@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 14:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: iris: register and configure non-pixel node
 as platform device
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686529fe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Fpb8j_qVfG1HvjMpLOEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CxDkeaGQ6utmEElR0iOiorjtZD69h-02
X-Proofpoint-GUID: CxDkeaGQ6utmEElR0iOiorjtZD69h-02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEwNCBTYWx0ZWRfX+xieyl/g+XHW
 XH5pjf3ckMLDlu4BdduLjJJQanEDuf/uSOv0mqXizexj/lcnrTcfh8STPe0N/lSOUC5U7keYbv+
 Cgx/GgKFDkT3CumUUh8eRVscM8/gxxda+p3d+pPpqhs7PKb0lru2Ag9kqjx7ieyfhTnsfA1QoD3
 xVRMaMjjRE/WJhc9dvPUg+BTHo3v9gDkShJtYfjgn2oJK2ANgqxwuml0fQt4up/NUkJL8SisPEC
 c556b5cODQZrzMJ8CJxohxcrq7xYADzRSepbO6L3Ycdn57t6ilyzp3O/bpTVveObXAZAFDe6B0p
 80NQOOgUaLHBMbF6Hyf1dNak4qpRLN5iGzwovEBsP3ZFEAuZc/Y4lXdsSLK3Uyp99lokTSwLBIT
 XnTRdwW8dhLGaLmFMUEi3Utei7BLIKbxC5K7I2u3qeRI08MvFv4+HSrBgInyM1ApUI3hbyq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020104

On 6/27/25 5:48 PM, Vikash Garodia wrote:
> Register "non_pixel" child node as a platform device, and configure its
> DMA via of_dma_configure(). This ensures proper IOMMU attachment and DMA
> setup for the "non_pixel" device.
> All non pixel memory, i.e bitstream buffers, HFI queues and internal
> buffers related to bitstream processing, would be managed by non_pixel
> device.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

[...]

> +	memset(&info, 0, sizeof(info));
> +	info.fwnode = &np_node->fwnode;
> +	info.parent = core->dev;
> +	info.name = np_node->name;
> +	info.dma_mask = DMA_BIT_MASK(32);

I'm not 1000% sure, but I fear that with the current description:

iris_resv: reservation-iris {
	iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
	                  <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
};

this only works by luck, and once we introduce a platform that needs >32b
address space access, a change here will break the existing platforms, as
the higher parts are not forbidden.

We can work around it like the Tegra folks by filling out the upper size
dword, but I think it only further makes the iommu-addresses binding look
silly..

I'll submit a patch to (in my view) improve it soon

Konrad


