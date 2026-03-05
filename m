Return-Path: <linux-media+bounces-54559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LrLIkT7qGnVzwAAu9opvQ
	(envelope-from <linux-media+bounces-54559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 04:40:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65E20A9F2
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 04:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ACF8303075C
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 03:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE7C277037;
	Thu,  5 Mar 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv6KIY4J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPsx070w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B125A2C9
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 03:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772682041; cv=none; b=kqlzxkWzzByasC+brBbdl+sRZDLAPMqp3kKnd5ZXvb611yb/Tnp6N9DEzgPb/3bw23IHKqv2B7uU/uXNK8OvlQM4vMJ8M7n9jt4/39w2gfIhrDMTLf9/m4Pg+SVcza3Eo7WeIBBaj11abCcZAHT8gEPpC/QGanidT26aX56OPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772682041; c=relaxed/simple;
	bh=nDoC+qnqVRCZsKqhxdGrKL20obiUbD4qrET7VBrVKK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSLVFmcng8UkLodg8D3lnlyO5sFiuGLWZYz0qxFwxFRYgleRw0HJ+LdPMFgMzgNot0boVNUGItbJoaDmyIqL97PmN6qKrYX9/C1hIf2X35YhTQTkKMTchc3lLbWYJJMxa1c0rDGcFKP2PDgnGJH98/WKEgmwwZuc5B+PyRgxoUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv6KIY4J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPsx070w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BlfQ3604199
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 03:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BCkvYcM+Qnh0dWitG7lZ1F9Y
	4kuK+yrC8gFfslC4rbo=; b=Tv6KIY4JUfp2Qx25CJV1DXyqroVd11nXyEX74ZfK
	uds3p3QsLpIKEWE3f6hdpQS0tesbPKyEKWLk0eCM+nVrNWoyZ/JoMja+6TKwMLYR
	RERt1Ph0uTIE/VJhgMTj1UVI25tMfVAuTX6bbeeAYMsKzoiqvrCqRAvS75xC/whg
	Qc9US4ciu1duBAmY3CBorZ8R8DWIsguLvXk4T2ZHqKwesifwA0yujzqv+bpg8LnL
	TpKT5GjCWsk85lBykjQF+e8nPI9LjaXMJoaUMlHjErOAB7y6KFykdFCANLT8N8XS
	8Wf5+W1wNQovbDV2O8rLBzzByCIpA+CPu7FvoW1TwqsyjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w9k0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 03:40:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so5238309085a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 19:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772682032; x=1773286832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCkvYcM+Qnh0dWitG7lZ1F9Y4kuK+yrC8gFfslC4rbo=;
        b=FPsx070wCl62TAxMbqLKCaljqHiH/tTsL/evYjLnThDmvVyhh3PoDkv/z21gbQyPBc
         4mv/KIvZo7wan7K9MQfEGO5E2wnHGLkIrGnXcjqOdKqMJKeFvKX8cFHNPpzboFyDuMOz
         ZEhtN2yzoqrvhfvEiSRzmXoPiyQwpvKrXvPlYlfqxIvOX7hrEAm3OTNpIifjs2nYiK/F
         KhibSqq+5CSBGR3tpJWcOVWPlrJRFeUfEwhYE7F7QCEIa2Ldk675fma7ZxZbVRNo0Lab
         D17SbhAi5shBqBnzgJ3qBMBtwZWdTqdHeb0YPESDnPTwkKIthQS057o6Fr9G4QX/Uu9a
         l2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682032; x=1773286832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCkvYcM+Qnh0dWitG7lZ1F9Y4kuK+yrC8gFfslC4rbo=;
        b=IHxg/RJwW5cEsTLvAB0YZRtL15gr+xc2insyQR/ng8A+6irBwA53gIS9pjLMQ20Glq
         yFRBnS8o2XgjaZg8D4MaUP8ha7vJFklvoDDDhm8l3ca95R9kucRqqRACXUiWHvrlvSL3
         SqWxdb6+YiWy2UU0JJwGkXzLUWLPrjs6xx3P6HQEizzqkHRXQ8lo4FDoaUJZ0jOR+BSe
         dGN2RTJh9v7aFrzXFhe1/HJp5yG9jaVl1cA35BTQMckJ7OWQd2C+X15vIJXQFx9eWob3
         sSY1uKdN2F9UExPtlIiX/1YefLlEUX9EQnrPv0tlUmn4I+uE0R9AsLek+T+07MZmSnDW
         H3aw==
X-Forwarded-Encrypted: i=1; AJvYcCURDzjAOzGYk8qN5iFB/ayazJCAEq8Ou2ep0MOnq6YRGtMCKojT6RrSXAi3xbClzpU4L0R3FoWPTgtW9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywha4q7WbUwmrDTUYn49cpdDrl3SOwnbxXK+tKGkf1jTUdfpGkL
	/HQ4YVn0Y9GmnvlS/tQRBHkbPbW+Ee/U0fxq/rgehEp1HbV0mqlnAgGMliztnYTyt2Eji/dpclZ
	xWR4BhoY4W1gOwmvm94mLwk369vA1SEeiRcVcR+RY2fQRbh0K+nFcs9N55LdME9Zjag==
X-Gm-Gg: ATEYQzy582mYTN2oQbJLbCQnjBfUNmhZ1lXXktGWSnsDF1XnS8fH/OQKS/DT6la03BA
	Dvp82RpT2kl7lRDE+aJbeNViV0GsOn0JaSL9p3IdX9f1umhG152A9Pfu6Vu1HcP07Kp5OGnUbZV
	nLbkcbnHjceAVWgIb7fzDz1ZPNuSX6jVWru8AB1PNTeGPJk6pAZ7qKaUmGXM/obGn4gP9qs+5KU
	K8cbEz2GpbcQa52HQiJ167xEVq8UFJwS52oB7yrQHTlYqEHg8ztbRMSVgfb5+ZEqT3zU4SW2W3k
	1NgJQnrLfNbpdSQ+36j0P+AZs/vVaLR/1z/W3mmCu1C5nRkb5TLXiM3ckjj1uJmyZq/8+GFniCO
	0L0ZsHF5ONmXZK7I602A6C52fjqJM9V4oStj2DuAj25CJ3dpc6WCnP7vpQh481rrQlrZGOq9srm
	tPRxGPWwNvbd9f1bNtVHto2wnrajXW8crxUpc=
X-Received: by 2002:a05:620a:370a:b0:8cb:baea:89c4 with SMTP id af79cd13be357-8cd5aef2c3bmr592399385a.24.1772682031615;
        Wed, 04 Mar 2026 19:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8cb:baea:89c4 with SMTP id af79cd13be357-8cd5aef2c3bmr592397785a.24.1772682031145;
        Wed, 04 Mar 2026 19:40:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1337e3a51sm85153e87.56.2026.03.04.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:40:30 -0800 (PST)
Date: Thu, 5 Mar 2026 05:40:28 +0200
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
Message-ID: <2coz4rmx2w3iz4f6pp5d26pzwvu246cavauiiiq6bclndczxya@r4cio7nwknwt>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
 <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
 <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
 <jgygscmwovezkytizhh54cmmu5etgv23bgopfqrql3qj7zlhxh@adxo2b7izlrc>
 <22b3e2e9-b855-487e-868f-e72fcbbb22cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b3e2e9-b855-487e-868f-e72fcbbb22cd@oss.qualcomm.com>
X-Proofpoint-GUID: jQZ0V0Zh2VAzB6y30Qa-zRiAMOG9X79U
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8fb30 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gatHO16CKhhCwir7Zf4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyNiBTYWx0ZWRfX39WHjoCu/uic
 67lvW6+r4Qd4rVl9uDzTCkzI62i0RyZXgRn7e31tlY2qlO8SMTZTiRCyg+L3NdSddEjXym2v63j
 Bt/8RRGDRc6Fh2tUjE3bV6qfCY2mpXxIQWjX//0Anqqvtysk71R3WAYr2ZPYaVoW/oGqMna+QIr
 Npk1RuDRv8p/Mn6jKXmXHv/VgNw0ykrhDW74kMg/x5a/Dd+DX/987WTcvpIB3i0yHKZmYAMV9M4
 0FCtIMWsmKNf+bhT+jZcQyLD5lez6NKe2Rop6mcBySAZ9C3sByfdfa4ouEy7L0O0xnh/BNp2trD
 Dmu+up3YjAUjj34yVnugwQg8nkZooSyViDb11qZ1uHiCFnxzIVK7Qp1FUkDEuYFZneplPaII1fL
 qRykOpa8pl3t5EYtdS+aiZMjef2F+ARSm60INKC/4eIVhS2ds7BdOXcGqwecFX1K0fQHxeFoxG2
 obe9cBEMEe/6d2nW5xQ==
X-Proofpoint-ORIG-GUID: jQZ0V0Zh2VAzB6y30Qa-zRiAMOG9X79U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050026
X-Rspamd-Queue-Id: BA65E20A9F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54559-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:59:24PM +0530, Vikash Garodia wrote:
> 
> On 3/4/2026 3:57 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 04, 2026 at 12:46:27AM +0530, Vikash Garodia wrote:
> > > 
> > > 
> > > On 2/28/2026 1:57 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Feb 27, 2026 at 07:41:21PM +0530, Vikash Garodia wrote:
> > > > > Depending on the buffer type (input, output, internal and interface
> > > > > queues), associated context bank is selected, if available. Fallback to
> > > > > parent device for backward compatibility.
> > > > > 
> > > > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
> > > > >    drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
> > > > >    drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
> > > > >    drivers/media/platform/qcom/iris/iris_resources.h |  2 +
> > > > >    drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
> > > > >    6 files changed, 79 insertions(+), 12 deletions(-)
> > > > > 
> > > > > @@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
> > > > >    	return 0;
> > > > >    }
> > > > > +
> > > > > +static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
> > > > > +					       enum iris_buffer_type buffer_type)
> > > > > +{
> > > > > +	switch (buffer_type) {
> > > > > +	case BUF_INPUT:
> > > > > +		if (inst && inst->domain == ENCODER)
> > > > 
> > > > Can inst be NULL here?
> > > 
> > > during queues init/deinit, instances are not created.
> > 
> > Is this function being called during queues init?
> 
> yes, via iris_get_cb_dev()

I think this is a part of overcomplication. queue init uses
BUF_HFI_QUEUE, which always maps to NON_PIXEL. If you remove all
indirection and device lists, you can access necessary device directly.
BUF_HFI_QUEUE looks like an extra entity created just to get the device.

> 
> > 
> > > 
> > > > 
> > > > > +}
> > > > > +
> > > > > +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
> > > > > +			       enum iris_buffer_type buffer_type)
> > > > > +{
> > > > > +	enum iris_buffer_region region;
> > > > > +	struct device *dev = NULL;
> > > > > +	int i;
> > > > > +
> > > > > +	region = iris_get_region(inst, buffer_type);
> > > > > +
> > > > > +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> > > > > +		if (core->iris_platform_data->cb_data[i].region & region) {
> > > > > +			dev = core->iris_platform_data->cb_data[i].dev;
> > > > > +			break;
> > > > > +		}
> > > > 
> > > > You really seem to overcomplicate things. Replace array search with the
> > > > indexed array access. Much easier and much better.
> > > > 
> > > > enum iris_buffer_region {
> > > > 	IRIS_PIXEL_REGION,
> > > > 	IRIS_BITSTREAM_REGION,
> > > > 	IRIS_NON_PIXEL_REGION,
> > > > 	// add more when necessary
> > > > 	IRIS_NUM_REGIONS,
> > > > };
> > > > 
> > > > struct iris_core {
> > > > 	struct iris_cb_device cb_devices[IRIS_NUM_REGIONS];
> > > > };
> > > > 
> > > > region = iris_get_region(inst, buffer_type);
> > > > dev = core->cb_devices[region];
> > > 
> > > all the regions may/may not be present in all SOC
> > 
> > You can check for dev != NULL afterwards.
> 
> with one CB to multiple region mapping, this logic would not work.

I'm not sure I follow. We always need only one CB device and we can
always access it (or check that it's NULL).

-- 
With best wishes
Dmitry

