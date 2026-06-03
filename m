Return-Path: <linux-media+bounces-63661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RhjxNiiOIGoY5AAAu9opvQ
	(envelope-from <linux-media+bounces-63661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:27:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB663B1D3
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZgTwajg/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WiX5KYR6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63661-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63661-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C9A303E4E8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823818871F;
	Wed,  3 Jun 2026 20:24:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAC383C84
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 20:24:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518247; cv=none; b=hW6R+3CuwagV+yKgYSWyrGXGpk7L2+GsIt8OS9+KeMUSqu4SXdfb+qNPtSOLTkGS25rnn5o+6Xhl0G0qjpObQvrR7/Ohbt2ggsVKzh+NDrsAYremHATFgfSum7eJ6ry9CkUGPTmV33ALQj2CPp5SmCRym1uAGNKDtqgUS/CsR9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518247; c=relaxed/simple;
	bh=dgtu2Iep90AeJho7vMivN6OvXTJk+BhD2v7PAhpGkIg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OG2sFuFizLG2PfDAWjpjqwbQiYsON4ceJhmKbwHEatj/ewmnOho+V6VJDzMEcUqLhErAl71UAZkfaa0tindUtxzHzrcKXUU8FGbBg2cLtkjd10d7SJa3p2+11oxWMLgLrvS5X3n9pqqxhPqaD944CLoNiLQGAO+8Fu1OcRdfbOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgTwajg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WiX5KYR6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653I6YKh1993483
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 20:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWKiZt685wkb/zfGIBJDwQedq36r3+vpvu2k4QjMlOk=; b=ZgTwajg/k6/NXcl5
	Jh7W5QBbjK2qrecULXUDS+r6jBiSw8aK7pDApPY1n4bvPmXEBslrlf5CRCZZt9+g
	0tXjQuozplc4kDS+slqv0spJotxMuCA4vPY8XnnaWY1KNqy93lB/ii0rTgWaF+sT
	Lph3lvD/EfleSjNG+GNK9C1sjKxJwQqBpZHyflu7cbhPVuxeg2fiXGFDxdNK4RAz
	QCfQT2kQ/eG2CmvffyM349GQokYMOXhrqXRTaWH3rKCrksk8zdlGshnIDox05ZKM
	x/V4dtspwDrtvSW76kPSzdtWmQvfqwJTEUNXvsmIG3QO+MG5SbmDBrLyydMXpn9R
	3rmFXw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8prgd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 20:24:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304ea1eea05so17576022eec.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780518244; x=1781123044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWKiZt685wkb/zfGIBJDwQedq36r3+vpvu2k4QjMlOk=;
        b=WiX5KYR6TKWj8pRDoBzzWa58RQCRuyIRp31v/Br1t+TZpnmFXsBi2TF6g/KcK3g7po
         gctMB2wLJ4V6BqSet22N/DT6A2PwvLNgNLZYY09Uhxalyoso76fHyIC5kQhP1P0Xarkz
         uBQ2WIqraq/R7E5kOJcghwiWge3/HeO801JQ52RAv2YieRWjGZ3D/89muzUBfNnPya4R
         6cx9KbeOQ9fnD3JOKNRI+rWCz2eaxfOLfX7Vsm926nG4xOYFpbR4lHtlNLHz3YM983mt
         rWAnlBPm6EVAl9m7s6ADbMVKok7uVh6r0AFLa+IL6xw4BkXgtm4ABkN64QNDVkr9AHdx
         Z8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780518244; x=1781123044;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWKiZt685wkb/zfGIBJDwQedq36r3+vpvu2k4QjMlOk=;
        b=EpK/b4+lubVXYXk7Wt3o3IosB3YE78sf5lTUeYu2cW0GscSla5XnzUVt+X8c5V7xiM
         1PYnYXp2hlQdqGEnu754xJso4xK6LPVqewrUwPpl9wgWtF2A3BfQM6oMojlCOkgWyxyg
         wCeTBKyCXfkONHtNj51XP/bwIVir5cJ8jbOvVTu/DFkG2Hdgfef8zxRhF4JSL6N4/LHc
         FNg9uQNINuqRubgiQA8TowyM45jbnFT3u2QTc+W/Rf5mKp1jp8VYdREgeLSfm/Oy3drO
         +Rj+5q7S305jmj5Zogvs1qh3mn9PezIiN8zXVqjwIPuzWA/Z8GL32M0OGpekdnLq86fi
         rD6A==
X-Forwarded-Encrypted: i=1; AFNElJ9Lgh7pvOOC97FpYd9fH7hFX4Leq9DMduHSfiHqzKLvfa7MM6gph2Au4doZEJpoArsXYKNk/6GLIWSljQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0qCpDQWKW44DAWJzQx8++NEyR2iGkrLLxMl7n6ITmLu4tUPh
	RhNXeBA6Igqgkv5FApE1fOcKlTn3lUQxT2Nm3XzuGJJQMLVHMvVzDpF7vaWj4mTEaXOmpcCn0RO
	QSPNp2w5ejC5lagX+CAvJG40yr8kEj2+AZqEurbBkO9tpUVOIZLb2zKsmSb26lzP6cQ==
X-Gm-Gg: Acq92OG8hpFhyak8De/N523rRSENDIXGg5W3QzxiAjeLk2F7fdP1G0opEE4f+Nj47yj
	n4f0Y8Rh1RZIF6oPi2GFZHQdFsIyet8zK4A7SO+NRJWxaYx/bVXa84aeIfwXCasbfcfxkxlVU11
	dA0cRLYLc+eAouk0FgoZ+Ht2RUq2BOxWX0Gz0aSFDMdnCGcEOnXwLuDRzypyH8NjF4n/dO6K0A2
	9+jk2ABPILlUUNbQKJ5/8igaZUuwRDMv/OO9RUyhPpApQl64rRrl8orx6l68bFVyIoDLKZWHxOu
	01f7KvDsPhgM91NDd2gJU/D+V/5qj3aeJy8YGv+r019tabRr6MUGSnzEtgXmby2QrC6fiecDOBj
	o3yblKw4Smm9+dVKbHt5PfX64UX7MK3N91b77u6XGDJ1WnAIrzMAzIqzJOEV16FMa/EuRl3jKff
	ZrZe8gicXwQ70=
X-Received: by 2002:a05:7300:2142:b0:304:630d:e4c4 with SMTP id 5a478bee46e88-3074fab7663mr2659626eec.10.1780518244120;
        Wed, 03 Jun 2026 13:24:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2142:b0:304:630d:e4c4 with SMTP id 5a478bee46e88-3074fab7663mr2659592eec.10.1780518243493;
        Wed, 03 Jun 2026 13:24:03 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm4306900eec.23.2026.06.03.13.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:24:02 -0700 (PDT)
Message-ID: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 13:24:01 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nHG7twdA3PZ5q0NlPquR6VQDYRSL8ZuU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE5OCBTYWx0ZWRfXwefw2y8gpm8p
 v81FdD7pJmZK0QJeVDkwIm74l3diXN/lr2OVyEi1JGfvMWiukwkqVbNmedYewOf3ulrSwwmK3de
 s5mXnxApOsALFp6yuM7koQLS8L1LheXVEmoPuEmKl1ogL1U20XZo6UiZ5K2KQGZo2RqxRNkSeST
 HQwxURv9FbgADPBFMATs3KUBovfROD3OgwPTcH46KucrXRuwyGDXQWfPJa8gdaGZnuigSGU3OrG
 wvkr2hlzOLbfJubS26+jrpfuUIh7VBoWp7mkyXG7M2o7BO99TqT9whw9lTgX+7FRDU4mDKTEELT
 ryxeRyDbX5LwNuiQ38WzPk3ihURpzyUgAn/8IvIjsJDeuyv/HwXUMRpP/YaHT7Gri/LbHhvOWwO
 HDLhEUl4woMjF9NoLKzonGG+bvjmAkokTyme2Ct3r5sVkfDYFN0Yax17VNfDKyG2PeJ2NrFBDke
 bDr3xfDfkhZRkPi2ykw==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a208d65 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=Lt2A_MVf5n7MuNHE5loA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nHG7twdA3PZ5q0NlPquR6VQDYRSL8ZuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63661-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDCB663B1D3



On 6/3/2026 1:16 PM, Vijay Kumar Tumati wrote:
> Hi,
> 
> On 6/2/2026 3:51 PM, Bryan O'Donoghue wrote:
>> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>>> Add a base schema initially compatible with x1e80100 to describe 
>>>> MIPI CSI2
>>>> PHY devices.
>>>>
>>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>>
>>>> The schema here defines three ports:
>>>>
>>>> port@0:
>>>>       The first input port where a sensor is always required.
>>>>
>>>> port@1:
>>>>       A second optional input port which if present implies DPHY 
>>>> split-mode.
>>>>
>>>> port@2:
>>>>       A third always required output port which connects to the 
>>>> controller.
>>>>
>>>
>>> This port numeration is imperfect, because port@0 and port@2 are 
>>> required,
>>> while middle port@1 is optional.
>>>
>>> Like it was stated before a number of times, it seems natural to operate
>>> with two ports, where input port may have two endpoints rather than 3 
>>> ports,
>>> also that approach solves the problem of a hole in the port numeration.
>>
>> Can you confirm this is what you are after ?
>>
>> port@0 {
>>      #address-cells = <1>;
>>      #size-cells = <0>;
>>
>>      endpoint@0 {              /* primary sensor */
>>          reg = <0>;
>>          data-lanes = <0 1 2 3>;
>>          remote-endpoint = <&sensor0_out>;
>>      };
>>
>>      endpoint@1 {              /* split-mode second sensor, optional */
>>          reg = <1>;
>>          data-lanes = <0>;
>>          remote-endpoint = <&sensor1_out>;
>>      };
>> };
>>
>> port@1 {                     /* output to CAMSS, was port@2 */
>>      endpoint { remote-endpoint = <&controller_in>; };
>> };
>>
>> This works for me BTW.
> Either way, do we need to document the constraint of using port@0 or 
> endpoint@0 'only' for the 4+1 or 2+1 mode and the other one is for the 
> 1+1 mode? Or is it implicit from this bindings for a developer?>
>>>> The CSIPHY devices have their own pinouts on the SoC as well as 
>>>> their own
>>>> individual voltage rails.
>>>>
>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>> CSIPHY devices as individual nodes.
>>>>
>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>
>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>> 2. The ability to require those voltage.
>>>>
>>>> We have had a complete bodge upstream for this where a single set of
>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>
>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI 
>>>> bus in
>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 ++++++++ 
>>>> + ++++++++++++
>>>>    1 file changed, 209 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100- 
>>>> csi2-phy.yaml
>>>> new file mode 100644
>>>> index 0000000000000..270375f949880
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>> @@ -0,0 +1,209 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm CSI2 PHY
>>>> +
>>>> +maintainers:
>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>> +
>>>> +description:
>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI 
>>>> CSI2 sensors
>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and 
>>>> D-PHY
>>>> +  modes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,x1e80100-csi2-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 1
>>>> +    description:
>>>> +      The single cell specifies the PHY operating mode.
>>>
>>> #phy-cells should be 0, because the PHY operating mode is well defined
>>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY 
>>> type.
>>
>> Rob said consumer but, I'm also not very bothered about that. bus-type 
>> is perfectly acceptable to me.
>>
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: timer
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  operating-points-v2:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description: MMCX voltage rail
>>>> +      - description: MXC or MXA voltage rail
>>>
>>> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
>>> the case that "MXC or MXA voltage rail" should be specified, it'd be
>>> just one of two or both.
>>
>> Hmm. I'm not being clear here if this is your take, I will reword it 
>> to make it clearer this generation of PHY _must_ have either
>>
>> - MMCX and MXC
>> or
>> - MMCX and MXA
> I am not sure of this, Bryan. If you look at the PHY core clock 
> separately, sure, that is correct. But all of them, on this platform as 
> well, share the RCG, which requires all 3 power domains. So 
> fundamentally, you need to enable all of those from each PHY. You can 
> make it constant 3 power domains.>
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: mmcx
>>>> +      - const: mx
>>>> +
>>>> +  vdda-0p9-supply:
>>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>>> +
>>>> +  vdda-1p2-supply:
>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        description: Sensor input. Always present.
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>> +              remote-endpoint: true
>>>> +            required:
>>>> +              - data-lanes
>>>> +              - remote-endpoint
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        description:
>>>> +          Second sensor input. When present, indicates DPHY split 
>>>> mode.
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                maxItems: 1
>>>> +              clock-lanes:
>>>> +                maxItems: 1
>>>> +              remote-endpoint: true
>>>> +            required:
>>>> +              - data-lanes
>>>> +              - clock-lanes
>>>> +              - remote-endpoint
>>>
>>> As it's stated above, it should be converted to a single port with two
>>> endpoints, it'd be done in accordance to video-interfaces.yaml.
>>>
>>>> +
>>>> +      port@2:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        description: Output to CAMSS controller.
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>> +            unevaluatedProperties: false
>>>> +            properties:
>>>> +              remote-endpoint: true
>>>> +            required:
>>>> +              - remote-endpoint
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>> +      - port@2
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - "#phy-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - operating-points-v2
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - vdda-0p9-supply
>>>> +  - vdda-1p2-supply
>>>> +  - ports
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +
>>>> +    csiphy4: csiphy@ace4000 {
>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>> +        reg = <0x0ace4000 0x2000>;
>>>> +        #phy-cells = <1>;
>>>> +
>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>>> +        clock-names = "core",
>>>> +                      "timer";
>>>> +
>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>> +
>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>>>> +                        <&rpmhpd RPMHPD_MX>;
>>>> +        power-domain-names = "mmcx",
>>>> +                             "mx";
Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>> +
>>>> +        ports {
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            port@0 {
>>>> +                reg = <0>;
>>>> +                csiphy0_in_ep: endpoint {
>>>> +                    data-lanes = <0 1>;
>>>> +                    clock-lanes = <2>;
>>>> +                    remote-endpoint = <&sensor_out>;
>>>> +                };
>>>> +            };
>>>> +
>>>> +            port@2 {
>>>> +                reg = <2>;
>>>> +                csiphy0_out_ep: endpoint {
>>>> +                    remote-endpoint = <&controller_in>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>>> +    csiphy_opp_table: opp-table {
>>>> +        compatible = "operating-points-v2";
>>>> +
>>>> +        opp-300000000 {
>>>> +            opp-hz = /bits/ 64 <300000000>;
> I wonder why you would have only one clock here. You should be setting 
> the rate for both the core and timer, isn't it?>>> + required-opps = 
> <&rpmhpd_opp_low_svs_d1>,
>>>> +                            <&rpmhpd_opp_low_svs_d1>;
> Same here, it should 3 power domains set.>>> +        };
>>>> +
>>>> +        opp-400000000 {
>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>> +                            <&rpmhpd_opp_low_svs_d1>;
> Why is one at svs and the other at svs_d1? Shouldn't both be svs?>>> 
> +        };
>>>> +
>>>> +        opp-480000000 {
>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>> +                            <&rpmhpd_opp_low_svs_d1>;
> And here, both should be svs_l1?>>> +        };
>>>> +    };
>>>>
>>>
>>> -- 
>>> Best wishes,
>>> Vladimir
>>
>>
> Thanks,
> Vijay.
> 


