Return-Path: <linux-media+bounces-67266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id odXdIMTIUGpA5AIAu9opvQ
	(envelope-from <linux-media+bounces-67266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:26:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180F739AA2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:26:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="d3aACU/L";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BG7zcP0i;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67266-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67266-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2446300D34B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF08407CD6;
	Fri, 10 Jul 2026 10:25:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDF4071C6
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:25:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679138; cv=none; b=pgwcfznYTgDHoMYfbUOcYwZh2LemG+OSOr44PH+x+H9RA04450ZHYdFcUSuHYqHGbHkk1TZOQl2cEBo4slz7BS1I1ezw0Eykz7yORVfVnxjeRLuB1hjmVJSItXvxn73yyDvZf5Cy/k7WkHO4fS7cW4sX1AKbIVzAYQpasW6sCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679138; c=relaxed/simple;
	bh=Z9+ukSgv8behdz5igqcYAaF4Pj9GakPc4OjzRwDByqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEwCFPzD3f2ddlC6G2KADhtsMY8HJPjAhw6z8tT3jTltvYGrQiVmmP9HGdvma+CRoMdLE+xQr3ZPHjqZ8Do7IhRJ0WMVba7qAgVbiUdR+ez+xtpB6uQOOr6lZMfCbaU6CKOl0irPruB+XH+f0/IxTo5jwh1agfPh05sItCjqOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3aACU/L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG7zcP0i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dfVl000391
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=; b=d3aACU/LgmjwGmR4
	CbApjCYNLk8MDaIEB18c9dNJobn7pdmGb0Qm2q4OQJw878quv2fdmMKLmeL4Skm/
	hBR4ApbQoN3bS16FhaGA3stC1akYCLwZIaUOIy+qBmnHmmG8oioVpSkkQiddJUYw
	Q2BoNcMdxpgt6bKkc7E4w4Ucx5LHqlhszl5eQxERsq58CUf15CDhryPsIVaOYNPc
	q/mnKnmc9DGGOX4hfYH+k7qlHWtimju3BFruqskbPYIZGI8KbtjLmvEErbjtJEM4
	hXDgk93iQHnoFjR5SchQOGyE4AgyREoco5R28eLKxV6AmPGxX03ZQCLlMOpXXIUc
	H6EIQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24utjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 10:25:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so17213561cf.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783679135; x=1784283935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=;
        b=BG7zcP0ilhmJHVQXSctEBiavkny5wg47ysJ+ypkyf6NW6Uz7RJZJzjd1P3ODwQBgkH
         glkl0EA4xS0XExHxvfScAAeWREq13agKyDxux1fTRgGVgG0DsNJ5W9EKNsSb/6LJev5V
         INEikomtiGU/JJkatsHN6U3cO0/DoX/z9zeCUBxHIhS0zkml5itIXQ30f9cdWzarV/F6
         DBg/G9RpMhXlCYuKHzZoioq/arqa4csiYRsvFaQKwU5qXRK+rk0+biuSkJE24VdBX1Vd
         d9G1OU1hXaRAb8QE8pw/z2wTIdnI4g2N2Zafn1yp2J7HBJhJ8WMWlbP+3OmpiVuEEai8
         eT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679135; x=1784283935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUlTfSYXAgoPa4vw0S1q7BIkSnsykyt54uNZwdM7Wys=;
        b=hhtSR8JoiPYG6qGvKn8QrPf1gHbeEmgvI8NFCmZ1ADPOnGca2NvPAnJo5wCbHWpklo
         RIa05noLxjM9pL9dLeb8pQtF/QmIsNSQFysBRPaEh0WfdMXXvndgd9XKhnHjrs3zsIB0
         jboDgeq30GQmxRiVVPVl8W45SqImLKWebai4KhEL/zCVLkgY8lxNCV3UkL/lnrdy/K7W
         T/0J+s4lKvUXQuDOlTKIwLAXatXLYfSCcqs4/TbJpQ4hP30H0jrHHPxv7GxJT9Q1H4NF
         o6/I/kZNgulrCF0RACiESnVJsSZthqNlGyoBCZIbs7xZDfX9BOJ6idUjyPgOp6SZ+0Be
         zQMg==
X-Gm-Message-State: AOJu0YwQPCtwB6NNb37phUhGEK1uyeLS6UNeV9/mTq9RbY4WAWxpEuEo
	ajZDqtiSbxRwnPKHaNfWdXRR/Rt/ynv823AYJ+xLZrn+hFCKRGu6xavEqFCyLBu3uO84A8aR7ov
	qpUuUI5WMT2gmGXam0AwHjsKiyWftCFb+ILF44DFm5WvJOa/RwjxKKyAWBLlGdSTs8Q==
X-Gm-Gg: AfdE7cltBCH0FQvy5HUKDvAS3xRQ0ZwTpnv9s7ZQNMY449zmZbJoKKAHyZqSu5GSsIf
	hb3SJfm2sGeI4bQDQV76DXw1CdoIR0beAF/Pehz45I3rU0+z8Bq9eltoKCgHS4NszELcsXw2vtV
	pjCuiadeHzmVxJU9rqZ5EPiRygesis900IBk56+CJRe1NCDfp/jp3UAHxQd8HZ+5fFpsRFKGNmM
	IGBFg57IpgHPn/O3A65uzXuBQxbUvdNoiDraIWogO6aiSVammkMJ+V+CcBd8l0vEy5mvrnpkQ39
	feFSbDWETYTk/V9ar/g3YL6hM1XIi1NYS19rldfbDwhIx4eXax+wAhJihqnCX3c1kWr8PhnoJmX
	rDXpSuAdina28Hd9VtnJGX5xHspxWPrPBQ69db6gXJxB5
X-Received: by 2002:ac8:5f11:0:b0:516:e249:e30f with SMTP id d75a77b69052e-51c8b49bb4emr116835021cf.42.1783679134713;
        Fri, 10 Jul 2026 03:25:34 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:516:e249:e30f with SMTP id d75a77b69052e-51c8b49bb4emr116834651cf.42.1783679134203;
        Fri, 10 Jul 2026 03:25:34 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbee72sm10785038a12.30.2026.07.10.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:25:33 -0700 (PDT)
Message-ID: <8131d408-7822-4bd0-bd6f-c4145ee7de5b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:55:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/18] media: iris: Add framework support for AR50_LITE
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
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HH8dQaDGRi1A0etyQSMS_wqvH1HIax-n
X-Proofpoint-ORIG-GUID: HH8dQaDGRi1A0etyQSMS_wqvH1HIax-n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwMiBTYWx0ZWRfX49cr2hyd+aUZ
 2SbsyOP0PBumMll7BJUpr6z28861sreNWxxDN24q+SYr5DSQbzxbzrr/WXjJlECg+Xnq23mQgLz
 6sT9kmSQS5eGgEuWmLTH8jrRE2Cjm0s=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c89f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t_zrhGeEmQNc_LLHSoMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwMiBTYWx0ZWRfXwrs/270W0nH1
 NEF4qRL7I/BH6dvurDL/tWhVdEgPLQ8htGl1b1txHHF/qbZ7NZqvmhVKMKJlSac0/2gm3scyOmG
 di5QuEp53BmtMxA3fjGMJGIvW1+v6z4khW89M8PebR1nBswWS/vSoOtjPa8WH5RGC86Q5XAz9lk
 ZiVUIG3WvLj5Ho/c8UZMcXaTEF68Bnm6IV+I50NVZ3LUHM/oBc5492hb5N7EaVUM1lYcfeAu36C
 hXUybPr3JTGHdDHfWcjYkJWzDSyvQ607BGgYAIB31PrgI4TbpPWji12hfXQ0OOemFCwf126B2Hs
 otY4bOEwm8F1Ozh92gWhLpPGPZipfcjLRrs156alhgQrL943BaO82bFP3y7aMoRhRwIKE/9MLR3
 c8qbcb90aYcrC1gxWAa0meNfr9/HuQruqO2ggJqWVs6pBLsBA7kU958dxj6q3CcltG8YGtT/QWC
 T7CT0olXve6FHlcFANg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67266-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1180F739AA2



On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> Add power sequence for ar5lt core.
> Add register handling for ar50lt by hooking up vpu op with ar50lt
> specific implemtation or resue from earlier generation wherever
> feasible.
> 
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
>   drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>   6 files changed, 164 insertions(+), 28 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

