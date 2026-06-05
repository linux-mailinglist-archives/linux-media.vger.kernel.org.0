Return-Path: <linux-media+bounces-63852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NwfJOMI7Imp7UAEAu9opvQ
	(envelope-from <linux-media+bounces-63852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6CF644C81
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:00:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kVE2I4cL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QRGQR+QG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63852-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63852-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE749304138F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 02:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B72727E2;
	Fri,  5 Jun 2026 02:59:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED33B9D98
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 02:59:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628362; cv=none; b=dVVCp1WsGuxOWsnHNxBf9ajGsvOHaOPO7wdiLsyxKLMPr4FWKJXy0zaAijd+ze9a+nC6M7pYjRT2sUwU7SHq2rTFbv9JKkSF0qJzUyrsG1lYApOTtj5ZZS7Ev+85ypw8u3czUwIFc8k3IiYrzMddypLAmDpIXXNfTmn/YOrxuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628362; c=relaxed/simple;
	bh=VOucmpp7u0ZahopuZiU68ypHeYHXw+R6ma8WFhPcgXY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C7LJ/v7CRfxyMQ4apCxy7M7I+EBhk9OzFpeT4apjRScQ/lp2iNLrmim1LN5wBh/VLvFisS+5wSqZAHZzeXBoD3OAp0mz894J08fqBIyW/ttpa0QQtXJ7EL/T29bxcRJt9kGfu51Pk0OaubCIZbh6xjyrsszJFuO/+udkcT3/UKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVE2I4cL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRGQR+QG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654IQBP41813872
	for <linux-media@vger.kernel.org>; Fri, 5 Jun 2026 02:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=; b=kVE2I4cL476C5EbE
	kBXhNsOXQjV40efQ6pAErLTepAj8WF/3btyLp3wTm/aQk7qPsoUh4EzBMT6RKM0U
	YOTp4WdPF3e6GyLyoaXDWVM5TLpECbWVhfTz3krXC6kIMTCeA9mkfSxTSrKhsTXq
	6PxLAxW1iFlJODMDNaNJTOhJeHVmWEvLtxQEu9QETyW5scTkmyZvq3S3VwspbCvR
	7j4kEFAbSZz7SRfEAF7g5hz25C+IvGcpLWPBF9dKbMnhmbRs5BWcSgVNWaH5XXjE
	g+b1FfKF9fLyXhK5QCOVSX3Q8ElNHRZA1GCpaM6AvIbEBpI+rPTInvovytJhXqri
	5E/9ww==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eken01tp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 02:59:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3074d4102a9so916346eec.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780628355; x=1781233155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=;
        b=QRGQR+QGrFbw3gP0rq1W0b+yDWgnFeVSh9y893OkPK7YzNFrdQLp0zF5Ignl1jejBg
         jSI0cZ1oYJQunNGSPVXHcrLK37hC38EQBnacS1nMI9OqHriDRXQeUd4Vke5siPXILq93
         yz5LtQQIgnkHNI3iLTwpRUcn/6We0bh0vR0mTVkE5lPO8E+sD884O3iFF7FEEcXeoqqI
         cMsg4Q8y9p32ng2fOcoy+4kYkuA4GJd1M1wRYtLfuP3WbeNPUYLgKij1lx4873uDfsbF
         KVDxXui7PNjaWCuCi3ZAm5Yxx1tfsUSmuY+rRPGRJsTr/ct6+XJak6vnlgn9FyPvJK4p
         VgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780628355; x=1781233155;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAdx1Eq9kdE+KZ8PMnuzkZszkmDD5iaQbJxqQjTed+Q=;
        b=ldnHbTZxLrcAdgCtoMeoAecBdYxX/1NKSx20afiy884CxKt2gP/7/2AtDrVPh96cQt
         kwnpB8gqOqSIUmOl/HcJNNxSIV5a6gt/C+VSFZdEIptnnSvA5fr2LVuvUcuJZ3zgv7cw
         fZ5CdJEHnDe9R/oXhgjuGfNI2cB6oxdzEn72B9uHjNSt9I68oKq83ohhwlVwWY2vksDH
         JAJqZ6mC2GPun+gCQgdqo+HfnZIEbseMkG/2UidosXOsM+y5ZOeBBPyXnxw7lnWSG4K1
         p//VjUR7F9YvYV8B+PH/aFHSea/WwyEZXvHdkCdbXtOegznWObuueWCFgeLKTVeXvBh7
         pG8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ysiNbme9JaRJk83t+p0W6CCpqx5hW7IVW9DSdC5XSHE5+kX9y3xBJ97Zq5cffLYOyCFomvhJDCnG3UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqv11/DuxJo4/yhWmLt0pM5ILFXJtx/92DN4Ov8z352ysZCPkA
	STSfiL/kxb3rjx9csCU6G9ntes+8xRfuf2K8xEc7qcgmVjdoP1+ycBH9GaYp5IrecW3Dxlu0nFp
	kPTvfGGwxlDX3Tu80VziDFeSqbnnZENjVpl6p4kMgPiGn859ZHtOD8QYPNnvPxi4e2e7kMIEFbQ
	==
X-Gm-Gg: Acq92OFzKcQiRlTVY5+R8hGqHliKFjnq5esNRcFM7QyHSk4cOSF+ISTTT0ZPEs3rwNV
	1wxvZAs8h2Fdepcq5WE/lkdxwbfq3+aVdpzfQPripl9YGTgpYF+auimU1iIXJhq6PV6rcrOtS+r
	0UKDBds4d3SrVJtvIeIxBHUQ23p/pGXtIvMZegTxHOvDbxouhplWu8Dlv1U4slA2iULawVdDy2b
	Bkheyf8hzyExEIZG9GOCWB/Gnpu6mwclu2qmfQa5XbGHHgjx/uX01ZXdbs0qvPRn/AC8lArLP2y
	6VFVsz5EsLo2jHomDHfnIOOUsVTGkK6e0mRIeCVrpX6LzEzhyTeFlJZLWbd7rey/9MHEUkvAP/H
	+Z5+MNdTWehehmzeMy0uEkbYpOCCPn3jyqPbt04soSmwcCnPkqGbVhZPCPKwT
X-Received: by 2002:a05:7300:3250:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-3077aea9ef1mr834974eec.8.1780628354820;
        Thu, 04 Jun 2026 19:59:14 -0700 (PDT)
X-Received: by 2002:a05:7300:3250:b0:2f5:5dd3:1fd8 with SMTP id 5a478bee46e88-3077aea9ef1mr834955eec.8.1780628354259;
        Thu, 04 Jun 2026 19:59:14 -0700 (PDT)
Received: from [192.168.1.57] ([76.86.21.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm7105120eec.29.2026.06.04.19.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 19:59:13 -0700 (PDT)
Message-ID: <1433c48a-5df4-40a7-80ab-348caea588cd@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 19:59:11 -0700
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
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAyNiBTYWx0ZWRfX2XZBsbBZ5Xw+
 ZTFSflxgMI3j61WUfOt2lrvpDZocm6nDiHqVvqyZ86ZtEurBgtXhGu2Jf4qLlmZIUMaxykOHxzD
 MhGkrZR09YFsxqbF60NGaHvLZ/U+0bToHUhy7u36YQaXKFGb4KttOkBbjenUa5dVrptBaO2Qrm8
 69FAoRhzVVx37k2pvTHlZmjf8rsPZS7gyWs0emaqexnsf6lTHcuu1TrMI1qNT516zem68CjlIe9
 UGFq+WT39OXxw97fCcrED/GBtJ5lo6beTMmviSnUWbEFh1i+GMDQPIJ3YZC+khakBrxHZ6coxgR
 cQhK/8hUwtJBxxuBxxjbfT14VCVeImUsSi1yA++LzuoDDLX6lEIFyk21pgbQ7UcMptNkVfl505A
 a6ruJi993HkvbCGpjFamVgfRv0uQs3GkYX9HoWgdB+dv6x9+KHsnDlLLau17pZh2DJfw15447xM
 JvanTURvKYz8WKg3YEw==
X-Proofpoint-ORIG-GUID: WFCGpRLVA7BEvqusMQja3rWrw7qguUqT
X-Proofpoint-GUID: WFCGpRLVA7BEvqusMQja3rWrw7qguUqT
X-Authority-Analysis: v=2.4 cv=B96JFutM c=1 sm=1 tr=0 ts=6a223b83 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=0jxUCcn++d1AQalQnBt6jA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e2-Id0N-X15YFAlKe_oA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63852-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3E6CF644C81

Hi Bryan,

On 6/3/2026 2:46 PM, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 2:18 PM, Bryan O'Donoghue wrote:
>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>>> described as subnodes, then likely none of power domains are needed 
>>> to be
>>> repeatedly described in the children device nodes, since this 
>>> information
>>> can be obtained from the parent device by the driver.
>>>
>>> Technically 'power-domains' property can be safely removed, I believe.
>>
>> The policy is to describe the power-domain dependency fully since DT 
>> describes hardware not software architecture.
>>
>> Also for a very practical reason a sub-devices can probe/run 
>> asynchronously of the parent device being active so in fact we do need 
>> to describe the PDs fully.
> This makes me think. When the PHY devices are made the sub nodes of the 
> top camss node eventually, we can discuss for somethings to be avoided 
> in each child, which we can come to later but for now, you need to add 
> the top AHB clock as well in the PHY node, Bryan.>
Sorry, scratch this comment. You are indeed making PHYs as sub nodes to 
the top CAMSS and not independent nodes like CCI.Just looked at your DTS 
series and realized. I will let the discussion about enumerating TOP 
resources in every child node continue in the other thread. Thanks.>> ---
>> bod
> Thanks,
> Vijay.

Thanks,
Vijay.

