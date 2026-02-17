Return-Path: <linux-media+bounces-52973-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB9uJSRdlGm3DAIAu9opvQ
	(envelope-from <linux-media+bounces-52973-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:20:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFB014BE29
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A931A303C4CB
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B8233985E;
	Tue, 17 Feb 2026 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/UYARXF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+vuf4Sb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C833893D
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330829; cv=none; b=tceddmOAV/X0805TkBohkFxIESR0gM3fG3a28/T/2cPYcGaDXCgpzeZxZ2/IZBTOJ1iByYilEuQ8GUnS7d5UL2FpppcjUPBjvYAm+oQxmCdCVxsRba0hmL/kK/K34LPAYRsRJ9LyWvgSeSVqLLnb1Z6IB3i4mGmbIoJqDuBxiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330829; c=relaxed/simple;
	bh=cCrmHiZRywdx4V4Zx1woo1QsvjkGJLin3TdaYMG+u0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCarHEX0L4al5qDNj8Qiy8XRwH0MXSfwDl8YZ/s51nKrzs7kdcdk5uMNE+GhbTQOFZCW3v7E8tDK8mn3MtNnTxTu0XH6/o4+HhBBp3ej9G7R2984pKy5fVZARrEYGdgZxaAeePkWpfOAWhbXAgJZUIEtTAvOqg0PvkG8yh20TUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/UYARXF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+vuf4Sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8G6AX048833
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=; b=a/UYARXF++Dcxpfo
	MIJtLL8TqRhC2BOyOv54hLX0buDtphzoBijpCAIDU+34k8rOthsAVWZtDfl8jhzB
	qA2RCFbTkXwDfVj0Eg1ys1Kzwpgk7dsc77JDi081t+C5JK1tNa8x9E02FSpweKs4
	9AlF1XkUUhpye+M9W7laRpGWa+uavltegLQva8aIbJrnuknrUCouPqYoYuxTZzZs
	J4/ewaN0QDLDtRgyWHRN1Av/EiDyt7qFkAO243esk6EeWe3xU5hl4kuykV5aKdKP
	6mVS/eXw2p9PVSnkIdeUBYnqJA692djtmq9O0eHTKwe7a+AJWIjLBt+oaxVZXtSE
	LB6/rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82atq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:20:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50698374e33so39904761cf.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 04:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771330823; x=1771935623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=;
        b=a+vuf4SbUB0nod302kayfb8kNJNzhx1KtQ6j5l49jPF3WV+fc+dtI5zYWR8Wf60867
         9guXtw+UQQSIgsstXgNZ7dcbG2YDGj9z0+8btrw/IwLv15NGglW4mGH2RLD74OQQl78Y
         RNaAHqqse9+Y5nvndIt7qrduXR7zbiW9ASjkDGrwrmZEb2ZLWQ82YxOQbNs/hcTylhyT
         B5+Lcz9+OR78KkvhARZ5lPKCww0uN/cRFI6jkSQyHeUDh+k73kiaYAuLpQgFTxJLcW+4
         UOFO3euuyLE7vGENZ52GL+NA+sO5uL8CsTFVf+EhtaiY4pcA6IQh2vulos2ryhp4gPPX
         R9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330823; x=1771935623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC7ivbDQ11ZNpJ55VMezYvfuh7l/jPPDBhIV8L68b44=;
        b=bET+Wmr2BA26jurswDXSEUEDZN3WPqIDTpsubUxycLIApqKH1F2/tGH2f39IUlWXON
         5JUpWDdYLeZf0zI0/93zRyD6eAiFloC2350CxAMrx4709F3j2aYBaLgSHuFixsuEd6l9
         80WcZJ+ae0LRhaXxs2uE0GrqRPMQ1R7qBe9AkLayJS5IgLxIoqaC85w2bh7gtTxII80k
         yCZqx+K70o9nKFJ9D/Nbk3R9pu8xJVggN65qalp083a2ZkwlJKtLN28YIv+tISTYeLw3
         Si9ohmgEJJN4V91Vhm+01g0Q4RJeHM748qXCLnJrkVKFEbz53U97GSaRa3UswLL9TXna
         X9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU6dE/objODlNH6WeZzZ+iI3jV02pKXfWyBhPJK98N7wu0yMHlMQF4BJjFcXCC9C2jBHA/ejPnD5q+SvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkHmZz1KoF1J0OSKfEPyZ3jdBq0ZRw7MhA3wt5ujpjJJpLM6q
	HmNL5i6boqfM9cqWNjGViYWfxowd7XBii6mg4gjgB99XcPuf3Gnsh2g32xfthINkA6rlE9Lw/No
	4KR0WUFRXUbT7N7nbwca0WQqmix70rHTgHoNu9x376OvAgoKpGWDez2aIgnx3JWDgVA==
X-Gm-Gg: AZuq6aKpLxff0H+KsBtpROtsEuuSwK+C4eGYv+QYTElmVnOvWHFlxPiRckAhgu6RzPD
	Xvp2vzZyN9j8Z8mHMcIaWS+Kfa8c+svKcXlI26cOoNEa3C4UTnUrbBLaLH7Nil9HjIb0RSL6v0s
	qHO9mMJSMiCUy8MXsdG5IhKOoh4yoYgwZu07wyELGPPEd6ojhvARObc/n5Ez9df/cX+o8LA19L7
	HjtJbHmh1+p/qbQsJa8GA79MmtrZ/gxrqF+vlARyuvE+G17xFLHs3m8V7XazUxhD6B3C4Hb73ix
	C3XRYZ4pefD86Ibz6OE5zb6L0l99nwRI+VX9l3FGoO52SEt+exCesmf4RCNzvg66/qfJGaEpjnZ
	ndz3/cULt+B46EqINc6W3DweKJzpY7lOrkMdIc65Yh6dzUcA9TT2KdC3+0QXUCV4rU7v/0xyR5T
	H8+qo=
X-Received: by 2002:a05:622a:188e:b0:501:4de6:96b4 with SMTP id d75a77b69052e-506a6ad6934mr137381881cf.7.1771330822822;
        Tue, 17 Feb 2026 04:20:22 -0800 (PST)
X-Received: by 2002:a05:622a:188e:b0:501:4de6:96b4 with SMTP id d75a77b69052e-506a6ad6934mr137381601cf.7.1771330822197;
        Tue, 17 Feb 2026 04:20:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f129fsm2269934a12.29.2026.02.17.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:20:20 -0800 (PST)
Message-ID: <ed9a5194-356a-4c18-8ddb-c1017e87fb7b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:20:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69945d08 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=a9I1boEWqR-mI_DZ9jAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMSBTYWx0ZWRfX4W6ZyS5Zw24Z
 LFvWmZaCYWmKp8cHu5Pr+WktSU/Z6Jza2qvScpedkN/5jLpIVIiCMHw08usoOehlFm8ZUllKiuR
 uhMjqxgO4lX7VZKoqckcMYusU+dq+MWHezOLahOhXr1pFh0Z6pB+rfBH9sMWCENci76f04Gl77c
 UlMT3ObhQ4nCd6jtaZNyNzV5cTdiInqNQOs8GOqAyaXburBvtk+vET/xoiPNqdTX6DkIOCQ8YoE
 +qzX4yoFa1eyUBBANMxWFIWyLGvRJ156DBACjrOPZ6JVEDqrWQ4Qmm3xkGtkdBLOvBm58kypx2y
 IO16Ceo8ug6ryYK4FhdbxGjyI4KnGmlFJGmrQdTAclFCseUKBsTJArzvzfJzmueg34flvy1voes
 jXMdB26WLnYwBW/1cwjDI/Yb0KfsnWNYqlB9p2cnIQp1mjGcW+Rqq9gxJMn+iMMoBJpe0d0dVDg
 419cZdM4w5W6rndoKQg==
X-Proofpoint-GUID: nPhvaxcSNVjragg4ATW1zk7p4_N37eAs
X-Proofpoint-ORIG-GUID: nPhvaxcSNVjragg4ATW1zk7p4_N37eAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52973-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,bootlin.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECFB014BE29
X-Rspamd-Action: no action

On 2/17/26 8:40 AM, Dikshita Agarwal wrote:
> 
> 
> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
>> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
>>>
>>>
>>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
>>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>>>>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>>>>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>>>>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>>>>>>> 'firmware-name' property.
>>>>>>>>>
>>>>>>>>> Based on this property and the availability of the referenced
>>>>>>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>>>>>>> updates its platform data accordingly. Boards that do not
>>>>>>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>>>>>>> automatically fall back to Gen1.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> To avoid accidental matches, I can switch to an exact filename match
>>>>>>> instead. That way, only the specific Gen2 image (for example
>>>>>>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
>>>>>>
>>>>>> How do you detect that for the OEM-signed firmware, which can have
>>>>>> random name?
>>>>>>
>>>>>>> want to use Gen2 can opt in by naming the firmware accordingly.
>>>>>
>>>>> I Explored on suggested alternative approaches and seeing some limitation
>>>>> with the both of them:
>>>>>
>>>>> 1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
>>>>> It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
>>>>> the version string. The issues with this approach :
>>>>>
>>>>> - the version string has no explicit marker that identifies Gen1 vs Gen2.
>>>>>
>>>>> - This prefix is not a formal ABI, and it is not consistent across SoCs.
>>>>> Each SoC family uses different naming patterns in the version string.
>>>>>
>>>>> Example : For SC7280 Gen1 we currently see:
>>>>> QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
>>>>> QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>
>>>>>
>>>>> So the driver would need SoC‑specific string‑matching rules, which is hard
>>>>> to maintain if we are looking for a design to address all available SOCs.
>>>>
>>>> The only SoC with such distinction today is kodiak. So we can simply check:
>>>>
>>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
>>>> 	hfi = gen2;
>>>
>>> Agree, this works for Kodiak. However, Dmitry was also referring to other
>>> SoCs that may support both Gen1 and Gen2, and at the moment there isn’t a
>>> generic way to handle that check.
>>>
>>> Also, please note that the Kodiak Gen1 firmware uses the string
>>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
>>
>> This is not quite true. Kodiak Gen2 uses:
>>
>> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
>> QC_IMAGE_VERSION_STRING=video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>>
>> A collection of versions quickly captured from what I have here (for
>> different chips, but for the overall picture):
>>
>> HFI Gen1:
>>
>> [skipping prehistorical / museum data]
>> VIDEO.VE.5.2-00023-PROD-2
>> VIDEO.VE.5.4-00059-PROD-1
>> VIDEO.VE.6.0-00055-PROD-1
>> VIDEO.IR.1.0-00005-PROD-4
>> VIDEO.VPU.1.0-00119-PROD-2
>> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
>> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
>> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
>> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
>>
>>
>> HFI Gen2:
>> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
>> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
>> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
>> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
>> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
>> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
>> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
>> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
>>
>> It seems we can assume that Gen2 is:
>> - vfw-0
>> - vfw-N.M
>> - video-firmware.N.M where N >= 2
>>
>> All other binaries are Gen1.
>>
>> Also, we don't even have to query the binary firmware blob.
>> After the firmware is started, you can read the version string from
>> smem, saving us from strstr over the firmware image.
> 
> AFAIK the video/iris firmware doesn't populates its version string into
> SMEM by default.
> 
> On venus, the version string appears in SMEM only once the driver
> explicitly writes it after receiving the version info from the firmware as
> part of an HFI response.
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/media/platform/qcom/venus/hfi_msgs.c#L289
> 
> 
> Iris does not implement this SMEM population path today, and the firmware
> itself does not publish its version into SMEM automatically. Because of
> that, reading the version from SMEM is not currently possible for iris.
> 
> Also, relying on HFI to retrieve the version is not viable for detection
> because we cannot issue a protocol‑specific HFI command until we already
> know which HFI generation (Gen1 or Gen2) the currently loaded firmware
> supports.
> 
> Due to these constraints, I think, the only possible way is to extract the
> version from the firmware binary blob itself.

Looks like both gens use the same iris_hfi_queue_write() logic for issuing
packets and they both use the largely common iris_hfi_queue_dbg_read() logic

So, knowing that e.g. HFI_CMD_SYS_INIT (0x10001) and HFI_CMD_INIT (0x01000001)
seem not to conflict, we should be able to issue say a gen1 command and check
if we get a timeout, no?

Konrad

