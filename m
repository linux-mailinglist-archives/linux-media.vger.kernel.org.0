Return-Path: <linux-media+bounces-66860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GrGeNHIWTWpxuwEAu9opvQ
	(envelope-from <linux-media+bounces-66860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:08:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE771D058
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D+ctsqcj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J9NB6r9E;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66860-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66860-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4329731CAC09
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B4742A7B1;
	Tue,  7 Jul 2026 14:36:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B23D9028
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 14:35:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434960; cv=none; b=L7/1j1gQ++fdyhhRFxEA2W06VeZndahNpG8P576l/OWWEB+BROZXYEe8o/S8BuW4u9fPdsMlPCDfSjv4do0lKUXPO0bMCG4vcVLFR3+g2zNlpPOsQDXM7gTJtONgfCfXbgomFH15AQs9ZufPKzyhOqtKuWdPE/ejSfmULNj2a3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434960; c=relaxed/simple;
	bh=TXgDovbCaoyMQA9MFC55Q/Iqv6PosaHxtnmYEvacrLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nq4UnYowxPeG2xi65Zn7nDK+9JlC/XvmFW0evHTBS4lKOFmUbLiPk0zu9moQcB1I8LehKXPHPA6PwRk6d0vx4O7GBetdg5KB6W79Snxeh5hgCpxtOmzJBUQx2iARBpx2WsV3lrL6LCZKz+/+xiWSkAxNKgbASQef4o0KT4wRq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+ctsqcj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9NB6r9E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C92f73590133
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 14:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5DIMFQOXLWuvRGZqs8dfdBrThS3DqPxB3po9Sehnis=; b=D+ctsqcjRAZhsDD1
	AqO+VBn+BflxnrQJgLxXLCvWvDRrIQy10k/GyoZsBF9Sub8lF3oD7ko7v3w9io6Z
	xZxXkriy5zGwqMWDc64hd5RvXZT5mg+s3PS5Vb6BGoS11/bke9wzlqRUO1Pi+2Hl
	SGRmld9ZJShqMx6shV7HPQVmM4El2mv3tfP00CkN3H4den+dKoyLUEJ+cW4vx85D
	S8x7jjD8pVgsRzGbCxk0rNyzLgLFGq9UCOIS41r5od1Ls70kk1c4n70vwM7ZRzTs
	EpK5NLYoqXVOINVsc3ZzhJ5xJEoGbxoe0Z+WyVElXnuW8H0IIYYvqw3POleEl8Xl
	qhvyRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u9qnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 14:35:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca0481106cso50221225ad.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783434957; x=1784039757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5DIMFQOXLWuvRGZqs8dfdBrThS3DqPxB3po9Sehnis=;
        b=J9NB6r9E9IEeiXf7RurpapjD2uZqyreslxp2hNXEydsvynVSPI6Sbtr5jR3MsNzOEc
         Ybx5n7rEZCtXz7oSBoU/5k2hDtsPz77rXn87Yl7RBegrZX3pNNV2/Vc9/e1EzQpySwyh
         pPPkCQGLbb6EC/PtSNDEjuIpQoCNzFanEp0tZz/EMCUI1w/y8gnLHPvY8ZilL1lj3AUQ
         B2uf/90Yq1m4auSMm8eoGTfBgGGx51SZpBXTWTR+jQKPvz41noNfQTIujVdXq/pdgZTW
         qeP8snhPH/xurGgdcxGRg+WbVRRN/6e2TXGVvnx9I4jhd5TwVFJcNgvhrDmwk/gTlD9F
         b+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783434957; x=1784039757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5DIMFQOXLWuvRGZqs8dfdBrThS3DqPxB3po9Sehnis=;
        b=W2uz1ZQ37ycHELlQEJ+TOOl2y1AD2r8Xa+wtviTcao6iA/634CVcU3HlqNvswfTKbP
         /bqQSoJ+b9fptZryYC/oytFJXOCCw0INa5Dp26F9jj/m1/quNcJntLjemXPdsbYuKD9n
         B6YBY3+U2JdBpiQkXvJEVIc3WKd3Z5jGTVMRKewlO78DM6vPcPZa05cd5SfYSvDqRFSW
         nABvKr3lxIx97WUjk+BD2ncwDaVlVufhTEgeQlEjd8K+qjdKFTstGgJor73ANLUH1jPQ
         FVfhChpXWkpk2/0AlQ2EJDA25Bw9raeBepLPddWD8NGIH3199unpW6uvnJHkFDplC320
         oQ8w==
X-Forwarded-Encrypted: i=1; AHgh+RrhNlMFnfwUfFkDly40ENihf9AiruxxpNEoeWDZF592Qe4fTM3LEQCjzqZ12FzbsgJZdOanYEHF/5m6mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvz9MYPYchjyaVl36h5mUoK4WP15k4Xlhx7vMBuOt2jzbUJAzF
	kr+wtXfwBZJFKm6WSCaMxGTu63oazfrsyl+QGVNx7Koes7p/xThsvnM1kxv7aWUJnA8H5miO9jH
	yF44FB/20pIj0FnPqX7Q08BFj+lz18TWyOX/uScT7vixGS/9AvFfEKcLgzCqu0P9rjQ==
X-Gm-Gg: AfdE7clcIx1LNEIFRqjbw+7bc0ZxrXtgpP8peQDz6REvnm+iWxaVKzDVBg8Gi41yOt2
	7Uw7XA1gWaDJx9Q6OMmHiVqB6rgHdZpiv4VW0akoFls0eOD+rm208oiovEVxi4/bA8+zyaVf3zu
	xOUwrOsNtQmHeQYceykCiDvZBTxdk50P50gQujDtl44qh1eS1DtMIMaTazDKJgjfC11xZupkV8A
	/YWTdPkrx5n88ctMRtqL/ejZgHHbC8wZ0ucAPdMpCI/c/qMr5dDb3yG1KlynBQFQJ/YNZGcYB2B
	/5RKafNxM039Q9ioflUI2zozZv1s4WnjQc9DhxwhlZcraodxgcD9fi6NUIq/YgcqxJqscnNZI1z
	b92C7y9K43HpLqa1Ruc/NyTFFObIXzjluN+RRmpL5ZaFp
X-Received: by 2002:a17:90b:2d89:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3875779995amr5196717a91.30.1783434955668;
        Tue, 07 Jul 2026 07:35:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2d89:b0:37f:9cdf:f03b with SMTP id 98e67ed59e1d1-3875779995amr5196691a91.30.1783434955119;
        Tue, 07 Jul 2026 07:35:55 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm9862567eec.27.2026.07.07.07.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 07:35:53 -0700 (PDT)
Message-ID: <22bf7037-ccd1-4777-a11b-82f85a1a6e60@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 20:05:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-12-583b42770b6a@oss.qualcomm.com>
 <4fb441a2-ce18-40a2-8227-5167779d1ed4@oss.qualcomm.com>
 <gqy3msdsk3bjupkvq2mnmnksxeivp2now5a2tg4pun5h4t6hp3@yt2c443vyen5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <gqy3msdsk3bjupkvq2mnmnksxeivp2now5a2tg4pun5h4t6hp3@yt2c443vyen5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0MiBTYWx0ZWRfXxyDntPy6RoKC
 n5IAVTQtu6yS+r5OfJDV7/c/LGZh7T5sViC+TOJolSmIZOwAfPJ7iUbC9oTie2gIUuD1+ByZEOg
 VoZj7GF3y7GUlmLBYVh35hBm1b1yluo=
X-Proofpoint-GUID: 1e_gFyFb4mOxg_gVpyxPCtEvyRVQCUl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0MiBTYWx0ZWRfX9GgrGy8Hpv2C
 1W3exygo96mTz9/KIXvw6UcTNE0OIEeKj5/YT7AxRl7M2riIGX6Zhi4CsYPTbDff5qdtIsji+vA
 JP0dxuM5LpVGKtTJFaU5bTdIQ4vZIs3xu2PgAuDVXrB/OHr9C3IBRMtz+nclszCumR+A7eIWlgT
 6OEkjrg7n3A2G296mix0GznS2hZPkvfOSGY7cYhY/DDPKzN7rbLf0T3NRvKnUXjZXEh1hhzfcej
 bGdDc/EKyGCIn/SSR5ycU2kadUOrUbBEawfZfyL46qb69L9UYs1cMJB/AvZW4um29mpYsFzBbKf
 oZRhx64Z7xSGfPwQYZ2RgBcwV4UXvklE4AIk0OGdtJZCMRwrTkt9tt1ljz0viqj1v5OhtFSjeZw
 o5lojaHZsPiyU/1FSWWxLi+GresFkVCk7ztgKNZR0bPfnL3HuFyGCWrw9sxOYaDxo5QD81YBupF
 3yNq5Nx1BG4U/DzzaPw==
X-Proofpoint-ORIG-GUID: 1e_gFyFb4mOxg_gVpyxPCtEvyRVQCUl9
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d0ecd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=CdVlmgSAAAAA:20 a=EUspDBNiAAAA:8 a=JrPLwC-icLd1x57BenYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66860-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13AE771D058



On 7/1/2026 6:54 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 07:47:43PM +0530, Vikash Garodia wrote:
>>
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> Port support for the AR50Lt video codec core (present for example on the
>>> Agatti platform) to the Iris driver. Unlike more recent cores this
>>> generation doesn't have the PIPE property (as it always has only one
>>> pipe). Also, unlike newer platforms, buffer sizes are requested from the
>>> firmware instead of being calculated by the driver.
>>>
>>> Co-developed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>    drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 227 +++++++++++++++++++++
>>>    .../platform/qcom/iris/iris_platform_common.h      |   6 +
>>>    .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>>>    drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  13 ++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>>>    7 files changed, 362 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>>> index f1b204b95694..bbd1f724963e 100644
>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>> @@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
>>>                 iris_hfi_queue.o \
>>>                 iris_platform_vpu2.o \
>>>                 iris_platform_vpu3x.o \
>>> +             iris_platform_vpu_ar50lt.o \
>>>                 iris_power.o \
>>>                 iris_probe.o \
>>>                 iris_resources.o \
>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
>>> index ca1545d28b53..f57af31dbd9f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
>>> @@ -443,3 +443,230 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
>>>    	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>>>    	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>>    };
>>> +
>>> +static const struct platform_inst_fw_cap iris_inst_fw_cap_gen1_ar50lt_dec[] = {
>>> +	{
>>> +		.cap_id = STAGE,
>>> +		.min = STAGE_1,
>>> +		.max = STAGE_2,
>>> +		.step_or_mask = 1,
>>> +		.value = STAGE_2,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>>> +		.set = iris_set_stage,
>>> +	},
>>> +};
>>> +
>>> +static const struct platform_inst_fw_cap inst_fw_cap_gen1_ar50lt_enc[] = {
>>> +	{
>>> +		.cap_id = STAGE,
>>> +		.min = STAGE_1,
>>> +		.max = STAGE_2,
>>> +		.step_or_mask = 1,
>>> +		.value = STAGE_2,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>>> +		.set = iris_set_stage,
>>> +	},
>>> +	{
>>> +		.cap_id = PROFILE_H264,
>>> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>>> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
>>> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_profile_level_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = PROFILE_HEVC,
>>> +		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> +		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>>> +		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_profile_level_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = LEVEL_H264,
>>> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2),
>>> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_profile_level_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = LEVEL_HEVC,
>>> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>>> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1),
>>> +		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_profile_level_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = HEADER_MODE,
>>> +		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
>>> +		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
>>> +		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
>>> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_header_mode_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = BITRATE,
>>> +		.min = BITRATE_MIN,
>>> +		.max = BITRATE_MAX_AR50LT,
>>> +		.step_or_mask = BITRATE_STEP,
>>> +		.value = BITRATE_DEFAULT_AR50LT,
>>> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>>> +			CAP_FLAG_DYNAMIC_ALLOWED,
>>> +		.set = iris_set_bitrate_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = BITRATE_MODE,
>>> +		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
>>> +		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
>>> +				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
>>> +		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_bitrate_mode_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = FRAME_SKIP_MODE,
>>> +		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
>>> +		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
>>> +				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
>>> +		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +	},
>>> +	{
>>> +		.cap_id = FRAME_RC_ENABLE,
>>> +		.min = 0,
>>> +		.max = 1,
>>> +		.step_or_mask = 1,
>>> +		.value = 1,
>>> +	},
>>> +	{
>>> +		.cap_id = GOP_SIZE,
>>> +		.min = 0,
>>> +		.max = (1 << 16) - 1,
>>> +		.step_or_mask = 1,
>>> +		.value = 30,
>>> +		.set = iris_set_u32
>>> +	},
>>> +	{
>>> +		.cap_id = ENTROPY_MODE,
>>> +		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
>>> +		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
>>> +				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
>>> +		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>> +		.set = iris_set_entropy_mode_gen1,
>>> +	},
>>> +	{
>>> +		.cap_id = MIN_FRAME_QP_H264,
>>> +		.min = MIN_QP_8BIT_AR50LT,
>>> +		.max = MAX_QP,
>>> +		.step_or_mask = 1,
>>> +		.value = MIN_QP_8BIT_AR50LT,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT,
>>> +		.set = iris_set_qp_range,
>>> +	},
>>> +	{
>>> +		.cap_id = MIN_FRAME_QP_HEVC,
>>> +		.min = MIN_QP_8BIT_AR50LT,
>>> +		.max = MAX_QP_HEVC,
>>> +		.step_or_mask = 1,
>>> +		.value = MIN_QP_8BIT_AR50LT,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT,
>>> +		.set = iris_set_qp_range,
>>> +	},
>>> +	{
>>> +		.cap_id = MAX_FRAME_QP_H264,
>>> +		.min = MIN_QP_8BIT_AR50LT,
>>> +		.max = MAX_QP,
>>> +		.step_or_mask = 1,
>>> +		.value = MAX_QP,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT,
>>> +		.set = iris_set_qp_range,
>>> +	},
>>> +	{
>>> +		.cap_id = MAX_FRAME_QP_HEVC,
>>> +		.min = MIN_QP_8BIT_AR50LT,
>>> +		.max = MAX_QP_HEVC,
>>> +		.step_or_mask = 1,
>>> +		.value = MAX_QP_HEVC,
>>> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
>>> +		.flags = CAP_FLAG_OUTPUT_PORT,
>>> +		.set = iris_set_qp_range,
>>> +	},
>>> +};
>>> +
>>> +static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
>>> +	BUF_BIN,
>>> +	BUF_SCRATCH_1,
>>> +};
>>> +
>>> +const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
>>> +	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
>>> +
>>> +	.inst_fw_caps_dec = iris_inst_fw_cap_gen1_ar50lt_dec,
>>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(iris_inst_fw_cap_gen1_ar50lt_dec),
>>> +	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
>>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
>>> +
>>> +	.dec_input_config_params_default =
>>> +		sm8250_vdec_input_config_param_default,
>>> +	.dec_input_config_params_default_size =
>>> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
>>> +	.enc_input_config_params = sm8250_venc_input_config_param,
>>> +	.enc_input_config_params_size =
>>> +		ARRAY_SIZE(sm8250_venc_input_config_param),
>>> +
>>> +	.dec_ip_int_buf_tbl = iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl,
>>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl),
>>> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
>>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
>>> +
>>> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>>> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>>> +};
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index 6a189489369f..bc04831ae7fc 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -39,6 +39,10 @@ struct iris_inst;
>>>    #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
>>>    #define MAX_HIER_CODING_LAYER_GEN1		6
>>> +#define BITRATE_MAX_AR50LT		100000000
>>> +#define BITRATE_DEFAULT_AR50LT		20000000
>>> +#define MIN_QP_8BIT_AR50LT		0
>>> +
>>>    enum stage_type {
>>>    	STAGE_1 = 1,
>>>    	STAGE_2 = 2,
>>> @@ -51,8 +55,10 @@ enum pipe_type {
>>>    };
>>>    extern const struct iris_firmware_data iris_hfi_gen1_data;
>>> +extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
>>>    extern const struct iris_firmware_data iris_hfi_gen2_data;
>>> +extern const struct iris_platform_data qcm2290_data;
>>>    extern const struct iris_platform_data qcs8300_data;
>>>    extern const struct iris_platform_data sc7280_data;
>>>    extern const struct iris_platform_data sm8250_data;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
>>> new file mode 100644
>>> index 000000000000..393256f39112
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
>>> @@ -0,0 +1,110 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include "iris_core.h"
>>> +#include "iris_ctrls.h"
>>> +#include "iris_hfi_gen2.h"
>>> +#include "iris_hfi_gen2_defines.h"
>>> +#include "iris_platform_common.h"
>>> +#include "iris_vpu_buffer.h"
>>> +#include "iris_vpu_common.h"
>>> +
>>> +#define WRAPPER_INTR_STATUS_A2HWD_BMSK		0x10
>>> +
>>> +const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen1_s6_desc = {
>>> +	.firmware_data = &iris_hfi_gen1_ar50lt_data,
>>> +	.get_vpu_buffer_size = iris_vpu_ar50lt_gen1_buf_size,
>>
>> unlike gen2, gen1 is calling buffer_requirement from firmware for every
>> buffer types. And given that call is a synchronous call to firmware i.e it
>> calls and wait for a response, i see it can cause delay (and infact not
>> needed) if called for multiple internal buffer types. Can we see if we can
>> call that call once ? That call to firmware (get prop for
>> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS) fetches requirement for all buffer
>> types.
> 
> This matches the Venus driver, it was querying buffer properties for
> each packet. If we query buffer sizes only once, what would be the
> condition to re-query them? One of the property updates? Which ones?
> 

Was trying to find the downstream design for this, and could find this 
here [1]. Moreover, if you see the property queried to firmware, it does 
not carry the buffer type with it, its the one call for all buffer types.
I will leave the implementation upto you, if there are multiple buffers 
being queried, those can be combined into a single call to avoid waiting 
on every call.
Venus is doing the inefficient way too.

[1] 
https://github.com/ianmacd/winnerx/blob/master/drivers/media/platform/msm/vidc/msm_vidc.c#L1178

Regards,
Vikash



