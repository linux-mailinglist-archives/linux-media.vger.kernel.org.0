Return-Path: <linux-media+bounces-63682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qVsRCK6hIGoM6AAAu9opvQ
	(envelope-from <linux-media+bounces-63682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:50:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD463B766
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:50:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dtOMp8RS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ONrGrEAb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63682-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63682-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E81B9303B6E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECFD389441;
	Wed,  3 Jun 2026 21:46:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844CD37F755
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 21:46:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523218; cv=none; b=E5PM++xkuK8WG5p/t2J1czQh/5xN5orTOM6nkJYaKY5Tn7K8EF5a2ZQVQX3WsA5CdMUwaw6i6gjBuceV46UTOV212QFLa8J06l6o0XS8RjL3Vu1KNZz00NjvQebWPs3VA7TFf/9O7r0KqyPkMZoNlLeyi809Td2iLHsrcde+wMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523218; c=relaxed/simple;
	bh=oeYALUtDYRkyR7oPwz2HFEy/K998aAgoV+N/hPqd17k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8ffjTgMmrfZAISFeTKLkd095wmazOuZ/Vd41rPoKY1XUkIKdbRyOKhmR6SYP+5nS58Kar5R9LR0K1dhj242vqoo2wAdQf0fv/XjbCc6Tg/eV7uSPSWCzfdjrO/n6NmMYzgkhFdD3uiML4VSeTvGlKFmyIwT4eFA5wCGMYB+keg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtOMp8RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONrGrEAb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653KC9xI1740590
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 21:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=; b=dtOMp8RSacUZoCYe
	efjvGKC+HAT7c4p7w5nn4raTde7oWIY5XZlQgiRfGawn8NrHS9oFSxPGWbOR1n45
	MIZnFNNphA3PwHJNnaqkyKQSIK6zxhABvK9/wHqTMtJrHLONWZHrEWFLYYefwj09
	reHvVmClMJxAzr1vpptI5H4u22+dosRl3wOs1LuywneUwJcp8lTBZ0/P8WgWcC6I
	KP1E8waRuSlG2krZMV8ig9P5eGZ5C7AtevDb0q4h4v6C9zj66jQfX8+DWkkmNgpD
	Yjzss6O8AOrKmUya8ylbqjE63vsZC6XfcZKGKh+EYD8hxIEnX2jFes5RTuD4BNiX
	u5a3Lg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7v5hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 21:46:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso7444600eec.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780523216; x=1781128016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=ONrGrEAbG47obKukUm9JCF4K0xSgJ7sAEhco7EMWcG08HHUV6bx1/jJXYgPreQo8xM
         B4u1O1htL2fecOFJoah6jRi1Tgu0+nQtZYDpQBmwwkhSNDi2yUWpAYWJR3Cr3q7nzYVN
         V+5YoWty4mASFuQAa8JGI3uz1+EDxBzVlFNll3iCAisIkg14r/dQ0FzFlh3PVyC1LjGI
         yN4hAfjjehl1IKVsuYl9LKo2tObYidSLU18O9n3QsrB+eoBSinymMaCpVdgr3E2rcC4T
         7NqlmP0sNoXpH0oDG/AzM8pjsFt0EC3TUT7Cdg2nvZwNvwnURSvfAbPJ6qsUz2v/8pjW
         cQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523216; x=1781128016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI4SVhkK6E0eWN6DtYQRlG4n4FVt4g9e2Fn1B2lcMFM=;
        b=OKGCdv0++/P87eF58m9hq4docJAAnphd8C+aGbAHqe3zKnZKZu5cNvhGjk6dCtImBv
         UC+e0uteI51eHja0HL4DrLxsNJucY7fZ71tpFHA854S+HIuVwVoHerWM9qSR+J/Ksydj
         QrtneLUIjBj6gB2Z7BukccLU4bJ+/Aw86cWb+w3ty6ObC1Y/B/K1jsJx7SwQj4D92SDe
         YkO3VV641v+Dsd8sfF6CMSiQ9j4WgOfF0vWzG3IcuKWXWclw0fQM7TofHYEX+u7ILc0I
         GE6e/c45L1yvPKjNFgv45LUqwNArBZtzrqrTABNV7+LLSP9hWdBULOLKfVpdYqjvneJN
         rEaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IFq6K9rs8Otz5vptVJrzdmeHooYuzgLkfkSSteHvB+28ENDiS04s95KFUm6Zgwnm0ygbvRe70MZOL6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynm9X7oPkSWSdAQh4HNXvQTTxi5lLZbmSn3Wcikk8hTA1U2NBH
	VzAkjLF4c+EnVWNuFETFzRzL0nYnoT3rakxu5y/GxiEjFax++9jSsdbOudL0cg+6e0t9rRcjhhe
	bAQz5EhwXXEGgQIY2onlpsMzeTI4EAFed4oFb/oQlmDv6dfGiF8OSWfmoRJmUK3ipZQ==
X-Gm-Gg: Acq92OGu4p47LokgkuRHkhJpNYo3Lx7Wr7IyeQ8juxid6BUxukrHl+2/szLdJzCQU4U
	PdV7u8sseNuOfIoCGJroSuO+8WivnGSQzjCFfAT6rCzTOcayJzV0p2HBftKqTrVhOamH93av1b/
	uckYHgXmMtq4bBcQT1Xarm51ShRtVfMuUT/ke/ik72CIZA0Y/Nm7nduzLnvZrzSE+UvQ+tInIhR
	r+xUXyOBDb5XQvXkJ0CZ5bmvsl8H3GtxYbW4bg/T7Lgz50MJMTEie7rbax1EVUNZXgkO9t4XyeP
	25vqxxkljKuPA0oF7QvMVEm0cde7oQg9HK+REyPM+Sj//gUWsIcTK8k//w2G8Lsah4gLGoH6LQF
	AjAZx9+MhP0zVohZmsFirEBBdp74FLog6KFFTugmi3ePOAq3cLDyeNhS9u5lHfudaKitzb4xBzc
	KQEGuIFPbGuVA=
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287896eec.17.1780523216047;
        Wed, 03 Jun 2026 14:46:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7250:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-3074fb4847bmr3287882eec.17.1780523215500;
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm3362286eec.7.2026.06.03.14.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:46:55 -0700 (PDT)
Message-ID: <21facbaa-c001-4e82-954d-f2f6838d41b3@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:46:54 -0700
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
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIxMSBTYWx0ZWRfX8itP+Jg06p1D
 kqxp4WAO3qMeVddzai1xZNrmW3KrPhYOOV29JKAWirCwKUAb2s8xqI7NPjtYtSALs4ZemBP4Tte
 N9LVRX3E8uODQmd9D7mN4SKawPFf9PVQfhhctXHqloVcW8YXMoqtZxHS1bfREjMhSiU4r3vm+0E
 ovKFKeGH2U2itGLPJ0l95JWKTojrQ7em9Yc2qApV68HWQnN1ZfVMqfoMp9436c8kNbpaYhgiZng
 CcKg4RQlZ+ke/H2qt45kOA2rPbSfJcKzPb4QIKhZ2nzVFnxZ2BDGRQldoejTibarNXe3mJ2wdTS
 jE7dVuex0of9iWrzTB0lCumQjUVuyiIDr3RLAq3FNpoy6dmPS0osPG1ET+9qqMA9Z2vq3ZAgE19
 IOx4rJ7bZ2DcESzN1oL7uMr9npAF/szVoLjjkXMy2lAQJpEiMy/m7ndihs0LeVod460s8S9BTPX
 kjlSGypZeJVOKT587jA==
X-Proofpoint-ORIG-GUID: BxPB698jq1A3xrLUXMtdSuZC7uQvsSML
X-Proofpoint-GUID: BxPB698jq1A3xrLUXMtdSuZC7uQvsSML
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20a0d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=R4he3g2KxIACXk2nk8MA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030211
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63682-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6DCD463B766



On 6/3/2026 2:18 PM, Bryan O'Donoghue wrote:
> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>> If CSIPHYs are true subdevices under the umbrella CAMSS device and well
>> described as subnodes, then likely none of power domains are needed to be
>> repeatedly described in the children device nodes, since this information
>> can be obtained from the parent device by the driver.
>>
>> Technically 'power-domains' property can be safely removed, I believe.
> 
> The policy is to describe the power-domain dependency fully since DT 
> describes hardware not software architecture.
> 
> Also for a very practical reason a sub-devices can probe/run 
> asynchronously of the parent device being active so in fact we do need 
> to describe the PDs fully.
This makes me think. When the PHY devices are made the sub nodes of the 
top camss node eventually, we can discuss for somethings to be avoided 
in each child, which we can come to later but for now, you need to add 
the top AHB clock as well in the PHY node, Bryan.>
> ---
> bod
Thanks,
Vijay.

