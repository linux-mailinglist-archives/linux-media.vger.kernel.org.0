Return-Path: <linux-media+bounces-64129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zQYOIUBgJmp3VgIAu9opvQ
	(envelope-from <linux-media+bounces-64129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:25:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C86531B3
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:25:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OH1cg95S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AGnagfDE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64129-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64129-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0B393028B4C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6008386C2A;
	Mon,  8 Jun 2026 06:23:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB538657E
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 06:23:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899807; cv=none; b=gkyEVjtljBKqnWtLL3CnYLarj7lMIFYn+GjsjHfk8YjIas7GaoW2GLL8IEuBZqEIJmA48Rh1Kz8AMhDXxQaas7H4XbMxv2ZAGIntEmdQu1SpssRRxA5szOXoHOsY3iYybtPU9mQllZ0JuCinXt6Tudu2kuhfN4XNGBzpLy9RiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899807; c=relaxed/simple;
	bh=EZU5exzjs1+KqqtsEsGmX7mSPtLYm4GnJZeGD4kCY74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFTT7YGaPumc16X/cvt5byB+yH/H5im5eM0p9kUF6F4qYH0j5nimjPcRrtyqPFkTyXqw7yEqeO2V1VRDy2QLJggOCR2KKXP7dQJp/FUTH648j8QF4S+gtZtixRCpRzlkp+gHkrHr2UVL0/NntQQpPEiW57BrziKFoKStdMaexBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OH1cg95S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGnagfDE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F2Da1577353
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 06:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWO6l5rw6b1v7RcDXzC5IAuXWS2yZutJYOH1CAdjkLc=; b=OH1cg95SQyR/Ez5A
	Ql/t1NpRF89WH31m1zd9ZV3v4e3WEtwQWeEJlBL8a5BZy6Iu5gjkkgKto4/V+/1v
	Kx2nJ605qaAVr8dZxUf/epnH5lYl98w+ukHZgjVnvp9j8m3qlW5ST8683wa2kG0a
	ChMFIzlSpFXwlmmmVQFb33b0rrQU6XdKls4oC8oKVnNrpowjjQSbPybBNsDr/tEj
	BjT11onybOqCk5Eu/mBdKwi9U3FyRkYKLAqjCY5jFRsiFUnCCRVyKGNZsFy9Rgou
	gV8D12xF497osrZsa/ZK3k7jHlNYsunNJJ10oBGLltoOwHqDnKuYAHteuOrCkAZ8
	ZR7pLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1e4rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 06:23:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so77694115ad.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 23:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899805; x=1781504605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWO6l5rw6b1v7RcDXzC5IAuXWS2yZutJYOH1CAdjkLc=;
        b=AGnagfDEL35Pmy5CIOlMbIKfApmlgrfsr2wyCZ1XfI6t11s4FzGcRft4eVwFUt94rm
         2OVivXczQUuoO5GGkK7INgMcMFNPTHfudXrG6abkxg9mM7SoiAOl0XbpgkYIDppGLfxM
         1mpDWpp4Bpnogi2gP+cJDPyKDGqGLUBElqdmlLUx6sgoQG68IJRRoDf9LYzqF6/w3M4X
         iN7FEc57nUvRvcTU1jMMTy/kO4v9YtXnJcBc8ainfW5BguzS/3+CRP8ocYp6RncSHczR
         B+JBxD0IRyP6WKFM38GIcyWGcL54nITgZyjQROcxSyZ49E0aXdtwWcAvwbqgRNkjT8vf
         K9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899805; x=1781504605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWO6l5rw6b1v7RcDXzC5IAuXWS2yZutJYOH1CAdjkLc=;
        b=RcjY8DUZ5SESl2E6rBq2zlq4e5Tii8Ihq+84dogVPIqm/gWEHK95rBRLXYgdkr7yHB
         cuydlVgvpyNqZeNL4oMS9rZaK/uwbOqypHTFER5zIfpgb9eF/wcAIP7xsP7rroREtznM
         a90WIJkOaJZr3RXdIFoxvCPXR7a9wRvDBApsrIswff8pgRNXuJunVeLR0RdRdUzzT8DA
         EhikmmfCJT0eJgRrZQBf7dTDSQ+XgwpM6tKEz3YSSDnko8gawz1tJhlrGYFHHHQP5ek5
         oM7JsRCvNJzFhURkREG4iRfC0vetbQVR0YI1mlfWaFmmnhrhfX4C4V77OKoi0hcBFXvP
         MbBA==
X-Forwarded-Encrypted: i=1; AFNElJ8KgkPe8FRLLLBNCaaFjzjS5AGIJ6WjtQTw1kM39q9Hp2HNTjUigeYuX3C+EG16j+Y8sW4zHogSIp5gqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbU7I+uPQmu0yFcXAMcGX6xM7d7srFGeajEm7boy9L6+/GMDQ7
	xokUBgwLhF3v7eAO+fAALoEqYYQ9SeAUJjI8gMJCm0He/DYvvZXIoROguMkbmhrwjCqmmu4mQHm
	UqBXaDuQRBYwBvGdSwbF6NlTFgp420FE5SDG0yHW4FRA8Mstko8c7hPe26wsI1D6EIg==
X-Gm-Gg: Acq92OH7xllc19EgPMEXLqxfUHQ8OzM8OhWVE3CFf4crCJLSIA8ic/Et7K20LEov2U3
	Dt7JLQ1PiqavlYd/OUQfqgeZmeX1Y7mtdj9PqsCs7xVmXYr3+IDCZMOF6X6v4L1Sdla//oiLq5S
	9zuFG45xCFTUfWUw6afdBKED9ckvqAIdSWc/Vy9OCSDAeMUxbQDRSpOXeDYtk6ULuj5Qb7rltyh
	uLAqS2oQX1CFpQB1d4ybRYzTlhRq6LKtf5UyQAsxK4VlPSkeZ5rTLQlZ1exhbKMYWLL2rugDwWz
	LJgTUv2bJFH3/YCc2oMyrh23/4uCz0X9diopOao87V8fn5zR5Z0nJewts0JcsM1iPSNP7xmuptL
	7MK/hfysYfs4zaZ1dxBsW1AOakSOO08Tuyjt9/Self4/EuQqjDfdj3Ek7dWtmO9/z
X-Received: by 2002:a17:903:2348:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c233a4adcemr88782185ad.35.1780899804684;
        Sun, 07 Jun 2026 23:23:24 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c233a4adcemr88781865ad.35.1780899804120;
        Sun, 07 Jun 2026 23:23:24 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166495203sm161321325ad.70.2026.06.07.23.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:23:23 -0700 (PDT)
Message-ID: <bd701f9d-d54a-2898-3c7c-e2287a1be4d0@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:53:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: qcom: iris: cancel sys error work on driver
 removal
Content-Language: en-US
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604054708.42426-1-dennylin0707@gmail.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604054708.42426-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NiBTYWx0ZWRfX7quLg63bYU9p
 O8Nsi5afj+RcPPn5/2KpZk4eDsRrIDcwLFSDGTsku9wC+cK5hPNwqKI8q8gD6ocxy6lILBr1GfR
 XXU4gPKIDWSMv1oCj9rVNSceI2PZ3lKKvBTvByr4b5FEy7EJ1XRUWOVQ0UDN2xeyI9OGeZYMlW6
 vCUS8onMto38YvTqHPdRHXBlGSz2JuvoBN8lCIK2ymCHUBWkCwry1cnPQo1s2dZdVOvyDFQkLT8
 wVP8NTNmcajQcSullmDeFEu0V535MheetHIuq+oeh1MAvfEcPgyOThjLFAYjPNYk/yNQNrmY97a
 rPyD1FWU4gVicxSkq0iJpkgXqrsFxK+8K29xf/90v6gdkIKtrWcXLzbdLNc3cBpskdmCQ6/cfUv
 Pv6KpkWvYEkQNz/Pl+yZkdCOreiJa+Z2ALdB0nglSzeiGjbCOZPdd0ep7hEWIl6otuGTXNUaL9/
 VmwN7+gOQBwV4Po8y8Q==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265fdd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5JE-SqTOD2pdjX8B6gUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rRtdzhI8_YF_O8b5LCxb-CKHAgh93L2p
X-Proofpoint-GUID: rRtdzhI8_YF_O8b5LCxb-CKHAgh93L2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64129-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D28C86531B3


On 6/4/2026 11:17 AM, Hungyu Lin wrote:
> Cancel sys_error_handler before tearing down the driver.
>
> The delayed work may still be pending when iris_remove()
> runs. Since iris_core is allocated with devm_kzalloc(),
> allowing the work to execute after driver removal could
> result in accessing freed memory.
>
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..1a740542bc81 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -192,6 +192,8 @@ static void iris_remove(struct platform_device *pdev)
>  	if (!core)
>  		return;
>  
> +	cancel_delayed_work_sync(&core->sys_error_handler);
> +
>  	iris_core_deinit(core);
>  
>  	video_unregister_device(core->vdev_dec);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


