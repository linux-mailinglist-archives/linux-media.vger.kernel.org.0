Return-Path: <linux-media+bounces-67338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tnPvOtbYUWovJgMAu9opvQ
	(envelope-from <linux-media+bounces-67338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 07:47:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342717406BD
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 07:47:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lKdLSv3u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MtycTzj2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67338-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67338-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A715B3023DDF
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 05:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB692F363F;
	Sat, 11 Jul 2026 05:46:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E802EC08C
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:46:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783748808; cv=none; b=qt4jPd51Y1mCnHkR8GqWucmWLiR7lqjNePMYCWRBsGn1dByFSwD/6j8m4h2nozOF6O2iIBb5FjSM+35a/rHq3e55uGGPFrK9ZfoyEv7/IiT+1623ArsXXJN6AWicuDeb/jP8TVRng9PF3242WTRK38Kx/4SMGF2iepULyGXf7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783748808; c=relaxed/simple;
	bh=KdwWMKt9xEN3xDtoDCATPMzZIWVY48mme+8NbD8tZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjtQ/K4HsyikIY597DV/oMgfH20MeWl1jSluhEVq+ZwQGXBZV82A0aU/Vl6EdkKwPFydP6wRE/97w92sytugKCGoIy/lhxHxkcpmVfba1E6chvDBq4Ght/hY1IzFaQ4LpAaz1Ak73MFVos2h/9E+CjLlsZsxNdROwcF7flbD8+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKdLSv3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtycTzj2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B54wAr2835607
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=; b=lKdLSv3ufnyHePk8
	t9OJTg5Utyn+lWFHsXShB2UmSqXPgXtY+jwBr43owVpAxTiDjxXY6H/pTAKFTwQ4
	7NlZIlP5+wpiNecH3NkFD+nxiAQLv0T5j/ZqVmY2t+PXGCpkubkxjEeYHoMRBXJC
	OHk7Ele1xaAGjvpiBAeHsPvy8QnlkvgEoAGjJR6mbmfb0SjxXKBkeQygXybzwcEM
	2xMFRSlQkF+y4fsP6zPXqiqi3nJBrgmkKsROISmnlQrCtRXQLAfhA7uIWVCOwpWH
	5GG7Tt2FCTKIVh8tW3vyU31r1cKZ7xSLXVz7awBvY+tBITj3tS+1Aso+3wmrT7GI
	EjAYvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcg4xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 05:46:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso17651551cf.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783748805; x=1784353605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=;
        b=MtycTzj2J+UuPZ3Isrzz2FSwzudfXRtx9HkeWkgaKfn10NfT38Bs0exrIOuTQbgSwi
         QCKmJIv7UQwPtoDHT7F6cltEslrJTswXNxpaPcDEMIg93f5e0EVwrX30xSWEHcZpPR+s
         exXJYOeoy3BOapf7I6XmdKvqRj6BBDHh7W77TB2eH8GZkx9RCxHljn26r/q36/czHDDR
         KKjGqX0+w72f6UMyALnscatMgHnQldTTDE5GY0bu0KpdO+RSFl6ggdlJkc+EH9Ys9pZO
         snEGOH7Ggaw/qvU4K5/AfMKDPA5Djp5/0kX/Fby8IJ/Aih5XSpvOqdgnSahiB1ZxQNOz
         87hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783748805; x=1784353605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gevgTNUs9RHgkaUGheSyiQ8zKdBVGGi1fUkWXs8Qot0=;
        b=oekT+GHVFPJCeqz5/tZwUzqyvLUTzdUTnkYhVFiRvqe0Pyk9kVUV0MU0BT/6QhY/Ge
         TKJxgoeXxBAEwS8MwS74dgXCIEjbL+mngV7ob586XFJAWij//xltB8tMUera2wSoadk8
         1Wjv/q4vf3l4qqOYyZIRbDsbrrShk+b0PEA8lO9fkIaeQt+Ih8+0MHwFk08l7Gha2CsK
         N++aeZDH19jDOX5AUo01vKXJ1s+APpy9b+ulRgabP0egiWjLDz5celz7/sU4x+UmA3Xa
         hfa35h26Asj++Qum0KrfgCJJtCJcVGfrfJEtnIkQ/V2T/7BD2x4SYx5+DcM8t86NDQXe
         MSbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq62817PSEtLhr1GicZTrvN9hitajDyhLn4szNVDbh0q4esuL1Bk5qruWbVFgj5+7MOXcxlCn1mUEsNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYTkMlOp3/uPBG6IC0jbSZrXvby2SbJjIrelfpO6DsulDs/29
	UsyTxXvWCtdXp8CDSLGkuWkrt+CJ04CFSM+pC5i/St16504yIquc3Gr/3RZWisl3lbHQIG0JhmB
	9x/VmTe+RJCFE+LiYKCKUTaq5IMzN3nzkzCc5+YHF4q/EtlEPqNRHnZdqXZFZ6Ncncw==
X-Gm-Gg: AfdE7cnMiqStc3cfzjcreb00rYej584Yj2LL5rlP7sEOgC4DMWUlA8cYNrNPj0glhGk
	hfa2iKd9UkZ0WbncxnAAjeJgymTAXJuJliiYWBdC3WnmmEG/c5oAUeQHhQPEAOSGdqJR/rihS1l
	G6rcABcr2OLTWDArVjCNP3midXnorIjRDemINEy7TP2uVuGDgwzRRyvyTCD0dWRXAALxRrUrrnj
	GmLW160aEFYCu9undyP8LU7xJYNv1Y1HUlWCqQjlerZk+sgt3IcY4iD+T8eA3o6aWA2A/T7B6XE
	WzvUZB2ZPfmm2EgMW6D24yBrsJuoiBWKbeR+hwNTmb+bvfJfzYqbj6W8UvlMRF5Syn+88CqaSxQ
	EBP0YDtnc/i1ZWonWpbqPt2t8j3ILo0zd8oMLZBHwPYYa
X-Received: by 2002:a05:622a:2616:b0:517:9095:c329 with SMTP id d75a77b69052e-51cbf1fef01mr18790461cf.45.1783748804646;
        Fri, 10 Jul 2026 22:46:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:517:9095:c329 with SMTP id d75a77b69052e-51cbf1fef01mr18790251cf.45.1783748804101;
        Fri, 10 Jul 2026 22:46:44 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d81bbceesm457348966b.41.2026.07.10.22.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 22:46:41 -0700 (PDT)
Message-ID: <71733afc-732e-47f9-8497-b09600f93612@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 11:16:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
 <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
 <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA1MSBTYWx0ZWRfX6vHyCXxG3dKz
 jUA3IfsEwjZbtITDP1n0VjF+oEWyJX6BP+oDDnxZf282R1I88PqoHNJvCMJfT3HAWeLwIZ9XP5h
 TU0BBQmpL4ESZ1HHxIP52zvJ2C6+AWc/if2Q0+gjB7+yAyzujnjvfymCuBVyRVodbwRZMp4Llmx
 5Aue5T3yduNtsJBDAMNQrFnMfw1xnU9/6Mi0vlOLuX6o6OAwiPyUIBHsERo1We7bSxktQFA2bYc
 AzFN8Cc4S5fKGL7Co2RYjIGuEAXTwj4BtBW4w1HXeePsWwRyXfA8J4/1bV2/h1Dy7iAfIWUCSvr
 Rxt/RQjiIBZqC9KpswjgEcurJ3sos4BTJc5CubPtmeiMEViL86PGxWBNwN2JhNR246tnZi4PwMQ
 lynu+SmA1Iw7nlpJ/pU+nSrA06aAzcE0WjXN1MODX6JUj/MKwAto2Exnef4xceVYo5+hP0OvzRU
 OauFN9/XpKc54uQ3CHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA1MSBTYWx0ZWRfX79zLw8vzZs2n
 SaKIFzlKqW0qykNuIYaDKaFBQRz1XibKvgwklogvTNMoEsUU3rTwj16FgGrNs5vUhS1NRWfqQTg
 i0p98aN6CtptdTiQUzmjKr2YfsBnepk=
X-Proofpoint-GUID: sYjrMVI_hE3Me4nSReKLt0ENvSUDoN1G
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a51d8c5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wRxn6a4LM5KCmfMgYXCo/g==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=2_L87j3xYGeytyR3NxoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: sYjrMVI_hE3Me4nSReKLt0ENvSUDoN1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67338-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 342717406BD


On 7/10/2026 9:23 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 10, 2026 at 11:32:20AM +0530, Vikash Garodia wrote:
>>
>> On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
>>>> VPU hardwares have a limitation where VPU streams are associated with
>>>> dedicated addressable address range, as illustrated below
>>>>
>>>>       +-----------------------------------------------------------+
>>>>       | Stream A reserved region (600 MB)                         |
>>>>       | 0x00000000 - 0x25800000                                   |
>>>>       +-----------------------------------------------------------+
>>>>       | Stream B reserved region (3.5 GB)                         |
>>>>       | 0x00000000 - 0xe0000000                                   |
>>>>       +-----------------------------------------------------------+
>>>>       | Other reserved regions                                    |
>>>>       +-----------------------------------------------------------+
>>>>
>>>> Mapping a stream outside its expected range can cause unintended
>>>> behavior, including device crashes, as reported at:
>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>
>>>> To address this limitation, the subset of stream/s are now represented as
>>>> sub nodes, so that they can be associated to the respective addressable
>>>> range.
>>>> The limitation could be exposed when running usecase like concurrent
>>>> video sessions. The binding have been validated with higher concurrent
>>>> sessions across the SOCs supported under this schema.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>>>>    1 file changed, 63 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>>> @@ -91,6 +91,51 @@ properties:
>>>>      opp-table:
>>>>        type: object
>>>> +  '#address-cells':
>>>> +    const: 2
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 2
>>>> +
>>>> +  non-pixel:
>>>> +    type: object
>>>> +    description:
>>>> +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
>>>> +      buffers. Non pixel buffers are compressed and internal buffers.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +      memory-region:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +      - memory-region
>>>> +    additionalProperties: false
>>>> +
>>>> +  pixel:
>>>> +    type: object
>>>> +    description:
>>>> +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
>>>> +      Pixel buffers are uncompressed buffers.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +    additionalProperties: false
>>>> +
>>>> +  firmware:
>>>> +    type: object
>>>> +    description:
>>>> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
>>>> +      VPU when no hypervisor is present.
>>>> +    properties:
>>>> +      iommus:
>>>> +        maxItems: 1
>>>> +    required:
>>>> +      - iommus
>>>> +    additionalProperties: false
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - power-domain-names
>>>> @@ -98,9 +143,15 @@ required:
>>>>      - interconnect-names
>>>>      - resets
>>>>      - reset-names
>>>> -  - iommus
>>>>      - dma-coherent
>>>> +oneOf:
>>>> +  - required:
>>>> +      - iommus
>>>> +  - required:
>>>> +      - non-pixel
>>>> +      - pixel
>>>> +
>>>>    allOf:
>>>>      - if:
>>>>          properties:
>>>> @@ -177,12 +228,21 @@ examples:
>>>>            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>>>            reset-names = "bus";
>>>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>>>> -                 <&apps_smmu 0x1947 0x0000>;
>>>>            dma-coherent;
>>>>            operating-points-v2 = <&iris_opp_table>;
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>
>>> I think you need "ranges;" here. Also an empty line before the subnodes.
>>
>> Could you please elaborate on what would be the use of "ranges;" in this
>> case ?
> 
> That the subblock has the same address space as the parent. I might be
> completely wrong here.

Yes, i explored with the same definition of "ranges", but could not see 
a use of it in our case. I am dropping this for now, unless there are 
suggestion on this on applicability of it in this case.

> 
>>
>>>
>>>> +        iris_non_pixel: non-pixel {
>>>
>>> Drop useless labels.
>>
>> Ack, labels can be dropped from schema.
>>
>>>
>>>> +            iommus = <&apps_smmu 0x1940 0x0000>;
>>>> +            memory-region = <&iris_resv>;
>>>> +        };
>>>> +
>>>> +        iris_pixel: pixel {
>>>> +            iommus = <&apps_smmu 0x1947 0x0000>;
>>>> +        };
>>>> +
>>>>            iris_opp_table: opp-table {
>>>>                compatible = "operating-points-v2";
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> Regards,
>> Vikash
>>
> 


