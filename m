Return-Path: <linux-media+bounces-63753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lp2OOPcgIWqt/QAAu9opvQ
	(envelope-from <linux-media+bounces-63753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:53:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39963D5E5
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:53:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UsvTztIu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NrJ+I78t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63753-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63753-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99C253064859
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4463DA5D6;
	Thu,  4 Jun 2026 06:52:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207203CF048
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555943; cv=none; b=OwhiLT/IwXcwAY1ui4ZQdtj4Fa+Bd9Trek2wmfLeR9x4xV96MONwCDmib9QuL+F8kWSLKiQbBFtIRNyV50pZ4z2QlKyVN4sO/b24J4+4FU3GC6uAtIGoXiOMQsl0dJ52ylkMPyeE2TQPpBvfmjY3yG1RAvWgfeKvC6fwX1Qr7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555943; c=relaxed/simple;
	bh=GY9HWYcYN2vZxgT/IMPbqLYpuIufDKnKhahxeGgORFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9QTFuXxAvtFXWRNxJVYj85PDyIQBAWWJLGawHvgwk9KuspU8m5oMROROcUADbjPiL2wsUiYbQo5hPI5Oy1417+6EQWa3Yl7T7yI6BTqqK4/+FmdA/APzdkKrVu6CWcbRxVh6FpU6GRrhlYEmlioykCwaL+CxFI0Qb0YktuG62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsvTztIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrJ+I78t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546mrJY1476762
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=; b=UsvTztIukAjLYmBe
	JIt0gPAqHJgHNuaWhw07hXE6Yj0D0umA+iNeSyjT8pdpP99BdENsPRlLPNm9fjBM
	CCz8+7MuuUsT9z4V1D0wyXO00okNExyq1lJn3s7p7AoegTBharldE8s8kvu3dH1Z
	YreOzaJ3q4BPRyjwfjKdiPnRxxx5zbuuZ/kdey0z9vbJ5hrwLrSzFl3lGPCxfz2O
	CJ2+iw8jW4iaHMFMTGHMncjzecjEjTnY4de5A7EwFXn9qSsIHeuoO1/2e0XeTp16
	J3ilqimm6Tce1w0yMDxOVlWZtajLxhKAvZdc1SHWrLfk3jqt+7jJ7ipxAMtwDVob
	MlNeTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nudkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:52:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51768072950so4851171cf.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555940; x=1781160740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=NrJ+I78tXCpJGH2tMKNgZ2cFm/JSTI8dliXPJTX+hhbMS6MOCyrRD9AHqLhL3n+MAh
         0E0VcRIGzlI9zxhn5m5VOww+Eu3R5sQuN70R3uQJoJ+04aiN4DGMfGnHhKAx2FGNfkyb
         Fl5H0Mf9W+DCF57phVPheMjN5NkAdQTnCnRL4tHv2uIyzb/XPOKUvwUR3cc1wKImw3A9
         GBRV931s5wwAdOHlDNmR7dxlax5LuegmZnKRQ1fTB/l8cyXL2zNGvjAZnZj6fIvpj1hU
         kcdWOCq5yFQtnFE6fapsJYcR2jxychFxWMD8s0PkSqnJ6EsQ9phiMUta5UcIaSKECYe/
         2bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555940; x=1781160740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QH3Q7a4QvIm0LvJnWjiUGy2awEMq59GNhr6w+819oZw=;
        b=B7Gu0J5BdkVA6uzAHiBW3os+McfnG3hdKrJPU8/t3xfZHan78unRfJ6Z6F/glIjT8g
         yk/fS+GH4CmY0kzQpIVfAiPbetSvV+FtdlR1o3dZEuRBDTJeZ01u+vhJWr9ps2ChEH2a
         XuD0i3DqcJxH46HAX4Wgwe1E9GxKYaRBviIkSmZ5iuQFJBKoNf7k7RsQabiSHcE6qGW1
         wPHf4aj3M7vnTBeEzkY6mPx7iQlMg9rtjO0O7hIYLX/eSuRfRGa9+MlwFzXc/dh+XN7o
         OYK2/DfXy7/ZK41Ztd/1016iE+e94BN2diJsR8pgkGTYn2AVGJGmUQPyqM2kVgI8cq9e
         08fg==
X-Forwarded-Encrypted: i=1; AFNElJ8zi/8aNcP/rLpPyyaeSutEIwRuPdvzE1H+JIwXwT3Qk6uj/p8evLYqrUJCkbK7jWv8Wef5gJQGMf2CMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLlrqpbCaM1yXNW54IBt3uFz+7o4BZvW/dTBpVBJrDBybrQUT
	CUwhgFu2euR9RhOEbw3gCwhx82TxZ8zf5fdoi8wcC9EGxjwJ0CJwlJSOSKnuwJV/14v+EosYqaD
	38fvAP+SrRfdDCTnVFTVog70X/a2+Kyl4i4k/um4VLscmlcjDQaqL7ggZzIyrTvgRaQ==
X-Gm-Gg: Acq92OEtWGqfqJp26MWxn7Fq2qs8zcvdHtcHR4qMo61C2hBLH/UQf2qK5+Z2hiOf90e
	O6shW8GLFUJNpKLoBddsG5Z2tSFPUUqvvL/+8YXoq5KSP6uG4X7ZtndqAgmPljZa6L88MbS70ux
	XAcxPHA6ifnX9kRSc/4kwty3wPN3pYF0AwyuTRKChisWOfG7s1qT57spCtUAdOscSAQhEtZle1Y
	pf2fCK/0jCyGVqa5kBLqeRtyXx2J1/6O4Z+jq+H3CWQrKAuEEThHdXE89WKGjZZmKwExi/7/WSj
	GCgk01SuzyQkRPHEsehtxMhv+fT7+URSf1DP+TLV8o8KF6CiQ6d9RTgiY0tEMbYMa/v0rsVm95i
	P2mNV9qAnmmEXByeUOhqi1/ishbtwBVeGulRmjGHw5B2GXi2CkxiViTm1H+Gay1tQdWo=
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866501cf.16.1780555940306;
        Wed, 03 Jun 2026 23:52:20 -0700 (PDT)
X-Received: by 2002:a05:622a:d0a:b0:517:85d7:f5cc with SMTP id d75a77b69052e-51785d7f8acmr41866271cf.16.1780555939874;
        Wed, 03 Jun 2026 23:52:19 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e06dddsm262483066b.36.2026.06.03.23.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:52:18 -0700 (PDT)
Message-ID: <9d0224f0-efb7-4bc2-8f09-70a9b4d62810@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:22:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] media: iris: Add support for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <kunwuij4ntmh2hwxdrfwlpiza7kbcwtdlty2cai3xlxybkn2er@7wmo5irzum44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WjT22e9JU74N89sFPMcO4dXwR53kcc5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NSBTYWx0ZWRfX6HUvaGscmqLA
 IjHVVISiNQWpEZP9sdz9iq+5Uk3CORwQhRJo0pnTsXr7GGhCJgE4ARx2HDmoSZO2H4KA5P1X4Oo
 Cl3MNUo3V0O04a15/gwftPv58BBrTvpsEX10Q48Fm1jVHv+2RGYV422g9RtFr1/bwtiTeeD4Vmj
 ljvJt1O1E7LavXmAzvFLJx9TM9VmI2Wh4nzn8dTRQ+dnhbpqzG43VJ4dUJtGOPfezNy+JhGRV6J
 SVnIrD6xwTZoccANfgWjTCBb2r9jiss0QQzx6PQkptf2zc1fdyUd9asJMFMb2kBZr1Le01hxQyA
 DAMhVedOEJGflN0JxO+NQ7Qp0Fm7T5J0ZFfhFtXEhCsc7oqXXPvcLPObKqbSZMgNCyIHPGtoqwH
 XS3xheSb4bupjftrAV5XAik36RU6up7vpAPMqU4U+9gNRFzpTbITc3cOdGUy5RaQD8cINfY/rtN
 XXGkwzsCeLWQt/gMV5g==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a2120a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=MmbEFYbivRMSk88UmGwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WjT22e9JU74N89sFPMcO4dXwR53kcc5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-63753-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:stable@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE39963D5E5

Hi Robin, Will,

On 5/28/2026 4:24 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:15PM +0530, Vishnu Reddy wrote:
>> Glymur is a new generation video codec that supports dual hardware cores
>> along with additional power domains and clocks.
>>
>> This series adds platform specific support in the iris driver to handle
>> the extra cores, power domains, and clock requirements introduced by
>> glymur. Add support for firmware loading through context bank firmware
>> device.
>>
>> Dependencies and merge strategy:
>>
>> Patch[1-2]: IOMMU maintainer need to apply and provide an immutable tag
>> which can merged into media tree.
> 
> [...]
> 
>> Vikash Garodia (2):
>>        media: iris: Add iris vpu bus support
>>        iommu: Add iris-vpu-bus to iommu_buses
>>
> 
> Robin, Will, do we stand a chance of getting these two patches in 7.2?
> Or should we use some other approach?
> 

Could you please comment if the patches are good to go or any 
suggestions you have ?

Regards,
Vikash


