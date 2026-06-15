Return-Path: <linux-media+bounces-64871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oKdrKAiVL2pVCwUAu9opvQ
	(envelope-from <linux-media+bounces-64871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:00:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB9683A01
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NwdzT6wV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KeKLWUNd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64871-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64871-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B720300E5E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 06:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B5D37648F;
	Mon, 15 Jun 2026 06:00:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BDB2DFA3A
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503230; cv=none; b=jZrI/waAMxL+WCzd5kfsRQBabGg8oK7fDCdVFZ9uC+eQ6gjtwhi64j37GxObjL7W+wXy+3AvMAAl46mMq5bTiLgI5sChQYQaPDMG/SlJHHGtPkW2GR6FW6JdX1f5H6MApqcaS5SqDkNRS/f+EyzBkT6zyblj/CO/uCfgmP0NsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503230; c=relaxed/simple;
	bh=nGxWKW29W2AOH9Ky6bfSCGDBZeSZKncm4gB/k0IFftY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYGxIikaADVA0g60WBM3ETiRdYQRmoN63iK9Mv15LXN/CMxIwPN5w8QxRQP1sYimN6jhiHCwyoI+LK3QnXGatHGsYa1aVjMbqMTtq5A0JviSz7YmcpRwW2yRxYV2MyhuHREuv3SK1pPfavMprvskRzfkJjMReICoyv8y5QIn5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwdzT6wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeKLWUNd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hrK32727509
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=; b=NwdzT6wVhr8wqnW0
	iWoYkRcefGrrbfVMcfmgzXTZSv9XLheXZRPxHPa5sT9qQFnDOSYBX1ZKQex8AQhx
	rbrlQjzHP5IOFZkQJUEo4oCwFukGnF1/3DzikNBBwrws7cJQLsZYTm0jrRoTPVEp
	75sevAWXOgQl9vp24ggILJG0SbD5pGuHaSF/UlUoQwA4zkYEGYZ/YGHyL56ZEhpW
	LPGpvJtC4tM5p7Ox4cUie3HGFjFH+OpQ67INlJ3EQoesU8JfIRwo/DKfioFvswHf
	REGW7DigduKYpuiHfEvMRQHeBM0u03S+7YiEL3dptVB3kklI+OxhnNxheqVwKIVO
	vkCTog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye15tqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:00:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178aed25baso58324661cf.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503227; x=1782108027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=KeKLWUNduZscqlq9G87aQD1O4v8Uu0kveEJ3XiBr5FQVlBjOcvNqCyllSkuwkntNKU
         DW+EtgFjX65kgWskKOEsj6Di8EhnWd8JFVf39kqx2RTXtG9i2ERnpFjDsA7DyclTamva
         endkx1vUsqY1L6apOoj6T4WUL1uPg+KX9+GTwxBU1b8QCKLu4Ju4lqpdLcprU/9ZCnvX
         XSmH8vgzJlK2Blmz0KgltCEda8juzhIvn33U/nLhWu4dL8tQ9K98lQTNUMZ+vuhsne2+
         oBXqbzZB/07evPKfxTLmTdEwzE4RepgkuW7fnlhus/L2y9H9l8Fztoej0Aiut0DYcTpT
         hk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503227; x=1782108027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=HpgrxTXUEvgRely9ZWRm/QeHtsF33toUFLy5Mjo61664FEd8g3gKwXgwPyHFhVeQWo
         eE11Kmk2TNoSMfzvFAnpg2ZOMPRUm11pWW9Yx+MEVfthtzbUHsEAjilAYl6cYZJj/scO
         miE5KWLyq7f3et4d93GtpR2xD2xzIqmlcQEBOj7qcbBue+WdnaXpoJuDjAMFe0WTHf2+
         ztutwkKrDTT9VZMMaHwgrXJN0pEMvohwX+d/zbAUdRdqWFVSo5AMPdb4UuTFT87xdxWf
         cR+rvXWh2bfwMYM2GkZdcE1W1poSGotWwDdNd0JgFOJnDepYJlco0dDWAo58nTJAZFaP
         yCqw==
X-Forwarded-Encrypted: i=1; AFNElJ9kLGkZFWVsq+6SJJV8x70bQAB07HXSjHGPPZGv/JPqy5AJPL3pQgGY8K/KV1HIlo8Ardo9JpMbgI98Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2g2uI5TnBdsNy8o8Mj7O0VoFQYPu2SEetVzxIpa8g70xNaWDx
	aceZGhNvYQyH5yRsb4JHMWpaK1iWHeJ381Rarb3oGKm2NQ02Wa7VUNE4+CkzPHI03GrKgIXsVoN
	7YOsriosnlohhfimwQuVl2Cr16hQZlLRYRq3CZMzYk3JTFCrjLzLrCmiMF1qYQ+KWJw==
X-Gm-Gg: Acq92OELZ23AdQsRg6rRFV4BZtC1S2ykXQwzC0m+r7s8vhLESfWd5l60W1MQ91XN1/M
	Mp/AMCFq+oTfrGZAAUIgA0SNlql1q8DgMX1FU3v4ul6jGcNzuG9nI+8ZEGxjIRN98c74EHmh1N8
	ROiGWyA6y08uCjxKhlWYMJ/1ZbFqxRuqPnGDEiX/PEEBFO6Jymfc4vmTvulFz2gJD0F+2FIxJ4L
	mVLdFQWCwTD8pKSqMQb9yobn0YDzqQEOIebJK0k9VuVMW+uYlx1y/D+Vs9lQo/Kkvxf88GSQ4Cb
	Kk35NrG0GqA7LxE9FB1xu8ts+BLl1njBst/ziyRZQtMLq+bl0S+Z3LL/3Zfg5KRVUe7wljkEx3b
	K3okx8umc/uE+WB07dqSbQsEs/P1rS86tHWXyQxQSOqJLt/ZDK+myRGLB
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1340001485a.19.1781503226368;
        Sun, 14 Jun 2026 23:00:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1339993585a.19.1781503225780;
        Sun, 14 Jun 2026 23:00:25 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794aec29sm2731556a12.28.2026.06.14.23.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:00:23 -0700 (PDT)
Message-ID: <21bd4a12-01de-4c4c-a094-a39c330a4b1b@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:30:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
 <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DGSF4jV6EgmzGwPDOXSxr0sFXZeNGbvT
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2f94fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Qmn5Ufgt5HZSozbDxzMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX2qhFKd2fnbcU
 d/SfEUC4ZLDT1Mfe5Y6S30hGY7aUx4nznaktf5lOxjzaS2GRseH5wt/xgLJzT31kWi67JGHpUDn
 RWE/wzvH2QuGXnenKEza1+EC21IQViQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX7cNeNgvoNc1G
 Akf2ftiykvS/SxNzzMaNYxkOgnP6kMQDI7QikRfK3rfV5Mxum4wyHqe1SHC9rGwYWLZXFQ9BdSC
 RojFAkGMzgsDSEAAkaeym3oyR4FHANsQfWYOtFRmV1Ip6Ez8hFjEJb1vhg8v7jL4Y+LyLkuD/1r
 Cce8cDbvp2vmWCIgEj4omR79rwlVFTifaOBM77b4NrZshU6/J30YTlPWY1EzCD/CWcBhvEMffMg
 vma/EXc4V4Ve09YHeI0257fTzri1juayNTMiTtI3lKsPVrlvuTCKMQ5fLzR8ykJDZzf3iYJxVa6
 uwKpXcqp+V2JravKMLrxYzqFL+g7x1aj4zsYfMT3yaciFtb8vpDXA5BpxHx7F9kIQUuNal7nNMH
 jYZVPyZO14m8IRj4l++oqhUCUo7ydGEEylxQhz2osLk+wnW4hTgldPFLrgDAA5SNoK9yHCnB8R5
 3okcvvsHp27tYc/Hh2w==
X-Proofpoint-ORIG-GUID: DGSF4jV6EgmzGwPDOXSxr0sFXZeNGbvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64871-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07DB9683A01


On 6/12/2026 1:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
>>
>> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>>> Document the iris video accelerator used on shikra platforms by adding
>>>> the qcom,shikra-iris compatible.
>>>>
>>>> Although QCM2290 and shikra share the same video hardware and overall
>>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>>>> and Xtensa isolation requirements, such SMR masking is not applicable on
>>>> QCM2290 platforms.
>>>> Since shikra uses the same video hardware as QCM2290 and shares the same
>>>> programming model and capabilities, it is added as a fallback compatible
>>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>>> two IOMMU entries.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20
>>>> ++++++++++ ++++++----
>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml
>>>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
>>>> 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> @@ -15,12 +15,27 @@ description:
>>>>
>>>>    allOf:
>>>>      - $ref: qcom,venus-common.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,shikra-iris
>>>
>>> Should this be "iris" in a venus yaml ?
>>
>> given the vpu core was first enabled on venus and now it same core on a
>> different SOC being enabled on iris. There are 2 ways to do this
>> 1. Add the compat to existing schema which defines the binding for that core
>> i.e existing patch
>> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
>> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
>> hence even iris yaml would then need to carry the venus *string*.
>>
>> I followed the first option.
> 
> It is a correct approach. However the block should not be called Iris.
> If I remember correctly, the core is still named Venus.
> 

Indeed. I was wrong in associating this with the driver enabling it, but 
it is much better to tag them to the core. Will keep it as 
qcom,shikra-venus.

Regards,
Vikash

