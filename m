Return-Path: <linux-media+bounces-55931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCXjLb4XuGl/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:46:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE729BA06
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 229C73075EB1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBEC2D837C;
	Mon, 16 Mar 2026 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo9LUIFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XbisFblu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E62D8376
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672140; cv=none; b=kB5pvUXxmDAEDWHylxn4dCq2UoclUdVIBnE6TvNmU4ehVMthcN37PGA/wWAJ1NVJ+CUHDIH78IKqlT3Zua+rAxpsl/lscKKP8bcBUVtkJfvwAe8SQONXYEk6tqlPVdviyx9KxXEGxRidOZvXwRfUDwGz/YIBcadssArXQBAyujU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672140; c=relaxed/simple;
	bh=NnyhJYuya69i3lHuaqJT7QVLAgzrjyUeNB6/d4oFPV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAEfHscCkrmFmzkMo8vD74OH19kabktW7E3crHXA1hlvLuVY3N57/un+PY9TO2/WeD4hWuFRHlWNE+WdVp6GTuQ3LpzFF7af9oOJ2kcFkUkvONSK0IoOWljz+JGeFDdC9+Guk4HlyhbRd7GLGzFN5pTwOR59tqT3uVb1h7C8BYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo9LUIFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XbisFblu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCXEqI1622349
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOTK4S+6D4qYurM6eJqu/Wa/N97KSWN0R84TLtN5I00=; b=Qo9LUIFdn4by1Mje
	HO+sOz/sQuqNEFuniBtu5alWnU2bcQCVbNCntnwBhivLhdFNYZujSLOo57mjMAn8
	6zhliK5N5HgOPyQk9pW4xk8TFmKbv+8WLV25cZpvYij1o3lxIk/TcNI3T2Bi7zpa
	Iws0FO9ho1V3bVhHhwbFmybmIp6h6+hDONFkBL+8G/HeNs0XytfgIPsqpBE3bqc7
	IeJu0fzqYVF2aiTKyZ2cnVnumtclaEmKd1toq8xQ488imTsX7GSAnks0hPiw/r5j
	t6m1NYlqTXhYDwX8MtXZfP2wxRdZ4SmOaH1zeeDIt9INceLk2BPMlW1wnAUL7r2E
	3Cd+1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyegg6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:42:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso692217221cf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773672136; x=1774276936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lOTK4S+6D4qYurM6eJqu/Wa/N97KSWN0R84TLtN5I00=;
        b=XbisFblu+L9RloLJlOxgSivGbK++n/Ih1drg1J8zTMPu0SHMIwmVTBc9wtC6mHYdFq
         F5i2yHXY4etupQdofiSC/pODhq9oF+uLeN0dEg1+EaXlJ40euSNInzHy6StPpe3FUGbx
         qlSbtu4f/P3i+PSIKWaR0KDsaAPqfiqwq+vptQrIB1rL5sbS2brCpS6ZPpqAahpPfxwn
         8JSszr4fxk+fRKfGxNk8zXpuouS22CMTYLvHxnu8zQx4wiXb02kMJFFDianGrCI6Mjy9
         FjR94PH9RupsLtD4wWnvkG4dv+p7/qK1UI/2YSqTp/UtqNsK/ZEXhlv0EMzS5SsLW6nx
         BA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773672136; x=1774276936;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOTK4S+6D4qYurM6eJqu/Wa/N97KSWN0R84TLtN5I00=;
        b=IcgBSWYDW3hrQoQ1z9amS4lTPFRKEn7fviNt6t5QW5QMzs/RdA6DMqigdoKXg915Du
         EDJX/XDlNhNOi/dQ747/s77ZoojisqapGmVtbUcDdboPi6aoBmDOLkKqU9e0R/p2q0Aq
         N2XJ0woJs6SIq2QN5BBUkWr+Hrt0y2apECkca8kJsGYQdGkBk8oB+bxWwxLG//zg9vIL
         bqwiNaNkT40ui9gyccAGB0yM00f6NgJv7gl4mg462ZYMx5Lr7U0NhCitaXi+yQBTFWR0
         WLnjWrdw8054o5OuENLpySD0hb7K3n1h0efdSdMwSO0oSUCeaaTQlZyyzQKmR6bSln3A
         PNFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnZRr99aLfPY1NSxBcwl487r1tDSbcBTXIc+ZAH7wN4Z8PJM76BOUpY+BQvJLUsXFf6lgqEatMxdcUDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFr32Yk2v7KhTJcJcXujK0KoaQn9GrBIVYbuVDe8ntXdbxKjmb
	Y4tSOJhMRmV1+Y+Sf/xaCc7XHE6Hzz9FOMjjscBmq81uV1wxppjgZo59CWCm71XZQ208ayoc09r
	UyaDbMOg3p1t/cHya1C7Exr+NIgbEJhILk28qvrjrSr5LyKwSKjetLFvaz1j6yN5sjA==
X-Gm-Gg: ATEYQzy9pdQrGsBYSrtyIssv79UuCmKjJGRY9GJvq2EThwizAJUOiLT72uLGgoy6/6R
	2S8hzSBpc+N+8lPPuGBM7AoNWgVLK0RDHKi+iPB7RJbq8/IP0LK0jm9wguknk2tMldYpfjJ6IFR
	NHhGXgn1Gh+9f4O7q1s8q972QfZrGVb5IHX5HogLB2/gMAiNGZp6ttC5l1TcVN2hf82KHyuXbPA
	NMXluF+bN3ZSO6ZizHw3/kAgqSdSeHsoeS2T7ufvmhYPHEzyaqdh7+FtBH3Y4Z1w7B/GWRcwh33
	nBA+bAt5lrdlaPIU1nw2BuaG83vBkgZwWrLcnhoPeLbKSLtnNE1Rqp83OMeDfsDiJu9mqFHvQ5Z
	KiUZtafbTl2/E2WKq0G+48R7jjsH3DpXhcBFnctBuYJYEhxwR
X-Received: by 2002:a05:622a:199c:b0:509:d76:c5d3 with SMTP id d75a77b69052e-50957f162a0mr175193921cf.71.1773672136018;
        Mon, 16 Mar 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:199c:b0:509:d76:c5d3 with SMTP id d75a77b69052e-50957f162a0mr175193161cf.71.1773672135407;
        Mon, 16 Mar 2026 07:42:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5094a03556csm97741181cf.2.2026.03.16.07.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:42:14 -0700 (PDT)
Message-ID: <a429887b-13f7-4ba3-9260-ddae92adfe51@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint
 properties
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260316135352.GA31616@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DK9lKEAKjUHosQtr4DKdyHNpas7BhBNP
X-Proofpoint-ORIG-GUID: DK9lKEAKjUHosQtr4DKdyHNpas7BhBNP
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b816c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=aRYCLuS3TfqtaQxiS_sA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExMCBTYWx0ZWRfX7PBJCLsvt0zt
 vq1TMjrYWrUP4ESOdFgsRkbCLQMuYqkLd2HEJ7FhPN7ohL4P7fd5E9fThtd2yJ4TTdjLrmAPvdX
 nm9L5Sy0IdzCnGKXT2eh9MtboxU88h+j+Gx61JxCI/n9smxaH8QLkj2g+/WR6rr8OKIFw8a4ByW
 uRRE9ThrhrjoqSG/ThOPUxUtbX+tXFxhvedoCoBtH4sooSXJkZ6S0HyFzOauQG1/5+8z4CMJEYY
 zivwBt8u//OL3oFNmz3dYA144g2mUtmEjB2LXSTa/esuNpyRRRegl13HOkZWIgw4mFlCVAZsDtt
 +LOXyYa2KuOP4U21EXBsbNGBDBZCjZgWLCfrnbO+ZbJg547wOOftaSdVnzC9GtGy/BEtrh9ypHZ
 OmWGc3TtWayNWFVC3P7aaIaKg4FyhjOI1r7yIJQjGJ1CsObhUZjPdJ0mucdI+nfKSDxypkOPCcC
 xPmoONReV1rjHXO62nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160110
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-55931-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 26BE729BA06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 14:53, Laurent Pinchart wrote:
> Hello Krzysztof,
> 
> Thank you for the patch.
> 
> On Mon, Mar 16, 2026 at 02:45:34PM +0100, Krzysztof Kozlowski wrote:
>> The "endpoint" node references video-interfaces.yaml schema with
>> "unevaluatedProperties: false" which means that all properties from
>> referenced schema apply.  Listing some of them with ": true" is simply
>> redundant and does not make this code easier to read.
> 
> I think you know my opinion on this topic. I believe we would be better
> off by turning "unevaluatedProperties: false" into
> "additionalProperties: false" here, and keeping the list of applicable
> properties. It brings value to device tree authors by telling which
> properties are applicable to the device at hand. For instance ... (see
> below)


(let me trim)

>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>> index 2d7937a372a2..7a05a1eda58d 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>> @@ -51,9 +51,6 @@ properties:
>>          $ref: /schemas/media/video-interfaces.yaml#
>>          unevaluatedProperties: false
>>  
>> -        properties:
>> -          clock-noncontinuous: true
>> -
> 
> ... Without this, an integrator will need to dive into driver code to
> know if non-continuous clock is usable for the device.

I see. Our usual interpretation of common schema, expressed by @Rob in
few places, that eventually all properties might be applicable. This
applies especially for ABI tied to the core Linux specifics, e.g.
rotation and orientation from video-interface-devices.yaml.

Absolutely every sensor can be mounted rotated, therefore every binding
referencing video-interface-devices should allow it, even if driver is
not using it. Because basically that's the ABI we want to define for
each sensor, thus each binding referencing common schema should have
"unevaluatedProps: true" without listing them.

Similarly touchscreen.yaml.

OTOH, second option, properties which are strictly hardware, e.g. name
of power supply or whether clock has or has not non-continuous mode,
should be allowed only when they match the hardware. Such bindings
should use "additionalProperties: false" so the hardware description is
constrained/fixed/specific.

The only exception is trivial-devices.

To the point:

1. We should not have another exception of listing hardware properties
and allowing them for every device, even if device does not have.

2. What's more, you propose unwritten coding style
(unevaluatedProps:false with listing properties when you want to
indicate hardware capability) which will be very difficult to implement.
I doubt that existing bindings, except a few, follow such approach. I
doubt we will remember this... And it already spreads to new bindings
when I ask to remove redundant "foo: true" properties.

3. These sensor bindings should follow only one of mentioned earlier
options - additionalProps or unevaluatedProps - because either these are
hardware properties or this is generic kernel ABI which everyone
will/could use.

Best regards,
Krzysztof

