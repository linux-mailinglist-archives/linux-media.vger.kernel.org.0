Return-Path: <linux-media+bounces-50632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A1D1BF34
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 02:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEDBC302E151
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 01:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199762E8B8A;
	Wed, 14 Jan 2026 01:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiA2R61a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ya1IrjUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2DE2BEFFE
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354525; cv=none; b=BCk3HAaa6rZVXxii7o4cT4B/w9+c1gwkj3p6PamRDyfHNApuNHES7fmhQmi/QVTI+aZg4PlHheM8ibHOklcBOt025SwlFGbFgh/dRAPTTbi1Puwg7d9Wfa7PYBZZXXnPEdt3d09qwmt0dRZ5WIiGOWzBts2jFo4DJDW6di7dYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354525; c=relaxed/simple;
	bh=UBZ0xQQc9x8hovtqO2IzmbFI/0v4QnsYfchssHdggm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4fXCqJ8YenYX8W1Vj5SqwLWFP1oNivViFOxmCCNaUZXe4Jpp8aNGfpwAxIj9jD3jBZWS0oth1DyTXTCs1oX2ivjwBLEymeRmPPU7qv7HYuttOSY7c51nh2QSZikReTGf5FVr/S0wdD0RM52r9mo0Xs5zHBANhCUfbkjI0Ta7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiA2R61a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ya1IrjUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNIBSj1961464
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=; b=ZiA2R61aKbKsjkg7
	Td8zVE0CnaONJv/7WcJYbYZq3z4DJ7cH/G3jjWGjPuPJw0eYqg7wU/DRdgT4tQqj
	gRhMepTlYfvIMg3ZSLkbwTEg8WDPbNjyRSZb2QrDJzJ2XP/chbJ27mKcJNrG7hyF
	jN1s3kKZrgDlvKxtoyCjWBc64T3KFzY0C6pP9iHqQT3i14n2YaWCQuRGxgT40HlM
	OwS4VBAWR5jUUS8BEAnffexffy7GmYoPS6/5BzJDDFUZZwk3xZ0OwAhibNQgne0f
	Ehz5Bl8c6z175gJU4LUbCh0vBEqesJKTy/bcLbw2e1EbQ6MomP1mYvF5vTnogvPU
	WC0FAg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89gbma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:35:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0dabc192eso79344955ad.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768354520; x=1768959320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=;
        b=Ya1IrjUtRwRgqnmkoHXH/97iCaA9lrBJLTi4KAWIqmc0inWajrj9j72NcTvq6rmvpK
         8qejhs362O14suT+RSsJJOWKKt51DuFeJCjo8oTj7VNt6djHel0pf9bBAtS2Nuq3agXA
         ImvMLIVQee/MFciclHKFVariq/upMdenhVyTdwd4Hfb4KeGj1Kfye1aAETWniTk0i3QH
         RGg/Zisd7+eeplLOi5eqUgcIJYOYmzmnNw2W8hI3mUKxObop8u73GwPnctmwQ/jSJ9ZX
         KkT12ZdE424GzSPzNKxNiNt0LCwJS56d/SfPUcLtEYKO/xHkiXqrdZRjIhFT80eqVzjD
         tyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768354520; x=1768959320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=;
        b=uGjZaQQWLUAuS/cRStnZhBuOVNSmzY7n3VLl0OUaTjWj1S00JzHOlreHucmVpOglHH
         T3gh9GY3V2bCRC7RXGXBtWGtFvBidHvOM7i9eQDDwezeOZNxXjvxLb1Gux9t+8bD75A5
         +dY85U/EAVYhTLfvUjHAC7Ka6V+hwmg1p00Qx505VD9+QbfvPzepEr4lFplGHYT1VlLU
         YtpZQRqEpOYpL0FNVXx6ia5583gkpx1svP2pT5TeIT5TSYOFiRrpq4dwl0m+aoVGJldb
         mfLU2U5IGQaf131RSo0UMHgF0GsiHf6Wfhq0iW2i4e9kt+CiG8XoL8b6TFqDpiiBNdIV
         X9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMChP8+xWF9J7TfjYR+5B7QQpAWulcs2cOupZu8/V1lJUqZUoztDBxF3vQDJvY5BBPwAbNOgdUQOsxlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKxngKsOGOkye21Xs4Zr69gA9asMc99rjHK0C63bS0rjPgn5WG
	LLqryD8JY+t3iIEMtlf7sHonPKZSxDPViziRwRBv1sGwSKdH8Vab4vuArW0utuUQMy85ywa4S15
	S9QrfCTcyCI0M+RwOHStkNSeTNA+tdXHgLHnWoa8op4qPDukpGnrihzSVLMNd2jfD3Q==
X-Gm-Gg: AY/fxX4vdbvONEW+748Z0BsAKzpgyA96MuTBPCZcFR7zHXvfFXzv9VZCxjbrqa2jd2l
	Wa8ayrSRtG/DfiaSNp+05iYgPgxHxywJPx8u9q3Vws8JDvIOdDUX+Osqu0Y9+0hdYZk+fLnZHHc
	RaORuUXHVg5J6mEU7AWhL9aCSB6TuJDK2tY78wrMVwp50KDal/I4kvOkLnsFJvuhf+8laWc4cMo
	SrFD5CBHvxqxBIKY0hgQ1Q2KG26RwbFqKH8setrt9EPSH5nz/ICttuSiAASKxmKao3rt/zCN84d
	slMdA5SCsSiBkAkGeUr1Yf3nvkpprLdm+wxfmMFM34depZ01WItaHC1p0ut92kTXdHbm1lVBiAB
	z3up17XPMReK1fZl+FR+zp/XrVOFkCEHw/0HKu+bk7X9XnZkf+F1LAk/ADPdC+TLUgKo5FATy3/
	Fmm+Q7xg==
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a599e23086mr9724655ad.28.1768354520259;
        Tue, 13 Jan 2026 17:35:20 -0800 (PST)
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a599e23086mr9724405ad.28.1768354519752;
        Tue, 13 Jan 2026 17:35:19 -0800 (PST)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm210077615ad.0.2026.01.13.17.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 17:35:19 -0800 (PST)
Message-ID: <b3cf9b7c-b692-4a17-8e22-6df356db8834@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:35:12 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
 <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwOCBTYWx0ZWRfX99MJlBEe6GB7
 AUVKs6TiSLK+m2JoA9mo81JLrHvCdbzaL7Jgodppjv63b1kS0JJzAJbIt4/tu1G10FevDp8oT5N
 r7Uk3HEtme2RvkUX87bBHG+mnJNBIxBNp3uVDK7pGcH8yjeNhUXayzEvtaJUy9B07lKzRC5wfYh
 lRlqm8luYFxp5Z4ZRMgT8pjJMuE0S0ctlLE1e4Ws8Pg2q7dvwV3ZCI9AdABqLIDiRnYM+pDAjJ+
 JJwFGGSeRKnrKA2K1PztyPzIexD9Coge8P/KalDtHQXfbn02qCqiANvP4nORG0Pjj1+1qc36N+u
 XkqDQck7T71qHqJR8rl/hP3b14uhsiEpBX446NAba3Fu/E8NDEG2UMotIaq82kUuDgtpEw5NtzN
 OmzzDoRsvHFqytqZce5fI3UGH6v9jMBQdZ8cVfLHFfdny9uaVXzIfDYKHoixhhR5SoDAzzuqPEz
 r33TdMgVurGdfXA0Gpg==
X-Proofpoint-ORIG-GUID: XGvBYu2GUr0nroez1SqLCyq-35lyhQ8l
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=6966f2d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3IMT_TZWw9feNxxRiIEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: XGvBYu2GUr0nroez1SqLCyq-35lyhQ8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140008

On 1/14/2026 4:53 AM, Vijay Kumar Tumati wrote:
> 
> On 1/13/2026 2:28 AM, Hangxiang Ma wrote:
>> Add support for SM8750 in the camss driver. Add high level resource
>> information along with the bus bandwidth votes. Module level detailed
>> resource information will be enumerated in the following patches of the
>> series.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Hi Hangxiang, I believe some reviewed-by tags are missing for these 
> patches. Can you please double check?
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 36ff645d9c1e..56f20daeca3e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4066,6 +4066,20 @@ static const struct resources_icc 
>> icc_res_sa8775p[] = {
>>       },
>>   };
>> +static const struct resources_icc icc_res_sm8750[] = {
>> +    {
>> +        .name = "cam_ahb",
>> +        .icc_bw_tbl.avg = 150000,
>> +        .icc_bw_tbl.peak = 300000,
>> +    },
>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>> +    {
>> +        .name = "cam_hf_mnoc",
>> +        .icc_bw_tbl.avg = 471860,
>> +        .icc_bw_tbl.peak = 925857,
>> +    },
>> +};
>> +
>>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>>       /* CSIPHY0 */
>>       {
>> @@ -5487,6 +5501,13 @@ static const struct camss_resources 
>> sm8650_resources = {
>>       .vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>>   };
>> +static const struct camss_resources sm8750_resources = {
>> +    .version = CAMSS_8750,
>> +    .pd_name = "top",
>> +    .icc_res = icc_res_sm8750,
>> +    .icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>> +};
>> +
>>   static const struct camss_resources x1e80100_resources = {
>>       .version = CAMSS_X1E80100,
>>       .pd_name = "top",
>> @@ -5518,6 +5539,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { }
>>   };
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/ 
>> media/platform/qcom/camss/camss.h
>> index 616ed7bbb732..2a53524dec93 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -91,6 +91,7 @@ enum camss_version {
>>       CAMSS_845,
>>       CAMSS_8550,
>>       CAMSS_8650,
>> +    CAMSS_8750,
>>       CAMSS_8775P,
>>       CAMSS_KAANAPALI,
>>       CAMSS_X1E80100,
> 
> Thanks,
> 
> Vijay.
> 
Hi Vijay, the B4 tool didn’t retrieve any ‘Review-by’ tags before I 
submitted this revision. Since I wasn’t sure if they were valid, I 
didn’t handle that by adding tags manually.

Hi Bryan, is it possible for me to add the 'Review-by' tags manually if 
B4 doesn't pick them up automatically? Your feedback would be helpful so 
I can manage this situation better in the future.

Best Regards,
Hangxiang

