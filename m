Return-Path: <linux-media+bounces-63750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rsWGJfMfIWpT/QAAu9opvQ
	(envelope-from <linux-media+bounces-63750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:49:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E2263D53D
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UfWSO7Mx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EfmVP5jl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63750-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63750-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 667A4304F255
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF7D3D904C;
	Thu,  4 Jun 2026 06:48:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066A23EAB4
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:48:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555711; cv=none; b=e5gm8xsLWfSuiKolpZWMH6I/8UFGt9JmAyKtOUNXrioYdUqGeIQeseGP4bYrdgiSMig1CdVsEfdodWIs3nabRbFhs8ApUSfJwUPkYiRd4uj2ANUrlMBAB0xK9pdy/OWt8SUkShjsoweNogMqUP9fXD4PyarOGcpCN4Hqr62tGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555711; c=relaxed/simple;
	bh=N8HVvQX69Dd9kIE774kAzOwhhXdFQYNCUF0qIO2ez5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSdVngSUvRIezFCocnpRvaMDUXfUvbb2U8NAfz0AAElskNOAbcKC8nZOErTvSrByaw3nMUFEGbcC3BQ8Y2xJu/p13oHASjUKCmmuEXsuOkvIKl39baqAZ1ooVBXQX9RUCsiCYFEoXhzFVUmiLsy5+hzek2bOQqXZmXRXOV2jB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfWSO7Mx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EfmVP5jl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65418pQg140569
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=; b=UfWSO7MxVhWvv284
	c95iqUQLZP9hBH4gDptPODASNAx1Zs6n/iXSuUXvoAh4P9QrM/9P38X/HRIMENf9
	9PgtrzW0YVrJhohUUykx9CdfSthoJBa+UfBD95f9apbQErjAYAEAZw7gW0Ofw9XM
	DrpgvvhuMictYeLxeECOehNUyTG5/wqXKeFxdYtXLkSlPtHPCUq3pMzlFs055Yll
	aSdwfJYobfM6IUW1LHjpJWc/Ayk1BbOZbOW2ZNhiMnVVn0qX9D2yBBdg7UJW71Dv
	x6+Xi/4+UXjxjxdl7jdtTmKlQrAumxsXBxONl+mdJ1NghZOaz9kbaT+emt1gTzOe
	mtGpFQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen908t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:48:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cce1c3c26bso11808456d6.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555708; x=1781160508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=EfmVP5jlSlGUvzTZ3bVlkten7EmoUweLdQXFGmNjhskjWGc6z0oCSEorFDgYpQxpGU
         /2gtqDwAOJ18EnzHu2O92Z6RlTXr9nn4AwP7JCtvMD5u+Ja2RBZ8bNUzoU68EAeQHwsZ
         q6SXiJz2L+6XxkQ/bt7bU+gDhGKjLcuNjg1U7sd0RWDpBsLhkhkTDAJina2vF5TQqzRN
         +M0ibld3ZoFf0MrCxaoiKbhE3GcYXlhMUL3lk+ieDGy+arvYjbszVgnYSFccGRTIQUAP
         kw9WzKxqMwr27tfwcSxIxnbyofxgIq7nGuqJvpmLLhXXSLmWHg/wba+i3V1bidbtMgpF
         Smnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555708; x=1781160508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In9fMxK9sgmXOfGMrrhhU0mQcsR1HH4zN2aSpSTzRZk=;
        b=Zcw+KkpDLZtIXT4a9R5OwQ0lmaAE/ALjmU8VjRIbirTRPimSxv3IBLlPStx7JmUSoZ
         eABZwjOXPVNmRUd2AjuXG9Vlyc1s50YIl3zojd4Do64xJIntovIjbC7Ef/ZbQ+bekVIE
         6rGQpOtPIcX072Oz+tU/vM91YmnT8IBfRkx+cKWU7DzFtFWZmGrHRorYOne6GgSv21aF
         6ji8hhQ5Fx9Rd6QANnsUK9DG2xNlGEmHaxf7A0NgD3vmKzDaresebEIZnBBJRgFT0D0g
         LuX3ewemhUYzxsZVhgD4iPAI/vwyfp/jdfJUhnU8lVDn8AB+SWfzptdl+6zfooNGKuR+
         6uFw==
X-Gm-Message-State: AOJu0YxZ8dxY7QoQlbNmP4Kf741/Yd0g+PrNfYGqQrlqVS9Vz2ISFIXf
	AeNAQBpgkapQ4aAjn/SQtyVC3PPyWOAjMl+uCvvMusBQxiKOknvl4W54ay3xek03sbocrG7r5VM
	ZKiMo5uPRJYopSybT11ehCWE7oDIuK1VZ6fj5rw4iZkywqCTGeOWTwkX3mkIFkgDoUg==
X-Gm-Gg: Acq92OFib6+zDkme7iv6tsmwKrHrHYS/A9cvw6sQMxoun99K7EBxRyxtcTR43xgqb18
	guNKq3EMFRiUEFay95dkgOw/7Yz2ilUBN2mhAPzgucyePBUhmpv2S7/Xm+JcFGbDOVfV5vnkS3B
	dCF9FN7EX0YkEu0d7VTi71NV3O16lrs+nNkjQ+I3zqxSzNxnN5REv//Yub7aABSNHReYrvmfD2q
	bBTFgtbS38ypk2waBmnPH/zXpXk5FKnjrxnuru9gz+Qfit1XQHzWxFKyYMx8TapmJIH6y99Dj3g
	NbNfPlalaI1iSvAW94EV55admefV8DjyDnWxm2Z2lGRftHEoagFmxEtcBwfoyG+QYlovtw4ojbE
	IQTwM4A0LLL60IV70smgNdrKLNe7lXEppL62gBWfa5DbajmpIRIsexd3+2nmau7EQ/2w=
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99750171cf.60.1780555707992;
        Wed, 03 Jun 2026 23:48:27 -0700 (PDT)
X-Received: by 2002:ac8:5d43:0:b0:517:6464:640e with SMTP id d75a77b69052e-517787ea5e5mr99749891cf.60.1780555707631;
        Wed, 03 Jun 2026 23:48:27 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm257631466b.50.2026.06.03.23.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:48:26 -0700 (PDT)
Message-ID: <82834dc4-14da-4a92-a1bf-4b8e744094c7@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:18:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a211fbc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WTPBrf-vshRjUhDs8QcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: d97vmfEjvE67En5fQuFs9ni9KGwhHVnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfXxtQelHqtqZaN
 chiwHf5nlezVCt/c6glVP+71Z4S19t/1JqWrXBHqOxZRuOztKsT+TDUv0GzHrI+7yOaf5TsXEV1
 oqvMB3R7RYjmDOErnyp4+WlZEucbn8etCZ+gn9l/Aj79ltvF0P4n0jA+n2FEVTk60s+Y3+dc341
 /CAD9SS1zl0VVMtcryR9AuK0C+xVfZ/kV/ef756ebzZIzCQDWKL13zzRC66pIvJfXWWngh/DkjQ
 u4i8t3YYnhUf3vJMfxZczO8mMAvxvVrxRsh+ks7BME/B8HVv1PD/xIYI7teVDLQdQkt5hyJuota
 JmBg4CORTv3/85G4r9PfiFINWirORGOwbDmDtfTHOptE3cBHBNbvNtvWNezv9JOQDXjIcnPuFu5
 AY3w4ja511oSPCCrJqo/vgAetdcBhRCdJCZGc6ZpM9uaedagkBBTuamh68G+XqwbDe8rXsuW3/9
 Bn1Fy1WQqxqnDS3KrCA==
X-Proofpoint-GUID: d97vmfEjvE67En5fQuFs9ni9KGwhHVnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63750-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14E2263D53D

Hi Bjorn,

On 5/29/2026 1:04 PM, Wangao Wang wrote:
> This series enables the Iris video codec on purwa, allowing purwa to
> use hardware‑accelerated video encoding and decoding.
> 
> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
> except that it requires one additional clock and uses a different OPP
> table.
> 
> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
> and OPP table need to be redefined.
> 
> All patches have been tested with v4l2-compliance and v4l2-ctl on
> purwa. And it does not affect existing targets.
> 
> Dependencies:
> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
>

<snip>
> 
> ---
> Wangao Wang (5):
>        dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>        media: iris: Add hardware power on/off ops for X1P42100
>        media: iris: Add platform data for X1P42100
>        arm64: dts: qcom: purwa: Override Iris clocks and operating points
>        arm64: dts: qcom: purwa-iot-som: enable video
> 

Media patches in this series are now applied. Do you plan to apply the 
DTS ones ?

Regards,
Vikash


