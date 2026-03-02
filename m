Return-Path: <linux-media+bounces-54105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKsnJv6ypWlMEgAAu9opvQ
	(envelope-from <linux-media+bounces-54105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:55:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD761DC3CE
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 16:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2243830C442D
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 15:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A5D41C0AB;
	Mon,  2 Mar 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNZp1yCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emRbFzUD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E041C0B8
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466706; cv=none; b=AsLd4twFz5IhMJplO6gINRkDiBh8eT2NEcMBg/d3VHTcjfkDvqZn2vVnkcGbVlAdcac65upApLYwSK2NfELW1dXOKPuAxVPyKl561ZRM6KN32wVaKJKv3JHVOQ+l4h4/XFpQ1RYAPrlJ2uDSyS0pWsNiZVoqZ6XEPnTpxMDQhZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466706; c=relaxed/simple;
	bh=xkMkJW1eg13NYB4IQ0I9EK2Kbp7CwzmQkQAQFdklgsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dd5Diq8JwzpwwFR/O4U/OSpIffyGHFSakwDxGtGgEl+67284dMhJMadCISVNuYebXkzoKpxkvg0dBLlCBbfbYpIvx2oSKQg2h3iH6Jp6fA6TX5icSxyg+C1DqT6FDodevcxiftoSe9VP/wfCp+QO7kzWwIi+XebiJK/6Gl5bGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNZp1yCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emRbFzUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294sHP3753600
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 15:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dmr6Lu2CMZ8S0eocC6PKa3LOsOTXBhokS5Zz6BTZz6Q=; b=NNZp1yCDYy+naCuO
	uHSLA5kMw/K0vBI0owGBXGHx0Ln6gCQhhshiFf4v86t3Y/GhxDA+wB6k8ZjqdY/i
	40B3znsWWKx7Vhr9nbzD664ia4sWEW/YRYK2qQFS2/7EdCjRt0bzQOFiWgtwy1Dh
	EkCkE+rN5ZZ7dP1/wJfrQA7wLcyaOpmhEBEt8R66ka9lgpRzdAHJPuz5rFtyeWLF
	dmLo8IY3GBL5Sy1PX4PjAehWhtFbIvMPLEgf4MZNnxDgVO5HqQSY/Mc9fCrOFBOi
	onuUqhX4D0ls7kTZCnHWrAgLFvGCJkyBfNjqCChNDVImuralTvB5bR/RuUZtMn6L
	YeHhCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq9cwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 15:51:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso425996385a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 07:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772466702; x=1773071502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dmr6Lu2CMZ8S0eocC6PKa3LOsOTXBhokS5Zz6BTZz6Q=;
        b=emRbFzUDFSjZ+G5eFGac1vDEMHdNhYJv9WKLV/NdQAZgqpindFr7GgwttvQcopuhs8
         LkeRO3DsfDlIWnSWW3ykRww55jfQFrzVH925+gxiZjo6ha0YS0g+kIBGnWIF+uTgVxTr
         Foxb8kfY6B61dcH1oi6Zfae9BtRpb3CVzmAP+Z3SOnmEwxT+ts1yVyz0CIr0GqBOie7J
         IxFcSK+khlalEgUOP8lr29Ws+PrfurvqfH6a+gPhKQEF6Mc7NHVsGTlih0SFqbWhiCUd
         3HMQ3seKNqp5hkBEd2YAXCXJOXS/4JeLYYPe1yYboWqXj6sGVQzVJxMvgdnGtPONW261
         hMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466702; x=1773071502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dmr6Lu2CMZ8S0eocC6PKa3LOsOTXBhokS5Zz6BTZz6Q=;
        b=H6CmkF8EYmV+vJxxsdYgYtqZN1PRECgTQkQ+0RkTnEnySs82yLHrMhJ8/0+9TFJujp
         GGG1aQ/uwUdC/zmxyWdT/woIxT5iP2fScypW2Eqlb20+3QT9vk0wvbYUoHSmUs+eK5xo
         2XEJuSV+MrME1sF1fRaKM5qunLw77jB9kOEo5CeyL5hrf33N5L4MSm+khyDhDEQc+o+L
         LBytFE3ok+UNU/Qfov/W/O8uqRQFYeJacu8+CLdx91srC2uab5V340MKzRgPdka+Fbgx
         kUAekB5HLFNDCGhyM9hpN/J5bRKVl+AsN7bktAXmX5iwF034TosqeAYdVKqp2kWweGoG
         pVhA==
X-Forwarded-Encrypted: i=1; AJvYcCUIIdKl06QWfRki8pUwOk9NuTUAUP+5D/xQ5CFmkjuOFv4+DvlD/iC1dxsNUBmF459mv+1OL8AiWJ5adA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWV6BmbRcVyfJwH/9EXg0qdSHbPH96ZA42k6W8GqYY/u8XzPdP
	RGCJ403C0tuU0UrnbelrBdUDDF78aKoalJtuTo63nQjTkBBP+B5ldXLsIsPTWpMXA+u6rNrSpnh
	Zd0t+kXsieYhmq+tO2ENhVc+kGa7UyenUEgmHDdDjTdbc0c0gj4GMU4IMmG3nRR/IQJ0H7Wq0IQ
	==
X-Gm-Gg: ATEYQzxu2qPT3SSECN1BogcICiVlqyukElwapoSgU4fiWIblp9YVKtKhr8gbp7XwN4D
	ELK/4tPjatFMnyGk12c+exG1IYckSZRQ04wvBisIoQo2mR2XPpnr/8WNPEK9TnYqK8Dy2cyWJfR
	tOhRZVSe01eDusjJ2S7U2ivfVhIqGmDC9wG/YaSSn89zoDtJV0BtiopWHSg3fO4hbY7E69J6H2M
	jhkenucibeKa/trBAseHkLB8Lx/kghno/Jee7/kMx+kNY/mh1RFGrRcmqw52wM2w8/jMwzH1iQO
	o5ZOVIL6ec8LeAd2nVTeYcBDlmYMoTEhGzMCnCBwqRDxM3FttWaqttMlEmYXJVEgMmeaOM4RRgI
	Wc3Bsznf8l2cKpgr/0vJcUEcyYJRxq7VYwNfXnNEnF1BsZ1ETn6tk0MjDUGAIK1xNr+Mq2lP/9Z
	bilWE=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1273197685a.7.1772466701790;
        Mon, 02 Mar 2026 07:51:41 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1273194685a.7.1772466701264;
        Mon, 02 Mar 2026 07:51:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd466d7sm3411974a12.13.2026.03.02.07.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:51:39 -0800 (PST)
Message-ID: <3eae6261-f61d-4d05-b1c6-393855f107a1@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS
 resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
 <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
 <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0Pe7t5q11K9fAFkbUEuLOmsBp6rE4FFvW6o99yuLqS=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pf6lJnX83GOkw0yH6ao-Sje5QCTxMvlA
X-Proofpoint-GUID: pf6lJnX83GOkw0yH6ao-Sje5QCTxMvlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXzNpxS09ajzup
 m5Sq3f3wAlVuuWxl+BD2WvE3vV4yX70UHe1JmYJ+Fk2Is6kUNimfAlZsA5uc1gUxbzVDXL1vHnH
 h20N36rjUH1vdaGtH5m7AFltGzyFZXfm80gPr96lD2magcwW5eiy6wVf3EFeyJLe8JO7YwFpThH
 rntglorg8jn+Kkyx0CuT6VKxzEjT/4M+63+GcTmuFzC11kCJagrUREjmmU3VIxcN5cCfSGwKEki
 scX8j1W0ioap8mGoilxIp2LZcokI7wKjQddipMGbO3wZzHu47BfBnhCjTjrJIvpMd0FXn3YW5qF
 M7UfYAxbxZaRCk7Ey+Ca3lZOuNjmXE+okjEQlwUtADc5Sp4+A9UE4uo2svhWE2BYhmOv7bI7v9G
 GqNFBkpxAy6qsjsZe1GzRcW6erUXdeSNOf9TKv9E/FvYndM3yrA5Apjl3Aj2qY24aA9ZqWd36X+
 vFYnm3nUVFWwrWklScw==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5b20f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0CubDZv9oxBoJNJMxdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: 3BD761DC3CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54105-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 4:28 PM, Loic Poulain wrote:
> On Thu, Feb 26, 2026 at 2:50 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/26/26 11:04 AM, Loic Poulain wrote:
>>> Set media_dev.hw_revision using the CAMSS resource version so that
>>> user space can query the hardware revision through the media
>>> controller. This can help identify the exact platform variant and
>>> adapt behavior accordingly, for example, allowing libcamera to apply
>>> quirks or enable features that cannot be discovered through standard
>>> V4L2 or media-controller APIs.
>>>
>>> Reported media info on Agatti/CM2290:
>>> Media Driver Info:
>>>         Driver name      : qcom-camss
>>>         Model            : Qualcomm Camera Subsystem
>>>         Serial           :
>>>         Bus info         : platform:5c11000.camss
>>>         Media version    : 6.19.0
>>>         Hardware revision: 0x00000001 (1)
>>>         Driver version   : 6.19.0
>>>
>>> Note that this may imply that the camss_version enum should become part
>>> of UAPI.
>>
>> Wouldn't it make more sense to populate this field with the revision
>> of the hardware?
>>
>> I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
>> while pre-Titan platforms have a version register at CAMSS_BASE+0x0
> 
> That could work, but not all camera subsystems are based on the TITAN
> core. For example, Agatti is different core but also exposes a similar register:
> CAMSS_A_TOP_CAMERA_VERSION

Please read the second line of my prior reply ;)

> We therefore need to ensure that the version values remain distinct and
> do not collide across different core architectures.

They seem not to be, but listing them all out would indeed be good
as verification.

Konrad

