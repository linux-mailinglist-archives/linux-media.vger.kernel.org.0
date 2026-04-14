Return-Path: <linux-media+bounces-58715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GqjHVT83WkRmAkAu9opvQ
	(envelope-from <linux-media+bounces-58715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:35:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BAA3F7658
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0293303A922
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE243B38BA;
	Tue, 14 Apr 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIjtoJj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTctfiPt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775B3B27C5
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155554; cv=none; b=sBdDr/n3lAtjc2oSK/3UbOT1Mnta70yySd1UWzv943PGpxhdgiGSy6qXyp6BoxEvTHZH/7MTyMXjOjOlTIjT0cMpE9PZ2lNaYkvNh1VfhwSE+kD4bIFdjUgnweUFBXEkNAl8MJ3+eHDz/xuxvIHHzt9T8npGuTp8Fj8rgtG5Uls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155554; c=relaxed/simple;
	bh=oOScpENHzavLOWGVgafokoO2WeuQKSvCI7PDd6PCPyU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G3YakHAmEphb5dcCveZVO6kX6FyJnhvYU6Vi0d3yjSbyKbBFF/o6NvTMoEwM7wdSl2uOnDqvahoOwotdunfZlYzy1hpSyLMrpECbdvBbqEozQyKnk/Hv+Xr8WvxJXGO/3buwYY/vyy48x+y43U1WrJjPDSLDLTx28J9U6r5TBow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIjtoJj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTctfiPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6lxPA1478949
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=; b=pIjtoJj1Fwnf+CAb
	tjyCnKqkkQK3j/wsy7OKpGK6r4u6O14gyifM+LskH48V3hehqrF817ckWM4/ARWE
	xh1dKTX8b1KIWZzjNg5owyHPRZNe9DLtvaXE1Iaxf+8YJzAONMUDzYSlrJ8iEazM
	XfA4qsacvH611y3joEIhaomNMwy2TbnqPJXXe+/bs3V/q6jA+UlPJqLiO9KMWKiW
	NfSLNDRmT/7qQKUFnWoicPeqOCk9QhWi0kwXumf/peGux7T33ZaIvTNNHFvgI3s1
	eZBAQ87Wucwvm4DUcdHSUTZBXrg4/V4Hk/Z+Xc8Rtpt1Afvmkpygpep2lYilq8ZV
	ta6JVQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j1t83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 08:32:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82ce34a78edso5424679b3a.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776155552; x=1776760352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=;
        b=WTctfiPt1gpRqGKRpcTHX1vpH/P1DCSkomP2hhiE27QR27NTYzmCL4kmcIwbLK/dYb
         c+Ci6BQvuQ03u6OpUIgiVD2tc+Tb6pLfU/VcRpKca78ptlFlwlYmp2BiXn0cwYPKxyFH
         l8DltAvoVTz1lcSkmHeUr+i0NHtGk6og6AEU6eWfPKStiNqDTBtzGy9Omb0g+lrk6ry5
         CahOQsrpmc3ccK1pvjAb67KFvUlSmCfChiXZdXpx59DRoGJikLAj9qatxmu4kNCUVoc5
         EIIMCu6laGDuiLG7RLMkHDd4KeLGve/1rYOCGmnuiABq3i0R9aY21Zq0E4z9Shze8LTb
         WZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155552; x=1776760352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEIeYgZn/55wFznsq6tgBfUJhO0jP3QkGZsmt7PhTzs=;
        b=pn7FAuJ4NklW4j5c8VHqby+wF2v8m5N4zB29bgSugctahtdj2/LI2R2SH6yPgDpCQU
         V7tiwSWo0Z5O94eRy+q16lOXaou52XXLvYwb04Z3iiOY4HeEjNiaxMYjGY6eUTZEQA6T
         fJicDW17rBRssLlL70YgoFOq7IXfaX68mMIuttLqLbE4G36I8i2RAlWrK9sXbMEFM0Tp
         4n+pc9gipr8tr3XDjUOLV3dtLYvIFU45tMbdenVbY1IrI3fys3dBw7l6LpqwgaJ1b3ro
         w1F5WLf5exniniHb1Nwek8+TYEay+ygdGNxHg+a7o/+gHP45531Rs6v0/m3OOnggWlsO
         6RKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Qn2axYTjtTwxq1a/UngCceK170fvFIUYvr0UNEShfJmUs8gRHxdRlU2IXomWxibv8/+LDb/imMJ0eTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywto62DxueCCV1hQ+saYISgphSGheNMzx0Bf06DclxbeSkTb4gJ
	xag6vDq9OzNWjqOQBy8c9xonweiBzh5kzwbklyDP4sj1U1hNQDESwqy4Zfm8hjkz3EpTgP/YqKM
	CojIMDTKUC0bkU7O9FxEwE4eTTeXGxGk0GTsWjkuxmZsht6C67VhjUGYWGC6tzvtm0g==
X-Gm-Gg: AeBDiesXVk0B/5hynqwecqwdMTFBg2eyktYm8X4AohZ3K6UI7Eq7NKYwPa6ADtri7tO
	Wnar68K7T8j1PhJYL8KmaE1hwN6cBxB4Z1+wUp8RoNd43Yn5dH5VKNufX1x327X5kB3P3sqoPHp
	o1NmOwE7hohBSFMiVIC3rPpYqQKxXxtJgM/ZGRKY4ghv6C6YUGrvnr1la1/zvtIKh2HUSgk0aTs
	aCdkKo7/2kEokdUqkBYID5jqVPg6UepCWA9Nl1QvJSuP9uDKztCEpghe1a1vT+MXidKAc+7sYK5
	QTDJ6qiajeCpF7ZbOEgKr5oiKJbNS4bRM7cwUVIsnAIOkT2k4M65tJAmCM6Fa6Fd7J9vLj24WYn
	nD/eMspXdC1ngke2pXxMNRA6wS3hILFKVkDp/C9Fo/H8Ca3DuATFjibWBf48EJ5YZFuq0oPWzAY
	h3pp2b8SR/KOT7s/Hm1ftIkNo5jQ==
X-Received: by 2002:a05:6a00:8c83:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f1b50e2d6mr9600307b3a.18.1776155552019;
        Tue, 14 Apr 2026 01:32:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c83:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f1b50e2d6mr9600284b3a.18.1776155551545;
        Tue, 14 Apr 2026 01:32:31 -0700 (PDT)
Received: from [10.249.17.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c311a06sm15356803b3a.10.2026.04.14.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:32:30 -0700 (PDT)
Message-ID: <fde95cef-e704-4fa1-a8c9-4047488cd9a5@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:32:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
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
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <20260402-lurking-tested-marmoset-f315b4@quoll>
 <9bd4e289-9cf1-4502-baa5-d85cf6e07df1@oss.qualcomm.com>
 <fc1a1d5d-7802-4584-87af-db7ba7343b85@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <fc1a1d5d-7802-4584-87af-db7ba7343b85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hs66KQ_0syi0gRgm-hCB9nAE_RJeKyF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3OSBTYWx0ZWRfXwy9XUHUr1jYB
 if14Irmi1sCZVAGafd4mrIU77iGfumkmSMIHilA/FluFxsPDj2MEiwOreLGqPlxLh2NmodYWKZs
 stM/D/IOEVB9R8Sc6iGIBnxPXmwAct37qyb+Z4Kq0az0u++nJazarVJmlx2KEInW2Tt/2KAIQkI
 gAG10OWyRlM0aU2UuFh1iwTAYn5p4OKlE9AxGMyhRYzPoGWz/k6OfagPE2moOp2794kFRyaZxHf
 UPwIXMV31bArbfOs019lCq+p25BhZB+1ag52TYO4yLmZVpVgr/FWS3nl3nm8+YzDlpzCQawRihc
 IWiwE1FPiptriAAnj+eCoYqXxM+IhTKl0pwLOewaM4Wr7d07jThcNjm74PZ0hoYVbAreoA0xn+/
 9fynfNYMnO1iwG+dtTifjqjD8cL2JzqWJ8MspE0jZG/KnwwivpxZi3JOlUchmADUzadNM353eSV
 mCUrGBf1jUX8vEg0twQ==
X-Proofpoint-ORIG-GUID: hs66KQ_0syi0gRgm-hCB9nAE_RJeKyF4
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69ddfba0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Qnz2KnwcCDuQAHdkxh4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-58715-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1BAA3F7658
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/8 18:41, Krzysztof Kozlowski wrote:
> On 08/04/2026 11:16, Wangao Wang wrote:
>>
>>
>> On 2026/4/2 15:08, Krzysztof Kozlowski wrote:
>>>
>>> Why no IRIS_HW_AHB_CLK in power on sequence?
>>>
>>> So if you rewrite the code that you have list of clocks for hw power on
>>> (IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
>>> this variant) you could have just one function for all of them and
>>> devices will be fully compatible.
>>>
>>> No?
>>>
>> The original patch was to add the IRIS_BSE_HW_CLK operation into the
>> common API, but Dmitry requested to separate Purwa's implementation out
>> independently.
> 
> So you don't know why you are doing things? I don't understand what sort
> of argument is that.
> 
> You are duplicating code, while all this is simply the same logic -
> three clocks which need to be enabled.
> 
> Best regards,
> Krzysztof

Hi Dmitry,

I think this can be moved into the common code, so that any future 
VPU3-related changes will also be applied to purwa. What do you think? 
If that works, I’ll update it in the next version.

-- 
Best Regards,
Wangao


