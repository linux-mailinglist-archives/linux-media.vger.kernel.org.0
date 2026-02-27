Return-Path: <linux-media+bounces-53768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJypOdj7oWl4yAQAu9opvQ
	(envelope-from <linux-media+bounces-53768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:17:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5931BD77C
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5681831D4DA6
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A669247278A;
	Fri, 27 Feb 2026 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3WYDC8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQogIwf6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCF472762
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223010; cv=none; b=TP1obSRHX7qhOkJcpB6Wdol6sADCrbkBXMXP41DhqxETfe9ntoQZ9bntn/GjUkG8hIQZiP7Chmg2mNS6BNq135s3xXdvL/LYZ+P5bMShcxKEZ7dYMZb55Qz4OjS2AJVwc516kcTAxYzgkLcMuGOiNfR2GtPDcLv6AKSmipgS+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223010; c=relaxed/simple;
	bh=o5aHsvJaTFuPji0E5MKJdnk2ycrDX7jf32FdPIrYtQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvVssgFN7YAQzYwH0nav/0akuunwntvV66waRV7c9FsxQXuwNVTEKpCQCnzkYsnAagXXr+nWTU33K16LqV+vXw6YjBRxCwjRzU3ewVIHQTKkM11MlLLYdW/v3pPUEJ80u050fnf2Q4dShXGgHR7GpF3loKkdT8U46dfBb4uKjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3WYDC8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQogIwf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0P2u702314
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPFcKoIqKpFHQXXPANaemdqA
	aAJwlADq8XtlaqdUVBs=; b=F3WYDC8QuuZimsf+gZPS2WE5l0iNTrYJQ9ZxQUJ+
	thD6wxh9CqKNuYSYs9pVMMgnZWtRKvuwhyxCpBMqDPICCRuHSN1e+w3CUQunFnFy
	L30nP+NkPdV2jjpM65bzd99e7ucR00d4skbw5HugholEtIiVtVoCThZIxOmFeBIH
	jzo00rIJdKBHH4zLVbHSOSLjRSZrvtLpbiBlbJMwQ4n+gFul1OGmNTyl00FD7ujM
	n9ol4S2jo9e5XeNeLBomVt7dlidhhrmCN0FE37jKVFq47bpXh6n72faCj6iIwXzm
	3ikNG1RJvCeBMLtmD5i1SxIfrwc3lC6MwuZSXmp2loVF0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x8a11k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:10:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so2260062785a.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772223007; x=1772827807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPFcKoIqKpFHQXXPANaemdqAaAJwlADq8XtlaqdUVBs=;
        b=MQogIwf6lSvYJ8Do6xYib8QicVQD0z22GCziVqHc48n+9Nk9qZhwee5IuLl38asRq1
         l2Vk2KfmjS+Ko3Zd+rqd4c8d4jLXrQJFxJ6+rvyuHYzNyAag1p4XV1mxWIuy1L+eweq7
         +WP8wH34PODudoZc2SGJCCCC8+3mEVhdBBABN8awds+ogifnjmlpEzSuFDpM+b+bHvB6
         9lMxDp4V92eL1LBtGjBy4ZQnivuqLOY5VZ290ztmjvo/pbxWrAkYVowA3kYhwUCBeAWm
         U3FOnEpj0bOKzOjiumYuTmjuTQcZliSDXrD3X3MJj8EkYzNjF3EFhAAlBXUoZyPPHIqM
         nqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223007; x=1772827807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPFcKoIqKpFHQXXPANaemdqAaAJwlADq8XtlaqdUVBs=;
        b=FNFR5H1CeEt3tiArKafopKybGkWS0brIU2+gMo9QFy8GtDOyD6Iulu/tI0WpR+UaZN
         5zmRmEvv4dkSWV6xlZGaxsy/4Ni6GX347gFGFqwhC9gN2ydDdxUl/Zzbm8fpzS6BEmuL
         MkiaN6chI//eNIcydDBs7LGZDzZJ9A+c6En/dsLj7g4tw2bZ4L7f2g6h/oBF7Lp1Y0el
         jx7AjVb5pj8YcOgSWGCZkEDX7I6YvhBIPB5dI+CFy/XkoxOgOhGqmATD16YYCOxoNfD2
         57CYYtjW4lu6TWW6XEQVEPiz6u8I161qce96fD0dxOHKVLSxg0G13ctVR3PG+sSfImgO
         Kiww==
X-Forwarded-Encrypted: i=1; AJvYcCW6QUSrX4Lpn/UpWmxII/maxbIVyXoER3OXh/OFhNIJ4/qeiU0icUIaCcnKZT2uQ+uBwNgCImOm7+RYkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznh8EowV8MmALQ1TJ1UirYVUteQMyHP1pyXcz9Ix5cKyhRnhi+
	DB1xrP8kQytQXR+QIxHwK/Mu+14bqInk44jYFGeyMZjYPA3G3fH7btVLGiop5jwoem7Kt6NkM0R
	r1KIegH18RwY5rDpXW8kJ2k5xKsFsJclbDhMTdchO4LTxOrKG8xHjHvaojS/QLviCMw==
X-Gm-Gg: ATEYQzw9bsZqnkIlV0ZDACWivD1WC1BaExTYmOrgV60XY1yGD7e0aaEp4gomh+iLdQi
	EadJuzSdzy5XRgZLZupqzcZMUjqVQjEZJ06eRRQna474Kc999K/sV+zI19SX9TGz4B/HW7mz8dN
	jTli+9deM7x/CMdeE4ejiNyu5aWsHm5AbDvwalB9GLz1tChVagt0leatogOeVBWJahzjUCfo5al
	4nlieJqJcKx+BrGVcQvQPe3QAAn8uZzfXLHlrQ9v7bIV6J188ScZYz3zNyLXe7xW/HDiPHGzcvX
	hlauLX0MLxFT2uEKT1SQDpw/9ljNNGLiVt+8RT/bNyoFDzMUnPVggoRuPlvbQ4Jam0ddZ4lh3S+
	hpna8AXLBadq41DmueG9myW/xECLQjZOx1JYU+b4ccgLaay8jamuszsO4z5gEjSzdOitqPeJngy
	8sfHULZzymsbNIuHSoHJ5C/P4TbIa2yxqzc4g=
X-Received: by 2002:a05:620a:459f:b0:8c6:e2a5:9715 with SMTP id af79cd13be357-8cbc8f1b6edmr587671785a.55.1772223007183;
        Fri, 27 Feb 2026 12:10:07 -0800 (PST)
X-Received: by 2002:a05:620a:459f:b0:8c6:e2a5:9715 with SMTP id af79cd13be357-8cbc8f1b6edmr587665685a.55.1772223006750;
        Fri, 27 Feb 2026 12:10:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115c33c37sm147621e87.82.2026.02.27.12.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:10:05 -0800 (PST)
Date: Fri, 27 Feb 2026 22:10:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss:
 Convert from inline PHY definitions to PHY handles
Message-ID: <woncxvvebqt2iyoozkjnpjf3k5w4ibwzf2yhk3zbtck4fz2lgo@ai6rrd5iqpvp>
References: <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
 <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
 <934812b1-a853-471f-beb7-3988eff0856d@kernel.org>
 <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71fcb165-7fda-4714-b56b-40d6537b8ccd@linaro.org>
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a1fa20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=IO7rWolNlSVxHX4F2dwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NyBTYWx0ZWRfX5Nd6ynesxPNz
 byCWmU6MMBngCB7UTCr7XnhFair4D2m7bSzj9ln/0hu4zptkGFqtt/ZRefNTML/KfwbDQSg3dqU
 k/gE8jg9AcrioOEkMHjGIqbGyXE7D7Vv5KrWtqVNrBFTmse4ZSE0SPekCN5HtCb21ogotFFCf9D
 C1MuckYqw41xhP+cl0m8QDHt4D6sqc7CHAyeLffhkDaN4I4xU29HFGn7aKSgMR3nAOIeYO3SHh0
 vUxfFPGKcQzrO2KaBjgfRITZIzaFO/n5gJp1WXOAbD4drRmV6swkkj9NG+ow7K+623mF4RxnvCG
 LebHDIsaY7ii77NfQgTSHve7eJ8D00AEocmDKaxd4ODLkqNyoF4NsktQT2J644AU7Feh0iRetqm
 PEgJAntBgYaX2wP+MVsiXs13wuap2Z9nO/X3E+2oHW1IWmYZgtY4jM9pDxS3YhjWjpLYCkttfRq
 2IU0bUNufMkf3Q9RETQ==
X-Proofpoint-ORIG-GUID: 3tr8oM1AhmQL_MFc49aLe6j3p0McQMX7
X-Proofpoint-GUID: 3tr8oM1AhmQL_MFc49aLe6j3p0McQMX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270177
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53768-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A5931BD77C
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 08:48:45AM +0000, Bryan O'Donoghue wrote:
> On 27/02/2026 07:24, Krzysztof Kozlowski wrote:
> > > Well, is there a way to support both then ?
> > I would just not touch x1e80100, but if you want then probably binding
> > should stay backwards compatible, where you keep all properties intact
> > and only add csiphy nodes.
> > 
> 
> I really want to stop adding new stuff with the legacy way that has broken
> power-rails, even if that means x1e has a bit Frankenstein binding.

X1 is fine. Please thing of a migration path for the older platforms
too.

> 
> > > Right now I have csiphy and their registers listed in the camss block.
> > > 
> > > I could add phys = <> as optional in the schema. Is there any reason to
> > > stop adding adjacent csiphy nodes ?
> > I think no.
> 
> Great so, that's what I'll do.
> 
> ---
> bod

-- 
With best wishes
Dmitry

