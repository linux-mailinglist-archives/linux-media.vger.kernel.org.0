Return-Path: <linux-media+bounces-67439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t408KR2gVGqdoQMAu9opvQ
	(envelope-from <linux-media+bounces-67439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:21:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98D7489E3
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:21:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A1uWktGd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QbJXNsJp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67439-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67439-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0AC3025E56
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE17A3ACEE0;
	Mon, 13 Jul 2026 08:21:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386F3AA9F4
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:21:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930887; cv=none; b=P8CTZMPbqqP3yKVnRPG+Ku/9djS6Vy6vzpArhVlUvGQpAG+Dl1UiNyd2h7/gfr6GfalYomn3oyQhh3zNkiGP4ef7iMWlNQTNWpV6w4Zu0crdhR2IIRRUwFiWVAtveWP0LrO8fV3ByvR4vtLURQNAusv0fYx1yf0Y73AmaeRzg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930887; c=relaxed/simple;
	bh=TnQKSM8MZA26ziuAwsidIQP/IBfrhCtujf4X8iIuakY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mddIFLk74yvC/l29UAs+aFsxzE32raAKbe9xXso9ubCsMowmrv5FfvpTlQ9W+a8Vm1+4/LRYtuSi8HOH4Gnknqe8pjTkjx3SleKT27AUbdV3IxQ0FGTgaxID2XkZWXe3Ws1RYnBYGnccbWwY5yVxwGZKodIInwZDpaK5t4voHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1uWktGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbJXNsJp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O0nt668987
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=; b=A1uWktGdfKXCBprB
	02A8Ld+CVwDevHMURyhGwIg9bzLWDJGu8njDO+R473ofuo01WbSF077GLOwXOBRl
	gjFEgYSLnGYUWAzXPaDX/WE7pbAitefMGiihtihfnWrXS83bjKJJ7rfXxq0d2izc
	hWETrNqFGtCz4Fd2dH/09umjwLtNkb6ZxYUEkHhG8mY0U3HoMwwEFX+MhfwwaTB8
	5MylOl1qFXBWNiibKUcnZktLHI+0gOaiLf9KJGaNcnwr8dabc07LpUkYmZDwPtuc
	HQpNNhlo6tnU/Dsa3iMWeE+CIWCdEPfHlqn89N5lMwVAI+7PGINx6M9Nu4NqOeJn
	jJPCJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1me4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 08:21:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso29221251cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930882; x=1784535682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=QbJXNsJpyhOLuM9m7eWRgYQTAi1xFFDHbMQFNMjPZP9FXiBsTjbPtsprvSHDkL3C32
         W3faEy3bfRdPxq1/critJ/iz5aPzeMUerx6EFjVFGeIymKuiQIKGiFW31JqOuxWItgcp
         FWqvH4nDz/v45geDsQq0x1mJesqZCmfs3MwX8QWnZeJzPI0F8rw90zlEVW8Hv2mHuRzl
         8sjKXKCNEpNpma+O8+rla/RiSCNW7P4vnGGlJjyO+3IxWR+MCDHgfsrNY7Gsi58ugM/e
         1zB9gXw3TDhWvRkGDaTu6O+Rkt72iHGhGwfbZH9VMBBGzUQg40ESk+82RPrZ2TB49qMO
         VT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930882; x=1784535682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgHCt0baVbDw76HI7bLRH910zw1IT9kEwqe9LOXn8jk=;
        b=cWqtf+RUuJ0Z84+68caaFPmsBKvbu2jA4DMqwE09mHXEAIlTDcqRflkK+NBNokEpHD
         cUdjvyIFVQ7muTJdu45nFUI8+NVNbFIhMJlkCb7D/8PbkXi4O5aFKnUj0M2mlkQT5GB8
         rPFJ8k9/3WOGqD5oayomdjwZklCfGWwWmLDsMk/AE6oRVxZk/M+xLym0CF+j98AFzAjb
         7HUHH2H886neLfWJzjbDygdeLMkyp8iS3+UTNfKnHV6AcOZjylGAw7s5SZxrPQ9u15k9
         yLKbs/fEJMGxvYKqhjUR6JuY4R8ykRgQATJvLGu7XqzSakucVkzAdzPL51qLDTLwpa0R
         EkqA==
X-Forwarded-Encrypted: i=1; AHgh+RqUDLRJOOlIjJnN38t/mrPAnSDqS9YFL/e2ZJhAFD8ZkKuZwwY+6IUKM48F4exCZWg+TRXW2pRTzo9Z+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKg0Q/Oba5CoCh44ol7nz43ciWB+LDJG3m+A9H4WqDcSpQm8B0
	aXhkDiJq4KAl1bWx72/0N+KxpTz4QkaLqQqS7p6T1WMeyVew/yAAL5iDrtqYDv1jijCnMsDskkr
	ka45xvp+1UDfs4v9Aril+77TXKM2epAt7fYh+HvM3CzvI7zmtcO52ZtPZIgdG5KuWfQ==
X-Gm-Gg: AfdE7cldLn7iUeIo6NbdUR6g6rKu2k2R+pfn+No+6yMFDV2zaSSNxS4vW2HbWxI+p72
	QCo13wkLPyO2mwfpyypBt1CX5TdS4DeFu+FwQLjR2qMQ6sol8UwLHsgUfkyCydZsqSIKbWWZ8NK
	NBHMMj3UZOxPM5bz+CK5YAtcEGRIoiXHk3NsfadxJ4YfQ5lT3lRWlmA0GesRWSMWKP2ipTAdnx4
	nzv14KZQGlqEiYl0kZoTkA6Lp+k79USE2Hv86XyafsFLdUE/xtQdvgeTAciWclP3ZiSQjnYUYTa
	K+7bmvqHZpRbljjvnrnSECYESGs7ntRLudHjqaMmY7UGy7EAc1IMgOkdZR/HtrZjqC5bRfhyt5E
	faYbGQeWrYhTT7VTN1pJiDM2k9oRplLMM9LWZPkZDorI=
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321311cf.19.1783930882389;
        Mon, 13 Jul 2026 01:21:22 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id d75a77b69052e-51cbf0be5d9mr84321051cf.19.1783930881843;
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm7586462a12.23.2026.07.13.01.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:21:21 -0700 (PDT)
Message-ID: <6de0a8e6-591f-4526-b5c2-431711dde1db@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:21:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Du7-jq3xW3CfM4Pyo2gHqoi7D98gAmMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX0bbLLfKUnLTV
 IRMaWItVjZYXBCRyH0TlUAa4i3hBMdGa0rPYsgmabYYnz1x3qBJMaabCPD463Jx+k797zdEBz6j
 xTpc62q2HeyzOWzlFiuZ7t6HuXDa9hHKBzDcqoXoQe2gDy9CmqTtBxZWZRhzDBwdXWIBXjoo04M
 h/TQXj7YndreZ69e6Vk2C3c70mO79Oz9F3LSUuZPRJ8wOKw+NnaWBE/t2ANPP7jFIazgER4INnF
 5c8OC7LaA7/8EZAEiYA5WwU0Hak4S7lx59BSCiuRGoo87bkvNGoFMt1pkFq0gYeuPxlsJgejLZl
 0unYZVFYbw9wnWnVPSnyKqg6skHcPexP2/thx266yMYsCaypd5BjAAC7gO2/p6tbJrNm9Wrvirf
 z2JQuRs4epny52fbRpjPOtKyMZ85OAwxh5Cql/vvf91FN64Qh/ulylMlyMCHsD3GSiBbbHVruI2
 GiOvv0yupNlxhianTtA==
X-Proofpoint-GUID: Du7-jq3xW3CfM4Pyo2gHqoi7D98gAmMt
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54a003 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=ka1dcg31Si149idUFP4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX7lNYcu63hN+Z
 jSJtGxcNlRZhAEKR6CdZn4XXFGlOH7WnyZYKzMLiCvuzjvTBjHQkPkTbyrco8UMLy9pfXteaatm
 MrUauJ/eoG2ctpFasXO26bI/eYroho4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67439-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B98D7489E3

On 7/6/2026 3:09 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.
> 
> Best regards,
> Krzysztof

You are correct. Existing DTS are not broken. This patch is dropped
in v5. JPEG is modelled as a standalone peer node, not a child of
camss.

Best regards,
Atanas


