Return-Path: <linux-media+bounces-57878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKFOMlwTzWmMZwYAu9opvQ
	(envelope-from <linux-media+bounces-57878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:45:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6CC37AAAC
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 14:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37D5B3065ABC
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01140F8D9;
	Wed,  1 Apr 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWt649Uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNYKuYnq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBFC40B6D7
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047353; cv=none; b=upElkkFNdFU3SWqk4GWgILZ9lzZ9oLn/Ok9Kysy+LGwbIv97EbkGyILZ6mGtpWJUKDXL1kBPIsfs9pBBTpiuWECaK6Uq99Psi0F0ESxbyguGT2UUGhquIAzVqLcWkxAFyNdCAtSHRI83Chr7RfUnpGJI6/JxZTZGZNr0UU8TpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047353; c=relaxed/simple;
	bh=4VNHkZet48HIA2G/oH/xkP9Weg9tgt41vv9HSbBAhjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsTxR7xwluWejAztmzJhUsuDfC0oi6ecCgPENFh3nzG+Ftr81U9Q0slc+u+F+cgMRKyek05l8pYW1uKSDYi4T6CdW9eVf4mD/5+pqJ9PR7N8fFICZpLwfATxFSdSU3IuXi4WJb3wQlNQUr5thKze/kJ0O1in+c6y215zGI9pkOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWt649Uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNYKuYnq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C97MS4106868
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 12:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=; b=lWt649UzlOP3AvzP
	mYPRppee0Q8pN2qFrKGGbVLbAU9U964rFaro1iEEbqlA4UcqZWulX0EdiimjUb3y
	8VkRNC4kbIXvjdcEf96lFirscvl2siaHsAFi4ziFVGQlgsMzotGUYKkyos1o0CM0
	hLMfJNdm9x44Krb7gwkdFoFchnyizpWi9hTyv+DX82dfFrEqwT2MZfr24YVqD3Wl
	HG+Ztfga+wFob28SO124k/YhRgo9RHdThIKDQd0i4Uhz/rTnKzMcDY152pGWfHEn
	HbbCouXP4wfsiaOkIPiPtuS4WziacNE/5LM+/Et6CpSDbHdiZtvbUv8PO89XuJTi
	nu0wxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt91cnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 12:42:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so4301801a12.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047351; x=1775652151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=;
        b=bNYKuYnq0zjaHuCPfunc2TBqXVqSXPM2LqHvu05s7dDB4JJvz5LgNcWGFrNQ0nWWsu
         aMVFPogzBqp1/anf8CReZxkRVt4gyN9wK5m/lIMqCLl/nrg8jILjIh7qt9vYEilPbTI7
         bbJoj9Gb3KntGcqK7m8KNcBNKqwXbmrvHcyFLO3sKrZtj1pF7YuOLe+NR+TWpYgO/CQX
         LNnzhwwybqDYDxMtGhqZwPgX5oliAxGL8hmXjcWbCxXsZPi06jvLmRlKZBGQtPGz5cdb
         vCBfadbATK1Q3/SwVoGKg+Rgr2stlpBmKnfis/jZCyZ72D6UJdqDjoefeYJgyskmeX0d
         vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047351; x=1775652151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=;
        b=Yl3u+o2ADeJRf5u6carCFbflpz7McOEFaKlmIyDZB4fYdZCIFqOKCwQbfF4OqDCCBS
         mB5y2nN64i4Caw3xx73HhxbmowJRHs1DYkPaBIEDJ+ISUtuN7gjpRoFsB+jsgT/nCRWQ
         +UKH1eI5lVbqssxjLcmLqddsy71xO8o9jUwJegyZssmAyjMYoiJnMI/4rxX8aHh21C0K
         qdoCAvRDoewzCrmUc6rFV51V43ksTrxhHuFntTqLVYfGnGtz5hts44swhi2ZNVGF7zzD
         y4n5znYsqvzVVVY5O4GJpm6gP80UDR4zk12DOlaCuJPs9gJuaXl4hafxr7yWVaIUrZX4
         VZ3w==
X-Gm-Message-State: AOJu0YyhaidnBLpIW6ZbTiYs4je6BEdmsdMlzBwj01Gn0SynRGgQDf+9
	+MlnFr0BUcKulxjBcUpK1JRS0/Q8yIEVFY/SoOmNo+gNYuYlLErC6gFTpwryuagCssJloWlslYa
	puL6CIj5sM4GeMS0Jzphl9esSsnzPajW0G2vZZGlNzoT4qb/q65LQSh8Rk0gHSKrVJQ==
X-Gm-Gg: ATEYQzygXOpclT6dJTcIq7UGED113O0XivG2jxFg/+NGxfWFwx2bGLWhNOZJSr9spve
	s9WMDvACE0ZSBgHFzuN0Ou45GERObf4uRX9T4OHAvejk3u57Tso0WhOSb3TO6xrWaxcJa1yQxcS
	Ae39c/9S+6AuSTXDabXYPXnN4DCcVHBkZA6UJywuNsyUfPcINtpF+MPCnE+4Zhv/ejqY/nm2vav
	Kb048No6EXrxjARJ9P9b5uUakBI9P74mTq4txk7rM7L/JAC/sV2ExedgJW1tPbC3sBTkrKhIjMu
	e4IC8CmxtlHT8018FvqPF5co2DY2uFK5WjmNJzBMxWvXeoyiKMdbC6KTSaINU5v1x7EUFmAwor9
	f3qcZYtqD5yv9Up0U0QHmgiL7HWHJJPhbfbJojDFErAu8xEqObaPeRw==
X-Received: by 2002:a05:6a20:431c:b0:39b:da83:91b8 with SMTP id adf61e73a8af0-39ef775965cmr3890484637.53.1775047350938;
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:431c:b0:39b:da83:91b8 with SMTP id adf61e73a8af0-39ef775965cmr3890441637.53.1775047350486;
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db47esm11859657a12.31.2026.04.01.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
Message-ID: <9f94af36-6460-c227-2735-628e45819a03@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:12:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: purwa-iot-som: enable video
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IqKZGqrTcBfPdqWTUvyBQWkZJsWXH2tK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNyBTYWx0ZWRfX+Xod80bZHQQI
 jnIBuJc92ho2FSkAJX1IXUPMV0aGvgy5/nZ8uZ1zBI+XlFxE/TzfCjC3jZ8Jc2fSqDst1weeYM4
 fv7Y8SOYlL+ocRNwk5jiI20Z4oIALHm70FDbqLKwWWKDLSopmDJKD3YtWaH8A3AULVPfwyac1jW
 k4tQwmU8n39Pgn1ZcE5M6ospOoxhZRhHA3UUA1KKbtogqu+glvwgS32LgY+S3wzQOSShB0ANDBE
 VRqTguwGAmah6bR5GXoTvdfx94xkOLuq2YC+wu7E5KyKj/LltBx2LGZ11Pup4oc2s08a3V0fRT3
 08r1NKIXp5dAqaga1cEjp/fLPTIfIYCiN55BBYcpnqEwin8OJ96QEDm1ZuT+e8nE/Y2B6d7cxMl
 6NI3x2SA1MaqENEuTXamHXZxn7uDH5CzKPoF9etQ+kjgSCRcY+LAWuJ/BrZrx8ZgaOCEVO8ynV5
 u7oZvyq2yq1CIVu8uhg==
X-Proofpoint-ORIG-GUID: IqKZGqrTcBfPdqWTUvyBQWkZJsWXH2tK
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd12b7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qPc0ztvaS6VGMkP7hJMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-57878-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C6CC37AAAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> @@ -389,6 +389,10 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
>  };
>  
> +&iris {
> +	status = "okay";
> +};
> +
>  &pcie3 {
>  	pinctrl-0 = <&pcie3_default>;
>  	pinctrl-names = "default";
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

