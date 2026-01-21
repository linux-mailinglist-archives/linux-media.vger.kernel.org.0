Return-Path: <linux-media+bounces-51199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ2SNbSYcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:13:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 460CE5424A
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93F63821556
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023054779B5;
	Wed, 21 Jan 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pmev6n6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Azf0n49b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146A34FF4D
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986089; cv=none; b=L0d8wtBjyxqd/MjRw0XIafadRT5ZgSOOiZrFEWGld3wUNRKQzM2ICkKqwbWEceXwp9BF/+uWzzrle3tZJCLmDzv7pA2mgG5ud37TeCUHgdAvXR6PAOt9qGf6oicQ/e0CWd01wJuWfqNAVr5P01pZ3mEeBkPaNqY6zhTBjKHxPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986089; c=relaxed/simple;
	bh=p67hHN3eBSoS/p33NZM8wnFLXckJJorhSqOLIgrbWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCqQ6qkcbTuspAzrS1N3NXdGg0zABTr0IgtJ1fvGU5KqzsOzzd5UGNzYjCmxKdf/DNR4nfV3otf9tzUWCoP6EcDoAgs7ikdlQvH+CqTEcwE1K3qntc4aloYs5YB1iHBf3CY0lAek7zAf6pFhC8RPY3Az/0cgyMND0lKdBuScoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pmev6n6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Azf0n49b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XKS72938419
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gV6KUdD9yopRatlqicQ0ihTotQ204OcR11BLEZdGv64=; b=Pmev6n6Y8gOVrPCH
	77+NmmFltnyJ3Qac9QjnjWZoWJqN3i1/p8VBTtSonj98+AF8/nJ+nX6XE3kmRD1Z
	wxxkeQDsU4r8kA9q5f16Os67XMI1+8WeQioYb43FPRG14l6sS0lTAcMmzjrY9qwm
	he/4+sguHADk6AOHr9uTIOcxb1BMujXXU5sgnfxzOrNMaXgy0cCw3up5SvCt40Q4
	RprW4maW0a5GBykxOXswNWBwDFAFsujQ4gN9vVyP9ytJf4FhLAjA1khSXd0DeyLX
	CqOaH1WGjUf5aVoyxyBAWWLjIy1kNfEH6vZb54+xhPkRhCFbWKlV4S8DB6C8eq3j
	cInScg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8ghy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:01:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a360b8086so161834526d6.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 01:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768986086; x=1769590886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gV6KUdD9yopRatlqicQ0ihTotQ204OcR11BLEZdGv64=;
        b=Azf0n49bEyoFhgnsAuaJJnhUMr0cCV71mpND3Q8gqKuuJo67KOgpBvDgozlhNqv2DE
         92YzUDt1JhCKjoUCgwdW0jAuLYT23fFauw+6tp96o/zajxEfJPPJqPCk1+Io23VS9tx6
         kbepe8q86UaZarJIGqKHbAKmA3PiipS9UwKOReI9ACzrwU/t5xLCq/jzi6P/lJWxBtGZ
         DzaQRO5c4ZAczBSBoOnmdsP1WVPvrEb50IxkoxRXmSWzFLvzAUXZNfc9dyVWJup8/2U+
         7Mko3sOoMMxOMhmBQ+imT6QOnaYBgYdBRShTyomHQxEqaPjNwollYdkuJPH9qxkb4kdu
         UIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986086; x=1769590886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gV6KUdD9yopRatlqicQ0ihTotQ204OcR11BLEZdGv64=;
        b=w/kllJZde72ABwu4ROy5P+REuELJbajfqWSRjaIzbNrbfJs9FAH2dFt2II39f4Suo8
         5wxoERiE5s29S4pNTTgvAxshinVdZxo10hiDGcmG+SSTWT9sdm/P1UwhKKcaqykvvx+x
         Roj59kVvrU8OntVIv57XvBSVoQV/ZwSzTzto6zKCvr4X2XU/GgCUUFmNPSRi9Gf216dS
         6cwEsEa0oTYLgvV0cY7wtfkZunfB7bKbG00o8FmoVjKEUCFppHqqMRnnbL+YJLvUddAr
         Jd6sNAFUv5CdIKA34W8VIsyUqs/BI3pvHko6yqsl7w+kb1ZXFuuG1LCN98s6gpD02bDj
         0cVA==
X-Gm-Message-State: AOJu0Yx1xgKiXGV7FqRc/BW+I3to7QiY41l4V/WqT53uLkoGo8ZOOyQq
	aqkgnQRib3a48Eftp1erVRdtURTbxEIjtzkkevKFwgpb3J2X/qTgUPWRV6AlWlr8fAeVhl1TTZ+
	4t8nS68uh2MXnBcnr3TSa0tOlrIVFViMZKjQ4D4SM4l46HI5OUup+64TLQjreLwX6Rg==
X-Gm-Gg: AZuq6aIksrLRV8+VZhSNf1227YErIk22eyw2rOITcCq/hC/J+tCkzu9bLvDv9MGc73p
	w1MHILDSCqNnVB8ij7iwUpK1emTUghowfGnsdgaHeTMFbdmyPM5f4m4pQwRbPjwkKPa/KS608xs
	GrgizrEhUFnZ98SngIR1iaEtAKgo8NjlceWA/koK5PAuk4lKdFIeoVYB0Cvs2sIQP9D/Vhs/KGY
	m0tI6Vxek7qd8cXhBX7GDsoH+giaqLsXJiaOR8gdmm0WE2EK0PrN6hE2sjXQYhg0t9bdQq80pFa
	BdaECh1UTnVVW3f4pyOfPt8+kQHJeeN2ADKEAsDLizPGhpC7Lv+0FR4QuPokYnXv5K+/suEi/dg
	F3wic51+d53MGFWv1k0nf+1ODNWvCP+DB9mtlWZ/vrf3AJCTkDnd+WY4XzIywcFZcRUcfwCAI
X-Received: by 2002:ad4:5ae8:0:b0:894:6eea:709c with SMTP id 6a1803df08f44-8946eea7214mr36031036d6.8.1768986085978;
        Wed, 21 Jan 2026 01:01:25 -0800 (PST)
X-Received: by 2002:ad4:5ae8:0:b0:894:6eea:709c with SMTP id 6a1803df08f44-8946eea7214mr36030616d6.8.1768986085483;
        Wed, 21 Jan 2026 01:01:25 -0800 (PST)
Received: from [10.111.169.82] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7269277sm1207106585a.43.2026.01.21.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 01:01:24 -0800 (PST)
Message-ID: <7a7405d8-c03f-4c04-94b0-87684fd92316@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 17:01:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: i2c: imx412: fix sensor power-on timing
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
 <20260121-imx412-v4-1-f6bdf83f116b@oss.qualcomm.com>
 <PN3P287MB1829EDDB642D6CFE9FD7EDBC8B96A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <PN3P287MB1829EDDB642D6CFE9FD7EDBC8B96A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=697095e7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Zl9mvTGCJV52_Z5oJLIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 6Q39yMY7iG9shyV0TsIe2jmr533jypAd
X-Proofpoint-ORIG-GUID: 6Q39yMY7iG9shyV0TsIe2jmr533jypAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NSBTYWx0ZWRfX+O6saUFnEBNn
 IltN6Cf4O6fEjntlPD5W3TOvW24ijnVW25cKcLkHOqnWJDxCEiNgPVRMxngVYQQgLxg1y0mep20
 xRqrYb//ve3LMhahEhkVZDoBnNl/UTtXC6jXvsAlOoQ+6xssUxk4cEVjcUxU950Ms97NebPPkSY
 ALTlPlbGOsQw/Sun+lwTdMUAoSu/T2oWbSh1og8RRJhpL1hF6B4hQtcCYCVtZrpv0ijs1/FvHbB
 6ppWvmSZgRyGgvM1cF6YQMvlqBqf8bY2OJ9VucQf5cP82Yd+d+SWnaY8zAuXhdvI7LXXQdiFgmC
 L3yjB9mppBja410++4mjs2Z2/aOL1osTWrNf6o/yP7frMR4wpuTEhrtdjFf3PjsJt6KQhqD2UJ7
 KdLtRzhn3kjjdWp85gjAhOuY3ffNmtve+WZchHI4gJe9wmGcJXq7p3efsB7a5GjVDLIJc9gJrVH
 um1EQ7QB2CZ7mrxg9NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210075
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51199-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 460CE5424A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang,

On 1/21/2026 4:47 PM, Tarang Raval wrote:
> Hi Wenmeng,
> 
>> Assert the reset GPIO before first power up. This avoids a mismatch where
>> the first power up (when the reset GPIO defaults deasserted) differs from
>> subsequent cycles.
>>                                                                                
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/imx412.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>                                                                                
>> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
>> index b3826f80354703b17b416dc233854da3f5736e38..5cb55deb125edb218779b076429f9fff93e11a08 100644
>> --- a/drivers/media/i2c/imx412.c
>> +++ b/drivers/media/i2c/imx412.c
>> @@ -1188,6 +1188,8 @@ static int imx412_probe(struct i2c_client *client)
>>                                                                                
>>          mutex_init(&imx412->mutex);
>>                                                                                
>> +       gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>> +
>                                                                                  
> Just logic needs to be set to high when requesting this GPIO in
> imx412_parse_hw_config.
Thank you for pointing that out.

Thanks,
Wenmeng

