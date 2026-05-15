Return-Path: <linux-media+bounces-61642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGI4EjDwBmofpAIAu9opvQ
	(envelope-from <linux-media+bounces-61642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:06:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B454D03F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB16D317E3BA
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C043343CEE4;
	Fri, 15 May 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmwZbB73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHuEgUjh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E043C067
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837941; cv=none; b=YuWwA+uVy30vh4N4B53RGvX9vF09K/Ndr97Szxf+6U9+NxwPswhlaxlcbk2c8v4tw7KKO3IyNrpFtVCSto1ZFe4xsbUyMD+LPNnQ7ilpGCuegJ6mVW1dkQXmdiNg2jwcrO0N674o+WZZDQJNemjmBTIJb/ThDNuf4Q3GKR/8Zxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837941; c=relaxed/simple;
	bh=bK9Ms32Mc0mtw7i1mc34AziXrcj7CPbt0s2yL+G9aFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrLfwdst9A6PH2AYm6QYx2xhRUrBQM3fuD6qIrEbvD8w0pP94Z28rMwBluKkSC9pOfMMZvFf5cIIy6z4/f1jed7n2Yv0YYa7CjldCiDqlTjDE3RzySUkTb9VyT03Fj9TPNl/joIAw80hl0hLuBfCQNC9WJNzCogiVohoYIFobRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmwZbB73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHuEgUjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F60Itd2677748
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=; b=MmwZbB73QziZMTc4
	8/ZdS6DIGmgu6bVW+39Q5MJiz77ruxuZ9+XStzVsdeeEdlXt402LmlNa9L3ITwXA
	lAZb0Z47ebVQlF5g4DelvVdAsw+ahuebHX/SYVei9K7NPIRH0ijbVIE8zQvilhRy
	Qzhm6HOwEDugk8ohrTebFMY0rQcE0GZ163jFg6LGvTJljH325dl0sNFcCdkSqGiS
	SkqzQHny+XnPO4xNqWAwazk7C0/DWZJQIdMdOnbjgjwv+evVXk1X9FxwFyxJOgLH
	4amwPx7fl88+eG/vIV5KUZ3gU06PiWq/Erz7t1zFVMpUAbLwH1VsRIX9GaRr+ZPu
	hwgKFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtp7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 09:38:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so19510775ad.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837938; x=1779442738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=;
        b=XHuEgUjhGnGWai9lnbeP2I1qqjvb8aa79CO/yCtyNBmo2e8P3Gw/5Bi1lnRIfuiRh+
         ly5lIModOdTo+fKES+3CrpM+DpI+NPt1lPVudXVcb39tbb0auyTZo3IceK47Fvh2TrrJ
         JS2f0ExolN6hBoutIQ27arlBr4Dfz0woHiMHkbB6doh+j1WIyNHppdMXkWNRQkhR+2GT
         BmMhV/1SS9bVFoANfYm1XPFAEtpBLcEGD1DAi+FQLLMhaMbiNO+fzhwBxqiGNpI8s5YX
         kH8y9V3QoIv1WddGEd1ErxKrUT7PXgjFrEwR5zV5bGDA1TgLc9XiEbwajpqLmHVADxWM
         CTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837938; x=1779442738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sQaSscl93BusCZxZn/AxsEzMNW/NuD9i4imhTBA1QQ=;
        b=USBnOO42kkhYUfUDs9jxPT8I9m7U+ou/uoL/GxfQnTpl+kH3q1PkoddyrOocopkAJn
         fTbhKHnQBSMbZyI9Hu0aEHtoSJCGwWNWZM1KX+TO1iBGfxcNz0Twciy4n/CkJvKgOoaO
         6baxDy/Y8dzJzsBEH+V9FeTFHyHE0IgWjcPlrG2VGHsGVM6QY2jklEWc1RhQafqqrQFh
         tP4u0LFuFps6WslBq+regXa9T+FO3c9bNV5u7JbuG6g5eigsUkJqzWjJjbCjy/M2R0HL
         kNXH+B68qO9TOXlN+M3FwQdHH8RwpPA+IKXXoWkTvQUjugemYABxdLa4Zp9O6lBj+j4q
         7QVQ==
X-Gm-Message-State: AOJu0YziUir6r59RGq9ic+omywBSju+w0P8nxp4NaKiFpjzv1ZWNu5Th
	FYHLnL5ON/ouXRhNWTw+vQC8ZSBy77PVEpfjImNkxs+hmtVFOnVDmvu/MpnuGo+UbrSNBhJpP0m
	RFqo22k5eP9T5a5wwVqm/BlzEaENKkuo96YCq6r3W+GCHgizwm0xVbRj972mZxo9uAQ==
X-Gm-Gg: Acq92OFZBI4hZZne7GJjPbtAOgyFYWdRUwnPNxMWeRyzdRgHPxokbGxXh6/mc/cFkcC
	wkrNf1yv80MZhgGc7FfFn0t1EFTJ7ftN4O5iQJ1tnpk2iV2NWVv6iI2Uo0sorHFW+aIYAo570IR
	lPh6TlSAnZ6fTB9DVS9q6ygCSszCfePTuS45VbC46uQYck6xFJVqKz3gJh2hi7CYnJsDwUjQCr0
	P8kjGkBESMOZjWtlh918AjvP1qMo85Z4tQE5bLU6GCNx0od+CtHR+joEutalgMQrDnXJv/G0fBv
	41oG7dbjMjny+hPvSybnCnrQYkb3QNC/KwLXS62cm17yatqZYrham1j3/UPpTu3eMAOksjBVf3n
	cL7v/bY7LABAoxrJdYynDpjVEELKgBB4dFu/JziCDYzjcuq6bCbveh7Y0
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr3781365637.50.1778837937638;
        Fri, 15 May 2026 02:38:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:39b:ba95:b128 with SMTP id adf61e73a8af0-3b22ecf5a75mr3781327637.50.1778837937130;
        Fri, 15 May 2026 02:38:57 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.255.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm5271154a12.20.2026.05.15.02.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:38:56 -0700 (PDT)
Message-ID: <601721a8-8ff7-4eb8-88ce-b4ba937095fc@oss.qualcomm.com>
Date: Fri, 15 May 2026 15:08:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Bryan O'Donoghue <bod@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5Yg7em0Xca9girDZT52cxZaTg93xJtZD7C2ExswhAkholGSsMsWXMWxtbtsWmkGeJWjp56SmJlLhj55vO4e0nw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06e9b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6GFGFuPpdQFN+sW0UwB+2Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4FU6K_C028STTvapGXAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfXwo9m3IQ4mp5U
 5MAbq/Xiwf6uDMhNXJWYNoSiH+BIfjBVOvqh6smZuQFELl6GB/Kq+V3r5kfv1Vyytxzg5GXFG1S
 PhziZWuu3iBKBsGJU+LovmodzkxgPv4Tf71O9hYh9yWds0fUEFNoRLRY4G4cm/pHXHYDL2ydecz
 u2+WKX1/k55Voi3a0JHlaEpihmwbjox/KAwcn4LNkkUznH4ZlZ5BQsn8L6y4qpEKAmCSpXgpkjc
 C/UUYcew3GJgNo/zKCCaH2VzzTLa81WUoendSql85rKkXmFGCbclIVqwEaVW0YyVIZmBrkxwrcy
 DZch6U6QwmPXCMIypTXtec6CyEPv7hzM2Lptrz/59Uj4ApefU1lKDotDt5IH+NIK21lU2lZUvrP
 CVfRkhtr8jQ2MpPfINziUOHxIeqXCUHHIznQjIhSim/TPnncCoGnqBeKeeAO8kvaheRyv3kcTFx
 V5R8kiHYsFoE3xm9H4Q==
X-Proofpoint-ORIG-GUID: z2-OvlzVJQH-kAt3zdJ2ftDVll03xkd4
X-Proofpoint-GUID: z2-OvlzVJQH-kAt3zdJ2ftDVll03xkd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095
X-Rspamd-Queue-Id: 420B454D03F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-61642-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/15/2026 3:05 PM, Bryan O'Donoghue wrote:
> 
> Can you rebase off of:
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/next
> 
> and ideally make sure everything applies against
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/ 
> next+fixes
> 

there are issues reported and review comments open in this series. You 
need to wait for them to be addressed.

> bod-media-committers-next-plaform-qcom(next-smoketest*)$ b4 shazam 
> 20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
> Grabbing thread from lore.kernel.org/all/20260511-topic-sm8x50- 
> iris-10bit-decoding-v3-0-7fc049b93042@linaro.org/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 25 messages in the thread
> Analyzing 12 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit 
> formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size 
> calculations
>    ✓ [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit decoding
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride 
> calculations for 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to 
> handle 8bit and 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into 
> 10bit format
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ---
>    ✓ Signed: openpgp/neil.armstrong@linaro.org
>    ---
>    NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 6
> ---
>   Base: base-commit 76671814f2843482d97feca12e95c06f0b05bc8a not known, 
> ignoring
> Applying: media: qcom: iris: add helpers for 8bit and 10bit formats
> Applying: media: qcom: iris: add QC10C & P010 buffer size calculations
> Applying: media: qcom: iris: gen2: add support for 10bit decoding
> Applying: media: qcom: iris: vdec: update size and stride calculations 
> for 10bit formats
> Applying: media: qcom: iris: vdec: update find_format to handle 8bit and 
> 10bit formats
> Applying: media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> Patch failed at 0006 media: qcom: iris: vdec: allow GEN2 decoding into 
> 10bit format
> error: drivers/media/platform/qcom/iris/iris_platform_gen2.c: does not 
> exist in index
> 
> that file got zapped in:
> 
> commit 53a5e095636acbab817a7fb98a67ce76cac59fdf
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Date:   Sun Mar 29 02:33:10 2026 +0200
> 
>      media: qcom: iris: split platform data from firmware data
> 
>      Finalize the logical separation of the software and hardware interface
>      descriptions by moving hardware properties to the files specific to 
> the
>      particular VPU version.
> 
>      Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>      Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/ 
> platform/qcom/iris/Makefile
> index 2fde45f817276..48e415cbc4390 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
>                iris_ctrls.o \
>                iris_firmware.o \
>                iris_hfi_common.o \
> +             iris_hfi_gen1.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen1_response.o \
> +             iris_hfi_gen2.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_gen1.o \
> -             iris_platform_gen2.o \
> +             iris_platform_vpu2.o \
> +             iris_platform_vpu3x.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> 
> ---
> bod


