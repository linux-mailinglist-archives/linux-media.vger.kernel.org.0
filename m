Return-Path: <linux-media+bounces-64922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KkXkEro8MGofQQUAu9opvQ
	(envelope-from <linux-media+bounces-64922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 19:56:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAA689016
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 19:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jZVfAd9f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LNIQRKIV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64922-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64922-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8687304E647
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6602D30C632;
	Mon, 15 Jun 2026 17:56:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE5A3093B5
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:56:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546161; cv=none; b=Ff0qjuvFkuHvFPQ5/291o/xggJefZx1UriTiXVQ/R236HUAYH8xTFF+bvsOROw5Zt9CcYhTOhPq/C5C5gkpI1dR7gQ4gCr3Tq0NN26kZVs4xqTcoYnx7plxf2a5mAG+xzbRvpdKZVbRpmNTfs3tbg+fQLQRF3PY7Vu/8/xtapww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546161; c=relaxed/simple;
	bh=Bfg65l9oLYMQye/1jT8eUxdRbUv5Ys7i9CriojpoHSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzbBhN5ChTGbobSwLbvwpPP65yAGpSXqPPgM1yd/CPbQ+EML812fmaZnYCyQ53B1iH9/jgv/W3UO6aaryvQl46GEqIK6/M1FjilKpoWyZp+gFsjrzW6Wuw+0bn5IyqOpNF+oHvvSVEWT77KdcaCKUzg4KsLzS1yMTIKFoINvKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZVfAd9f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNIQRKIV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFiGOI955960
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=; b=jZVfAd9ftVJpSaDc
	cQAH45/ksdOKCjoguK8Ldq7QZLJnM9tER1ZXMjOGNP6f7Y0M014+nEwfH/E415/j
	+bVna5vBmmASqrU2irhHSb/3e1iV1rD/0eYrFyaxDHDekOyjazGnpD4HEXMe7bXp
	GduEnXwbpTTlEgZ7jTg4MYLih19jRVtg0SmhRpyu5naq5JIlZiznYM7J0QhlqRrL
	72EFDICEGetj/nfThpyApgEMvy1ZeAo25ZkdojvLVU3ITewXS6IorhCk+FtcRGLF
	Ly72h1Oj331Rgy8i9TJO7qfRnWzFg7kdYD4NQPRaTkbAKt9s9mbFMlzF9bOjzSDz
	CIf+FA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter226gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:55:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c859d79c10eso3480921a12.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546158; x=1782150958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=;
        b=LNIQRKIVvrs58hVQNKiqJXnn4Y93w8G8A82esmfJNxs43Q0QWaouSHeUSzzq4pGFzr
         nm5NU23lHpCXObN6uPApT14Ha2AJnOcWMT2IHtKmvM1gys7oQfzxOyG/t+0tSggwenDg
         AII/go09JQHEMxLNae/iHwy4COsIWHDWE7lgtHIPBWcjj88GOgwHbNSavH3Lp7GDPRTh
         orOvfa02Lh0h+l1qm9qrG15Lqi2wD8zHFmyG8Cr92pSIKdFd6babHxRYhG3ARd7yAbKk
         SQgdX3uFiWw7gv6+nSdw3aRvongmktaCwuZxpqXyMBbqxKCspicgW0VrhLPDgZkgkh2A
         8Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546158; x=1782150958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ST1w0wZqczPPxszNphmXYIsO4uUm6fjnUhko0y+jWxc=;
        b=dbSaqNpo0llwa+qPYDbLdssMrcgQbLFC5XeYPEgKqT/Brc6V7fNyYi1R9XPT0pdbYk
         UxrL9uIGqaygLZKjwcxQFy/otQJjB/huSg5WUD+WTrqBRX9hHuDbo+rRzFCj/lDI3x51
         mrZg6Xtc+/QwejtNbHkl7KZZhxsGho7RmHO8riOhTo2aukeN/jUOcqsgzgUCZLjeyXvI
         3nfi8taImtzhkBvomFoskC+mq0qfxBiwd2N0UKettxJSjDfaivgnMMkKe6V+9KFZgsL1
         4C9X9Jd2CP8FOUWB6JfHQddyBR9DHM0vuZVRlKh5kKrY3rBUef5Yr2Hp8mZBx0ZpBI1V
         bgqw==
X-Gm-Message-State: AOJu0YzNkzqWjngx9dvZhuHzGBPY3h+un6K2a+V0BeIMMRHwAQmal3Fw
	OGztLVxT+VyAfyHgC/6LZ9dW011q6NyQJSrHe7mnMeWkhL/HXehEnH7lY2J8g0PljxORXecirQp
	R1/qD8JbJbA8b6TguakT+kFkZ7qnWsa2u1h5Cg5TniCEPLOcV9rVeGHbN1WaFDcIZgg==
X-Gm-Gg: Acq92OFF+tvcYts+nF4Z7NZqBZPRizKsf4GUVC8ibQGDehqoebRAyyZhQZw6Xu9BiDc
	0Ni4ZGBX06I/786p2UMy9cJehfZXqgidZXHRu7RFX+EVnFufw65eXhsB8G2v0HSB0Rg2FQ/RPI/
	HFwFrN1Jf1dg6t+Z83Lw7naE8LVMDL9OYugo9vExNzBrDsRB21E+ZuEJbvlj/C8L909ex3Pwf43
	q7C+KgcU4IXA03EBPJhkgpmkAq3HdlgMFZLAWUAEm1kCiZ40qgGkjFVfpVqSuyjhnnan6vW3HQ0
	ldsDa9TkOkoOg/YlmcdQscijHsvltpoYELl0cCn+AXi6mzCOt7xc72M4rlcHgui/CJMzB4dBRQC
	HuQKF0PDDdYZoiFsyL5Id5QkQCe1UJbwPWHqZf+/CtSfmYu7xpjDOEHuA
X-Received: by 2002:a05:6a20:3942:b0:3b4:8fb2:a34b with SMTP id adf61e73a8af0-3b783dbd6d3mr17269420637.11.1781546158128;
        Mon, 15 Jun 2026 10:55:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:3942:b0:3b4:8fb2:a34b with SMTP id adf61e73a8af0-3b783dbd6d3mr17269388637.11.1781546157694;
        Mon, 15 Jun 2026 10:55:57 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm9099233a12.32.2026.06.15.10.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:55:57 -0700 (PDT)
Message-ID: <72318d39-3b71-50f4-a928-4600405e3c2c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:25:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/16] media: iris: Introduce interrupt_init as a
 vpu_op
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-4-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfX3XqfhAKdBkZ9
 yVsLJqELN9tDnYE0qdVqYC9Hh0/ODtrTbx5RXD7joI3zz9o0pzydSaGHY67/oDKc99+jPHRtbM1
 Egl34Td7uN2lxlx0vKHKqpy2EqEMnlo=
X-Proofpoint-GUID: z4kkNXTkveF7tSU6tMelOqUlbzGpGkUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MCBTYWx0ZWRfX9grD9C44eruP
 U8OYxOcnPAj9Ctnu//y1X1GPwmL3wNX2vn6ujWj2NwQ3dT/KuBbs/JVttSKQas+7WQwRWjcYF9f
 liMD05ogoSzXCDsi6MSBaDRZuyOQQusWqCRMM3naIDBip8qxc3TtdpnqgImmzEOAPt91+tfYeLz
 MX+uySpJgljRuQtHlTa0zgNK8992e1KrmThDicqaat1Q2ULm+57EYaqtLF91RH75/7VtCI1Vg0P
 GMiGcLpvjGBsUm2rd9prwXn+qnmX1z2vVp0T1RVhMwHVNCa0MxLScjViYzRaY64UEzraSZPv7b6
 roYUNxTub1jqbjaB4MFZmx3vjC+vKgJ22VSS6s2GQz3zJ99VN6qW3UHXCSO38IQUi+6SzG1KyzF
 Ahrc5nQh8a2iIStyRC4GRcY7r0izFeUZoQAZMnXPzXqrio31c3sNVu+bgLKk8Ghi2OMnjkGfWOd
 mEQ1w4ZYUfBBp/NTr+A==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a303caf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G49y4s14Wf6zNiCwfuMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: z4kkNXTkveF7tSU6tMelOqUlbzGpGkUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64922-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6FAA689016


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> The interrupt_init sequence is currently shared across all supported
> devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
>
> Move interrupt_init into a vpu_op to allow per-device customization.
>
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>  drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>  5 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 2dc121a3f5e8..dd2eeae0d9eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
>  	.calc_freq = iris_vpu2_calc_freq,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index dc02ced1b931..c3b760730c98 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
>  
>  const struct vpu_ops iris_vpu33_ops = {
> @@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
>  
>  const struct vpu_ops iris_vpu35_ops = {
> @@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> index f608a297d4a3..90ccdc0d2a07 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
> @@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu4x_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
> +	.interrupt_init = iris_vpu_interrupt_init,
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index a49113b0da23..375bcd923476 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -31,7 +31,7 @@
>  #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
>  #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
>  
> -static void iris_vpu_interrupt_init(struct iris_core *core)
> +void iris_vpu_interrupt_init(struct iris_core *core)
>  {
>  	u32 mask_val;
>  
> @@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
>  
>  	core->iris_platform_data->vpu_ops->set_preset_registers(core);
>  
> -	iris_vpu_interrupt_init(core);
> +	core->iris_platform_data->vpu_ops->interrupt_init(core);
>  	core->intr_status = 0;
>  	enable_irq(core->irq);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 21ed4c9bd5e3..9151545065cd 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -23,6 +23,7 @@ struct vpu_ops {
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  	int (*set_hwmode)(struct iris_core *core);
>  	void (*set_preset_registers)(struct iris_core *core);
> +	void (*interrupt_init)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);
> @@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
>  u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
>  
>  void iris_vpu_set_preset_registers(struct iris_core *core);
> +void iris_vpu_interrupt_init(struct iris_core *core);
>  
>  #endif

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


