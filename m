Return-Path: <linux-media+bounces-64338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ckY2BiWWKGo2GgMAu9opvQ
	(envelope-from <linux-media+bounces-64338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:39:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E95664A03
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:39:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YS8wolOF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="aQpSLMT/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64338-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64338-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C887D307D99A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 22:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFD63B14B6;
	Tue,  9 Jun 2026 22:30:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087138644F
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 22:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044249; cv=none; b=TLn/pfrxVB0ReUTNBkiqWLXLHAxicIiiqeucNq1usxXN9k3OqbUc1bDFhlOArm/yg1R82PS5gKSYukbTQirQEJYSFQpr4+TMzTH/MZJeekzSqd6ujTKllrG/4Cfa0ZjVv4dL3b+JRMxTUcLKNk3BE0jc6B/bGAR8a7UmOS6I8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044249; c=relaxed/simple;
	bh=ycDCQVzs3bYcZrgKp53P5Z9+3Dh2LVN1jCfn9Sa8Np8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJnimsn5Grn5Duxdsf02hGUDiFzmi2OEjCmqUCcUBjxCtwWXI4NxYzP5w2MvOx03t6m/WtYxCN4HMBdrVFHnQ3mLMeq3d5RITM7xO5wpCK4xVmlnsgmG6y82K+gKA07lg6Z0/amQUekDW+gV2TANbNM7xKarZTPBkYVWHm6Nqb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YS8wolOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQpSLMT/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MEqUE1918306
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 22:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La34ew2wgKgp7mm7zYqeehw+
	iy9Zo1DfBPTBVSWV4T8=; b=YS8wolOFXlrupfWiG2m0wui+utFzo4Odo5MxqZ/X
	/Rj+dd0MlpfZ2wFhtV9EpPc8h1eLN4hex0PNsC+pMERgI40TgUslRdH/BRL4kI0X
	d3JWZrZvG1ul6CgQ0DAsJbxFTfu60hNkDEiTjZZj1ej5uq7VUugR5hJ4rrUvFFOF
	THql6Hx6bI9dycwrRJOsHMfjb49iikxcWx3udysM6moU+YL07djlVe07L4kBdM1A
	Yhxoy4DnboaqFMYBUukKbhXlQN/I7oflveyMRbtVky+Nx0DG/AZvhNKfLFiqN7QV
	vq/U5pdQulAPiLR8Nog8Snq/dKy07J5z/+/KmeESvD0pMQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sv1cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 22:30:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso3017270137.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781044246; x=1781649046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La34ew2wgKgp7mm7zYqeehw+iy9Zo1DfBPTBVSWV4T8=;
        b=aQpSLMT/TXammurLabyYmktQ3OsvKP2Iq/yNHA2T7SVi3mW7o5EeSicpNvjmXKqVMv
         ybST9RTuGapgeu24gYJYYOKPs1Ut7fDGpxTRRdHhmK2ie5yUY4VXvEFxaoXLsYjjqLXB
         9ufZR8qyxtnsx3vW4pPblvP69sFE3SQXdUjXXEH+t9e/RtR6XG+7NyOwzS5F5XHQuBqm
         M2lkbYble3O7OEyPaSzLGsoSdYrpK+Yr5ft6hGchJ11wB7eCxvu30axKv7JxvTW7wxKU
         hbgFxReee4mZZ1wfcUqpyeLheDwngKyb+HjuB4Fdedz6oQn19kFfJeBWr/1b6LrPQIuD
         JhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044246; x=1781649046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La34ew2wgKgp7mm7zYqeehw+iy9Zo1DfBPTBVSWV4T8=;
        b=MsW/KrBpdKH6jCh2tcRsPJkYZz4yO0uMP+5lBLmCX0s8bC4VZTMCysXDHftI2G0Suv
         asCRKuYgdJZqRLhCUHQ1K5EL5pf6gKtR3C546kdmsEosTFKLFyJgWJrZPqv6USZzWd9c
         FR1+ig0BoV33SdSfvuJKm8M3Uc96z6mQ/rBPvyZoJeBp0sGz8tsTHFa3Cj2v1QKrW7k3
         TVjGnaCKasrB5INc1EJm86Fe7Nu3h1duUddiDQ3lEyGYH/SAQV3hFIosNUJkt4qrEU47
         DzywILkVIb1oNWPXlnl5K1uiJFxcPNtIE7DlqSsaiB9EKEanbRQ83ZZMG/HetvdDPI/R
         pwDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xoI5ofytR0Dn+C41zin4TCHWuA9/Qv+gsVKqzQg5UB4bM1jGHkGHxWjh8jXWAiz3wlb/f34H1pv76nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXNaLaYkaIZEIhzcUPmiHGf3Eiv8YAsKkapvtAVq1TVq9Y2G6O
	ObwjA7XgtIgFg7WQo12k7hgwUlPsRX0/5YRkntteWEAAC6d/ZFk0rH61PW4Ia/906o/yQ5K6JRS
	tHYLht4gVb/1mR4qJ/i7BqZUwXFp5Eem61RyP252aFu8Ipv2xNv/J1VWE3+S3bf7/Bg==
X-Gm-Gg: Acq92OE6x4NavtVwMSexZurTc4v1sj7Vl+pIVnOGUOd4C08LXnapxzZAYZLYGRe1f6N
	lZvYljeh8m6KRzyebJASP2Lw8jaVjXoODBOe+i9DXInHB/FDlr8LFiPu9yJgdXY04OkNZsG/Ah3
	1USBogWXeiNbF7AQfX7XDL/wWrTksnckDVstGrGxATqQiK5hoihAmVBYu7y7F/RKmHaru00Fdig
	En/TueUudvlCXKoEbUhftHr/tClXS+n2YlQHeukk4cR46DQ9SY9UwR4MtZJ0IjqbtRma6eaPPJG
	mgjiuu3yUm4qxiTT3kvCTUqvTZnmHqoEbJpQshAPOHS/E9gBWS8nFQmAO9wz5yYiODd6dYPReeV
	C8/KCbs9wMhyELVcpd5PWMuLcU92TlNnkxrOGrMDxDF6kNMQZOTEcsxFGX17WzT9zCJLQAZhc1e
	EgA0Ejy8MjenRdrKIdgwskUpg74yDjJ0py4x8pNH5rbAkq/A==
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr12012577137.2.1781044246006;
        Tue, 09 Jun 2026 15:30:46 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-6feef09ad62mr12012563137.2.1781044245544;
        Tue, 09 Jun 2026 15:30:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a71fsm4952740e87.46.2026.06.09.15.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:30:44 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:30:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <qt2d2anvwlubaicwhw3rur7u47v4swqbctapcw5qek54f2yzdu@ljd46avkfgy4>
References: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
 <335238ae-c476-40e6-8639-44258fefe988@oss.qualcomm.com>
 <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04479989-8aca-46bd-8153-1dd033f1fdd5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMiBTYWx0ZWRfXzZI4E5DdE3FY
 v6LW7VzMYylDXLO4bQV/B94W6YjDjX9xML2oZndzzNSD+NT5bqI7jLU/oiVll2O5hE5o24v8dni
 fAeN5UyLxGQsjZgK8d341RgeFf2SxOd+MCsesjpwWa4wQY6d/x0YJCnunfeSjEvQ7wqknHBZIpp
 +AyRkRHuQF6uLqMPCihl6msqNPme96ym/5c77Y0cMTLt2DQnPGQo7oSVC995rW8NPPchtBODXTd
 xazh734Juk3cjxWOmzASsjGDWQwWR3VDi58hebHNgVb9ccbLTsHpZRKuin9B66nVhuGZcr2PyK8
 /zeyPtu4LUvoNEeaHTrROABcK1nqEbIBrC8NcFakYBjLtL+ngNrlBiE7IRV2wHoxc1BDpkCZAg0
 ozlv10Pm9zX14abMa78+oCvsCpYc5J58AlSCttq73EYH1th262J0xxLyICVL73IM5CDtY5ryUQp
 4vzNTPiUn5DL2hI2T+w==
X-Proofpoint-ORIG-GUID: frCnDLWE3C1MD0upXW9k29lEBZ89BHH7
X-Proofpoint-GUID: frCnDLWE3C1MD0upXW9k29lEBZ89BHH7
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a289417 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=UJ8pcXwihaggFu0x5dYA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64338-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ljd46avkfgy4:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:vijay.tumati@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66E95664A03

On Tue, Jun 09, 2026 at 12:20:56PM -0700, Vijay Kumar Tumati wrote:
> 
> 
> On 6/9/2026 6:56 AM, Konrad Dybcio wrote:
> > On 6/4/26 11:06 AM, Bryan O'Donoghue wrote:
> > > On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
> > > > On 6/4/26 03:30, Bryan O'Donoghue wrote:
> > > > > On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
> > > > > > On 6/4/26 00:18, Bryan O'Donoghue wrote:
> > > > > > > On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
> > > > > > > > > Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
> > > > > > > > If CSIPHYs are true subdevices under the umbrella CAMSS device and well
> > > > > > > > described as subnodes, then likely none of power domains are needed
> > [...]
> > 
> > > > CCI is not described as a child of CAMSS, here the situation is different.
> > > CCI probably_should_ be a child of CAMSS given the design we are going for here.
> > Yes
> As of now CCI is an independently usable device to configure any I2C slave
> that is connected to it. If it is to become a child of camss, it should be
> self contained, as it is now, and camss may have to become a simple-mfd to
> make the CCI independently probe-able? In which case, we may want to follow
> the same protocol for all other sub devices like PHY. However, if we do not
> have any requirement to use CCI independently (who can confirm this?),

Uno-Q uses CCI as a semi-independent i2c controller. There can be other
similar designs.

> probably, we can stick with devm_of_platform_populate() model with common
> resources at the CAMSS TOP node and sub-device specific resources (only) in
> the child devices.

-- 
With best wishes
Dmitry

