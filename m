Return-Path: <linux-media+bounces-51543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIkHONRAd2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:24:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E1186D0B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B088301682E
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFA930214D;
	Mon, 26 Jan 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cW0h5Nyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3nBEURC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3D30DD01
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422812; cv=none; b=uHOhZSkQQvNBvBS74l02BDJZTshJAARvjm7cEj7IRliVh4w2xh+vaRZsvtKSNXARV0hesfJJ4vFcDA/sqOXCXLt6kq39pD8DZiNTyS5TtTflWvH6xWUdbI+FmKVs2hi6vrPKk2w/a+uwirM9VZDFS8tK/7vaadIyHNvvD72W1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422812; c=relaxed/simple;
	bh=pKcJhyy5nmwFpFkBIGKJy8DceYT6qS5Qhp1XA2SJfPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O13CIIfaVbGiNmj9l3Fbl8eSGBKDC2KOxTRW+cZN6mqRweZfT+i8N+2kT72EZ2nZS+fPMkPU0kGMKNUFP0xP1XmRc8DN/a8hrJTeyQsGo4M5MYLAknvPPJJKHJ0PDtLkKL/SrLyane61P0qV7dyVr18Q1XUfMiYNvMze2cKkyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cW0h5Nyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3nBEURC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8vEpw475546
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8aOY1BIogsBSJLCb9WvzQfe4
	UP0ALZx9iSHXYMS9hnY=; b=cW0h5Nyi1kTZUef4BMppF0NRpZj92BhaNvvXFGAm
	FFJ1SAwIJPeJ1ZFeFKP6QHVXFQsIVBJ8qcEOoa934QIdWwP4f0AkNP5l7Moc5IsR
	h++hGESZEqfPJw6AVjUacyIWK0wodRBL1uqlFzMxahBI2lZqMQLsGcNSawVW9sy6
	TK6XJwhxo5QlHF5OWyvrVzj0j5kLqqLr0tcOEFSkx6w7HwKt85Pt+/iSlc0iV28s
	AKDiYpaUE/PvlOo29Cqs5vHvgCtTkdf6HU1w43thWZ0Rw3dkePvAMTPOEK0Gvc4L
	sCf+jkP1UHQm2iH169PCkv50uXmkxb+NomA/Q+oXIce8eQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uv6aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:20:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ed0ec20724so14080389137.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422809; x=1770027609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aOY1BIogsBSJLCb9WvzQfe4UP0ALZx9iSHXYMS9hnY=;
        b=g3nBEURC2pa8uLUSSEIZgZHNOBny8mMhrvB/k77wnGtyxGao5WpeASLW736ZXdkk0B
         WZHDxWCTs8WgI+RE3ag4bb2mf+Mk0mKZ9jI6MKoh3F8XtmUboEhGfmkPmljGkjLexcXk
         Z9yFsQbPDtNr0yTWekuxp307apBFY05ucbJPibGQdMkQyUwLE7HTPX7Vl9iv8cJk4Dv/
         Tboi9b2nGrCoRlg2syz7p5iWIrjox16FhIyIlrIkCKv1OjSDwQmgWRPhuzSo7Fdfvk6A
         XVS7JOMlQxAFLzcazy7DaFYspn1adeQv7c3EeLqVIyXdTBFkt3n+y4nH25Ze8s2cyfpm
         899w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422809; x=1770027609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aOY1BIogsBSJLCb9WvzQfe4UP0ALZx9iSHXYMS9hnY=;
        b=BpCqd/vLO9VprLbPNmxoCZpZOpQWhUrInC5g5JuqV1Dzxs6U2k70Kl2p3KlTgHUEaM
         sAT1vp9pKjqHwAHfUWq2z6T8d6Qg4hz+La1gW7296R6wORoANAUYdKPZrRydgwRZGrsr
         CA0FrYcfbtfKtA7CNEjkiqCiASmpEUNFf6hSUgUsP5dqn7wrA74ijKrYRu0oJChR1+Bb
         POOE3QKLCG2+iC7XYmW+rdSu0dug/7cUAImUdkL5QfHKAX3K3xeHIZ4oGAT4vE9/Aqlb
         aQHZ1AmogY4LB8I9OCKUqFHex8WUvcpfPmc0LKKAOR1LfsU0KLplxB8L8k5ZtNRDWFOt
         lVhA==
X-Forwarded-Encrypted: i=1; AJvYcCXpwtEk0ETsdUti7LFWGocpDoMmUFKoK3NwF+Ne6YExDrCebE6dJJ5ZPyrj4lWnQmFRDN8AJtTFs06d5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNUMUAn8wtqKvnMVF/2/fx5T3M/j/Z7DoR9Q/t/h5VGL+Xs3vV
	QVb5+W8pUPNSfnwIn7GSFl5Fpbe+bfm7zH/vUzYT9igpbQtkILGeRFjIzvNuUV7uK9DGZwoZU/7
	W/+29ihmimPPIqLwGUbuWGeVU6SSDsGmJjFyMdn10bCsQmFzx9F0Anv3KBzhmujULcQ==
X-Gm-Gg: AZuq6aIjuyLJOi+SiwRKYE/+q1Pja9wcSXwCaQuoSDCN8hflfJ0U4VIg4/xoYiXmG1w
	rX0G9I8itBpd610C9jyXeS8j2VeEHs1vdwshrb3zfjkI0ZDjPaHfW21fpfMLBhdX7OSJsezMiQ4
	TIem2+zeWla+UFiG0gk/gB/tn/u0viW6t42Uh3a500hmQfpaHsUUOPb//lJBl/5pAA8v0oJoPC1
	D64Co2lk5Gs8yd5iM/JU3QqyJbp7fqpeAZlmuH3otCnnokvZBlW/8AJMFxVFeSHMJvPHmFj1LHt
	WZT/WyoyCDqQz/0g/2ykM2qQ8Y3U2IOdFwPvJigyUpj5bvHjcY5PU+cejxi/pYIzKDFcmI64Qba
	t13Xu03qL1m2fXpEVP93zwKTcd2NVGzDcaps2fSfTL1oOkxQceP0DNT8SPcXX9l5w5UVeOtdEIm
	9NBNqqXpqvnNbFnx0hgx+WAHg=
X-Received: by 2002:a05:6102:2914:b0:5f0:2451:5f2 with SMTP id ada2fe7eead31-5f576364731mr1327565137.19.1769422809456;
        Mon, 26 Jan 2026 02:20:09 -0800 (PST)
X-Received: by 2002:a05:6102:2914:b0:5f0:2451:5f2 with SMTP id ada2fe7eead31-5f576364731mr1327544137.19.1769422809004;
        Mon, 26 Jan 2026 02:20:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48e5e89sm2548308e87.25.2026.01.26.02.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:20:08 -0800 (PST)
Date: Mon, 26 Jan 2026 12:20:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Message-ID: <hkiyrszvcnczancdrbxgjkvyy2ifk4fm74v5meba3fiuseder7@yagmskxu27gh>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <7127f32a-0db5-4f30-b1b4-cf72fc117fd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7127f32a-0db5-4f30-b1b4-cf72fc117fd3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OCBTYWx0ZWRfX7Fda29k++8aX
 SK3hipi+Swz7KtMrC5gNcXA4SPtUjwJluegj0yg5zOo0NqUYhqMANhOss2u9yc/hiotXNQrp62R
 4DuKBPPCPkD8rPamltzFU4sgoxGc+kpDHfiIt2X09uvpDGo/vPXALu3v5aMp5BqHVUmXW3a6uRD
 aYbb0J0QBL18a8nSHCWmKPiHmY7KQoYF0LRjTftC7feqZs8cp8hhFBTvoTMAR4j5O6Q01GIcFW3
 DWzPl6qdg/OYiemidgVwqB38+bNs97Jf+fuHB64XlqIkRM1GR1Pq/BrZjDS/A4ozI3vtyZQl1LP
 J3hrLZp6/opd5z7J26KRREjW9CwdD/ALvtrOZLItgyWN3IaIOKCdb7/OOtj/irC5w3SPXXqLUgp
 QwCka4LHQPX6jEVWXeUkLnIp25D6xiEMjYwMN9pyukl+DFlcO3X7pgM2B6QSymlVR6lXblzTjx5
 HgLVXCZUZYQ5Ao6pw9Q==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69773fda cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6_GLyHCiwB-T1Dm2cJwA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mpxpUS0xeVGthYW0GURAAHbNjp6XQt6-
X-Proofpoint-GUID: mpxpUS0xeVGthYW0GURAAHbNjp6XQt6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51543-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69E1186D0B
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:00:56AM +0100, Konrad Dybcio wrote:
> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> > From: Konrad Dybcio <konradybcio@kernel.org>
> > 
> > Both of these SoCs implement an IRIS2 block, with SC8280XP being able
> > to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
> > SC8280XP having just 2.
> > 
> > Document Iris2 cores found on these SoCs.
> > 
> > Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > [ bod: dropped dts video-encoder/video-decoder ]
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > [db: dropped status, dropped extra LLCC interconnect]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +description: |
> > +  The Venus Iris2 IP is a video encode and decode accelerator present
> > +  on Qualcomm platforms
> > +
> > +allOf:
> > +  - $ref: qcom,venus-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sc8280xp-venus
> > +      - qcom,sm8350-venus
> 
> FYI the hardware is actually named "Iris" starting with 8150/8180

I'd prefer to continue using the name that existed in the earlier
patches and which has been used for other chips in the generation. If
maintainers insist, I'd switch to -iris for the next series.

-- 
With best wishes
Dmitry

