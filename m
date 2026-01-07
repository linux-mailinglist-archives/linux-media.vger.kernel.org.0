Return-Path: <linux-media+bounces-50123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D84CFD2A6
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 11:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A78AE3002B99
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF4F325704;
	Wed,  7 Jan 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5aVfneY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlrC4TgJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD13246EE
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781684; cv=none; b=kSn2Z/jM4WbHS+588zzFuhPGkWYXSqv3Nc4BzcsNp+GLSR6K82FzsGb4VeB2YFHXaGkA+EnJ9LsmwqU3MAjJu6gr43qz+KmhcbNePut8tqVCoIr0eluxeULktIbgMkX+t1qpVEnJb6XEz56oyTE1cJ37ExGc3bpV/ujCOgwICg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781684; c=relaxed/simple;
	bh=uCcibc5OS98EhbVSSuYJO2d7US27/DsclJdlxC+Fipo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiMXErFLd+G30M53UAeCTZIy1lqw6CJLBWzt91B0Z+tshfjVF8xlGIfsv8pLSADFn6x2+sPydDP/anfAOSYi2lM/o5iE8Meg7DWjsnefJFj4JEAfcO7UgU/35lUgOfgdzpH4m4ypH+dXzyLhvdEL31LpFqxcs0hXGse/fG8qGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5aVfneY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlrC4TgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dt872593336
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 10:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=; b=c5aVfneYNmh9jld0
	njlhGPu+rWl0UYGpRuHn8lznfimM1uhtA+u7+XxK5T9J2Y/OD/814shd3ksoJTUd
	lCyZlddqjm0EoJ/K630oenoolzgtusKSL04VS27/ba4qXRlvqSGpjbs5IBEK+Zat
	yJyYjpxysOhPwHMwuMGvsX1+QVBA67eNN4PgKz2pIZ8zc8aBlunfa8O4c26Ykyje
	it6Sc2qb+2tWMGMhHsQHYETPapTCqT/4jLNOhBKjGWP3tY6g5f+ZeiEVsNDOj+uq
	+eMu/DOI0zr5p/b7ceZGP1Qh6sLDhWFoPC5Yynhf/sZWJjv0Y1ttxQDF089Tx5+t
	aDxpOQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2905a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 10:28:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso3006925a12.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 02:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781680; x=1768386480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=;
        b=BlrC4TgJS4Xg76NW14AdQ2jbDWYMC0/ZASYPuQpBQcTUZFx1KdDt5thnrie4mHgWsy
         3i+lPUMIfJvKd1TKTXq+WNLIX/Glnjhb92VCYH2GrlmMFYuZh7XtVHSGhs/lHG4akK9h
         DPiIoGUn6EH2WvICuhovcMu6fnjlEAmlsleEjsBg3R1o1KYxIKzzvt76oRElvSMoLOZ6
         eOIzQaapAJd/AaCBpIdNgOYksgo/n4nZaePf16Iwb0FnbpPgye9J7aeCUbCOc5dtx05r
         gHKsHQTMx7MP6ySqnO6zR8N8fiKa2b9umPnqGMBvCXKunCGs7EIsZILNhSKpBYQemmd+
         RIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781680; x=1768386480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omzkZKgyznieTJ1w1lz0EhlmilLFq6GLxal9OURHeRQ=;
        b=ZyKOmmKCU/UGISr9xZa9TI9teZHI2YHh7bqD7dYJ7kpNklfm7BUpixEqWcj2KY21m5
         f7nzFF/KlUzjXXpOkgFlX9VABjbBS3Uf6LG2cwIB+vv17Wt3jBMgpF1l7vSF4QgUIdFB
         HyCHLkQkUx8ezcacHjsGWJPbEoEJKJLDxFcvUBH0PVBceiFCW36kbwrfPxZOzBDMcaiv
         eB3LBeDP0DpTj+A7QskQu7XUof73AT3b93ha55Xh5bxH8+Q+hCNIxRIJmZfCJ1PihzpF
         APf4cx98UPmuONXFby9nXznp7pCSlin5zUDirqznNAJ+hKIbmyY6ED70w1U3ZwGEaEpY
         VjtA==
X-Gm-Message-State: AOJu0YwQ0xz7nmzX9G3UQqpPS+5YSx1+ISuxxpXJU/9KEkhYCP2VHGSI
	3K9zEU4RsDu4VLinHOOiVK6zmDW/6W+Ezf1XZUAZEdBmEZ5x5k4oFxGhn9/TQoBKir8y3Srpo3L
	gJFFsdkAIzhvOKeg5Or7WZV7r4DrYQRLa6Z8gXYYBkhxhA1btWFgrXrKPMbMe5EeQtg==
X-Gm-Gg: AY/fxX71jFCnW6488Llp2HHKTOpBRzHXJV7xu4cHCX/m3nh3T0YGRvD3WLRGazJ2/fd
	L85QziDX2Xi1nju1W9ms7Gdjc3twd8EPqMtwhWO0l9vpldaCJUABWbnK8i7UALrvOpy/+U89ORt
	I6T4LVV76/e8k2tY6vDCg3qE1ORw/aZve++1aT2dLA4+fNsRtsYTEIQT3X/91ytnLyA5zh2jC5J
	eIA2sopXHFcOjAFwi97ta/QvtQNiMZw3sCHpgYmsmjpjOSYtphvyDLQsh9ifyFBv8S7d23BTF8p
	taJFY5BdN1XkLnhtFNmCWia5LBe2iJOy17IRBv8o1ByZnbyz1IU0zDi6sF0mMDRvJoyLhez9pgM
	7TLnqnjD1zk/DOlRl5dSOyz2NHyUrrcNgnz5OjuOzhA==
X-Received: by 2002:a05:6a21:6da1:b0:350:3436:68de with SMTP id adf61e73a8af0-3898f9ba491mr1752624637.53.1767781680012;
        Wed, 07 Jan 2026 02:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPuCY992g0490yz1nPwcMPiCXPxiqcodxyzXRdSDwuApzNgokfbaIZN8xgrL6S1i+C88XVTg==
X-Received: by 2002:a05:6a21:6da1:b0:350:3436:68de with SMTP id adf61e73a8af0-3898f9ba491mr1752606637.53.1767781679598;
        Wed, 07 Jan 2026 02:27:59 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm4734492a12.22.2026.01.07.02.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:27:59 -0800 (PST)
Message-ID: <2ba6c9b8-6040-42d6-83ae-59092ebefbf5@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:57:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: iris: gen1: Destroy internal buffers after
 FW releases
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-3-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t6263Pzj2fBkWTv-7x_coRI0SDL4p1TB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfXwr9aTt4Ioq2H
 RDZ7SNyP9tHemyZ009FAcAbuP4DG9PZFE0S9UNePml/Ptkr7wdN53w8SrtiaHN9fYNExhR0z3ga
 FWFmvHS56S1KDxyUTn/yRl7+Xi6UxbLmVKgTsh6iVPS+fCSPWy0xdaMu+/AA1YT2iTYXlw2nonP
 twq+BpuE1gH69xHygseHHh+alV6dvM5mBwmjCkieR/uE2ZEZ5NSHqop3KxPRsQFjoOkmWBi5eBA
 s32UtkfijerkVsGsYVwxmKdnBdmH7+e1gg3995iknEUUFArK7rv6gpKHOQLNmlerYvzyrs7l1bf
 Hg4M3J79D+T2ODSfJLSI9eK1FhyZHICJa4eZ/mpml6pF1qxXefB/a0tu3FeZJERdZT5eYCyDOKI
 eAWCdcnfht2GAi2MxV90JsFsXVWOc5BGURPwyefnT0BU/X8dvUzqtJx1FkfEQy/+eWwOuWRez4m
 xp72/OtVOqyPdE62kDg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e3530 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5SAIZNfH76eZnwG7RIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t6263Pzj2fBkWTv-7x_coRI0SDL4p1TB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> After the firmware releases internal buffers, the driver was not
> destroying them. This left stale allocations that were no longer used,
> especially across resolution changes where new buffers are allocated per
> the updated requirements. As a result, memory was wasted until session
> close.
> 
> Destroy internal buffers once the release response is received from the
> firmware.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5087e51daa842515e9d62730680fb237bf274efa..5ff71e25597b61587c674142feb99626e402c893 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -441,6 +441,8 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
>   		goto exit;
>   
>   	ret = iris_wait_for_session_response(inst, false);
> +	if (!ret)
> +		ret = iris_destroy_internal_buffer(inst, buf);
>   
>   exit:
>   	kfree(pkt);
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


