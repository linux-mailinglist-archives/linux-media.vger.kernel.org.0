Return-Path: <linux-media+bounces-53810-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFqvOKiWomn14AQAu9opvQ
	(envelope-from <linux-media+bounces-53810-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:18:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAE01C0EC1
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFA93302A9F5
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B634A36A025;
	Sat, 28 Feb 2026 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo7p2Ff+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gn9SzwvA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77E1A9F83
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772263073; cv=none; b=mDpKo9AO44qdNbxKrZ1PPHat1I+lXIUbLZzM95k0AyiqSDqV07BtneCLuqf6iVyBxeQylsKHMDLJnpydCL19+SvSz9yDywYlYw4j3xs2kpfaFcYNxRp6QoATawTszqsS+24e+pce/KyBqniEO23N2YgnCY+3Ylu22k9xtml9SDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772263073; c=relaxed/simple;
	bh=pjHPMCgxqYfEhJbUMXAgV0DOg/qXZ27i6nxNztl78RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3PPr/G9ATCZHVSq2SNXarpDSGDgp7FJzSbnZF8INRlGttrTon26eH/uLd1znsF2v4rI0xpu9t1ZEprbZlQMScYt/i0HnaFk2P6A2xnOBIjNM/xQafWBcrgvLNTDYCScpCB596he4UxgwFpHdCUgIh6qiy0+/e9CKWpu1iRN1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo7p2Ff+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gn9SzwvA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Rded1403793
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhQNpl7AQEod0mH40aeXlLKN
	V3u3+gs0tTBY/guFsgU=; b=Fo7p2Ff+Z/f1vIf11BNVx4/AywPkMuVDlKd8AXXN
	RLzkKupz9h159MGRlgAmMa9s/Aaju7o9agFqVNc005CPe1qjvCwEi/OfAA8mKWB/
	GlT1dID9FoQDZo54kKNBh3bWeGyrec1Z0f6PtK3DDtRpGRusXkljTt0h65V6MZxq
	Li8F9VsVMYOubnQXOPejsTgMI2SX8l2KVVxMppqbaqeFyO8vqWtV9Uk/+Sa257Zy
	47LiX5KEznMtqYCDYqCPoF5Izj3aTEoSUABisa3pKKUKc+H9X6xGK5Hy+NyjSVEF
	cx8GuPvNdIWmQIL6Rw6F6O6C74XaIYZt+9TJbaEhNVhzDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkrae8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:17:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so2055787585a.2
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 23:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772263070; x=1772867870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=Gn9SzwvAKgg1DzX3jffeRHAMS6w57mE7YgelU2anGKbYRYf1jXFeYOCQO2/HFQhBIb
         x8P2yoHFt8uo0VZi+he2SBgxrWXNKaN1JDJfEKJ1yU35O5NAPYgT4rdVWc93GH9LxHtU
         ER3VMjMQTvc+81mpkTuDMyGMTStficR2fMiJvARqoHt9xGUhPpdE5BGP7ZTymcM4/mCq
         3GjqkK33gp4/VgrJ86QflEYxHHAIvk+DbICuPHyXSoeirBbhaqqqVv8d9o+lIW70RDWS
         B5hgkhEsgWz8haZDVkHqdprGGeuZVw9/qfFjWcr0AHJ+Se6vj92H+XtYuySqwF9TIaso
         HtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772263070; x=1772867870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhQNpl7AQEod0mH40aeXlLKNV3u3+gs0tTBY/guFsgU=;
        b=i3QcGLpIbRKJMIlU4VuPnhHF/fkbPuIPGQ9HIAMXaCHjmopf/UZ8avsDVQZF43BHv9
         177CH1Jd9iE53cLxY3AQx5MYiXmrCAx6vFkSUO4jkBaOoYdx8bFnrNP7IRGpTVZygY3U
         3MYXx+iKz/+M6IlSkACNQI8Mm93dQFwKY0AZwI4hmb71uVigwaaRsxiEUxwOCO8vnMhS
         BGp1k58t3he/TOwsWDhISdbblEq0xgbPsXogSW3k3T2FcLs8qgbyQXi/IAq+J3ldknn2
         RugywklTkjD7p7Gus26eiyKHXoxbYs+nqoMOgY1aG3dVIhs+RRkmY+ZSKyOycy7WKV2R
         vSew==
X-Forwarded-Encrypted: i=1; AJvYcCVf1aoAqTGwYqUi/l8DpAgxQhRSaBNnIFg1awmy3rp2H8lb3iftrnAEGioZawpOB+N1isW/blcFvny/MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylPPNeBSwrI44Qqk/T/ulx4F9VV87WUEtFk/uf+FaRYzeDUSKV
	W8ZIEDLSUXnb0PK9hMM5oMicG37h2DXCf26lEnReKFbsS2KU7dc3n3sibCG1qSdklwiAxYSYzfG
	/PAOzIsxENYZWFC3N0bLojzKDy7wOuxt7Yd8Xz94e+A0usyFHIIF1pEI7nVLOYr++6Q==
X-Gm-Gg: ATEYQzwE7Gm9ClV7v13XEz4VmUm9olmxLqjXSbaYbLgZL1ilo63VhLkRd/yMFE1mv46
	Gm8CvhZguY4B/jSFALqYFfJoOxPhF5yvOebtSg95hEq+4wV3S0qxUSw1DGqyqddGIvc1DeoX3LI
	CTfG17YvgnZsXN939iHwuNBkAVPJeR5RKFR/akVFyPQYl+dAE2DQtfclDbyyq9e71H5btrAmVMi
	jmFf/HShDrgTIM1PW4GBkCe/WgBEiwg++FVjUbPVIiekQA+m029ZTiOzRMJUpqQ8JVlaLJiDkAT
	C+Rf6xuZiHPkykWxH3cdzORlR89/yor0CIzEIbRCpTTUgh7ZKKOtGvGcZq73Zk1xROeTk9QZoWu
	kzVo17Uh7MSURyF4mgSyNsDHIENGNED/3cm7lhxV2b4f83YgwGWQCRtPuW44ursI2Ne+GuZ5Iss
	F77BxVv0OrRgLKi5ezJFJako9+5hhQbGIGz8Q=
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607082785a.80.1772263070364;
        Fri, 27 Feb 2026 23:17:50 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8b2:e1b5:5f20 with SMTP id af79cd13be357-8cbc8e39beamr607080485a.80.1772263069886;
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11771e36dsm262153e87.78.2026.02.27.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:17:49 -0800 (PST)
Date: Sat, 28 Feb 2026 09:17:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Message-ID: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA2MyBTYWx0ZWRfXx85txqXAodP2
 9JRzhpPgoxJCgPYRH6QIciG8QUcb27fGqPXP9B8vU/G7Tw/CmQDjqajkOfQDlE/7D1T+gd1ZrMR
 yvfc3tuxpWLGDQQhI+B5kqEGQ869zdexnf4qCiYLn+IGOoJP5odifW5NCpdIxavMe5/vtXoTmY2
 lXNrmJiFYzxF+autQUejcWRtkfT/kv34jtAkyOzvf0e7x3BT0ZJlFIZM6+2cVujROTXk9ExcIYg
 sPfXfsYXR5tESqoc0FDucWFWs5AssMVxH3Lh1H4+UnY1SORqc9n9CM0KRPvxSNUxA+4IE8DvYyI
 4K9P1bWIZPZJIkM/hgTNC++Q3pWx/4VvwF7ittB5rGggTuBhLaGN1JAbeDrOq8IaZivmo/+SI70
 p1Kc8Gy+VqB5d6F+kIVUt2g1FUqSp+o6T5MN/+oReix0gipfMn1RfbJshAm9CzriHQfP3Yu1JPd
 L1Kqv9lPCDEpN3CwrOw==
X-Proofpoint-ORIG-GUID: TILtNdb1ki4aPj0fqPFwLWXzJCiSNIxT
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a2969f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=lcIpdndxgU2EbPpCd8EA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TILtNdb1ki4aPj0fqPFwLWXzJCiSNIxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53810-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AAE01C0EC1
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> Hi Bryan,
> 
> On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

Christopher, please trim your messages. There is no point in having the
whole original patch to be quoted if you are replying with an R-B.

> 
> > ---
> >  .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
> >  1 file changed, 65 insertions(+), 4 deletions(-)
> > 

-- 
With best wishes
Dmitry

