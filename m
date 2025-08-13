Return-Path: <linux-media+bounces-39784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0CEB24619
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4437B3B4002
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C6D2F83B6;
	Wed, 13 Aug 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJmkU2ru"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F72F3C1E
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078172; cv=none; b=rRSFdCYE4P7ubx/H2z469j05p4UFcsCDIu3RHkLi/2HSMXAZD1uYcV25QSp4b3o6tXwEUXxYl/t1Qb4UzyPSIQRJdiQ3yk6FmfW08TnbB9ODnIX7F/bn5NhcBllbrKBnmqRH1F46KVx0M2lIXMW5rhpxv0uQyIHz/Lis+bDBi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078172; c=relaxed/simple;
	bh=cx7fFQ8N7sE27h9RXHiL4/qnxs97L3GuAT0iZtLPKLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFveqd2MgDWHF1rDNfX5x7pLlUr2kADZPniCQ3yQHWrUtthcnPv39+RBidBlU0i715/9uc2w7ZAjWcQlUU0K9ixgQm9ieH1jv1uDgX8Zl2CTekDJeEpjIAZUaWn4vDzVJczLcgSwq8InAfzk6P+F/bTNGBott0Rc3rMRArbIKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJmkU2ru; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mI2C020454
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 09:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTlCoe6i0eaqX0I0CPU3Vr3oFqQ/l4jV/xuJ6IWNwo4=; b=NJmkU2ru8Fy5C8bS
	3ddLr6+TStWAScbF0ATV9HkKGWLQ1I7pJgbhjDCYZ/sNcgQ9K3ns/43BPY8UOY27
	6bYC936FdDERtkKusLrWFgUbHJH0N2cp7AFM7JgaHeWi9lkbJxQ9KAJUt4a4uG9l
	dOPZMWytAekivnVNbezl+rLc+A8yZbIe93EbQedCCZPMoCfkOGsRsBRzvl3f12D3
	OcZdWZ7ImNoD1drgMF5xYx1EDXKZG2Mh2YMx7v2Nu2BcaBKj3rEHLfBJwdtJxa43
	QXGYCBmA01F+tWXTkvlRGj4VKqHRbnQg4QEcfKcVE/XSeCLUZxvuqpQo3Fo9385G
	/83qjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9ee7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 09:42:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso5819851cf.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 02:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755078167; x=1755682967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTlCoe6i0eaqX0I0CPU3Vr3oFqQ/l4jV/xuJ6IWNwo4=;
        b=HsSMDAP+aSb+BiiFwGP1qJgAOgCHF7eO1ehsMV/0CdPvCZIInWUHYURrie4bUwnrjc
         uz7dfGaFF0Mm3PvRE0/+YF2uKlbkEh2uQ/wmMPBsN4rd4Im0lC6zzL/zyZnAwm9OeL7F
         uRvdV3PXNnce9LayOxlZjmIZBYh6Y1ADD8Km3VF34ZMhIjUnmqK7uc9b9bM0NGjHP/un
         F9bCx3NSQj4HobGsxpQQOEAxUk6VKHoDIsbBPRlsISKUPQL3OLERZWfGdqrTnexxcbDE
         HnxwsBTMzsf7oBRX3fdonbLwSHSI9KRFRZ9B6tiIt8GFJkVUGiPn1MxXUZuPRScrkrZa
         m3Dw==
X-Gm-Message-State: AOJu0Ywj45RQLw7zY1l4lK3sjsrcXb1tDPqSsD6cdQPELfRb0dX2RZs8
	SipSqM8GUOo6wowiVy4Ht14PRdhQnyZ1d7ZX2U4bUCtQ9AgfGnbPYNQk4UNxglgrTrXGejwzMrq
	EGT0GJ3Bk13/TfiAACSdufr77wJXFuAu9MpSndT5BxNTa1VaUaieNt080b1PiwCyCnQ==
X-Gm-Gg: ASbGnctKp8uyMZOdAftFM/JmJ7MG6kRfETEmH7dR4HBfVrPQ7gWdyg4LL8ZZYHk1+c1
	n8wpqdaMcToeKox7hjIs9cwTeFhVWthdfQXvsCaE+u/BK2ETUspmF1unOEwZHnpW0Qs3F0hh8/v
	QMWUBLjRBAWPuBoswAeZmQ8t2GJbRtZ281BUht7n2oiqij19e1zH2PXgQoP5iVUe0BzYpe2CXm7
	EHcV4hJllsnKnQ1yOlHtJgfEphJ/rJyYno3BJMHXh8Z7In6tnZptFOWHtl894Rxquj02JZseN9r
	319dXmCEaoNWdPHop2ToHPxoHF50W4el2kZifju7Bdl29I6F/E1kQhdhxOmgm4sYPSGzUUOBJp6
	mw5gS2Msmhgv6d9rZig==
X-Received: by 2002:ac8:584c:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b0fc708253mr12006301cf.7.1755078167433;
        Wed, 13 Aug 2025 02:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGk6X/nsQT1gXnJE+Bbl0mcrO0rxOEFQ+yoFJCSnc6+F3s5ix8wcT2SqHyiEwvEMBCijuX+g==
X-Received: by 2002:ac8:584c:0:b0:4b0:8a0b:5dc1 with SMTP id d75a77b69052e-4b0fc708253mr12006221cf.7.1755078166885;
        Wed, 13 Aug 2025 02:42:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af99604e648sm1369305966b.6.2025.08.13.02.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 02:42:46 -0700 (PDT)
Message-ID: <b58b583f-8910-4b93-86d8-bbfc865bce3a@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXwfQd5RO3UVdO
 DoSevQ4CTsmDfLHwxNBfDmBcylCkC/gvaocP4HSdhAlLV9km8WHMAYJRVbpUej8mVTexvOcxNvc
 j076MMAhGJVAK/NbWjbkt9VOgr30hVhCLpML5TcqiosyBys0UYm27xF9t2jC+Qvb9XAw9kgRDCG
 BuNPEOWWIg9JvifK/4Icojfrshhd1y7wsuoXIKzgyBGwaKspL8JeFPE2u6HosSUsXELromKLRzD
 IaqVhrBChYjx9y+E3+AUUm3jyVB/XLUTWnrs3Z3345d5bQzYL4okjXSfdxKqb5Ne4uZnha3EHu4
 +8O8wO5E1vo4QXEkpDnu3JnPFxGM2aJjPCypKiFnz8bES3FYK4Z7nvK2oF3E0+NazrsZE75D5GJ
 T25QtkCk
X-Proofpoint-GUID: _Vz3W5Xwi2Ej_I9GOiNYXXSr6IPm7oBG
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c5e18 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=DUSVluC6vKa5XdcSIjgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _Vz3W5Xwi2Ej_I9GOiNYXXSr6IPm7oBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/13/25 9:53 AM, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Changes in v2:
> - Restructured loop for readability (Jorge)
> - Used defines for bits (Konrad, Jorge)
> - Used udelay for short waits (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com
> 
> Please note that I have not added "Tested-by" tag from Neil in this update,
> as the NOC handshake loop has been restructured.
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c | 30 +++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..a621878f02f7196de29c9e290a6c5acea34eba8c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -19,6 +19,9 @@
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>  #define REQ_POWER_DOWN_PREP			BIT(0)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
> +#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  
> @@ -109,7 +112,9 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  
>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  {
> +	bool handshake_done = false, handshake_busy = false;
>  	u32 reg_val = 0, value, i;
> +	u32 count = 0;
>  	int ret;
>  
>  	if (iris_vpu3x_hw_power_collapsed(core))
> @@ -128,13 +133,34 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  			goto disable_power;
>  	}
>  
> +	/* set MNoC to low power */
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	do {
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done = value & NOC_LPI_STATUS_DONE;
> +		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

I'm still concerned about the lack of readback here, since the writes aren't
guaranteed to have a delay between them (from the VPU's perspective)
> +
> +		udelay(15);
> +
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
>  	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>  				 reg_val, reg_val & BIT(0), 200, 2000);
>  	if (ret)
>  		goto disable_power;
>  
> -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>  
>  	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>  	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);

Just for context, is my understanding correct that we skip these writes
when the handshake fails, because they cut power to the bus (which just
failed to enter low power mode, meaning there's likely some data flowing
through it)?

Konrad

