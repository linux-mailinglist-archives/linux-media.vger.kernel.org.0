Return-Path: <linux-media+bounces-66944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuTSCwvhTWoL/gEAu9opvQ
	(envelope-from <linux-media+bounces-66944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 07:32:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92068721D42
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 07:32:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CpvlSJgy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NIT8t8Sc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66944-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66944-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24E72300E5D0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 05:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3B03BBFD9;
	Wed,  8 Jul 2026 05:32:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D91363C75
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 05:32:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488741; cv=none; b=rm2V5GxCpDWRejt08kBmw9YeTRbHea3Pqi8jSSxa41rJggCqkvZMmLbC4rGOj2T6J1KI4S4WwJ1YURkjwUlZucJqzQEPZsjjF42U6HnJo1eDYixSfmjGL8WRB8feSzXeh7jfIhyPLoQTT4a54DiAMvt0o20g7wJWfabDNGwPtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488741; c=relaxed/simple;
	bh=CfGwp4sRltWJnhxId3QetivNUX7yJL8o70vbQVYKWVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UafrRhxBWV5DjSRUzIR/xxEvPw1ap/pVzcBZc49PKCs4L6m7FM+eV1dfdui62Ovh1aAmPa9OYmRvqxDog8uUAoYdERl2HdKnjV6hB0SbPtyXBym6p3zjPfdkFiPQcx0pfHOVOCA0RWpKYP6PHr38pwCgWLHA9SvrJCT7l4pkrls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpvlSJgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIT8t8Sc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842aJV1667900
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=; b=CpvlSJgyUzLu+y5p
	YjUhl5ozRvtVrp+FN+A82xm6xR+QGQrKhGPJkNaWpnd9Ix9Bg6M/WwB1k3hMa2rZ
	HUnXBN8LdF92JS6IHSWgsyZMh7LH3e3hIUo9Gsu8LZR1PSI+TqghsAMu9lYMf7Zq
	WdnLwd6wSMZRuX974/hNC2s6N6hqaXEGA5LHSgrDN2S2JSjwXgVsvlqfB8YssZsG
	LWbR3vPzsFIreINdnVCk4LPTF3FYbMPv7woZ8FFyPUBdfunpyFnhHbWOq4bOI9pB
	tldyCECUONNVpAH3INkZF4IPOD5lyUpj47cTE6vMPyruPfJQQzXtQz7fsTfXlmBU
	gtysMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tt5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:32:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso1685851cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488738; x=1784093538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=NIT8t8ScRNATnzpHQUbCmFOmkiau5lcaQggnKZDTV5ZZ/WbOryYmB44/4jOtwniRjd
         19uRwm6kqx4ZS3SVEHrPygTgnaLlNzmxWdReSxaMfURMejJn6pHt7DvB4hqbBtncfuAq
         fYQW6dXkiApOTptMZLu7cDGqSz2V7nda4DRIjgpni6p06dtWdCBi3SuTNbOL0TJSFBZG
         xFQMD1hyhG6viGGtPm2uo3CbhexbeZWlKwUk/lC10Da6/INu758dsUUJj+O8StSiVkJh
         uzJjmiXkD9GMqmyDMrMj1ae7972ZJSSPwuWDEclcuqDxAQpFlkdCE+WnRd9mxwLcMfRc
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488738; x=1784093538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=lVIR1Z/ENymRNSkKL1psy75rfZB6AHrESLC+Swuxq9c2mocauhBoIyf1ibNed6Pmef
         iZamHoIpiqAJN+w/s3D4M8t6y710fh0DZZNVQXCBDZDPDFv44SZIInoRcU4gXulT7fk3
         iqSKXXTL8nk+Smy8sawMVxXuWeY0XrWqutIU1mNdPm+3Vad/UYUZ9/PrJkqBune/4mWP
         0Sj9BL96ZXFMKATLYD0EUT27wQ9R2+PEnU40q37XTB+xHKo2mebWYEmC4MZFmmOBy0v2
         WFp+q6h1e4d9Wr9s/kmVlkMnnLG2ZfvQNs/BeXbJeeZqI/8MUEJloqXMNuZLd7JzXrCZ
         mvnQ==
X-Gm-Message-State: AOJu0YyfMyfBR190XrRXCyVwVpODjf3zLZZE1YLZkAUZYNBGfsC9qjub
	+JDq9Fu0GWHGtNS13/SQakHaDcVLr+CQRFg0TaeB/EezpjBiyKaUjPhh5yIb+Jqz+/7vH2ee//n
	c3SB07PZlJSPSnDoUkch/N6y7I6HRjmCp5I3HAsmEyKY7qUm3C6+IAUkS9DUYkSY7kg==
X-Gm-Gg: AfdE7cnbC3KTAZa7wVDobHZPWExWAOmsLBOiPu6Ozm8Ep2xpXMqsJ3b8lcdsLDtFGET
	1gzGN3u0lIhGu1cEB4MEb8ewGz1vbnrXDBUZWe3xpc3KRkQyJJTEz3OaNoNjJ5A/hSF6AFiEDrt
	7g6a2z/EBpzzC6RMhIHYzhuDE+g4DRTjYQ1GPqdofNgEUCrjx8IYfA+uRyKD0cr1IviwzIa1lVG
	eSQbj1HTRpdGpFxfnE0g+jHXU8mUNFR6bVVjBVgBqUOZU13pgJ7fEDsAIm/6li7JnsxW+jqk+00
	XZJv0jeCRgHkfLZaJuao1Y0BzhejTwxqE5GXZ/VCORw1/5bx8Hy3YC0MWQ1xgwhsvkiRWq0WxHa
	wFAWvw8JzfzL/ZG4meiNwtjVc5TiY3NDUEPM3KW6Hat4SAQ==
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578411cf.74.1783488738426;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578181cf.74.1783488738002;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.252.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm6799785a12.3.2026.07.07.22.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 22:32:15 -0700 (PDT)
Message-ID: <b9be4ed8-a012-42f8-9241-69d4e57ab0e0@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 11:02:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/18] media: iris: drop IRIS_FMT_foo enumeration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Syb4kUF6sxpRN23xxNP84TKxqueLEV7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxU9mj0jFupHt
 rBEN8FOaXUD7isd/fmPfxMGA1XYaFr9vRj2yo9LOJaIerllIjrJ9LnoCWEPvkd+/lwtwj/Nn/Ym
 daLhPa+EQzOhWrqTQMQ8PDOkUIIeJzQ=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4de0e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=bHmrfCP7B8u675IrmFjzDQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rxka54P1vYUHB5Al0hYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1Syb4kUF6sxpRN23xxNP84TKxqueLEV7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/RFifW4J/Krk
 u87dCRY9XCWFMKAc7lxwczQQfy5Y2ZfrjA6SoeRNW4Op7f7NyZ5NxmkBR8Dqv8M/sOfrMKNTTc0
 dvdbJEL80MhGgyvtFV3T/YPMFQT+GNbox/GNOyH5rqum4IZ9ySK1Lh5rAs4LXJRLrA1qW5n58sN
 yvCUEs5NIR07EyqwOz4sEVumGdYbH0DUpTE9WAGtOMftXSEkaLHulQ0xZZ6HvUM5aGyGglsGogb
 YcUxDGgvi96yToaWEovQxhkbPaQw3sbbKDpaD9JZHZXRxdwZq1oUNijPRhrvnaIdrf/uOFgmL6L
 23Zi3gfUig1vHSs4MTOmpTi6kaEHutvmsBaouvPSYv+Mg16izTdGgPsd7qRvDiqDNEG16rQtlC2
 ayvdlfT4ffNEtdFrLMPrtGJlrksUCS3T65s8vYex2JUfSLqkATVnskyhQZt2RVZ6xPBIYLSSZvE
 kXHXW7SGqlARIYPgSBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66944-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92068721D42


On 7/8/2026 3:58 AM, Dmitry Baryshkov wrote:
> The IRIS_FMT_foo defines are only used for indexing values in the format
> enumeration arrays. However this kind of enumeration doesn't follow the
> V4L2 logic (which expects an array with consequitive indexing rather

Nit: s/consequitive/consequtive

> than a sparse array) and complicates adding support for platforms which
> support different sets of formats. Drop this enumeration and use flat
> lists of supported formats.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
>   5 files changed, 15 insertions(+), 29 deletions(-)

Otherwise,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

