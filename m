Return-Path: <linux-media+bounces-66974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qtU0CxA3TmqdJAIAu9opvQ
	(envelope-from <linux-media+bounces-66974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:40:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B3725F26
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="NND7h9/v";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QzhAhKy+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66974-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66974-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E605302495B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019D2433BD3;
	Wed,  8 Jul 2026 11:35:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05013D349C
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 11:35:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510527; cv=none; b=MDtnFqyPDmC/ZuiM72xvOcWVLyxerIt/StdVLT8aCNoENPd3DXQHLMKaOr2VeFoPe/wYt1zLiKA35UdM8lbeRJrcE6LiRw1hlV9x4baY/8jLlSftO+e4+wZpKr1x3gvsytDZDY9yk5NXtBcsVex2Irys3MjBr63xmhuOKhnPqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510527; c=relaxed/simple;
	bh=caobWd1CoFMF+lSi5m8Xq2Q8TS4AG1Esov0kiltI6KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZ9s2IM1KiOWSjtGoyTMtkwc1E/TKSl6g4NSphMo/XOU+Nc5vUJer/vu8FljHBs3/dQT+1k4y9//orcs6C2iaSJpV/9et6lXAp9ul4PV+YqJuUFpZWBaHsB9WCZK9MR81tJaxVcFdaLEZ17zmKYhV916zQBAqKaHYzDFzBJb5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NND7h9/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzhAhKy+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BTKqb2589968
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 11:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMXCIjJLYDQWitFdENGzcHmyj7GI4mc6ck8IDVliH3I=; b=NND7h9/v6h1+VbRz
	+fR9lkB0Ie8ZNTR1Z0IWrx89XW2YeyR+DZX3qpwxga123tdZ+AuSTo4HfzPMBH57
	TvWbFcN94gc0r9nM/cze+OLlfXVnAJW3WmOiCuLzZa0SoXNsTFqF2TL1e7A26nE6
	klYP55MXz1qaZuliJdovLn6ND0uU8jHaIh1hlkbyUU8m1HJS1j0N0dZ4XR+VRcwp
	7FPOYDkZkB6OP11HVVAKibVNRrRQsQGYx0fH9jpSHVXlvYHApLWwkJz7dhrx3LWF
	1UnKdEjzl2ZNvNTVGjB446daf2kVCAIBxrlicKu39FbDUzxEmNtKMqgl15RcLxt9
	fWxx6A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgtxsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 11:35:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7c828adso43349137.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783510524; x=1784115324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMXCIjJLYDQWitFdENGzcHmyj7GI4mc6ck8IDVliH3I=;
        b=QzhAhKy+p1WmJ4u4g+aXYhIhYkSO3rqzHhh4Yv+tInvKt81W/zEqtfgqTpp2DDA7Av
         Gig7htkqcKuG3DGtmXeY4kfCUPuyoKmvQHqiseLYHq/fWrNUb1DEijJue6FuZkKAD2zJ
         KS3fNc3bbTMOuxo6wJgkH4CuzCXCDfCdVjVDvbzVRs6YOdRalkznWlVmGassT8hvUrL1
         +OdkTfg27V49ONuwzoL6B5/NNfPROahK867DsMWjb5vSJJVSKAJQqt3NPVHBSuRipbnE
         yJRbxzVHPi3J44QMqfgYDJx+4wHS9nS/LhOxTeV7j2Ia/4l87W3c3QIRXc3r6OY+jl0A
         S0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510524; x=1784115324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jMXCIjJLYDQWitFdENGzcHmyj7GI4mc6ck8IDVliH3I=;
        b=DAPGCjL1Cm5LIqLzrsqJyToySGofCAvp0618i5tLTiGu/THpLnIHx2guxMD5gK2tAd
         krsmFConUo+urOUI7aTuMr82hW2KUx8NM44FpF77h25CpX2PhMoifLLMPuxp621pgvcf
         kdo3BBo8PfoMpBts6//CaarvMTsscaM0KskxTZC/j4UV5LTW4vho9LS6kx2KxX1OJpXM
         CKlgpCc8oeQxdfGBS//3QH23nY6VdakWYM9S8NnXB/5xSLvQ0D+woTm5yeqa0yPQ3ciA
         lcn3jpNzEUDxjMdTydy/tAsig7yB0sbKFb7e9/wbQn37o3NkL6wOk8Z4dO8Lq8r53HAv
         7FFA==
X-Forwarded-Encrypted: i=1; AHgh+RrU3tGR8KGUp5lvb4JtHe7q4elzqmP8vRW7Fk5fMAyoRTtY28igNYwykkjnuW6Tf9D+qTVtvEwlO4LKIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAJyvZW71dShb0BOOevM3QkyR0pbCVSkWmN+GEIo4JRjrZWn0S
	6MG8IJjoVkYiLjFlWrIcLpDT/N9pFJ5YsklVCWTVEvo+fBSBAadGFonSPQxg84gJZMt5BKK0Hcf
	1xVdt7p17mKGu+Kuhjl5EYdvEwN1mXGm5RPgkZZ3dH1l+RA2lBw+iMUpXqbfpVD7BrQ==
X-Gm-Gg: AfdE7cmfqW4KJavlAZSKYzKkOhCZtmHMAJdJ2AzEL2b/bkhHA1z63rUz21wzkp3UGJv
	QbQVCLrG0M+bqHYHLnaJmC2FB9H2CufHX++W51pGhXBsPCg6BGqHN9A7gR6OXssAL+I6LAWGT6t
	kZPfUFLsfiWoEKt3LSL+0K4l0xPtLUkJB889kTyd8My4WRPAb00uhxmRgYHIRYyCYf29CXVK0ys
	pEHLvpOJyeCfmoIwgmkgyv2F01ALtCLcOJRYxSu+CRPcN39+ggc7qhhHMTGjNF/AJQg9ee3GhYK
	oqLjkWjc2OqmtOdzEmsdiWoF6RKylNCGm8X3I5rsrVWjPggvvMNHK7HIKx6cMgw2UuSoxhWLdkE
	8AvDoFaohKcDEPK1PrC3xYaeYVxyC9nerqJYVcjCcV00goLBong47DQ+BRfE1aWalO/2Zl01e01
	6vDceavSgwbRZuX55X3g67HFns
X-Received: by 2002:a05:6102:5494:b0:739:478b:5bf2 with SMTP id ada2fe7eead31-744e031a69dmr1009330137.13.1783510524021;
        Wed, 08 Jul 2026 04:35:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:739:478b:5bf2 with SMTP id ada2fe7eead31-744e031a69dmr1009310137.13.1783510523546;
        Wed, 08 Jul 2026 04:35:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad357aesm31978761fa.10.2026.07.08.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:35:22 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:35:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
 <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
X-Proofpoint-GUID: BLk09rfWp_ofGxe-mPBZtllBSg8P5Cmo
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e35fc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=-aB-LbtdYsWEe7JLRJkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: BLk09rfWp_ofGxe-mPBZtllBSg8P5Cmo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfXz+oFreGCJGYl
 ysbEycwmYaHn0PYhaFTPYtOaLcjF4hmPtpH0hnLH05FRDqZb0gYBdWK9uXQFfEEdVsYaEE5GLwD
 vEz0nTPe1CdhOYbO5OlFEFfi10qLLaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMSBTYWx0ZWRfX6JW3D5imn3TM
 zzCuFmCoDwMuAz4Re0fOStwr9mcF0wDQhuggNjuQ57tLpusfG79KSRS/566e0n6rSKVIBHq3c68
 bOEq2DD6H9VjM15aBZaGLsZCiiEfD+HTO6wUgQtnqSJtwKi71Q6lCU5eb/DiZaJK+X+PDeQiEFz
 FqwAwVC3zrcnHIK603afz1cJfGHAN2NQhE/PVztDK788JniW/DoQAhYLZjGpKTmNKq9/ezWlOZW
 dJy1/ZEshKL9UYAfTBllC5+VAMVmQ3N0tULXrAXZdEJA72T0lwsUBnLBcGRyiKuLiAjGtYgoE14
 uwWk5dOCkVLbu2YcC6cQM9vfoaE0uPmf+tvQD82wLVtkyKIEJCBXC/pXaMvZt6BWKyGSTVOgJGz
 K986qDRXF9U7uqgFD3JuPJFaQborHnRxYAFMSr3E0aPq6fAMWGwqedjcbEiMyH8ZaJxFPKOPIbm
 u1Wnp2571hZc6VavGrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:gjorgji.rosikopulos@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-66974-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 941B3725F26

On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
> Hi Gjorgji.
> 
> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
> > Hi Vlad,
> > 
> > On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
> > > Hi Gjorgji.
> > > 
> > > On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
> > > > Hi Vlad,
> > > > 
> > > > On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> > > > <snip>
> > > > > > 
> > > > > > +            interconnects = <&gem_noc MASTER_AMPSS_M0
> > > > > > QCOM_ICC_TAG_ACTIVE_ONLY
> > > > > > +                             &config_noc SLAVE_CAMERA_CFG
> > > > > > QCOM_ICC_TAG_ACTIVE_ONLY>,
> > > > > > +                            <&mmss_noc MASTER_CAMNOC_HF
> > > > > > QCOM_ICC_TAG_ALWAYS
> > > > > > +                             &mc_virt SLAVE_EBI_CH0
> > > > > > QCOM_ICC_TAG_ALWAYS>,
> > > > > > +                            <&mmss_noc MASTER_CAMNOC_SF
> > > > > > QCOM_ICC_TAG_ALWAYS
> > > > > > +                             &mc_virt SLAVE_EBI_CH0
> > > > > > QCOM_ICC_TAG_ALWAYS>;
> > > > > > +            interconnect-names = "cpu-cfg",
> > > > > > +                                 "hf-mnoc",
> > > > > > +                                 "sf-mnoc";
> > > > > 
> > > > > This is the topic, which may raise a disagreement, but I'll repeat my
> > > > > position about the need to remove all "CAMSS bus" specific resources from
> > > > > the device node, they are found and should be allocated on parent's side.
> > > > 
> > > > The interconnect has functionality to handle bw requests from different
> > > > clients.
> > > > 
> > > > Yes the best will be to have camss interconnect, so jpeg and other hw's
> > > > to vote
> > > > 
> > > > on that (actually it is possible in icc framework) but what is the
> > > > benefit of moving
> > > > 
> > > > those to camss? Is it not better to create camss icc. I understand
> > > > you want them to be on parent side. But how to vote on bw? Most of the
> > > > time it
> > > 
> > > Let's concentrate on hardware bindings description, no APIs, votes etc.
> > > at this point of discussion.
> > I agree but there should be an API for icc voting which Jpeg need to use,
> > currently it is fixed to some values, but voting need to become dynamic
> > at some point of time, because it depends on runtime parameters, resolution
> > format etc.>
> 
> Sure, but I believe it's quite clear that any software implementation
> should be discussed only when the hardware description is fixed.
> 
> > > There is SM8250 CAMSS device, which serves as a hierarchical parent (or
> > > could be considered as a "bus" device) to this new JPEG encoder device
> > > and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
> > > get hardware descriptions as children device tree nodes of CAMSS parent
> > > device tree node naturally.
> > I agree the device tree is best to represent real hw topology. >
> 
> Well, it's not just the best, it's the only possible way.
> 
> > > Copying of the same identical information about clocks, interconnects
> > > and power domains from the hierarchical parent device to children devices
> > > is not needed, and practically it only lowers signal-to-noise ratio.
> > Here also i tend to agree.>
> > > Since information about the actual defect in hardware description is
> > > reported, the problem can and should be avoided, the handling of a better
> > > hardware description and dealing with any kind of complexity will be done
> > > in the CAMSS and/or CAMSS children drivers.
> > > 
> > > If you need to get a bit more formal point of view on the matter, I'd
> > > prefer to see descriptions of hardware properties organised in a tree
> > > topology rather than in the originally proposed star topology. By doing
> > > it the system complexity is reduced from N to 1.
> > 
> > Maybe I'm missing the whole picture of your proposal, but I want to add my
> > point of view on this matter.
> > 
> > The JPEG encoder HW block has no dependency on the other processing HW
> > blocks in the camera subsystem
> > 
> > It shares resources like camnoc, clocks, GDSC, etc.,
> > but does not share anything with the other HW processing blocks. For me,
> > the JPEG driver should not have SW architectural dependencies on CAMSS.
> 
> To move forward there should be a clear answer to a simple question,
> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
> 
> If no, then JPEG encoder device tree node shall be located outside of
> CAMSS device tree node, all resources needed for JPEG encoder device
> operation get their descrition in this stand-alone device tree node.
> 
> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
> device tree node, and only resources specific to JPEG encoder device
> are described in its device tree node, because other resources are
> already described in the parent device tree node.

2c from my side (for both sides of the discussion). Please keep it
separate, if the block simply uses the resource which is also used by
the parent (e.g. there are no special requirements on the AHB or sleep
clocks) or if the device needs to actuall cast a vote on a particular
resource (e.g. for this to function at this performance level, the MMCX
needs to be at the turbo level OR for this to function at this
performance level it will use 123 MHz of the AXI clock). In the latter
case the resources must be described as a part of the device.

-- 
With best wishes
Dmitry

