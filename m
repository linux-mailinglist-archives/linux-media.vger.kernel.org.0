Return-Path: <linux-media+bounces-64131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id onzwFlphJmqiVgIAu9opvQ
	(envelope-from <linux-media+bounces-64131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:29:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD03653211
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E53qr/Va";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fgrU9uxB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64131-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64131-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6E44300E3E4
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF02138B124;
	Mon,  8 Jun 2026 06:29:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AD38AC90
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 06:29:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900170; cv=none; b=DB6vpyzekJ8XTLfeUM9bPDE5CUgxbjFLNZQuEmjJtNyVGvh544Yjdjz7ocfr6bdamuQfY0GHW6MWbAcbK48XwENKo/Da2l9flRfSJE8ErogLLAQBIj6KnvzDF66TnP8dz+FDYpPbhn9KiLdp/yUcTnpsXVkawe9GtINA/STnWJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900170; c=relaxed/simple;
	bh=Ne/wLNYEy8/uHyUaSwVZbmOO8k4n3YkLMmQLGm+/5IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUszzmN38zHJNI8ZbKf5bJWbNqn+nzjNLA+XanoDTzlHINvdRPq3+GPJsIbkoLfXyTwPcLEnDs6X2UhA/NiGAOV9cjcKOfsB9f9iM/sldyftc9sKOeZW+0DKTxZ1Zy01dlMYIOIj/Ez1M06suwL4lsBqyropeJEH2KbRgUBHk7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E53qr/Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgrU9uxB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkE82347125
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 06:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OZFMIAwE4JNyz//rZflVX4cjyjalWp8jCRtIDAdq2A=; b=E53qr/VaokkbaRQf
	Kno1hi6HWMkaMwxug9PJpuIYa05CKL8rMksO4ZrXSCQtO+09KqkEMEFvf2mEelXg
	sow8Jl8sNnZWdJXBsK2lVspKl58uvAwXLcauvdAir2D62VspSOZPFySwgrt/fOQX
	2u32Uo6gJYbsw8G0W6lq2y1m+4NBfbSdqEOdhUoCKp1ibUqBTGtl9ZwGSqhpVtik
	5rdIWDJw2na7bLJ7etec1nSbf4/oMKUhxKL1yo9NEzW8IUFgp1ZylqhpsWla4AC2
	3KIsEY7xruzMeADybc+kjPcy42bXrAVSJgDxlXP1YSzaS7CcECI4KypzCILU7BlZ
	sYBk9g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrej9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 06:29:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423efdbe6fso2556127b3a.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 23:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900166; x=1781504966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8OZFMIAwE4JNyz//rZflVX4cjyjalWp8jCRtIDAdq2A=;
        b=fgrU9uxB5vNjFrGJfXsHwarm+Hm3tNyWqL6QTgee3rOqXcDLop/Cpw8WnzTfBG33AQ
         4wgmgRjjzyN6x8Tgm2evPQ65FiIUtOaXOzaPZN2qhJ9TUmRsociYg/6DNDuFMQN7u6UM
         PrfUATYT/WS1hDHQNsWN9uIAGZg0+F4gqfweuvPhgr43p57B09R4pjcTKITycTEMm9Nw
         +KDD7k+LWmet6KQYa6lnSLGLxnrulVnpK4PQi5hHbBUzaXuTXVK/djBI763S24OvmIT1
         Q4+vygqR9sD//jnQ7u8bzmho4dQFPSkBUgWSQB5n0eWQy18yX6k6dkbrX7Ge4VfwD1DM
         aVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900166; x=1781504966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OZFMIAwE4JNyz//rZflVX4cjyjalWp8jCRtIDAdq2A=;
        b=iTeELFsjIVQ/NBRbS5n1DIiWCVkpR+auPDRp8G4HiA+98cuxxQ29UB3NTWV8MMDyDB
         wcLFOuMc1a92F54dqkq1Xiur346m3nc6+ziNcNZGbfPPu3HrRx4NHpmT/B4gjas8aOb5
         ZmUQe2i8LibnE4HuX9bJUN4h5SY0uhxQRPVpNOlFU5/UfYLgTHRUzA7aHXvJFLn2tes0
         /OzsaxA9Wsba7+upUTWsTV5KyBDbGkWAiehxpU0atUUderFbswML3Cixn6Rv2zk3x+7C
         ST92sVn/Ch6WcuNK6E87nXhOeWQNbvCqC7fl4/3+hOF2SrZ5ilEKIk+pV1wed5hlYDR3
         3DEg==
X-Forwarded-Encrypted: i=1; AFNElJ+ywsIYhalnvjIH8y64U55W3l5nAbWfAbbvq/ZW/sOXXozNReoC4lwEIJtHO+feaY1xCbNm08n8M7kHgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4xI3QZR7j65UE/NwQJ53qivWQR+18ydFvKTa7M3fUcySrzIB
	kjgf4eoXv5mP5ICPserAzZK1F46LIeYgQIyxOy4gtGJLTcPunsEqnp924WzyUNXXBGuxC9/DdnE
	qh2Us5HdrA07h5I9mCtmkRy97+fiZBbXrathlLiPQjvCD1MnsGbH95rhR8kniu9IlPQ==
X-Gm-Gg: Acq92OFWTJ68amwxxeVHG689kxnZOnuQGf6KAmUO8CHb40n96Ol8RRp7GB1cKHRBOMk
	iLJvwj3Vuv/19COx/a4OnQraBV6KqWxEXaKYWeNXyuWNnNnS0gaLiUc67tqFiXtk49QU1bjNGeB
	VUyRXxrtqEiqiNOC6x4o+zNUYHiL9w20yXTJd2BY9eJMGLw0mK6T4NKYwnhZL9jgpRl2uEahZ/q
	VYZndqRGvI71FC6VFP0cfDhgGiERPGTHS0aoksDxsePVq+JxoOmzzkdzho/heO+g9djJU/5loZ6
	PA9yGxpbTAu1j6a9X3Vxgf80jg0aAX9tWg8A4poJ1tVfoK+lLPAT+LsSglopGR3MpAvPcqC4/X0
	s3G1MimmENE3sDMPzxy1lvT6O5Uag2gOzF89UnduQkBX3VlUAyKLJj41/n55y91VG
X-Received: by 2002:a05:6a00:338c:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-842b104d70dmr14705123b3a.35.1780900166540;
        Sun, 07 Jun 2026 23:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:338c:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-842b104d70dmr14705088b3a.35.1780900165954;
        Sun, 07 Jun 2026 23:29:25 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm19124227b3a.17.2026.06.07.23.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:29:25 -0700 (PDT)
Message-ID: <99c109a5-26f4-4bf4-bf3e-941877ce9d0b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:59:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] media: qcom: iris: rollback OPP vote on PM resume
 failure
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
        stefan.schmidt@linaro.org
References: <20260607232841.79275-1-dennylin0707@gmail.com>
 <20260607232841.79275-3-dennylin0707@gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260607232841.79275-3-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NiBTYWx0ZWRfXx4mBoT0IvZMh
 /68K5EVbPXJam4hIzqc1PUkkrByt84zY5aEghLW6imwCPhxJ8plBRCRQgWMmqhlnqf30Zxfjkrh
 pGFzxB8Bgt9IB5w/UGplZoGOG6EUMI5to6kJ5RUgWcFc2MoPUqTRcQ+6fupRYyp7T9b517/nJ2b
 Inz4yzykYnOGMnwIXnOYnmkVevt6ViBdyAdPX8SA75TsY31tr/cSP6sDcGNnlnENtCMTJZiOQdh
 3wqgi3TOECx1bB+XyLu5X76r2iF4gP1rqCWOm7H8f4Dg8IMYyrgkgVUzg9Hpbb/FfoV+2iJcFy8
 knsJpEhos/VAjSyMoNka+yeERyAd+LjXNEEn6AJJUankctYQ2fFX+aIjLgzS0cergdxuJluW8/b
 jhwiR+kW218T0/QMj118WHBCtIHEcJ6Xggsvr8pUkA1bj/CEugeU0YjRnRHbCsWSaWwsk0XnfcO
 d+hJT/z3MGjARr0bt9w==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a266147 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=jtYqVK3DyQQmX1DrNcUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4soUFFFmgKU3sbBa1p3PFB_sR-puwgGZ
X-Proofpoint-GUID: 4soUFFFmgKU3sbBa1p3PFB_sR-puwgGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64131-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFD03653211


On 6/8/2026 4:58 AM, Hungyu Lin wrote:
> Rollback the maximum OPP vote when
> pm_runtime_resume_and_get() fails in
> iris_enable_power_domains().
>
> Use a standard rollback path to release the OPP vote when
> power domain enablement does not complete successfully.
>
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v4:
> - Addressed Dmitry Baryshkov's review comment.
> - Reworked the error handling path to use a standard goto-based
>   rollback flow.
> - Roll back the OPP vote from a dedicated error label when
>   pm_runtime_resume_and_get() fails.
>
>  drivers/media/platform/qcom/iris/iris_resources.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index f5e3341e1430..9059cbe8fe5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -80,9 +80,13 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  
>  	ret = pm_runtime_resume_and_get(pd_dev);
>  	if (ret)
> -		return ret;
> +		goto err_opp;
>  
>  	return 0;
> +
> +err_opp:
> +	iris_opp_set_rate(core->dev, 0);
> +	return ret;

Please add a blank line between iris_opp_set_rate(core->dev, 0); and
return ret; to match the coding style used elsewhere in the driver at
end of the function.

>  }
>  
>  int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)

