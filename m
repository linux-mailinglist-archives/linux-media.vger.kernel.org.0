Return-Path: <linux-media+bounces-67444-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BGnGBOukVGrUogMAu9opvQ
	(envelope-from <linux-media+bounces-67444-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:42:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EB748D6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:42:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WNzN2v5b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LXlnK7zh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67444-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67444-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8AEE303EB14
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214A03B14CF;
	Mon, 13 Jul 2026 08:30:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514C3B14DA
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:30:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931457; cv=none; b=CNRRKjQN8YSvbgxT7RShjC72ebKfgrdBPKUA73octrN2IlBA73egvWETRtdsttor21S8TVTYG2MdF6963XlhecDqOPeRoehQTUo9TdbxXmo0TY2mKrb5FnfgS8wRAPNfyhoWd4F6PIdX5tpo9TX/WJK3Y5Z7mGgzP142ykIbdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931457; c=relaxed/simple;
	bh=ox6Z94BZRgLqASrZyKkY5G6KpcMeLAUyU7fdgaJxuKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7t4d2umSYjPlsHfAiNvkp4CXJ06mimX1QpAu77RAZJbt023txtekuMCS4QWGY4+a5lPzXigHcd1wCNwjb8zFAoTSxE+zRwyiOk9wa7XWvzi8rbDGLzcwe2d0qLQdYeCSpnw/ZKZKWiFM2F7oCc6dQpmQzJ06zlW7i9wnKltM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNzN2v5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXlnK7zh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NnBF732256
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=; b=WNzN2v5bhN69YL/9
	ky/gO34vBXIlAV1Evbp5dsfLonGY36gh7xKfxuh242cO7i2mnZgVUju6/7SZI5Wu
	Yk9yBX3JqntlgGXaDnL61gjL65X0z0mHQ2kGZSFWPuMdtL0b6iDDimPXA4+vQrpo
	u0WS48z2BqpeK2xlSo6uHsQlOoWiGKc5KSWxoeaD/XkBxsxSCdCnatSnXs6fxeDG
	y+kC8EdVN+BCqShzei3lSFbZdqZMOeL4+AMrXL6HCqH3D03CROPoxrlSyAk+cYnD
	Hy4vGVlIz+XafPI0tnFz+9s6DChwn6i40E4Mfs/nLJSK8W7q/poMZ5gh5bmBxglC
	gcDTZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39mmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:30:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0ab07320so35624881cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931453; x=1784536253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=;
        b=LXlnK7zhJ5gHPwhwizkULgM4lzci2bIku1a3lw9JyvNCVjR1VgdZl0R5saqu2px8zt
         S4AyBQYjDHrN+GlacUsawBLA5G5/SYN8Yf2N4+IdUlxoTTXoMDZijF3afhjMqxm+SQrz
         p62untHQI7wI+jcwapgsNBN68aAreUY1WLqmxanFBFmI8B2F2RgWCZjksggkvqgDuR/h
         HypO93T/6wtti/aGCVTj8gr1b/vtWK4bZMkT3u2D3p96+HYMlzj6xNRjun1Ybg67AHLQ
         Ko5Mj+N+X8kZSO24KH/Oq1At9Q8fJsMZrsRH6Q1pprTLyU1ywbLc3i4i+lNMiSKOfjs4
         zJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931453; x=1784536253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dtBJLacOGGttlAIKQe354mVWyqsRLsF0Nl3YOfEBx8=;
        b=GWHf7d5UXUviLhHvATNhEVcMUnOeZbSVb+82cOXO4y/G2ZY77NgLG7tU8RvTQaubdY
         OBnyGsr4Z3S9taQcgZqbZJ4gHrqVmrvZmgRpE17pHrCr8bM+cKqNvL/giJQE3JYoV1tU
         M1tlxbxeCTceXM1P2q23LPEQOzDF3FJU65k9kwoemyuD+GR9tIvu0xTE+baui8O3J9IQ
         /PUmMTSRFNYA9UU9vg9z3RW1cTUXs8u8p+OMIFkHbhFrz1OJyOBczoLLcVQBwcGi5SZk
         mr0OCU1eL1L8f4/hlhzbbWGN6M2SXgUNs29wbKOIJhltR7T8L9piSMV96cgzDUGLV/ea
         /ByQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/QsA3UmQjGS1rLm6bl3dPl9bm6QgR1V07G2eYl6ng0Rfvxqt6At3DXrCJxBNngHV/m1Ar2UhjIOVpdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNumEEyBCiLyH0FmYQAvmxvNcf5lBvU2gKGJRA1QMFcm9yC+pE
	puzltAgD9TAsHL2b9J91Vd7YKKwvxb8Xsg2qwbjkwQ4vX/AKU/5xpJrMsa993bKY+QOGhrEcNS2
	AmVGhelJMwW25LxFI/i3ctGLsxTLHc2kPSHMO6y8W7mwz7WNwANkl2/iXEY4TLxhN0g==
X-Gm-Gg: AfdE7cli2/a1NUU2Rey8b6sbTO7l6yJegjDqKZkTB685eiFZJruon9E2COcr3y7SU3m
	EwlGJ5PVPkMCdjV7dGv+JgmvUkfnXtZ71d/6irIYXwY5QOaJoXyFKu9jFRwyCrN0cVCxETkyMWb
	EuMo6Ue3ryHjgHSaZ4cD8dZ/Ev33P9wA+aMCd1at+ZlB3uahrKPA0fYAV11iuizsbdUSKyGOUPa
	Bt9VkOts3jOGGZtmEKZtJTiZ9u9+BoaoEYlbXdXbEut6pqr14KrapDQcQKKpQvm6hs2STWfMOqu
	IDFW/aUYklD70v6yff/NcHe4uoLP1cNcsLQPwshO8fqPjtpLDQgPUH/CazW2U3GtmYQYjbHzEab
	3XRQB1pdEglXL2L/qNISXsVr6ed++v/3DKo8Co/W4yig=
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr81763741cf.39.1783931453358;
        Mon, 13 Jul 2026 01:30:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr81763651cf.39.1783931452962;
        Mon, 13 Jul 2026 01:30:52 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15eb1dbdc9sm569475766b.10.2026.07.13.01.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:30:52 -0700 (PDT)
Message-ID: <e97424f4-d9aa-4f6a-84d0-2ba849bd7536@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:30:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <06834dd6-1221-463f-9543-600814c8fc83@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <06834dd6-1221-463f-9543-600814c8fc83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX7ZZepUHse+gf
 6oIzSqzOqPFsCFeuJSvecHQnGxlOtgtxBySDUaClKGYfrJ1YHhpiFSG/PZLumdHJLNwqre2vKgh
 lzGRhgvULL0l4eBREyljgxzxMfy+656jKVPR6UWnmXPwNi4qUUbIlGDRk3UYacyLWSwpjI+hqKb
 tFHBwbapiCNT5TgjkoihYryq25kFm75zQCpYl/kXk5xE23LTQFZr9CuVC49aKmRUs8wjj4Wec1K
 Y5azbl5MdC59KIbDb320n47uiLS7hg0crEV99l4g/XYhoGapiKFd6uFuRfYONaD6lP/PMwPNzHi
 EdE1PVherxdWkD0NBaxrxyrlg1SXMQ3l51uiQHDZybCpFiFGgO2E8i2YKLAhvpErFVpTQ3zOuE7
 zNxiZOBV7IvCrGTDV4POsMEAkxuGYoALT+ZqpNnIpAJDcENz4ZnYFFciHtwn121ydEMlob83xIt
 PLR4uggr56Tab4jV8mg==
X-Proofpoint-ORIG-GUID: ruKY6Z3VQcewHeWTMWZq5-ddqYa2ZdrP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX3FHJ6/JXWfJp
 5H4A2kZejwqARfqmoailwheCGtK1ZdIGAh/1BuYlYKVFvOsP5Fu5zwveoOaQhSmG6xqZ3YS4ADc
 gFSVzEIBiqFAMIyzm/q9p9NLdUdHEto=
X-Proofpoint-GUID: ruKY6Z3VQcewHeWTMWZq5-ddqYa2ZdrP
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54a23e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TB4z-ivqILPobOqkYRMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67444-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B9EB748D6B

On 7/6/2026 3:19 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> Add a Qualcomm JPEG encoder driver implemented on top of the
>> V4L2 mem2mem framework.
>>
>> The driver wires vb2 queue handling, format negotiation, JPEG header
>> handling, interrupt-driven job completion, and runtime PM/clock/ICC
>> integration for the standalone JPEG encode hardware block.
>>
>> This series targets SM8250 (Kona) platforms.
>>
>> The jpeg-encoder node is described as a child node of the CAMSS block
>> and is probed automatically via of_platform_populate() in camss_probe().
>>
>> Usage examples:
>>
>> - Check of related video node: v4l2-ctl --list-devices
>>    The expected result:
>>     qcom-jpeg-enc (platform:qcom-jpeg-enc):
>>          /dev/videoX
>>
>> V4L2 Examples:
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap
>>
>> v4l2-ctl -d /dev/video14 \
>> -c compression_quality=100 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=100
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=1920,height=1080,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --set-ctrl=perf_level_auto=1 \
>> --set-ctrl=fps_target=30 \
>> --stream-count=100
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=8192,height=8192,pixelformat=NM12 \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=1 \
>> --stream-to=8192x8192_NM12.jpg
>>
>> v4l2-ctl -d /dev/video14 \
>> --set-fmt-video-out=width=8192,height=8192,pixelformat=GREY \
>> --stream-mmap --stream-out-mmap \
>> --stream-count=1 \
>> --stream-to=OUT_8192x8192.jpg
>>
>> v4l2-ctl -d /dev/video14 \
>> -c compression_quality=100 \
>> --set-fmt-video-out=width=1920,height=1088,pixelformat=NM12 \
>> --stream-mmap=4 --stream-out-mmap=4 \
>> --stream-count=100 \
>> --stream-out-pattern=21 \
>> --stream-to=OUT_1920x1088_100F.mjpg
>>
>> GStreamer examples:
>>
>> gst-launch-1.0 videotestsrc \
>> is-live=false pattern=ball num-buffers=50 ! \
>> video/x-raw,format=NV12,width=1920,height=1080 ! \
>> videoscale ! videoconvert ! \
>> video/x-raw,format=NV12,width=1920,height=1088 ! \
>> v4l2jpegenc ! \
>> fakesink sync=false
>>
>> gst-launch-1.0 videotestsrc is-live=true pattern=smpte ! \
>> video/x-raw,format=NV12,width=1920,height=1088 ! \
>> v4l2jpegenc extra-controls="controls,compression_quality=85" ! \
>> fpsdisplaysink -v sync=false
>>
>> Performance measurements on SM8250
>> (NV12, quality=100, GStreamer v4l2jpegenc vs jpegenc):
>>
>> +------------+-----------------------------+-------------------+
>> | Resolution |    HW v4l2jpegenc (q100)    | SW jpegenc (q100) |
>> |            | Execution | avrFPS | maxFPS | Execution |  FPS  |
>> +------------+-----------+--------+--------+-----------+-------+
>> |   512x512  | 2.2332    | 1139.1 | 1195.4 | 7.1055    | 358.0 |
>> |  1280x720  | 1.7300    |  418.5 |  457.2 | 5.0585    | 143.1 |
>> | 1024x1024  | 1.6991    |  374.3 |  397.4 | 4.7304    | 134.4 |
>> | 1920x1088  | 1.6596    |  192.8 |  193.8 | 3.7913    |  84.4 |
>> | 2048x2048  | 1.7277    |   92.0 |   91.6 | 3.6343    |  43.7 |
>> | 4096x4096  | 1.5887    |   25.2 |   25.3 | 4.2163    |   9.5 |
>> | 8192x8192  | 1.3104    |    7.6 |    8.0 | 2.9987    |   3.3 |
>> +------------+-----------+--------+--------+-----------+-------+
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     |  143 +-
> 
> 
> NAK
> 
> 
> ...
> 
> 
>> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
>> index 4f4d3a68e6e5..f33d53a754a0 100644
>> --- a/drivers/media/platform/qcom/Kconfig
>> +++ b/drivers/media/platform/qcom/Kconfig
>> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>>   source "drivers/media/platform/qcom/camss/Kconfig"
>>   source "drivers/media/platform/qcom/iris/Kconfig"
>>   source "drivers/media/platform/qcom/venus/Kconfig"
>> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> 
> Just like for other patch, you ignored reviewers' feedback.
> 
> I already asked you to go through previous comments around v3. I do not
> see improvements, so I assume you do it deliberately.
> 
> NAK
> 
> Best regards,
> Krzysztof

Acknowledged. Inline replies to all previous comments have been sent.
v5 will address all outstanding items.

Best regards,
Atanas


