Return-Path: <linux-media+bounces-61635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGVdJoS9BmqMnQIAu9opvQ
	(envelope-from <linux-media+bounces-61635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 08:30:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95454A00C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 08:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 861FC3022A87
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 06:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B5B37FF79;
	Fri, 15 May 2026 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT6q8Eat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQF/F6xJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CA379C31
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826616; cv=none; b=eBoQDmBkoTvtV1UUOLM+XnbHBv8vGyFRKB22tZSyf8BYX1yEGEDhOI+EQvKZV2KP5N1+3C6xPtpS/Zju4xwM1B+2yBOxKsQzxm2nZKa+hc9Wk7e7jwnbpZeUSrHtnBCJBaaa76KjBwc19uxU53AHvCsUuMdE/9l5gJII0fAaWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826616; c=relaxed/simple;
	bh=4OhkOUm1uinge3W9lUySjqDtHM82URbONjbpN6SzBlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LinfshIsy7B1gyH+Rm5jxvA3KEcCRsOz8bWZjTAcWcOBvmb8EBf5Y07g43bLGYry/SulwARg73yjJjeSB6sR80l6+6LEnVaJs+7tZg9th3ME3gtOBQ8l0Gmj8F4N/W2M4TgsA7ZDVfMx5GLrS2fcRKZvK1iqKdcsa0yff+tq5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT6q8Eat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQF/F6xJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4vbwD3513635
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=; b=bT6q8EatEKwk6vxA
	WJJBCA6dFpa1H690UBjIpDA4OpSfUpE3jcYK63S6pyQd2qKOLCQDORLgOL0NscT4
	e4i3k2XLTLIqQ5wJaJiiu0kazftGdhggq3SlOKaqR/37IIvnd4cxdW/xRpw80FOe
	MEhiU0QZfAv8jT9CZlGiDlwUTxHVqweqxgx5zimpeh75gjlBnvYd1ubKGXsArYIX
	TTFnTiDDlw0bHhgQTmtJcZ4VPADHx/HYPI0h45BOrrRIFpqlejRqplejXeiNzqlG
	aGYmYK4x+nQFrduTKmrpvwt+vPcg9qzTBUGfi8t4fg9tuRVj4IKTEB0AJjqhTA5y
	G0AR9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1v9wrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:30:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b7e68098dcso208225876d6.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778826613; x=1779431413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=MQF/F6xJEYCtlYvsmTFzdaFCOIX5JLulPTuy9HFv0X85L3D5n6KlpvIrWJ6Q2DosEr
         aX64tq3fxAtz/K2T4rtn7/q6aJ/1cuhk4/1s6DrQqXZ8GoU0WXRYO5jfg+2AYmuJlnbE
         9POgI/+bfWEnvbPeFW+lFDWSFi6gC+NQkWfqcSkl3XLyTgI/v8IR+KEEhj5zWwGqf1g6
         KcvPV5bUcF6wqLoQErUdJar/teDL552Yi3qT8lpXrdX8gRlibGbhE8qBGvpFiDsYWdeq
         Qp4RmdTADjorRlhsSp6wUKl61wO25VovhUZzkhXoOzPaH1bWlNd9NUckZADTZrZT2KCc
         +61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826613; x=1779431413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=YT+XhUxZPuGoScB2cqqUCUpQBVAh3b5sY/JeHBx0KUX/4fjU+vCPS46VooOucBZjws
         omwcIhmmKx7YPxG7wMjOdimzHGpDbEBHdNerhIbFwHdiI3u7KVQXCmKPi/fzRPCHzXmA
         3bBIX5P8bhdOSl1MxghTEbBxky60qAgjPRi0Vf4WcmXsetCfkBUeIpNmfB4FBkssEmdb
         d0Ia9SCvUyQbo2wVowZYHqNxKmiIFiZ3m74Qjen/47IwUFxRYDe1PJtJIc61rzGvT98f
         Mvpv/bRUz0dlKT5D+Sat1NPoWn+nq0xtYAUCcmYejMw7SgVNK5dvK7mir05XIYo9JHo0
         he3A==
X-Forwarded-Encrypted: i=1; AFNElJ+laWsmO54uJGYslMrf1cxTSWQXWRNf29qNh3cJamGes7gj9fbumxCkKEegNJYD2wPwQeWFtcVsaXrYwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0IZd7V5jwQfo2ieyTR8qLk58koXaXcCXsxISOdBjP6nQ6IYV
	rSQ6XaJcNahxqJHJJi2G43m+6WWaAnOQh7bw5NQtCNZeR0mgnE5KmCQiSyFvHO/5igx85kVDZyu
	sTTGG9/D+xvW1G0Za3U0cr/UJmAPD1LlTg6QvbZx9CP3xQxRbzxSx7gekOTKpEszVHw==
X-Gm-Gg: Acq92OHnxdNrNImhMZqjyzA2Cn0Eq365lYF0gHm+2RtZrJvRKFLxTJf9HUQAo1b6abv
	tkAVFE96iJFviDZ0w+1Q60DbnG2yXgfCDQEvFfkbpLsqUIW3VQiAdJIviUyVMgPFnGNaixj9fRO
	y9gxkkweUdK80STHgobIS48t4tY7+FsTdaaAvzZfps0PvhILPffdYxmbHK4zJa5fJtLLQanYKML
	Bq0HWuyIU2jWHv2tw785ck69wKyYH+DHyp41XclwKEUN3f45VXwujrZwRfN2OqsIcNaSN+Mj35V
	Xsf6GMrfPQRVGwb7Z2PutVDZNtgWC5sEalV5YDfKeFkYXvHUh2ci4WX9l8Fjp3WAlNzyYsmA8q4
	vAb/VXWvSw8e+sTb6Coeuriw9n0RV4mNx4aROIE6ZjaSJbqvgyzHPwVA9BhzZ5XI9KUAoxv4Vo7
	l1wR4q8R8e
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977786d6.9.1778826613186;
        Thu, 14 May 2026 23:30:13 -0700 (PDT)
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977306d6.9.1778826612525;
        Thu, 14 May 2026 23:30:12 -0700 (PDT)
Received: from [10.111.160.50] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908f0d92esm43711496d6.19.2026.05.14.23.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:30:11 -0700 (PDT)
Message-ID: <7d34bc76-fe49-4d8c-8ac9-f563c2c35fe1@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:30:04 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
 <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MiBTYWx0ZWRfX/83n4ihLxXdu
 JQVdt3eu3nPFMB7bBuFrOjXt0bIypyYkR0NPbsV8GQFtJBrg7Ut0MK393R3dfqyw9EGL0DpGEK3
 4eI28qQ+4gSHht8Va9xMxkP2O0ZhaQTrejf9xn2QXhDeOsFH9Z0LVB45fKeEQMCUbK9kN7DvtC5
 6PpiRw+gJc/xfJuA8sIwtKPMvdPIVWzRxpvUnpQR1/cd/2hJfQjRlRE0y+QI4dF6h1iOn+YP4ZP
 rG+PZs11lRnZYxnEh3KigsfsB2HC9auCPpucP7AsoqYMEjpTsSCF8T8Ww4XVpOKj5W3gzAE1WL4
 SmugcVM00JiwiwX3D1VCV6eKq+XU9go4RM7MGXyAHoH/tghAJLsuMvx0Se5FX0ZRNuOSuoUdjl8
 AKRttLPVvzwJK6KNa0g/pQe4uUf6KsGS54uw5PM/TZbscR7nWdw1a9SUAoklYB7wYV/1y7GK1XE
 YY2hP5pC04Xx3YfY/og==
X-Proofpoint-GUID: kGepOsF6K4PKzxAoB9p3T6kAkVOorU6E
X-Proofpoint-ORIG-GUID: kGepOsF6K4PKzxAoB9p3T6kAkVOorU6E
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06bd75 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CMSjfWuysNDtZblWgkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150062
X-Rspamd-Queue-Id: EA95454A00C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61635-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 8:19 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 04:59:34PM +0800, Wenmeng Liu wrote:
>> Add bindings for the Camera Subsystem for X1P42100.
>>
>> The X1P42100 platform provides:
>> - 2 x CSIPHY
>> - 3 x TPG
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 1 x IFE
>> - 2 x IFE Lite
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> I do not see you responded to previous comments and FIRST one was not
> implemented, so I am ignoring the rest. Not going to review this.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Apologies for not clearly addressing your previous comments — that’s on me.

Regarding the first concern about dependencies: in v1 the series was 
indeed based on the csiphy rework, which pulled in a large set of 
dependencies from Bryan’s changes. In v2 I intentionally moved back to 
the existing (pre-rework) csiphy code to reduce the dependency 
footprint. As a result, the remaining dependencies are now limited to:
1) Clock changes (expected to be merged soon)
2) TPG support (planned to appear in linux-next shortly)
3) hamoa DTS

For the csiphy-related concerns you raised earlier, those should no 
longer apply with this approach since the series is no longer based on 
the reworked csiphy code.

Thanks a lot for your time and feedback.

Best regards,
Wenmeng

