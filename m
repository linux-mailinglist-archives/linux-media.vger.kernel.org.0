Return-Path: <linux-media+bounces-53065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGKCBWYllmn0bAIAu9opvQ
	(envelope-from <linux-media+bounces-53065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 21:47:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CA1598BD
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 21:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99A7530120F1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 20:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041CE349AF2;
	Wed, 18 Feb 2026 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/wooTMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhihws6o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C50531A57B
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447642; cv=none; b=urGRTcrGBWTQdyoCBw9ZiRdP/Ngdj8PnS+K1aJImKe8FDJe84RsVixW50s/3i1EM3uwzJrm2637nsu6NzpUMQYTXx5sQ4ML5XFM6tMitufZ5ForwRmYhwftc80g0c8ai0hkZnv/lPAXBn8w29UfaJzVaidRmaE8g+778NwVzyFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447642; c=relaxed/simple;
	bh=CDIqozJsuQFo5m0tgWLil73b1CNFKcj9LqyslgWQvKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvU65aNdwNjXx/lr5P1Tw+JUofzEW1I/at3btCFhDID07SQRnJpROaEsyQl7kbH7NbBvq6Fvy0rO94O7V58MS0WX0JBazGIfetV3pjqt6X1ZVcLCa5CkEPUn/0attar9eq0hM78oibp88/u2J7OoqjFaNcSeMojsZ6fhrKd0sYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/wooTMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhihws6o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IG1HIw421076
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 20:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1D10VM7RANBM+iJIzulrc/EbcESoqbZHUXFXPZa+iQc=; b=l/wooTMMWCxYb6Gm
	kDuk74c2mGtQMNHmdnQDcmNZGdtPFxfVZXRcLWDwrN4o/0QhfpsgQ2Ze3dKPwju6
	JLiKgNbxccktxhMPUZB7fEFi3oWS9Sutx0MCqBsElnq1KvtyLUhFf4t693RUMtT0
	0mze4+OdpuV0EzKnVCQnMeSDR+2OQuawyfu0g7tyDNsumL+9Z7h1c+JoTtCT95Nf
	rB86irlZLqGlHdRfrEKaUeJ//aMyb4NREtceRv+2CClggZbCUMCfFTxoxbJg0wcp
	kyugPQaPtTDnxswQ7bwAgmTd3CZotUNu8hlPAH/ytUJsCgSdU1vGsEyOCjRbM01d
	gcbwyA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e2dv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 20:47:20 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45f07dad7a8so770278b6e.0
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 12:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771447640; x=1772052440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1D10VM7RANBM+iJIzulrc/EbcESoqbZHUXFXPZa+iQc=;
        b=fhihws6oRG1knCOeuKSCru6hL2VtOKmG3GvJGStnbMsK1+iI/7FLx8GL1fZAUldRMX
         XmyVg/1Ek+51e7v6JQ3Ndme/szMhVSIFmO3zMSjVOTOhZmB5mVyWpg5Kez7qdkg/AH3v
         0MQepD4fxsH+tx7YZPZqQ19E9wI0GYX4gYD+f/gAsMPb+nCGCMAuMC/RlNk7xW41Toqr
         m77fg5YPHnpGXQH/rD7PAS9eqFnquKIobXOnNesy5ehjXQgLhwWBpLIvUv89dxmpr4vT
         e5bW07CX++33WJsn7fCr17qqwe5xq5yZEE+XAb+qV/9zN78A5LEu3XRLE5JNl05mRPyg
         Yjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771447640; x=1772052440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D10VM7RANBM+iJIzulrc/EbcESoqbZHUXFXPZa+iQc=;
        b=X51Xwqukq53dcESHCHk66reEkT74KhqHF7GxBkzL34Mco/Q/BCZdbJjQ8+u98TA0Da
         /3a7bUhvVPGamatm8st5gyqLyslRndB1T6eC0ZSI79MsvMQ/Cb+NNutrkEoDjJIisx+H
         Ria0a0ypCrC5HdCa1sLktCo+VhQs0v+eEboB/9V4VRtd4WAbh+rDagOD2FcVKobtF3vg
         +RdToAIuPvkABoLlv+kdqwuhRS17VPm2nhU3DZ9tDqgH7hW5L+q74Xr3m1sCu9J//Wzr
         Lh/mLZ0G0NiTlQYcrr/CS0Xr0R9Cm4hn80y/ek7JlT1aPWFVGsVTTty4JwnBrgMfpCCM
         PxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUr9BVx+eOuTCFOQxpWQqwiQd+nZSr7RTHtRKOrIht9U3daeH4SFdZtg9RbGanpNHz/vqkuKbud0ZnJew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQl5LUsbQHRZTRy9ID6sm7QgfD0v/j4OnAqu/ghAd2IB1Q3PnW
	gA8Uoahi2TFeK5DzZa5I1ssS1QLRwiMuUcd18d+X/TIGFhwy6S1VwvQa8FKcB/gndsW+yiRprg1
	0YVcVRWBNMOjcld1QwIViDp4BsKXyavei+2kehh9Xl86do41ZoOvME0IHdCIt26oo5Q==
X-Gm-Gg: AZuq6aJ3oN/MuD4ADJtikOixR1/GF2fiZafSVFSaaVKr0ddVVmqJQ5CH5m1leWJBHMT
	K3oOPyN6GHX3k8ZgAGbVFwJ+rqqCr7Xmm6x4zJyUpebw5vm0PHzCbo8n3dHE2U9sdwcTjWfLY6z
	lXrlcdVjqD9G5GzXqRa8q8kKVFAd8Sxcxy+nhEbt3L/mnP+qhqr/Cho4XR0rOWUn4HetOKs6HEf
	FKYZGs2CUGnYsm+juy2D4OJSjvEsF5MYsZK2AFE40zz9cpm7GStRgqr1PC5O1oQdyfNJVVTLIFe
	ODJd5sXhhVhqVYy7SQocEROvlvj0oO8ssj53QEIjo/TW8xbtWmuDGMYY9eSCW99KjwmugAoPeJB
	r08QbfqO1AGl4OIQS+r4jFXrhB92XGDfzTvs2ty6MEQaBV41YuGvqGEHCnaZGCG7CBCj/gt4gkT
	aPwA==
X-Received: by 2002:a05:6808:4f52:b0:45c:8bfc:4194 with SMTP id 5614622812f47-463b40f7577mr8096899b6e.65.1771447639847;
        Wed, 18 Feb 2026 12:47:19 -0800 (PST)
X-Received: by 2002:a05:6808:4f52:b0:45c:8bfc:4194 with SMTP id 5614622812f47-463b40f7577mr8096875b6e.65.1771447639400;
        Wed, 18 Feb 2026 12:47:19 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463a6a369e3sm10998625b6e.4.2026.02.18.12.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 12:47:19 -0800 (PST)
Message-ID: <0cb83f05-1e0d-4c8a-beab-3617fe1de90b@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 12:47:17 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
 <W3evhxwcLQLbkKftGpGmJ5LaEO_h3nxsWSSzrthlfatPfO60KrPpbyaq7yAu1vKbQc0RLqsaCQhTPzRruNTg_Q==@protonmail.internalid>
 <20260214-slick-ringtail-of-innovation-d8eecd@quoll>
 <f5869002-1b42-4164-9f14-2ee41f5b1496@kernel.org>
 <b3e76e9f-a820-43ee-9089-7b7eaa876ebe@oss.qualcomm.com>
 <002d0b53-8fd6-4d40-9c4c-4c79a7704fce@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <002d0b53-8fd6-4d40-9c4c-4c79a7704fce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=69962558 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mtrz32Ht2ljPaXyFR70A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE3OCBTYWx0ZWRfX/bHBZzOw55Ja
 iN1YuyGodGQj3M6/wTpkC1H3pt4/qV2w1lJrrkxTL/vYzMtnHLK62bypw3Aubi24Exj7kfpSvny
 uROfpIjII4Qgh6E8hFojIVMtYA4OkBnGXGmgu4ONrO3MvL53bhAnm5eOEr3sGmdbHPUUQ8LO2iX
 dxiDsi0UxIwxVOAAZKf1np2Ae3Ly/NodR6My3ONElGuf96nOuKBlObtpyIBAYybK+Mw82xC0hwM
 G2Q++1zo7x9a3DFxHxm+xKK2TSZ41zfZHv7DzmM68nvs2OT8SLKwNAMWXc7YGgeuYiXxE3V5Zqc
 YO8xHTJhB9NC2TtqvybggOxHatxRlkhIV8A3cI7pxKIT63eJPhYcYyiTBxPQOMBQeZ5n3ajaS/p
 hcyHRD1bmmCzlIPPkao8jarX1LawvbaYcG5w8u7DEp2dLuTrKft3DfFIbMgp+gPlLbsDXSsJbl3
 +DYZIeYXDABrNkgjE+g==
X-Proofpoint-GUID: x2WQCijGAe7bN66UJoBdkvhW4_lDwX76
X-Proofpoint-ORIG-GUID: x2WQCijGAe7bN66UJoBdkvhW4_lDwX76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,lists.sr.ht,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-53065-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE5CA1598BD
X-Rspamd-Action: no action



On 2/18/2026 12:10 PM, Krzysztof Kozlowski wrote:
> On 17/02/2026 23:18, Vijay Kumar Tumati wrote:
>>>>> +  vdd-csiphy3-1p25-supply:
>>>>> +    description:
>>>>> +      Phandle to a 1.25V regulator supply to CSIPHY3.
>>>>
>>>> I assume that we abandon the idea of separate CSI PHY devices. It was
>>>> discssed way too long time ago.
>>>
>>> No just waiting for 6.20/7.0 to drop however, I think its fine to add
>>> new definitions until we merge that series.
>>>> With domains changed:
>> Please correct me if I misunderstood but if we are not blocking the new
>> patches over PHY node separation anymore, can you re-review SM8750
>> patches please, Krzysztof? Thank you.
>>
>> https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com/
> 
> I replied there, one more thing to fix.
Appreciate it, Krzysztof. We will post the next revision as soon as 
China team is back from holidays, early next week. Thank you.
> 
> Best regards,
> Krzysztof


