Return-Path: <linux-media+bounces-34062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31490ACDEF9
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 15:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F093A7201
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 13:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA7E28EA55;
	Wed,  4 Jun 2025 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E46Kh+a0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2028FA96
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043472; cv=none; b=eybDRY0wyJqRPQCD0Dqws0All9d+B6ZlmQF5piYqv2Q3pWvjGYi8mEWVONuZ2tSEtUrW8Wjt1f2ODU2UxHGkOujIwWPxyn6Fzbie+LmY1GdUrhMHho+tQAtnF6EWm9yWyq8JoLQZAZjPLnA+ywAzD/uOuAdpuOJjFKLW+EPznmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043472; c=relaxed/simple;
	bh=iKG8NBG/TNLTXbVo9TYujPcytItCDWMbZmRywdSOHNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVLY92hUj5c03ucVJapLYQ3y40LvFpQVgKvvoCaycrXP4YEc0wRZc0nNv1lI5y6DHMCzorCAgWPAhVcEAbimL8wD/8Vu4tmT3SGZkY9OWfWLNy1pD46LKOJlAOIcXZ5m42n41bpzMt/gcbu3u7cHXJdj4nnlz4ajPHLHTO7c9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E46Kh+a0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554A0Rhx013065
	for <linux-media@vger.kernel.org>; Wed, 4 Jun 2025 13:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tDhYT9ynoVsxUKkv2VPgtETqP2fOpfi938Os934qGQ=; b=E46Kh+a0iBI+mq5x
	F9GIx+ku+J5hK5LZhXVE/j0vWkDSaFM8G0VUdsbo57L3+o8ZLmWK3mQY71qm3IZM
	GjAgC+XizzFsQdqrlCcvvM+VoAlGE3cIPdLk0yi2wlX5mMORGQ9CjOpozZ62LOPU
	I6mIRpIemXqyH9JSpYn7xsg6MESeitvAlP5guTwq/NkEYDOnyObT9H0cY7cUX84V
	4ko1gkks84Eu+SFnINepU4kEC1pdxzc3VINaXVixIMcE8ZJdPAC6tQmavMy7iG0R
	yu0/8Q/95mcoYDMN10GiNmz020Vx5SZeFdH99NhC2M+XFdwNEWfNPVGfAM6A6TUG
	vPgc3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be81v7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 13:24:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso162837085a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Jun 2025 06:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043469; x=1749648269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tDhYT9ynoVsxUKkv2VPgtETqP2fOpfi938Os934qGQ=;
        b=VMW2IDvberyVBkFzP6ejeySC0WeGCkEmjbEM1yzh9Pz6IQpl6kIewferB+BY0m4W5y
         dEgoVtg8L5G0xDKQSlW75e27Y1DYqggYEPFVKlEcr8yO9EDJ3+KHaRreaeClmXVrHyz1
         O/cxBQiHFxGNMI4FV23YGFi3gwtgUUnXb9bOv/pxz4fIrFhd0MexguqqJgguUaAGmVHr
         KPf/taFe9kUPNiLjP3X4vUzcDlEuP556Qn/t93DCG99YnAJc9alKR5YC4f4RgIhr74Vp
         F+i6ADaylzVf5HSZpIfdzqY55QPn/BR/2VvqTVLDtVfZvoGV/A9qB/sQjV0EEMHRGvAs
         AH0A==
X-Forwarded-Encrypted: i=1; AJvYcCXB+2tqzYk6nMj3WZ8sKK9lqab/MDhfZK1pyBM9kEIB0/xm4Y0Xzaz6C2n5X71/9MF4c4hEHXKTzcTQLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJrEEVBO/JLBYiuN7KG924j0hTm1YOkOin8SRIhHHRKyaLrq+
	QgeCPGxKEaf/nPOFiUq4pwJqGZTc3tozCsnOu5kZyY/1yXb7meFGRvPZZT54D+j42NejzE8eH70
	AjqcjYOHoWbCydajyyHRSfcFbNpkpSM05AcfmzPGOjg11c/ZvTpZX710OVBmdPYgGIw==
X-Gm-Gg: ASbGnct+d3cZsVwpT5KY1DlhTWTHn0u1Sr4cazLdTJEVz+jpRsqQnWpih17Bxx57wux
	WW5ljDJ8T0uQgUukAAyfJoUAYrWwNHoxdzyy9vbvI+BLGgAeY4U8AgiYsqsLCr3MLvbhu1d0HPP
	71rb+y7oA7ltG0thtNKoV9go7KMVjcGUo37A9FM2rR9JhvBtvyEjY5ZU2o3zwnK3ddEwdJGrs2g
	LGCi2m5qmLwcy5fle1MgOYyv8xjc19EMrfJn+ywxK9/UT5pr1kJpLsklmm9mGbjUyuxym4X5nc2
	tNTGd4Yunz7JAFzKOuu++VrT+cLi9btJxaPXeaWMpVQA2jrPVKphkCr896bohLmnZQ==
X-Received: by 2002:a05:620a:284f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d2198a4bcamr182103585a.8.1749043468659;
        Wed, 04 Jun 2025 06:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4FAWQb08lT7tzFsZcGvaXN1AR/3mpBEQNehhZ0tFk6Uq8YusaA5kooOfzLi9N2bN1wu3MA==
X-Received: by 2002:a05:620a:284f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d2198a4bcamr182101485a.8.1749043468299;
        Wed, 04 Jun 2025 06:24:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb390f09c8sm845637866b.45.2025.06.04.06.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:24:27 -0700 (PDT)
Message-ID: <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 15:24:25 +0200
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6840490e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ONiuQb8ssYXyuzXnhScA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y_zI8-qydlrZfEGxAnyH8SoOR2A4E0AU
X-Proofpoint-ORIG-GUID: Y_zI8-qydlrZfEGxAnyH8SoOR2A4E0AU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMiBTYWx0ZWRfX5Jc0mio4hLOp
 GYpVl+/jOL5UV9WttpV+63xBEBvX2fpG63NboiLkAzNXskVGPucxUy8xVeUfdq5Y+1yJ5CdZMHb
 FAHbgNvthgZvPieKqdiHUyP9gzlYHGlBNIT6jKprVicSkL0JfO+UHacUdlUcO/FXAQRUNJI7q8R
 r1PWfEgfG7hunAk3wh4yjjKG33a7RIkPmhTtJp4D3nRddXEeqEfoyhnq3p7hxhdaRC/WDObKyi+
 jn4abnANen/mQaplyD/5+Ue+B6MQyA/YQd9hzcCbGxSqUUejYGgBRlqvvMRj8wopco++rAk7/6f
 QcePAoLoJsJdixwwdP3/AEuV6shtU/l+khmOXjIPlXJIUncRC6MQS79cmJxnAnVS2Pr4di6Q6SY
 YAYWVHU4khhR/NoVNkSzbVYsZ+RVG0i4oD7GdEGCWp5USkjyCpA2LkqOxIag1384tbLTnHS+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040102

On 6/4/25 2:05 PM, Renjiang Han wrote:
> 
> On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
>> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
>>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>>>>> video functionality. The qcs615 platform currently lacks video
>>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>>>>> to the same video core.
>>>>>>>
>>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>> +            interconnect-names = "video-mem",
>>>>>>> +                         "cpu-cfg";
>>>>>>> +
>>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
>>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>>>>> OK. Will update it with next version.
>>>> How would you update this?
>>> Thanks for your comments. I'll update it like this.
>>> iommus = <&apps_smmu 0xe60 0x20>;
>>>
>>> This 0xe40 SID was based on a previous project. However, after rechecking
>>> the documentation yesterday and confirming with colleagues, the correct
>>> SID value should be 0xe60. I’ve also validated it on local device, it
>>> works as expected. The reason 0xe40 seemed to work earlier is due to the
>>> mask value being 0x20, which causes the effective SID derived from 0xe40
>>> to be the same as 0xe60.
>> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
>> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
> 
> Hi Dmitry
> 
> Thank you for your comment.
> 
> I’ve followed up on this sid with a colleague from the kernel team,
> and based on our discussion, it seems that the sid in this case should
> be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
> the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
> 
> @Konrad, I’d appreciate any thoughts or suggestions you might have on it.

What our docs describe as 'result sid' is literally 'base ~& mask', so if
we used that, setting the mask would be useless..

Now, some old NHLOS builds are known to cause issues if the values aren't
exactly what they expect (some whitelisting must be going on there).

I don't think this should be an issue on this platform, but let's just
use 0xe60 0x20 here to reflect the real values

Konrad

