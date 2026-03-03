Return-Path: <linux-media+bounces-54413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHTVOIF1p2mehgAAu9opvQ
	(envelope-from <linux-media+bounces-54413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:57:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 452211F88F2
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F04A4315C5D2
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A13F372EEF;
	Tue,  3 Mar 2026 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtUUexE4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPoQFXEj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E323750AB
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582016; cv=none; b=bqkhTlzZVuqkjLvskbhyk/JRuhh63/d5ao4QOUaZWkBblBK8yYQWiSkvdsiPABqWPeS+WdhsyiGSnvCw+9vV3+CZ3oexyEXSy055a+TBWFPMox5+hRGLGJ5NKe/LT87UdLT1UnxFA/aDGHSVAr3dXDGh1S9fYOHRJWlGfq9pUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582016; c=relaxed/simple;
	bh=mPTUW7+++I6V6Gkh87svMpd4/+jZKqbsn6FojcsInxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLsYnRwsI+QlQ2EZE3kyqBJEAxx1YmHq5AldpufN27tEMJ8fE7Wn7jW+AZ9h/PJhL3ZW2TmjTxw4Z7X8A6ZBwfWMzE4JkhdGWCO3hZe1QCm36hSmgrTxmdYFuvj3TgLIvDzZxw8Zi1y8FVPt55mserVlyEG3Cv/taly7Oa1dP0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtUUexE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPoQFXEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0XSq687021
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 23:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=noxRLzHbqcCDZ6D5qPjWL1fr
	JAIlBz2av79smoXBpok=; b=NtUUexE4oSQgmcfAsSdQD/L9owS6vT+FFCvpawgp
	Ssg14qq0ryWbuXuRBywc8tfo5aNLDUYI0tzkUmvI2Yfi1zCbNXvpouSZ3dd1LLOH
	00X1IbcwPyMzqJKXEySol0oaVFdZoAvKLdLmcfSG+U7+GOerou8v+UGtbe9Bo2EM
	8b1ptVVD6joiP7C7yrlT4o4t8J2xnOIo52oFkktWsQ9z5I0xnYDzo3+XC+lpkLiX
	Q96Ry/JPkDKEAoKlEi63xeo+0sXZmMct2EIikXhXbwZWfRbrDBGPc8mm8ljWDvFk
	ZMk/TktSqLY7ghbJiTY4CIBIjekz0pSYb9pXBzRlzTQHMQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3nb75y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 23:53:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a08e6cd15so95522636d6.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 15:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772582013; x=1773186813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noxRLzHbqcCDZ6D5qPjWL1frJAIlBz2av79smoXBpok=;
        b=kPoQFXEjz1Y83RMBNJ5TYHEPrgvqPA3cTcyLSFCwDxnLqluujj+dUMWENZ5ihIUPdO
         FQsGR3M++wnYdSLnazClENDZjaPAFW6mC1pAdq9eKbDg3f9VBWVoWzeozDXA9vGOC3fj
         +b5hr3c59XrWwBbBa7G8BwTb1+jOoljtTVEhPvxvp/RRHDW0Izml3RJJ0Rj3VRJtuTrJ
         UG20jMCkAvox5Pk3+VX5BvYYg52GlLLn112wU6Q9Yl456TdBLt4AombKWsp2pMgulAMm
         1LCRVwaDi3Lz+R+QAMQQ3/6TSmjVfZiHnU5S6vsHuYKnQL65hGeBM48s4mktikRoQvLd
         eY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582013; x=1773186813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noxRLzHbqcCDZ6D5qPjWL1frJAIlBz2av79smoXBpok=;
        b=DCDcEj/BdQTnR6cXfwgv3B3cZ9bVWy9kUAxWcNujbW4dctbqdbNjtJyr8ySlrhDRU4
         qS6OzKOTf1twscAZ6/UpFctkYWMaRTXcD88N/APGHOU/NL8WbvDUrbnBXaZ81xmqNZUc
         uOorQ2r7CxKwVxhzdzKU0YSa0bZYrxCYo1ZRHTn3Ljn7tq2ZipRHAljUhNQT5QhSel7l
         i+zGyli5ji62eqsqL/UmNVvSP2nbTsAO3GywJJDxfrlrs/YWD+bCf487amSvH/xWI5Ve
         4r1Ih9+7ccdqRHPE+kmiZEjol4X+2taSjxrLt/FT5XJlC8L2f6qNIksgK9nBDX8A37/A
         60Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWfe3btamNyi5fCjRmQKA6SGZvG5cCLiOkx0Hf+cCwgINKCmfg8J3M0iqkF+a0TXH4yJvCdJ2MiiAWfWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qH40mxpA0uJMZEEzFbHWZDRL5cCoXFlZwe2QF2JGPurHs/kI
	it42zfDLkwYqCTmBp1BSv08kscv3aPjChleW7LxAOtJrBLHFFKT7TAyNiYKq/PFP97lIVdM9n7z
	D1FYYSSNzjVeSkTSB25GsuzKtgbuI6NLbIw+lx7wgWdYOquXwBjlX+ky/CfRVfA2ORw==
X-Gm-Gg: ATEYQzy7dGqFwZop352aOR9lkGwX3U+BFKj37Q1SdLNgLCieZgp5JMcvaH+7cN8J0y3
	YF5UujMVtYxE1qnNOUVqcW9h4nUQl4LBzv5HvB5eiNF0CWBfyzJLHW/a26stAuR9l7aWoICHKAa
	d8MBDBhc85EuyxC+XaBPYFWUsY/UXA4BSvZdM2oWbxkb16fNRI5EEkT1U69gKR21k1K2TXQp6Gu
	RJh5sqJQe5QKYy0SJveKRyGgEAnsNw0mEzWWiAEo53Qon9uko1ZQvEY6p4xmM5C0k6688vP0F1H
	iANQ+gQK39Lyu5PsCWiqXHheR83IZpfjqWqglkCFFRNDSshIKksGxvE7Rjl3k/T8ZXP+78YADV4
	b3nlZ0ZUxUTPQ2vds48qkqnlwk/pIDs28iSz1va1N5E7TROyHlmw3t4/Q91grvTTsl3WuQcdP7K
	NoAOjKoX/LYZtKPFBb7O688JAJ2YzLXzHj+qY=
X-Received: by 2002:a05:620a:31a5:b0:8c6:a3ed:2f65 with SMTP id af79cd13be357-8cd5af18213mr29450085a.23.1772582013492;
        Tue, 03 Mar 2026 15:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c6:a3ed:2f65 with SMTP id af79cd13be357-8cd5af18213mr29445885a.23.1772582013040;
        Tue, 03 Mar 2026 15:53:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357d2a9sm884016e87.40.2026.03.03.15.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:53:31 -0800 (PST)
Date: Wed, 4 Mar 2026 01:53:30 +0200
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
Subject: Re: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <fjvug6snigssgheuduzjomzjq6apte2ggixqzjzziwcycee4l2@irh2mkholacy>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
 <nen35eqhwbikt7jlpxn22hvur33chxibrbmzd6awo425i3mujf@f2cbncxpcatc>
 <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <635cc998-d530-42eb-95cf-99b0d5baab68@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a7747e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Ni5EwOkUcNZy2ZnK61YA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aSuWEFxsybr8EwOkJc5qHyk0sXGxLQxk
X-Proofpoint-GUID: aSuWEFxsybr8EwOkJc5qHyk0sXGxLQxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfXyfShm5i6f8JD
 EmdOLzeD0ccceWiLEYPQgeRgqhRQMl8rKZ2yTLqUa9dgatrY5t0c786xrdZNLv+d+iovEICYibd
 WaQJnTeWbodys/dZs1e0hH7BNINPj4B3U309XieinOQfT+9wBhwDzKWYeYq8fLfXbeovJHALnmJ
 UorxlamB0A/Opl6872GzX9P0RD/PFqnuKZXUDqJGMZpUw3+1TJ4DdLMRVEeefpQlABrkp2jje+V
 dPw93Wu8G8jRXk9ZDvs0c6lvQRoMK7Yszg1XxZqZLNJrBwjOmA68xz2Dy4rjAdjzxAB8OrxJzOa
 DjlIOOtAUdZ7C3uLyNmt9tMX9NTTMw0IWwcNuHGXL05ysPny6AJSfLKdYAhcp32v7bjIEdgHx/+
 GgKMBqVlD10KG56JYvggjUF07OW2DlYdkzH925mN8m/28B7t6jRZKDAh9LC9GBcDMY/ZMPLZMRi
 PTEUkbPvojEjMme1jNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030196
X-Rspamd-Queue-Id: 452211F88F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54413-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:43:40PM +0530, Vikash Garodia wrote:
> 
> 
> On 2/28/2026 1:22 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 07:41:17PM +0530, Vikash Garodia wrote:
> > > Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> > > compared to previous generation, iris3x, it has,
> > > - separate power domains for stream and pixel processing hardware blocks
> > >    (bse and vpp).
> > > - additional power domain for apv codec.
> > > - power domains for individual pipes (VPPx).
> > > - different clocks and reset lines.
> > > 
> > > iommu-map include all the different stream-ids which can be possibly
> > > generated by vpu4 hardware as below,
> > > bitstream stream from vcodec
> > > non-pixel stream from vcodec
> > > non-pixel stream from tensilica
> > > pixel stream from vcodec
> > > secure bitstream stream from vcodec
> > > secure non-pixel stream from vcodec
> > > secure non-pixel stream from tensilica
> > > secure pixel stream from vcodec
> > > firmware stream from tensilica (might be handled by the TZ / hyp)
> > > 
> > > This patch is depend on the below dt-schema patch.
> > > Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
> > >   include/dt-bindings/media/qcom,iris.h              |  18 ++
> > >   2 files changed, 279 insertions(+)
> > > 
> > > +
> > > +  iommu-map:
> > > +    description: |
> > > +        - bitstream stream from vcodec
> > > +        - non-pixel stream from vcodec
> > > +        - non-pixel stream from tensilica
> > > +        - pixel stream from vcodec
> > > +        - secure bitstream stream from vcodec
> > > +        - secure non-pixel stream from vcodec
> > > +        - secure non-pixel stream from tensilica
> > > +        - secure pixel stream from vcodec
> > > +        # firmware might be handled by the TZ / hyp
> > > +        - firmware stream from tensilica
> > 
> > Why are you providing description as a list rather than describing each
> > item separately? Then you wouldn't need maxItems.
> > 
> 
> rewrote them as below and dropped maxItems. Please review.
> 
> iommu-map:
>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>     items:
>       - description: bitstream stream from vcodec
>         items:
>           - description: Function ID
>           - description: Phandle to IOMMU
>           - description: IOMMU stream ID base
>           - description: IOMMU stream ID mask
>           - description: Number of stream IDs

I'm not a pro in the DT. Is the itemization of the first item reused for
the rest of the items?

>       - description: non-pixel stream from vcodec
>       - description: non-pixel stream from tensilica
>       - description: pixel stream from vcodec
>       - description: secure bitstream stream from vcodec
>       - description: secure non-pixel stream from vcodec
>       - description: secure non-pixel stream from tensilica
>       - description: secure pixel stream from vcodec
>       # firmware might be handled by the TZ / hyp
>       - description: firmware stream from tensilica
>     minItems: 8
> 
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    items:
> > > +      $ref: '#/definitions/iommu-types'
> > > +      minItems: 5
> > > +    minItems: 8
> > > +    maxItems: 9
> > > +
> > 
> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

