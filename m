Return-Path: <linux-media+bounces-47698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDCC8520D
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 14:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381373B1F1D
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3A1322A1C;
	Tue, 25 Nov 2025 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhwrwdnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jR0WUDwa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B501321422
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076162; cv=none; b=amVGhipGCQjwHZ64LdLnL7b0VilUn1Mvsa0yevJh9LNESrmClUXDJjJFHcrKjZpWwnoNNOMzt3J5vlgmlSDyEDZRchvoKuWI4RxjmNSOlMZW0EqokE/0LOR33B42uo+kGtPGRqalTZLwJhKLCQejNunUVVbYPWU4ORZKZBX1QCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076162; c=relaxed/simple;
	bh=E+cx4YIlZDTE5ranL+JGZLoHRziPh06lGjk3sOE5rIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8pf8n6CgjmeROWYiSc2FIXA6WANMWto8/gWJdI3P1pxRk+QxAgJcntlDnKbLFSBidslYN9bSv6l00rUoHWJJ1FJD0sdyUq0deBB083X+2bGY9xHFNh6d4QkDsJjHgSrNmPD4CvvjIWVvwwjwj7neg75jglM/WcjUzIzLOok+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhwrwdnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jR0WUDwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wNt12659063
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=; b=UhwrwdnXpKZJ7Y6V
	bCvytmpFwxctRpBFfqV7Qz3f888WfGB5Pv1/GyhgMa80BHqnkVOY8YHg0WxEZkQV
	X0l5wOB1XmfCoV6RaKAO1RLLK3oTTZWnl8XpCqpWcWZ5XYKDa7ilxxsGa2FkTgsi
	zX+UzSJlwexEJbsMj4Y0ucSDoOSrdm+DgszXL8Ja38zT2qQrNPZlz0auW3TdcsxN
	amszbPzb/MBpPeOgFl4zjX92APHWizIFef3oWRUAm/jPUXd8UIzy8vtdnFnkBVPk
	XEduQCRQZRR+NZS6S0HH3K6bKPZhDebA2qJMuCm4Pel4MJHG6mZHJSrMrhtCuAob
	ScPkTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x8h09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:09:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b8973c4608so16911404b3a.3
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764076160; x=1764680960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=;
        b=jR0WUDwa/MX6fOCj7QoWCS58D+/h/iwGadvZ7UIZGLLeEjFK9Qz+hMC+cOnY9RDjyU
         BBW7I6+TUbVDkilv7RWBPq4M9akLzKUEtIw3aDqhwJ/uMMKvYZAwu5Z4DXGHcXKztgPH
         kj/82vu5ZaaxQ3apsQuG+YbRrT+ctv6M6OtRHsAx4ZjaJQQJ0Y3aYd91TQ6nYPKIA6yL
         qa4c4ufofy3f724nsAveksmuuYEsMQdFy++D2YxU6MGRnoWX5bOpiLxDqI+ef3pbKwX2
         UBpVcVBXxLusyRx2nZLawe4BtHOsQ6LONPqw+Joq+OOsW0p6PQVkQ7HnxnJ7QszBcVfe
         Y0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076160; x=1764680960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=;
        b=WYHA3m4d0i83Tc5XH2tokJgyaksfJ0fqIYodtF3AxSsxNndoyq/KfkMnVLyx1hv7lR
         8vDMC7rrt5vvtpqsI0JoIbtKrOQkaG/pQgc6REkdvB/gxRbgguR/mAcGUf36wqRUt7qV
         QLPGCze0aDAvhEwu1ntsudIZM3JBQMqzqzM0Tr9urxXUXcg0vVP/+szcU91PSdUb42/G
         cSrHcQxzcYlK7KzE9Kd/CcSXK52YXdRMMIHFkUaVRVyERQ8W+a1RmTjotWlsUL1VncvV
         9UeHz9Qstr1va1iJU4VmUF3s6C1iW0P4bVi7eFYYb9qKwYaBQ0llQX4FjuNFgBvTb3yh
         6LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Y5h4RyaTvt/zBWyhVlgibAyYGvxTMOy/UGmRn06GX+KKBH5cDuXPwNhPXRBIwbOV4Q7odht46lN1mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyE434gtLq1rENXtWND8exQJFujlwQW+cV04T88ERKlI39z6lP
	RSJUUDjkTrKuZi6OXR+f0CuZoXAvYqP7bhAYijyST3JP0VmfPbnSuXVgHFUEZq4rspwSZKoJS+2
	03MHA78mgk7xluQp0XLyliVGtWZuWvNYuFcA8ZgoRKWsgj40tzu+zOLohbScpvsa3MQ==
X-Gm-Gg: ASbGncvPVceB+jkYSlxA6K7CQfvqE0yzFJRte2z9nMJcs6u5fjuivkHxfYTcGqPmxku
	WG3QODB5xXi2l2ALNaomFGBkO02NL/WIyAnf8PmGPxYTAsOoYc0i9D+I8w8BB8UmTRX00lAEH9W
	KoZg/XPTve8x9W9vyIHDKaWPbVzp+4bUZw9m/oXsWBjSxKoBioUWW9KBnDfWas36aOny47L2G+t
	ZeL4Io1BGc4E306AGAw3+l0FesMZk4BkUrYgVqmNvdDnAU8INJRr1SISiRPOItaontKJ2lsvAkE
	H6k5P/Lz/vcKFjcn7FNvpvqsl+1jUMW2ogFphCzeIKYixUg6heAeYse5SK/gQoDmrPuddR2hGIg
	KmC5PmmI0X7FqR8+xRhtM7/nZROe/EzEnRT5Bupxf9A==
X-Received: by 2002:a05:6a00:181c:b0:7ad:c017:171e with SMTP id d2e1a72fcca58-7ca877f7d1fmr3282342b3a.2.1764076159700;
        Tue, 25 Nov 2025 05:09:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvd7ZftKwTZuop1VYd2YmbO9mLAwUD0VSNo05pm4Qka3y82OC6qyVCz4qTVUK3FYLPrVVtpQ==
X-Received: by 2002:a05:6a00:181c:b0:7ad:c017:171e with SMTP id d2e1a72fcca58-7ca877f7d1fmr3282298b3a.2.1764076159157;
        Tue, 25 Nov 2025 05:09:19 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7d2sm17704749b3a.40.2025.11.25.05.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 05:09:18 -0800 (PST)
Message-ID: <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 18:39:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Content-Language: en-US
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <aSWmeZHmeUWs1NwY@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d_hjJyuiaiRMAW7lZobH6yDLkClgiJSf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwOCBTYWx0ZWRfX6qEEaJAevDQB
 e0CEP/sL88Rn91fpXuJOw/XcsGQnxntysogc/g9Z+PNmhGN3mqeTxXMP/RedaQSNAnHkZefpBz5
 YUhDGbBnLwuDDJvgFQKbGRXITyJxRTLYleu5RUa4csS8SNQzi0HpVZvYpCSVwFU9Ph8rICgwhpD
 Uof+ZIWYHkA/WsxywavJJOUP28fcvsS0sMsZgQi47PqnQr43GXMXk6kaxqxm1a171w1yWKb6HBh
 6zul+ElC+vrO2WgJ2PSFEuafOUckcewclXU6DD4wFtjvxSBJhHYNwXy8cur03tP77Naq6+bSBSV
 R4GAtYsNgn1J9xq0BRaz2O/6i3Q+FznGkRfQYlby4uTRsUFoQJ/6GmLFKIdjVKyXhC1lM5B9jD+
 SN5RYhtdoAksOvc8fMjw61amBkT6ow==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925aa80 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=N3h5R79uZq5wuEpuAqEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: d_hjJyuiaiRMAW7lZobH6yDLkClgiJSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250108



On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
> On 25/11/25 13:59:56, Dikshita Agarwal wrote:
>>
>>
>> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
>>> The Venus encoder and decoder video devices currently report the same
>>> bus_info string ("platform:qcom-venus").
>>>
>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>> parent device name. With this change v4l2-ctl will display two separate
>>> logical devices
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>> index 4a6641fdffcf..63f6ae1ff6ac 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>>>  static int
>>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>  {
>>> +	struct venus_inst *inst = to_inst(file);
>>> +	struct venus_core *core = inst->core;
>>> +
>>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
>>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
>>> +		 "platform:%s:dec", dev_name(core->dev));
>>
>> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
>> The second call to snprintf() seems to overwrite the value set by
>> strscpy(), making the first assignment redundant. Would it be cleaner to
>> remove the strscpy() line and rely solely on snprintf()?
> 
> argh, my bad, you are right. will fix.
> 
> perhaps we should just have instead
> 
> decoder:
> strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
> 
> encoder:
> strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
> 
> I suppose the additional info provided by the dev_name is not really
> important to consumers.

In-fact, we don't even need to fill the bus_info, received a similar
comment on iris [1]
[1]:
https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/


Thanks,
Dikshita
> 
> ?
> 

