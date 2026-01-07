Return-Path: <linux-media+bounces-50100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB7ACFC200
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 06:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C007302BAB8
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 05:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C82C26D4DD;
	Wed,  7 Jan 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVSQ6MxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDm3kqhH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B223EA87
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765340; cv=none; b=rwgY2BBW2nV75z/8U74AWAWSN4tj5ANV+4gmIvzkBkA62xLeH4PygasdUVG6x0nTX9ZkgnrdqnQMHcBEz9WmRQgw/EvxuSRwVjNBLzrwCP/NowJ+ZmlSOYsrey51cHA7p0qodAF/BHwWV7hkSvtjLETQjmdamknVPpyLGVgXjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765340; c=relaxed/simple;
	bh=ajQwZ/LzxLqpctIDxzAewFSle0iQFzYAz8P0hw0+13M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5TKeW/8FZkzZemDYav+gm5sUY7m7Pe0kG4Pihc8eBiaLqzqVWsBBHJgYPwG1VgDnnMdq/I6mJMGl5lYCMXmK66HAR69Q5fdNEyWp7REGRWPbWt5gYphXMBB5db4bIUnQdIkXs/8fzADbcRBQFw8QnFS7/wX1ZSbicyzp4wAdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVSQ6MxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDm3kqhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074gTwE1462988
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 05:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=; b=MVSQ6MxO6sZovrEx
	oc5LIrGX1/59PN9ymXw3IICyQcNFaXRrSgYZv8H0ie3Y8JqY+WScbckHthUxWHXh
	BPKwNJlexiztd+uQmFtYk7PrQJs3KYzkzaGBxb2JzcYD6itW/wYhjkvWqFi5sROZ
	gK0bTpV8EKmoPCvlSmu2N4vfFY0EwvRxBNqD459n8OFA9KReDSAmq6Piu2bxv4yb
	wE+Y6AYX3lHCG75z5bEaSsw+iADJH7obtRgf/VrBxqa6M7ZDyOaXJ+d5BdlP8l0D
	Pus3kRVw6Xm37UlFcPGYFE6vOAdOVly8T5cM/ttsvizwKXcmhHiHCBhibjMH0LTD
	BDGtpg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm32da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 05:55:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a25a341ebso41890016d6.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 21:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765336; x=1768370136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=;
        b=CDm3kqhHhJugEWKuJCCISecNd+JjXxXJNDpK6zAVEn7JNkIN+aZt5spvY+9o1mnKVb
         fG4AiYKIR/C/UC9x96QvgsHbUIeS+yK8f10MqKBXI/k1B3gwlc249HsNCPBoIBidyzTO
         f3gP0qDgiTE+docMOrTJLsCflNEFhr7+sTGqylQYcOPLrkpa3IXnmyWlo8ivec/POrzy
         iaIKS2ZOhliEID91W+okf1xsN+NKISQjEGVGRhFwQt7yvFm9KPjPOiRE9SeELHgy9brr
         KeAN6ODKGLbTJl60gPj9DprSbSn0ilGSbjBBHA+xrFz4a3AB8/wMe1QOAKbTYpDl++Ny
         P+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765336; x=1768370136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er1TnH0vnBAkpPLGNXZ6F8aqsczeGg4g5uAkB5IxfcI=;
        b=gOEd1g15mrgu8oM6slqbyS5idHKeUsM7ZgSXuN1CQlx//f2WtxzySPiqJk4t8StANY
         fKYqpsG+rsm8e/SEYmFoR/uTqO6H/RysYUUB2W4xHjfNhPHdt3jUnNm7cy4PGO4oGx+M
         tLqyHzW+bY/tp9uv6Gd30C5yO0SRZOQHj6js8jkNaaKBNOdPFZCxlaYjfKjqEcM5mepQ
         IVObaaPHu+BywGILwmofM0/76SVaiFGaEITuuZdPTFA0wTr1bTBEs2jqLtL9KfBhL+I4
         OcSBrLMU1znEEJPpW+eyziIlbSFLpYdLJlfDFA3hdBnfWeYjr1oDpyIiE3eAuTOiDP1F
         kPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9PGZDfpiIFjugk59wwh4qJMq+POjdIRYsKkqWRGHmMaYvnk0KHkgz9tUbnJ4XN9A3SZAZylHHDMYNnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdxl2fi3FLuqBqGXn7RvxKc+eaE22TQ2zMYRYO+L4VKMXtckm+
	ZR+6NR7w4rGeh1QV/RMhUCbJbTN0IP7MqyQPLVfclzQbxMRUU1CZJYi2MhpniGj4iLuM7znHmw0
	l36UM+zv6+6rZoN3MiHFUWjWkbZnPIksLL2ox/9LKTkSTi0F45RTDZjbZpxr/L2ye0Q==
X-Gm-Gg: AY/fxX65h7Vh2un5aKxi1nKHbIxjomkKOMEFEy7GGRhYZCo+pFT8DtWe5rU/c5Iok4+
	/m9ujuOD89ehfowyw2G7bACn1cLt5agjbV9aFzdrnv1toJYO4DLv67d4COy9GJAnyO63TllTm+S
	Ct2E5XguRAtIm8tgWaB+Au84AsAfaLJpRkwAnLhbo4IoJrPqnq/8CPbpd812RgVemm6KglQ8h+4
	f7sE1dqvaeAdHtPAM+KXiqdJpHKDznxJYiBQvn3bDhAj+Xcv2Eb3049362W1mO+v3LU+D42FBay
	TiAIjDtDhcwPxrcAqQIP7q0TeO4vpEynr3iu2oKimJPL6f2yyKnUjFM2b4OgW/pXsM9t7saiLpe
	2VZosRRxGYJc0CQuv/tTN/NY9ChP2EfwzyAy/I6L8SiUcKXMKIJyAh6RNAWzipAOTS0KfdClm
X-Received: by 2002:a05:6214:3109:b0:880:5851:3c49 with SMTP id 6a1803df08f44-890840e46afmr18081926d6.0.1767765335829;
        Tue, 06 Jan 2026 21:55:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGId3S6qgfVCmVX9I4t7HNwXWrG8zNNbcqsDGTUcKogjqRiedSS4NBeYruM6dqNkd9MGNhRbQ==
X-Received: by 2002:a05:6214:3109:b0:880:5851:3c49 with SMTP id 6a1803df08f44-890840e46afmr18081696d6.0.1767765335437;
        Tue, 06 Jan 2026 21:55:35 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e91d8sm27388856d6.22.2026.01.06.21.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:55:34 -0800 (PST)
Message-ID: <3a8e8327-1a55-4822-885a-86fec029952d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:55:27 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
 <f09670ed-1aba-4622-94b2-85ade831f7fa@oss.qualcomm.com>
 <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e91414c6-fc89-4b38-a5be-f282c8601b5f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695df559 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqtGTYOm0bbIGPRGAl4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: qUcIP4qW-WhSnZmKNWuS14CEFO51pmFg
X-Proofpoint-ORIG-GUID: qUcIP4qW-WhSnZmKNWuS14CEFO51pmFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NiBTYWx0ZWRfX7ovugBS1rZ6y
 Xhf1bYmEIOHGUqjf3BlfP+OfPf2ylKrhYmqiE8cU4/HE13gG2OSPC1d0T8BLcBOy6P5+rKl+Y4W
 kXWaXkl+uxNeMh1w9y/dQf0GIuPKdI3htRLCPdBNZXx0v3f7PToDix/CmmZ9bCUiwba8m3HDNid
 7IzsguTeGMTGHENaEkOa4ogf9qfv39WVOtcDqLynaJtn3uBZchVBUIL7Dp0aeY6MIL1EUIvwNUL
 qV/Nq/KCmOHb7CZ5wQHrcUJIOt5y3EzSPuZy5EIXTMQkpo9GVYQYqLbsE0qBEB7fuvcQpM63ocs
 KruevI8zHAiO6j0wx/psIKSffoJOz3Ji3P2QkS0A57YDqnWus4qSuKEGUxpRWr8JFuslqUuHHpt
 djciZMct2SFRSjPfRdCtu77UWthCGhs09ChiNaL8Nb7ej0xLXOuJHjXxJXw0grm5i4DwaItBjQk
 hz4WHnbwzzF5R2m2J7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070046



On 1/7/2026 1:16 PM, Vladimir Zapolskiy wrote:
> On 1/7/26 05:05, Wenmeng Liu wrote:
>> On 1/7/2026 2:23 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>>
>>>> The Talos EVK board does not include a camera sensor
>>>> by default, this overlay reflects the possibility of
>>>> attaching an optional camera sensor.
>>>> For this reason, the camera sensor configuration is
>>>> placed in talos-evk-camera.dtso, rather than
>>>> modifying the base talos-evk.dts.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>>>    arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 +++++++++++++ 
>>>> +++++++++++++
>>>
>>> Is it possible to attach other sensors? If so, overlay name should
>>> depicit which sensors are attached (compare this to the RBn boards where
>>> specifying "vision kit" defines all sensors attached to the device).
>>
>> Okay, we previously had a discussion on this. I will rename the file to
>> talos-evk-camera-imx577.dtso.
>>
> 
> Other camera or display .dtso names commonly repeat the name given by
> the vendor, and the bare minimum is to name it the commit message or in
> the code. Is it Arducam 12.3MP IMX577 Mini Camera Module or something else?
> 

I believe that modifications for the sensor do not need to include 
Arducam descriptions, because this DTS is intended to support this 
sensor module. Even if it is replaced with another vendor`s IMX577 
sensor, it should still work.

Thanks,
Wenmeng

