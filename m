Return-Path: <linux-media+bounces-67301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6hDBEnP1UGpI9AIAu9opvQ
	(envelope-from <linux-media+bounces-67301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:36:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16B73B4F9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jWoS3LeD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ScxXT3JJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67301-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67301-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19EDA3011A54
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF449370AE5;
	Fri, 10 Jul 2026 13:36:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D463191BA
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690606; cv=none; b=LASGXpSnU31ysLxq1j0Gw2fDaS1UFEe3kVaBjotyNxzfRgwCXT8+YxG9vgtdBUQcP16vPiqGuxHtBWVJWYvZiNGtQfUqv+Et3CcserPWNvgyTgC083NwlhD+oBeRJXU3lQTsPJL69TKMA/MoZuq9MYJKH5ZGg46aPsWaaocIShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690606; c=relaxed/simple;
	bh=560S0t5MFs+Puicfa0vOlBipg/JOUPnOJyV5iCkNDFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hb9uYSvIRdWQ0uYu04IBvHewY0LXfcklJkBU+gqGpZMAiO1sbe99tjlOpXrFnXgbzJ0cdopFAD0DywiRFzzmlyTY20ClSfMtu4OYrbVGDwMHG8bR5DGYvHa/InatH7vXOfYNgiZTfuL9O5mK26woM6goz7coftBa+yxXxp6wBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWoS3LeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScxXT3JJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD7U73924067
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=; b=jWoS3LeDHGko/0yB
	DmyB3fAcuubSMrl3KAxjkWcFPsaTFsF8oaeMfaTJIPuH03huvsJQxynPHkNPI19s
	UzEKIgOqMVOYbXXuPpTAT313UPTFvO3Th5Rp3WP6v81mi6O/VZSvQmPIyJDhLY28
	tnxPLKOWNB7Joo/PELVvJlZ4vtfQb9U3rnXRckKikeiH6n6+hgLHtiNiWA0Ippsq
	O8+QCuuXV6oX4B7931VhLLezd1yVvAEcAWGavgjc0L0t3H8GTgRRpO1dgRgc0+58
	G98g1vuqZD0zQfntgQ1dwGQQNU78UO061DPFRm82TXZL+gquOs7sw6BqvZEZsznU
	qgVoJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0kqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:36:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso1783403a12.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783690603; x=1784295403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=ScxXT3JJLt0gbOIAfZKlxdonChU/lMIY98y5CQyHpuctcSVOwFJ4ENbc0+P+RTWMAH
         NloqpwQRkKrV6MVBV8xgX0snJYGxS2vkBlZ0STdEGjx1sVvNiym/QXHRX1o/f9jTyLM2
         FEJUGCdLYgh583owb3JLuPB20/uDti7Cybrr+naeEtmWBr2OaPPN/9hHGiYqnRsedU+E
         BI4wZGyC5ZKQF+SXIY1BAWNEAUVUILPk0oUE72DYAzj2UJSBdfiLaNQ26FVqryBgNmoT
         YZVcgE8AE7Ac0tmdLvMG8KSVxZ4dAsWSTl9/yO5SEllv5hBW098Pbrm+oXJp4yrnW3T4
         5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783690603; x=1784295403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feZRSEEsyFMh61ysr/36LiJibvLNR3LeMy58K8LaAe0=;
        b=A+0l8E7jb6N4NOC3RIv7ddhOgb2aGzPjY+ZSVRdB0sazsXgFJaLF5eChqYumty+3yN
         nKsYKrykCoQn4Uw8e4NXnsiTfZyZy33sAX9WulFGuS0cKYCw4SpjM1fz+gRkXphbxxOo
         HEcMeM9xCfwSl0Zrx/5csFwZ10dVb0HcYyDEavXKkmE1v8XWITXGpmiLyTeW1JgOIrGv
         +qft7I9onZU4+EzFixT3BwbTl7l7NiK4PBuZUjdoM0vJCmAAZdo5rYoVXyaCYzo23Ef7
         nIlE+BDewTFIEuDdkpAzE9JIu8pSKXhGrlR39wxa/lVKvh/PJw4YmPx5bnbpndOWB0Df
         gd2g==
X-Gm-Message-State: AOJu0YwFjpYSzYqEpyzgfkUMV0mO+43GRHg5UBgg0d0xiqLqk9/saGwf
	govafIByYnzb9W2/c/oB2qHhVmZMmdE0C3E2+Ds1tIqVHaWvNLfEpE0rbDYcoUnxkjOj1oGXqBK
	mm4AInNXl9mtT5nYa9CoTWn2ICUJibbdXJ82z0eHTwFzDaWWCMp4jKAlSjgvnlC4xiQ==
X-Gm-Gg: AfdE7cmez/drvSqILuaCEzBWBhmMVIOOpYWFKxbEMARCF5n3GMQdeL22pjZ/SABiFzO
	lbdchrzmDFsnJNolKMoGNCXE6gqLdfmW9RzHaaR4qKgL8QNeVpbpCd28DfNT671aer06/36XAHi
	FBTIADIY4JxODqxQkvfxXZKQfwxKlC9or24ZBqBrUZnzdwT/n+01CmyhWmlYhPCiX9NKj6zSrjm
	GWl1sSFdc/OBnAigkvuxLAYY2QwInOqo488B930A8GtD//CUaorK7IqzOQW6ckfEPPVssX1r2OX
	vgBE4TF3nQ2jYJgTOp9IfccU3KHZqY92hLFOFAVcTl+80zAaU9B/3klHtr8II6kdtE8TnQfikHt
	/tquwzWfop8teI7nNiNwsHVRiDhU7TrKGSlRFwvpB7S9P
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518547637.39.1783690602887;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d20:b0:3b4:e4f0:94e1 with SMTP id adf61e73a8af0-3c0bd0f9dbemr14518495637.39.1783690602425;
        Fri, 10 Jul 2026 06:36:42 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm74501495c88.14.2026.07.10.06.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:36:41 -0700 (PDT)
Message-ID: <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 19:06:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX/g9xuLCc+XoB
 KmNf3H2Vs6ebzhitvZQ3dYuqOApFhqiv4Nf9B/Vm+0a75Gxt21qGr5Y6+/TSGWXklgV6BSu3Hs9
 KCz+cvxhLQ1tDsr/1X79AE4Pg6PeMTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNSBTYWx0ZWRfX29VAIiquCVvv
 yBIOfPevARSD5Q7Dg7OsO93mOa9DihzOkrKOh/Dt+5uZn5hjRX9qxuRDwzLIYUDB7g6hrcxZwMO
 uMumDWiLHti6kB/dAW77Mz9PXspKMJKMSkY8MFWIp0J2j5AhIqmzSdS9I7/o33wAlt8VVHyooPY
 e/WQ7BLwZZ7muumNq04LRZZZdAdHPCS7S7zgQZlmCKDNTgMidqgKnjJSO3JEgPN3iqsQavy7Ixv
 s9AOt/uXFcv3DbAXmD5D6bxpjSa8fg7x+/aBR0zxCxmCjcDoSl2OAUnaM9PXJHXKagIZiOg7uQE
 Vm9BX+CJxisJqLGxFw+Bhe0LOsaLg0PdeGSoWWe2XDKCHRS4Zzl9b17vEu+V9+Og9Kt/7tdvNPC
 bjQhqqPc0vt5vnPMBlK0JsOb7ssQMsyq9YG/IW1GJE9wU4a+e8TydQMom1mxLT/Mux6xmSESaSa
 vMCIVxKj6Y96CpR7xFA==
X-Proofpoint-GUID: 2kVVG8XcOQE5ZfNVJrkmlHzunZyKkUPh
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50f56b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=5i2VpEqXucwHfqzRn4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 2kVVG8XcOQE5ZfNVJrkmlHzunZyKkUPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67301-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 9E16B73B4F9


On 7/10/2026 4:05 PM, Bryan O'Donoghue wrote:
> On 09/07/2026 13:35, Vikash Garodia wrote:
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Daniel, who reported the crash issue, have also raised a patch to 
>> workaround
>> the issue. While the patch partially handles the limitation, it is 
>> inefficient
>> in a way that it keep iris hardwares away from using the 600MB address 
>> space
>> for all the different streams.
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> In the past, this limitation was tried with iommu-map approach, with iris
>> driver dynamically creating the devices. The approach was later concluded
>> as an hack to avoid having sub nodes. It was discussed in detail in the
>> discussionhttps://lore.kernel.org/all/c7b956a9-d3e8-4e18- 
>> b780-5d08f5cd2ca1@kernel.org/
>>
>> It was agreed by maintainers to proceed with sub node approach to address
>> the VPU hardware limitation.
> 
> What's the addressable range with sub-nodes ?
> 
> The original problem you were trying to solve was the total addressable 
> size - this other problem here segmenting the linear allocation space is 
> adjacent but not the same thing.
> 
> Without digging through all of the patches here - my question is does 
> the original sub-node addressable space problem get resolved in your 
> proposal here ?

The proposal solves both the problem we have so far - total addressable 
size as well as which segment (or range) in that is _not_ addressable.

Regards,
Vikash

> 
> ---
> bod


