Return-Path: <linux-media+bounces-67466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SWG1J3fHVGqESwAAu9opvQ
	(envelope-from <linux-media+bounces-67466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:09:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2474A2AE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:09:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NrlkrMvp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i0B1+N5r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67466-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67466-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78A5F3015865
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299A630DECC;
	Mon, 13 Jul 2026 11:09:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A4F380FEE
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 11:09:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940976; cv=none; b=BDCKTBn5HEh06fZMpeVnE/J0YYRfbo4pf5puVhu65sIq3NN0yBxiiwvjWLZYMLZJNDA5VEwEBa4LvNSj0bRd9REvqz8mxRAXHA8e/fmtOX+3jX5uSuwFozsE2CtAgawbQ2qtOH7W6+BMWrz3jCSTs5jPjklV5LzFwF/hj+Idl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940976; c=relaxed/simple;
	bh=oTzHapr0m4GWqMHoVKB+zUrcoOxplD5vE8TgFIaEGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl6BWaibCSBlGDPq97RiR6oO4YL+9XE6kpYPq1zzSdSLEBTk8zh83qUZDioG5Wx4/VbmGvPVW3bRDEbQSYzK63gcmchyIpmSuxFemW+eyxOUf398d0aIXSnT44Mr9OJ+me29nz1TYKJYPr1TNdpPvHRIFbjVY5R7g/gKtbagNHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrlkrMvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0B1+N5r; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M1Gd1090406
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 11:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=; b=NrlkrMvpO4alWrcd
	yYHvTnL+HuWLGPjTsrvCXLnKlx/BNqQ/gPvunnKV+eG+6lfObU9DkW1L6Wg7zNE/
	RPhqNKO2uFB5EUCK786ra8NZdIX9O2Dy2ViOlcCa4X13+Mb//dKSJ18Gp/AxTvVH
	huIu4Ofs2bDIJQt/nYIiyWcz5Ruogsmr7bsfOo25M8WjE1rdGRe0vNWDypeOnhII
	i/WF4o3Y9jvP/SfjLqa4eifRBTRx0/svXojI7KipPhykulkWiQc+TfLMtsnGxoLN
	uOhu1JHXgQTGMZkoObtCgDDMBmiw4oUkfQbppG7kUcgC1vlRtbFXCxWpN+6655e1
	YX21VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrcdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 11:09:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso50863261cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940973; x=1784545773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=i0B1+N5rNqzGbMHy464SQ3zYXrHAg/Iypj+nSeXeDidR0NM9zGxXfD7vOHoKHp2fb+
         j/Xha3kPY2BqBt2PqSO+JXh2rhtCg/0uoW7QgO4k0kTzgfdYVbpDajTz6ocOZ27J9Azw
         XryWWiPgGr7sxiSLIX87BaeDLyX49TTv59UyxeK5N57uDRdXYp0NdaxAKjf3kykvYB4s
         HBBwUMXJ3TcQmC+oA+vxVKw8C4USkW69XowTNuOAHpg4Vsgz1y72Ea0+jk7sr+wMKTPc
         wP3/HV+inhRRunvIaCcoyqbvtar9ZOmYHCCvWrHbDhkYnceEUtVU8C6atHss451GZwN8
         fZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940973; x=1784545773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXlfaTZwrb8382Qn5XcQieyV+sy0vh/kCq17fdwe73s=;
        b=o5gAA/Cugr6hZ4QjfijP/NvwyadYcJCP6TuoA5lIEVFuNhC8aFHs7C1Qsm2VMz5/6z
         Gk8+c1wQwzol4e9T4kZxH4sazG25FWelaxnVn05UEK8Xx4cRPqxbsv45MGICPS+6mj+I
         A1tdyIrKl7AnAs1uVeMjvBAzexCOXbJsmZa6AqFdxGLmLtDTYHo8m5opepJNy8lDLWDi
         VJB6hr6zQ1og31crh6N3lAE/c2MpzJO4qQyLSxPwp/zsiK8GM2ZhAbe2ftov13SrapfE
         rZcuPD4gAhKS1mofb9wh52jzI5FbdWkDO4WIGcviTyo9Vdomo55pXlg3okh58R9zsvJp
         dFvw==
X-Gm-Message-State: AOJu0Yy9smuWv4xOouNH3HQ3AByF0cha5QoiMXHRqORX09XSFYIwjCXN
	LN5ZF7jO9gEmFdonl36PI4CDs/UjaKSQxTgAW4TERNHir34+M+o7XKowB0OdXKjd1CoTJ7krCvT
	rqGwjwHlHC7xt/JbZ6mxU10iTT42Jgk5fr7kZcNFofixFQ3u6pgZh1uSC6hlSTE0WIsIksZM4Bg
	==
X-Gm-Gg: AfdE7cn+UONLQF9QixGJMtYOvfOJLi6hzhhLhIBwaFVksOYbSs7Yxftw5bH/5Tjtpyi
	8+mVSAcHHa/nzKHK6LQXllGu55ni3+LS6FAgAzHOOedPOgd/AC751qnDC9PjOa0xoW0n+hghLeZ
	EvditNo6Fdkid1SA3GMj3y1Jvia5qNEVGj04bT02+C+dH3lj/AK1OF2paQoV/aUFsz+VZ5kUE9K
	l3awdnXczL9QFyiTeqET/YfhEJm/mtR561BPCB8tY3Vs48rm5+ewBlNuaqqnIYifLDm2KK3ZCP3
	BMmP4e/kYgSZIWy75V4gCIcgp2uE7y49k3rl3IX7AbNssb+HULnxrX/FIrZ8VXdnLxFIyQcA2QT
	9D4I8xW8SQyL3u7koQF8wZcjiV+BB+l/kQlKtZvXsztg=
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87093991cf.38.1783940973597;
        Mon, 13 Jul 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:622a:109:b0:51c:10aa:9cd with SMTP id d75a77b69052e-51cbf145dd3mr87093571cf.38.1783940972784;
        Mon, 13 Jul 2026 04:09:32 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8971sm14591344a12.5.2026.07.13.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:09:31 -0700 (PDT)
Message-ID: <5213fe39-0c8e-449d-90db-5488fc4180a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:09:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <akviE-ANATfFPdYZ@monoceros>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <akviE-ANATfFPdYZ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KTO3aFsJG503M3lI4XBl5Ma5oXqBMFeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX8guJvA3qKahy
 2hWM/UIVfDTJc3cHuJ8il5gJS75Ofa8j3asB5e1RUVXXPqjpPquPxNcOkGuzf3e93Iac8qdTXOw
 hbJyTFuqoM805Musoa0DX/mCyryhXCKOiLkZV23ehGCJOIYD5SBfiRaFP73VFGzbUZoNkQ7VJHP
 BOp4NIpJXx1RS8r0XTky9cXzaVF+2WmGF50Qejg61tWdEc7T6wiSIYZ4E460zCeDUOxzyt0jmb9
 QsvZFkDaJ5q2yuir1IVcFH6VXH5PFkbimeui2obbK8vjb7bHwOJGfT9AGXA43Os7NlpbqaKQIfm
 IT4DhtkxJKuKpwiilWpoOkucBGEGrxe4hySogHdnF9LbXOmyNitQG9y4L7GuNXl3ki/U9CQauwL
 JgMCkHR5ofYYNw5r/qMeHzFnLz4mXPq+zy7NeKcrsEACoWYTjcX14ZlniovKZNF+fbsZaCHUlfY
 5WZPwu6AW1uKVTVInoQ==
X-Proofpoint-ORIG-GUID: KTO3aFsJG503M3lI4XBl5Ma5oXqBMFeG
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54c76e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hFMuEfU6_yxUS0q6VWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNiBTYWx0ZWRfX0LJ+FxPNI6C+
 qen5J2mo1/ARhh8X3uUtWar5wRuJMTOQRumxJCphee3/Tm/hbrTwFgNDzyTu/jqHBJDcFnAyNJK
 rNQ+f/o9+27rFuvSYZNvfkS+FUMIsBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67466-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94C2474A2AE

On 7/6/2026 8:13 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
>> +#include <linux/mod_devicetable.h>
> 
> Please don't add new users of this header. Only use the
> <linux/device-id/*.h> that you actually need.
> 
> Best regards
> Uwe

Acknowledged. Will be fixed in v5.

Best regards,
Atanas

