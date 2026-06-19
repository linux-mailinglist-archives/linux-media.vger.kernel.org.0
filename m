Return-Path: <linux-media+bounces-65283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uq71FjI4NWqGpAYAu9opvQ
	(envelope-from <linux-media+bounces-65283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A22206A5CFB
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:38:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ebjtth9s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kiSap0W7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65283-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65283-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABEC6301E21F
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E52374E5A;
	Fri, 19 Jun 2026 12:37:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A7379EF7
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872677; cv=none; b=kCbMwOFDk35vc8W70CcbzaQgyKkCaDPxVY0+ARrXPqr00t06YhoKxCEhoLO6xAka/6AhCvgrKeLhqSu86iQR1VdqotOht+hBwr3Dq7pNjxJf3ZyUpNq02Zsq+JKjLvoQaMdZmnhH2XZWAZUXhdh4YBf6pJMtsdljGzGIId2PxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872677; c=relaxed/simple;
	bh=s91aBWIbD5YVObth9ob5saZK1S2OG/vt+ArfeoMThIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgP9fXuql7J6pwMt8ONtqXBXorkYkd10yfdHaeB/GK9x4TOfubZ0gKjKVaq+E/X2Emwcx/eeXQA8n7UDVaNQl7pZmHBMLFgSI/Xp6HsGvVDo0f2WxPTgMAhFGrnz+ISJ9dV6oF9M86cjjiv2jaKkuuRx96FvpsaakaOneDRwGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebjtth9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiSap0W7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JCN6j91753269
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=; b=Ebjtth9s941BEZx5
	94uCJeh2tCqjIeQZz1ptplBLLg/0C18wtKYH7CNSAv5Y2KS+9HIj/hsNZLDbEnTh
	UWj12zNl8PYpSLYhCkSm01nMWaj7Wrz5a6A2YbKAGhHZu2rjdCgG2NT/M7ZT/WNd
	nNXJniWFlXsobOK6ZXZbDxdzU6p78wpN7sMtux6OfOAC/XR1TEOFT7hq+w1LMSsu
	ATyJ4rrTpbTQtcIz8jKoq1ZXfyClgBQbEoTil+A46vmCm3qo5S4EkiPpcPuUA67Z
	6DHrp13/bOmCMMHDRaX8uiEDjnC31OxgSIACuTBXM9MsKVf0Dt9g5KVp3GA1GIaS
	VkLgcw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5qs8173-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 12:37:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-72845b7072aso126677137.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781872675; x=1782477475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=kiSap0W7bQ9+E6ISbdEUAnoxVz5Z0cJ4ILlcZsVambwDCZ1BBYmRQFP2eWhP7eFVR/
         t5qz6+x1DlCErasX5xIrnZIAxgfHE19957bPBektb9Ig0dnnTQSFyqhPqCkQKdpKTjdE
         vSO1xpLHwfKbjOJx9ySVG4I8VGtkO6gM1E6WCLH6TbJvPzAj4vM9aEV+W/axIM/GuXrQ
         qJHENtgv/ZF3PGyl5aSd/Rj9owiGyLv/zjv8W7JG48VKHHgWToV2tvo0CM/eJJD7zVZP
         FUGPrMgBK8fXBqWb/zoG+1coKfpjaLtrBWB/pa+2GKjrgg+pfpFRxleqwiJpXqFC/x9l
         cIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781872675; x=1782477475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH+KT6o+4/EXGYtJ8mk55q/zmuMFzZSdiVFyox+CC2o=;
        b=iV3gNFtM93hp9vKwsFggOVvyOykxigFoLbrtr2fA0m8fEC4MoD5TwxaRdb2UM8hRha
         6mI7BYJr4K8x874LWjFs8sagTG4W14JaMFlu6fSbLJJrt3fbry/B6ZsY7OuA97MzJDUM
         DROJhY072m1MpewD1QY4WfplwHO8UY7BTY80wtepit5pBvC/n1P4uK4PdB8p4SIPb+Gk
         jqVAETVBDaGckEFonepy8y3IanTDyZWu4vTPL60kJ8zHcUFjGrpBM+oGbUhkw/B2X1nH
         TsnJ02O6Lda6utlcGPtTLjTm6aJYI/bobHvgIYm+HltWEX0EHuIhoMxRc3odXPDDIWRk
         vMmw==
X-Forwarded-Encrypted: i=1; AFNElJ9XdYyZomuAw2SUB5XNnBagC9DfUeQrhA4IUVeXKP5I9kyh94Me6rU776/YcLEpFBv690BmY+aX7gmwIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjVr8Fe3ghbSKFiIFCUv66eVkpL82nOpUDRBi94QRPohnf1OD
	XBWNGF2X40I4jVSBTzG3pJQbnhQykMA2wkeV+d1/buZKfKhV0aGXfOC06oecVlYZ/kLb8ni96jn
	hvm3qx9vizum1dCBobq6kNno+Xr4UKf6BJcoIsdWApmoKgMfKgVfx2FbyeHGCxehgCA==
X-Gm-Gg: AfdE7cm34wq630idRGxhIusC6Vo0Z/14ZCTiDGCsWQsBGIfSCVwLlnPMK5uc4Kj0C6n
	FHRDluvCTI/o8YVf8uYqpmqKx8ydyLQNH7Oobvo9RbZbE2TGabd7WQ956J0/BYz+Wrep60zDajE
	prqEHzLyKdpBfd2clLX7knMu+izXQ9uW19octZxr3Hvz+Mixn+x1QdY+P4zFh84vee/LsAYUkzQ
	7WyzvEJFeY9JCl0gUnwmMBlOuI0L8jy9HDJTKqAKfZnNzuKDGicsrCMTLsJj9o4bjZEYVLyxuc3
	epWA9ZLINfe8Okz+zEKpT5COG8gTAtbemP9BS6KFk2s3dX8/HXqa6CcrREl4ENdl3CfRhiazLMv
	oe1+Bb0tlTx1Zb2CwolryPOBgJu66jKkWwtA=
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809972137.3.1781872675122;
        Fri, 19 Jun 2026 05:37:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:632:509b:e399 with SMTP id ada2fe7eead31-72a03b8d80bmr809953137.3.1781872674575;
        Fri, 19 Jun 2026 05:37:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm84124066b.51.2026.06.19.05.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:37:53 -0700 (PDT)
Message-ID: <d1437b71-402c-44ec-a193-8296016575e2@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 14:37:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
 <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
 <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfX4VYKmXcFG2cI
 dChuNxyxg87BQOa77Ls17B5737a1SCAhdGBn7Gg7B7qxsYkMde/oF4YisV/8G2nwzRq62ohJwvs
 rqKuS9jHbA1kiItKbgXb9xCNTVH6gkeFMoTYVjwE2avweCdeVCaUJVn/LfX4WEOJv0UEkZp0vSw
 G+e1+lkkPKd6Drkn0IGiLPNI/vPYPEBmMlGsZLeRktZnJkEe6olgyAynGlu/pq1vOzBk88BxeXc
 tIPuGpg1s7fqb67sjnunPqFb07hHcY9QZBqJYeOW+5/XS8UDMCdRDG02o9TXxMohYgZiMD6+JmD
 dJdsdNZIqmpGxkUREAxOl9nNtwL/u2YlPKUa2AAzaPqK7JScSOFU6WQjD83xNNmTvaL5lcSqb/z
 ZkUCJYOWX9Gk4css8gRHpK9DkmISwQUyKFJsLPZ7FHSGZTZp8A/wb8T6rj8dxIfu7F1PTf4GPLs
 JFhR1WYpNskIwFdH0eQ==
X-Authority-Analysis: v=2.4 cv=M9R97Sws c=1 sm=1 tr=0 ts=6a353824 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xgdi4esuw1k_wJbNTHEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: iruICYhXt4VEcgxSjM4x0oUHOCLZmgdK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExOCBTYWx0ZWRfXxYMugulfzc68
 ORSA8Cu7u2mevcF2tKyfaORh6Ow1qwA5EajVBJ/l1wXdFVYucKXXY4R5VybKp7M8Bl1Y0ezMu07
 Rau2DJaTT2WYZKxGbMMtb90cjhinPLc=
X-Proofpoint-GUID: iruICYhXt4VEcgxSjM4x0oUHOCLZmgdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65283-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A22206A5CFB

On 6/10/26 12:30 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 12:20:56PM -0700, Vijay Kumar Tumati wrote:
>>
>>
>> On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
>>> On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>>>>> described as subnodes, then likely none of power domains are needed
>>> [...]
>>>
>>>>> CCI is not described as a child of CAMSS, here the situation is different.
>>>> CCI probably_should_ be a child of CAMSS given the design we are going for here.
>>> Yes
>> As of now CCI is an independently usable device to configure any I2C slave
>> that is connected to it. If it is to become a child of camss, it should be
>> self contained, as it is now, and camss may have to become a simple-mfd to
>> make the CCI independently probe-able? In which case, we may want to follow
>> the same protocol for all other sub devices like PHY. However, if we do not
>> have any requirement to use CCI independently (who can confirm this?),
> 
> Uno-Q uses CCI as a semi-independent i2c controller. There can be other
> similar designs.

CCI still physically lies within the camera subsystem and needs both the
TOP_GDSC and the AHB/CPAS clocks to be on.

devm_of_platform_populate() will ensure that subdevices will be probed.
simple-mfd is essentially a hack/shortcut to call that function for nodes
which aren't bound to drivers (e.g. because they represent something
without a top-level software interface, which is rarely true and why it
seems to be discouraged)

Konrad

