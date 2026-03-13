Return-Path: <linux-media+bounces-55579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJUMNI+5s2nbaAAAu9opvQ
	(envelope-from <linux-media+bounces-55579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:15:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20827EAC6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 811F23095C01
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0CC36604A;
	Fri, 13 Mar 2026 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFj1r99q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG5YbovH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96183659EA
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385938; cv=none; b=YrRMvoa7Loi6JA5J4Nh8dRMvNZTq2TxM7tJ1LKVo3y3C9ihpLPGGWaca1fpmArICSpZmd762/VSQupSdm5ael/wHLAw7j5zgHohb2OwA6tg/ji7WKMiUVyRO0cew+lT/Dhs4bdyrAjaGXQ6f4nSpNzDOpkhtSFsE8zAF3Vzz6X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385938; c=relaxed/simple;
	bh=kU1LxKO+gfnLo23WuB077Uf1w2qv8sp3P9dLXYf5t54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoqbDLWEvJG0c6hYumpuDYx3H8k9RYaHTyIw/Yh1cSVgzcSxBhg5qYZJfj/sntGznfJrZJpLeRh52mr12Dib71DIMXioKHd2jn1l8dtGN8DkOTcQCm3F+Raoye+MpIpELzVuh3t9c5Q2S9F8bneVS8Bz2X5moNoDoiukSymOHak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFj1r99q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG5YbovH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdGA3229896
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=; b=DFj1r99qoE01/dcm
	gk8bA4KGCOmEHQ0kdk4qD34xDVtq6rJaO9vJRhlOBHfe5ZFVi6LMA+8JvCEAvcRx
	UKuCeEqQ2PrpSrE86GcTBEymu0eEWPUSuIEHRD4cwhO0iPPQkMoQ0PW/0UOeahsr
	Nxp1+jyzJf2iq1zKM88z1nhSf+BmHgRVb7oPSrx/IKDHCgqaqFluA0B0nismdtCK
	q4wj9WvPJ5JEdPHAcS2UrKNrwUw6bjYd5CCfxElqNrm95+uvvetxldtE9hAmFq8m
	oQvcEPTUTbo3fX/m/WCqggZEmEWFrKxx0ZdbT5EpHFPp0BFqnOUVo3vTuacgWITZ
	JhprCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7h02g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:12:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b8bb5211so6407288b3a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385936; x=1773990736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=;
        b=DG5YbovHWShibLi34cV5d1NHd5rx8sK+4VczvBcK6AVy3ek3UDl14m32jUhM5RNR3s
         eUm7IejJ1YvLxjU+KsOkwwtA/xY+oDbKhIFFcRHEMVMeOFkeW9jH0iWRCnQEjlF8SqJd
         FAIC8CI8q6ol6GeNLDcTALyRfW2K4bdnwQ6o/qF8ooQ/MAjWeaNEOXqQlYL3wMK9S3wK
         90NIYdgx19vtvCrtKFHDGmQsRK1I1FtPZro8PQK6zcPjv4HW51Q2pkABwdBZRo6ygGyM
         SMPfleveGR5A019MaVu+bHzUIJbct4nAWJv1p9Pan1DJMiM5JlhOqQ7sVa+uUTQVuvgr
         6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385936; x=1773990736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRAtWsYtD5D+8dvoXK8BBSDEPUqAsU5rlDMPdgdA3v0=;
        b=PbtoY2af5MNOMkLMhJxwFepZU95fonXRuvktabJEQkU/W/kIJyA21qhUjqSzbQEAeo
         WslUI0g4OQjC+KkUMGUrq3I8+/CZuB6FetWpuFCU9a7XCQJx+/t0lZOUkLC/bk8cPjRl
         2LHF3Lvq/m92PZqDUMbnjWaDheKLQybjhFQjQO0I421G8e2DawfsVUVBqOc81gmnbL1k
         jFReVDueDqLlx6XTEIveiwc1XZWpkSCbnbvKimZ6q+hUHjQl7xsozW1b76hEQl+zgYk1
         l3TYX64sPDW0E4L9le4OeY4IpHRV1Rx+dQxhPWHEhmO3aC7LCmYsx2FPAS62Y5XNfbzi
         mbmg==
X-Gm-Message-State: AOJu0YyCr54sqjnUfUDbe2mO1oa0u7/xI3mx0IEyZp0QY4AhzcbE8JPF
	kJK6rpMK9QxG5p//Rf19QkhinRiusF0wMOJ03Fj8I/oq99ZhcnqhqEvlTrfEE7hCJHip8tEHCge
	UzuDd2wsbQF20UU3IenzfRYXH/0GeiRSrwHIid8iwUgJHwgERw3ZPfKjS3MWmL2HI2g==
X-Gm-Gg: ATEYQzwCmm+xhLRptpAL1AxKV/ntJK9Q3Tm2dnj2Tb9/YU9r70/H7DiYIH4zeCm+Dsf
	JltLfCUN8c1YGE1cnOOJ1oAfw0iWWY9r4CaqEblqpR4QwKavtTD1YoPjvETHSwwG9NR7NijCYVt
	al1rQrUjeGzI0eUIwHLJ4nUFoyb7LgP7+TkoMDgYRRLQy41nt1M7SodTmimWDkmZbmC5JCNDaKw
	tpeMLcfw+MvI/Y8AlPjaXAQlaWSmFNbdIvLA78MbMa3UndL6Af6A4ji8bZOpKkcISHSim0sAu65
	FoBQFxJyUvYKLpGL3GDGjaISkrOe3k5Pun0fnYqMr8uK7+0fLWr7ac7aklpgmATyk1bPVCnxkpu
	HIW6lduIWxti5QMVNWPiHrGA3EHPMsl1PEYR/ZpEgxCqPRxtmxw3x
X-Received: by 2002:a05:6a00:37c1:b0:829:7d74:d0d1 with SMTP id d2e1a72fcca58-82a198ef50bmr1387656b3a.36.1773385936422;
        Fri, 13 Mar 2026 00:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:37c1:b0:829:7d74:d0d1 with SMTP id d2e1a72fcca58-82a198ef50bmr1387640b3a.36.1773385935961;
        Fri, 13 Mar 2026 00:12:15 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725be23sm4916467b3a.15.2026.03.13.00.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:12:15 -0700 (PDT)
Message-ID: <b1c005e9-f25e-234c-9435-a36388827a17@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:42:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-5-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-5-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8YJH0W00ICnB5f9OUmNrPu3bhzLN0Bte
X-Proofpoint-GUID: 8YJH0W00ICnB5f9OUmNrPu3bhzLN0Bte
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfXzSEaJ3nqI4H3
 qIajy7Im/FvoUALuoZFjsDi5tGCYgqJ1yO6eHuQBYVpIDOqduyC57NAps7IqOITAp6t+LQ41UTT
 QMIQGRYcZsHGNrfjNLc9ubZvQk2ExiCvQrW6YulJiwRxLxnhop2MkdFNndgDTDHDefGQsfYDxG8
 94wBjnOTWh18gehL4WWa7ZIb+TsSVJ1T+GurRs7oQWuVb9vIPk9Av7Dw27zICFW5wAPKmHwi0mr
 glEuMfufcvEE4AmJexbppWAdi1ttjgob4OGcv1CgNRr49hvuKfE9ujD5yU/jOQ2s6sQ9qf65mjB
 /KV7+q5XJsmDFy+QyErnAcqIi/uNii4CQ25q1RTOo8mYm2xa4ArHPELPwunccy/2vQ19fP3bqdh
 eVA70zU0dIxz0YNvHinEXUPH1mJ34tJM3oBaPhPq6/NCiktP70ZfdU8dFYoC4XbiaG1225bkDV0
 jawtiZ6/9hLxjZhDI6A==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3b8d1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Dm_so_nJLi03q6NOErUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55579-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F20827EAC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.h              |  3 +--
>  drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
>  drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
>  drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
>  drivers/media/platform/qcom/iris/iris_vpu_common.c        |  2 +-
>  14 files changed, 32 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index d10a03aa5685..1d9a435ee747 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -112,8 +112,7 @@ struct iris_core {
>  	u32					header_id;
>  	u32					packet_id;
>  	struct iris_core_power			power;
> -	const struct iris_hfi_command_ops	*hfi_ops;
> -	const struct iris_hfi_response_ops	*hfi_response_ops;
> +	const struct iris_hfi_sys_ops		*hfi_sys_ops;

Missing update in struct documentation.

After fixing, pls add
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

