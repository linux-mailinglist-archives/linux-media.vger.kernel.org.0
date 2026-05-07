Return-Path: <linux-media+bounces-60849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMKrI03i/Gk2VAAAu9opvQ
	(envelope-from <linux-media+bounces-60849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 21:04:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB24EDB82
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 21:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B227D303C4EB
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 19:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DB84611F9;
	Thu,  7 May 2026 19:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzCAKU6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4IHobOG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697B3A1699
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180656; cv=none; b=Bowar1E0r0NYmiXwsgXKjtZW2G6OJqfiyUgoqegXYtTleWMl8kIz3gF4+DdmRXFOf0qyrIJYcfMgNavpgjBaCYPxXU/DZ3dZXYwFB4mrN5HjdWwUOJPU7sp94jXurIFnBH7irp3FTf7zF0Y5KplbTIQc+/U8yN7Tvao2A3aUOY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180656; c=relaxed/simple;
	bh=d6/WH+j+oQxlbSAkKtJERHb87arl4pQBDRpq1U3j2ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oj3nI8l8FM67hGt43JG3cWAkKTs5rRSHhDNjOfNgJtd/yqvHdqkrP7MNzt/ycA+NY0dEifTtjaR/AU8fhCSgLwUmCnt7DbS6nwbiF1IAW4tI0t2hDixTrIrkeb4XVoB4pbKooXksclP4YLOZ95pjmCMK1IgNhBPQRK/OR4nvK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzCAKU6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4IHobOG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HR5513156937
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 19:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcJYetvgM9irFeBjD/y3oLu4bvqECSfQYthIqylzDHk=; b=YzCAKU6WCVZ6B7vy
	C5AJlh88oPPEe+2bJ/6tlClG65K+Lq/6EyLjeLVlVgk21HYOSMDIb41l++XElYbA
	PmKCtpUi8hc9pakWeiZV9dkJRUURxBGra13cyHnr6VpIHRnW6+NDLReMceX8adrp
	KwDntZdR994X4biKeVV+5hNryLMrkW4tIHL48XxQ8DYHW5j37cptyBv+tLWAevA3
	c5XiJBAsbkMweax6dyU+trra2dIICNWAIW+NKYB+ZWKPIwxqMhH7NJGOKMa1je3e
	EqQ68n0ZBllm7z5tZsQXAYYLMPADLCEQONdWv8IM8MwCG3LS2IhGwBcavVWTA8G8
	Wp3tdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf36yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 19:04:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so1409111a91.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778180653; x=1778785453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcJYetvgM9irFeBjD/y3oLu4bvqECSfQYthIqylzDHk=;
        b=T4IHobOGIES5c97hd4CzDF+rDAFJuNzwPDd83RCemQljqnIABi4o6GKOl4wrYaUc71
         1DsVCZNCnHnmEMVOigZvlWx9v+sTz3EVchS2IGR48b8pfq2Z7V1Tb3cKSJ2NGWpCIL3s
         48r1INYov0Z0kmkK1cOaQ7KtYOKfxyZ6uw010pwrF4vS/nVtEeZ86gE28zyRTOq4Yris
         lC4rUXP5Zmy1Bc1f+qiw4MpurQmr4R9CAfjzxbWfIKZSHJBBBluY1aavrfNV3AKj0+eq
         yeMVsZKHTt/XUEtvQrAGVGf2Ul+229693jqW50Txr5/exiWG1JNrUeSP2Sca1s2KiKCe
         i4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180653; x=1778785453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcJYetvgM9irFeBjD/y3oLu4bvqECSfQYthIqylzDHk=;
        b=Nt5RVkxmdmrmiOaUkTTRDHxgb/VoYMIGkWvT9pE0fYZ4UvSdq1SGAqcTwjXukxUFep
         wiRGGh0Yq9Xs1TQ97JMxIjNP1s4X7sAZ9YjGpTqY2MuhU1LNSXQ2h7IYu6i4bch7hV4i
         pfYynNTFT9t/1A65iT6bxDElwVA6FrjOx9xAS7dscxiseygJOr4JGZ+egsFe6kxPCS68
         rPbqIvAcpAQLl0Z9q3HQ6DJaOOECfaviNFkFFUlgDCPlfAaOEJWakGTewsw+e6F1Za+c
         RwbgA3zJjY7jhT9cpJafn09YoswCh3KJaQmFTDv/JxCn86yrwCYn0LQNZF+EwJKKL+5E
         1wbA==
X-Gm-Message-State: AOJu0YxIVZojdKV3ouu0bL7q5Y7jjwuhtqAPXuz2WEtwtJAW44kwK/Tb
	CL5DHzlJIX23IPBph5Fsc0fLShfEQo8qHm5qTNm1fQJyWn3J4BhjXsULfHSwCNzmZlTQUpNVbBR
	+r6KAYwHLW3ohBDRHFDTMaN15YkAkoCYbTokBTV00FYbybysXoPKTIz/6aRaG+Au0Iw==
X-Gm-Gg: Acq92OFRU0Jq5AiJtD3pp/hi2rUb/+h3KYq2OT7IWL3f4KZQ5DTyTPgF0nRqN3TdVso
	gWhGYJ/kqclTWwGBBLzhfrAfW1ZzYYi9suZDtfesBKxj4F9hXB2kiKngZFRrbXL9VurySu54+hP
	p0o6Ip/SFpWAz9yuZMjVaV36C7SkoDuqsrwokjY5IDx/vE4cOPb1qPZYrWxSdFuvVqvm+iLzW0D
	5b4N+b2BOyIvJceQFX0KBY7pog+Vf/3w3UGk0hStvQVB7yMLCTRBZ++gl9BTkVkuB/6KxMHr25o
	NFZAZAUSUaDkYDgTfWko+zvdS1KhHqCLiFodrx0H0gbIpQ0ZnQvbzntf6ulhOqpFdLKvLL3Oald
	0SfKq+9pvUGp5M5Pn94gfS56ciVVush6kZZktZ2VanYUgrcGTHEGa5n4N
X-Received: by 2002:a17:90a:38a4:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-36615b94aacmr2125666a91.2.1778180652268;
        Thu, 07 May 2026 12:04:12 -0700 (PDT)
X-Received: by 2002:a17:90a:38a4:b0:366:159a:c1c6 with SMTP id 98e67ed59e1d1-36615b94aacmr2125642a91.2.1778180651681;
        Thu, 07 May 2026 12:04:11 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8263ff4d1esm494215a12.13.2026.05.07.12.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:04:10 -0700 (PDT)
Message-ID: <74457b34-4b08-4b9d-984c-2e9045159ed5@oss.qualcomm.com>
Date: Fri, 8 May 2026 00:34:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
 <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak-gen2-support-v4-v4-3-1b607d13f9b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MiBTYWx0ZWRfX+r2Nb1ZHrh7F
 8fDUDiCPD0x8r/JN9WJXDamJSGO8sIE+Waiz19yjM7maBdfKk8NF6x3FFu5OSayrxTsGYjejV4r
 pVbMCWBEsDRBhSzCW8BUZmSJ1rpkk1uFrPbWl4iGzYVUY4McM6tU5lDw9ggv+jwxup0iDOVNDKJ
 Asxhd1sQIEFQt7SRSxAMEjqDci8bD1SKvrnwoz8/SXRXEtVNhgA9UeeLz+iM355F4Exb8B4DKPi
 7v5IGSimhY53uN1vEjHDvlp7jPgH02DAq+whj4OElLqh+Gi6W6ERqNlfoOTTxO8RIeH0tgXpd35
 1hMIJLqAhlNolN4foHZY8NygpK/W5WFcOOhI2st5Y+3ljUN1NEXG15UsbwqOeEE5MBohffzld0d
 s/psdeDtlrZ8Nl62m4RhcgjwE2CH5rjqKaR53EMm0zxv7ICfYTV5l1RCAibBjLksdYu5+OStJbX
 XQOSWLQqDzJ4HWcW3Lg==
X-Proofpoint-ORIG-GUID: N24KLgPFbOHfHAvSGDntKZcY2kQ_8PhC
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fce22d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jxN9ARRhxhLWbUx4_G4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: N24KLgPFbOHfHAvSGDntKZcY2kQ_8PhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070192
X-Rspamd-Queue-Id: D1AB24EDB82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60849-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/29/2026 5:39 PM, Dikshita Agarwal wrote:
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
> 
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>     descriptor when present and attempt to load the corresponding
>     firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>     descriptor is available, retry with the Gen1 firmware image.
> 
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the driver detects the
> firmware generation at runtime before authentication by inspecting
> the firmware data. The firmware is classified as Gen2 if the
> QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
> 
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
> 
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>   drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
>   6 files changed, 105 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580849d7b68c7c15dd7f82f89a680b..64a2170bf538a6d291b3d909f5563408a3a75e50 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,20 +16,95 @@
>   
>   #define MAX_FIRMWARE_NAME_SIZE	128
>   
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	int major = 0, minor = 0;
> +	char version_buf[64];
> +	size_t max;
> +
> +	max = (size > mlen) ? size - mlen : 0;

better to limit the size of the blob to be parsed to 4K ? version 
strings should be in the initial part of the firmware image.

A bad (and big enough) firmware blob might slow down the system with the 
current logic

something like
size = min(size, (size_t)SZ_4K);

> +	for (size_t i = 0; i < max; i++) {
> +		if (!memcmp(data + i, marker, mlen)) {
> +			const char *found = (const char *)(data + i + mlen);
> +
> +			strscpy(version_buf, found, sizeof(version_buf));
> +			if (!strncmp(version_buf, "vfw", 3))
> +				return true;
> +			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
> +			    major >= 2)
> +				return true;
> +			break;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static const struct firmware *iris_detect_firmware(struct iris_core *core,
> +						   const char **fw_name)
> +{
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +	if (ret) {
> +		*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = core->iris_firmware_desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
> +
> +	ret = request_firmware(&firmware, *fw_name, core->dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (has_both_gens &&
> +	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> +		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> +		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> +	}
> +
> +	return firmware;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
>   {
>   	const struct firmware *firmware = NULL;
>   	struct device *dev = core->dev;
>   	struct resource res;
>   	phys_addr_t mem_phys;
> +	const char *fw_name;
>   	size_t res_size;
>   	ssize_t fw_size;
>   	void *mem_virt;
>   	int ret;
>   
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>   	if (ret)
>   		return ret;
> @@ -37,9 +112,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   	mem_phys = res.start;
>   	res_size = resource_size(&res);
>   
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_detect_firmware(core, &fw_name);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
> +
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>   
>   	fw_size = qcom_mdt_get_size(firmware);
>   	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -66,18 +143,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>   int iris_fw_load(struct iris_core *core)
>   {
>   	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>   	int i, ret;
>   
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>   	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>   	}
>   
>   	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +170,7 @@ int iris_fw_load(struct iris_core *core)
>   		}
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 0408d51188b27251986780de6b4672b155ab1005..7acb073f719746f57ebaa2afd9061db9239f860e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -257,11 +257,7 @@ struct iris_firmware_desc {
>   };
>   
>   struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>   
>   	const struct vpu_ops *vpu_ops;
>   	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 00d6244bc92fd9216bd7c0e6153689e7d8982a67..8259709ba203eac2230da3048166b33892b337b2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -22,6 +22,12 @@ const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>   	.fwname = "qcom/vpu/vpu20_p1.mbn",
>   };
>   
> +const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>   const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>   	.firmware_data = &iris_hfi_gen1_data,
>   	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
>   };
>   
>   const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
>   };
>   
>   const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>   	.vpu_ops = &iris_vpu2_ops,
>   	.icc_tbl = iris_icc_info_vpu2,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 6180104f3b94bf0d5e3206481816802fbd09849d..829dc37b4058101e7dddd484533724272b502560 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -83,7 +83,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    */
>   const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -112,7 +112,7 @@ const struct iris_platform_data qcs8300_data = {
>   };
>   
>   const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu3_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -147,7 +147,7 @@ const struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    */
>   const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu33_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -178,7 +178,7 @@ const struct iris_platform_data sm8650_data = {
>   };
>   
>   const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>   	.vpu_ops = &iris_vpu35_ops,
>   	.icc_tbl = iris_icc_info_vpu3x,
>   	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index dbc15edc602b72fdec8bb2d8d3623676afee728c..89426ed42facca7729c987c5b283d11e862e4fe1 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>   		return core->irq;
>   
>   	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>   
>   	core->ubwc_cfg = qcom_ubwc_config_get_data();
>   	if (IS_ERR(core->ubwc_cfg))
> @@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	iris_session_init_caps(core);
> -
>   	ret = v4l2_device_register(dev, &core->v4l2_dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 807c9a20b6ba17fdda8e7e91956bdf19e83a3ad8..6fbc20366f5fd3a80468d90d813851ecf54e4cef 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> +#include "iris_ctrls.h"
>   #include "iris_vidc.h"
>   #include "iris_instance.h"
>   #include "iris_vdec.h"
> @@ -196,6 +197,8 @@ int iris_open(struct file *filp)
>   		goto fail_m2m_release;
>   	}
>   
> +	iris_session_init_caps(core);
> +
>   	if (inst->domain == DECODER)
>   		ret = iris_vdec_inst_init(inst);
>   	else if (inst->domain == ENCODER)
> 


