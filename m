Return-Path: <linux-media+bounces-54399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DX0Gc9fp2lvhAAAu9opvQ
	(envelope-from <linux-media+bounces-54399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:25:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2931F7F47
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F33F53041981
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FC038F629;
	Tue,  3 Mar 2026 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auc7AQLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YztOL0s2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C837C906
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576713; cv=none; b=YtsykOlc5872LAy8golCpcIwfYULWjXNx/9S15Y4HKTkBxs4iR89VdjOUrmTpvUNvjLpYOqRzouljagic+aqzk3OVuP1I0/cS6jobiKucmHvkUWp3KXYlSoS5qn9NQhcCxcq15v8kFemTVk9sd7sba/xR664kTfZJRQDo1PhWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576713; c=relaxed/simple;
	bh=EA/Rw1FP5e5aCGUak/Ns2GpuagNzThHEt836iUrHkr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5Bv5XljQsoOv/oHRrDKD5CVSCvMKwFBbT9lzUypiOnQyIadBw3Xp14o7ygd0ZfkvU7ZtMH/yUIrvGcISxeifT30b2dDIyfFfojKiI8cCUKJY4PRuW9Era8BKf0qTU+pzjjBmVbmMAG+dsOPiG5te6LU+YIJ7lkDUoBvwfeiZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auc7AQLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YztOL0s2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0L303238347
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 22:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7c0ONiGWv+o5peOMasPqd0IK
	l4uBibpQOWVWoq4/40w=; b=auc7AQLx9X8KFQA5a1iLQNml9kR8tXCX23/SCnDY
	mvrzDB4+N30UdCMCDuPhBVfl1b7yCBE6OJIsyEFLlnjLJThHWtGb/ImcyVZt1PjM
	FcOYWR9t/qqUm+wn3FZPjMml+Wj8REXaB5YMcoT+5du9iPK2kWuf1lIQS1iqC9QS
	99oC0Yo0bKZTeEVj5Xix0vJdheAsAE3FQxssuA60MxC8d7HweVnGzb0211sDJGxN
	u7PxThVKu4GfDLdXoH12AAjsLr1uL/ZX8J9am8nvCVeLhTz7GBCK+Uh5dWuiYbO8
	VjzvSfjaONhKCb5kBKrRFskSTyZvI/FWZSoZo+mWhQ7xVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuah01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 22:25:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b0d938dso4604123285a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 14:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772576710; x=1773181510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7c0ONiGWv+o5peOMasPqd0IKl4uBibpQOWVWoq4/40w=;
        b=YztOL0s2sxJJOQpSUJ+FhHg/6v11ul2TbP396CsztXreB8gDzW3tig/zfXo2CUBkVv
         I79OyOJ+rXI4KAT+radU2dviq+7S8qBCx4h7mIghZ5LsvQ2QRDatfmzOhUnnMYAe3IXW
         Z/roBHjrXnPSZGxch9AWCCs5ILEa5wc3F7SqvU7tRW0PHlMaBi/VPUH79I+dWyVQNWI1
         TPf4MF2i2r8jQUxjQs3HDkLvb6UNPOz+4E/IbSvO62B2hoCLbhUztEKs3ocVifo7HsBW
         TpGsNqk/ITeUPn5OrmL+hZuza0xAJuQJFvrYVSRWyMMBQqxgIS7STXOJH8bmcWhW2Gwm
         tHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772576710; x=1773181510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c0ONiGWv+o5peOMasPqd0IKl4uBibpQOWVWoq4/40w=;
        b=cq0Nn8LiN6dyiYi+L9TFZ308gcW+1HMT5Y/MLkzD2auJHYrCG1g3uevhx/Jd0S130s
         nyHonm2muN9T5HUkvdm3a9w0Se9Lf/zBNlOf9/bOLIplFAl/RvIqTYw6DwT+CtjGe8oS
         GhwSRWeekCFVRoivgUhtt65+ALJmRLYG1SNDJjRZ60PFHAL215R7DH4m9na5hr9kzxT4
         6BtreBCbBeflHzf14trg2v5gdobi5UOpBVzpfpDm/YYmoG6N4SAxUt8pw65CgNNi8Xdq
         MizbBch8vwvNMzDM8WmP2tzyzdR6UUoXd7BpKmJ0cdAExwkHaAaWR+/iB/MIa0q2Pp91
         8S3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCtUw1lOPDcm+oX+p0Az3NEbF67sxXhXAYFFqQ4d8MuJ8czNhhLSyeXB31Th37BnE4VqLdgqBD/L+oPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhykzaOnpCh/+1rX55rWjaB1/M3p/8sCTtEnRWJeHlnrTuMst
	qCUL0Y22t2JDSwzq2YJfFFQUni/mLlHSnUhejieihgomOP2oQgUm5HfpDg3k1+uopi6uUWnHO1r
	9xb8R4zi9qKgu4Csjw0Ui9XRN7oVCPLbDS76GO29O7CeNTTI6bel5TonS+JmqUBZTkQ==
X-Gm-Gg: ATEYQzx9TyKXcxX4Fpdz1uwtU91BGwGytP3WADj2KV/FRLLx6vhpaCw0Mz1JzSPBfqu
	GuRgs27Fb4Rosvrrkzt6MBNrT6PvuozfRtlZy9yY11OmZaR5PBggFhnoUdTf4P+wJG7nughDk3k
	Dh8mwpiyhB6SH3LmYvdaV1oIMnVsJo7SHifCdHIVEAMaEY+fogV6cxY9NwHUxCbkIOoA3UXQqs5
	EqwcVtSLO0+V4C9kzpPRsINA2LDkYMPmhpdXArH7Wwi/ya/rwRdiMs2/Z0lr5j/fPbyS8/AXN6p
	czQDbu1a4FP+CITd1VEjmOiX3iXO4yjZhHCffqlBDLJm8p6qz3rQnzTkDvCmX+4PJD8mKE7lR73
	pJOe0mL7Ab3Ng9Ba8v3ukt+ftOhjZ7KDeVE1cWOVxFbeI0Z+M1y/aFUT0blpzX1znH7T8Ff04F2
	Yt4SA0kwOTQ1l0TPKI70DfccPvMkuWjK0KTJ8=
X-Received: by 2002:a05:620a:f14:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cbc8f65113mr2189682885a.77.1772576710253;
        Tue, 03 Mar 2026 14:25:10 -0800 (PST)
X-Received: by 2002:a05:620a:f14:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cbc8f65113mr2189676485a.77.1772576709554;
        Tue, 03 Mar 2026 14:25:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f301788dsm31052661fa.35.2026.03.03.14.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:25:08 -0800 (PST)
Date: Wed, 4 Mar 2026 00:25:05 +0200
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
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
X-Proofpoint-GUID: ChrV4zHMvx9jQra5NSue1mfmnd2F2pSY
X-Proofpoint-ORIG-GUID: ChrV4zHMvx9jQra5NSue1mfmnd2F2pSY
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a75fc6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=huO4T10AKA1n-x7XMLYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfXwUrlFcWAzHTK
 V+c0t6wj435ZdafXjmkJ7jhbzO/GhLEDgpvzg8PPZIZjU7WajSTl1ih8uxnBJmmgrvbXjtvfUIv
 odO6KyYhaGs1gV6Lp/E5YC0S76rRYASy6YMnyWs4RCO4GKfhCvmr4JXCEHJp84gCgU6ToVK52pO
 JBGrwQxT0LOAuu4H7DKwc0j8frQ124P8bPIvMC77co6adh0V2qpoPGSJUpHnTZcUauaMWdQXGWM
 T5ZvicflBG5NBgaLMI9dQCFcsazN/mVTR0efPWDIjAvVPQEMDCULTsCOCS7cn4Bh9BXCp7W8fci
 Hg6iUKhIfESHEU8cg34xv2OUJiVWrzzmrQTyNaXDdTADfeb/DESgyZY+5uBy5A/kmjfPb/3P46t
 pTTuqcnCkAfNQzckSOOCDSEnencVgvmMn4dPw1NxMWMZZgJoYGDrmGdamro1DNRm9qlQRXQ/f3P
 Mwkf8WyurWgaHVLOx+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030185
X-Rspamd-Queue-Id: 0B2931F7F47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54399-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
> 
> On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
> > > Introduce different context banks(CB) and the associated buffer region.
> > > Different stream IDs from VPU would be associated to one of these CB.
> > > Multiple CBs are needed to increase the IOVA for the video usecases like
> > > higher concurrent sessions.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
> > >   drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
> > >   drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
> > >   drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
> > >   4 files changed, 111 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > > @@ -204,6 +204,22 @@ struct icc_vote_data {
> > >   	u32 fps;
> > >   };
> > > +enum iris_buffer_region {
> > > +	IRIS_BITSTREAM_REGION		= BIT(0),
> > > +	IRIS_NON_PIXEL_REGION		= BIT(1),
> > > +	IRIS_PIXEL_REGION		= BIT(2),
> > > +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
> > > +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
> > > +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
> > 
> > Can a context bank belong to multiple regions at the same time?
> 
> yes, they would.

How? Each set of CBs is defined by a separate function in the DT. How
can CB belong to multiple regions? Could you please provide an example?

> 
> > 
> > > +};
> > > +
> > > +struct iris_context_bank {
> > > +	struct device *dev;
> > 
> > Separate data and the actual device. Define a wrapper around struct
> > device for the actual runtime usage.
> 
> we still have to store the list of dynamically created device. Name can be
> used to fetch the device from the list, i think the existing approach is
> simpler ?

You don't need a list. You have an array of the size, which is known and
fixed. You have at most 9 functions, which means less than 9 devices.

> 
> > 
> > > +	const char *name;
> > > +	const u32 f_id;
> > > +	const enum iris_buffer_region region;
> > > +};
> > > +
> > >   enum platform_pm_domain_type {
> > >   	IRIS_CTRL_POWER_DOMAIN,
> > >   	IRIS_HW_POWER_DOMAIN,
> > > @@ -246,6 +262,8 @@ struct iris_platform_data {
> > >   	u32 inst_fw_caps_enc_size;
> > >   	const struct tz_cp_config *tz_cp_config_data;
> > >   	u32 tz_cp_config_data_size;
> > > +	struct iris_context_bank *cb_data;
> > > +	u32 cb_data_size;
> > 
> > Do they differ from platform to platform?
> Yes
> 
> > Mark them as const, it should be data only.
> 
> cb_data_size can be marked as const

Why is cb_data non-const?

> 
> > 
> > >   	u32 core_arch;
> > >   	u32 hw_response_timeout;
> > >   	struct ubwc_config_data *ubwc_config;
> > > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > > index ddaacda523ecb9990af0dd0640196223fbcc2cab..557adb038328a75510591d91569819abc0b7b1c9 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > @@ -123,6 +123,49 @@ static int iris_init_resets(struct iris_core *core)
> > >   				     core->iris_platform_data->controller_rst_tbl_size);
> > >   }
> > > +static void iris_destroy_child_device(struct iris_context_bank *cb)
> > > +{
> > > +	struct device *dev = cb->dev;
> > > +
> > > +	if (dev)
> > > +		device_unregister(dev);
> > > +
> > > +	cb->dev = NULL;
> > > +}
> > > +
> > > +static void iris_deinit_context_bank_devices(struct iris_core *core)
> > > +{
> > > +	struct iris_context_bank *cb;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> > > +		cb = &core->iris_platform_data->cb_data[i];
> > > +		iris_destroy_child_device(cb);
> > > +	}
> > > +}
> > > +
> > > +static int iris_init_context_bank_devices(struct iris_core *core)
> > > +{
> > > +	struct iris_context_bank *cb;
> > > +	int ret, i;
> > > +
> > > +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> > > +		cb = &core->iris_platform_data->cb_data[i];
> > > +
> > > +		ret = iris_create_child_device_and_map(core, cb);
> > > +		if (ret)
> > > +			goto err_deinit_cb;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_deinit_cb:
> > > +	while (i-- > 0)
> > > +		iris_destroy_child_device(&core->iris_platform_data->cb_data[i]);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   static int iris_init_resources(struct iris_core *core)
> > >   {
> > >   	int ret;
> > > @@ -193,6 +236,7 @@ static void iris_remove(struct platform_device *pdev)
> > >   		return;
> > >   	iris_core_deinit(core);
> > > +	iris_deinit_context_bank_devices(core);
> > >   	video_unregister_device(core->vdev_dec);
> > >   	video_unregister_device(core->vdev_enc);
> > > @@ -275,12 +319,18 @@ static int iris_probe(struct platform_device *pdev)
> > >   	platform_set_drvdata(pdev, core);
> > > -	dma_mask = core->iris_platform_data->dma_mask;
> > > -
> > > -	ret = dma_set_mask_and_coherent(dev, dma_mask);
> > > +	ret = iris_init_context_bank_devices(core);
> > >   	if (ret)
> > >   		goto err_vdev_unreg_enc;
> > > +	dma_mask = core->iris_platform_data->dma_mask;
> > > +
> > > +	if (device_iommu_mapped(core->dev)) {
> > > +		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
> > > +		if (ret)
> > > +			goto err_deinit_cb;
> > > +	}
> > > +
> > >   	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> > >   	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> > > @@ -288,10 +338,12 @@ static int iris_probe(struct platform_device *pdev)
> > >   	pm_runtime_use_autosuspend(core->dev);
> > >   	ret = devm_pm_runtime_enable(core->dev);
> > >   	if (ret)
> > > -		goto err_vdev_unreg_enc;
> > > +		goto err_deinit_cb;
> > >   	return 0;
> > > +err_deinit_cb:
> > > +	iris_deinit_context_bank_devices(core);
> > >   err_vdev_unreg_enc:
> > >   	video_unregister_device(core->vdev_enc);
> > >   err_vdev_unreg_dec:
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> > > index 773f6548370a257b8ae7332242544266cbbd61a9..be58e8620086d0f82c2c2bda29247483f5c56d79 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> > > @@ -6,6 +6,7 @@
> > >   #include <linux/clk.h>
> > >   #include <linux/devfreq.h>
> > >   #include <linux/interconnect.h>
> > > +#include <linux/iris_vpu_bus.h>
> > >   #include <linux/pm_domain.h>
> > >   #include <linux/pm_opp.h>
> > >   #include <linux/pm_runtime.h>
> > > @@ -141,3 +142,38 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
> > >   	return 0;
> > >   }
> > > +
> > > +static void iris_device_release(struct device *dev)
> > > +{
> > > +	dev_set_drvdata(dev, NULL);
> > > +	kfree(dev);
> > > +}
> > > +
> > > +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb)
> > > +{
> > > +	struct device *dev;
> > > +	int ret;
> > > +
> > > +	dev = kzalloc_obj(*dev);
> > > +	if (!dev)
> > > +		return -ENOMEM;
> > > +
> > > +	dev->release = iris_device_release;
> > > +	dev->bus = &iris_vpu_bus_type;
> > > +	dev->parent = core->dev;
> > > +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> > > +	dev->dma_mask = &dev->coherent_dma_mask;
> > > +
> > > +	dev_set_name(dev, "%s", cb->name);
> > > +	dev_set_drvdata(dev, cb);
> > > +
> > > +	ret = device_register(dev);
> > > +	if (ret) {
> > > +		put_device(dev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	cb->dev = dev;
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> > > index 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_resources.h
> > > +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> > > @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
> > >   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
> > >   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > >   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> > > +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
> > >   #endif
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

