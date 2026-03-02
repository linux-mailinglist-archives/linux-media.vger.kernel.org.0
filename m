Return-Path: <linux-media+bounces-54081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNECNGtspWk4AgYAu9opvQ
	(envelope-from <linux-media+bounces-54081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:54:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C81D6EE4
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D0483033D15
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65EF35A938;
	Mon,  2 Mar 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV7mNZx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGoezZ3L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C83590A4
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448697; cv=none; b=TqgUCBCL5+XT7MhuGVvDAL0rtz7nyLchBT3edEjw4jV4YvKJjMK1ptmzIgpsh1EIlc91Aoa3g3+cfP9ByO5S+HodBWMWeNixfI2vWXC/oaSekU19DM/It2Rj/Nm9AB1acIjv7vsCsdDF69KItVO7i10vcTSPg2sD4rtRsnhfAW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448697; c=relaxed/simple;
	bh=YbNlWU+LXhiLPh5IlWgzvOAEn7YydIRKlxSLyxLijnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djT/T227InkOmIWyxk81IbV6QAcMZAow5BinyrixCHl96GS7NJjaU+14IN50RWBwokpa90fMf56liSCoxVClVj6EH2GTSFh7OJSEImynjI68y9zoE6pHubjxX5pa4vXc0CU8T9hAKFEk5onD9TxZVqHy3+bal+xQYNEzzucFR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV7mNZx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGoezZ3L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K36M782736
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=; b=IV7mNZx8ZwPpAmEQ
	KZs1C0/AD815DphLF2Dh7vF8sAHMuATbAuVvMJ+KycMgH2BOxzUKgPDKWtZ4nQrg
	+YbZmMk0b2jfDh25pJkvrkiOo7HZUcMKpZvqD8v8Xz1X7fnSGZ7TW79K9WMPdKLH
	tsLzbUF36cjfotbi+WPAWOXqBEYmkiKlpanH62ij7rR9W/mgkPx4SvWfb/XEOdOv
	Ia32RVzaMDniUDr8nl4MUDX4TGxZgZob0c/5fuH85/yRCe++lDtdvGaCZX/zMUUo
	/LaxYttlIERRBM/K6IUszAiK9BpLLdaq6VmzB27Q++Rf7kOXGUUnHlRLs0JhJIQL
	P4Rwzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00auk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:51:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso21843440a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772448694; x=1773053494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=;
        b=WGoezZ3LESzRqDvHySCPaQG734YESMYUxXG33W1qz3w39jnwwbou3ppJjuEVoRPUAA
         GQdoC+Z86upN10N9hZ36xO8P5skWsmqovVHFXaZiQc/o2Ui7KTYLAANVCbEBEmSBYR6z
         wX59+f5z5b+yenxB4vvLi9pEL0aSHny/vHguEsVyVdqBrv8Or22eBO6Kusz8MXYWAajv
         shnM86BDATSflrVpp89jE2Ks79bIDiqRj/Nibl7SGokCS5oSFFIEDXwo2hjS/pYGCb2t
         hJgDV1SJ9nu7TbXZ8Tt15qKSzETgQIcqJvkDeSN2+XA5/QWN/6C7zY8amps9okwPKcGt
         u1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448694; x=1773053494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMdp7LO8XhUCSDsvFwoC4/b9hnTA/D9rEddSM6zJVvs=;
        b=lo1uvDifA59+O8frf3d/tcRam3XGjbQTf6N9CrFDzQG3TqI66J0rfywtdJgMCb6hSX
         C99Qg8CxJK94jkieUHXRu68mm64P9tKZ1a0AirJ4Yc3hLwA2IVRPPSlubXJ95I6IgwvD
         PMyK1nTZZeALTBCGfeYD7wdkpO9YSArOC0bT8Usu7j8l25CGUYo6tejY91x3oqkvE6oq
         h/l3cxjGYMi0RV9GljlJWHUXXDHxrzNM95ssyYX0snqjKhX8935VIUOjGpKfYs0b3vW8
         wu7KuwvqTX/J3FwaSLgS41wEB2cb8quZ8Og8X8oTzkMqRe6l63s+7oLxZC3lpNeaI0Ek
         /5rA==
X-Forwarded-Encrypted: i=1; AJvYcCUMNtiDyhqjBisdWwPvlL1xwxjZHjuKJlA1zg9NPeNUKCWbYikvogbB4+4AaC8fgWjwxRfWyFX77vCZgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUG9lbc47/ZghXuHvawFvGS07DPtFF9wk8DTyyCFAs3lrk4zo
	X6Ekv1DRHBprsUcVGCmtYlYG1S/87FSnDXh2WCKMUHQgoo7UWtDIqmFcay33IzBm/Vuh9cf3+sQ
	ha4Ne1Bu0xjicbcjCh03ST9ZVuAC0gV3GjbPr7bkIW5n4Cubqw8ZQJeWD0N2/dUuAqw==
X-Gm-Gg: ATEYQzyQS3Q+lEFsy+eKQ18nzuzkWWRLahO7dXylpTN9qJP8X4iTrgxrcPW/oL/3A/u
	rQwdZY5oxzdALtMhiUkYngxBpRQ1lMEdELBDYQTvNiQ9MmigG5fsOOxbtghFXxVLg/3/JyHpSbn
	XUXWy7W5uZEzBKbClnJStNbNoYM3mcM4ut2ErOW3G/SzBGgMEV759hcF6x0g/J9x9wsf+WuboUh
	NnegBfjD7ZajGgTrXl/sLRp7w9G9Cen0ihxcRd3N+yRdf6NV9ktYfh8ogKL2anjIBPUxq7Zaii8
	CNkfchZMDQdz3ns6frvGOoc80n8wT+l7OUfHITBuAVQPa88GV6f/QxmIFdd32rfDvWIvbiyB9tz
	Q6TSqOhOuyFCGWOrZ7FrB4t3x7yjLazGSkuSxmhN9rg7OhRN7axMFYA==
X-Received: by 2002:a05:6a00:1c8e:b0:823:1c3e:95cf with SMTP id d2e1a72fcca58-8274d9b4f5amr10137871b3a.18.1772448694171;
        Mon, 02 Mar 2026 02:51:34 -0800 (PST)
X-Received: by 2002:a05:6a00:1c8e:b0:823:1c3e:95cf with SMTP id d2e1a72fcca58-8274d9b4f5amr10137856b3a.18.1772448693727;
        Mon, 02 Mar 2026 02:51:33 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05cbe6sm12948221b3a.59.2026.03.02.02.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:51:33 -0800 (PST)
Message-ID: <7c1cd1ef-6d4c-c4c3-9f2d-02f28fdd82fe@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:21:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: venus: fix QCOM_MDT_LOADER dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
        Robert Foss <rfoss@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216121525.2311140-1-arnd@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260216121525.2311140-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a56bb7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TxWHU2ARYOkZREXtdToA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4OCBTYWx0ZWRfX654PyLl7Rhbh
 Mhgvvrbmh0ZFkYCj+Awt4lh/1SpSYsJoJXzaNbj4xJJHRHQyUUIsH6pxwP6BD4uAGrbAoZPy076
 Lkq0n0Oe1ZitcB65Dd7jZZgsvz5/Lt9r8A8sMxoVOzaFTARWHHkk5LCRXgMl7DcFKJ912lxKJnn
 ffVRwO5V6a9dMm3hhFu+gWJlinHvbjDag+lsRHKbttBEY8FV8LP84/m4QQPER+fgm7kGJRyvUk9
 6q0yG+4vQZxq2S4vFINKvOSHFqXmCKrZOf6sSmMPtCwQhx+r3EbHz4On7PTuQiWuk+l1ojGxAUl
 5p/39dvnNcnM8N2ExVwUE/D9mlHjq2krxUe7+riOYOzoNtFYKwt/ejjfG4l5DM84SSNTCRvQe17
 tBOJIHS1zwdwBVAruqhkY4VH4NFnCLNhgExIfCSPhxRp4MYXbUs4pUNVe+D8c23LPpAtgRwYh3o
 OqJpB3EkU1buYcE3DPA==
X-Proofpoint-GUID: YoGQpt3KBeBEJ_pTEt9rN1ZQJXaPekiQ
X-Proofpoint-ORIG-GUID: YoGQpt3KBeBEJ_pTEt9rN1ZQJXaPekiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-54081-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F0C81D6EE4
X-Rspamd-Action: no action



On 2/16/2026 5:45 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_VENUS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/venus/firmware.o: in function `venus_boot':
> firmware.c:(.text+0x1e3): undefined reference to `qcom_mdt_get_size'
> firmware.c:(.text+0x25a): undefined reference to `qcom_mdt_load'
> firmware.c:(.text+0x272): undefined reference to `qcom_mdt_load_no_init'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM,
> same as for the similar IRIS driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> See https://patchwork.linuxtv.org/project/linux-media/patch/20260205145623.1360105-1-arnd@kernel.org/
> for the corresponding iris patch I sent earlier
> ---
>  drivers/media/platform/qcom/venus/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index 164491c5c374..075e08eaceda 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -6,7 +6,7 @@ config VIDEO_QCOM_VENUS
>  	depends on ZONE_DMA
>  	select DMA_MASK_31 # technically 0xdfffffff
>  	select OF_DYNAMIC if ARCH_QCOM
> -	select QCOM_MDT_LOADER if ARCH_QCOM
> +	select QCOM_MDT_LOADER
>  	select QCOM_SCM
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

