Return-Path: <linux-media+bounces-63015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GAFLIFDGWqNuAgAu9opvQ
	(envelope-from <linux-media+bounces-63015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:42:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2825FEB34
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 614C1309A163
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E9E3AFCF0;
	Fri, 29 May 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfc/HQaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn3bsMgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21DE35200C
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040162; cv=none; b=c/1cW9HiP1YrVwNv2AgrFrReR2po8McLRe/Q0B1FeSEnOSzgwkHifVKGadHDZVvFPg21FG6X8PZQizsk0RJIWi/iOwvmhZuUQ8NfXicanIktaTkXoEXzWHMxlPshgVapqIT4VnhV35LDKaNFcRrVlboe37gA83WJi6+Z/nw/IA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040162; c=relaxed/simple;
	bh=UsoWPs7N3ck5RGgeIsP+Un7T577ZXuJXQ/V+C6Km7GE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mfkTdNeOR+7AkUT4yrQvRbQT8CjIueyIfQThm24LkTnUpnme4ymoIa/SmnYZd2sCNXCGmOs6NkbqOxnQu9+cG72CsWv5oiLDOjkhsb3W2aGlbTJjeTjEr9A8efNue1qJQ0TsguFsQIvHRygVkX3Ov8tF8jsYuCf76QdKVc1qFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfc/HQaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn3bsMgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6IXBB1369445
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=; b=gfc/HQaJE7KeR25V
	LXYhHXnq8EelULjK9elSFkSt/qVo2Z5KZ/VHbe03/Y/vF1lq8HqQMSAHx1FVgJJ2
	F+mFw8cRLa4TUqGos1FyVkFX13LK/PhEGoH1bmnvF7hKHOn1hInp8y/iYGLzJXVM
	ascH2dsPxpdkFmVYAoibepVWOY5TwuuZZlQYhlOCb9U4z7EOIjrpprhATcR351bM
	LgM3cLN4sAI6OCfy2j8AIlwy//bwRmE211/kF6un4uSOmymyEvdGaPFje+6DFya+
	/mNLql+3pwGGp6wUkQnbTQcsMRtrqsNSG+yirb1VNfIJjjLB/XyAIHcoFy64a7Pb
	qMowUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5ty86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso2471287a91.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040159; x=1780644959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=Xn3bsMgQewfAdq7OfKChk6IBke755sCJwHa8JeRcta8/RLhZWbbU8QW+bpxOXscK0Z
         eEqSSa3FXRAI4G52v/0/uo3a8kU6zFX+mDIx34eWDmRTizTvZ+SHocxvgiH0MXp4BpSq
         fkqWO7l2cW2rsvq7+LIUgXx8ufeu/gu0xx97K0IOurfvinrzphRAV2m5CBCA8yDLLFa+
         xvl8lYoZ9PnysnarGo4dl/6pfj0kmmM8aFkFQXsVknG25KXosPAxJvLDcz+dOu0MT5X+
         IllhY0Sp7zGXQbcpT2u93di7CWZorV2QQkR2AdCWdg4fN2sf+4FZUHOpLAaOGaRx/yDs
         q8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040159; x=1780644959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=AC7MBvEJcBzLxt8BkMUPT0uZEn6W39m5aZTIT0MTaQe0R7amfC/4ujsiNXOzpyDOU8
         c2K65W/YEGyiui6S8/C6EMuGp2PH227o9rOM1DE17WaVPKMEiCOLH16Eq03qnegJwANo
         6ZBh5PY3b1qVqtM5qBjev3WkmnVolxa39/6nYl3CGlGMCNlNMvBf/28BCvymH7FYRQiu
         6Vcbwdybjp5jJFLtHdZCXoXeGsKfb5WqCe966ans9rZQ4xf2bWk0fVYHUChO2NLaJpbP
         3Sz+DoxEKEdtQuSIMDBy0DEA207FO/7SWnxlNClnomg4Ko+IgVxPdgM3cWyyOo17FlyI
         We5w==
X-Forwarded-Encrypted: i=1; AFNElJ9hNvMirKE/VTaYJfaYpg/R0LUDXicycI4/B1BasacQKsBzC6fO1VNAokDy6RaV+L1YcDYi4AMg9ZJBqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUn6b7AcCOP7VGmOWItbYyIC4NU6gXp6tvYqBPytYgMrRZM5Yi
	2DWMQQXzevlTdI85H5WnC6UTy4McmKgV+cUxVQXVUgvg+FM3K7w+os6H3dtfxXT+8ZOjZGwmKsu
	RMTsOv4EdurxyKv4pLevLroifVfuX02lo0dLc9VDQiPobFVhgcmgSwIYgsw6rM1XlpA==
X-Gm-Gg: Acq92OFXgyj0Ht/fCWNDXCijWLAaQmEs5bo+DwOW1v6AdUjpyTFEa1IaA1R/UfGve9V
	zV60xD9/1E/28TyxPPwXy6BrAWGtorq61TmPbLOGGN2ORyjEV0mPDWvhFRw0YrsebFp2xpSzB5n
	ktoIDTJVoJn6GmZKCpoeeFtk8CYr3eovYeLckjo2isbG/EP1kPlYb/2A4Dh0xubjg8kg0a5+Ffq
	kqqtHL+RsUpY+phYzGtHDKR/xJBxZIpY1DAN4hnP0S3ZOr6B87HlGKI8ZvPqW/Z1pXn9+ataXLx
	b137RVWMDmhkun9LlHdPp5l4LLlW8l0m/ctfZG21FObxZQ2AvsrvM3RU2IGEvHYNlHOuDChtvNs
	ukGL5VkvpTjOFlRLO7PaNwcb6TTQ1S0u8YsnaSytyECxrxSEOAR+aBgO5U1FALk6nbBiTRIhjvQ
	DbMqpm3t/Qf0wVPFGsy81QYxTcviA=
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422379a91.10.1780040158855;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422354a91.10.1780040158297;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc1c71392sm682063a91.1.2026.05.29.00.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:35:57 -0700 (PDT)
Message-ID: <5b0c416f-c973-4033-b617-2b1f4660f0bd@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:51 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] media: iris: add support for purwa platform
To: bod@kernel.org
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
 <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1ZgzMkONC7E8kVGPsx08kf-wQggqd5To
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a1941e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a87e1LDsL6KBLIImkoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 1ZgzMkONC7E8kVGPsx08kf-wQggqd5To
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX1gZao5+GVMm8
 3S97oTSNGaEHXYGtMrBllYc3bOHVLRe0DLV4pi2BPFOp9kmdWaMPOxsNbk1YZ738CzucvL2iui1
 wjU1U20YYFZF/M1exP6UCU6DA4KzdFbu38RSlKgX0LcwmI/wR4SAOnFHKCLe4xemyWnLY2FTGTA
 k9jbg/DO7HrXL/elSZ2Z7zgdQZ690jijEXyreADx05htqb77X7HGumGS0DxMsTNqtKd+xNvkp8a
 /p/Ip0kqUdXDidnu5aM8I/rA5SmMes5E11CU4SthaerhOx3sL3F49fZ7qQguJCA5U8fHNH1xxZa
 5onHx286dx9C5XS+k0rBIFvJOKnXpmNEn/KvsBFSrsddQb1S17+bK6ET5X+cabsHI4ulWS15Srg
 gxRnBUutJlexzdYXxd5oCyIexyIJCaNN5WT27CeznQNTfB2dlYOy0KJGVOYRyZnBWLhC+POK+4p
 +nJbDUa+/UsRORsa3KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63015-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE2825FEB34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 7:33, bod@kernel.org wrote:
> On 2026-05-14 18:09 +0800, Wangao Wang wrote:
>> This series enables the Iris video codec on purwa, allowing purwa to
>> use hardware‑accelerated video encoding and decoding.
>>
>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>> except that it requires one additional clock and uses a different OPP
>> table.
>>
>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>> and OPP table need to be redefined.
>>
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
>> Dependencies:
>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
> 
> The engines canne take much more of this Captain !
> 
> Doesn't apply.
> 
> deckard@inspiron14p-linux:~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom (*)
>> b4 shazam 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com                                                                                                              next-smoketest [367fd4d05a088] (!) untracked
> Looking up 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 6 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 83 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✗ [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✗ BADSIG: DKIM/qualcomm.com
>    ✗ [PATCH v7 2/5] media: iris: Add hardware power on/off ops for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 3/5] media: iris: Add platform data for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and operating points
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
> ---
> Total patches: 5
> ---
>   Deps: looking for dependencies matching 7 patch-ids
> Grabbing search results from lore.kernel.org
>   Deps: Applying prerequisite patch: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock controller
>   Deps: Applying prerequisite patch: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock controller
>   Deps: Applying prerequisite patch: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video clock controller
>   Deps: Applying prerequisite patch: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
>   Deps: Applying prerequisite patch: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera clock controller
>   Deps: Applying prerequisite patch: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>   Deps: Applying prerequisite patch: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: clock: qcom: Add X1P42100 video clock controller
> Applying: dt-bindings: clock: qcom: Add X1P42100 camera clock controller
> Applying: clk: qcom: videocc-x1p42100: Add support for video clock controller
> Applying: clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
> Applying: clk: qcom: camcc-x1p42100: Add support for camera clock controller
> Applying: arm64: dts: qcom: x1e80100: Add CAMCC block definition
> Applying: arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
> Applying: media: iris: Add hardware power on/off ops for X1P42100
> Patch failed at 0009 media: iris: Add hardware power on/off ops for X1P42100
> error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_common.c:292
> error: drivers/media/platform/qcom/iris/iris_vpu_common.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> (venv)
> 

I've updated to v8, rebased onto venus-iris-next, but this will conflict 
with commit 95a337f92f0a602d4f935315bfbc8bf07f475e65 in the latest 
inux-next, whereas v7 won't.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=95a337f92f0a602d4f935315bfbc8bf07f475e65

-- 
Best Regards,
Wangao


