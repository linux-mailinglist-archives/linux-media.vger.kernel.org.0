Return-Path: <linux-media+bounces-60657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLzjADhs+2miawMAu9opvQ
	(envelope-from <linux-media+bounces-60657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:28:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035A4DE1B9
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D59A300A11B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BB33EDABA;
	Wed,  6 May 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+4PBVCj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXIWUcjo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC263ED107
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084907; cv=none; b=VyX7VY6jQnLDY9/ASS9xgQC/9W04bfBV/r55SW77tpyl0Ls56WXiF+/E6guiwi1+fgDPzpKVKXB4WYimqTqYx2MsI0bm/g58a4CpPCzXIi7caBaWdkcDpp8cHdv254IkUQcxOABb8bvuUrrnJh4L+0B+AScJ/o+2TdBbriQM78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084907; c=relaxed/simple;
	bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFDD0qb98lLL2swOs9Nh5XrIPbBuyCIh+LK/F+NDFlqeOMG55CIwz0J0JmiXCD0YzU3MS8rgn6YI9DllPN0eFYNSZmD8e9BxqcUQR81kJ5DkLS+QCaTtqipCtDmmn1jMbLjZmBsJF+vWMthR1C1yMvsRljDWTsPPZ8d/pfYUlNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+4PBVCj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXIWUcjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646BQHYG2581357
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 16:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=; b=m+4PBVCjRBUt8x9Y
	1V4nTnB8Xt8sh0FUCkGcY6iMdibhGGM6ZCSfLGsXjpgwBpzNbBJqfigCaWNSfgA7
	fkdoh+95AtuqpBEhTd4EwB7rt0ZSCnDVfYLZZynMPrtVmBJ/T/4FbcTnyMONpYnc
	+cEoGx1eBHT7GJKL402X4JQZBh5EQbW8kUGja2razBFLZB6Rq+ukNtNi6hgH29Df
	8Ug154SyyiHoBpX2pDqdVJlyBC1pVPJdANWUFRjVzVSXtnGhabx8y7im4iDrkjHr
	es8/Uq90zcIswIcITlJGHHgJ5P/92WUd/S+EJT/Zq+X/JC5QwcAG1uOBmgvwWdMY
	6x0MhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyyvw2ft4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 16:28:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d83e7461so120821915ad.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778084904; x=1778689704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
        b=TXIWUcjoe4geql5Ai417M/q/XK+yCH9Brllg6CiYIi4BFM89EJ+YzUuiSRRxqctTS0
         vwIfbTDaXvT/84wLp/EqADvKPXUxYXTecgvpD3iR8fmN3+0BESOh/CRrN/88/pLf/gsg
         swemlmejF74r1Yo5hhsXfnPmks2+g7ztjcKZ4oDNH0vysp52BIVrZA1K2kZ/orPi/7sJ
         MADndAQCS39fPlDk7opAd3Pd+GvlccB1HfELfI16lt8+5cAsJU0IQkFU8s39g2LjOj32
         GSWTYRdx0HymVmp8X2zrMRbqQXCwJYxRz2fAaCbziRCl28bXtBDVI7ieVFMF19MaTKEr
         MOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084904; x=1778689704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYVtzd/xc7fLQtZMy6ElulTvtzvDpcvThePe9t+u1iU=;
        b=rSMoZx3dedPG9451edN/wlSf3k2SUNofxp2gAXEbExgkjMALo2b9qP4iS/+zepDFHc
         R8W9Lzjn/CjE75UAJMQkekS06LZUQoD5EMPoMt0BR5Xw5FwIl3+sMq/r/CQJ7st9TQQK
         T4w6kv7m3ZnnMlb1V1WRYtGAQBjgKeNNk97oWjJp4JUjJlFDgXP41dN+OFhUreJbzhGP
         8hOYrlbEK1Eoda20G/0nteFGrTWUk3Bu+5MOVgMvmz1AqR7pRS0Njulab27BV12YR4Th
         NbXVYcom/swKzGbmYSdyC3Eda9bpAEXII9gNYYMeP9jZli0+AONjSn/F9tUmaAOrPF7o
         XdKg==
X-Forwarded-Encrypted: i=1; AFNElJ9W8lSOJ9IrqA4xoEGZqCfVHiaGiwwU4f7tlsfzvvR60pxPc6tKUynnv96QnjLiFuWKlnwZParJrBfftQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzcAb5LTlrLUjCQCLMC2V6VPFWqORJHP96xCPiqZd2PNze5nL
	MNtS98nDqaqwEf1d/ryt9HBqUiKnlb8qq9LverOSg36V/r9SH32Zrs238U6XT8VPi6gKHtkpSwY
	4KXW+PAiJLY3bF5eesyMISaAfXolB3FtkQMVc1Q4GvkaDauBIedweDwNOqO7H04EPNQ==
X-Gm-Gg: AeBDietAJlJszrDcTNBJFUX9kIY/Fqveoec/6utoeLn9hVbke3W0CvYkE0HaX17SpSJ
	z94m+CiagKmypjINwqfOc5C4LhSzq+l0/V466q+6mYs2BZyQJpTt5WDq7jbJ4//JYLoUKDMWx5T
	iE5HF0fkuR/Y6532mPbrnwY5ifTv0umI3gR5m/5d6M2AM3s/PtAuQQcjG9qeaRhmqXOWUKi54Nh
	uXrJ/tj5pXLKQ4NBJeeTr3G3Lmnm35TW3/F/1QL+/kXoZeU/jpZiGutg1nmTioZ4L/OMkjPA+7t
	H8swSOibG/dvmas1jz4wUjUjvPWjpO/jp09HXAwWTKAbhpgXp24rFkWmReETNhZZqaZjrMDuE0b
	NZzpzG3jsX1cEF8d5s+CE9qBUCzOxu7dc+EvpK/0ZqicOY7zhzw4BPjcvBdTKxcMg
X-Received: by 2002:a17:902:ebc3:b0:2b2:3eec:c75f with SMTP id d9443c01a7336-2ba798a9396mr43247035ad.28.1778084904332;
        Wed, 06 May 2026 09:28:24 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2b2:3eec:c75f with SMTP id d9443c01a7336-2ba798a9396mr43246545ad.28.1778084903722;
        Wed, 06 May 2026 09:28:23 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca106e8sm32048405ad.62.2026.05.06.09.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:28:23 -0700 (PDT)
Message-ID: <bb008913-1100-9b8a-c7f5-1194df33eea8@oss.qualcomm.com>
Date: Wed, 6 May 2026 21:58:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
 <20260506-inquisitive-wondrous-lori-a9e639@quoll>
 <455376f9-48c2-e663-3be3-fd310afb7f7f@oss.qualcomm.com>
 <333ba4cd-8168-41f1-afdc-348f99ed0611@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <333ba4cd-8168-41f1-afdc-348f99ed0611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYCNIQRf c=1 sm=1 tr=0 ts=69fb6c29 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ao3bqe3Qqjuf2QKdZGMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2MCBTYWx0ZWRfXwrpZ6pppKMtt
 33EPFmQcP9k44lzf7inIA/pNTkag315jbETX+6iLXBhLbKpTOv4E40eKIEr9Sg9lSd5/0B281Ks
 rfoMdwE6cUdKvY3Z3u6Z5HjUV1s2seyujBLR3FwtLHkDyRdDYLh0P/iOTDkhHJ7+1ujlzbis463
 0e6V5Rr+v3sjtzrXi52u4UjAFoimAklxnqR/3Ff9+BkWRYp8Wjo7tUibeeZT34/DEl6pV/hsK9D
 NJWhpAKlwZBmEj08caeKdVOP7zn7a5wDscK7ipXOQtQ2RT1SyVopyYwIew/HMW27xFKomepbZ+o
 uGOOV3VmXWaHsc6fEltVNZ3nzyiWDhZ1EHOlqIOEKt/vtQ+Tnig4EuGH2S13JPIf4MpEAjWbm9n
 5t+qACbHqdJ8gfodB4G7l4sJlTiTElmtRqINHJUOBWt3GMDwcZoCQzlN4PBuYZyIzPPglbEMPnv
 dYYgprBKiUGtJjUqOfQ==
X-Proofpoint-ORIG-GUID: kin0qFAtfQg-2rq6GEwxoEXLeXLbHvYt
X-Proofpoint-GUID: kin0qFAtfQg-2rq6GEwxoEXLeXLbHvYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060160
X-Rspamd-Queue-Id: 7035A4DE1B9
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60657-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/6/2026 6:39 PM, Krzysztof Kozlowski wrote:
> On 06/05/2026 11:32, Vishnu Reddy wrote:
>> On 5/6/2026 12:11 PM, Krzysztof Kozlowski wrote:
>>> On Tue, May 05, 2026 at 12:29:23PM +0530, Vishnu Reddy wrote:
>>>> The common schema defines minItems and maxItems for clocks, power-domains,
>>>> and iommus. This suggests that the number of these resources can vary,
>>>> while in reality they are fixed constraints per platform.
>>> OK, that's interesting approach. I am fine with it, but then you need to
>>> remove these from "required:" list as well, because requiring properties
>>> which are not defined here is not the most readable.
>> Ack, I will remove them from "required:" in the next revision.
>>
>>> I still do not understand though why you cannot just grow the properties
>>> here. The point of this schema is to define common set for range of
>>> devices, because all of these devices are supposed to be veri similar.
>> If a new platform schema uses this common schema but does not explicitly
>> re-declare clocks or power-domains, it will inherit minItems and maxItems
> But new platform MUST define them, because each platform has both clocks
> and power domains.
>
>> range from the common schema. This gives the false impression that the
>> resource count is flexible for that platform, when in reality it should
>> be a fixed constraints.
>>
>> If a new platform requires more resources than the current maxItems (e.g.,
>> Glymur due to its dual vcodec core design), we need to keep bumping maxItems
>> in the common schema every time a new platform exceeds the previous limit.
>> That makes the common schema a moving target driven by platform specific.
> That's pretty expected, I don't see a problem in that.

I am fine with increasing maxItems in the common schema. I can set it to a
reasonable value (for example, up to 20) so that it accommodates future
platforms without frequent changes. Anyway, each platform schema must define
fixed constraints, since clocks and power-domains are mandatory per platform.

At the same time, I am also fine with the alternative approach of removing
these properties from the common schema entirely, since the fixed constraints
are already defined in each platform schema.

I'm fine with both approaches.
Could you please let me know which one you would prefer going forward?

Thanks,
Vishnu Reddy

> Best regards,
> Krzysztof

