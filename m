Return-Path: <linux-media+bounces-56093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPlyAE1juWlsCwIAu9opvQ
	(envelope-from <linux-media+bounces-56093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:21:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431E2ABB62
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8230930B21AE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAF63E317D;
	Tue, 17 Mar 2026 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSXpdnY+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajzn2JvM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE133E316B
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756470; cv=none; b=kuy+4hBjoP+kO89UFklgujzcSuNR4Sr/zoKR4xoncOujPEh4Mq3wKASSmHOGUbPcnwMDbnCUcC3Iw6A45BtGw2s5rIdE0YCkB7REgxQyGZit0jrb5VkOudztx6zdt9FyHrHcM4WZ7+jdR+Mk/dkIbueJd1Wxy87TS5XlJWWHygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756470; c=relaxed/simple;
	bh=SjKY5rL+nXL4pYVVde5HOkkJzq5ZHB/znoBTF2Z5A3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jABZ1hpXkTFSn8qbjsNrzTYHXZR9f0u3adEFX6h+hBbGWNDYQAcAksXEGpVIUv21wYMQvLR7JOKl65RPEFy5b7QytIUYPXTkky3wvd8fiB7VwWQFdqcDK1rEsxXz6Tzx0MbVhjNiBFa86jIiObGsrah+5fPEC8Ky5XNolPWxaMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSXpdnY+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajzn2JvM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H93n6h2315159
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=; b=FSXpdnY+eL/9xWle
	/gm4urTVBVWJJKN1sPPPv3+VCdEoEVd3sQBUn2O7wjzrnTAPnsH2qLWmRqqXJ24M
	rFTgN1z9CrtlW1sjL2gGaYEB/kF+6vJ6WqLtKk68PqrWiGcfKjRQ2dt8BZ3xQ6ir
	mQ6xRzKduYlsOB8ScKYO1u/5NhgfCifIYQNG2Dkq2g/QZZ03g74OUVjeHxIpbk+Y
	NZKp40XcYpzXOWdUjRZTd9W+NEUv2o5IMPpmSo4JPe+1ch8V/cgJ3TmmqYdXXYGt
	/jIpo9vF7hjHGO3p5EKZWii/9mpJDI9IoAfVmDuqA79QZm+hHq/hX4Rl0lxb2w5h
	L9R3Eg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c600-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:07:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso7455411137.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756466; x=1774361266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=;
        b=Ajzn2JvMmyEg6wRSFr0+xagejCFMvgX/QPgjlcRwE+GTMggsIMB23BwMGk95OroUwi
         g5yFCs1p6VnReXGsfWzWFP0Jo+E/xH4IpK/o0t9T6g+5s6OpZ3Nio0ivWojMkbR8R7Rq
         tj8XVGfSPff6YsfcIc36e0uiXIcihcCbFztvQbmzCHvwyerhZ4Uea+TPhQUpNYop1zcz
         +ubnXmtAyKcasqvBlKryMmqsyZpOf6DFVmao94rCQGPI7u8V2R7g8NRhQjETqyRGYFte
         91FXMGf/blp/aHHUyC169R76WH7gJeDjDypVHUGgqb7tcYeR6BtDtbT8FEILzcMfH9Bo
         wC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756466; x=1774361266;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgfIYBWPJOjzoQOWNAMuyA9WL02GR4rPUnpaw9+fGZI=;
        b=dfUgMuaEzEi78ALqmCKget4pooQv3bXmh1cqoHGPxyEDUVMOKWjO5gc1fc4qGzMVLu
         03qliV4u2mUZJJ1FZ2NaRzcHfOwa8Ec89dOJf1BzXJNjt6JVg+QJRD0D1gWOZ8tcP2NR
         uwrAPfdmImSnQC13xo0vVimJuqcZJ+fU336W+FhALxz2UbdPvA7rG5jYfd+ar2NT12UY
         NbvjYHAPtA+9QbWL/ZJaW8ZIEBGJNuvTAuTycVkwLBHPm1ibubH59RGX4FPwC5DClS68
         qTpcjkGWJzG+px2Ha0k9CqteDlAV6Ii6AyAZVvrwnNBzJVtKHTNEutOl5yPDpHbNRSHH
         GMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvD66fpgQsTT/NrTpELNX8+GZj9/eoGzu6hvjTkiwgea45om6S1upEZq9rZ65f6aUtGg/byRKyMx+EcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTENyWgqrIg20U2LNVzj0Uwu+mViOa0LfNRA1O26NT2opEQv33
	GwaEFUyb5EErBGMy0RiJkUTB1nMbRqUEYMdcCQosKddN5ctkw917DZ/K2COp0KFJY0W6vUpYzb0
	KPkNwejT8IBpp1AFPYEbPfb9SfsvU1PnJAeh7ERV9m+vS5Mc+wyhb7M9l2exLnrqbxGwOasduKg
	==
X-Gm-Gg: ATEYQzxg22loMDeTFWrJGBH0c9bapWIL/xWPGhKfYQB+JLtKgOIvTLRUdkACKFOwKty
	/1MI8l7/e7S2y3NVB6bS0OUbWvZlnumM3DN7OGUNrFuZedFIyJggNV/PU71lfVn4sA9H51SNzbH
	VOsXNmfmYFPZLn9SfsjCuOtY4y1DjZLT1J5F4qFV4zxsKkaYj2DMPlmHhor0gImsKu3etV4P27b
	LiqlIm7V0HKV+fudJj5M1C4Zej1TqfVcI5WpMeAcVeScdC5k/gdTdgLkCp3W189siE1Lk6/MSy2
	Cw6/XmYDEuX45XYG1rJhOtFsnSFtk1fLSwYa5oUlQTyNV6h9rvJBTyXdfRO/0BYUxfVVTFPztUl
	3Bx8K7UVnh/Bnrk+HbNX/jNczyAgcxoTE8sr+KCojZkJJm7rWU778TSN9zc4kUQcU3D+myVpq/y
	L5VTvIr5Lj2eftZJWsW+eRNX0NpctdE7U5V89JFr7MoeAwlt13lts+oT2eIm48Fr33aawzHiN/D
	hAdhsQAyZx3QT+B
X-Received: by 2002:a05:6102:442b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-6020e585dbdmr5264142137.22.1773756466188;
        Tue, 17 Mar 2026 07:07:46 -0700 (PDT)
X-Received: by 2002:a05:6102:442b:b0:5ff:a16b:93f0 with SMTP id ada2fe7eead31-6020e585dbdmr5264100137.22.1773756465573;
        Tue, 17 Mar 2026 07:07:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b85f3bsm6577959a12.25.2026.03.17.07.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:07:44 -0700 (PDT)
Message-ID: <459993ae-c94a-4092-b81e-dc07c7011397@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 1/1] platform: int3472: Drop redundant initialisation to 0
 and NULL
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linusw@kernel.org,
        brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
        ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
        sre@kernel.org, hao.yao@intel.com, jimmy.su@intel.com,
        miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260317131040.215119-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j5pE3sZblcpiDK_Vw6HewlQKY-AEyERw
X-Proofpoint-GUID: j5pE3sZblcpiDK_Vw6HewlQKY-AEyERw
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b96033 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=z3Uast6Rtm7B2PKYKTAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNSBTYWx0ZWRfX2ftlQ039rV2I
 1p4vWOSR4ET29xIFyf+Pjx0DomismyW/QHfGSpo8tyi48fYNZk1oAj8Y0axiqQOtq/0poHcynMw
 caJpcQ2WvJYZViIF9ylQY+DsPmZ8HeYrEcH5jT8a00aEioiuaT8H8NFiwqF85PKGX3VQF/oERGO
 cpeRDLwGFoEo8VuCU05cfALgFKWv82MG2aOdLxiH64w7dMh/7I3jt0d2374qTzF5wAgBzzRGyIg
 9f9u1G8Z5u8+3JE/TONcrsxFhD2MhMITJgJXmF9y0q7IhfGINAyapKFynpPNkcICceeqWMpy2yh
 GFE4PlN5llBXo7lknNXkuWZIHnx+dJ1fnWQifGcduCOvahYy07Llmr6nEXf4cuUnedEg6gXxqhA
 HBz4D29iNtda9thXY/68mT81DKA9WzCs2BqR/5cg5cSsAn/VXcci3Q4/arMyiMpIpd0XVEYRejf
 jRVCs9v7OGZ/OpV2RnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56093-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8431E2ABB62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17-Mar-26 14:10, Sakari Ailus wrote:
> A few fields in structs containing regulator initialisation data for Dell
> laptops are initialised to 0 and NULL. Drop the explicit initialisation as
> redundant.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 6bec5a910396..c1ddbf9a82c0 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -151,8 +151,6 @@ static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data =
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
> @@ -162,8 +160,6 @@ static const struct regulator_init_data dell_7212_tps68470_ana_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
> @@ -173,8 +169,6 @@ static const struct regulator_init_data dell_7212_tps68470_vcm_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
> @@ -184,8 +178,6 @@ static const struct regulator_init_data dell_7212_tps68470_vio_reg_init_data = {
>  		.apply_uV = 1,
>  		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
>  	},
> -	.num_consumer_supplies = 0,
> -	.consumer_supplies = NULL,
>  };
>  
>  static const struct regulator_init_data dell_7212_tps68470_vsio_reg_init_data = {


