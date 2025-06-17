Return-Path: <linux-media+bounces-35019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BDADC291
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 08:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5283B9923
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 06:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BBB2BEFF3;
	Tue, 17 Jun 2025 06:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eF4S37tb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693018FC80
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142854; cv=none; b=dIL/R5MeI7zNyTzNE6fxumgMloLh6FofG6xnJGFzJ73mUaLToj31dOABNSC5hkw9oOVHt0gOsByBrUGRI5Jc83QDfI27HbA8bF+AiHDQ9vwn9QhDhm+MF0LEZG1wSb+XQG78pGI6fJxcYx3A0bq+wMnUymdBDlNQvEjc0eSuKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142854; c=relaxed/simple;
	bh=uU9hFzaDOTZHD5p3PSB8mgjSUPP2zTLYjpfXx6AvUC4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEurfl6H4m0+pVPvOEiavode9y2QcbqnHGENNiqjAfUUteu+CjAInhQ0VO5w0HQYQjvYHMZgKakTglpQyTm1oK+CYTuEko+Y1LXioViOcIa+9AYGkKu+nkzPnRGg35vUm7tpunszcrfH0TLBknJ9OiAh0LFFouEw9s1iYI/KY8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eF4S37tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GH51I3005319
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 06:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jzr9HurUhduvjFSlxdJqGDlJ
	e2HOuYisi/7N0azKI4o=; b=eF4S37tbYiuC25HjDz3vsroDP2wKXIssYQZ2HB6u
	Sv/OaLaI5gj5aIJGbteEIVLqeUG9CCTq3OBfb4l2qOkKuYChqErEEZrSTvXzSskM
	dmMcX/o8+h4kOKYAGJePDz5zWs6LJ7qkf0wn+SxvdW++JNAlUBCGbX/ixJLMFkjp
	YOE36XxrbxD8GYw00wq+9qVUI8jMFi9cN79N6M+oks+dPbbCmSnErBnxXgchVlxb
	XbyM8lMdqrNP/eU8jrdiE0aHpsf6vtAc1AYuYkdtc8Tp1UgZGyZR/W3+mFENg8VA
	9PBCc7XDM7mW4UuHRXLmmAKukIM3AfM2kYvMgOj1wkPg1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2339qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 06:47:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3654112fso96593416d6.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 23:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750142851; x=1750747651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzr9HurUhduvjFSlxdJqGDlJe2HOuYisi/7N0azKI4o=;
        b=j1We2Rhw1e01AUTmydmM6XrqAd8M7nwiMQKmwI8miZeRPUR2cyi+PFu6HlYBdNOrba
         l97DyIoX6+f3TTTwW64t8e6Gdk8KGGy3JhTB9vvAiDDI9mgixvhcaI7LGEO8udKfIV+2
         foXtLQZZBXqhLSd0crRQX2Ptk1VydSm3OQ5Ykj8ozjkJauZlQvKizYkY+bcChjhynLcU
         gmvwwR/jLXAxERaPr1cauU6Di26fXy0q8ryOYOUHAuQtD8TtbOBCyUAn9/vC48pt16m+
         Zy6G7VA92InrF9JNbx0bGXxCWwiNgUf7F03LMwmXXoM+Eh9dtS91w11NULoY0+9tw4UC
         Pz3A==
X-Forwarded-Encrypted: i=1; AJvYcCX3QZSXzSwws703GYoBWLXx18PZDuCwdE7FQZR7zOyoQG8Ym/x2rmYCzJ+sA/nlIWLN8hh3eL+YxTlvjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YQaBp+0/DSIp5JquAInsbHhc0ebWOSVA9fun019NJccleGR8
	zDpLK6yMETq6ANI7wExL/u4gCWKo2hSxttLgxDZrMcAgUJD6wTvSAeWSD2RtNkeFP0GyNzQFLtk
	7XQ10PHYxrJzOzfz1GaaVF+fuovHVu2prezBTRfddTLlx0bLBV13jm5YotDx5EVQm0w==
X-Gm-Gg: ASbGncuefRN8QThATHuLl78B5EJoji1CUw1TQmEqcqZcz51yv5lwA9CfRwC52u8o+4r
	hzKZwJbPGYhPCfgIvi5Cwm8Zk7oQRPFDhL1KERDbu1VZsTbeWXR3bM1gZVUSSG3KYVfDaf9fyT2
	ijUzwg/7JQkInE61UcvIDUsnfOj5f1jSFrlvpRiqg4M6gWona3z74eYak8mj/raVbtWEp4R9ced
	XEBNXjB1aR+1C3re3h3j612UcPeH5XMxdn57aNVphTUyIKrgG2A9ERpuqd3o8/5spWs1ZyXZfo6
	aVaeE5C2u5dgcXMSHO5ht6TlPlzV0nZD33w0HSlH/RFPQy6unxVab4AfzQ==
X-Received: by 2002:a05:6214:c83:b0:6f8:b4aa:2a59 with SMTP id 6a1803df08f44-6fb47758f93mr164247446d6.21.1750142850682;
        Mon, 16 Jun 2025 23:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHbGqDog8miVnZzjAR3A8q6IF/fQLMGnjyAnp1A2r896ciWBGYbRf0eCtQ5F2t5j3tp+MSYQ==
X-Received: by 2002:a05:6214:c83:b0:6f8:b4aa:2a59 with SMTP id 6a1803df08f44-6fb47758f93mr164247136d6.21.1750142850248;
        Mon, 16 Jun 2025 23:47:30 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm160264035e9.26.2025.06.16.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 23:47:29 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 17 Jun 2025 08:47:26 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFEPfjJLEMnIriXX@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
 <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
 <aFBNVjl4n7I+OkO5@trex>
 <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org>
X-Proofpoint-ORIG-GUID: vwJ1x-mh25wn83qCrwEj2zS7pusj-l8y
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68510f83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=ckiIvdw4d6_qyGhr-SIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1NCBTYWx0ZWRfX4YyTWZ2UbeAh
 Yok4DV1autuAXW+o/HVsa2pOqqo5Bkw/5EfohAjLA1DBJYB22MT4cK95WOZLUeMYNapPlnadvg9
 XhCTrLrurEw5nMftNejukFC8oVLvKoKhZQr7FRNUr3/bH0Sb8tzD4UFaodJiOfcCEA7uBz2nhEk
 yrjZf/T+AOFeOrVNkCDmRiZCY2pz/U3u5iM0LMhliaszhTS77mTwruQ9IJtOfa0SrYOfdVNXL3C
 yH5M+Br65QSWt0shQh/S1vbEwGtFOk4TZ9MUfQ4ruMBM2dr0/oJr4b1RnLVmO5woGsqdxVDCS44
 WbC1bSW1X6r9YE/l7lz5laeSltLW9k7otvp09Q/xYR5dyzwM816EOIULxIaQfeJo+gHp370tQyt
 BUiQjhTR6ZjeXv5Nh62afqgLA2MGtMUH5E2v52eRuLCVDDmK6CwkFB+YRUMb79rbdz67h25i
X-Proofpoint-GUID: vwJ1x-mh25wn83qCrwEj2zS7pusj-l8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170054

On 17/06/25 08:14:23, Krzysztof Kozlowski wrote:
> On 16/06/2025 18:59, Jorge Ramirez wrote:
> > On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
> >> On 16/06/2025 18:18, Jorge Ramirez wrote:
> >>> On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> >>>> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>>>>>
> >>>>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>>>>>> +  on Qualcomm platforms
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: qcom,venus-common.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    const: qcom,qcm2290-venus
> >>>>>>> +
> >>>>>>> +  power-domains:
> >>>>>>> +    minItems: 2
> >>>>>>> +    maxItems: 3
> >>>>>>> +
> >>>>>>> +  power-domain-names:
> >>>>>>> +    minItems: 2
> >>>>>>
> >>>>>> Why is this flexible? Either you have two or three. Not mixed.
> >>>>>
> >>>>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
> >>>>
> >>>> This does not explain why this is optional HERE. You cannot use for a
> >>>> new platform an argument that some existing platform was changed in
> >>>> ABI-preserving way.
> >>>
> >>> thanks for quick the follow up.
> >>>
> >>> but bear with me please because I dont follow - why can the same logic
> >>> be used - it being applicable - and therefore result in a definition
> >>> similar to those other platforms?
> >>
> >> Because this platform either has 2 or 3, not both. Unless that's not
> >> true, but then please share some arguments.
> > 
> > as with every other venus schema with more than 1 power domain, the
> > argument is the same one that I have shared with you a couple of
> > messages back (DVFS).
> > 
> > verbatim:
> >     Venus needs to vote for the performance state of a power domain (cx)
> >     to be able to support DVFS. This 'cx' power domain is controlled by
> >     rpm and is a common power domain (scalable) not specific to
> >     venus alone. This is optional in the sense that, leaving this power
> >     domain out does not really impact the functionality but just makes
> >     the platform a little less power efficient.
> 
> That's not definition of optional. The domain is needed for this device,
> the device is one way or another having its rails routed to that domain.
> It is not optional.
> 
> > 
> > Seeing all these venus schemas follow the same pattern, it seems to me
> > that this is the correct way of implementing the above.
> 
> No for the reason I mentioned earlier.

So just to close this story up, were these two commits wrongly
reviewed and signed off then ? Please do notice they were also - just
like this one - new additions and not a change in an ABI preserving way
as you characterize them.

e48b839b6699c2268e545360e06962bb76ff5b8d
8d3a1cb32124eaeb3f2efe4889de214d3b658d8d

> 
> > 
> > You seem to disagree. please could you explain?
> 
> I already explained. You add new device, so argument to preserve ABI,
> which was accepted THAT TIME, is not valid. You do not have ABI.

as per the two commits above, this is not an argument to 'presereve' an ABI -
this looks to me like an implementation.

anyhow, if everyone agrees this is the only way to move this forward
will do just fix this to three then.

please let me know.

> 
> 
> Best regards,
> Krzysztof

