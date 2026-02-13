Return-Path: <linux-media+bounces-52711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL3NNqbxjmk5GAEAu9opvQ
	(envelope-from <linux-media+bounces-52711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:40:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9600134974
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9369E30107A3
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F3534DB5C;
	Fri, 13 Feb 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwz+Ec1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DU7bKN5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135434D3B5
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975646; cv=none; b=ZvlK07WQVvfJwoz2S5UGNTOJKmMNBzCHHOhvOuC/tervGKivD2udzlOX+ZimhuGLAQANojqaVij9Y6zOBM95hma0+k5nqndq5p+umUi07fSVLxGKna1NZYuL9QR0soFokLPTdpa/3NpDKpwBXz709DlVJTR8Rr+VgjJh5Ujhn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975646; c=relaxed/simple;
	bh=U7P3olTVkeLfckuqtGg3Ez5sD1mEL8bWEzzRb2X9380=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rERTxyOJNu+2Q+AurN9hwXJoZhHCWMKQ/BiZTg/a/G0ZkB51eGvKaFj+sqMiUkwqrXs3TgZGX3FIdM8gHs+Rf44x3Vp42MSRZBxh+sj4p1jc1DsoDHOYWrgK8+gdw9spP5CTaoShdOBSrKy8h2RkE6KbQFLsk6oRZXRjeI3gciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dwz+Ec1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DU7bKN5t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7ZpcX652733
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/lfOtspcFXBYF/xLcKmtVed+E+KcHC6N491qAFBLng=; b=Dwz+Ec1shTYtQITA
	ToovLj98oZarfPQUb5fZIrOu6V3eV3q2NlN//7lGN/Rs76wZPJ5GZ/KXp5urIXEa
	5jqbHFfi1HSYmUGM8XelNyiYAY2BFzGcOKKlLY/GgP0GPUJ4q2TMENcCQ3p+hu1L
	OLNQVgnpsU7fkw6pC4fCmycWJb1sh8G3DuebOQFbU4UjV6Ceupvnvrpd+lCzd07Q
	cwzJP/fpmyQAwImGf3eVJtcXQkRge7OhWiXLPLqgnEwu+NH6EGkhdoWxqwBKrs0Z
	FLQmtk6+Piu2FrbL/dAsxTleHSE6jwQL0EeJmLfAYmBWKAVINU6/M6bGk7CneC/K
	jc216A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbkv5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 09:40:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c629a3276e9so2158996a12.2
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770975643; x=1771580443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/lfOtspcFXBYF/xLcKmtVed+E+KcHC6N491qAFBLng=;
        b=DU7bKN5tcErWUevkl3U1Mh3dK5QCR9nWFB858M4Tlvd1YWkgxV8HU/rjouUa2ykjsP
         vOOkzHkq0djzqeehwh0DkDEwiOoaIldzggnnJEjManTEzd/km8bJiv4YKeNXP8H5NFqg
         QFZVUJuZxAYDL0TJeTPgB4vobAOu2fKNYytbqICTt5exyZiPsSSpu7p9zDj9eNoGGXcj
         G/CIREOYAPpp++dG49URty3OMb2kme0Tf4hKBhCbt3avPjwFGt9f48nP3GamgiO7/StY
         lQT9zqFEHxX0rZEQvlwBdXdmtxAH6MWhs3kF+oe915lDK3GUxKerwe1Xf+496eLcG3l9
         9VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975643; x=1771580443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/lfOtspcFXBYF/xLcKmtVed+E+KcHC6N491qAFBLng=;
        b=SJSyeCYzP3zg321I/GuWwsW0RsoMHadZWQ/4g9Vu/JpN2WsbdUWhhFG2wrxGDsVe+N
         OjOfTyrOT2yAQfJb3PFwnO1Uhk5txzJdPQxrAWFI3xcyqTCaGUE71KUb3PU4ZUmB+dCl
         4pl/R24W9i8qk4Agvz2Unn7GZvP1Jcvdmls2wscpAZUblf0C/OW3pRn71h/mzHAWS7bF
         Mj7ra4DdmEaAvmcTG7En1gbxWHM4Zpbf+RiHcgz4OMhourXw1cb+Snx4mh7+pBpa1bdG
         atZf92yOt5ZyQnDytAP1BNT9YHRGz8fCua9yEydAvx53X5tM3/daBBvoXVSWy0kHLZ8S
         V2hA==
X-Forwarded-Encrypted: i=1; AJvYcCXhB4+vYNtOsACm0jDx0E6nVpDR41+V+2kVWqpaqaitta70sR8IHmtjjO2ea5/nQ+5x3DM3JrjLw9XV5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKFTxsZ3u3EbWZp1re71112ueUHf18mZ1nKXeGVgwzIWmvSvaQ
	nYNYmr+1KTu/9oaN9SFo46DEiLgGZRRfMYW8X4CjZM7lXTl/AyFoEhmrRLdEqsaQIDmY+N3Ywi0
	gZyH0NtMv0+lSW/J/gyPRJmWbjItv0Ls2XVsBdT9Fw60Cwa852m/MK+h1pgdrBkxx3Q==
X-Gm-Gg: AZuq6aJL+3ZM/OALu8iIB4OkpqXtF4YE2EIi4QaEsMht8snBtBumXE/0QNWjnVZRu+V
	0fjoy4K/ZceNegZn86TikJFj9zDmYa0df78ixDiSK3jbHKaxNKq+d90Z1Hnb01RFzLOeK2+sK0A
	HO8pdaRO9Gs5Pjsg7Fe6oZh0CsEiVrKGK9jcAwL9GSFMHrmAzDpf7nnTeen2j2IoFb2cEWNFjXa
	aQdem3tfG8K88ukhMbk4a0f//NnIAiUdWE+A0Vy2igKAkmQNn7PliIMKieRnxtiTQqytE1e9yve
	P36oyTsHWsl8+HS9MyqqI0DeTtApa/yKL3y9FpeI/XayYY4LfnRi2JAuzb1ifbAqSXWfJyUtS2b
	vxpO2r1w+cyLOaMeQr1mI2jnrv4o6onEKOx/SK9d28VWCvTkyOvyJ4g==
X-Received: by 2002:a05:6a21:a345:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-3946c9252a8mr1267463637.70.1770975642900;
        Fri, 13 Feb 2026 01:40:42 -0800 (PST)
X-Received: by 2002:a05:6a21:a345:b0:38d:edd4:2fc6 with SMTP id adf61e73a8af0-3946c9252a8mr1267441637.70.1770975642488;
        Fri, 13 Feb 2026 01:40:42 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a4316fsm2530543b3a.23.2026.02.13.01.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 01:40:42 -0800 (PST)
Message-ID: <e1c14c7b-0447-203e-33fb-97f09b38b82e@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 15:10:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: Fix dma_free_attrs() size in
 iris_hfi_queues_init()
Content-Language: en-US
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260213091330.23431-2-fourier.thomas@gmail.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260213091330.23431-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NCBTYWx0ZWRfX0aH323JJGlxn
 toJwCIram4MShfsJq44/y8qaOpII0WRK2Z40AU//6O6siqtKT9+gbQT9jDVVdeh0v15Ja1XtRD6
 3p8UKyy1Bco8xUwLlzZvnbnKDtQnq+XoWnvxJ7CxMYSWtavcGyPzo5swZ32ejG4p3/lHiACCwoH
 sQRrNd+Le3xtxlEk4b7SE0+YeGwE9jt6pFmHhmLAdIqEfIbMOQvcDETzqivs/XIRVgzLhqoy2As
 1XWPUkXBtD1UWNE5PgDQ1T+aWYsZnPRN/cBOH12wpbW7CSvnjvHqrGFvDZYv0QG1sSrjMtnSCLS
 UBJ4bOZ0N4xb4d7yuSbM9tGik4tipERLm8PPNOSqKYksXUMSyN1I3ha758zgmpn5fQdZFmadgDF
 UhQuzcwN6eDue9uqa7TO0JssKnmfdvzBHPwgbu+9VKvQYR48LQTpQzU9fipLf8cxPZ8hFluwsGu
 dfE64Lekc9uV6RA2ITw==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698ef19b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=VDDfqcjMpRzOalc4LhIaOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jz17cmUFc4N99GX7AB4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 01_z1Dnuv8E6BT9Qv4SsTrO86Ihqy7Yr
X-Proofpoint-ORIG-GUID: 01_z1Dnuv8E6BT9Qv4SsTrO86Ihqy7Yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-52711-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9600134974
X-Rspamd-Action: no action



On 2/13/2026 2:43 PM, Thomas Fourier wrote:
> The core->iface_q_table_vaddr buffer is alloc'd with size queue_size
> but freed with sizeof(*q_tbl_hdr) which is different.
> 
> Change the dma_free_attrs() size.
> 
> Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index b3ed06297953..bf6db23b53e2 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -263,7 +263,7 @@ int iris_hfi_queues_init(struct iris_core *core)
>  					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>  	if (!core->sfr_vaddr) {
>  		dev_err(core->dev, "sfr alloc and map failed\n");
> -		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
> +		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
>  			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>  		return -ENOMEM;
>  	}

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

