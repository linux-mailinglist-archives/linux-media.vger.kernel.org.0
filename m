Return-Path: <linux-media+bounces-67431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3iqC2yaVGqYoAMAu9opvQ
	(envelope-from <linux-media+bounces-67431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:57:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A03DC7486FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UTq3nK44;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cFTWfXOi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67431-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67431-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FD92302D30A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C6C395AD3;
	Mon, 13 Jul 2026 07:52:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D1395AD0
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929178; cv=none; b=V/3t85G5ssZeIQB2JfBdND/5469TiLZ9UXm4BCOO5XMUsK/KhCxKS2t/lHi3CyDPr55QEwRzklF8d1KZuWmwSmc5LibyJPMi0kaZkkNF/JRRDKv+nHOORnQAw9wyIZGxLYRsYcr5gIpk8AOI7fz5Qpr8q0sBW3I1J+7Qp4pl9ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929178; c=relaxed/simple;
	bh=33h9TgXtBd68jPl2HkwHza+nUO8E2LiJsacvUz/rfuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiW9n24NoXbw6qStEXz8ClZDRusrgXBp3j234ANqvXr/M9Xv1kWvDeujVaRmXLB4BJj69ZVy4ZBOym/DWcWVUdzwezSoh1UNt0bc8VIncgrZRMZoKxOjOy/V8JO9F8MBNdwvolgl3YAlu+78mYleBdsXdKyhe2nr14DjQoYqgGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTq3nK44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFTWfXOi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NdOL469194
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=; b=UTq3nK44NefQGw0C
	eTjdguAOkpJ03yKLwIvaUADv2JPy7/pSOkt0D+whIZ3xUgQvVEw8E9FV7ZL7nPHb
	BRbo0b1dQhLH+P5W6W6CoV3kzB8bvdEjmASiaoj01l3iXP2yXkJVn0AJyH6tdVCb
	16MjSnYosw6TD67KRF5Jh8sAScgp7jWjcN1KDz9uGIeCgd5+sCk4ZrkK3DXKHC6X
	7xAUUbHyyPv24OauqKEAaOYU5BTqGs6M/fkO955KOvo4daiEKiiHOcB9I4vQ+eZk
	z1pkQEzxcCTJ5qzILQG0wGhGy2xaNFg/0mpPyx2qcS5F33Y08nWSOJ1TCw+qUCH2
	VYkSKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf4851mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:52:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so28601361cf.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929175; x=1784533975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=;
        b=cFTWfXOi4bzt8CtsuUJZKP6mjSouuZONMO3AWgX7jWj/9rSqKuafS5ZgD6MKnMTJGj
         tLL1msqP+39e6HI5Zwv66AconERk/r/u9PekBphqeZXeBnEucrBDo1GqUr2Z/qu5seBP
         gAqKlRseHoKtEgeb7gjBfjssL/d6u9slArq79xrQ86qXymvcl/LMA5AoMfc6kOl1wuMP
         GuiINFmGHwfrz3hkL0yozucJHTNHV1TLbYjd3w7mwLn2/Z/4ir6srnok2eN51eLjAwYZ
         q4olmcaHaspMqsM6tMcvym2dFkmcqInuOQNjv937TXDiC30P8MDV0Ct6oVyA69wROdV9
         GEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929175; x=1784533975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLbH1VkbJCXGoSZ+uSVdMOzYeAY15F1YaTx2sQeEbys=;
        b=ibcfcYDrrjp8aK1Vnt8PzZDEbPxZrQUCYJSNPlJLmuaYwfZ3n29FPkp2Ejp80zG8JQ
         a6/9ALH45b/nJjkcsoW7FOItYQbB2ZgFfB9lmpG66MtrwQRDhkkcfCdqnj+46tw+G7Nn
         bYTqStaQNx72CXPnBwtD2FcYlnuYpa/Vv1YfEHXD9iCDZ+s3JE0GiKLTrTNJL0wXDxGg
         0PPe0Ewt/88/73Y9DKPeYhLccwqI2DIraCfOHzU2FZlbv5wHPSOvTssAHB80bqF4fvXN
         ZEzE2cAJ6XDHDK7a9lk3rV89hS/ovz5eX1ds96lPJokcGF8GTi3175xkINYSJKzHezjW
         xLGg==
X-Forwarded-Encrypted: i=1; AHgh+RooMk4eCFf78a0GOp50A5sj1bwX5R6YTE/rfAxy6KHq0ZPlhIOoaeqHd4QJP92XGpUc173cOqJUp71oFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxU8vTcjnNHo55ujk/0Z8OD3vNx9AuMkpOMuVCYF+dfGuG53lB
	k0i2/NllzfUyxbLJAv1OptBjDRl6WhW+r00FHIsHswhedFDMQsIw3qROVMgAPuva66u69BRGrO5
	OyC08/nEW2xkOBBVl8RPNBRy6R57Ys+r+s0p9NEBl9xngXGm/d9rH3QynLpRvxYcb/B0lfZGq5w
	==
X-Gm-Gg: AfdE7cnTcCPJAzMZNNYOlTCADAdgYN7AsUlZ8mSEz0vYjon017fFQ6aXRg/kTBmFBj6
	Bf/syc1GnuOfcg8ac0+bsEqVP4l3k4CVPSTiICqQRg5mSSMcvRudJRqQaOV6H7yX5hFm+tiWcKz
	Y/oJy16VUiFWO4EnAnXU8XBFkXxCkv1FGrhTmOpRj6/2lzhBy538Md1AReriaH+KZBYanM4wm8f
	oBuQNjSgM+vabQwBYhlBl5Xe1tHMgDtl3nWmUfueSrvJZ0UEqcS4Tw3a6rcOExAYRiBj+rzr83q
	d6aoHNoUrCg10sA8qC4Ai4c6sehdlCAR/rNvzmL4S4fsliokAfMG6TIWW4+Yy5JA3HwivWrdFVs
	g7fiTFmkny4I/Mu8nhojnTfrpf8jeKzoLRPcTf7eD6AQ=
X-Received: by 2002:ac8:5f0a:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-51cbf1ecad3mr81897711cf.28.1783929175152;
        Mon, 13 Jul 2026 00:52:55 -0700 (PDT)
X-Received: by 2002:ac8:5f0a:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-51cbf1ecad3mr81897541cf.28.1783929174774;
        Mon, 13 Jul 2026 00:52:54 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb488desm960961466b.63.2026.07.13.00.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:52:54 -0700 (PDT)
Message-ID: <9da6be10-cec7-4582-b259-97fd4b9f7997@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:52:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG
 V4L2 mem2mem encoder.
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <364a79bf-e424-4237-ab13-18e38299ecec@oss.qualcomm.com>
 <c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <c9006b67-aa43-41d3-8b13-f20dd2e544c6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX1TKR/RU4+N3s
 0oW/ekOfVJ57gE/Uwjc4YHQuymyV4fXsW9XXbshgTDd4fwDr4rfQ2rMNJvih7ChcohN2McCgN/I
 66Pj2sHy58yIfZOy08oA4Vfpgu8qhq0=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a549958 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k8JpAAtuEXT-_s9VV8sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MCBTYWx0ZWRfX/DsNZD4iEL6h
 SYFDBhZTSVFiASx1wkriizbxRz9ShvL6uQFZgX4ayXikM7eD4rMwYS5KKMTvdxflCIdqa+WRk3+
 tvnYjNiMs0uR7cNgaUesSDpCK7FrtK8jIMnaTDVdZVzucJO5BGRCrRN+I2onfQaKqKE5NPRlkgz
 shKJrdfvKFNd8pl/BmiPr8SYsR9hmkQxhtaOV2Wu5E2WFfmP4qTv6kCKzH5oTAJpRzXEZ0Gpc0N
 /tTJocGczfAJt2b7VeuTqHRSaeaP4dms0s3ZpFNLND95BA3oQabJlDztbopZLrNKP/0sVyPkiKA
 puftzZQj2Fzi15KddTCDR4SlUtC355ERjTX7K4YPqfju+Wc/NNckvZLtytAL5gCmj1JlWiN5oNB
 2HHzGeQti5zNxoVhTTK6OuQ0DYtO338UqyaZvchxyTcu7Uzf6na4Bk+Ch8xJOw9VhrD2yrpJAIo
 gaICOPhuXFbhms3hdug==
X-Proofpoint-GUID: 8ZpTuj1LhSPsQfrUeuvLbnmLOs7AhAUu
X-Proofpoint-ORIG-GUID: 8ZpTuj1LhSPsQfrUeuvLbnmLOs7AhAUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67431-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A03DC7486FF

On 6/25/2026 4:53 PM, Krzysztof Kozlowski wrote:
> On 25/06/2026 15:43, Atanas Filipov wrote:
>> On 6/12/2026 10:44 PM, Atanas Filipov wrote:
>>>    19 files changed, 5067 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>>>    create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
>>>
>>>
>>> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
>>
>> Hi all,
>>
>> Thank you for the review. v2 has been sent and addresses all comments:
>>
>> https://lore.kernel.org/linux-media/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/T/#t
>>
> 
> Problem is that is not true. You did not address all comments. You did
> not reply to them and you did not implement them. I just checked FIRST
> comment and stopped there.
> 
> Best regards,
> Krzysztof
You are correct, I apologize. v2 was sent prematurely without properly
addressing your feedback. Per-comment responses have been sent inline
to your v1 comments. v5 will address all remaining items.

Best regards,
Atanas

