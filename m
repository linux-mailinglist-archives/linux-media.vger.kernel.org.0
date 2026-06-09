Return-Path: <linux-media+bounces-64329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qN4WOq9rKGoeEAMAu9opvQ
	(envelope-from <linux-media+bounces-64329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:38:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28D663CE6
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cdfxPZ8L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dAD0qzW1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64329-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64329-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1C7030D1ED7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 19:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29FE38B7D4;
	Tue,  9 Jun 2026 19:21:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D440D56B
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 19:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032861; cv=none; b=fOZIGX8kyFHWx524AkFbbI1pD7iAkAGFflfrsg3c6cICePGrjyI/8+bLlwIIGN7/FEd/uyoIre6TjFqrYsWdViLPrt22okz1xSKFOqwXUqAHvwKwJ1XjK/Mj48wURxmQkyMcj6FOaegDlNSMNxsNcy0N0Z35cZfcl55l3P5IMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032861; c=relaxed/simple;
	bh=DMkOdQJsj9Owrfi8I/943gcLvKi2KJWPp4ep4ABr01Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8ilefz+6sbhx+b7wkLpLjZr56noXxXaY8qz3MA2ItRvy4Xjw4gNZijkezTsRVkx2WrUIrRdeEyIT1DXr/7+rAZj28HPg+ZvgV42eAcMESi92lnsSrAo9YZUs2WZhVr+RoncaLbvRnSum6LYv7c0iG1yj4tIbusClseIXxwQWUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdfxPZ8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAD0qzW1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GP0Wx2684251
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 19:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=; b=cdfxPZ8Ly7A4SM9P
	71ksJT0jS9uDaZ2wrd2YFi4o6OkwwiJo8KRAUGtdAvCnAetZBlUDBnEzmaAIIieB
	hPJLr7/UKFfBurcUZ4F9Fr4X3f268F3YEP52JMQBQx2FdZQcYVKDXUX8IMeSs6zH
	kQ0wkTVUd9w4Vb4mYR9wIHn4v5imVIGHWQjQjSPkJOzulX+ZvFR/NwBuSJ3VXHQ1
	TCaruBsEcc1cemtD/RRNhlu5Q5HQwb64wQ6qVKtxn9JOrzXIr4W3b/FedqOK1sGO
	AnoidGzAh7XqO1Ax9pKmtrs5od6abmflzt27c6ZIzCJGNh2AMFtFwdIE0//BahC/
	9xrm6g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenrbcs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 19:20:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ec73b015so11080930eec.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 12:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781032859; x=1781637659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=;
        b=dAD0qzW1+j24QqWDX6t92l4KJadHplURbczHPDUewsazf2G6qgbCUkOjDXFkmrxMLu
         iQ4Xtdv0T3z6jyv96ZGP7T3poVmqi1pQUNAI1iKOAMms1HQMeJ0DlSAzUVKFibgV4Ikz
         HuFisrWJ9NNxw0aP9DvEsyIdCoY9tdv30tkq4TtupvBhYoLx1x9lxoFu6rhrdhTLo7Xa
         uxvzoAUXlvnfdPUo8OfmTYj2fCXzSJu3Cr6fE1n55OKzV7l6wYHcLv6WVQ6+bgtjEWni
         Uxsiiv6mID0sOObq/YgGjj2voNr1qSqXmj3V00nL1g5vigNaewOxI2DfftgZs64GXmJw
         +o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781032859; x=1781637659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny3CGQUHsR6Aa9iprwNBovoybcOVuDeB9t/uu0E5158=;
        b=S2v8sUk2dogYjOFI11mun47yDXdOR4BxrpVwVD76tj74PJywlycAred5b5x93L9b1W
         6CkTdhq5KGZ1UwhKYmHtjwsHfoTTCaohPNXlTE62VnU8BXMKpgtZu6SjlfdcAdmwR5V3
         5A3KyHHs0tR2UZpW9PgRVNKkdx9SKSuELsnlyJaAMphjafEpUGFSjgwzQN1Hc/dfvcGo
         4jnaYzOvuLIsJEMRUBdHKbGh/u8zNZJtgsA3ia5aISgzNpWu9Pk0FTR8LRmETRYU1syY
         BVqbqJNAQLbbC0tvM8GZCuyyrWDE+TGFT3NMgaO82A3jdlfOEjR6IR0Qd1M+q0EKoDs3
         HnXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NWoCwASCIPWBazmdgZnCvy8bbfvRkgCPw9kWMcXPIAuyEnVzn5yb2rLF9FEPKHVAUKsjzLTVW2loLpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcayP/nWXH0DK6JZWE6v4El/CRTrQa/BmV9BghasAsjBFuKCE
	A6qDa+kMIQ4eGqP2aS9USPCDsDJObrEvh/VH8cbztS9lNeHB9heAjaD8i1W4kmjPS+eGc80SR4H
	9oaEO2qjtFz7H5OKnpPn6yiozsm/Q2/Tb4+2t7tuaiANNgvEPTerBMxuEQa7OBV4LRA==
X-Gm-Gg: Acq92OEb38FCs68LPgTGFeT0MlW7n5NPTs5oWL9QNf4SLjdN7LdGgEoWKW6Qwk1t4U2
	k8zVmfpJPF+aO3RBrPZV9V/LAlvFd8jwMbHd/3KDTPvb4hIbejIL8Hog8BO60+aIklvBS4HIVq4
	wlVp086nrptNH9zGeg0qt+13mq1Cc/A4HdgWhs0zvC/oQsAtPVQp6qAL2idKdbjYeHcvCg42phh
	Nzm0GYja3E/v0DaO6whiv4RIsoOCNEFoPWkt22EEKaIhvc7tJVejtjouTj5iebxCGR5Z2ELkb/n
	+nvG8DyYtpAPKSDL3TVdGUKvFvcUV3tuo8FeO9db5XrauBc39Rj41/1cocU3eHm7zyYkZMqBYj+
	e+RklhAdECl0gtvpW9PWz+JxlqHr7Rwyyt8sqfO/+OoJTWbOoeqyYpSRlEkqRF4UodaK3q9ktA5
	hVv7XDN20uPbA=
X-Received: by 2002:a05:7300:8b9e:b0:307:d4e7:b16f with SMTP id 5a478bee46e88-307d63171f3mr3318288eec.23.1781032858613;
        Tue, 09 Jun 2026 12:20:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8b9e:b0:307:d4e7:b16f with SMTP id 5a478bee46e88-307d63171f3mr3318260eec.23.1781032858046;
        Tue, 09 Jun 2026 12:20:58 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm22261217eec.17.2026.06.09.12.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 12:20:57 -0700 (PDT)
Message-ID: <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 12:20:56 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ShyyUCXDNs2exLclYBAuWnKOl0YeX8eX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE4MSBTYWx0ZWRfX0EvL0iMaRrv8
 x7bWfV/I9TO/VMxrXMHJqO0OwihvSHyV/VkKF5q2mTNPPq9WGHV1f1DbUfMCVD97tOKFofmcBKr
 docVvDYWWKQx0PafWIaNyKj776M6e0o0rwfNzdTKmVQ/IA77Fro+2zgNY/OMnrHSWP8ARN2oKfD
 84OgbP5MA0bzQfb89WfgufN6VuoF1BsD1OEjYK95xHIWWIEUaOV5S/2sj4ZHknFeKyZm7pFP+CT
 OpLZy3NtV8zoZwWRpVdjrleTrE1rTy97XaUk+WBQBWNqh4Wx8XETQ4YvvPaGCVhdQOolvSNjg+Y
 V7mvkylAQt2F/i9LW/ya5r75VFXzy/oMKVX2+2ZmrYAaDRKVFkoGy8y3uutteqzmLWLzxajF18b
 lv/eI9PKgSO72uRhX+T1p+OBBlCY2DiDIv+XmKqbVYpF5zyLuiUiYrUjk0Q9boc1qGtRLO0t3//
 2PA1WDAFqiYJRFp6EIA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a28679b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qIjKha6TCTV6UgnzlqcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ShyyUCXDNs2exLclYBAuWnKOl0YeX8eX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64329-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B28D663CE6



On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
> On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
>> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>>>>>> described as subnodes, then likely none of power domains are needed
> [...]
> 
>>> CCI is not described as a child of CAMSS, here the situation is different.
>> CCI probably_should_ be a child of CAMSS given the design we are going for here.
> Yes
As of now CCI is an independently usable device to configure any I2C 
slave that is connected to it. If it is to become a child of camss, it 
should be self contained, as it is now, and camss may have to become a 
simple-mfd to make the CCI independently probe-able? In which case, we 
may want to follow the same protocol for all other sub devices like PHY. 
However, if we do not have any requirement to use CCI independently (who 
can confirm this?), probably, we can stick with 
devm_of_platform_populate() model with common resources at the CAMSS TOP 
node and sub-device specific resources (only) in the child devices.

Thanks,
Vijay.

