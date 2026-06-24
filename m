Return-Path: <linux-media+bounces-65512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ycTGByJO2qGZQgAu9opvQ
	(envelope-from <linux-media+bounces-65512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:37:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A16BC364
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:36:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D7Ig03zo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F7CrBAzs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65512-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65512-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FE893009992
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FA93932EE;
	Wed, 24 Jun 2026 07:36:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72F2EEE92
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:36:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286598; cv=none; b=FbWXa8GepDWcxl9owEwEzorpl7LItpdNMu6YfrryAX+1CDFBZsLYLY97Xtr39p3O1YNWX2LUrYQBJO3iPv7KgGM6tN25qQy2A1G3yMBEz9kS2NR+zvA6KCnotKlZ4eQy/muGt1YCS2NrhXYSHh2WaIEfdRAKqNQLUiNx+Tr5Lgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286598; c=relaxed/simple;
	bh=tDDoK0gI9NknoyPvkxNP953LYm2NW/AivRP4ykYPyw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCjxjVqGeYRwkbr9qq+V77Dlqz6jZsTQwFRDHvvF2cG5TR5bcbXpLt9Xxv6xWuJlE7r4m12owGIY2+XzTPXacyPozmMGODPrR/K/794LOuUdcrDIbJRSHGcSisl+T0wf+GwMtQRIwVn3cXgqh+K4bwqRV25GsWHP3wG1NZnoJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7Ig03zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7CrBAzs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uHmU2460740
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3VJr2nXkN6JkmoVWffh0E+FdJk5nSbPALZBfnaspT8=; b=D7Ig03zo+nW2WwyQ
	nZo+YtlgYK5d8LA6r5VPGBjsvGBxbk7lXQnuU6Qho2sFj3YiXEEdnd6gCuqh+Pm2
	SQkjSp9IP72tUB972qkp2LXng23cIGgjSMo283khawiqr0Ups1Nbe7ieQfPfH4Iw
	IRS5qBDlpNmXP1Q85jJVAeu701laJowZBdDN2MoeZxwBRg5JP/nxqau3y1n7KZSZ
	GjVWvIG1iiz3fUPpq7hH+sQ85tpx2BzF8FvYNSvgNYyTkTEjUQR3WjtxVa3SfJ6y
	sJ8Hns5Y3kTOHpzVQbpHaJTCXSpZRi1K6l6ap1YlJwenpdTTotOhGl/VmTQlAWd6
	6w3DPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh3qpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:36:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc4d71a6abso19914756d6.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 00:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782286591; x=1782891391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3VJr2nXkN6JkmoVWffh0E+FdJk5nSbPALZBfnaspT8=;
        b=F7CrBAzsaz9oBvlBQI2G7WEiIM5tZdZsBpcun8cZGc/F2RpXo6SgYvrQ+YKNJHn8tE
         kDtYy1X7HKqHBxXli73QRsPEad+LVpsIL44qLTvAYcZQrva25UxCPWqrZwfA1VqOfp1r
         DvhxMk5u2NwyliKPeUdiIYefTwvh1y53aUyuSvBLvpZLc0kW6+Iz3q0XORim3BMzNM0f
         cv25rDW2LqxOkHn0Ht4LhfJIxyAnKOitrW8WVgh0LQhzCFvviTmeDcw9nLO3JlTv8qzS
         opc+vaEd1utVqknjhc64CoFKPu0Gojc4Z7YeI/bCkZteLvRp8eaAVuQ0w8P9LXJlYZRN
         jvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286591; x=1782891391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3VJr2nXkN6JkmoVWffh0E+FdJk5nSbPALZBfnaspT8=;
        b=DwvoUyPP6FVYuNkDo7NHTV1j5WiaumsbuDXaEaF2kgs/Nciyh3RMLQ6nRpz5sA3xVp
         hfcYpyv063f133Mc5WCW1EfgrsAVPFV3wrwvRjstFVM6Nxa/5uiULDhLtd5UULYZzMl/
         8TVMMnCJaSLWiBA/Cpb8cglDx2xyds3l2A3ZUmlVnOt7pzoWM5tDk8+o7mqzDvQEVWlF
         yV6Azp3XP3BLUeJsB8WJJThDWee0/TNIV/KWnXvJHZeqGqBJoamSYghuKpFWwxk2MGhi
         Jelai8W/tGcHJsIttShIqqCLRSWfRI7VfexeMeq74FoELEOShaVhA1CeZvStXggcC1Zl
         EUFA==
X-Gm-Message-State: AOJu0Yz60btY/jRoQucrQyowLW7KChFDD4JA/SlLFe5ndY/llEY+f+U4
	OM0JMcs9OWjtiln15Y01TTFMdBm8EidWlxeW5lmXVEf8QAyoNQ6aAIsI0St2MnB2DkFbJJxOZSc
	IcQAEn9GyIzaXL1UYqG5TjaKH80MYW70PpB6bRgWGlIX97PE3YAC9K4Lij32iJATt6w==
X-Gm-Gg: AfdE7cnpIYKNXEBH693ngXx2hQpscSjLhYRBKPTIvg6pY7yD1Rw/CJVbThP6GqAlTOG
	ubK+mnvKY3MTNLQJ4V83lztGnspxjAN9SkTsGq6AdC2JvxkNqE5S67B6sxX2LkyhrrQc8cT4mMS
	ievTbBm3FoGMilHq3sLMtJdCbK+M6aP5mxCgFVHy0gZZBBpNQSyp0SLtO/ojgW4nlUxG1lhH1kR
	+rdBt2OfwBOQ7hsEakYwQuQhV+YPtcEWfuPoIN5A5LGPAFe0df+XkEZ9EGyBxwai77lqKozFXr0
	e67O2+nJ2XrIVIb0THdvLzRNpifj7ZpwGNR11ilcYIHB8L5+pVc+nvqyC+NMsDAqkMhbhLjmjbW
	J//bscoq84iVBYe8LsXdZ3HUiFTpCAMQ1G70jkOfuuOrHAA==
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr377968885a.18.1782286591008;
        Wed, 24 Jun 2026 00:36:31 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr377965585a.18.1782286590436;
        Wed, 24 Jun 2026 00:36:30 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8acaesm616235666b.27.2026.06.24.00.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:36:29 -0700 (PDT)
Message-ID: <72b8e47e-df95-46f4-8c42-91f07a328065@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:06:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] media: iris: Add framework support for AR50_LITE
 video core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-9-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-9-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX0kQmOqeWEYme
 sr6mH1E1ZFIzPrWYXqBFh/7H29sXpDqLfKQT0kzqG0JV3wPBnS3eiGRqReyQbW7ITR6SxSu5j7J
 uLFPXC6eHEVbIH9SNc1TvJvXKhYdAUWB09KokcrneNYSm2kktuBrUQjYaVC4vF3Mjq540Z4+u1c
 SOybgB4MSPSJCwCKpTqXd+sa6X6235UB+zBWWelC9OEzjGkqrEVluQJmusEJ7i2lyZW00+ednoo
 BrgAlL06ydma95jP2m3XiGOsaSR9ebubB1R8K30Cn/ihfN6i6/5ZZf4JevzUqtqreDabUPsmZGi
 kbOMkNw0TkuUJb9mc3eA2EhI2CFxE6hKeuFNJ+x/AIPYVj2HY3Zdc9kLhXNLFMNOlwu6SM+cjbZ
 b7r/9pRRdE+JCH6YCVaRVCPjjnsmVeJcTCltYhPw9Ny2ZQkeUdGv776eueaLbco00OE8Tf76W2y
 4pXalcSKvZqk6tENSow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MSBTYWx0ZWRfX3Zp63o7iZyeO
 uqiCobkNFk44/ciIVVpGuUy1Mjd+xYC4kf8iXbSuY13yTxFF0vh0YIEVbMq+fp/VYWTllwDGQ/5
 MPaMyXup36/Yr2PfXEonIEjCYidsHYc=
X-Proofpoint-GUID: B0OAkVk_CbdBNFANpTcunoLG40lqcGTy
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b88ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=9U17wRWtyhLDe7ZN7ogbJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lu1VWoxmIdvzX4MP_goA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: B0OAkVk_CbdBNFANpTcunoLG40lqcGTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65512-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85A16BC364


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Add power sequence for ar5lt core.
> Add register handling for ar50lt by hooking up vpu op with ar50lt
> specific implemtation or resue from earlier generation wherever
> feasible.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
>   drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>   6 files changed, 164 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc439..f1b204b95694 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_vpu2.o \
>                iris_vpu3x.o \
>                iris_vpu4x.o \
> +             iris_vpu_ar50lt.o \
>                iris_vpu_buffer.o \
>                iris_vpu_common.o \
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index accc1627defd..6a189489369f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -74,6 +74,7 @@ enum platform_clk_type {
>   	IRIS_VPP0_HW_CLK,
>   	IRIS_VPP1_HW_CLK,
>   	IRIS_APV_HW_CLK,
> +	IRIS_THROTTLE_CLK,

As we extend the common enum for (one off probably) SOC specific 
entries, should we bring in the changes to migrate this to per block 
clock data, something which was done here [1] ?

[1] 
https://lore.kernel.org/linux-media/20260610-glymur-v8-6-1c79b9d51fc0@oss.qualcomm.com/

>   };
>   
>   struct platform_clk_data {
> @@ -315,6 +316,7 @@ struct iris_platform_data {
>   	u32 tz_cp_config_data_size;
>   	u32 num_vpp_pipe;
>   	bool no_aon;
> +	bool no_rpmh;
>   	u32 wd_intr_mask;
>   	u32 icc_ib_multiplier;
>   	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index dd2eeae0d9eb..5419a5096b00 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -12,38 +12,12 @@
>   
>   #include "iris_vpu_register_defines.h"
>   
> -static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
> -{
> -	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> -	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 mbs_per_second, mbpf, height, width;
> -	unsigned long vpp_freq, vsp_freq;
> -	u32 fps = inst->frame_rate;
> -
> -	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> -	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> -
> -	mbpf = NUM_MBS_PER_FRAME(height, width);
> -	mbs_per_second = mbpf * fps;
> -
> -	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
> -
> -	/* 21 / 20 is overhead factor */
> -	vpp_freq += vpp_freq / 20;
> -	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
> -
> -	/* 10 / 7 is overhead factor */
> -	vsp_freq += ((fps * data_size * 8) * 10) / 7;
> -
> -	return max(vpp_freq, vsp_freq);
> -}
> -
>   const struct vpu_ops iris_vpu2_ops = {
>   	.power_off_hw = iris_vpu_power_off_hw,
>   	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
> -	.calc_freq = iris_vpu2_calc_freq,
> +	.calc_freq = iris_vpu2_calculate_frequency,
>   	.set_hwmode = iris_vpu_set_hwmode,
>   	.set_preset_registers = iris_vpu_set_preset_registers,
>   	.interrupt_init = iris_vpu_interrupt_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..e084a5b49f2e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
> +
> +#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
> +
> +#define CPU_CS_VCICMD					0xa0020
> +#define CPU_CS_VCICMD_ARP_OFF			0x1
> +
> +static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
> +}
> +
> +static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
> +{
> +	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
> +}
> +
> +static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
> +{
> +	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
> +}
> +
> +static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
> +{
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return 0;
> +}
> +
> +static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
> +{
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> +	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_ctrl_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
> +	if (ret)
> +		goto err_disable_axi_clock;
> +
> +	return 0;
> +
> +err_disable_axi_clock:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +err_disable_ctrl_clock:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
> +	if (ret)
> +		goto err_disable_hw_ahb_clock;
> +
> +	return 0;

...lot of these per soc specific clock handling would be removed.

Regards,
Vikash

