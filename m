Return-Path: <linux-media+bounces-62500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFvSBZMLD2omEgYAu9opvQ
	(envelope-from <linux-media+bounces-62500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:41:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE25A61B4
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91054304BA55
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CE0375F99;
	Thu, 21 May 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGYqDLBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7Q4G6FN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB393CF665
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369384; cv=none; b=iC+XKYVvi+oPu3FrCWIAe1FLZkmR0BVafAg7OM3unS6chSBWUR01FQ/qO8DIaIvQJznpUNrkf/DN53ENwbQotT79QaWCSZqHvO1DCrGd6/uQQ/QWeNGd4JWPiTw8xxZBGAQMfnb7D8R0LS/XelwTzVWfbC8X7W0JrnaXbXuv8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369384; c=relaxed/simple;
	bh=o5nagHM7th0l0M7MvXlGGwb3D8mtuYwjEL2ZjRyY03Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEDR7CrPL9mBzy9D/v+La3obEyR+b6gJ7wXdv+9wXUpLEY+S5y6cuN/awgWlNfYudi3cThScgBkwPtDRoXnJf9vzROcCL1Xav/1+YIloEkkJ1RCp8+3UVg4Thk7vaGtpz7auJZttocWj/15EIQVq0buvUTuHYqGTJMvF2dgPM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGYqDLBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7Q4G6FN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99k6A3527366
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=; b=QGYqDLBR2APNi0ml
	rPtkMTeeM3ci8VYpGdG9dSh4tSLgq2CVr3ipp0NeD1donLbZeHoFcOlNDqNiQf3t
	RnZR/5aAIdSsnsvBGjIuKOBoMJK7X6z01ZC8TZYkbHywWp1NxGIm70Wt2JpROyyd
	6JWS7pmo41SopPr/R2MzAN/3tScPzhqClkSHnOztzX0jUDWUeh1dCU0JdPA4mlLs
	vKvZnvxxEyQcyEspOpfpmpdSrO8lhqLJoby1iURckLMgOUqdgu7K6eqwIZOARS0g
	9JXJ3T9Qq/83/cP5rD45eSMKK2qA3NWMmIId3/yV/V7VMg8InTNxccBX1Wwhfwsr
	vXEAdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhqkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:16:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so6145964a91.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369381; x=1779974181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=K7Q4G6FNF4XQYnNWhsrWcIn8kym5I1bBREQBafZv7/V5u38z35PmCgVSFAeOrlrdGU
         X6PyspZIcP/uKAkfPhZZZFc7D6smKffRVeIVlPml/qCDVItIqANuIiBWaVVyGrQZOd8R
         9TFcWPFK94buxD3AuSDxsUSMir7rNCSlmV10jJhuqqgqqX2gtkF0trTC/CBTetQi4ntQ
         CtDQwnIEihQaQ/aCEzauvwDtq21rsAwXN9QsqvjcTIaKDQBxp8ECmyNqwA2BVe1WB/Rj
         8DwDIJf8roVVK3fyP9Xldtyj+Rw8Ng7QYD1FQ5Wb51ywcSOuyc1wA3WHhYkY+8I3Xq3N
         PJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369381; x=1779974181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4xkPIyoFIWb/EvwPELvA4ZCzL3zUVLYvFFaaraU4H0=;
        b=IZLW8ebJbJEdW7JXytZNAxWbmmStAOEMqZzMS2WHDQ7q4Er0XNsWyit1rJRG28gpVz
         efMOyBRgI0NxvF9C/GisxI3/8MiyzBOlZJgVDyR1t+uYjoT8G8MVnxaH7FrsB1ZufKtL
         vMl3rXnLwEhnIeuq1cvwPlELlI/UbTaptQOzGQdYHley8q86qEEn4kebaxYflYpEbcfa
         1OdaxHc1wuVni8r3F9oG1pdBk6lU1Jj1m6G/uei34cGHclKJBzk2Wzz9HmEFbFFDpe7N
         Nr2w28nw1mvqovN9dwMDVhrwbjyPC0llX2ehKCJVu9zzhzdw6hRHjvA7U+kFNY1j/f2h
         Pv7Q==
X-Gm-Message-State: AOJu0YxYV7EPMoNZKsmQcKWbWkTGRQ0QoV5d+w9t0b1MQYDt0ogSYBws
	TpR+VdZA2Ag2o5TRDvOMyo8AAtLMW4cwOJgpcYEsUaEMDiusjuYBaQscnh/OZisG7DX5nGUUCns
	GY9zkg4FTPmwd1SK9ItNfjim3sBMXPCveBpA8ogNDgO0LXmR7wlc0EP4ZLhDcLrubcw==
X-Gm-Gg: Acq92OEEMk8eDXdTXjNQ/w0vH7ESButYEvZHXkZNaffuT0EZVuNGKQe3bOM0ZsZRoUR
	fsl7S/I+cxqyU6eE2j4JIZUyJBrWNpmr3FiByuiuVAEkZUfbanaG3Kk5K7aY7hePhwIPjJ1yx4X
	MyyNx6RHDpIofGt8Sk1i5ZbGTRYhS4iHo4hXUWSXNZH3LS1qToxCHiXpI4Fd8HW45c81mSXSvn2
	BXYvBUi83N8zGetaYZVnTsJvsvWKi7ge/RxRncPy+UAzUXERhn/4UEOkKyYI3XycZn7qt/nt5qM
	WYwpEtVJivpZOxiHXS45Hfl5lVPdYZ4pYXDiEQFJP1gZn5mlEDWEC6UJta7vsnyIchnpz0Xv7gr
	0TIbgFIMc6FMRnYhF7eiLtw7Qw/ButQtfCgTV4U8v9H04X14f6FCZGmjbYXe2V6s=
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836406a91.16.1779369381098;
        Thu, 21 May 2026 06:16:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d88d:b0:366:4a47:f267 with SMTP id 98e67ed59e1d1-36a4561b310mr2836371a91.16.1779369380614;
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Received: from [10.206.98.135] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5afec699sm775780a91.4.2026.05.21.06.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:16:20 -0700 (PDT)
Message-ID: <6bec7091-6fe7-4cea-ba2b-f405369745e3@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:46:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMiBTYWx0ZWRfXxlM5KyfVgqlR
 AWYcxPNU5BG1DILLYzvHRBiEg7pEbo8ws3MTGj3hXivbabPsAWs2XPywPO0oavahpOOfCpk7X3r
 3Kdk2EZoKEGjpQwnRC94+rNM5syBBRqWp08WcXQA/lcaaG6w90jQAdH5w6KKB/ksgYaKa86Qpek
 D60atnuqIOKLq8EHe4ZvExl7s0oiKXK4GGTBZfndTNQ6ojqpj4J7wus6CFeTRu9YjkJ7x2ZlJcg
 5P4nheFMx/G5pNJ7qlLOnYQ9yDBk93UNbTGUBzq4DifIvLsEVLOtLIfOzVOZg4KJyB2xQGbsBc8
 ro0OP+6ZTszK1YVK8r7A+a3qwcnH0snaVA2fMMl98DL7khSMUI2DTp5xIqa5HR98HOXcTLefs3f
 CTal8+tqwHm8Qg75nqwn1p4EP7mm1OiNw9gYYikpPAY3Gpnl3DCLX1IMLQQXzCZH7dVIt2v/41k
 a8BABCc4XwsG9l6I0Ng==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f05a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7XmJ_PM_-5BJ_RrxexwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vuSKsh5wQFaXTuLF4KKFqrfnert07qVB
X-Proofpoint-ORIG-GUID: vuSKsh5wQFaXTuLF4KKFqrfnert07qVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62500-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acb7000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6FE25A61B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/11/2026 2:29 PM, Wenmeng Liu wrote:
> +        camss: isp@acb7000 {
> +            compatible = "qcom,x1p42100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,
> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acc6000 0 0x1000>,
> +                  <0 0x0acca000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
Please cross check sizes for csiphy.
> +                  <0 0x0acf6000 0 0x1000>,
> +                  <0 0x0acf7000 0 0x1000>,
> +                  <0 0x0acf8000 0 0x1000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>;

Regards,

Vikram


