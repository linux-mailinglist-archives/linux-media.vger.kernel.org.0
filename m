Return-Path: <linux-media+bounces-67429-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ByyvFWSYVGomoAMAu9opvQ
	(envelope-from <linux-media+bounces-67429-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:48:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0ED748591
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:48:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ip+vZ/my";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NrlJFv1w;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67429-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67429-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB689305F08F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F743914F0;
	Mon, 13 Jul 2026 07:43:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861138F230
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:43:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928603; cv=none; b=QGILDqwjULX00CDRKoaHtSe/C9F4iKq7B+3w1tSE3F85BJlxa6F7L+gNxVSvNY/XnT5z1vW11w9arVVz4wKUofjwe4r5wnXSHZnS/+6GyQEgftwVKsdV/7hCCzJmwp5EpZySDiwoFnD4hNJRZejYcmMC/+KODuk0eAkdRejN2OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928603; c=relaxed/simple;
	bh=FYd/97fPU/oF6qcbCDo8Ty9ic+TufdwScxpCHOV2wVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AacHFWDE3PRGm4kx39YxHy2A6vf5y0oRlwLaaueRsKkgDcAMKZqzYhLFmD9sPojqKKJ2WiGZOM2X6MqoKYWviRitkGItHiHuVdYLTa+gjpOp2/mzUZBk1SW9wSVStlek6RZEwMqLbwjhRJXFKoDHPhde7A3M4GcgIMav/wtd/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ip+vZ/my; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrlJFv1w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkvG507296
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=; b=ip+vZ/myfGU5dDrM
	rvTPdqcnjndtmqhNEi5MFsQbW93OwcMQUwM6g4CIPpKcPJdt+ZIkjoEFPYmIma4G
	7bHgYLwih97a5mMz7iO2Ez3lG4FKSec+VGWBZ08MdoMOw7SyNsYd9IeWF4p8zAbK
	pZKj748Hpyun7KPB4QLy6YMIX/Hzy4pUpjUSoiU3JrEdpxKbR33wsDKdC+4JUeOn
	pib3Sk1ygg1B9Z4c+S0Wt/Puvt2sJr1VdOpR49tJkbfLqknBnmOwT28xZXN3lzpH
	GLvfq00GE9xKVOU9H9IFRnxqyCYj3g5ym1xzkJC8FDzWdTeSzZsUK2X1KtbWEWNX
	2HDWEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8geca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:43:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec45d9628aso40410526d6.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928600; x=1784533400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=NrlJFv1wA/HLWfKdBFYaqRLNR+zsVhmjulAN8EntBxVmx0G6QQadxOCf5qFXomfZTq
         bd0Hrz/20mbj6nXsZz9J8YBjNoj+RSkI7S9rm6FrTEhvqs2C08gJMNdNJOGqaX0k/ed5
         inyHVQXGzaTE6PgiuX5NzB6/Bpl3/J9gEnrqU+v+ux0FoKy4lvSPIloPN94ENbb+Yc6T
         y7eLAxg7J6TeTMxagHuTTwL/NU7hNM/cnxzHs5vPquKMc0p1CSLTVYakUvqkKgmlGksE
         sFX63/XtsSYp5zQg/rFHQJp/gXvuAnvlGgneoNrOxW8CD9Lgf6spaLGV7DD/7CBoitAL
         Ls1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928600; x=1784533400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkIMpxtm9KAcs5qm0/bFfITc7MYtZUN2s31PC5opEqc=;
        b=rjnXvOPFNQJyr1tpVHLPF1XtVWa/fCS8zYGCBg/1f7vBzPrDDsSUWzl1Le5FvE2/Q9
         2kkyaVOQ16hWY00VumcRxTSlxHo6FdjimioYJIT8i5EDA/xHJWJPcpteJDZ4Dn3n8UYM
         Vn6cVztdD4NyiQwJUqPrL1LFzdAJA78zTylq/1QMQZA6YvmueK5FvtnnSg6RTytdY7bt
         IEjx7bRKth7R//e6Zzx2g86YOlPgGJGmfXkYuWPvFiiVtxJaOMovaFYI3C3yBuAJgckH
         NQ8YXIk7n89YjBXZg4NiTOFqQ74xui3NYcrKEXCaGoRz0asjNexRF2HmJkWkdBjRKb93
         ZbFg==
X-Gm-Message-State: AOJu0YzOn4qEfqwWxSw/lvVL39tanDvHi7VdaoSS32FYti0CLi1ETTdi
	znQnUX22U8yng4btBidWGYDihWeqCEhaDrEP59UuKJDz+uie2vp0j8LfriMh4gY49z7QidYmkua
	moxkM64cm3Cjiwq2lNoC0H5Ll52PMBylSdDZUZLURVWommG7lHVtXNANGur/wtFB2Mg==
X-Gm-Gg: AfdE7ckQrwsYsjBh/AUjk7JBnyWGPMKZDDZIQy15W3/fblczgL9OVQ5fiJ+c7f98Gz7
	Myh9WV/x0e+gL/rwoZqmpN6xHnIoxNlc7HI6pQa6xhAzV5NQZaeyCqStQHQlkCRO/5en5wZmz2k
	tL/elvLTrwNlpNPtDt9khHTasicCQvJBSWTX46hAdxneLT18RHWJP4+71Jo9hRreAdlW/VrvjVn
	3tZBzGgUfkD+EPuK+kn78sbFQ160zxeda3x1ILvpn3P7RcHBJr5Nl/PcQO+iP8Y99MC/1bPaLt+
	htpopApdzbP6jQXVBeOBYIVYFuQzGbG0cdLNNegXUtcOM0ZBLVlYkn+tRZTYxcZVer0UPujVKZ+
	FVjqQvpS/BJuZqNH7uTvz01DDtVo4V6cxer48KSxwq5Y=
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433781cf.72.1783928600119;
        Mon, 13 Jul 2026 00:43:20 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:51c:ff8:cd4c with SMTP id d75a77b69052e-51cbf2ff090mr78433721cf.72.1783928599745;
        Mon, 13 Jul 2026 00:43:19 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad821666sm940679366b.4.2026.07.13.00.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:43:18 -0700 (PDT)
Message-ID: <891bfdcf-f7f2-4f7b-bbb1-25c641926f9a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:43:17 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
 <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260613-fair-ultraviolet-dog-fece5e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oDpWHZTEyKzuX7ws66Hy1gCWbl86_s75
X-Proofpoint-ORIG-GUID: oDpWHZTEyKzuX7ws66Hy1gCWbl86_s75
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a549719 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jQIKpJ-_qqBQciHbE5oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX596HaIq3htdz
 10lZC9rws0N2q+id3qL4P1R9ou7kzq7aFhT1GpWjAsC8V0Mt75O0ndYgAaV3FbaqxmglHxChrN+
 cYpComb4xUbPZsspW+ANhMz/fexDhjQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX3ZtSzWThquCc
 yqyuDzpk5fqpb0C5hUzrNDmsXXmpCVdCGGJNN4uGQa7gewc9JNwREYOA4qQY8A+l4hcAZg/8SjI
 7khXjnCsE+aVlxazoPyzcHoyE7uLBk38osQsQCSmaE4Z4zrC61kU0pjKsx+HOlNR/Y/rjyJSDge
 ZeTGSn5itst8yawRw+LdZrbxYx4kyvG2v0TXeKginL5NaBtr+2WBw+ZAGQxhsQoUFSYgvQ0gB08
 gJXCDrX5RoSHKfJQJzDGTekhSJNixsebdh/6MBAzWqw8m5OFxRMmCJnVv8pixhVub1HxmOj9h1V
 2qqHNU7nEuz5Si9wUlldDFfPqPLJUBPSRw6w1yehmw2v2WALrt+DCZ8jSg/m2fmKJKdpFK1s7q+
 MNBPGreRUB8+nDrd3a//3YmxJUcufPgvqX+5T72D93FBOZwbOKMCAYPVfyzffv2YwrjfV3DfuGT
 h95Zmn30x+7v179ht8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67429-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB0ED748591

On 6/13/2026 9:42 PM, Krzysztof Kozlowski wrote:
> On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the standalone Qualcomm JPEG encoder
>> hardware block (separate from CAMSS media pipelines).
>>
>> Document required resources briefly and scope initial support to
>> currently used compatibles in this series, including SM8250,
>> QCM6490, and SM8550 class platforms.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
> 
> You already sent v1 and you received review. Quite a lot of comments.
> 
> Please do not send duplicated work, but address the feedback.
> 
> Then version your patches correctly, so the toolset will work. Sending
> duplicated work is not making the review easy.  I am dropping this from
> DT patchwork.
> 
> Best regards,
> Krzysztof
> 
Acknowledged. That submission was a mistake — it should not have been
sent. v5 addresses all outstanding comments. Apologies for the noise.
Atanas

