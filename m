Return-Path: <linux-media+bounces-52991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFehGQG1lGlbGgIAu9opvQ
	(envelope-from <linux-media+bounces-52991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:35:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AFA14F339
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 19:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482AC3037889
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 18:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA49374172;
	Tue, 17 Feb 2026 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxmEvdoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IowEU4st"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A829BDB1
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353326; cv=none; b=bbMtKpxyQ1Tz1as62KqVjwoi/7HG/tJm6GbKHrTmUnigavdcjjZnI/vLAAWYw8XITqQRkq/+yTH4O0o/7SYH9U8zPsU7memxF+tY2jTyD/LbSWd3h7rIARTi6nGkQ99pDfsfz0pHBorw0Q1ZjWTTfsNr5OZPrHgO+eZ7k2hubJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353326; c=relaxed/simple;
	bh=b96nWBBrMiohzTfpcBlNYGZvPJVElNYZ63gNBTfy7bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAqgzJmQY6xF/4MXHktA3ovBQ/dUUerck8shGr48CmOtI7SfCWt48k31ejTk5vUwCD6UrQlc3UOTrIjzRyRNx1gZMN0JjL1ViPsucdNBrrqyvEgHoaEXrPUoWPVauxZLcW7R4eUfnDDutnEdilIaMLTdtSnBzT1Co8GNl7bHYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxmEvdoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IowEU4st; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB47Vg1943541
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQ/ZdKhW7VMsbWZT49yCtlud
	XnrHTU2bpqIC7iOTAvE=; b=YxmEvdoce52rIZmFAt+u/PkswMfKPZDQz4XOmsov
	Z6dXVz8KrVivqWQvX374/Os+2ENn0DF2kivvKF5x19YXtZkAB6v3B7/4KwPR710k
	m463OORpEjN4DS0MsJ2kk1pQwMbyf+FpcBVOACPaTNLualQ4Fz/WwGi6v2iJt2ED
	v6mOjbY81TmxnZKZaQoIqn60Hv/oPmkNK3iIxahubsF7uJ1sT6tsJZnoJyY8GfdH
	5K6h4shHtECCOAkBxcftFsIj8/pRdVeLY7UvUnX6UnnBiM91GZCPR4wdLacvLmTH
	rAwpo/wVgruFZQW7gFmDJt85w6hHjTxI6Vh6j2FlQvpSCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g1ewn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 18:35:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so3061416685a.1
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353323; x=1771958123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ/ZdKhW7VMsbWZT49yCtludXnrHTU2bpqIC7iOTAvE=;
        b=IowEU4stx3IARVMbuBXELm0Mgk9ORPpSU/rlcHwNFHtJP/2LlWPEv0Xn2hxdC/we8Q
         J7X82ttCnGy6y30wEimfWrV098BY6aKJoy7E2BQajN1eoGs8BRijpUcl3c1nlIsZZ/5l
         xXO0oA+Wdl0J5YF5TKneOjoTllB9Juxt9kQqy45RjsEcM8uA3O/xN/T2XX48jXQrGJRC
         eyQdFp5KXWJ30bQvZvogMgNCN68sffBCFKQsqUKVeRMwqCx1eFbq2aiDJ68TzLrWhkUZ
         +yzQwxC/EVS/DppdgkeP6hfZriMVJ96lAnUpPeZZ3U4llB4K0+h2wIVuyPW8xRNVvmQ1
         wHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353323; x=1771958123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ/ZdKhW7VMsbWZT49yCtludXnrHTU2bpqIC7iOTAvE=;
        b=t+4jllxxC7JyCij1zqPIbmPki0+NHI8mdIidcdHKEmM1k3IbL6BiWrCs3Hczpk89y9
         1BCGhV8ua9SKdGdwJ1zcbn6CebpXEoLey3XXQ/lcekyidTT4J/OCD9pCbB+C+bdMjDVM
         8F1mZ9AJH12i5jEUpZyhWy5IK0h1aPNQZrzedemEsP5r5U844s4cATkutvYZF5Xu39w9
         hzJXw1dhy/DbA6qZ9tsNeu7htmdVEB8Sm9llUNYb+iVab+2HFgpyZUkNhLJSv5Wx46Re
         D1ea0NiSJYUzpOL0O4xBO9yz648QbWSi4jX02KLE9wVm0XZwmm6Hh76Hloef7tW+HjEV
         qluA==
X-Forwarded-Encrypted: i=1; AJvYcCW6k4dbX1astpkXewIt60YVNuaojUX663hePmr8ZPRR69WAptORvbZcna1mFsVnvYMe4K5th7tjIIdMbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw502wXFVTh4sgcXOzoTyWEHS+CQSGReFM0ArhqoghVEn+NzQsN
	i6Xh2927BKwDRvldoqF0wR66lCKC+GhD93sdXr9WZR1LNxvkpjGMfN6BQZOBOetIGUXevi1Ap9x
	+F/g1W9wyuZJtjpt6oT/PxhCZJLdtp+kbLIR1tYX+X/hGH8y1MmYPS6GnEmiJsQQGTQ==
X-Gm-Gg: AZuq6aJM+intb1VE5PrSAIZCXXmC/YUMIVQI+ayXPQLALBNKuwjfczUURvVsDtWrJbe
	z8grrnhMkX9aGrwYYZzgbs79ueyi2DA5GEYJXUN7YcG20BclrkYh4edocx1QF0UZEtYi4y+QysZ
	+EqXBFXXz/ivKYgA6P8KpWErrqDsCsk37H0VtTCor4zM6ZVr6RwlQ0OudabuFeKPMdhK7dpvrpB
	33DhRiz2l/geB+si2RnhTBmYFxMJ6qYeo/+crBrYe/C4gHa1JAK1KOrgJG6MoEbLFaAL8kr9r7Z
	OE6EyYMxyV8+PxfgorelHXGe6v8l1+TzQrmfp3mYJyTnY56pupn7t48cj6DgWFV6chDz9KAAZSe
	7A+eIgPtKEPc/RU2bwca5EPOANw/kXs2dvbQe+cvZwugPVZUYPmkOqwCuvnAhmvF8UVvOjSD6HT
	6E4Rwm5gFGMr4YwNnrPpTWWar+Itzf3St2GsY=
X-Received: by 2002:a05:620a:460e:b0:8cb:31d8:43a1 with SMTP id af79cd13be357-8cb42253ed2mr1810083685a.11.1771353323445;
        Tue, 17 Feb 2026 10:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:8cb:31d8:43a1 with SMTP id af79cd13be357-8cb42253ed2mr1810078785a.11.1771353322928;
        Tue, 17 Feb 2026 10:35:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38706928d9esm39925311fa.42.2026.02.17.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:35:22 -0800 (PST)
Date: Tue, 17 Feb 2026 20:35:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <xysdxwyb7nbynbanrn6j7ojgqnnb3ho5yljdiqm22vamlpaax5@ovy3xw7gtckx>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
 <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
 <logrdwafmqpfjoxyk7aqs3ahb2qhgqrtcxjkvtclxopkxqvrbh@q5zq46wxyrsq>
 <ff6c4a6e-9478-46fe-b17c-5b4221f04b52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff6c4a6e-9478-46fe-b17c-5b4221f04b52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX9q77FyNhYQ/N
 Bnv1hBV/+4ukHodkvSfRhH+c0NSbGE619hPGFt3H1RdBEqqFS2YYS/lqlJr6FVGLbSBwbf7sxDJ
 yMJ4IV+2liMX2fN9BSXnpIrcz3eMam8AIoz0dJtuAIhosBLCskw5ce26Y7sQNcGLDnNrqdE6tyZ
 RdjlJV/oMd/9JUpctKVM6/lFeq5GOUQBRdAx95H5p88Z3LYN8EtMo+Rfjrv193p9VB1iayc5xyX
 ZTIPksNosxzOSc4HVlbu+AK7PnhBMgNI5e9kyhRdonMCANuVaYApqLtSd/f9sTRC9Ny1dnPP7W6
 ssltbHHrVuF/0vCGKVQRyjqMroainTObTkciQ4cyvFkTXzEIktaRkmm1kUUbRqC+MU+gehIrKn3
 sNXuik6+7aAtHAsK/HS5gAWUFdv6WvUguXzh9gAtTPVuvNHCWbXbT4gfm3RrwPU8wpf1qMm07Mk
 v3zkL8NkYU7OnGx7f9Q==
X-Proofpoint-ORIG-GUID: jvP4bKV2QRSALdI3Yu94ebwW_d4ZJHsD
X-Proofpoint-GUID: jvP4bKV2QRSALdI3Yu94ebwW_d4ZJHsD
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=6994b4ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=a0tnjT4OmPkcAwT1YvIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52991-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1AFA14F339
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:39:53PM +0530, Vikash Garodia wrote:
> 
> On 2/17/2026 9:45 PM, Dmitry Baryshkov wrote:
> > On Tue, Feb 17, 2026 at 09:04:52PM +0530, Vikash Garodia wrote:
> > > 
> > > On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
> > > > > 
> > > > > On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
> > > > > > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > > > > > compared to previous generation, iris3x, it has,
> > > > > > > - separate power domains for stream and pixel processing hardware blocks
> > > > > > >      (bse and vpp).
> > > > > > > - additional power domain for apv codec.
> > > > > > > - power domains for individual pipes (VPPx).
> > > > > > > - different clocks and reset lines.
> > > > > > > 
> > > > > > > iommu-map include all the different stream-ids which can be possibly
> > > > > > > generated by vpu4 hardware.
> > > > > > 
> > > > > > It's not how it can be defined.
> > > > > 
> > > > > Do you mean to elaborate the different entries within iommu-map or to
> > > > > elaborate the different stream ids and how they are grouped into different
> > > > > functions ?
> > > > 
> > > > The comment was sent three weeks ago.
> > > 
> > > yeah, if you could still recollect, you can comment.
> > 
> > I think it was more about 'stream IDs for pixel, secure, no-pixel,
> > firmware, buffers, non-buffers and direct insight into the VPU memory'
> > (pure example, as you can guess).
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
> > > > > > >     1 file changed, 234 insertions(+)
> > > > > > > 
> > > > > > > +
> > > > > > > +  iommu-map: true
> > > > > > 
> > > > > > This is totally underspecifified.
> > > > > 
> > > > > oneof would be a better approach describing the possible stream-ids.
> > > > 
> > > > oneOf of what? It is items with the definition of each item.
> > > 
> > > something like below,
> > > 
> > > properties:
> > >    iommu-map:
> > >      description: |
> > >        List of IOMMU stream IDs corresponding to hardware function IDs.
> > >        The number of entries depends on the SoC variant.
> > 
> > Do we again have a story of variable number of entries for the single
> > Kaanapali platform?
> 
> its for firmware stream-ID, which can be managed by kernel or Gunyah.
> Handling for it now would ensure we do not have to change the binding later
> when there is a need.

In my humble opionion the firmware stream-ID should be there, but let
the driver detect whether to use it or not.

Another approach might be:

iommu-map:
  items:
    - foo
    - bar
    - baz
    - ....
    - firmware
  # firmware might be handled by the TZ / hyp
  minItems: 8


> 
> > 
> > >      type: array
> > >      oneOf:
> > >        - minItems: 8
> > >          maxItems: 8
> > >          items:
> > >            type: integer
> > >            description: IOMMU stream IDs
> > > 
> > >        - minItems: 9
> > >          maxItems: 9
> > >          items:
> > >            type: integer
> > >            description: IOMMU stream IDs
> > > > 
> > > > > 
> > > > > > 
> > > > > > > +
> > > > > > > +  memory-region:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > 
> > > > > > > +
> > > > > > > +        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
> > > > > > > +                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
> > > > > > > +                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
> > > > > > > +                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
> > > > > > > +                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
> > > > > > > +                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
> > > > > > > +                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
> > > > > > > +                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
> > > > > > > +                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
> > > > > > 
> > > > > > #define the functions in the ABI, provide them in the bindings.
> > > > > 
> > > > > Ack. will introduce a new header at [1] and define these functions
> > > > > 
> > > > > [1] https://github.com/torvalds/linux/tree/master/include/dt-bindings/media
> > > > > 
> > > > > Regards,
> > > > > Vikash
> > > > > 
> > > > > > 
> > > > > > > +
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

