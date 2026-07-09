Return-Path: <linux-media+bounces-67108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UcBQKZRQT2oReQIAu9opvQ
	(envelope-from <linux-media+bounces-67108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:41:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE872DDAD
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 09:41:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qr9ckc5a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BPwHheq7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67108-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67108-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9746E30CDB1B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 07:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC16F3A7D63;
	Thu,  9 Jul 2026 07:34:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86EB3E3DBD
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 07:34:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582443; cv=none; b=sMtkThwOZLGboFJsZqtuzfvesQJFzlbCzTYKgHpiLo/Go4m/T54/t7ZfbSo82GKckpHNGYQcIGwCRsqn5/XOGJIYKHab/kYoHdvmj1fW8hjU63pbrPruA7vRxA1uo7t5FZDYJzlD6/zbdSUlVfNzEyJ2skWH7cangdio1c2Nd9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582443; c=relaxed/simple;
	bh=Kh5FwszJ4LfJwQ6A/zoYZ4qba9IWmXTwdyA5zZmva+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLQynGy9UpZA85VxKXn67+8frdNcx8mCNmhjnshkblT38ZeuB3oJvzMkCSqWEJENNoJ8hdXzAYLE3TypDwohaVwb9/vMMsfv8dnv4Q0777pmmQou7safTMk5PTki9zjzDq/nPX+tj7VPFfL/X7Km7r97kcJfaOtgt3CHZAXfJhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qr9ckc5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPwHheq7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960a02837474
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 07:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rj6P6226UzjkYIgt9Mf/cOyc
	/GcJxd9MKs8WkH4Ew7Q=; b=Qr9ckc5avzQWZ1W8tZnYumyupzdwE+MnUwWtdzBA
	ufgQsYkesNE3AIDfsX8J38UlEqhL4CvcZbUgLfYe3xOMqX3UAWwwg5IS5JpZNMm2
	v18IWWZ3U5mDggPrEgQhnZzpVgXWtR2NwSa1SHh7Q2A3apqgJj2e9vg/wYWMgIHD
	EJLf+M3x2T9XD64jd9mqQMjVLZNluoV2V8cPRyh+Q39mFIVgc1nMnaJUXcYk9UU2
	D1LKNLerrMssom56HxR8Nvrrk2YbggcDkrXZkAgR8fwSsx9I1W0BachGwEzT9KlV
	EQ7yrsVx2FXjv2XaFt7/rJ3Gk37HPJv8nGNF86T9zEeShg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwaxra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 07:34:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-969208e497eso1514542241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582439; x=1784187239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rj6P6226UzjkYIgt9Mf/cOyc/GcJxd9MKs8WkH4Ew7Q=;
        b=BPwHheq76GVDW+akrAI8qfVUAOhfkdg+1NGSy7h/Y+h5HscPEIwd2zju7g6JpxrWTm
         Kad5cNn5Hw2tveTuEZpiStgvnw2wP5S/btvT+yQWGEl5Pwc8P+MaSqyuWDbRYfVfKdWC
         P6VsPFaMGhpEc+xEHPQ8AyPWuW+Ooj1+VNHSm2UB6xQcxqIU90d/mIoyLIx+/UTdCPC7
         sJd6N0GbfALHIoUb/S/ShUzkkbC3kewCfYo/KVGnHsLBQDutRrbxRg3t+iLJU30XOvaH
         NlgsLbuyHMUb/25ySPlu9Zs4WhYOKLWGCzp5QzIUSUXOg9smWIhu4waHoE6GVIJHjhyp
         cq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582439; x=1784187239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rj6P6226UzjkYIgt9Mf/cOyc/GcJxd9MKs8WkH4Ew7Q=;
        b=Ih4Tzm/hL96XHkVNBNjVq8oK+otf2SAPYhW+PD9ypUMfMEBiWQ1XpRHCho+6JjaLTR
         Iu9rf8nkJGHdQLXQ588S/aj8gTWswqWUf0D3GiCd/FMulErFo86dvgTw2STHAmlZeTm5
         NFNj9xSOKqCOI4mA0cGtcWHMS8wVCbH0ADCLIPJsqFtGvahVeH5J+mkkHZ1q22hxC0WT
         pWMOCFRJcGzJU9GLHftOjl5vk0S9ykKTN5BYnf56/LEBP1kGM1yOMYCcpViLU57JgALD
         JT8hP347jrbmcE/ov/HAPUXA0hAjm+nnPRRMWjdk8UKSDfyKuE8FJz6zNkP0mGSNkv5u
         cpLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/siLu1cmzxh/FMHPZ28gDvP33TjdU6NJUwYkptYQYC1tzQgI2CKd8RCfsis8m1c3pPkkOKA7TYjQL/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxeX6wLTMMn/R8PWit8c4ntUo7sPaXwQause0PCZl0dXmKdcSN
	91hFTs+KvT3hAYT5T8sBiwqZ6bN3gxDzDrU8crb62trotnaBqB6jKEL1thmAVKJd7GjwfaWSKVq
	nc41Y+AspxNmfxWEHXLuuYUqAc5i+vBris9Jh7dQjDe5ojAytgnFCqHAp8S9lrJubWg==
X-Gm-Gg: AfdE7cn2fIGVb4heESjNXVg3pQzh4ij2gJO0pfEfMZX1sMPgIiiGHbVRAi7+AhdQ6Xj
	7FJLM6hWZRgmx4p+zz4oHikVfW3Eh34BBFm21kr++8YivN3Kkzud6mPq0aOcgjRK1Fh2pogn27c
	vor1CDN9eY0JyWr8sr0qKOv57AkfhV9KHJt9hagZa+mvGo3JeisKrK3TCdLMh2Jo1tJlYb5YAMn
	QTe5xE8CqLu+7Wh4gZLUt0J9v7fp1LnlBIUoFbgDOnYruC4HKhpWUCFRfwHmBfc3RQOP8VgS7z4
	mEe31Pn90Xukar0VATZk76HiJ12C7uK18rOH98uK3m9uNtfmLPlQElRSg5qAeGRlvTmM0Qu6IRw
	nzdGMoUr57xSgE1xhinorsVX8lWdfmC8y532/Sz5KARfz8G1PTIuvpaWkYmFEboMjlWh8BmMNC/
	eFl71ZvmnxNgxA6zZ76AZ1QmWI
X-Received: by 2002:a05:6102:b02:b0:739:5cfb:50f4 with SMTP id ada2fe7eead31-744dfd6fd5bmr3646387137.11.1783582439466;
        Thu, 09 Jul 2026 00:33:59 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:739:5cfb:50f4 with SMTP id ada2fe7eead31-744dfd6fd5bmr3646375137.11.1783582439078;
        Thu, 09 Jul 2026 00:33:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a38sm5058764e87.74.2026.07.09.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:33:57 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:33:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
References: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfX36M5Nkl7tuQH
 ti4Nwtn0czgVzgI/L8jWT3ToVro2DkR8RnKU1NDD4W5D7VdjhfqPwyT7Hz/5hfFmRIHPece6Ksw
 psWNyOoNtUHXYD1TvwJ/h/gOonnszAH23QboY2qGG8OG45qPihciMdSFgupBersjGGrpxDHYV9l
 5U4Gmk4oN+1I3vug0lgisCOSU/MmmPJ87DqXaor5N55rRO8Jb5vw1ndnJTVcgwMsqqy1hWs8hLl
 wR7SIH4ynxn9+N/T3ngaMxTeLPdrayDRHWmJVXPHkBmQhWiHA8J4osVqWQaFCaf7Diq3CPpveDw
 gSG5c12DR/OaxqOIPPO7svHBZL459ReYbAlIeqweqf/THbLod6p3c5rN+++dbZwYGXPSAHu2TKG
 WKdPo3FAtzZuBzzx5fpwEfxwbskr4sq45HS9u98as+NrLCdvEXz/a2WsHk16fCSNmG0+74ztSKI
 EfwGeGPAqhnR7cRMiFA==
X-Proofpoint-GUID: 9fSd6VWA-vmY_2hpsZuTE2DSp6JTwrbO
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f4ee8 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EXRVaAyRHng4RDevV4oA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 9fSd6VWA-vmY_2hpsZuTE2DSp6JTwrbO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MCBTYWx0ZWRfX3F26/lDT7CcX
 Ipdc0qSNs4ue3/Hk6qP/Z77Szam+j5w8YN9iRbazJDdd6o5pVFxngQ1rxSWngyWHaUa31srPXRO
 A8DLSlc4QxKLDxbMWsLEgf4mmDdHO/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67108-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,usg2mizurxpp:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDDE872DDAD

On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> On 08/07/2026 13:19, Konrad Dybcio wrote:
> > On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> > > On 07/07/2026 11:11, Konrad Dybcio wrote:
> > > > On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> > > > > On 07/07/2026 10:24, Konrad Dybcio wrote:
> > > > > > On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> > > > > > > On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> > [...]
> > 
> > > OK, I can see how this thread is confusing.
> > > 
> > > The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> > > 
> > > Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> > > 
> > > OTOH we_want_ to make the top-level binding into a bus, we've discussed that several times.
> > > 
> > > To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> > > 
> > > Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> > > 
> > > That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.
> > I think this needlessly increases the amount of combinations we'll
> > have to keep supporting down the line (with a ton of compatibility
> > boilerplate code)
> > 
> > Konrad
> 
> Fine.
> 
> Lets drop the bus idea then. I'm happy to close the conversation as
> peer-nodes.

It think, this would close the path for upgrading existing platforms to
split the driver / bindings. If all IFE / PHY / etc. are subnodes of the
CAMSS, it is easy to play backwards compatibility tricks and
reinstantiate devices on the fly, pick up only certain resources, etc.

If they are sibling nodes, it becomes much more complicated.

I might be wrong here. Maybe we really should try a simple (heh)
experiment. We have your series which adds CSI PHY as a first class
citizen. And we have existing platforms where CSI PHYs were packed into
the camss node (and camss driver FWIW).

Which way of representing device nodes makes it easier to migrate
existing platform to the CSI PHY driver, while keeping compatibility
with old DTs (yeah, ABI, old DTs must continue to work)?

> camss@{
> 	existing CSID/IFE
> 	IFE SID stuff goes here
> 	power-domains = TITAN_TOP_GDSC, IFE_GDSC
> }
> 
> csiphy @ {
> }
> 
> jpeg@ {
> 	JPEG SID stuff goes here
> 	power-domains = TITAN_TOP_GDSC, JPEG_GDSC
> }
> 
> camnoc@ {
> 	modelled as an ICC provider and consumed by

I think, it's a part of camss.

> }
> 
> ---
> bod

-- 
With best wishes
Dmitry

