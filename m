Return-Path: <linux-media+bounces-54674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLuFA+X2qWk/IwEAu9opvQ
	(envelope-from <linux-media+bounces-54674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 22:34:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486321884D
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 22:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82471306C462
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 21:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289C935E944;
	Thu,  5 Mar 2026 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfbPP1y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpMBIIpS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B032D7FB
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772746457; cv=none; b=t5TlRuDDk1ilZo/gA28gUX4okZpxK/saGE053g0Hhv/XDUlyL7YkcArTupZgWGjCEmaegE1semK2RFL4ngzsb8D5+jczer+zadyj2zHDKRxgXwY/kJr4Fhw/H6T+NTUxZqK3ScGZxN+LKVbrVZsfUNtOeRDLOMcK9ve6Driz5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772746457; c=relaxed/simple;
	bh=izspOewSD+rzK6gzcyMrJuU1hJl79nV883UHeDXXIu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sq9xRnkM98PCboxOGwy00WkacXVA0omz13BH3RD5diwbIAf6Iu/wVBvezTsm70902ZnyBmlrihbp9azjt9jlLX41WjOg2pwNovah/N2+rfYzELH6QVYX0Qe+csfStJNuNZWWKyWfdoAQuQipEeCPZmR/I3C+54WhUMpuhs5oX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfbPP1y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpMBIIpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmT0B1332218
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 21:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EECIVVNEFVIqIvwb9AEZld4QkiX2dWpPAnCojaqO0e0=; b=JfbPP1y82YuVskY7
	pp4PT8DYH1AS9KqJt+pwkshqozU/qdRKJ/zFYcRLxsEUaAdhxCF3BpLwq7K5WMDt
	+JVvkm2i27In2Y//wWaI9LVTfi4HHuZSjw9GIJL2NE7ERCIVno+TsF/Wv7EyLjcI
	yqOK+NkL8xeg45+2UCG0k6UulQhhR5Xd1ony4qasoGNQhIJLf0rcGNZJsbl2rsx+
	lFNQ5+igJsIxQcrNb5/T9yIMt706f9H3cgACacsmVL1lAdqbt8hEbInWVxfhyENe
	YuWYkm2o9i15nvgHiD33ZDNx1RZAMjFUvJ3DesB4aCenqZA+8Vuw3n8ty58DXHhe
	fgbjgQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09rb8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 21:34:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8298150caddso1095690b3a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 13:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772746454; x=1773351254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EECIVVNEFVIqIvwb9AEZld4QkiX2dWpPAnCojaqO0e0=;
        b=TpMBIIpSYz5h2X2auHx1BNJrkjiBAs1nELXk7gfIAgjEuH4Xs3k7ofxndBIl1TYo8/
         Pucp/ifvphjlO4FvG82YywPWzXJ5XAbnRyKEzCzMwCnMpSQgZDtFW/5kQRYl+jiIdvQE
         Nos41+SuKcM1EI5MOCHIrRQcCG3leM03xB9CcmW5zY77ddYvF1TqAOst/KpJO1L4x4tn
         MFBkD4AvH9HkUOQjJ30fFMiaTi2lRJyUsge3TtT7icCu3vT5J2ljNt3OdQ9toB5pn67I
         2O1dzB1XbJPyklA+yZ3P0KHqFlg7zBvECwo1XSu1BOAz/90rPH6Yxg3aAKjP8zmUvE3H
         O2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772746454; x=1773351254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EECIVVNEFVIqIvwb9AEZld4QkiX2dWpPAnCojaqO0e0=;
        b=OT3DnhcXCZtk8hCDS/dtn0vNXdxUM3QkfjKmcAaCFFK9Zo3rfcjaWDlACsahRyvkwA
         of5BDeSthVPS1bw0uXg4y1lhk9AE6w5770ostOUVLuRwe2C6EkFYit++faWC/gb7mvzi
         WhQLJEXVa5KH+2xVGaeFPT/hUW5eUoC3C39y550naZyQXJIK3M144Eh+pGZesZWjt0X+
         jBiC6FekPs72eEIbJY8Q/brWlTdvhYF8CxKmkzgIaA0qa6xlRydfWTrlZKaaLNihxO+i
         HK4R+EB63tPoF0EINbSnoK9eZYizvu3kChybzmB8ZYFwMTUbhSztOpZF+Gv5AlodVemI
         nDTA==
X-Forwarded-Encrypted: i=1; AJvYcCUjcsi4xUEjMPSgxA/Z/ntQdIuJpx6DVZIy2zT3XBJDX/YFZ4Cs9EGxHy7Kxjnb1wRczRX6URQ1kj5y6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RSE1KuaaW31t+ob7A+g1Zrzo9oeJfHssL5zxi16/NuZHijLZ
	4KNdoxw0d5p9Jjva4P7u35bKavdbRLcYNDo1KJxXRPHvZ0FHVMr9KBlh1fx4NPzYOcewj361iwM
	MN+GXr3RNlsncRlKld6O7HPhAZn7uf3RSaFMakC4C/D7ZLoheG9hvKSlzmJpdz9CBfA==
X-Gm-Gg: ATEYQzxnjo4a24jQfZvj4RpEivterZa/D0/XTp8k9lGkGT0YAeCLOhztaz3jWSl3sh0
	U4FDOfEj9JoGH+rD1inu9l3bAhvPSpotf1yVsvRicfFO+SLgzPwCo3mszIQZmHosivSaW8OOMHC
	eU0tqxl1Hz4chzp91q2k5z2tK8Sc49s4l/CHxA9bHnnwJwfeQjCj9Lc+wqoe2TJpd8cJvVhdOQA
	CdoQb+ld7q8SSs8pDxFqL+5H0Sy7iUcnZyFe7F+dZgMUzKU8Mur7fmWKK/5/7UuXx54V4k6Pp8n
	dgdu4Ms1orN3o6ecIIzK4dcQCyvRVmjcHmwvAGoDxg9rHOhD476cv16GfrD+jssfJdd9z3+T7CJ
	rhFPKaZqTzWlgH0KlOxxCRBiXjtlrjttWs+W5tpi4LilyG2cgvb8T8+o=
X-Received: by 2002:a05:6a00:ab8a:b0:824:ab8d:6f9e with SMTP id d2e1a72fcca58-8299aacabe1mr1054978b3a.29.1772746454133;
        Thu, 05 Mar 2026 13:34:14 -0800 (PST)
X-Received: by 2002:a05:6a00:ab8a:b0:824:ab8d:6f9e with SMTP id d2e1a72fcca58-8299aacabe1mr1054953b3a.29.1772746453621;
        Thu, 05 Mar 2026 13:34:13 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82976924148sm4978756b3a.2.2026.03.05.13.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 13:34:13 -0800 (PST)
Message-ID: <9d5aab4c-86be-46cb-8c2c-154f87e3eeba@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 03:04:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
 <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
 <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
 <mqyg7cebyahkrngvnxcrenkdd3dybpnkecago4lqonfwqzize7@yawbtcsli3vi>
 <1d2b55d9-42e3-4459-971b-e276a87fb843@oss.qualcomm.com>
 <7wvdcjajf7ro3c4y7jq6tmbxfg7kfvdpmyfzqm4vgjw5wly4zu@jcjqudf7vrgd>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <7wvdcjajf7ro3c4y7jq6tmbxfg7kfvdpmyfzqm4vgjw5wly4zu@jcjqudf7vrgd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YOgp9QAQaEGe6jE5kWB4_ITbBQMGu1EX
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69a9f6d6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=81ZJZswdUCIGFlR35D8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: YOgp9QAQaEGe6jE5kWB4_ITbBQMGu1EX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4MyBTYWx0ZWRfX7cz7fzgE5Vif
 UhtWVg/BGneK3usaZdroedQClSLdnL6UzppCDAIAesKqAPf7iLPUFkSZvO8PLKq0QP0u+VoQAcI
 /fxzgRHncKZIK2FfJ/4j3jJkhnlS/UMIZBGzbahjpsmRR+T8xl2Q34aSdAmCGfgUSQf5whnHaxb
 5HsZsT08axI1Pmjc7guHbQxbYiekkxUgFVR7UdIQDTTy/7CmfFDnH8HSfBffqs+kTz6wyz8SHUl
 cKd0+68kyIZ3HCB/Ou/tYq9sgLolGpwJ+9+4pVjIR3EwS7S/HvwojbJbXJd1jg6KjBDft1mhgT6
 8taOQSjVc10RD4TdZHW3CCaBmPPJNfAnbyQJgQGs/eQQKiDZV+tVDcH28T4cHV30+aW4SgsB9cZ
 ImF2my9W2dlENZasrLsXsUciLFLqg5ByBqm3DAw/U+HB5IyuAfVPnH6pTe23Em79+I2+0HR7B4W
 Z0qModZdzQXEqfnySTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050183
X-Rspamd-Queue-Id: 9486321884D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54674-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/6/2026 12:02 AM, Dmitry Baryshkov wrote:
> On Thu, Mar 05, 2026 at 10:56:40PM +0530, Vikash Garodia wrote:
>>
>> On 3/5/2026 7:51 PM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 05, 2026 at 06:19:52PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 3/4/2026 3:55 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
>>>>>>
>>>>>> On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
>>>>>>>> Introduce different context banks(CB) and the associated buffer region.
>>>>>>>> Different stream IDs from VPU would be associated to one of these CB.
>>>>>>>> Multiple CBs are needed to increase the IOVA for the video usecases like
>>>>>>>> higher concurrent sessions.
>>>>>>>>
>>>>>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
>>>>>>>>      drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
>>>>>>>>      drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
>>>>>>>>      drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>>>>>>>>      4 files changed, 111 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>>>> index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
>>>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>>>> @@ -204,6 +204,22 @@ struct icc_vote_data {
>>>>>>>>      	u32 fps;
>>>>>>>>      };
>>>>>>>> +enum iris_buffer_region {
>>>>>>>> +	IRIS_BITSTREAM_REGION		= BIT(0),
>>>>>>>> +	IRIS_NON_PIXEL_REGION		= BIT(1),
>>>>>>>> +	IRIS_PIXEL_REGION		= BIT(2),
>>>>>>>> +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
>>>>>>>> +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
>>>>>>>> +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
>>>>>>>
>>>>>>> Can a context bank belong to multiple regions at the same time?
>>>>>>
>>>>>> yes, they would.
>>>>>
>>>>> How? Each set of CBs is defined by a separate function in the DT. How
>>>>> can CB belong to multiple regions? Could you please provide an example?
>>>>
>>>> SM8550 would have same stream id for VPU hardwares (tensilica and vcodec)
>>>> accessing bitstream and non pixel regions. Thereby non_pixel and bitstream
>>>> regions would map to one CB.
>>>
>>> In my opinion it means only one thing: you will have two CBs (one for
>>> non_pixel and one for bitstream) having the same SIDs. An alternative
>>> would be to define fallback rules (if CB foo doesn't exist, use CB bar).
>>>
>>>> While kaanapali would have different stream id for tensilica accessing non
>>>> pixel region and vcodec accessing bitstream region, thereby having different
>>>> CB.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +struct iris_context_bank {
>>>>>>>> +	struct device *dev;
>>>>>>>
>>>>>>> Separate data and the actual device. Define a wrapper around struct
>>>>>>> device for the actual runtime usage.
>>>>>>
>>>>>> we still have to store the list of dynamically created device. Name can be
>>>>>> used to fetch the device from the list, i think the existing approach is
>>>>>> simpler ?
>>>>>
>>>>> You don't need a list. You have an array of the size, which is known and
>>>>> fixed. You have at most 9 functions, which means less than 9 devices.
>>>>>
>>>>
>>>> as mentioned above, its not the same for all platforms to have one to one
>>>> mapping between CBs and buffer region. Thereby indexing based on array would
>>>> be an issue here
>>>> It would end up something like this, considering [dev region] array,
>>>>
>>>> SM8550
>>>> non_pixel_device  non_pixel_region
>>>> non_pixel_device  bitstream_region
>>>> pixel_device      pixel_region
>>>>
>>>> kaanapali
>>>> non_pixel_device  non_pixel_region
>>>> bitstream_device  bitstream_region
>>>> pixel_device      pixel_region
>>>
>>> I'm sorry, I'm not sure I follow here. Could you please explain? Maybe
>>> by explititly mapping DT function values to iris_buffer_region values?
>>>
>>
>> Kaanapali
>> IRIS_BITSTREAM IRIS_BITSTREAM_REGION
>> IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION	
>> IRIS_PIXEL     IRIS_PIXEL_REGION
>>
>> SM8550
>> IRIS_NON_PIXEL IRIS_NON_PIXEL_REGION | IRIS_BITSTREAM_REGION
>> IRIS_PIXEL     IRIS_PIXEL_REGION
> 
> So, why not:
> 
> Kaanapali:
> 
> iris_cb_dev_bs = iris_cb_dev_alloc(IRIS_BITSTREAM];
> iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
> iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];
> 
> core->cb_devs = {
> 	[IRIS_BITSTREAM_REGION] = iris_cb_dev_bs,
> 	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
> 	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
> };
> 
> SM8550:
> 
> iris_cb_dev_np = iris_cb_dev_alloc(IRIS_NON_PIXEL];
> iris_cb_dev_px = iris_cb_dev_alloc(IRIS_PIXEL];
> 
> core->cb_devs = {
> 	[IRIS_BITSTREAM_REGION] = iris_cb_dev_np,
> 	[IRIS_NON_PIXEL_REGION] = iris_cb_dev_np,
> 	[IRIS_PIXEL_REGION] = iris_cb_dev_px;
> };
> 
> 
> Yes, it would require coding of those functions, however afterwards you
> can access necessary CB device simply by doing core->cb_devs[region].
> 
> I think current code is overcomplicated for the sake of having the
> platform flexibility expressed as data.
> 
>>
>>>>
>>>>
>>>>>>
>>>>>>>
>>>>>>>> +	const char *name;
>>>>>>>> +	const u32 f_id;
>>>>>>>> +	const enum iris_buffer_region region;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      enum platform_pm_domain_type {
>>>>>>>>      	IRIS_CTRL_POWER_DOMAIN,
>>>>>>>>      	IRIS_HW_POWER_DOMAIN,
>>>>>>>> @@ -246,6 +262,8 @@ struct iris_platform_data {
>>>>>>>>      	u32 inst_fw_caps_enc_size;
>>>>>>>>      	const struct tz_cp_config *tz_cp_config_data;
>>>>>>>>      	u32 tz_cp_config_data_size;
>>>>>>>> +	struct iris_context_bank *cb_data;
>>>>>>>> +	u32 cb_data_size;
>>>>>>>
>>>>>>> Do they differ from platform to platform?
>>>>>> Yes
>>>>>>
>>>>>>> Mark them as const, it should be data only.
>>>>>>
>>>>>> cb_data_size can be marked as const
>>>>>
>>>>> Why is cb_data non-const?
>>>>
>>>> dev is being updated once created dynamically.
>>>
>>> That's a bad idea. Please make the platform description constant.
>>>
>>
>> I can give it a try to move CBs in core struct out of platform data and have
>> a buffer region based lookup array to fetch the device.
> 
> It might be easier to express that as a callback, filling core->cb_devs
> with struct device pointers, as I wrote above.

IIUC, introduce an ops like below and fill ore->cb_devs[] in SOC 
specific data i.e sm8550_data ?

struct iris_platform_ops {
     int (*populate_cb_devs)(struct iris_core *core);
};
struct iris_platform_data {
     const struct iris_platform_ops *ops;
     /* ... other pdata fields ... */
};

At present lemans shares the platform data of sm8550, with the above ops 
approach, that commonality leverage would be lost ?

Please correct if your proposal is different than what i interpreted.

> 
>>
>> Regards,
>> Vikash
> 


