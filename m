Return-Path: <linux-media+bounces-64304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d/vPKNsdKGr/+AIAu9opvQ
	(envelope-from <linux-media+bounces-64304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 16:06:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2683660D7D
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 16:06:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WuS5faaK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gf2Ye/LM";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64304-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64304-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0065F30A343D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 13:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5833742EEBF;
	Tue,  9 Jun 2026 13:56:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444642B75A
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 13:56:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013413; cv=none; b=aLPqLdxovGNrgEEDIwfXJv2nl1tjMG8u1W2Eq4wcjkftxqzmftIb6Y2JgDpPSgLLvXmTwR84aqzPMybc0MPtROKbE0R9PoPZnqCEXClocdUeCG82PTZgrvf/4lqWwDlHnIQBSv71eaIPAjBEsG/1LBqsgbxltZP7wXn/0hy36bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013413; c=relaxed/simple;
	bh=CcTmWN8DXMnz0bJC6LqxK6vabFMTBrDgJ9RFOo72kwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxOR4WKMy2H8XxaBBCkHQAtI7ldsDL5CvKWqyxm78IBaJ4GoYJ3mkcE9bwFvl+SLDB2JiGByyQZBU+DdQzBedvjVemxiEopO8r52Uhp3Ph/82WEnCWWl7W3J5WjjXGunZ8jVm0zazgEGkuHNZELlPMOqf896v3AyVsxB9+20lgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuS5faaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf2Ye/LM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaGN2694056
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 13:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=; b=WuS5faaK+4G0mZQn
	U6/kr0u8p5GX7ocW6M3Ube4BuASGWKKawEZqTYCc2RXxdK0dR3g+5a68E0q2F7ST
	P0m9Ru0908pbzu68tTlZTVV7o51t15bZQagrt6P5n1MRm8vInyXhhazXXYrTN/pK
	mgCQWnNwUcDHJA5uBGoYWrIB9SSEm4FO5UWNoA2WIOswdzvCDwhxn4of+QLWLw4z
	aEJ2M1mVHB1RB2mo9bxvGcNBCm8gwSy/3RCgT3c9sKwErrxR487DRW4+ilGrXz4z
	3bBvPKk2tKm/EvkYxCw4+3+S+O0lO0nRAIg6APSh3qHrEp01PqMV3sRzxfBrV5pf
	as63fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v17r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 13:56:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915737aaf0bso138419085a.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013411; x=1781618211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=gf2Ye/LMvnk08jnI+hp25zUoMJnSgdHAgJ3qVUxUxHFbMNGDILKBRNAJ8ogLsbchrg
         XGZrZ5/fcN9jr/ykupFlffY3sF6thKGGSuVg7wMpoSxbjV5hUAHd69tYVvmgHjKAoBgI
         4MPJIhKsj1R/9ZfIaAZE9uhaDutkpahOhVBmEX2BrEsoSlGkKYKAOmVN9LdyzS0DxSWT
         0oLNeSy0PuXNs5hmKmH9FVu7pQVr9EIXKS2dv4v7BlifjDp+Cz29a3HRwSRbEsGFCd0O
         rcnEIQsUxc5qWZzhvOoHISPMI6S1peYvY9FwgFbjF/Tu2VIzrr2SOPk9fWBtuSHcjsYU
         dXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013411; x=1781618211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQFDbwlJhHCcC9ke64p/rWctFC1cP9UborZW73WRcTY=;
        b=iQsxE+pdqgF1HVFK4yIqteJBiuKbunKAv1io4nTkbdoYyKTr7mUyYQmM0M5knY06tR
         Yh2f8ndmFcLkPdJTxPw+R44RVqqRCqsysmbm4J1gXUUkZsQHcJTL3DEqPVtlJ0YcbrJ5
         U51SE/GwSqqMDwFPi27meDUJc33Gilrj3GICn4PbFVjjYC2j5sIFhI9rrRqL82jpI+yD
         WfK8gEUbfYPBZMeUVlSBM0CGQ08gF/F7DgWCPXcPO4G3KNlTavHhdSF+nue58bkOYRYk
         0gZ7G0mjQGFZolijmk3mNIHEVS9zundk8SRRBUKBbv8emWueBjJ10o3Nv1E7/p1wRhcV
         avWg==
X-Forwarded-Encrypted: i=1; AFNElJ9uyYi8AyzCIfuj98v7OiHUlYXQPmrZhbEwCYiN06A8Zbf+H8c6+lICHLBY8HcqcsMBWf9wtlJu/ISNXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxx15kpvVKONW64BmBPR/todkxRRxn20y51kp/ieWHhyCiN158
	1fxIZHTmzsWHKzzEb0pFooxSNMWzpkcdl0AaSb893e4KVn4m0mR6dm43GVwgHDt+V17QMnI0m9m
	oRT7noX0bz8opAxBzvMwQS+Au90NWuEYAE3yRtyRyCNJAJFWJynDSFFL12t4ZsDpe8Q==
X-Gm-Gg: Acq92OEcEzIZx/2iCBUs5J5x3PcOyeQdrhsSPajtPC5d0gD0FxaEUPYumaY5epNJPV8
	7R2WDqBdhMIMUEzRDJkmz3pKD930zDxoW81jaK2paRBHu8giedCCYolJaP0Jg+9CrhblnzjXX3x
	HBjvQtrcln+xUzcErWD3arlvtaeqSccgCIT/gGG87iAPKHW7CM8YWVuqCyK4fkA1rc+6DPcL+4W
	KMlbAJi+75oi9ZS4XtQp8aom121SiyGCqV1bIwz6RQDLkFdtI6+3I4gGHzqM2hD6iO2NMJILveG
	jI7oEJbV0wRbF/ZtPvQMbRp3j5XdTqieMh5jkuRceu6uvOtyrM77lbN3u5ziJkrizM7at2vUC/D
	RjeLYQGrBIbiOO9XU6GEGA0a+A1Ju24ucVdGTHNCt75tzDiLxbZgKClG+
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268372685a.8.1781013411108;
        Tue, 09 Jun 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:54b2:582d with SMTP id af79cd13be357-915e6dfa301mr268368285a.8.1781013410622;
        Tue, 09 Jun 2026 06:56:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e29c0esm8900211a12.7.2026.06.09.06.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:56:49 -0700 (PDT)
Message-ID: <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a281ba3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UD-L-AWZVG7rN1av56QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: R3C4L0QHDmSU2gP_75rhd0WjdRElErkl
X-Proofpoint-GUID: R3C4L0QHDmSU2gP_75rhd0WjdRElErkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfXy5I+DBT+CVVt
 eFQcPL6t6oXt+0/kcq5O1gjq2C1bUmMoQqIJcDwwXI+rt4dl8PpR3atp5HnccH9XHMFtGn8ztdm
 LerdPLUFGCQPONKlgVTGmRupQxbPbiRqWbIo+g5/t/rJUiNZjn3K0kdJ2JsEWKSy1JV5QaoC6sH
 kLw0IW3pMhjWv/m59f267nOKGvQpuJLEQxZt4rTj3G25gtvcF96tYCCl44/M1w3sgnnbEna70oN
 gptlBdSngFXgTOSuJwO0NiYmwiQZ//50VeADkkULOZnODODamn5w2vOGVvFTlWw8Et4svnB/KvO
 Bh9JJfmWzXh45RCW3nCmPwsKJnbJCgnMrS91u7Vp9ksB8Gmtj+C518wQv2CD7F65PNbUJo7mYVU
 xA5gvB4h+WriKwlLRzQai0X7Qu3RYKk+CvVf66ugdXYYbGK9iPOKtOngHe6+8qPuJYWMe85/Pcn
 rnDCgeJSjl8VWzvFpxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64304-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2683660D7D

On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>> described as subnodes, then likely none of power domains are needed

[...]

>>
>> CCI is not described as a child of CAMSS, here the situation is different.
> 
> CCI probably _should_ be a child of CAMSS given the design we are going for here.

Yes

Konrad

