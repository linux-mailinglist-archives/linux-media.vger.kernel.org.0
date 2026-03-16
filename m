Return-Path: <linux-media+bounces-55956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJYBACNGuGmLbAEAu9opvQ
	(envelope-from <linux-media+bounces-55956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:04:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27329EC07
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A212E3070909
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD6F33F361;
	Mon, 16 Mar 2026 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3JbbJl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzHFExOW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBF27B34F
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684183; cv=none; b=X2E65wv/bRBCS2DE4o+/QLO0di7WXMO3mfSBeG3KW7mFeSgOOJ6a8D631yaYPVeFskf34iYVK0LSfUGQ3BkXEL9asNuv18Mnv4311EmVOLORHiFX9COjZRds1gNkffXq1GSeZb0JQhqNi0PqJYTOsm3E3WtMTxQgM+yQmapOiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684183; c=relaxed/simple;
	bh=foVsK7nMMmhASaq8fWmeVs0sQWwNLIUE11ymwXjj4is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esEMkSDVaBNL1zp4Ho6HjLGwriQASdXkVLmKgXehon1SPqT2QT4+01adgtRuWKkcSnvq/qJTXbefh5vQ9pxM06QN4negMRdhwU2Y1TXKMIQAh8HLS1teC3iDdUMzzvegEbrAGonJ07h0r/d5gRmG0xFhe1cPYy+/ua/bdRSLqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3JbbJl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzHFExOW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjis51428783
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+1ZElOXRArQIK1Uk5qMYFPmyl0owddsonq4f6CJf0U=; b=d3JbbJl8Ze9AXpjE
	cUjkIl+gjKM/Jlz1RFM+MPMe34aLN4ILVJcUvhuvK7VaWXXaCJfAq/iC+5ngzj4L
	fgWGqLXPsRVggZfPsv+G88xl8Y3+dRncxBO6e9VHaz4jZnruG8hA9TGmnrI5lqtx
	GtAjZIcXsxRWfISvh44j2p7FCiKFwIyGjeOTGJGaxM4cvFEl5P+jBrpBa+1s0Obp
	02R7GaawqU4FcLqDtk6LjoL8j5L39PXLL4lwa0ob1+e0xzP9T3ykAo0DzG9EfmoO
	ZDFuG2rlrbIId9u3HIfra8gHLtq0OuyjA14PUMYBZcE9lMIcBzWKbiLhYxEoUIJD
	pRCocw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh999fm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:03:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffcb2bef48so436029137.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773684181; x=1774288981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4+1ZElOXRArQIK1Uk5qMYFPmyl0owddsonq4f6CJf0U=;
        b=DzHFExOWsXQ1Lb89uRt0mrXe6QgvuhZgKEDz2+q2OL1xusDLJkDtnB8wSTGeX6cMeT
         wWl0z9eJZWH2JovD44OSR1MF6acOXBG4I1TJpEwV75V15sSZk7vD3Tr5dcpttX1gfOXK
         Yi4ctTnuGCmaov7v53WwpT/Y/DTJEtddUqAthpCmWlBs6dMvs0InT6xRjNP2cSpE7uC2
         oDAn9S7QMfH8hlwxz2tfcJQh9bC6UEGtoEjVvHlbuXgArjRuo+QQrSVpdnaWXbdJSdPh
         HgSuqWGUkls05Mhi6YkMSvEp/sMXpK4qSCS34BL3e5NyDtQRY2K1mv6nM4+3rJZ44jrD
         5KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684181; x=1774288981;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+1ZElOXRArQIK1Uk5qMYFPmyl0owddsonq4f6CJf0U=;
        b=BoFihqbqG4h/Iw7Dmvn8XXrjbwx/GgCJntUiJ/fVtTdsYPUSsrlDYgg5UQSPiDLgxN
         BU/af5ED/6XZpbo1OVmUh/c+OSOW5nTDStwhSwVWcCIh94zqMDzUEMcKA1Pm7V/8drSy
         9im34fX16egH5TVtOS4KSCIipwjuGc6FOtwA0FUFuQ65V3+p36af3ehjJBou25Jk8ZTm
         /BkVDHe8cz47xCjP+ZFvT3kf2sfbAiWvHpmq7UywT99/RnZYntNIbFRglxMb8GU7mYgw
         +aUclg52eStit8ZB8ccc7jlfyI4wCXg5YRrHz5zVxAzjIjOKwBlewTcvnzzgQg7s4blB
         JAOA==
X-Forwarded-Encrypted: i=1; AJvYcCUI8//VF1YQ1FQoLc47ZJua0GH7V1Y2Wpf/lo4lU/195L5txu2eOgvUE3WnLOlbkVPdIOlcYKmDi+HJ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVePOHdkXEzkTShFcVS9qGB3aQlfFs/YKGXSrMbJ4YfuxpynYC
	i6BuouuS4qQqU9/K/nq70pCdnAdAOWRISUezEpEgeW6hBnC7saxCkoA7LLlncRBYt7T5ApTNjEq
	atrLazacevLpGLMGH7L/jLRqWpyHBcdG68hSRZZ8k98/GMkApsB3uhoEwLb2tm66Z5Q==
X-Gm-Gg: ATEYQzy49fu8UMoXzspeini0VHref22W8oaY1c5rZz6S0btiOOtnaUUEuBfpoRSwA7G
	FBbTtv/r8wF8S210rX4t6tAFqhXSpODZfqVGXivkUygPtMCtW82PyhfjrC2H4atIORwYofPkfA9
	liuHd4eis6CjinTHsBZa1YsczObRp0FdRmwJ+wTesiwpGjH5+27z3M9NPD93t9Gy4GP8RBtrJ8d
	MzR4ROMlVi+jK8K32fh3//sej7q2g/0X4ZVm5jBIFL7gMPRnvDttvd9BUTfECsKuOyNZYYZAjXv
	y5XwxPe4hyyGpJcO9bByPVzAn+5+mLDCmJZGErjtmJQ3NB7l/aa1vXpBNEHynvjY6Li7NZxfCjb
	L7o9TewAFqmYr+Qh5G6dgGXFCMTGDj9bLdTeXsn/Tyq44m31F
X-Received: by 2002:a05:6102:442c:b0:5f5:4d9b:bd67 with SMTP id ada2fe7eead31-6020e160bd3mr4707447137.6.1773684177810;
        Mon, 16 Mar 2026 11:02:57 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:5f5:4d9b:bd67 with SMTP id ada2fe7eead31-6020e160bd3mr4706445137.6.1773684165374;
        Mon, 16 Mar 2026 11:02:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41065f8csm17295129f8f.30.2026.03.16.11.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 11:02:43 -0700 (PDT)
Message-ID: <138cc10a-b30a-4fcc-8401-ed8ac89ac04c@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 19:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint
 properties
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Todor Tomov <todor.too@gmail.com>,
        "Paul J. Murphy"
 <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
        Marco Felsch <kernel@pengutronix.de>, Lubomir Rintel <lkundrak@v3.sk>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260316135352.GA31616@killaraus.ideasonboard.com>
 <a429887b-13f7-4ba3-9260-ddae92adfe51@oss.qualcomm.com>
 <abg7rvczKjyIA5jN@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <abg7rvczKjyIA5jN@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b845d5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6UtKDQ20m5PfihbUhRUA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE0MiBTYWx0ZWRfX8mnErE9Bpvhs
 +1avirb3neJzKcl/ECatoQ4wdfNUecenlHJ8L5pfVX5jDSoO+xpyLVuZIhG2gZBYvYVrRgkud7F
 /0jo7KurCfywmydztIRTF/YaevsA7Nko96Y3tPjR5EVANSG+S2XRYx3Z/6N/W/lh966sKS0RcED
 rkDTUCOLDHHSZaZBImVhR0pf7EQdw0mXwBs8pAUFw/rwZn2z72TyNwT61pIijeCMEuncu9pH+PX
 QE0JZ+iRZbCrNLr/T6XzwevLMeblfUYuYBrItBHQPUk8XoxnDahMjEGgYytfBtuYofu2CnauU6d
 biP26xSj/pSDMr08hWP2KwS/ooFSDj9+KoNrTbUg8yxTR3apsox3Vreg13xBH8dVUeSlWzqlQj9
 +2D6AKTD08Liwa+MvN29WgxaXNhUOZVBH14UjY+O/yPIyiRh4S7vtV+QHSGLxK9L1zRR946C/3P
 jyServVb+zZxch611Zg==
X-Proofpoint-ORIG-GUID: rjN8MAJcrYOwoXldAM4W-EkscCnxnkAc
X-Proofpoint-GUID: rjN8MAJcrYOwoXldAM4W-EkscCnxnkAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160142
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,kernel.org,foss.st.com,jmondi.org,ragnatech.se,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-55956-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D27329EC07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 18:19, Sakari Ailus wrote:
> Hi Krzysztof, Laurent,
> 
> On Mon, Mar 16, 2026 at 03:42:09PM +0100, Krzysztof Kozlowski wrote:
>> On 16/03/2026 14:53, Laurent Pinchart wrote:
>>> Hello Krzysztof,
>>>
>>> Thank you for the patch.
>>>
>>> On Mon, Mar 16, 2026 at 02:45:34PM +0100, Krzysztof Kozlowski wrote:
>>>> The "endpoint" node references video-interfaces.yaml schema with
>>>> "unevaluatedProperties: false" which means that all properties from
>>>> referenced schema apply.  Listing some of them with ": true" is simply
>>>> redundant and does not make this code easier to read.
>>>
>>> I think you know my opinion on this topic. I believe we would be better
>>> off by turning "unevaluatedProperties: false" into
>>> "additionalProperties: false" here, and keeping the list of applicable
>>> properties. It brings value to device tree authors by telling which
>>> properties are applicable to the device at hand. For instance ... (see
>>> below)
>>
>> (let me trim)
>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>>>> index 2d7937a372a2..7a05a1eda58d 100644
>>>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>>>> @@ -51,9 +51,6 @@ properties:
>>>>          $ref: /schemas/media/video-interfaces.yaml#
>>>>          unevaluatedProperties: false
>>>>  
>>>> -        properties:
>>>> -          clock-noncontinuous: true
>>>> -
>>>
>>> ... Without this, an integrator will need to dive into driver code to
>>> know if non-continuous clock is usable for the device.
>>
>> I see. Our usual interpretation of common schema, expressed by @Rob in
>> few places, that eventually all properties might be applicable. This
>> applies especially for ABI tied to the core Linux specifics, e.g.
>> rotation and orientation from video-interface-devices.yaml.
>>
>> Absolutely every sensor can be mounted rotated, therefore every binding
>> referencing video-interface-devices should allow it, even if driver is
>> not using it. Because basically that's the ABI we want to define for
>> each sensor, thus each binding referencing common schema should have
>> "unevaluatedProps: true" without listing them.
>>
>> Similarly touchscreen.yaml.
>>
>> OTOH, second option, properties which are strictly hardware, e.g. name
>> of power supply or whether clock has or has not non-continuous mode,
>> should be allowed only when they match the hardware. Such bindings
>> should use "additionalProperties: false" so the hardware description is
>> constrained/fixed/specific.
> 
> The patch may be technically correct but I'm afraid it won't improve the
> bindings but rather the opposite: it removes information telling whether a
> property is relevant for a given device.
> 
> I bet there are a lot of possibilities to write invalid DTS while the
> checker says it's fine (missing data-lanes or link-frequencies, for
> instance). That may have been the case before the patch but I'd make
> properties a driver needs to function mandatory rather than removing them
> from bindings altogether.

That's pretty different problem and I am not removing any mandatory
properties. I changed absolutely nothing from functional point of view.

> 
> It'd been on my to-do list to split the current video-interfaces.yaml into
> several files: generic camera sensor properties, CSI-2 interface
> properties, DVP/Bt.656 interface properties and the rest (full list
> probably requires more thought). That way we could only include properties
> that are relevant for the device without necessarily listing each one for
> all bindings.
> 
> I'd also continue to list boolean properties relevant for devices as well
> as other properties that are relevant for a device but not mandatory.

I don't think there is such goal and particular subsystem does not get
exception here. What is relevant for device comes either from the
hardware or implemented ABI, as I explained. Bindings arbitrarily
choosing "I think this might be relevant" from some big schema with
irrelevant pieces is not manageable and not correct.

The common schema should be rather entirely relevant thus making such
arbitrary choice what could be "more relevant" not even needed.


Best regards,
Krzysztof

