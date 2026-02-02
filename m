Return-Path: <linux-media+bounces-51971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iISiD/trgGkd8AIAu9opvQ
	(envelope-from <linux-media+bounces-51971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:18:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB443CA087
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD53C301B919
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6084725FA29;
	Mon,  2 Feb 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVVGfdde";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibCanO0n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2D21FF48
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023870; cv=none; b=ZXnBHlZ56V9SkNfRNABXb0GW45fq4LIPnOGxpXUtlpZ9/Nqwvc3Mu92kUiUJOv23obXVMVm1iNqbAnV7Ovm+23vhChmQh6JBh+VNmuZW+bOCL+CB7pUi9ZO4tjIME0GfV0gf3wsH2m5iYd6IDpOF3DTshx18R/NdiFGTS2p/c38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023870; c=relaxed/simple;
	bh=eP41WEfd6p3BbfZRfZupBABsh2GSa4XCnV0BD49dCys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5fsdOCtmdjhdDUNtkm2KAboOEUFq2YkZdgyvYehQI/wlnmihoBikPAgpVO4njc+z0OjgbSSnaIrP/kqMYHGanZQmX4RVDYWx/OGagkirqiTz0a1SLDgVGbUZwLmLtTIXX6RCnTeRSz9D9pI7ROlNTf7mcKJJDH2IG752Ls/3p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVVGfdde; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibCanO0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127PhNt899595
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 09:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FN+nDiTTnRse2K94MvkjiTBK0OhjP3hHxv7c8YuVmbg=; b=pVVGfddeEXlU91wq
	8UPdFmKKorwN6F852Zpo7bjChTzFC3XxLJCitUHKzL/jqhNL1y1KQSaWJzV8kVnd
	rlo/f63WtU5ADeBSgaCxYAPHKLair0cwrCTUEfoIIFpEYmY7DmBF0SccsazLfqGv
	nWpqd/Fk2TrSalPAEpCZE9uQqGdGek+2hOBuBb+6CS558jMdbKnkSEipyvWYaV7x
	phaKZMKqz6VKjkBE8wL6/EZhlf11QgiJOWbRQWH2bM7NnQCtEi1kuAjeM++pWqAm
	pnX4LgvyAD7VjkZXeR6hIN/w5djNhREBxBj7eylVmTuhATZerlNDLelTx8yIR+p/
	ucUdXQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnvv6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:17:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso3777122a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023867; x=1770628667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FN+nDiTTnRse2K94MvkjiTBK0OhjP3hHxv7c8YuVmbg=;
        b=ibCanO0ny54P5sH0CUcG+XfGSf+bMJoJX/xqN50nzmG0dqwK6/f+jTvmJFOLH0zH67
         Zfax9eeIrv3XwU1oYlrANtodHPladP3oeY66EzbfoqYhYjeIlkjCTRKKncuduYREQPfq
         zFovLD7C3banpQPcHdF0SUPTEB3vfDSgl9HPtoJvAg46SHKevGIbbs7KR0BxHV0zBAKo
         Gy9TqbP/k5rXxW0ytMiRS4b+BB+x3d/qVwRQaIxaxDOLD8SWQJo6CGWxgEKDMj4YJGAT
         aQIkdzLouYS+w+1j5LgFQ4vpbn/l1Zad2IIRYEucNbAROpSNLduU4m2McVaNe0tU+0Vg
         jx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023867; x=1770628667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN+nDiTTnRse2K94MvkjiTBK0OhjP3hHxv7c8YuVmbg=;
        b=bXSNPkOa3dXDVTZkP+JEqNik+CEVjQGmm0X4lJrLsO56QZFv6KUKtquSJyzK6APULz
         7thMSyTwFDPN354jBiK0tVh76V3AH1XZwiK8ETc3VSVKV8jLLmYiUzAHehOTXbaA7+oY
         5MmQrceOjX48EMW78U58FX6WbYoHk0nxY5oJ/F/fVCmSBae76ijYZh/Rxa2NHXViKa0z
         GPIoD3HP25VPrPhOUgpanWMVDJT4irUKpKdvJDXHx+M6HU3RbxsJwawYYgRCByQKZAth
         l9XIPWtm+sL62Y3B5sMJspWNETPUnFEMsWEHgcpIBhqTiBINnvuLLZO7ul5kjO3GnD+I
         /6+A==
X-Forwarded-Encrypted: i=1; AJvYcCVCUDz4tb4R6pSivw51oUE9RCerJn6+mdjiA8hG87iUq+DaQe2BRTlp/hYBfWN2Y5jZW35ik1FqF0TLaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSOoJagxgGLQdZyZUal+C0a0dvL3fanPTae3wq9F9jBwSg+iA
	Etd4eRwnXwYADJH3hqzmJHPtp3Bx1cjFA2YbmklESfzsNXu31PUySaFDS6+a1GTRys3IwZO8amg
	+pL0v62R4pWAqU63C4aHgQo7w36MoSipgdZPh9PV252gKpx4gx0ywauVAqTLIN7LY0w==
X-Gm-Gg: AZuq6aKORKy3sKmJc+v3j7lDi1TZM3pAF5ivA4Pzs38VL0Q2ZpwRGm/F2YCuGx4PATl
	v8nxPh/DNQZ2EI5PzuE7BvBqc+r/sB2mqMzxqEkDE7cJCNKg7gbBzWhwxrhHF3DviRj+WuqO1Km
	GvfFacuzw3+wjSpznZlCKvhRAG+7eSwanZ92EuevaIK803U8mWXSs3qz4WNtgTEWMzNXWOKJ/Rr
	8w9r2lbzU/Ftx2E8Q7T/fbxiv+NhvXlflGE4dQK0r2a3XNMGJBw4m74h67+8J6dsrWewO+9EBB1
	Kh3NHrbDoNSJkiKeFEvMxBM5Li7ELoZQu2NnojDF7NdGrfq4yBE70uFi71zgmPOnATLh/6HN9oh
	7fPun1v74sM8HGfXYxgE6lsL3CZDdfc6HmzDfkNoXRX3j
X-Received: by 2002:a17:90b:3d4d:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-3543b3d65b3mr9467866a91.34.1770023866919;
        Mon, 02 Feb 2026 01:17:46 -0800 (PST)
X-Received: by 2002:a17:90b:3d4d:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-3543b3d65b3mr9467846a91.34.1770023866424;
        Mon, 02 Feb 2026 01:17:46 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm13580108a12.27.2026.02.02.01.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:17:46 -0800 (PST)
Message-ID: <cf09b107-613e-a1fc-7a73-1211da52cae1@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:47:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <3d99e35d-1aef-5e04-55c8-628918e29da4@oss.qualcomm.com>
 <g2ft7zu7mabl63hggbyyfkhntvkmsqjvtu43r2c35ycgrghxgs@53m33fj3b2ft>
 <9831d703-8427-31af-48c7-3942108b3a55@oss.qualcomm.com>
 <sq4b4634cnn3dc7xupadlunlv2wvlfc5rlo5krdtot2yvrgc4m@cfeczijdb25o>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <sq4b4634cnn3dc7xupadlunlv2wvlfc5rlo5krdtot2yvrgc4m@cfeczijdb25o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69806bbc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=iwVFfN5eZEG7kzAG_xIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H7AB6XhydZYRhWkVJCCjP1mn8rDhnso4
X-Proofpoint-ORIG-GUID: H7AB6XhydZYRhWkVJCCjP1mn8rDhnso4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfX9tYCBJOupYs6
 IfzHF5bDNpQRXbbuidKBmUO+QK3FSAe62zEbBSGhA8bYe0ttL0MmNoRif7WHymFRUXqCwn4zY3f
 M2HlogH7egpyqL+TJDLYRKGO6ESlF8JWVLdd0peqBHvPV7OBsFWQIinxX9Pq0RkAGRh23Gp/DTc
 t+5+x6ww1Pk0UHHqUVmfQpoTR9EgehgEtb9F4Vsc00+tbfD3BhRv019Tmp+emISPo1Hacz4XPgZ
 lVxRy0aLrhl7GzBWlW3Kd5jq3BwCjtdy63aGQG0Uk3tECczVqW3o5gG/X12133kRN+XYVTnRUv5
 MQOJQ5wP5ajbXGTW2XEeeCqB4QHhxdzy/bYz+ftMOUvRmTJD+82Hnl/ygzN4xAhoGucRhi44UcF
 6GODosK/rGA2+i2u/i6WnMswimIPsHRoBztSgGrrblLA0IF5rs8kTBDnBylspW/JwaR/GvcLqBI
 riGwk85Tg7P3zW9nECQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51971-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB443CA087
X-Rspamd-Action: no action



On 2/2/2026 2:44 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 01:37:50PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 1/31/2026 1:03 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 30, 2026 at 05:59:48PM +0530, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 1/25/2026 9:02 PM, Dmitry Baryshkov wrote:
>>>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>>>
>>>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>>>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
>>>>> SC8280XP having just 2.
>>>>>
>>>>> Document Iris2 cores found on these SoCs.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>>>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>>>> [ bod: dropped dts video-encoder/video-decoder ]
>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> [db: dropped status, dropped extra LLCC interconnect]
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>>  .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
>>>>>  1 file changed, 113 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..d78bdc08d830
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
>>>>> @@ -0,0 +1,113 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm SM8350 Venus video encode and decode accelerators
>>>>
>>>> s/Venus/iris
>>>>
>>>>> +
>>>>> +maintainers:
>>>>> +  - Konrad Dybcio <konradybcio@kernel.org>
>>>>> +
>>>>> +description: |
>>>>> +  The Venus Iris2 IP is a video encode and decode accelerator present
>>>>> +  on Qualcomm platforms
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: qcom,venus-common.yaml#
>>>>
>>>> Pls remove the reference to venus-common.yaml and follow schema of
>>>> sm8550-iris.yaml
>>>
>>> Why? For example, sm8750-iris uses venus-common.yaml.
>>
>> Ack — in that case sm8750‑iris should be aligned as well.
>> Since Krzysztof’s patch [1] removes all venus-common references from
>> sm8550‑iris, all *-iris platforms should follow the same convention IMO.
> 
> He has been dropping references to venus-common.yaml mostly (IIUC)
> because of the video-firmware. With the video-firmware being moved to
> sc7180, the issue is no longer present. I will check if it makes sense
> to keep (and use) venus-common or if it makes more sense to stop using
> it.
> 

Ack, we should keep it consistent for all *-iris YAMLs.

Thanks,
Dikshita

>>
>> [1]:
>> https://lore.kernel.org/linux-media/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
> 

