Return-Path: <linux-media+bounces-67044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XaxtElx3TmpPNQIAu9opvQ
	(envelope-from <linux-media+bounces-67044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:14:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814072887E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:14:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DZXj8jRw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FrmmXWZZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67044-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67044-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 420603231FEE
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D1A3F12E1;
	Wed,  8 Jul 2026 15:45:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4233F12DF
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525500; cv=none; b=J34eLKMPfn5F5VcwY05fQ+YfaKkxeVCp3bHJrLSDZKlrlyjxYGVW4ZkSrm2aTlzgRvKuBtrmiCkvxXOiD2o5ATSw98gHMfLO+4fay/XA43rgEHwmFZP5Fqe6NP+9nQH7D9Ej3klQqKoinFJJ1lwg1DRS73AXoHvVfbLg2ISD9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525500; c=relaxed/simple;
	bh=bUSLiGRQFh0ghEbicPP7GtlWPZsKF3rpw03IA3Tz9aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUf1dRgR6xxtvxTtamsWWCllUDnAkPHt3Q/6HEcTmQEiQ1C+YL1PqS2ljbJa2VldgkqnE07Zi49z10F9999AYheRfkbW+nNrD7UgZw5pH+9r6ibjdzPKUEHbqdqKPuK4fZkS1258/dUVTU/+masaF7DtoNd5BcAEp8TUhheAqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZXj8jRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrmmXWZZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C40U72759993
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 15:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=; b=DZXj8jRwtKhmSvmQ
	NoUcfZ9TjjbiWd29t6o5uU/JxIupxagsRtrQFqH/jbM1WmC8Q3nB6mREBB2151rK
	HsuZo6zcZdEL977T/7kFIC7f3On8Lwg4o1egngp+jSJr3YsqM2NZdDsEb31orvyu
	CLfYiF/MkV9TCy2bP4ZEnpsFxKoMdmKXSwD1qfwO+dL3vhhGcw/4laysvDRyqEmd
	8dQ+Nq+8y3Ra9Jo7onR5iyxxJqwGE1KqQgz9xKUMbj9M54Wm87Z+9iZOtZdh/Qr1
	84wQy4EvnbZ96Swg50Mwbyy3qxSevFq+ozRquet/RipvU039chn2sYyeOVuNKd/e
	BJzIuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5w8y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:44:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso16321086d6.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525497; x=1784130297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=FrmmXWZZlNW+hhUOXhcIlFsDpELx+Xwox0hRUOeY6xf09Ubm1YqfIaCe/G+cUt1jbr
         jAFKY6+iX40QRp4YUHtLDBL9cSD1cRerPiEVLgUPZZZLiHuurJqJ/VjyScTqsuNN6q+q
         2v1TVDIJzNq9gp/gVCejJiB6HdCogLFQ/8VHxBjDhE0HCkuv3w0rvdTQF029F+TrNqas
         gZ4ODAHWDGG4gLGdIRSOZ9uumyfh5dhqBwW1/IubvdMAn1t1Yzje+zIMT/Td969HIyHU
         heJNO9Js1b/HwiYaC1Wa5k+ppRUJfdu7NK5a+YG/Hin2LMaR9a5iVqAGdGuRWPXI1v9d
         R1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525497; x=1784130297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=MInDvpMB90RjiAfOUxdaniD6Dx3FDKF+Nz04CmPNItOjbi+eTyingkEjbrfA0Tjh8T
         Vo5jA3pgRgtZYQ39ceHRgwSCZ3j/pUdqGUsfIkhCmsUnhHpUwmRoxh7XQ0EAhk0TSNmw
         0wtX56926JNl4HHRsxfR78aXTG7k+0m7Xc9SOjtoN2iKIbGnSqlJNLahy3FaULzWcIsR
         exyR0FJunU11GM9p/wtjroS7gQLDsEKmiY37i1tNLEB/quW3laQXRBhEGncbFh4rfP8F
         dbYv/sNputKME4m5NjdJ5cvhDeeZPFwhbpj5iNM1T4cnJcBLdrGl1Supvpq4rGzjw+kC
         Zfjg==
X-Forwarded-Encrypted: i=1; AHgh+RpurzzbeB9g6KC3Roq+RPS1d4PPtIRzObu+ao4oAuYrshZhOyzOMhR8AccgFV23aolKEIAKR/HnMhIv8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKXI6qaF2m7jrMtsVNXmZgjrY1iHJj5OTpkFpOX+2VflpKWgwN
	31EIYXZnLl/jSBxTocMlwch2TCG8YV0E29hhdCcEiBMiR0RnheTejmTFyxAvJy3kevnqrMLDrFt
	4Z7qFeVfXqUqqvmoneK2RQyo077RB5aGzbcARoCWnMOy4alS+b8/xpfYOwQ1+5r6low==
X-Gm-Gg: AfdE7cnEOoj0Rv0Bq5tdG3+WvIITmXxa+rkuS1AlTUfzmBKaq25PCP4Qj8brIchdRLx
	7XxhyRkANTWY+7j70Fo0uNd9MfAMf1EfTK4rpQZiNP+nIoHur+Ni3L84639MzSBOftw9+Beu1CC
	8vGHpuFDMKS3uDC7/3Cxzf33VS4fAe4yXVDew1ysTTiPjfWJyIVj/aagqW9NC0iCDhz0mgCELCJ
	veNeIlSHLB8RwnGmA5Y6inOVoz6aa/Ol4FoSFSMtowlwnesz8PxapA1umw3oCG5gI+xuJ9RCE++
	xRgUqoZCMydCje/xV60b9Kc3vneVHCMZZT55+EW5zzv4fYw9Fvxebe5dvqQFfTwtNyq1eUuR7QG
	LGzDubR7FDwT9DM7/gyzsKsRKvAluoCMNRZ2PQpcUab5G8RVikwEQ+L7clsU/JIbP/qrWIwEzpv
	H1lCMiiAU=
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31842261cf.52.1783525496315;
        Wed, 08 Jul 2026 08:44:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31841671cf.52.1783525495521;
        Wed, 08 Jul 2026 08:44:55 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9ea0asm7782436a12.22.2026.07.08.08.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:44:54 -0700 (PDT)
Message-ID: <0e9de1c7-2e39-463f-b4db-f228f37a8a13@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 18:44:51 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
 <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
 <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
 <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VL8x1ggJs_HKyjhC0oDS6Co9P3mkKpyk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4q4TmY3IvWe6
 vv16TtTKfDwjaGGWGgKR56crcKhJ+oqcBL99MihW+BJW7cPDeo+D/9UF8L5/MxBVLSlkG1dsGQL
 We5i2Sq89HG/HYfj+BlAEWihT27T/l0=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e7079 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HRVC3C84EGBQM4B1i-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: VL8x1ggJs_HKyjhC0oDS6Co9P3mkKpyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4FJEuenR5Gl2
 kvDpa5FMpgLBRaNF7URFCHfyy6zqwHlQeY3Kf3QNh4+resv1+OmY02R6MBJVXrkeUTl+Azw6w5Q
 3q6VDEndrVRuIibfW5mIUTGyi0PrtpAcUX3vTS1ey8nnfKZVX12/T4JTuHh2OLBb1lBN/hZqkXF
 3ILf0jNURwcdFeevIhV17E1BWnYw2hQqNWdjd9XwT0y1zXkgXnTh+Oxget29vO7T0LbK4gV4xDO
 /HLKCYrKYLjdI2APpYWbrTM3y/bnHq5QPx6iuGDz4zvOYw8/H1W4avpnv+jRbzwLr2jVUkDwnec
 FdEO1saMJ4jowr1VYvuXMZLw6QyOLoToHPI4a1SXK6WnLUBs4jQb1BPFVdDV/xStdv6eR0YCIv1
 STP/pTEJ/T/hEXkkNJV/YMDAhSdk2WjD7E3yRm9QdkR844eDo3pQrPMUYTvKqLBFEYXxZwprvAv
 Pulc9kDuKpDbh80L8NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67044-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9814072887E

Hi Vlad, Dmitry

On 7/8/2026 3:01 PM, Vladimir Zapolskiy wrote:
> On 7/8/26 14:35, Dmitry Baryshkov wrote:
>> On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
>>> Hi Gjorgji.
>>>
>>> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>>>>> Hi Gjorgji.
>>>>>
>>>>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>>>>> Hi Vlad,
>>>>>>
>>>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>>>> <snip>
>>>>>>>>
>>>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>>>> +                                 "hf-mnoc",
>>>>>>>> +                                 "sf-mnoc";
>>>>>>>
>>>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>>>> the device node, they are found and should be allocated on parent's side.
>>>>>>
>>>>>> The interconnect has functionality to handle bw requests from different
>>>>>> clients.
>>>>>>
>>>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>>>>> to vote
>>>>>>
>>>>>> on that (actually it is possible in icc framework) but what is the
>>>>>> benefit of moving
>>>>>>
>>>>>> those to camss? Is it not better to create camss icc. I understand
>>>>>> you want them to be on parent side. But how to vote on bw? Most of the
>>>>>> time it
>>>>>
>>>>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>>>>> at this point of discussion.
>>>> I agree but there should be an API for icc voting which Jpeg need to use,
>>>> currently it is fixed to some values, but voting need to become dynamic
>>>> at some point of time, because it depends on runtime parameters, resolution
>>>> format etc.>
>>>
>>> Sure, but I believe it's quite clear that any software implementation
>>> should be discussed only when the hardware description is fixed.
>>>
>>>>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>>>>> could be considered as a "bus" device) to this new JPEG encoder device
>>>>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>>>>> get hardware descriptions as children device tree nodes of CAMSS parent
>>>>> device tree node naturally.
>>>> I agree the device tree is best to represent real hw topology. >
>>>
>>> Well, it's not just the best, it's the only possible way.
>>>
>>>>> Copying of the same identical information about clocks, interconnects
>>>>> and power domains from the hierarchical parent device to children devices
>>>>> is not needed, and practically it only lowers signal-to-noise ratio.
>>>> Here also i tend to agree.>
>>>>> Since information about the actual defect in hardware description is
>>>>> reported, the problem can and should be avoided, the handling of a better
>>>>> hardware description and dealing with any kind of complexity will be done
>>>>> in the CAMSS and/or CAMSS children drivers.
>>>>>
>>>>> If you need to get a bit more formal point of view on the matter, I'd
>>>>> prefer to see descriptions of hardware properties organised in a tree
>>>>> topology rather than in the originally proposed star topology. By doing
>>>>> it the system complexity is reduced from N to 1.
>>>>
>>>> Maybe I'm missing the whole picture of your proposal, but I want to add my
>>>> point of view on this matter.
>>>>
>>>> The JPEG encoder HW block has no dependency on the other processing HW
>>>> blocks in the camera subsystem
>>>>
>>>> It shares resources like camnoc, clocks, GDSC, etc.,
>>>> but does not share anything with the other HW processing blocks. For me,
>>>> the JPEG driver should not have SW architectural dependencies on CAMSS.
>>>
>>> To move forward there should be a clear answer to a simple question,
>>> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
>>>
>>> If no, then JPEG encoder device tree node shall be located outside of
>>> CAMSS device tree node, all resources needed for JPEG encoder device
>>> operation get their descrition in this stand-alone device tree node.
>>>
>>> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
>>> device tree node, and only resources specific to JPEG encoder device
>>> are described in its device tree node, because other resources are
>>> already described in the parent device tree node.
>>
>> 2c from my side (for both sides of the discussion). Please keep it
>> separate, if the block simply uses the resource which is also used by
>> the parent (e.g. there are no special requirements on the AHB or sleep
>> clocks) or if the device needs to actuall cast a vote on a particular
>> resource (e.g. for this to function at this performance level, the MMCX
>> needs to be at the turbo level OR for this to function at this
>> performance level it will use 123 MHz of the AXI clock). In the latter
>> case the resources must be described as a part of the device.
>>
> 
> Even this "description as a part of the device" might be not quite
> necessary in whole, let me try to explain.
> 
> No doubts resource usage policies specific to a child device should
> be naturally described in child device tree node, and it's applicable
> to any kind of hardware policies (like opp tables etc.), but a list
> of needed hardware resources still can be obtained (also by a driver)
> from the parent, whenever it is found applicable and unambiguous.

If that is the intention than that can be done without significant
changes in the jpeg driver.> 
> This is to separate planes of hardware dependencies and policies/controls
> needed for hardware usage.

Currently JPEG is part of the "camera peripheral block and support" (CPAS) in
the "camera subsystem" (CAMSS), CCI is there as well. Then maybe we should move
i2c-qcom-cci into CAMSS. Note that CCI can be used without CAMSS, and it can be
used for some I2C peripheral devices which are not camera-related.
Also, to reflect the exact HW configuration, maybe we need a CPAS sub-node.

One point of view: in the hardware configuration there are no dedicated
camera subsystem block (CAMSS) registers (based on my knowledge).
Those are a group of HW blocks belonging to the camera subsystem which share
some resources, including camnoc, clocks, GDSC, etc.

So, based on Vlad's proposal, the changes in the different drivers will just
be about where they take some resources from (parent device) or the current
device — so the changes in the drivers will not be significant.

~Gjorgji

