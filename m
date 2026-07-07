Return-Path: <linux-media+bounces-66861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RbNBBHkYTWoYvAEAu9opvQ
	(envelope-from <linux-media+bounces-66861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:17:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6971D278
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 17:17:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p0NaCsYi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gHQ2DEgD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66861-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66861-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F25B3202583
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 14:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF46D33DEF7;
	Tue,  7 Jul 2026 14:47:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4152305669
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 14:47:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435658; cv=none; b=NRgNg3C4WDnOMbJ6eTZj3bR8UcwfSDf7Qb6kmSnYrOXeLvtal9OHUz2QcDy4f7jHCXWLpxEhldVSRyqTbVQ8zhFXaU8ZkEcrSxl8TBNx4S+njrS9+8AOD7/LYzCgPDLZ927Y97NRh+uICYlaymJDECTQ781RTE7DB7dok8H5FAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435658; c=relaxed/simple;
	bh=kbB/eBRZgg8WpEohJaYOhBTmcXDJ4/L3JhRiQEfaGtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnpgY7ygBoWc3m02/g/o2+wFbdaQJ45Z8hwu6LSFWMeZ4/sFHWTAPWH3QgIPQh8kZiht6koZMjGjOpHhyaEbsdgL9iuVnvUw4nyBqK/O8ALoqmCkNdJK5ngFwADdnkbYc2nkzG5Veb78rpoKLNoxYLHa6iQCaqHnagrl9c4dg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0NaCsYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHQ2DEgD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8s6I3676399
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 14:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=; b=p0NaCsYiWC2KqUWR
	XSBHszC+Ja+g2ZwIFWFp9g/5FUjNwtQge9XqWfGw6sW30HCuKbAVoLt6Zy+QWHP3
	ftQZh+j4LdrRwvXnqWqSmC6ffC3xGv149tGagUZ+kTHCUgN2WJwb9bnOI0Dn1zjL
	NWG+IOy3dukl+KbAcIIsdjUICVoSAB2LM/O0zkRnw30JEX1i64BDnjW0381vjvq8
	QUYatQAS9+jYcCJ3+QU1kNE/TYSSrO4DN1MQxpYOOmMf+yCw0cfk28xYDTRKD2E8
	XEt12NOYzcWGIwnZBq6BGVxpHUrUhbvKSomzQuJUaSTz7/tpDIwCsr98Lb2dLwUo
	MmeSEA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15aj2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 14:47:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751db2792dso1413692137.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783435655; x=1784040455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=gHQ2DEgD/1mICNUSLDCoCnmDKKM/yaG0CKh9zMk/HOJcRn6NR/rkszhcw1g1kD5E1o
         9si2PUPL10zuL0T0MsVTOq+NsWEWn8rjdGPK7vX0ViUW2BE//kfyhIdjMOJ6E93AF6HI
         9EDe75u0O6nxSSomQ9uRa7KJwZNs77E80mGe4IsymzHhKN25lti0nz71mkgoq+Vh3Bu2
         eKXFAyTAXZcZNDHk0/OAK8DNTT/AKoO3rjRX0zhdS1YkkybovswsSbELYCxI6zJ8D7Dw
         RQb0j/pRjw1hU+EpmkcMoNLjysuPITCvOaydH6+11Wj3OK4FSuj3NgeWU1G7cU12rDAP
         1y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435655; x=1784040455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnL8n0Rge/PLupFS9hJ3iC3ksta3Fq+O1fWOUkKJBYc=;
        b=Addc3iRakMW9XLQDoLYOGsn4wsg5DSOsgibALnPpMkAk4fqj/kD4p7nwk7c5+kdABF
         /AMec0y0L46jaKjt6k6dia1H1MSjibCwCZKrW4XEnoxhXSb78S8HsGs2WubTtvFKhbzl
         hHLQKeD3Ob1+2bIMRVU+hE75bzGd+jftYsUPoBPo3Z6LJTaDLaquhpSZ+BuO40wDzAxg
         PXPyZragYb1pjGYY3Wo2fUm4NzRGLnpqS5A8+rUEn7zQ1mMoN0oGSEArP/hIqFqSwUoX
         JFXyNx42tpBLpbpteVulahsG8Ion3V7AjZ5VOs8GdA7X2xCXwntmf1sKSyN52N2i/aKp
         LCmg==
X-Forwarded-Encrypted: i=1; AHgh+RpF10QkC5Y3q5OC0JOjY+e65ESiu7gZXoWQvxo9vX5gXzsEhTIqVrEA0+u8dP+kV398xLWUTWIp+bXYsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhy7zBHt3nDeMUEKHDp+7fWo0DzThkQILGYpCgOCr8BjNN+cr9
	NBHfMhx+RMyPYDU6Ey2k7Ve/I/Fiby2XbSYgEOklWjiBiFFzRUm/ebmqqtPmgdvKRji2i3BCixf
	1D5jGt3t5V9/DI10fw3zCfT4m9IJF7xYthT/lKHSxncdnQnYiXm/lZuqK1swV2BndWg==
X-Gm-Gg: AfdE7cnQfaCr9NwsVAFAYkyJ/MbFPlJLvbz3gG2lPRjtWoqN7rWCsc3U6ktaHHPy7Eb
	Ei5JlRy41EaWemPgWe0x1WmajagTealVo01mZ4/w0U94QVJ0SLs1eH+EUQp1A830CYOcbSVkrHd
	2vrHCD41MW6rRLl5nfY0kOwpRT8GXCCgNEEIYk5hY0pF+qq6a8RgJMmYA3175ZoVFoKJxgzS3Y1
	1fmTB5hG4DaO/YUxEdP0NuMHN9nB9OzssWxM1UIxTiH/x5ouL+R4KEhQSXlGnW9HZ05RCZ1LyLW
	e9LCVYFM+Nt7B14JZ0vMp3v61DH/q4gKcK8D0onVUw2Wq4fU9nrGDpdaRrvPn39gJtbjzYHfGem
	xxJeIHLEGoR4V9HfBUwTX3R1p7oiWxBVmnkayK29xdiXgmgB0SjuYon6eV7IoUAWnF2VuyHPfCR
	3ncn54IwYF+Tv2YeipD21CErNU
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208834137.11.1783435654677;
        Tue, 07 Jul 2026 07:47:34 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:726:cd42:d023 with SMTP id ada2fe7eead31-744b7a8eb73mr3208733137.11.1783435652469;
        Tue, 07 Jul 2026 07:47:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm29360981fa.13.2026.07.07.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:47:31 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:47:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <n2qzqh7xbyth543qzhufvmqctjqeqzjtn7w67u77meau63vpar@a7ossfgoctqo>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <lxwvnkogwkwq72b7re25isnidjl5hzior4gvftww6vzmngus3d@sdqeb6heki76>
 <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8cb6b7d-f8ec-4e37-8a5d-48a91fbf74f8@oss.qualcomm.com>
X-Proofpoint-GUID: 0pMDlQ9swcnFitMN85bfoWcIJ-fLl16H
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d1187 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gfVf64230eWH3T0bUGYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 0pMDlQ9swcnFitMN85bfoWcIJ-fLl16H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfX9hAbG+0W/tn9
 3Yjswi338LJFV0bLeLL8Z0WxQz2sqyabmhWgPDktt41AIvJXhPRiIqRuK8XZAqbVVC2uPgZFG6e
 6442U0afk67va6gTsVGSGp8lrqhiN6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0MyBTYWx0ZWRfX9ViPN6Gxe4q6
 3qiQgQwDkBngoI7ZPNyrQrg3xli5/bdmKNKWDz4kIRyH2VHSn4LJOw2y7dZaV6q68UulhHZigDS
 SNDPZNFa7aDa+B9cvvAGqvB2qfDJbKyJ1IyDi0LYwTiMdRhaSqJSSLhb3SQWx3qf/hD1bcnpW2j
 pDJwy8QkkrlKpB9nBLd7QDOJVybI9h0TAW04lAN/MY3kjH/ppm6LbEm3FCymA70aBlVAihs6Zn1
 0nZYddBhhAUJsof+62iQ+OwUFHiMGCDA66BPGg0hplIKA6VccPQXvwNIexuBQ4QkIrulqjnyJDG
 zBOftod90SILrSkBlL0Yo5lO1mNOhDMrLtpH90+3T0f463XewH4n+s2EAauLNhTSN7tNXcCgvAk
 roygwxo9+wEBRZI/194FM36Q3SMZHYknCzlIVqx6mUGYfQbIivrko2ulR0DVgSvEiBoveTPCvWn
 24RPBOCOerBlDHmSjCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66861-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,a7ossfgoctqo:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FA6971D278

On Tue, Jul 07, 2026 at 04:47:07PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Dmitry,
> 
> On 7/7/2026 4:32 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 04:24:19PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
> >> Hi Vlad,
> >>
> >> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> >> <snip>
> >>>>
> >>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY
> >>>> +                             &config_noc SLAVE_CAMERA_CFG
> >>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_HF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>,
> >>>> +                            <&mmss_noc MASTER_CAMNOC_SF
> >>>> QCOM_ICC_TAG_ALWAYS
> >>>> +                             &mc_virt SLAVE_EBI_CH0
> >>>> QCOM_ICC_TAG_ALWAYS>;
> >>>> +            interconnect-names = "cpu-cfg",
> >>>> +                                 "hf-mnoc",
> >>>> +                                 "sf-mnoc";
> >>>
> >>> This is the topic, which may raise a disagreement, but I'll repeat my
> >>> position about the need to remove all "CAMSS bus" specific resources from
> >>> the device node, they are found and should be allocated on parent's side.
> >>
> >> The interconnect has functionality to handle bw requests from different
> >> clients.
> >>
> >> Yes the best will be to have camss interconnect, so jpeg and other hw's to
> >> vote
> >>
> >> on that (actually it is possible in icc framework) but what is the benefit
> >> of moving
> >>
> >> those to camss? Is it not better to create camss icc. I understand
> > 
> > Please fix your email client and stop inserting extra empty lines.
> Apologies for that. Some Thunderbird settings were missing on my side, i hope now is fine...> 
> >>
> >> you want them to be on parent side. But how to vote on bw? Most of the time
> >> it
> > 
> > If the driver actually votes on those, I think, it should be fine. This
> > patchset seemed to add bandwidth voting, but then it dropped all the
> > votes in the last commit.
> > 
> >>
> >> depends on the jpeg encoder configuration based on resolution format etc. to
> >> set properly average bw.
> >>
> >> So i dont see how that can be done with not explicit dependency on jpeg with
> >> camss and some exported
> >>
> >> API's which we discussed with Bryan they are preferable.
> > 
> > Interconnects should be fine to be referenced here. Especially, if JPEG
> > has its own port to those busses (hint, commit message).
> > 
> > As I wrote, I see a bigger issue with the clocks. You need to have some
> > API to vote on them (and then let camss driver aggregate those votes in
> > a platform-specific manner).
> Can we use icc-clk framework to vote on them. I think even today there may be some issues in camss
> for the clock voting.

Please discuss it with the Camera team, working on the camss
improvements.

-- 
With best wishes
Dmitry

