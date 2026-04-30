Return-Path: <linux-media+bounces-60049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAuSN1sO82nZwwEAu9opvQ
	(envelope-from <linux-media+bounces-60049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:10:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425349F124
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E69C3021EA8
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6C039BFF8;
	Thu, 30 Apr 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1kOkTHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jH7B12uI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1538E5EF
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536588; cv=none; b=fO8ipk9NnyqhVEa3/MddWlZC0TcAsnAXB/PvbsgCjmQ6a5mEB8ede2UnN4yi2MWFsHYZ3dC55JP++waOckCY8H/HIroWqFErdoGNi0emHmqf+uNJK5OcuK1qjdWPkVnZAhGwa6Ncaxb0BtJ24IbE0keAblGSh+1GV/tfnmeLFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536588; c=relaxed/simple;
	bh=P/Va7b9oi7EzhBp+mBnd7Ehsh75YSeMT12CU7XQ1b5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvLN8t3U1vYadyJcGK09reMa/jnGU+VPvAI/anPZtyCKGg7CQOc84mv3DocGevYmvrAvNyM69JDHSPpls9Evmqxw7EuJqCb+a9vn3c/491VbVxGn5OAWlatBJ0INySR+Y/+DqJXD6Aw2LgePTpmTIv6LHhvnwabeSL/pQOrw/kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1kOkTHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jH7B12uI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U59JoT2907492
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 08:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=; b=S1kOkTHws41QeWRm
	MLbltE02vS9s6+x63s0Uspysyb7/12mSGoSn7O07gAZhZFlyDO0C7hcMG+JUS2QE
	UgjKt/8eHRw5Bzde939NkVwOvt++b8zG/G9RnvMwkc4G+pHhERh7hy49mMys8WkD
	mA+RfZPEMwdWN9TwlYaMY4NLEA3ajzrGD9e60OEqfd3LWuoWPtXj4WUruI3+hWXq
	FeDkdLsDC458IP2ltVY0QmU1qHAnIlR9YoG+gSioxAq15ZmvqMrAK6HpaW7wMnXv
	MXaTMVIKwJfxqBqbZnQf5aJPFBS46sAXIhQziSGp0CHVcdv2Ua48+fCsG00lOwJ4
	BXJOnA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv0pf8mvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 08:09:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so761423a12.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777536586; x=1778141386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=;
        b=jH7B12uIhykKZS0OxumemlCZY4SbVSFJ7dTvgUGI9417C69OF/841enFL89Lml2Brw
         VSwI+u/gS89il9VcoguF6UP9bSL+4l5vC0nWeJbLjh61r5h1oGVQuOaxgTptU8aoyxCO
         fU0aBGxPDE087Rnp78rPyAntiNMpwS0Y33JaI0Z/+ncTROBbHaTd6uR6zhsh9E9uZSHq
         ut3RVdG2myl4n6IwSK0Q85VQ+L/0eUaMTVRdMhDhm2mA18U2goGc+8YoFqR4i4LTu1Ni
         fhqBtTcZxvN/VJwVb9FeczHt/Hel8TdyKOcisZXbjnm0XciibK4TOFCFb8AYVygcucwg
         eMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536586; x=1778141386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXogd7QkYAMuJeC9lEVQeWa6XXf4lK9naY79j9evPIo=;
        b=rqdVAHfOnvph1Gl3DROSvUsO1ZUwLdZNIOXGraeypaAz1Ud9CDtewNwzSCn96oZPkO
         IMGqnVKGCneRBt/ZmNmA5CQeZ9m/PK6cpiYyJ/crMtq84oR62eCt72LuOANp01ePJQQc
         SYwZEtzq1L/6YplwUx8uFmbho7qYdC3nN4PC1mAfNH3PN9DELXOSSl/WXwLiATZ4snaE
         SsNNA6rCSMNfjYgzmd2uI4Q/6WG/piraSPIig76ANnqo2QlC7ny3ypENiQH4C3mjM3Lp
         SJ2Uo82SdLaMydNhhBAyKPXAW26t0yD2SvvUDEYEghmhLuXxG2iEgz70U9XdcTOZ/F/B
         jsKQ==
X-Gm-Message-State: AOJu0YyR3cOo9oSZF9WZSL+OaxZBwG1oKgFY6/skOkkUb8kRmbfHvj9T
	8oQXO8wa7v6eOyx24K659TNok8yYAFw90thyKKl6BQ0C4MLyQtVys6d5Hi9Cx9k2REstyBDZs3Y
	lB2YSe7kTIegOTMmSsRpgcrwWXEo6YWSECfqpJrjcStOtK6Ny3PbqexHeTnKDIZ4kfw==
X-Gm-Gg: AeBDies/NHvBeV6BgvqwFkogBEfp8TKVKkic9Pn881AzJI110HZIm+XR2C1HmabRt+q
	ZnoKhmeTvmDGeFs0Vk4ttWyKMRiL3r0fGTzjX8gXJ0qtG8nCH8jQvAjsZyhrfEiWJTMSsVO9BD8
	WM8Hdqb7wpreaAGZb8EqeKydqlo+/HHOwrU6VBg2M258VNA+hy9ZeijCgK3zEMN3VwOL4lacgEy
	3RVpwlfHSTvZzh8AiOdoX2BvEuO4aruEahAkW4nflBq0WHwMwnSUF6/wSTCbOGydAF1PBELzzkE
	3+vgcJr6Q/UJJ98ccdHDnwXtpkLpUoy6tzUrkqJR8fVpMTiI4PVMkSpXSSRUVajYHoPka2tPRx4
	55JssI5hS/56A35+mDnMEfNCYacyveDYRQh2Uylk8yeEOhpZwVIcPmEuYLsDRToM=
X-Received: by 2002:a05:6a20:3ca2:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a3cf86d7c6mr2289329637.41.1777536586232;
        Thu, 30 Apr 2026 01:09:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca2:b0:3a2:ebfc:6bee with SMTP id adf61e73a8af0-3a3cf86d7c6mr2289285637.41.1777536585696;
        Thu, 30 Apr 2026 01:09:45 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.229.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5bcced4sm4129908a12.0.2026.04.30.01.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 01:09:45 -0700 (PDT)
Message-ID: <663947c0-b316-59bb-3ea3-d1bf313577af@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 13:39:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
 <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-2-438fa96da248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3OSBTYWx0ZWRfX0Ojo78+jLjv7
 snibUZ3sb5snnp1nnrAQGn2c3fzW306QDH9XZmtZZ7rEOfa1LBsXLXGXZJ3o2CPog0C0+B02TOd
 tV/Hhgvn4ahIbD1vOprB+QErDOli0A2PtYQpez+lIgUUcq6uCKYOBnEtHrqPD/icNrrURhFu9KV
 DtMEyIzdVR62+INhdkEF6eb8DaQnyn6AWf4j2+hQabYrx3joGphYyMRfloEgPJrmBMtkUyWUHAh
 UDp7kD3bKlNUZKu7nIlaXrTvB20ewe6Eoq1NKr980NtlHD3GYT/QtZZL212iz4+0m0ba62EyQ4H
 zWivBufqCIpGDDB2YwuNSP1n8LQdrOxcRfZtAUhrNOY2K1zFpr1p+2glSlyNjQQt2zQ9uMwbqA7
 6+ob/SvMXiJI7i2YoJg+Kh2sATfBTza41fA/njtPq5U5nzZRv1sbFxcqz1zvFPZZStK2lSAvJ3+
 Yyz8mhJkQiLPItpUDyA==
X-Authority-Analysis: v=2.4 cv=Zrnd7d7G c=1 sm=1 tr=0 ts=69f30e4b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=sQGdqEwRzC/zEhaLYLcr+w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=isqJhVKGVgDRGp0WoxgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l8UMEXKppixCfynmzwlzZVNAFf5g7ek0
X-Proofpoint-GUID: l8UMEXKppixCfynmzwlzZVNAFf5g7ek0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300079
X-Rspamd-Queue-Id: 4425349F124
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60049-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 1:13 PM, Wangao Wang wrote:
> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
> the power on/off sequence.
> 
> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
> of the video codec hardware responsible for bitstream-level processing. It
> is required to be enabled separately from the core clock to ensure proper
> codec operation.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 548e5f1727fdb7543f76a1871f17257fa2360733..281b1f54cb962dedbfb0ec96ed3a5aab99b50eb8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
>  {
>  	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
>  	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>  }
> @@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  	if (ret && ret != -ENOENT)
>  		goto err_disable_hw_clock;
>  
> +	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_ahb_clock;
> +
>  	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  	if (ret)
> -		goto err_disable_hw_ahb_clock;
> +		goto err_disable_bse_hw_clock;
>  
>  	return 0;
>  
> +err_disable_bse_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
>  err_disable_hw_ahb_clock:
>  	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
>  err_disable_hw_clock:
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

