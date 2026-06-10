Return-Path: <linux-media+bounces-64429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3HvFCN5XKWpeVQMAu9opvQ
	(envelope-from <linux-media+bounces-64429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:26:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDF669431
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:26:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rro6mXnw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N1eMuy+9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64429-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64429-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 488E430FAA3B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3232404893;
	Wed, 10 Jun 2026 12:20:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFD3C10A6
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:20:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094019; cv=none; b=DYpx9D1qjGmrNh9ftFjcyWwNzzwGmFXVtdwpwfyECxnVRHveBRANbeUxehBb9E4HMMCLGezl/PD3kIqacSf7iIIl3ljTOizC5ky2AFKaDZ5pJx06DMKrPBwVs8wgP8H/jUY3BMAqcWbpwo3hQriXQoKcX5E+TQRo9StrkVNlaHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094019; c=relaxed/simple;
	bh=n05w7UKa4EOGpacFVht3bcetkCd2ImYv2BLEkQIR8ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ug+JPbg/Sw8mxr60rX4wWz6/SCNixxSgxhLEfcC+ZCrjO0JcnIDP9DXx325kuRrxbaEIRFmOH+cWXuhqoNyUVl4j+loDmlmJRo0UM3SJkEVw2wo7k+VjPOK9o2cI8HbUjNkKywOIReSTRJO4vtXRmQnnIvNV/i2qyCoQeWQH6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rro6mXnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1eMuy+9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBsB51600322
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=; b=Rro6mXnw2bwZJ9kd
	tAEdKPr/Yu453AEL85ph0zrTEDSXmP1sU5EICBb9z2bS3+SEOxLbVbQV36x4tyZu
	JRQGSHrMl03F1jaA5OoFEkE34A1ez5Up4VY+4DmYrHsaJ8N1KZwa/duytBYycttg
	aqxqjghoYF+Kx1uqlMpX8kaCWs7ms/nR2OwGF7a71RQnvSKiX4VbTObbSSgwseb3
	rUeKo++PUvWmrUsBlxrM1fGRfHucZ7ZCp6rTZD4t9o//boO/Z+AiUNQweWEsdW08
	5D0ctAr0b+2Mch+G0ccnCp/bHHmiVrwqxBj+dQfgUB/a3rGsnSNVu6TGG1MWXp1E
	Hnnzdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg1hgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91571f0d3e3so99083985a.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781094016; x=1781698816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=N1eMuy+9ess7gU1xqQ4AqLL0ZGtWWZwL+hmCdfnrIAsWyBcAzOaMYa/ivX/S9KEMT7
         WoNAKNAbZXqPODq5DBfIbWNXHAXDdRm5cRJhBxMIbdYMqJmPcWn4ZaOYLBiRyX4hEiWq
         5S1IrfulhFbvYgJNEibVJ2WFUIosO7pkql9/NuRrirsCjKlYy7BUbY8QznpktxPl8Vnn
         4LNo1oJNaRU1TO6PFkz+sqw7X1bp5Yvfy5+TsUyMLL+xTkk5bpNMvLv4Jre1GNGmjZhZ
         F56QcrhJnySdxATk4gJlnbwnZ4Moro3tGdDvBgieK//nM8KkT/7HmI18fB1xuIYdLdOb
         DIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094016; x=1781698816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=tUSCwyUSeZ9hrQahrP3Xoz4wP72PiCzGpYD2UI4N4kYgaVtSpv0XEszywrPJYWTFsY
         gzH11tNAPRc8922oG1Q2XhdNrFkI1Q+/hWe/PKYJoxA15Cnw1Wh6DpOouWc0w+w6veUa
         PoMMKnLfNBPew714y+Wi8Yh4Wn3YmanWWdpdE3MrklZWsqdUsvWGIAr8sR+RZrNh9srI
         l7eagFxokFIo55DKem+OIDKDR897etUqmxxcggr6BaPNhXfKoXvq8dx3nJ53/k4IHrhW
         K84HFhKe+C+1NvrDWWJUs+XR7vWSdg/e9GvlWM1E2H1jX4EIGVGEes7NNijqeinnXIQy
         NcFg==
X-Forwarded-Encrypted: i=1; AFNElJ+1nMr0gVbFqqOztJkjDJNmSYEIggUYJGpCJ3q9nH77WWW4SanjB3uxc4al+yoXi/DSp2fXPhnTAqdoFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGW0mIvTZ17OuIR4PDFuFh2tAfXNmEUtCl/kD9oiH6+o4bTKsY
	0Gco1W+SVdRLT2A/xtRHX9ZWPCmFRALeBroFWaViPdg0FBuTrQGlyXOYwPLii9NOo4o7trF5F2r
	rg5Pq9LPwtgDQQrO34/ZxoBz2SFu+AlnIy30XhLuLMH9z75/rl17bpIKP+B8p/0BO9w==
X-Gm-Gg: Acq92OFGLgt8N6xeBCYLu/gUEbtQCDdR1V7DyuTrI+8x4r2z2ojxGoeam5lnKqmkizp
	DnjwbvW3UH2UMIUmzf05XRn33ErMlQNSOB+78aIsqiI4YP8wjcsW16X32WKoKU8Dv6o9rbR6Sr8
	4vLxpSVy2CGbLtSExAIkPmnVvtwuT4Q/ipsk89wm72TEhpesYWbLGHjFlz+kqNB50Zqgj0flBvT
	LPpViig6AKv0TttTA95L0Fba2JjmOpVPNGAQsC4DsD29BFkYRaZE9oSJaUImrlbz2HN8crSkdrZ
	444GcaLAR1asdMh/+bNuZHfYQbHJXcrsTo4McYmgTDsIwurS0obTcwHwHuzRPXO03He83IOLJBD
	u5dd6dsCIxeSP8R5uJ6uaLUuNPqOYK20vleFtnT0TodU256o83ddBLEW4
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715460485a.1.1781094016422;
        Wed, 10 Jun 2026 05:20:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715453785a.1.1781094015831;
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1189730666b.38.2026.06.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Message-ID: <29e58a22-fe1b-402f-81c0-e12e540730ce@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cxNSd5Et-tJZfWW5oSClFGOhx2W8ZFbX
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a295681 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=B3kY6bDR6iGi-FOxjEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOCBTYWx0ZWRfX/zlMcuasO4dn
 iLeeUtEzRxg6N7BLFiYAxkt4lQUotxp4cUIOCgZQQhfF189dJ7n45GQpsiVoJX0nEACFzCYEtNa
 Z1fl7xITCoV56nEAChJYJNVMC7LiRnwtmMWVHDlUc51FcA4YVehEnpEiF9S91kg4dvuqMfWMF6Q
 hGRnB0WxdXMH1OfFXikDqWGV9b0jmh1ub/+rm3PPn3KJzXFgwHz0YXE7YcqbtHeDHfRe+i8Vv9B
 GixYFuBvVAbPWdlcElG0r2Sy+z7q+5Wxu8iD7yszlGP09UZgAx9w+8dfwdCUnS9MJ2U/LQL3LB2
 6ZqEAK9NHRn/L9YirCFm6kXMY7LZEfo2S19bBDbEGZYAKT7II4RDG8ZP4uczPKu+sX1GaS0pG+u
 dtOE4lItxp+EVpgyNKEKlvpk0yRiF0keJVbTYdzTj83kml6Y1XlFI1G+8CNw9REMgjEN5n9XB+K
 pHiuH9kwojJhGa8vJIA==
X-Proofpoint-ORIG-GUID: cxNSd5Et-tJZfWW5oSClFGOhx2W8ZFbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64429-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31EDF669431

On 6/9/26 8:00 AM, Vishnu Reddy wrote:
> 
> On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>> MMCX voltage levels.
>>
>> Add MMCX domain to the Iris device node.
>>
>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..6150380795b8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>  			power-domains = <&videocc MVS0C_GDSC>,
>>  					<&videocc MVS0_GDSC>,
>> -					<&rpmhpd RPMHPD_MX>;
>> -			power-domain-names = "venus", "vcodec0", "mx";
>> +					<&rpmhpd RPMHPD_MX>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mx",
>> +					     "mmcx";
> 
> With this change in place, the backwards compatibility for the incomplete
> SM8250 ABI which was merged from v5 in this series, which handles the return
> value of devm_pm_domain_attach_list(), will never be hit right? If so, we can
> remove that piece of code from the driver.

The point of backwards compatibility is that we can never assume
that the user has updated the DT (because e.g. it may be embedded in
the bootloader)

Konrad

