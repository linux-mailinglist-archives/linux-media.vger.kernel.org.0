Return-Path: <linux-media+bounces-56857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKfZIN1rwmmncwQAu9opvQ
	(envelope-from <linux-media+bounces-56857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61D306B10
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31257304CF46
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5363E63AC;
	Tue, 24 Mar 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efSusFmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5IalrMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AA73DF00F
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349015; cv=none; b=l/PJ6C083JQ57TGqWS3nqB/rmi4UAtz9V5eGMbfguPmRjP19v+qTt0xMUUzlO1dRPDQsgVz9Azk8UMHa+aRSMupqbkNlcqYRI+I3p/POMcSo45YKsRcb2zc+uHX2z/kD5lJ0DoFJ+aqHkPir7x5O5ECV+0ZS7bA1OT5JvtT4Dnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349015; c=relaxed/simple;
	bh=JbFBCT8jFnYJL+nZ/KPFkxCkA7Qi+D4qGi8jvZyWkDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvDsM/0MiqMzYfTZDBA9Ke722Bp/vPLw6tuV6S+u8zIcC9Y5ZlmyNuuK0IIJYcINKWYd3RGNyvZHSMwXEzHKeKZBh6oHtS83MItyRKyHwQNThrAw2dW0oqVEZafkp3OII0h/2zKiLc4rsZFtxl9Kxe5ZY6MAlh6jS7oYlrYoc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efSusFmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5IalrMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xgl12322873
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=; b=efSusFmwgP+aFv45
	FpvY/zNPMqMLSkCMiIxNzFlEdwPMjaBMIZtm5hEkip7P2FBaJ+9aV1COpCrGRSfW
	K8Zd0Ug0I4FzZgpzkowvp+ff9THc9SkGCFrnwYFRR0wu+9DcGGbWPiXCQ16cWrQ1
	4ZCuz9AIo/DNFO60YTPOMHm5mnPzdC5uqeuwMLY78vkxdQ5HZ2u2mX2A6iWH59RN
	6I/kYXe56IYORltCeOmgqF3UfRTOMXa95csSAaKaXNf/hamCS37cNkjKkDbdT3/a
	K9ncYpLIZznX+Vet7vPkNUGPcvFeeNtwEKma0PMlEM9y23UMoMf3Csnnim+kj3KZ
	C/NdxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkerdma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 10:43:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so49898781cf.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349012; x=1774953812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=W5IalrMhQ3cOEotPm1GrpXolr6zUPEhUbIFHCSfdT9sFDcZtx2LimbUdH+wAXkIybn
         C3843uEgetK4hwXb7sAIYAbZpiv8a384d/xSl3u2+/ptI57IXV7jalIyfy/2/eLiYzlI
         J6LHUdGxe5pflvP8zpJQw7lhu0oHEHd/RkWW3UDNREUF3kLw9XE9d+J/sgIsqJE+yVRb
         MVAv6IdeHon1XYiGChM2pn60Sn2jlqizfMDnufgo1hB/Xk+5DzfsEkb9fdIj9lmjZNmU
         qaSU4rRKbSf5P1YVVNu6RPZ2z3b3oIngOf++VcknaDeAXGrNEqfY46yjSpuZvz3cZP30
         fiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349012; x=1774953812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=nO1R7l9Kid02y1Ut3GByHKBxJjigLT66qWjzLraab7/q/wGJOh4iQqmF7Tht4C2hYK
         l2CuxFt5WOX9whGEBDhTZBcrDDEhhIkstJrVya0Fs3E75d/5if3qtQY1nzLBPKxLRgJv
         tdO9r/Ru1PFx9pQEQ1glaxODPhcR8sh0GXoCDhoKJTerPmbnb2qOyM87H2RjfpaKweLf
         ml2/vExPweONTX97JY7kWEBTSrGAUM4bwGp/Oh3a+LVxn4tHCExY/IWCGdMZwLL918eV
         E55xigREELWpgS8PhHfFP8LOYp2V8eJ66QUZtJdKRVeeM4vP/blYYeZNk+HaCHeMM40x
         CJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXGE19oY7E06WmDTJ7cT6e6Kbzy/4qUAEmPScSwR/zVJhnA5s394j07CWKvJSBOos9EKcYe4BvUS/lNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdmc8vVo2CftcC+8Je2megdZcxxu+hqSsBXD+6q763mec3wLyY
	RnNVRekKS9+OJCLTTunnA4CNxTIEYMZ6USFhazLws0Huf2KQA5ZYfEQ5fTFFPLYLmMyuh3EalA7
	4L7LkczuC4uemlA+ijqQoXKuCbb4SiqcIMXNcfZVI+KpknM0wQl7SCJqvpwukUIOkPA==
X-Gm-Gg: ATEYQzw1YPOfPzJsM/lwoXYuZF2Ey2j4duHvAQ8ENHDK2gyhV6Chz509l2wrLFNQYqw
	mDoGtDqysDgCT3iuZ7UqtXkaGqCzNesvK3p9f0Kwvi+h01NF+Q6m+te9kDLFfrnRTjDeiAZ623s
	MR9jGrgju20FKMBO2231ZFdv/1ZIWMjN9b0pbBJ2LKvrvFRWz/9MyRCHdj367CjgaBjHtt5TQTH
	PYHNvXX+SNVtO+RS/Ku1sF5UpJCVVcTpAZEhmsBNri/hgtg/15TdsiGlCmCkv98FRQfRHdIy/L3
	OKbZoyv8T86NhRTKs83LUTsrvWdiNZNPhRlnPhJma9o3MqU86sNzj13vTYbj7p0JBS1pKibJQ53
	y0AqIaMdNo4e8/8pik2HEsRfInwB2Xd+OYa5F3nRI+M+kbTEWufVrYOd4+A2i7k8npWTt70AhcQ
	VyaYw=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375111cf.8.1774349012005;
        Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375001cf.8.1774349011548;
        Tue, 24 Mar 2026 03:43:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm613885666b.9.2026.03.24.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:43:30 -0700 (PDT)
Message-ID: <33f95784-7ae2-4ba3-ba85-03505a2c125f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
 <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
 <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XUQM8Y3f3da25I3RNYr0vk7yjDqaAjNj
X-Proofpoint-ORIG-GUID: XUQM8Y3f3da25I3RNYr0vk7yjDqaAjNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NSBTYWx0ZWRfX3P8u2yU5mdAE
 qzaPThQPAQSlGZS62R9IXXiVceLb5NZxdxjnJZFSySiuC4C84vYTL5l1v2+E31/XavGFLcUb6GR
 lOHC3EwzaeKXGmY/rhYRdoTgSJd90tdBq3J8cKqhRs3tw7EtcBOe8G28J0xjXXhYmJ51PtJyZYu
 v94Zo9R0Qw+cvGJmwftxmoZy0yOL8ofbfjKtvyKkKB/O1nwDNMulnpFgC9t2pkyDVGxDMxbeqC0
 MEaecX9osknkO/niIrTfBKiapo4PXD/82BLqKPKUwdCpwTysadODxUPpy91DNtie++ROfSpeU+4
 U09wFAKQk3DJ42qs6djBk92nD9IADfmZxqGtHUiZr2XdRqw88ZKb6biRyK3WkLNZcqkcQ90nfdr
 /Y0xlmsB4FzV+ir+dkmYmC1NEFrqheK3J0CrvcMRmYc/QGFUICsHPxUzw/Nq5lt2cti80NnEaMs
 55q9PdOcvESZiMatPCw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c26ad4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fUXq9ZcRc7bERpTzZuMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-56857-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E61D306B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:31 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Mon, Mar 23, 2026 at 2:24 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 1:58 PM, Loic Poulain wrote:
>>> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
>>> QCM2290. The OPE is a memory-to-memory image processing block used in
>>> offline imaging pipelines.
>>>
>>> The node includes register regions, clocks, interconnects, IOMMU
>>> mappings, power domains, interrupts, and an associated OPP table.
>>>
>>> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
>>> clock is shared across multiple CAMSS components and there is currently
>>> no support for dynamically scaling it.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---

[...]

>> Similarly, in the arbitrary choice of indices, I think putting "core"
>> first is "neat"
> 
> Ok, I thought alphabetical ordering was preferred?

I believe that was Vladimir's misinterpretation of the DTS coding style
(which is admittedly convoluted so I don't really blame him)


>>> +                     assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
>>> +                     assigned-clock-rates = <300000000>;
>>
>> I really think we shouldn't be doing this here for a clock that covers
>> so much hw
> 
> Yes, so we probably need some camss framework to scale this, or move
> this assigned value to camss main node for now.

We do need some sort of a backfeeding mechanism to let camss aggregate
various requests coming from the clients if we want to prevent having to
run things at TURBO all the time, so resolving that early would be a good
idea, even if a little inconvenient..

[...]

>>> +                             opp-580000000 {
>>> +                                     opp-hz = /bits/ 64 <580000000>;
>>> +                                     required-opps = <&rpmpd_opp_turbo>;
>>> +                                     turbo-mode;
>>
>> Are we going to act on this property? Otherwise I think it's just a naming
>> collision with Qualcomm's TURBO (which may? have previously??? had some
>> special implications)
> 
> 588 MHz is categorized as the "Max Turbo" frequency for the OPE core clock.
> At some point we may want to enable this only under specific conditions.
> For now, the OPE driver does not make use of this property.

Fair, we can always get rid of it later if it turns out unnecessary

Konrad

