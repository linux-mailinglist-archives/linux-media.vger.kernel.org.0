Return-Path: <linux-media+bounces-65210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6huqF0r6M2o+KAYAu9opvQ
	(envelope-from <linux-media+bounces-65210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:01:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E706A0C4A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:01:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=faKm31EY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eEt56tYz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65210-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65210-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA3C4304495F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81093FBB76;
	Thu, 18 Jun 2026 14:00:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5698394471
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 14:00:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791243; cv=none; b=PhEWUaRtx9E7AcgXjEM8SvyO0zZflkk6AA2HoOw0Qv9AwdbHygIFLogAdmF2RvaqL/Pbxq3J1nDositT9UqcVQHgwrBmPF0EI2mDm4USBWomEhbBV8oFYhf0t6Yt/P06NBnDlxaLCKRp8O3t8wGXsa/5jEF3PCmAE4ipXDIYNNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791243; c=relaxed/simple;
	bh=9m9kUKtzlx7aPIOvj1jMWVnkjRGf74rrjTx+hbwYRsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgRfdzzhzvYXrQpOmYkghVHpRLe8BQVuvuG+g+Xa5McrBZeuNwFU+R+6mHmaiFyTnC+cs4/bghY5otPs+5yvNfHDKVkAwW6PKN96zFDgNnEQZdHYs+a8X3CDVBO8m3q5uNtjq912mCJjXFFhkdXdBqk/MAZl1NHwlDOss8Kfb0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faKm31EY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEt56tYz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IDrbH33009731
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 14:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=; b=faKm31EY90HTLDiL
	s1Q31GLA3s2gnWzZfUhLbhB15e+E9DJX6ke3ccS1HpMBmJb9jCbOLEQ9eQfqXsGC
	sr5JynN2TH3/idEF2mqdEOK614EidIr3n+XBXJPG6v8icv8a8nBFFhRAfT58T76a
	4gxAtIMjGZMsLgVD6mDPsVHBdeiki1LnRU0C5v0z2fJpdvSidgrczTuAk7U7pRkQ
	xIvknQKQDxz0mgjNPern/vIc0ZpA4c61rlCk68z9gytE5yG4u8liDb3n5lHmscL6
	91xe3aLdDVYAYfIG1eI1zPd6YiX4Bc//GOfLbS1BhpFgEkVoBpSsQSI0d3lB6bSF
	Fhz5fg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmga2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 14:00:41 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-662ba134bceso1861630d50.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781791240; x=1782396040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=;
        b=eEt56tYzkhPK+kO77M1T7XAmj2IzkoJ0yyJCARNY2+FadTuOZWgd1zC01e/Blh08GC
         oSLf/XRem6YoTqhYlFOEJ3hcpmIEH8HbdKSYXWRqPw6jX6Ok2HMbGqwhmTSH0GjxwNtO
         LQNUVDffj7S0vGiENlchqD9zavyIO2LFG8kEYuSwFuehQxwJARHLK+gakO//7ShqxJPu
         ENrHcZbUB59gufmw/Vu81JM/XWQ4ru97sCwFv9IEm1WJO8qsUmXFnJH16qWdVbCPRHEW
         mubEZl6AddPDxM+Kwp/pG12jz8wmf7qKbnTvoTAmxR3yChPQ1/36J/yFuyViOWHBQl0a
         OsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791240; x=1782396040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=;
        b=C9udmMvSm8o2dOetVa55efk6Sz3njwlVCm09Lnhu/BdYe7wtGli2nLxRJyMcJF999S
         BVktL56z3223TIIDeTEPxlf/mgnKPDxui1/VPpPraHISg+ASRdcSeTs0ADA4TCUTiwFo
         GtRwNZKLAFcZUWaSq6hP098Y77PPxRBaTD2dTVZ2MZlYv7ktqUsRuhfyRVAvqmYCedz3
         H3h9rSpPj+uhky+ts0GItsO9Ac6pHdKRgmuF6PvSWaYiA3c+RuZ9Ow7atcKMaMJSIBZg
         UsPjXdS3s7ncMYrg1gMSNxbHHO/BXVVI077+30t3CBsUUmDATrbDiVKqVKrLMH271oB1
         RBEw==
X-Gm-Message-State: AOJu0Yzul3Xs9ujq8Di9+SjxZuULY2KLf/Gko3PAzyDG4o6V+NkUQ/bj
	0ENjBsfvJGpDTSE1ukzlhN5w/Ng2Pp70dWAnZTp7FGru2Eoo3NBFhYH3QxYcXwm+3xf4r/NiTj8
	lLWQZSW9fkwiY1qFywZyqXJNWn2CG48BnCnGtKJGsIKoF+cQH00wkI1awe03VUI6uUA==
X-Gm-Gg: AfdE7cmDv8jGxjuQq22lwWG41KGGbNw8wwWSebmM7zxtog41rGFguFDRp7IZlrEvi1c
	f8QR/FuduSDn7caBx/NLBcTj2I+YvYgQJs3up9ItA6G+yO9eJnGphMJVQ5Ct2dA3WV3EOFGK1/2
	yMnMaxqzhNTjpGv0hbVCGN5wa3+Efmx4h7rGm9p/otee3LsGBU71JyqBJBAuACflzuJzu7wZDPP
	tVeIMILsFX46J6E+VP4m5ZnsYLajuGvLH10aq0WD4rvL4z0VR7K0jYSOlXwMhOMg+qMQSKa+FXP
	npHVvNVNsMizJrtkOXa2l9PW8BzureHVvhdOdHykDBT4r7F0+WE36nw+liHsXIVOh8OzTBmflQG
	EMrWDLuTnzLN+mhb9SAdDd2FptXvatwXrSeFIyUHQvsN+OdUXcZCbpQEvUpl0P2UsIBprX6lRsc
	E=
X-Received: by 2002:a05:690e:1906:b0:662:f227:6230 with SMTP id 956f58d0204a3-662f227730amr1966321d50.18.1781791239443;
        Thu, 18 Jun 2026 07:00:39 -0700 (PDT)
X-Received: by 2002:a05:690e:1906:b0:662:f227:6230 with SMTP id 956f58d0204a3-662f227730amr1966229d50.18.1781791238551;
        Thu, 18 Jun 2026 07:00:38 -0700 (PDT)
Received: from [10.111.165.239] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274e2b181sm12345595d50.15.2026.06.18.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 07:00:37 -0700 (PDT)
Message-ID: <7c25faea-7e86-43d5-9aff-2bf6f609e311@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:00:32 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
 <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
 <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
 <178178854034.861173.9780571180496261859@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <178178854034.861173.9780571180496261859@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SLkWg5i3Lh4NM8oX1eYVGSvr-kJW3HgU
X-Proofpoint-ORIG-GUID: SLkWg5i3Lh4NM8oX1eYVGSvr-kJW3HgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX4qXi2A3WCzbu
 gh31rYYtyJbrrhoamH54jPrvFNvlnSKQ8mYART40X/sWTzTvHnHwFfhJ415ob6Ka04xttjWupOv
 7hhZ7IHbrBYKEgKE1HqgYbQ4BVoKZWYZeUmyrddIxroE5EHOAxPzQwL5cbZZrHJkkH0B5OchW8E
 7njjZc1VPA7bCDp49Eg9DhTtMUO06isA4T5VYxR2xSRL0AnJqMBbG9+npgUoE+/jhxtRWgNrW/c
 QyrdfpZ+BU8f04xtd+uZ2rCrdKEkhCyzz1VEIDUwDKigJO7ZuzwTrotLwHg2RnuaGhIZaDaejUh
 FKX9Gx+waEqtoX3DHAo25H7Y03eDvw5PSXP9BS9tAIh0jq1/0w/ETEmh7xpyH7t+EFdw5TUYY0A
 Qd/Hmsn8CySDvPBZQb5Cxkr/M/Rx+v3GTtqCZnnG7yMzqjqOoumLg9seEU0Mpi4AEaiGM8ActhJ
 YjZtn+i3+QnpnNRnGkA==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a33fa09 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=VsaXS-_fMXfK9Rll_5QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX29i8ECLBtkhg
 wN764oDrN6rVYIniirz0tYcaTD/RZ8OPOVMn0WboFivJx067Br6lpP3opN39/2MaGMjMu6Yf9vQ
 kZYyfXzJOg6q2iQ2TGfbO/ygnI62WQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65210-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E706A0C4A



On 6/18/2026 9:15 PM, Kieran Bingham wrote:
> Quoting Wenmeng Liu (2026-06-18 13:36:27)
>>
>>
>> On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
>>> Hello Wenmeng.
>>>
>>> On 6/18/26 13:37, Wenmeng Liu wrote:
>>>> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
>>>> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
>>>> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
>>>> the 640x480 (VGA) resolution.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    MAINTAINERS                 |   1 +
>>>>    drivers/media/i2c/Kconfig   |  10 +
>>>>    drivers/media/i2c/Makefile  |   1 +
>>>>    drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++
>>>> ++++++++++
>>>>    4 files changed, 879 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index
>>>> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19891,6 +19891,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>    L:    linux-media@vger.kernel.org
>>>>    S:    Maintained
>>>>    F:    Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
>>>> +F:    drivers/media/i2c/og0va1b.c
>>>>    OMNIVISION OG0VE1B SENSOR DRIVER
>>>>    M:    Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index
>>>> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>>>>          To compile this driver as a module, choose M here: the
>>>>          module will be called og01a1b.
>>>> +config VIDEO_OG0VA1B
>>>> +    tristate "OmniVision OG0VA1B sensor support"
>>>> +    select V4L2_CCI_I2C
>>>> +    help
>>>> +      This is a Video4Linux2 sensor driver for the OmniVision
>>>> +      OG0VA1B camera.
>>>> +
>>>> +      To compile this driver as a module, choose M here: the
>>>> +      module will be called og0va1b.
>>>> +
>>>>    config VIDEO_OG0VE1B
>>>>        tristate "OmniVision OG0VE1B sensor support"
>>>>        select V4L2_CCI_I2C
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index
>>>> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>>    obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>>    obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>>    obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>>> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>>>>    obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>>>    obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>>>    obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/og0va1b.c
>>>> @@ -0,0 +1,867 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * OmniVision OG0VA1B Camera Sensor Driver
>>>> + *
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +#define OG0VA1B_REG_CHIP_ID        CCI_REG16(0x300a)
>>>> +#define OG0VA1B_CHIP_ID            0xC756
>>>
>>> This is the same chip id as of the OG0VE1B sensor device.
>>>
>>> What's the difference between these two sensors, and do you find it
>>> possible
>>> to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
>>> it just the same device?
>>>
>>> Hardware specifics described in dt changes also does not show a difference
>>> in comparison to ovti,og0ve1b.yaml.
>>>
>>
>>
>> Hi Vladimir,
>>
>>
>> Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome
>> sensor family. They share the same resolution, power rails, reset GPIO
>> behavior and power management framework.
>>
>> But they are different:
>> OG0VE1B:  8-bit RAW, lower FPS
>> OG0VA1B: 10-bit RAW, higher FPS
>> and some registers are not same.
> 
> Can you identify which registers are not the same?
> 
For example, regarding the CHIP_ID,
OG0VE1B is 0xc75645, while OG0VA1B is 0xc75641, including the test 
pattern registers.
Since I do not have the specification for OG0VE1B, I cannot perform a 
detailed comparison. However, based on the current observations, OG0VA1B 
can be integrated into the OG0VE1B driver.

> Mapping between 8bit and 10 bit or different frame rates could easily be
> managed in a single driver with exposing different capabilities based on
> the variant.
> 
> We should really work towards reducing the huge duplication that is
> happening with copy/paste sensor drivers.

Indeed, will do so.

Thanks,
Wenmeng



