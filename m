Return-Path: <linux-media+bounces-66855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id keCLHE8FTWp0tgEAu9opvQ
	(envelope-from <linux-media+bounces-66855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5D71C2D3
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:55:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="N/BS5pSA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y2hlP6X3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66855-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66855-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C381F30D5A1B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 13:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923DE42253E;
	Tue,  7 Jul 2026 13:47:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD23A421F00
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 13:47:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432035; cv=none; b=SeJ22QbY9CDdwdHM6YNgMxS8WoevbhUdPvhgogeA3hyFKoDooKXkkxTSHNzItUweDu6jHcZhjs8W13GOCO2jaT7iUQ4TzfPAViR8cJTabgRDb9QX9CKIfEP7FI/a1DATcrr+V8kIlH5WidNTrXJS1e0i/hwU9A/sDd4+wNsifuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432035; c=relaxed/simple;
	bh=bENWIoUDmb+p3ApVBhAj+ipAHOlaLeCOdg1Ywad5Xuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQn79BixHFiEbxhKOo4f+A/UXlZe0z8mo+GlU/pudq4VBFxmRkgqjuWpGNfDxHxyThIdMvyWouIBXDXHOdlrMAYgHP7psFTKQTwsUXZFk6qXSO92m8kW0SD190mwGlFOqZwqPMBEUDxOUkk0UMdixI1L5x0FmOL2bZKrIFHUgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/BS5pSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2hlP6X3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8ZLE3783380
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 13:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=; b=N/BS5pSAK22IBIPR
	C7q8d4MPC6CupunpWede6AWAyvgf3jJfvxsuLdOoqZuhTw7ITo0iveWUP7L5U0S2
	TMQ3sTEwFtG+Tt7oNXCKnhszvPMY8orddr/sMLvSCrCC5cvbVMihZJSBJD/NhaPM
	px1VLvSP36vpimk3cG9J5y57XFI7WDeCm6DFS29gURmNw1Gm6izCYFQdBVDbNyCm
	vX5i497hU+zCAzIKG9HGuU6oKc9YoFBptFDU3cATN81vhOJUjv1J0gDSa8rDfI0t
	k94NwFNi2Pw1CRJ7y6EjFbnNvAIHNBcL8xIIUcV/Km3bRJ8zIzn/orwX1/wfuyy4
	33sV8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11sfxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 13:47:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0ab07320so38494601cf.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783432032; x=1784036832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=Y2hlP6X3cmx0N1aOfoGs6SZS2GgS9ghA/DCowKa6a5bGxdvJ0t+2oCq4bI+FL68Hz4
         VPf3FRISudZb5wJLid3/tIOnEBBd2VupcCqUhSp5xOqBzNhMXjvRWWxawIld5lmFHoyC
         fFCVXPzX36V2e0hEazOrfxW9BDfsBbiUf9j75PDZniqFMJhwJ7i0Ucx8gDPq/iEGZYHN
         Z1jr1BizVGvWKA4/UpMbygC2UiFlzxmJ7f5R4v7f09RirqvMC5Ro5KYy1qBBrK/BuCZt
         pSpSIgiKlPisJIwLWBhjgWwcxN8PYPE8LaSK77bRLLMglR3iKMhlz0trcrjxdps+AegT
         VtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432032; x=1784036832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyqAei8u+t7l/e/rvtU8ZVllDYwd5+yugM7bTcE/irY=;
        b=YGCLlEMkA69PxXvUJ26hq2Fvm1a/VHpLjPHWGVu1P9DlmpJy+HYzLbgLjNQWVZY3Up
         yLCqo6X3Oi2bgUiqKcB5kowqaT/fhXc6bU4nDyJuWedHSeuyPlUBuuRvR/ejOvAyCLnd
         vNv4OrbreFOXTZ2vEoRCdLDcVImrhNvl0JUtzwo0V0b6lbru+UgCCXPbU/s6AaPLCNox
         GCp7bSz01Cu7MPcWNBxWsKF0/FZJWhwSC++Rb1zczVUdANAWipGcyKOFigjxhjRgjfMp
         L8dieIQfo99JNflj+1O0rUG2/mKqp4iH3Qr4aL4m/H4rkTg5WqXqy2nIPPqwlSMS+NzW
         Ktxw==
X-Forwarded-Encrypted: i=1; AHgh+Ron2mKE7q0H+PNAIMZz6AxlN262pqHTYdPd42m0NNM7pR1jG8F0Fvp+RoSbty1wOBjZ3T2qF9v+Ly75mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6LuKdCFpqv7AMSMFZlDj65qPEtlufQ1+r9VurC6tUX22KYiE
	ON86Hni4AT9Se+NJ4OauZBUk/TJlCIbiutDHWu1g6at6FM/IQwxx5AzShG3ciSurmJ0DGutA/nA
	wHthsLV4kEY5UZyw3V9HxtwJudkoLtY5NN0k9wReaeBLmPOorJ2WoHmuDF/w9QKd5zA==
X-Gm-Gg: AfdE7clDcBRqEfpP4I91XyFU7LjjKZ8RkJJhbTezgQEel+eBUvV5yBf25dsrZ60Zpv1
	JWmUU8iXYxuNM7CaY6PLLryuF5xpZ6zU6Z5GC7S8wDnyQPzAHD4kKe08zrzgtjRZLRU6++oAF8I
	7CpOHHWG6RkwavR1JDJDvM7uDX1ytiCaZTP376zlNu6ws0apPRHMiye/B8okj+eLKnmFV4+zsc6
	s/90226vAGnxTVNy0PAoMg6HyGmgu7V5EImukh1rcqisk4U/YreDcbBtzJkmtWAqa6QYMcQ0MjT
	O5lRGaGbrgZ8nEXBKMBFfbeTRaU/lmS/6kd3HWmT0Dq8Qglo5vIwqx4PlZzv8ZRupy4RamE+ZfG
	3GgUzM2gAQcUVy4jWtelsvKnGkjHhTrdDl7J3YqKgRDP+JSMod56i2QSlvkkqm86lXhqhuOAu1v
	a7LGwewnk=
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798691cf.7.1783432031382;
        Tue, 07 Jul 2026 06:47:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:c37:df31 with SMTP id d75a77b69052e-51c747780eemr58798071cf.7.1783432030794;
        Tue, 07 Jul 2026 06:47:10 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daafe2sm5659651a12.25.2026.07.07.06.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:47:09 -0700 (PDT)
Message-ID: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:47:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d0361 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FYVyraQ01RCAgbHwNcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: l9SL1fo3HjKlhO4uK5y9kLieSkA7kt-m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfXw1U0rREyc1bt
 X4dsmq0n/+twmT4RVLMjegZxrdcEXlOrAOpGzvNMF9KCU8WKibPcDKGSvv7oTOHEd4CDAq5eyKv
 6LH8fL+WuQ7szaH9Qe7cHauWfSHcDbY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX/nlQjlEBz1lS
 oMddnivFfnE8MQEo2JoRJhsCMS6lF/IuRTGAnNjPb8PdIlB46FGeL8iJpWWcOkkyfbxkn2Z5sKG
 G+nLhGjoIbQzO4fF5QKBW7mRM/kgX1L1mhE9EiYGKsk9TXIk6nxXVoj8A0O3tDVxu4ogdGvcq3V
 4+fID7FMprTg6eBQgi7GSoSKPX0+5FG30wD4AYIHg++eLVMBIakdlt6rmZDQYyDY4DhRixUDDxI
 taLJmDvKW/hoymHjMq/gAC9l12jVbTuNpI/+1qh5x2CgZnoTI0HYd31zF/FDDyLW/Re9ei4JMuO
 D49Xia6KnbZNefwUIeIC3TLDfHjL7QN1ljfFDz01SxFrLEA9844jgokxOKlB6+xRNQUdCNoX4nb
 q8b7zV1/oegO+HRTKMT1f2wQ/7aif+VP+lrrRnK97gMQPQ+wbAPGR83TwXzMpyOWMXbQwj0+CB0
 gUwU79bAtBYSvZfXmYw==
X-Proofpoint-ORIG-GUID: l9SL1fo3HjKlhO4uK5y9kLieSkA7kt-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66855-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D5D71C2D3

Hi Dmitry,

On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vlad,
>>
>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>> <snip>
>>>>
>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>,
>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>> QCOM_ICC_TAG_ALWAYS
>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>> QCOM_ICC_TAG_ALWAYS>;
>>>> +            interconnect-names = "cpu-cfg",
>>>> +                                 "hf-mnoc",
>>>> +                                 "sf-mnoc";
>>>
>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>> position about the need to remove all "CAMSS bus" specific resources from
>>> the device node, they are found and should be allocated on parent's side.
>>
>> The interconnect has functionality to handle bw requests from different
>> clients.
>>
>> Yes the best will be to have camss interconnect, so jpeg and other hw's to
>> vote
>>
>> on that (actually it is possible in icc framework) but what is the benefit
>> of moving
>>
>> those to camss? Is it not better to create camss icc. I understand
> 
> Please fix your email client and stop inserting extra empty lines.
Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
>>
>> you want them to be on parent side. But how to vote on bw? Most of the time
>> it
> 
> If the driver actually votes on those, I think, it should be fine. This
> patchset seemed to add bandwidth voting, but then it dropped all the
> votes in the last commit.
> 
>>
>> depends on the jpeg encoder configuration based on resolution format etc. to
>> set properly average bw.
>>
>> So i dont see how that can be done with not explicit dependency on jpeg with
>> camss and some exported
>>
>> API's which we discussed with Bryan they are preferable.
> 
> Interconnects should be fine to be referenced here. Especially, if JPEG
> has its own port to those busses (hint, commit message).
> 
> As I wrote, I see a bigger issue with the clocks. You need to have some
> API to vote on them (and then let camss driver aggregate those votes in
> a platform-specific manner).
Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
for the clock voting.

Regards,
~Gjorgji


