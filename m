Return-Path: <linux-media+bounces-54400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG5jH3dgp2lvhAAAu9opvQ
	(envelope-from <linux-media+bounces-54400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:28:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF91F7FA9
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2F8F30755DF
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E674949E1;
	Tue,  3 Mar 2026 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngFWalpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jECtv112"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88773BED3D
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576853; cv=none; b=QqNZlZ2+beAT+3+vxW58quzp+TBdWtXimC+iTYOI0QkegP6JmARhe4bfe+kzlXcJlAwF/refQdx0XNC2uYctFm1TyTnIvr1WKvjzBlnWSBcoM3dO21B+MKhtMFugdYYMkAzs2RO7UWdIk0xhV68mf8j/uOIGs4cZ3zZ7piNsMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576853; c=relaxed/simple;
	bh=kUiCMni+mSdLNaS6+bi0vffQF5/T2BCKuXPlaqtnkqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEnPR68DNXRQ4h42DBMMp6k3VLyqzS8ffcezI+O+8kVPMfSOgf8WL+wYOJcnjX/Uhkmk86Pp0P0BTH2Kkv98Lik2B4v0CcW3e4JMR3dgyUrXDpnXKSSRb159mUJa1sBNrDfWxIVYHVyJyEczFbREEtF2Y7oKZnBXUAL+hyzE/zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngFWalpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jECtv112; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623HBHxd2786724
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 22:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4bi3Gp9rCUijoG+XiXSdtsQm
	sC243pZHx3H6hSlT6Fc=; b=ngFWalpqxSqsS2O+cgHy4sQEJZGw4Fi/0d0BMu0Y
	cl9Ou5OC/9fkTkhvZVVBHH+LWrK6IEpgjLBZ2JawUHh6ORX00lmz3xbXnWkZaSAN
	pWMIFbhBHCrj3Rd0kikypUn++uKeawwED0b2ZNExX6TEpImWS3JJpG+OxVbBpSaK
	3PA9iiKTzswecDjbtFucrx9eVYGqIHXCLwLnNbfAawbebq+A+mQKnPsEFCPyGvBG
	AG/4Jge8vZJOV51k05Rq+Wk6XFg8cUsYG/xAjc2NiddPN5gVmKe45jeEh3M7VV1t
	EjMq3gg3qNQAtAS5Krt0ZDm4nEch7QJELLcKBYUX2m+mUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvh2a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 22:27:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a936d7afso650601441cf.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 14:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772576849; x=1773181649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bi3Gp9rCUijoG+XiXSdtsQmsC243pZHx3H6hSlT6Fc=;
        b=jECtv112ikpvVc0LMdPgu+UVGnK2S0lBRdTWijlzVH6A5VknnrjyJeiQtFYJ8bzOfN
         /WD5BAoPv9drqxYFk5lwWgfSWtPle6gx27984UZTmCKgkwdQFiABx2aV9/FgFlpu8Wgb
         c6qVXUPPoQc3XGPUE2kaGuXhONlbayJeHn4X6mzF4OiU2PhEYiCb0/WoDbQVpjfnrOl2
         lrr0HQb7rtfBh0OoxU0Fww2avxXNjg37KzithVYhjqqfKv8fWWM2xZn9ZTDiw0QkQYsa
         ID9MqDPBB3vlBwqbJSs7st9a20PAjyvCv8iggSIkv8Xd7IwYxA94czwXpIb9nB9R9cYy
         DK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772576849; x=1773181649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bi3Gp9rCUijoG+XiXSdtsQmsC243pZHx3H6hSlT6Fc=;
        b=kDgOEC3Z5eFTPTbiHDmdkTNA5WTz8i0UJ5htEnHOXXKVsAvrRhVfBnYI8hMqzAo8WN
         wa0QmLNPeVSE3tjXpfbK+y2yQlZrFTHWvX9Gewd5ZEa1Pf69ndlyDaijBzVQ1ZDEEsID
         7wlHdD90UDEGdTR0GNeu3x0lk94qo9n6ZZaFQ3J9/ugqDYiUj9c9XlM8iQ3uyTKDQpTL
         84SIH3BRmnQMyjvUn+CZu9ybP8MrArT8sDZFqnDIu5b0CpuWUZOEGncwBaM+AhKgaTlO
         kbilDoibhA3lQaTTFunjL6spseEvwc3mnIR7YHXjKG5Ljn2gvj7EPkaBdwHFa6ri6SXT
         2YbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/4SOWZXUAWUClGkC58gflTbz7qPS3ZPTUxTEal/xflBNgBY5W1TJFFOV4N3f5bVrIBAyzK9zbHL2IfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCmw6ub08msfdkgkKTG61wcO5mxV97+g2o7Qz3a6q4SN6xhcA
	OY86LvxwP/TUDwsD9CXMcMJtd1LJ2VR1sfj4i0KDL/b0Z578uGh9shw95hmsnHNt5HTki/CLCIn
	Oiif8P5SPu0enSA6fStK7wuB+/J1jO+azClgmQYT4S/SaKmlZD00gt1OTnizR4ciUpA==
X-Gm-Gg: ATEYQzwm9fXVUJhpj8q3L3KSBr01nhYX+l9/JpQgerIwwtvlAdHr9T81u+kUjLGtI7G
	4GLNElj5l0ZtZRMot8Db9ztzPNPd6iTLCbRDtcH8XqY/alnNLQoBfGW1BIMcv1IlmnGXEb/oeUs
	/SmwHV9TFzvBUObhTHoCnPDnXFGSwUBUfRGVjsji5SGzHCi2IsgHeBjZZZPFoak0Im7+6B0P/nN
	6PM0s6Za0Pe7zpEHOJkoDLAj+rTfHGG1HPTfN8tl441UTdHxVjdoqnmeGjuHYlvS1aXdvIWeQDL
	kCWngOgRRYu0WYY/bYglPPRROvKQ5NM41wlkL4kXFhZvC/W6Wcgpud/PqjprPeKvxQNGLT7pJRD
	2AGY+e32ffkAF6Rc1+YOcracMKGV5Z1/H093lTfK7T+WN/otY5Yj9gyaQRfB5B2XGDNsDpxkz5q
	MmKPvGhMzjO15pxpd8bvgYmKr2AhO+4acnUAA=
X-Received: by 2002:a05:620a:1a1f:b0:8ca:305b:749b with SMTP id af79cd13be357-8cbc8f3626bmr2244611485a.60.1772576849173;
        Tue, 03 Mar 2026 14:27:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:8ca:305b:749b with SMTP id af79cd13be357-8cbc8f3626bmr2244606585a.60.1772576848655;
        Tue, 03 Mar 2026 14:27:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357d2f5sm869131e87.39.2026.03.03.14.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:27:27 -0800 (PST)
Date: Wed, 4 Mar 2026 00:27:26 +0200
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
Subject: Re: [PATCH v2 5/7] media: iris: add helper to select context bank
 device
Message-ID: <jgygscmwovezkytizhh54cmmu5etgv23bgopfqrql3qj7zlhxh@adxo2b7izlrc>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
 <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
 <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX7EojeDthbGK0
 TYPZSdHmw+7T16ISlKaBTsqKhF5bxtvqhjOR698PkCEefSlLzfD+4J/YEj+lrjGVcASuHpvabbT
 OjrUgMe5ndjxvjtCtv4c6na5yJstukxbiLyVIfcb/L/pNuVQQcwMvUqhuVgj1xwwxHT+183EtCI
 Z/RParDFoTVJvnGAybXyKooKHTM3eS7/x0at/eo1Vp8IJqDiU5OcwL75i1nCwGa3XZp+K1gy+mG
 6hAZxLAtM4MOJjkc4yZAQ67ZOvbNB8Ts+e/HFFpnkSfnnD63gTuJJpsV6qazM4nB8dDauYsa8ND
 DWF+PytiAWsYePyV9HkW5KquYeNKOm2czqVrRTjSG1+iR0kUfeSuqFmhNfDpgRoHigjLvF0lNcy
 A4Z78iKZNwmnTjXHgGfDMiZItfS35w2Cy4o3TY+RFsUITXdbyfIjqL/iM/bKOiRhb8i5T7VnUCJ
 8cJCqa0wy298ggqojCA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a76052 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=I8bSfGjBC853jA9yTMYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8595fg_liKfZIeBUB6EXGF2erB9dJnFH
X-Proofpoint-ORIG-GUID: 8595fg_liKfZIeBUB6EXGF2erB9dJnFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030185
X-Rspamd-Queue-Id: E3AF91F7FA9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54400-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:46:27AM +0530, Vikash Garodia wrote:
> 
> 
> On 2/28/2026 1:57 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:21PM +0530, Vikash Garodia wrote:
> > > Depending on the buffer type (input, output, internal and interface
> > > queues), associated context bank is selected, if available. Fallback to
> > > parent device for backward compatibility.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
> > >   drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
> > >   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
> > >   drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
> > >   drivers/media/platform/qcom/iris/iris_resources.h |  2 +
> > >   drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
> > >   6 files changed, 79 insertions(+), 12 deletions(-)
> > > 
> > > @@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
> > >   	return 0;
> > >   }
> > > +
> > > +static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
> > > +					       enum iris_buffer_type buffer_type)
> > > +{
> > > +	switch (buffer_type) {
> > > +	case BUF_INPUT:
> > > +		if (inst && inst->domain == ENCODER)
> > 
> > Can inst be NULL here?
> 
> during queues init/deinit, instances are not created.

Is this function being called during queues init?

> 
> > 
> > > +			return IRIS_PIXEL_REGION;
> > > +		else if (inst && inst->domain == DECODER)
> > > +			return IRIS_BITSTREAM_REGION;
> > 
> > Are there any other possibilities than encoder and decoder?
> 
> will simplify it as
> 
> if (inst) {
>     if (inst->domain == ENCODER)
>         return IRIS_PIXEL_REGION;
>     else
>         return IRIS_BITSTREAM_REGION;
> }
> > 
> > > +		break;
> > > +	case BUF_OUTPUT:
> > > +		if (inst && inst->domain == ENCODER)
> > > +			return IRIS_BITSTREAM_REGION;
> > > +		else if (inst && inst->domain == DECODER)
> > > +			return IRIS_PIXEL_REGION;
> > > +		break;
> > > +	case BUF_BIN:
> > > +		return IRIS_BITSTREAM_REGION;
> > > +	case BUF_DPB:
> > > +	case BUF_PARTIAL:
> > > +	case BUF_SCRATCH_2:
> > > +	case BUF_VPSS:
> > > +		return IRIS_PIXEL_REGION;
> > > +	case BUF_ARP:
> > > +	case BUF_COMV:
> > > +	case BUF_HFI_QUEUE:
> > > +	case BUF_LINE:
> > > +	case BUF_NON_COMV:
> > > +	case BUF_PERSIST:
> > > +		return IRIS_NON_PIXEL_REGION;
> > > +	default:
> > > +		return 0;
> > 
> > dev_err(dev, "unsupported buffer type %x\n", buffer_type)
> > return -EINVAL;
> 
> these are bit fields, returning -EINVAL would still match some bits and can
> make the logic as true. 0 can be defined as IRIS_UNKNOWN_REGION

Yes, sounds good.

> 
> > 
> > > +	}
> > > +
> > > +	return 0;
> > 
> > Drop
> > 
> 
> Ack
> 
> > > +}
> > > +
> > > +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
> > > +			       enum iris_buffer_type buffer_type)
> > > +{
> > > +	enum iris_buffer_region region;
> > > +	struct device *dev = NULL;
> > > +	int i;
> > > +
> > > +	region = iris_get_region(inst, buffer_type);
> > > +
> > > +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> > > +		if (core->iris_platform_data->cb_data[i].region & region) {
> > > +			dev = core->iris_platform_data->cb_data[i].dev;
> > > +			break;
> > > +		}
> > 
> > You really seem to overcomplicate things. Replace array search with the
> > indexed array access. Much easier and much better.
> > 
> > enum iris_buffer_region {
> > 	IRIS_PIXEL_REGION,
> > 	IRIS_BITSTREAM_REGION,
> > 	IRIS_NON_PIXEL_REGION,
> > 	// add more when necessary
> > 	IRIS_NUM_REGIONS,
> > };
> > 
> > struct iris_core {
> > 	struct iris_cb_device cb_devices[IRIS_NUM_REGIONS];
> > };
> > 
> > region = iris_get_region(inst, buffer_type);
> > dev = core->cb_devices[region];
> 
> all the regions may/may not be present in all SOC

You can check for dev != NULL afterwards.


-- 
With best wishes
Dmitry

