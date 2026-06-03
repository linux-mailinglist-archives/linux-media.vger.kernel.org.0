Return-Path: <linux-media+bounces-63676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GqtCGDSeIGpX5wAAu9opvQ
	(envelope-from <linux-media+bounces-63676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:35:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF263B66D
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:35:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dc2Iz7ls;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eRBauPZi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63676-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63676-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14A6F3024A38
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C4B49690D;
	Wed,  3 Jun 2026 21:35:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721493F9F50
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 21:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522538; cv=none; b=W4mZB+ypn6iVlV/O/3gA+upGtgSxKEHYJd7q0tS/QXPtxE6qUJ8/u7rkFJ2O1mTBPzbOSQ4ZpQ+g0R6A7VmQC9eznGDrexsmgVeG24fUKSPPylaEl7Kii0Kswr3hj+bF888gCM0FTIxzghs5PEpViXoaaFlct+07UUKvMHBPrYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522538; c=relaxed/simple;
	bh=exSk+9J78HDuJF7Dbo1z1M/mRgCuBOiUJFPKAgCtz+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP/hW+042LWeeMdhCbdKy2dx4UomKQ4gNF/G5IaTPBR7BssdeRHQ6ib51MFDVGZ6JjzJycIwp+AO6zahEXU15RQuKSDzL2QhraoMuGNsmBhR/2NcPHtVmCYRPpxzg1rxi3aHfRFT0W3u8d7Wl9qwPAJTQHT0dI4BmKDKkmwtsHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc2Iz7ls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRBauPZi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653L5mlj1956497
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 21:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bBEMzSGNgMdGqu8MXBr/wtyw/loxl9YsdbeJqCtDZQ=; b=Dc2Iz7lsWhNPa6kD
	IXcmoKg8DbMmeTZC+9cuSlV2C+g4bVQjJsYLiOJHFDsfHGXiqvR9G+79EZtYLYnK
	hZcIEXt3hYz+mrFT7kwkrfRDDdApNeTPyufLyq0Z4wOfW50lFNUdMGVDiI4gZVDo
	9haYANz3GLIJ58oEkqvwdfQgd6sxk41r/rtefGqKxS7sbqj1ZCSU4kvPSV1nFnII
	+MewdVwRe0apeQlOLJlk/YT8hXMjmmj8uadC+3+EN+oDDnoFaabyDsCzFRRS4g/e
	syd6RndN/kMKf7N1RnOAQzt55H6sD7VvJmwXNDcoo9rdw/5sgDq0QlByMJEwxwy4
	TUNc1A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc3hph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 21:35:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304dd917645so6311885eec.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780522534; x=1781127334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bBEMzSGNgMdGqu8MXBr/wtyw/loxl9YsdbeJqCtDZQ=;
        b=eRBauPZiHINDSyEZ+aauy0U3C1vm/vX8i8x6z3Xqs0xSCqrRtBqF8qRN1j/S3VE3gK
         E2MykQx2v45nhzBVWj+g9s+OJKTk7YEa00+0IE6dwN+5T9t8ljPWRpxjzujvYE2lF0aS
         mPWClyrbs1EnAwzbnC7CaG/lK60pREJ1gA3cb5T3uRg8BZhLRqVayigMc1SMLi537X2c
         cVKHEhFgGrFVS/WcaSPG+E0ojtm4EgS97J30I+oHxKCSyW2V9BWeG2PdSUTwVntg+aSB
         nH0Dxqfw+nnwQ5EoYHcNXOw2VwlJ7lAfrXUlDK79zJRxEcnC3syBguyegacCapm/vjwz
         Okrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780522534; x=1781127334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bBEMzSGNgMdGqu8MXBr/wtyw/loxl9YsdbeJqCtDZQ=;
        b=XJr159ALl1vJ70O4wQx1L8x71dVF/liF9aCSbTmyf5alffn7a9Lozb2ilX+QinKuN1
         4GR9ketN1bLyOtsmwlRG3mm/ueIvovdGy9hM4YiBeEDLi8MiFkM+Z+HFopl3Eh9pfFqZ
         M/3K095kXNv+RxsfJGsebx0p+oIhacu72ODn7wmy6sFuOyio7+ut8yUGBAxo5t16xIKG
         8fNEcdnX3fhvUfB1U5TaeyCJ9XfUpWqiozDNhk0WO5gWmb0vaeE5Xq1qtFhY4UtO3RqZ
         ySpVyGTRJYZy3fZjtsMozwN96Gm+XiUQwsV9oZy/ZZ8iCVDruS1bd000TbuUaX7udVTT
         M1ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9D6eNZ/8QKqBvFg1Z7N7QCBjD8oTMySrkzXq/ZtBXkb1AAhnBV/W3CywvoRDy8PxzCL4sqXwW26RQmuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOlQN8gvjSOfvfRp/+A8iT9MlDmn+OzUK/VjHSVGMfVzfgl6j
	0cXMrz+mVQxwQ6x+z/k/csSoAx5xDg00IlFXgEniRYTVmj4yKJWEDPzLWS51RRDhwM0Oj6Ez6TO
	nkOxuA8TqgC8f9h1MtZSE9Fgcuz5jElKanSu2jpSPFsMYiFf/wgxH/6omAQr/h6aqOw==
X-Gm-Gg: Acq92OGOvz2WcpmTnBLbGSuFHcVNQYonq4BhT8W4avRXb3ayhTu04lW5hraHIcD3ITU
	eWUl03u9ZvSj9fGQ65SyTu97i0AOedN6lYW3r29s3nXQIPDn6CYfXwPIhDl8RZGsE1OUO+oMQnX
	OtepHfncby0AF8ZUOuy35HUDaSCd3KWZ0rrfXKiq51wX2iafpkZCIKTrC9MNtyorEe+I0TlzK8B
	KwGHZ6TAfId9cf+/IKqclOQxkEBCJoWI17j1LvAAt1QuHQ5PVYTUEGKoFJnvWNLK4Gx2x4WRxVA
	1V7nb4erM0DhGrg1kyKbbz7BTKE2uD2FvVehgCMG62NptPxxzDNP020bA4JLqvOHf43soy9nXgd
	Vq+vde8WCrkJ1c4RljHv32Hvj9nVDU9albPIJeIt0jYvHR2RTvgar9PmDHvjAurcEfXN2jMODpr
	aSMCo470j4PF4=
X-Received: by 2002:a05:7300:3721:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3074f840efamr3197874eec.0.1780522534146;
        Wed, 03 Jun 2026 14:35:34 -0700 (PDT)
X-Received: by 2002:a05:7300:3721:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3074f840efamr3197846eec.0.1780522533475;
        Wed, 03 Jun 2026 14:35:33 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm4720946eec.8.2026.06.03.14.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:35:33 -0700 (PDT)
Message-ID: <d878e576-1a80-47ba-8eab-56e459713ae0@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:35:32 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
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
 <tgG0QPGHUXMOoExQ9gjtNbUKbFpoiuWPHWCsh5vpGqFRGIeTcWiiNC1okUddn3T6nCfDzNbLlYkpSMdhfFVxmA==@protonmail.internalid>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <dbc4b9b9-5c7a-4426-85bb-e99ad6be6ac6@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <dbc4b9b9-5c7a-4426-85bb-e99ad6be6ac6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5pxVl4Z8dwsq8XLgXsakkrwyaOFluU5m
X-Proofpoint-ORIG-GUID: 5pxVl4Z8dwsq8XLgXsakkrwyaOFluU5m
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a209e27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Z2SiELE1jzycM0wTYZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxMCBTYWx0ZWRfXxOoPSi9noxe7
 wWMWnMOioF8tHRmztUhi/tM4gikMZgTXM3KpRT0n9uctmQU0TF9sjb8tLuRTZQwE/LxSlCF5nsv
 0qys9EwGxu1g+q9M0Hu+3ILNlwrzV+E11deWiPjq5I4P0W1GwmrjU8vkuP5ss3GNsGUw+8rv8/g
 eFzTPJV1BaPb0Uq3xXkH2Zt5DTmsKkiMIvtRcQIvUPYBCG4C8RdCS38bsG5cEU9GW4XR2crx866
 Oi4EBvsBHkxHVMO8vm7GyJVH1/ZX7/tbTGjOYmhBYfCFgiZcnUgKQuh8EpWCX0kTBGPFGzZQltT
 gxISUtQLUVPnNoiRB2qi0keWXeyffvjkPd7tYlBZ4P5g05kMAY6R14qK+XESbxK4gikkJe7/xDw
 MabIQkz91oa+PNDTmTyBfcDqqrR2empI5aucSlQ+kIpz5t+y4y7LyTYUze6iykfbm6qvMfA8rvB
 +Mi6Ky8k/H2iJ/MmUhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63676-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7FF263B66D



On 6/3/2026 1:52 PM, Bryan O'Donoghue wrote:
> On 03/06/2026 21:24, Vijay Kumar Tumati wrote:
>>
>>
>> On 6/3/2026 1:16 PM, Vijay Kumar Tumati wrote:
>>> Hi,
>>>
>>> On 6/2/2026 3:51 PM, Bryan O'Donoghue wrote:
>>>> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>>>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>>>>> Add a base schema initially compatible with x1e80100 to describe
>>>>>> MIPI CSI2
>>>>>> PHY devices.
>>>>>>
>>>>>> The hardware can support both CPHY, DPHY and a special split-mode 
>>>>>> DPHY.
>>>>>>
>>>>>> The schema here defines three ports:
>>>>>>
>>>>>> port@0:
>>>>>>        The first input port where a sensor is always required.
>>>>>>
>>>>>> port@1:
>>>>>>        A second optional input port which if present implies DPHY
>>>>>> split-mode.
>>>>>>
>>>>>> port@2:
>>>>>>        A third always required output port which connects to the
>>>>>> controller.
>>>>>>
>>>>>
>>>>> This port numeration is imperfect, because port@0 and port@2 are
>>>>> required,
>>>>> while middle port@1 is optional.
>>>>>
>>>>> Like it was stated before a number of times, it seems natural to 
>>>>> operate
>>>>> with two ports, where input port may have two endpoints rather than 3
>>>>> ports,
>>>>> also that approach solves the problem of a hole in the port 
>>>>> numeration.
>>>>
>>>> Can you confirm this is what you are after ?
>>>>
>>>> port@0 {
>>>>       #address-cells = <1>;
>>>>       #size-cells = <0>;
>>>>
>>>>       endpoint@0 {              /* primary sensor */
>>>>           reg = <0>;
>>>>           data-lanes = <0 1 2 3>;
>>>>           remote-endpoint = <&sensor0_out>;
>>>>       };
>>>>
>>>>       endpoint@1 {              /* split-mode second sensor, 
>>>> optional */
>>>>           reg = <1>;
>>>>           data-lanes = <0>;
>>>>           remote-endpoint = <&sensor1_out>;
>>>>       };
>>>> };
>>>>
>>>> port@1 {                     /* output to CAMSS, was port@2 */
>>>>       endpoint { remote-endpoint = <&controller_in>; };
>>>> };
>>>>
>>>> This works for me BTW.
>>> Either way, do we need to document the constraint of using port@0 or
>>> endpoint@0 'only' for the 4+1 or 2+1 mode and the other one is for the
>>> 1+1 mode? Or is it implicit from this bindings for a developer?
> 
> The binding mandates it with an if / else structure
> 
>>
>>>>>> The CSIPHY devices have their own pinouts on the SoC as well as
>>>>>> their own
>>>>>> individual voltage rails.
>>>>>>
>>>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>>>> CSIPHY devices as individual nodes.
>>>>>>
>>>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>>>
>>>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>>>> 2. The ability to require those voltage.
>>>>>>
>>>>>> We have had a complete bodge upstream for this where a single set of
>>>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>>>
>>>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI
>>>>>> bus in
>>>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>>>
>>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>> ---
>>>>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 ++++++++
>>>>>> + ++++++++++++
>>>>>>     1 file changed, 209 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>>> csi2-phy.yaml
>>>>>> new file mode 100644
>>>>>> index 0000000000000..270375f949880
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>>>>>> phy.yaml
>>>>>> @@ -0,0 +1,209 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm CSI2 PHY
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>>>> +
>>>>>> +description:
>>>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI
>>>>>> CSI2 sensors
>>>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and
>>>>>> D-PHY
>>>>>> +  modes.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,x1e80100-csi2-phy
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  "#phy-cells":
>>>>>> +    const: 1
>>>>>> +    description:
>>>>>> +      The single cell specifies the PHY operating mode.
>>>>>
>>>>> #phy-cells should be 0, because the PHY operating mode is well defined
>>>>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>>>>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY
>>>>> type.
>>>>
>>>> Rob said consumer but, I'm also not very bothered about that. bus-type
>>>> is perfectly acceptable to me.
>>>>
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 2
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    items:
>>>>>> +      - const: core
>>>>>> +      - const: timer
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  operating-points-v2:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  power-domains:
>>>>>> +    items:
>>>>>> +      - description: MMCX voltage rail
>>>>>> +      - description: MXC or MXA voltage rail
>>>>>
>>>>> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely 
>>>>> it's
>>>>> the case that "MXC or MXA voltage rail" should be specified, it'd be
>>>>> just one of two or both.
>>>>
>>>> Hmm. I'm not being clear here if this is your take, I will reword it
>>>> to make it clearer this generation of PHY _must_ have either
>>>>
>>>> - MMCX and MXC
>>>> or
>>>> - MMCX and MXA
>>> I am not sure of this, Bryan. If you look at the PHY core clock
>>> separately, sure, that is correct. But all of them, on this platform as
>>> well, share the RCG, which requires all 3 power domains. So
>>> fundamentally, you need to enable all of those from each PHY. You can
>>> make it constant 3 power domains.>
> 
> Hmm do you mean the GDSC which I omitted form the example and shouldn't 
> have TITAN_TOP_GDSC or do you mean MMCX, MXC and MXA are required ?
> 
> I don't believe the clock definitions say that. Also not what you said 
> in the previous cycle.
> 
> I'd be obliged if you could be precise and clear since as you know the 
> PHY as a separate thing is important to release new SoC additions.
I said the same thing in the past as well, Bryan.
https://lore.kernel.org/all/5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com/
I would expect 3 voltage rails for each PHY and a TOP GDSC, so a total 
of 4 power domains. Perhaps, you don't have the access to IPCAT but I 
can confirm that, on X1E80100 platform, the parent of cam_cc_csiphy0_clk 
(and other PHYs) is cam_cc_cphy_rx_clk_src and that depends on mxc, mxa 
and mm for core voltage. And cam_cc_csiphy0_clk (and other PHYs) itself 
is controlled by the GDSC TITAN_TOP.>>>>>> +
>>>>>> +  power-domain-names:
>>>>>> +    items:
>>>>>> +      - const: mmcx
>>>>>> +      - const: mx
>>>>>> +
>>>>>> +  vdda-0p9-supply:
>>>>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>>>>> +
>>>>>> +  vdda-1p2-supply:
>>>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>>>> +
>>>>>> +  ports:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>> +    properties:
>>>>>> +      port@0:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        description: Sensor input. Always present.
>>>>>> +        unevaluatedProperties: false
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +            properties:
>>>>>> +              data-lanes:
>>>>>> +                minItems: 1
>>>>>> +                maxItems: 4
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>> +              remote-endpoint: true
>>>>>> +            required:
>>>>>> +              - data-lanes
>>>>>> +              - remote-endpoint
>>>>>> +
>>>>>> +      port@1:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        description:
>>>>>> +          Second sensor input. When present, indicates DPHY split
>>>>>> mode.
>>>>>> +        unevaluatedProperties: false
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>>> +            unevaluatedProperties: false
>>>>>> +            properties:
>>>>>> +              data-lanes:
>>>>>> +                maxItems: 1
>>>>>> +              clock-lanes:
>>>>>> +                maxItems: 1
>>>>>> +              remote-endpoint: true
>>>>>> +            required:
>>>>>> +              - data-lanes
>>>>>> +              - clock-lanes
>>>>>> +              - remote-endpoint
>>>>>
>>>>> As it's stated above, it should be converted to a single port with two
>>>>> endpoints, it'd be done in accordance to video-interfaces.yaml.
>>>>>
>>>>>> +
>>>>>> +      port@2:
>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>> +        description: Output to CAMSS controller.
>>>>>> +        unevaluatedProperties: false
>>>>>> +
>>>>>> +        properties:
>>>>>> +          endpoint:
>>>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>>>> +            unevaluatedProperties: false
>>>>>> +            properties:
>>>>>> +              remote-endpoint: true
>>>>>> +            required:
>>>>>> +              - remote-endpoint
>>>>>> +
>>>>>> +    required:
>>>>>> +      - port@0
>>>>>> +      - port@2
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +  - "#phy-cells"
>>>>>> +  - clocks
>>>>>> +  - clock-names
>>>>>> +  - interrupts
>>>>>> +  - operating-points-v2
>>>>>> +  - power-domains
>>>>>> +  - power-domain-names
>>>>>> +  - vdda-0p9-supply
>>>>>> +  - vdda-1p2-supply
>>>>>> +  - ports
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>>> +
>>>>>> +    csiphy4: csiphy@ace4000 {
>>>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>>>> +        reg = <0x0ace4000 0x2000>;
>>>>>> +        #phy-cells = <1>;
>>>>>> +
>>>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>>>>> +        clock-names = "core",
>>>>>> +                      "timer";
>>>>>> +
>>>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>>>> +
>>>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>>>> +
>>>>>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>>>>>> +                        <&rpmhpd RPMHPD_MX>;
>>>>>> +        power-domain-names = "mmcx",
>>>>>> +                             "mx";
>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
> 
> Yes the DTSI has TITAN_TOP_GDSC I haven't updated the YAML to capture that.
> 
> So it should be
> 
> top
> mmcx
> mx
Ack.>
> With obviously on mmcx and mx scalable. We established that CSIPHY4 had 
> MXA whereas the other CSIPHYs had MXC in v5 or v4 - can you be clear if 
> you agreeing with that still or saying something different. Per my 
> memory of reading the docs, there was nothing in the clock tree to 
> indicate both MXA and MXC were required for all PHYs.
> 
>>>>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>>>> +
>>>>>> +        ports {
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>> +
>>>>>> +            port@0 {
>>>>>> +                reg = <0>;
>>>>>> +                csiphy0_in_ep: endpoint {
>>>>>> +                    data-lanes = <0 1>;
>>>>>> +                    clock-lanes = <2>;
>>>>>> +                    remote-endpoint = <&sensor_out>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            port@2 {
>>>>>> +                reg = <2>;
>>>>>> +                csiphy0_out_ep: endpoint {
>>>>>> +                    remote-endpoint = <&controller_in>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>> +
>>>>>> +    csiphy_opp_table: opp-table {
>>>>>> +        compatible = "operating-points-v2";
>>>>>> +
>>>>>> +        opp-300000000 {
>>>>>> +            opp-hz = /bits/ 64 <300000000>;
>>> I wonder why you would have only one clock here. You should be setting
>>> the rate for both the core and timer, isn't it?
> 
> Yes the dtsi has it, the example does not. I had pushback from others 
> about the example being too complex - you can't please all of the people 
> all of the time.
> 
> I will drop the full table @ v9
Ok. I noticed that you are setting the rate for the timer clk explicitly 
using 'clk_set_rate'. May be the best way is to control the rate of both 
the clocks with the OPP table itself, with core clk as your anchor that 
is calculated based on the data rate.>
>>>> + required-opps =
>>> <&rpmhpd_opp_low_svs_d1>,
>>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> Same here, it should 3 power domains set.>>> +        };
> 
> Two power domains scaled, one set at least I hope that's what you mean 
> i.e. add the GDSC, already in my code I just didn't add it here as I 
> should have.
> 
> - GDSC enabled
> - MMCX scaled
> - MX scaled
> 
> When MX points to MXA the scaling is a NOP @ rpmhpd_opp_low_svs_d1.
> 
> Agreed ?
Like I clarified in the first comment, I would expect all of mcx, mxa 
and mm to be set by OPP table.>>>>>> +
>>>>>> +        opp-400000000 {
>>>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> Why is one at svs and the other at svs_d1? Shouldn't both be svs?>>>
>>> +        };
>>>>>> +
>>>>>> +        opp-480000000 {
>>>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> And here, both should be svs_l1?>>> +        };
>>>>>> +    };
>>>>>>
>>>>>
>>>>> -- 
>>>>> Best wishes,
>>>>> Vladimir
>>>>
>>>>
>>> Thanks,
>>> Vijay.
>>>
>>
> 
Thanks,
Vijay.

