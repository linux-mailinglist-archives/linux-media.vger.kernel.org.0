Return-Path: <linux-media+bounces-44369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B559BD8256
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41BD118A2848
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC5C30F55C;
	Tue, 14 Oct 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Id/xKfdF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756130F52A
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430150; cv=none; b=jjJK/Ic2UjGHOLTDkmvxge3OS6cC25UB0RvZTRUgFYji4QUbhD1Uisj6gxUkILRMp1UMKK4whFLJgzoIWetjpPH4orFwMsECBZ+LEtWe9j993rHmqT93E9IQI/hzDUUsNLd56DJsObamBcoFxm6sryFDyvmh9h+6f58uC30Hr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430150; c=relaxed/simple;
	bh=CAw+2q1jb4+KyAhmwvSFmEXCgypuAgJT26FqKT0LMNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=giGLfWvvl5UMAxSbTGsOx82vAca9nzLlcZ2Y/dBPy1ej7aynSFXu/Y8fz3YQjkX/CDNYkYjox0dfacHgZE77usDpQsAVKAZalw4TvfwzzTYpTFJ3n8x7GIeBsrx+ONEIXebCPdH934s0dEk1DYTlV/imgndlrrWvNxRGy+Z6PL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Id/xKfdF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87NSJ001614
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJro/XUVZL6sNNGMbVoX0we2kE3710IaAzwCCDD1JY8=; b=Id/xKfdF8m1FfW4T
	/NxROPG1I4FbwG5vwQejT71fkYEOpDq+6sZ1VRNbxu5Xo4q2npM20qib/mnu1j1o
	iHWZEDGT4ApFl6ZgIbtzWUB0++K4mgHEcm9FZh3pGNOeW5cpxE7ihEJzURf1kCjI
	RsAsshMotnH2E8o4Ia81HXcrGWqvHQ7IOIjT6ttoyuF5oYw8uJ0IcWaPJ0bYNt7b
	La4NXGUH2AeBUbrYqloL2C4JgR/BGBb0kjTx/QiEn+X6vfjPwaDPfu3rhotM2wbC
	Rb6vn9jrcfmp+8NoOgHaWZEq7+z65GH+QSPBM+L5Mmnx0SBlvVlg3tRJdDp/GfPy
	FiuCjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk7p6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 08:22:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f914b5a4so7485428b3a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 01:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430146; x=1761034946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJro/XUVZL6sNNGMbVoX0we2kE3710IaAzwCCDD1JY8=;
        b=TuYvpvSWEjyL9J7/2bAgCYNE8GRXf07cJeNOEgRp3y6q0C3E5jFkYCyjUsoMtJAIP+
         TlDsZZK5niInLEt43YiXeJbBmLtw1Kv4LM1A0Bmbi2dQRg8UdZbYKoPSzrKXh/wWbJe3
         xdv3hq2OLhn5D2wPsgYTgkqErbq5nSBfrIvUWr86wJmpEhhC3QxBk0apIAH50IkVaaAl
         BfcBVZb5UGX23YG+luBot8MdnEHuj/2NoZZfE1Jw596Iy9GPJ7xH8WzWzdiCc2K3i40+
         si4PmfE8NpR8onZXofHAzraNAgXXFUxeXKvz2FOlUtnu976J6ELgtBpJKTxwDc927TX5
         gKqg==
X-Gm-Message-State: AOJu0Yz0abNhjxM2lIu75vvbG0TKVckRcmvo1B1e/gH1OsbjsdgcZ4bJ
	LkGamXLS7a6L3W7u5BqTjpIG4lSwq2iG0ScAGLN1FsHOnJ7JXFfrV8+rZE7o9IcZjhJRSj1kejh
	HNByO/XXO2n17k9cgWEV6tWoQkMDNJeX6CnD2bstgXHk7qIMpNveCaECfzuFYQGxDhQ==
X-Gm-Gg: ASbGncubBA8afNiAjsonOInHRTLwgXX+JVb3BZEky1xch2btcNqxR8sILhJmAnT+/ys
	w8+YKrceb2DULZjz74TUMyhzwc7pR7w313rn0NYCMVLmZffQ/Sdn4ITadGivpwXTJmH1lrMS1lS
	D8hV/yQ9fHvzgEFLVImXtpDaCFr3dOwk51DH0eX9JDhvH8ORM+6chKtXEqu6bzYw+fvd/6trmOf
	77jjUUnyK/kDG0XgsQ+3+BTcQPDF2vZJ5vCr9ktLLEj4O3cDc17kZ6cfff7LTVql+J7/FsunnnG
	2CzgZjb4w8rJ2xcq/EHe3Tkt0DfIEkowBY/RvZJthvAs26GO9hsuy/+cdBXtiFvseVZQMRfO
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr30456591b3a.31.1760430145840;
        Tue, 14 Oct 2025 01:22:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtVXUxvT3BTmAWyeKc6CnqZyTjDz0qtj7wJr27aCf/zysLVgocmJ0HQDvzjqsQH/oZZheWKA==
X-Received: by 2002:a05:6a00:17a5:b0:781:18de:f7e0 with SMTP id d2e1a72fcca58-793881eb478mr30456558b3a.31.1760430145348;
        Tue, 14 Oct 2025 01:22:25 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm14124339b3a.64.2025.10.14.01.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:22:24 -0700 (PDT)
Message-ID: <7f8cafd4-1e0d-13ee-bc1a-f0a230b4e3e2@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:52:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/8] media: iris: stop encoding PIPE value into fw_caps
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a2a3d77Ne1ZxuLFpfMVvm1IkokWFFZnb
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee0843 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JV23JpkejX04UPURfCkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: a2a3d77Ne1ZxuLFpfMVvm1IkokWFFZnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXw4BKG88iIK89
 ECOWp1xFcaOTikbAo4YvwR4cDlU4/pzYDA45XmYMbgZqdFfZP1VTSX6ISqthmb+Su5Qs095vvlv
 xyFzQhqnzjpPTtceUAn8kjkJ+7dSdnpVOHygrn6ZtEWHgovyFrmV5sVAePvl5FHBiAsag6JPHAE
 jg6D7msXPxocv4QU3KRVCsXxjfZQRbGw6xaqfiYMkQJoSZqn3yzUdOF+OJQpo6fsFsYE4tLcffm
 KWPGM3Nj5dV5ORoPuUzd/2Z0oOggvLeWc5yLPJC1Y6wmpZChbKdjXWD/i+XrV6x3WKJs3dCEpY5
 syAX7Rk3XboCpRvbX7xXlIzgIInytpTowih0sioVN9EUk4BDh1MDWQKqx1XF1SW93dorKQnG1VE
 RDdWLOPTAJxpnEg8EaRTpiLex0Qdrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> The value of the PIPE property depends on the number of pipes available
> on the platform and is frequently the only difference between several
> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> iris_platform_data rather than hardcoding the value into the fw_cap.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
>  			continue;
>  
>  		core->inst_fw_caps_dec[cap_id].idx = i;
> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> +		if (cap_id == PIPE)
> +			core->inst_fw_caps_dec[cap_id].value =
> +				core->iris_platform_data->num_vpp_pipe;
> +		else
> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>  	}
>  
>  	caps = core->iris_platform_data->inst_fw_caps_enc;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index b444e816355624bca8248cce9da7adcd7caf6c5b..7ad03a800356ae9fb73bdbd6d09928d0b500cb3c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -161,9 +161,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
>  		.cap_id = PIPE,
>  		.min = PIPE_1,

Could you please make .min same as .max here ? I understand the context of this
patch, but since we are updating this cap, pls update min as well. So far, it
picks the .value from cap to set it to firmware, so its never an issue, while
keeping min and max same, it would indicate the SOC have that number of pipe and
not variable.

Regards,
Vikash

