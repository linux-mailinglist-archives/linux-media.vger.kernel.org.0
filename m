Return-Path: <linux-media+bounces-48942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F4CC5A1B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 01:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86CD33032112
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 00:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1507A1514DC;
	Wed, 17 Dec 2025 00:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noBkLGR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYzT7QSR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27D4AEE2
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 00:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765932422; cv=none; b=K/NyzqCvKWcrM6OHPgb4gIfPN3CdRbxME4EVxdKgOayrPSRn00OCCTLjQEBRAvQIDdj1fPz5UzPX/8TJcR/pUoCOQM218Ga1b0E2O1NEG6gSVMc4HSZnBYu0cfP7MZt6ak/GP54VulvaetPj/bPUDl2yTlwjN/u9acZyqEPHi00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765932422; c=relaxed/simple;
	bh=5J4gyqhV2My7MVm1wdQhSTwr+phdyC9A9qn7hRhMtjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S45Ui/0VLeU6tStKRz+IHiK1uqCroBxC38MQPxwlaT5K1n7SpGUQ2bFf/a8GdJJzxyWPt7OoQjFtaA82gWITy0azHpRtu9ghLBRG5Zfbj/i1WvTywV0nNk++o6M4JVUKeNf/6jUfXVgu7T4sJTLevD3l84Ik60FttZVyOwtcVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noBkLGR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYzT7QSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGMRD5s890233
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 00:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABGO0glvSk81rF9N4L+QFPAcCYxm7cEbnSgkqSBF2Tc=; b=noBkLGR6VRlb+sLD
	Wv1pOntQBTlfCA1EQiJtW2dKVElonF+TeGtB3G0WBLq/cW48wsYsjFSehK6k6fHQ
	pUaHnqIkMIPoM7XyEMvdmDdciK65vxCYloXeqfdepfPcCoFA2aKVm5frwwWIgayB
	W1o1guMFVRD46hfCYMgxQCcRxjk0VhY2XGOBuMCSpaDpfDrhgj+kiIcdeBhNig9z
	zLrQ9TERcio/Us/EDa8V02a1cRux806+Xb9PhXJZXIKxwgh0Ip3pk0liJcFGmA9v
	2ijJrA9c+a+tcJDni3XDc1I752ghG8HYChuiHmOhTfO7JjK2h7+k342Y913ZFAGY
	8Z7x2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b34xd2x3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 00:46:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a07fa318fdso79667945ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 16:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765932419; x=1766537219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABGO0glvSk81rF9N4L+QFPAcCYxm7cEbnSgkqSBF2Tc=;
        b=UYzT7QSRHKXllySj56TyHRRSxi60/P7bZHSvlEJVFz0O9APk0plcYgOx28m/tXhBCS
         mQEFsgZY82RPKNlNyKYGbImkmBdMYcUCiZyQgadEFRJ6SlvspeklREs3VMbwqaqIld7P
         D7eCNwGJKevvf0aQz/mtectHXoZMFnYjX0enwBAa+FUh9QUIHLBeCcVTrckkgqEatje+
         ayt+auVPTpC/7wfRfx4T6qexhUU9I0ycBkb64k/W0jJ4TITQzD7kuS/armqzL9ZBgfLp
         mVzfjtr0IMBDNlWz4/49jZQl4BH78xZIKZ7+CFdn2HGe4a1rm8Jtg1VRv4B+kO85S695
         ohdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765932419; x=1766537219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABGO0glvSk81rF9N4L+QFPAcCYxm7cEbnSgkqSBF2Tc=;
        b=qdBeLVO6ObtRNxMOtt223R96Yq/yM0+go//EuAkKuURON5sc7jCuIBq8DJ0AeIPMrw
         bvCXuvm0UGVho6A/FJEbP+fjlezKm33NYondN4EHVndhRe39jCZMamw9pm01zX1EGU1u
         ctayhVTt8DrSaa2yiUvysjdF/tacKSrDzH3zemJPPYaMuL0YEvpldfT4AeSQdAhR/c2+
         SIX7APxo+G8MtthY/9j0FLcBRdYCrhk0IM9BmvGBlBxFfeO0LoRwP6fABYYChmncc3pX
         Os24fyu7Vscvr8YC+TPShsNc3qPvhhSOBFgjntACsNxIMtM8hfQR4vcd+E5vlrxmmEYa
         3a3w==
X-Forwarded-Encrypted: i=1; AJvYcCWSP4LEUoBGWZdsb39G5v3Lx9ac5ulD0U8VIpVMnQdfiJnajWUFOYTgbjh9XDvuguCXOKmmUS5ixiLH+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuMKKvDjV/MchGml+NltW/gR1GCW1u97JgFv6TiaP3Txru904
	Qp+rmnz7F7le/S0QMrf0QN/5GdvgFPtmdCEAZDzEE/ge5LU10gz7qgOSLH3cPjOWUK1PtJc1YVX
	IlAOWUW9gqwzDDO/8xuHXM3Kmx5FfnmPltdKlP1E40avU+5x8tFQr01PGf4kX6/1X2w==
X-Gm-Gg: AY/fxX5MpG7mZ0n86l7xxjPKs0gSpv2fTO/JPeKPXGs0A7bTXfElS/bG3yju7SEkNht
	quo0xGFOBR56hocGBdkYWZAbAW+V6DFxQlqjdPXEuFZ+zo9evuqiQYNkaRgGdF8J9nFkRJ6qG+A
	FrioPdjq+dm8I8XCp6sNaBZgJPasnXqajFy4BbUwtvmOVKKF7iFVJhxWJtUEtHmcuKIgQ/wa9k1
	sCElKabsw8+BWXYqHwhN4SR+tHr0vnJScE21Fs3m1xAv/Owmzm8wWtclO4XIg9QCG3apcVLEVL+
	CSr9CC0E8Hzazd1UblWSFHWWQxLq9omitTmTAe8iArEQghA0es4cCGWrYwC2vXgjbRVz1P114+G
	+HKUw8LZ5Wpb8VhcXV03uw3pbp8OREK4dSYzO9tlSbKc/P2DqrVyrfq8UZN2S+suvDg==
X-Received: by 2002:a05:7022:2510:b0:11b:ca88:c503 with SMTP id a92af1059eb24-11f35475f75mr11189118c88.3.1765932419073;
        Tue, 16 Dec 2025 16:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdQJYLv1rlO32DqezKCRMWdqxzG0EMEEP7PeSlEZx9zUrkl4hD2bmCAg8uCKZEAV83nujjbA==
X-Received: by 2002:a05:7022:2510:b0:11b:ca88:c503 with SMTP id a92af1059eb24-11f35475f75mr11189098c88.3.1765932418436;
        Tue, 16 Dec 2025 16:46:58 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm59877271c88.11.2025.12.16.16.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:46:58 -0800 (PST)
Message-ID: <c2125dbf-bbef-426e-adf9-7767ad822ae1@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:46:56 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
 <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
 <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAwMyBTYWx0ZWRfX5h2SXyjsSlFR
 XsJ3cVzej2oBYDPqpDQoXT91Ump/pcRq5dxmf9EGqZQE95EUA04w5gR4KvJDVHBepUo0xbJLMAC
 qeuwF8ba1gsVWlMyuh0+BQYxJkCAbxm1/T74i9A2lhw07YAoU4/xol3YZXWovTNZzCiZ0YaUQN3
 FhR2D99dBxgqPBH1uZ0uvcj/ffeMCF2aFvO023VfPTZsgc6Z0YYzkV078MZwkgmYzfQKsnTBeqU
 xUwR0jkV4JTppg/ipKzrYdb4ZkAOdUXpKhsB+V0QtwidzIMuH5G72yzQipTYtp9p880mmAJk0IG
 /n/lOZS8LkY0uxRUngNDNVuqwNq9/gAODcKZtsX70RhmOIZY2qqFdS7/wt+bz1FXf56FgVNX7ND
 sIBGfe8Q+IyemdygVRlAc+lpsEEDyw==
X-Proofpoint-GUID: _mSXFJVSDZNdzdiVAjZmlwU2oBX7EGKD
X-Proofpoint-ORIG-GUID: _mSXFJVSDZNdzdiVAjZmlwU2oBX7EGKD
X-Authority-Analysis: v=2.4 cv=T7mBjvKQ c=1 sm=1 tr=0 ts=6941fd83 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yeKN4i86vKkShX6YYCoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170003


On 12/16/2025 4:02 PM, Vladimir Zapolskiy wrote:
> Hi Vijay.
>
> On 12/16/25 19:55, Vijay Kumar Tumati wrote:
>>
>> On 12/12/2025 4:49 AM, Vladimir Zapolskiy wrote:
>>> On 11/18/25 20:44, Konrad Dybcio wrote:
>>>> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>>>>>
>>>>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>>>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>>>>>
>>>>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of
>>>>>> the registers in the ICP block. Should start at +0xd000 not 
>>>>>> +0xe000 ?
>>>>>>
>>>>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>>>>>
>>>>>> Same here.
>>>>> Hi Bryan, HLOS does not have access to those registers. They are
>>>>> configured by the Hyp.
>>>>
>>>> If that's hyp, please add them. We already have platforms without
>>>> Gunyah. Remember, bindings are defined once and for good and I 
>>>> wouldn't
>>>> call it impossible that someone would want to run that 
>>>> configuration on
>>>> Kaanapali some day
>>>>
>>>
>>> If the ICP register block is added now, then it will practically 
>>> exclude
>>> an option to run hardware demosaic on Kaanapali. There were notorious
>>> and still unresolved problems with CSIPHY blocks, which shall be split
>>> from CSID/VFE CAMSS on device tree level also, for similar reasons the
>>> same should be done with ICP or other blocks. It makes exactly zero
>>> sense to pile everything into a monolythic device tree node, and doing
>>> so undermines any future advances in CAMSS support in the upstream
>>> Linux, the hardware description in downstream is done thoughtfully
>>> better,
>>> and not for no reason.
>>>
>> Hi Vladimir, yes, this has been discussed in the past and the general
>> consensus from everyone is for not blocking KNP series on this. But yes,
>> there is an ongoing effort to modularize the bindings for future
>> chipsets and when it's ready, we can review, discuss and take it
>
> My concern is that it makes very little sense to throw any not clearly
> defined hardware properties and interconnections into an unorganized and
> unmanageable pile of everything, because this closes the door to ever 
> update
> the upstream CAMSS driver by adding better CAMSS IP support for any 
> already
> manufactured and sold Qualcomm SoC powered board with done CAMSS support.
>
> If some user already holds a phone, a laptop and expects to offload 
> CPU to
> CAMSS IP one happy day, it's pretty unsatisfactory to say that it will 
> never
> happen on legacy hardware, because there was done an unrecoverable 
> mistake
> by adding never tested properties into CAMSS DT bindings, and the 
> remained
> option is to "wait for future chipsets". Each added unsupported and 
> unused
> property boards up the window of better CAMSS support on manufactured 
> boards.
>
> I don't understand a reason why to do worse for the upstream, when 
> there is
> a clear and feasible alternative not to do worse, thus my 
> misunderstanding
> and my grief for upstream CAMSS are my concerns.
>
Thanks for the comments, Vladimir. Bryan's and Krzysztof's argument was 
that the bindings are required to describe the full hardware regardless 
of the driver support and either way not modifiable in the future, so 
they preferred having the HW properties of the key functional blocks in 
the bindings. And we were specifically asked to add the properties into 
this node in this patch series. Having said that, my knowledge on how 
the bindings are handled upstream in the long run as the requirements 
evolve, is limited. So I will look for some expert advise from Bryan 
here as he strongly advised for these. Thanks again.
>> forward. As for your ICP concern, if you are referring to the Demosaic
>> in OFE, I believe we might still be able to do it either with direct OFE
>> config from CPU or using the firmware (preferred), given that we
>> properly establish the shared memory and SID IOVA ranges for ICP,
>> assuming that the load and authenticate will be taken care by Hyp or TZ.
>> Please share your thoughts if I missed something.
>>
>> Hi Bryan, please feel free to add your thoughts.
>>
>

