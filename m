Return-Path: <linux-media+bounces-22249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D29DBCBC
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E6D163271
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCFD1C3041;
	Thu, 28 Nov 2024 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvUiWNMK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826EB1C1ACF
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732824131; cv=none; b=j+ytQNzFcRCj7rrK6aQrXYV/TkrL8TohVfl0hPCdPQvjtWmtukvg/PePuQmqrvyycJGg1Rs2t6n+Uv9Y4AI41NuwcyHB8KonPoVP2WffO+Ikc4QGOYVaZ0i9JdHN45O+JQYtup/o0Wbgbwc9FJ3KSzdneizFtNHbhGRiS8MwKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732824131; c=relaxed/simple;
	bh=qTIa5ewcdNKi4ufBLVG/FfPhgpbjosm13dgaf9cJ054=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLNWmsNgsH5gwi+hlcQlexRUKfmuPaHRXKMfarMFc9ollBhBoyP1KBRJ4A7QLJBt905lFnDKzhMEc5wZ246ecY+pJzaFYmE9Mzz6EbotkBL3tu8Bn6uFGveiDA3Hxni004N12cVkGLUW/jS0nePgktn4XEj6UZ/9iDt1h48tLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvUiWNMK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASI02lX025832
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ryxQrLv394JJ73iyw7kDdXCsPIHG185hp0I0Nvmu6c=; b=UvUiWNMKnpTDutQc
	WV3kG2XZiNzbBtXjAZ829NKkce5K2CLccRZhnSLVk4Cbi2NxLiV5DMW7vhbD1O16
	tTNRm11Y7hZkbQGPaeLW4kE1sMIzxnSHoMFNW14C55+CzGe59T86T5nZER7Vowma
	xdloOROkBGn180TCqdQTAB0XK8q4ZOEQeiL3hSORHrsMc7J9Ds+Xai8UHOM0zyxG
	mr70Tq67GMlXPNk9BUeUmgCqwAVRRZSpTlo6/uAyCCSQYcutwFTfu7SjgBfIyC5q
	ChJkf2SsZhlWy6FPEKD6ZgEz8GLjAQGwHRGjXPIyZ+JfDNSgCbS+Ia64XYTgIH0m
	FyLADw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jbk4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 20:02:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d421ff3e39so2936776d6.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 12:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732824127; x=1733428927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ryxQrLv394JJ73iyw7kDdXCsPIHG185hp0I0Nvmu6c=;
        b=fHJ+Zliym2X+C5iG/lODZxa5E7scJd/cC2KkJcGq/UMLUxevApUx83L/Rghbc+4neV
         PrYqakLiWS9CcttWHcQsseaEZ1NYVFnoXWhnT6q7hYAzbNsFs+2mk5o4PtaefrusJqNg
         2pv4QYIZg9lqatZN0g5YOIhRJU8ezOYUxHWwP9kM9fTXK9QaNwAocXzSlNoAyGYNmZqZ
         rbTTM9uOkjIPQWUdcDLlGz/QVQn3xo55rpBs0GwZYtlqLozQybBSwqgtAgiycYRyQwVH
         L1x3fxF0nP6i9TrVyLJB05oJmQs0ffZ4d364RguvdRM5KJSEifFD+r+OoK2ArCwvRoRb
         8dBg==
X-Forwarded-Encrypted: i=1; AJvYcCVevsGBamy3eCRQqnCbWNi6iS7K+i1xiKh9rPfdKiix7FG8QSLfemt5MAkL3i0vEYCr9n0OFmoYuJHKXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYPLqD3FZxIcHRju82tTloRBdclmyY0TDt8uOE4TtivA47iffc
	69vSRYDxDLPFL5aa957N+f8PggfXrBxCl0xx2ihB0ltbPyDVuDu9CxsDQ6xVlGGDVxsehndP3Xc
	s6EOQbjtVvcSpl+OYeOeDpV7rHHYi1SeCpuS2yB0P+v5WIlmktQtGDM5Sm8OtCA==
X-Gm-Gg: ASbGncuZA7TC3DTfJryU9ktGgMNbCmKHqwAqbBmKftA5i/0qWtQisOZTS9LqMY+NF9U
	67nZt4bhVfRC9qJ+i2FhpxoEF8FRxAJB5F4b+qWfKOOrPSQDr1EtY7DRnsanxpJjLgs/UTe3TYq
	NqbUgUyxqh2WfS9M4C4BP9u3rjIirTi0y9fcGWQZ7o9F4UwsEC6n23gizG9GIi0KqGfQH3vOQQK
	+5ok+H/4zJ3TKWmBaMP/Hb1OKWt0wxTA+UsLW+ko3x8U0K0uxkaJy6NWKooXo9t/q8A1v61Abfc
	r9Y5l7APMtZSB0qfnwHZ6VNowvp7Wt8=
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id d75a77b69052e-466b365e8d0mr60111061cf.15.1732824127025;
        Thu, 28 Nov 2024 12:02:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe2yFrYKlH7GKamBIcOIr6tSYjrJg4Yf/IcqIpvGJ2yK7SICcuObbV3wRHzWvvMeRae6au7w==
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id d75a77b69052e-466b365e8d0mr60110791cf.15.1732824126611;
        Thu, 28 Nov 2024 12:02:06 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8dce0sm1031189a12.66.2024.11.28.12.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:02:05 -0800 (PST)
Message-ID: <7d344377-f1cf-400e-a9c4-442123dcf4ab@oss.qualcomm.com>
Date: Thu, 28 Nov 2024 21:02:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
        quic_dikshita@quicinc.com, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -EwAEMS3BtQMoh673pLn3cUjqlCB8w8D
X-Proofpoint-ORIG-GUID: -EwAEMS3BtQMoh673pLn3cUjqlCB8w8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280159

On 27.11.2024 2:34 AM, Bryan O'Donoghue wrote:
> Add resource structure data and probe() logic to support static
> declarations of encoder and decoder.
> 
> Right now we rely on video encoder/decoder selection happening in the dtb
> but, this goes against the remit of device tree which is supposed to
> describe hardware, not select functional logic in Linux drivers.
> 
> Provide two strings in the venus resource structure enc_nodename and
> dec_nodename.
> 
> When set the venus driver will create an OF entry in-memory consistent
> with:
> 
> dec_nodename {
>     compat = "video-decoder";
> };
> 
> and/or
> 
> enc_nodename {
>     compat = "video-encoder";
> };
> 
> This will allow us to reuse the existing driver scheme of relying on compat
> names maintaining compatibility with old dtb files.
> 
> dec_nodename can be "video-decoder" or "video0"
> enc_nodename can be "video-encoder" or "video1"
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Bryan,

I'm still not sure if keeping the logic behind this makes sense at all.

Could we not just call platform_device_register_data() with a static
configuration of 1 core being enc and the other dec?

Konrad

