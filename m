Return-Path: <linux-media+bounces-67324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g1x0CKlfUWqfDQMAu9opvQ
	(envelope-from <linux-media+bounces-67324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:10:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FFF73EA43
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pWjvz4Aj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YoQKsaKa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67324-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67324-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8360302DA08
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4622E32F765;
	Fri, 10 Jul 2026 21:05:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D573314A98
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:05:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717510; cv=none; b=vBUgc86dX5tsB/Gqe3YZyCd4Z2yEG1bGnAtiAUPfxXedNRp0tRV3k0W7Wx+27eh3k7qtxTEzgV48T1xIdPiMKQ4YcQZ0AvUzavYmeCp13cDOZZHLe+qNBwCaegdN9xNbMwVuRHJscky5kLuR+iAX74h3EOLB4G4m+xW28sjfR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717510; c=relaxed/simple;
	bh=gE1IFtkeWzkXOcvLqsQ73tJs7dYxitmjzZU0BgU6gO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdNLhlysS76y0DcjAakSX0veeOnh2rdZS43r6bvFrfXjI5zsxBF262hvz1jUPOX0EBsvAhL+Df/JA39lj/rkoXBBNTRoHjguB32PAYTJxSyWxRbNMOyQbJJ0LwhVvUEfRjAAN7Ty/+g9Sx+6hMkezHAU+fUDRvwzyvCMjXD/By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWjvz4Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoQKsaKa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AK3ZSe1752919
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dwt5k3fowZ2mfZny5OMNxv60
	XAgWL+172QPd+A4v3vo=; b=pWjvz4AjL8pM7/cnTiV+0dQT+5TJHu0akfmT0AJ3
	YGhLah7sU6PYjCvmYqrjCdkvuaTCG77dfHTy1Gh+ufakdnRO139G0PhVFj5DNPSK
	wnGlTbhMcOFfJx+YF+q+sbq4Z+7GIHGMnTagP3Clx1zAFSAHu99Gl7m+eIDl3nSS
	DnOQAEJKsXu4CDQcJqFtYpKRDGgRMn1Xs6uSkf0TioZv0xCr9GSyyL8fQPNp9Lrp
	Bb3GLd0qVPW4XLWRdtt+u/Giq6fT9KFlxObe3F8RbKg16JcRmuCRLXq0H68xFtGQ
	0c64kn9GD4xuoAZ0snLlIAvMl6ErzLt7cTT0YiVbezjVeA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc9dk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:05:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-972f59dd56eso2205241.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783717507; x=1784322307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=YoQKsaKauZCiF6r5h5CfAu3bPBm2WG2HmlLbHsVoC9mh5pe0dC85pVQjs1+OIIGR51
         spFKdEgWb49vo6kEOMjYwAU4ojRQqmH2onEwn8FlVZ+JM9o1UQoufjGwUC0+nr4OTm2P
         js9a8WK5I27K6mnQrczy5jAYSGX1Aw4s3LGuSeeUXLVfU2Rm7KOUByIrzWloU9dyHwUQ
         OxypPE583dVsLA9/QE9s54EOVHnmIzFZAsx56QAwmOhDUAqDBZKTx1t9CRkRtv/bEbmb
         cttqM1TDvnLaN8mPnPs3ruD1pEJ5bHCSp5K473xgyiUf2cB5PhwaydzbVbyDRrQu3Qns
         aqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717507; x=1784322307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=YeN9Qh2VI2rnALp/in5o9+MCmo3nAQPm9VyNmcRTVE0CQqk7ErPlpxK3MYPyjxlxuF
         kwQZhvitv1joh/x1ZZDtYc8+Ah8B4Ks3ikH2zruVgda7KZcvfkzv2ckXaopUzj06KDye
         8cSbRB6T9Yj5cOJ3sQtcjmTWR1slaMWFHm5whhi7GUVA4VaPmVSpgtRH6ZI5flL6OatR
         yGPwZw+DCQt6S/xZn26lS4Bx2PmcOZ53p3gC9TWaKGyJalptdbSM+JM9w5AS5lxobh5O
         yry8axI2O7z8/V2RA8ZWvn8iMAIQT1wBERTLy2TPGjR4R+0Kd5bjmRU7e8CDA3letGBX
         g+dg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8MOGQ3GU8oiWgbox8SeLlfE8XT0p5/gKRStXjkKgbTLpez07sAnRNFrE8+YnpbjlCau59EfYRanP1wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFc63gNaguW5fsvjn2Csevkjfq/DfGObY7Po8y/Hgeu5DYfVn
	RMiors5lHmzS2n1zBWjVXv79navzc6JpBT1/eklC3EPh9+vXyB1Jw6XtGjSU4ZhcYa4inFmbMui
	vPudhpfFpOUKP/ucSWE/18hjZL0+4j6+sqkcO6ujVJrMhep8ZdnsiVavHi7MVYV1edMKT+GG8HQ
	==
X-Gm-Gg: AfdE7cmO2aBV7G8p5ToR344nO2nlFAa/Wf/ye0ajV9pWhO1zGE8FKVbdC8074zHIRtF
	21eHnCdb5hlfXHrJZ3vbuHobt5A0AfSn0vjXQVm6pk6TDli8bSgZ9zVTAyr+Zie/tXFXZNmO70z
	27i3eTi+qVI2EpGtaiuQD6UTlaZ/TO+TgfGVTRSEGa0fN5UK6GLT03Io/OJwzL54sIFcaqFz2y0
	wNbOo2QD0ybuPQi+z6tLSzy01EwNqqI0IXxTrTXGzg5HjG3Q1t72rmJqD4g9Hg49E71pkUZGMRC
	r0jN/survo21NoeRiXNqlD2vpN+rI1jLRSTjSSscF0TIruULpxBIRLUSJ65T71ErbveovI9ne6T
	h3ybOfFhzU1M41Ys3n/BJCSGDY+Y3Rf2io168K9Xkn1iI7OdlN1lhZvmJQyBJN+nK/1kct0riSK
	N5vDRonJVNPVndzrCkin0BAhbM
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636290137.4.1783717507450;
        Fri, 10 Jul 2026 14:05:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636268137.4.1783717506952;
        Fri, 10 Jul 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab020asm883476e87.74.2026.07.10.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:04 -0700 (PDT)
Date: Sat, 11 Jul 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <7ftlpnxwpiouioppnmnz7mba3vmswot6hgjlp5ffudjcxohlws@wztskqyolsaq>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
 <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfXzwa8xIWroUBH
 MT5XJy7nrZV/68JfAIfCB7JXhdGGEhdnwoXQW/YF7pX2khdq65KtaUgEadQaut0BZHvQFzPVu5P
 8qd9RuFA1dNixd3dijgI2r5yUqx7CWmpQ7iEc1KXWTKraWRo506vm3QaKuGO1d8Kr9j3BQQoN4p
 YJIOKUEBmQFuUV4jVv6rMArk0hhMTY7vvOkFH9ko/VdTGcPtciGlke8x9aMrGCuyInlQHiA0SMp
 EqFaf8B6iXw9zrl2Fq5YzypTejkYtKfRusw14ziPucCmDPdzm4gzn47CdD+qM0LqOyhZQJsgRZx
 94aymqqpMb599NDXyFhb3CxRxaE+XQW0dAjVPI5zk80/ijVKvbA4V6Q3EIa3qj23Ar5TSSt61ZT
 gZV7cm8i710PYyd7y9D4PmbCcJM5Arv5KR32nn6tLk/YV56ToFKI86iLViRGHw7Rg55iUb+TNC0
 4ENFRV73yJcPrQUZizA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfX4Tkb7rBxg7v0
 0SQzTYB4wV2ajinjG4iFqy8INPd53N+aZAyLdY9hPyv5NsU3xL7akKkiCHfh1o6oJ0azcdOoi1z
 njYmgGt3XKCXBpD9SsdjcFpCtrLjbU8=
X-Proofpoint-ORIG-GUID: gvTKemGUWYJXTQXSffeUS_KUBW3efWbF
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a515e84 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=dzjCRWAtPjgZTTrisiYA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: gvTKemGUWYJXTQXSffeUS_KUBW3efWbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100210
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
	TAGGED_FROM(0.00)[bounces-67324-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url,wztskqyolsaq:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 68FFF73EA43

On Fri, Jul 10, 2026 at 11:35:45AM +0530, Vikash Garodia wrote:
> On 7/9/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> > > The Iris VPU has separate streams with different IOVA constraints. The
> > > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > > pixel stream can use the full IOVA space.
> > > Using a single set of IOMMU entries for the Iris node does not describe
> > > these per-stream limits and can allow accesses outside the supported
> > > range, which may lead to device crashes. One such issue was reported at:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > Add non-pixel and pixel child nodes, move each stream ID to its
> > > corresponding child node, and add a reserved IOVA range for the
> > > non-pixel stream.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
> > >   1 file changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		iris_resv: reservation-iris {
> > > +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> > > +		};
> > >   	};
> > >   	qup_opp_table_100mhz: opp-table-qup100mhz {
> > > @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >   			reset-names = "bus";
> > > -			iommus = <&apps_smmu 0x1940 0>,
> > > -				 <&apps_smmu 0x1947 0>;
> > >   			dma-coherent;
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +
> > >   			/*
> > >   			 * IRIS firmware is signed by vendors, only
> > >   			 * enable on boards where the proper signed firmware
> > > @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			 */
> > >   			status = "disabled";
> > > +			iris_non_pixel: non-pixel {
> > > +				iommus = <&apps_smmu 0x1940 0x0>;
> > > +				memory-region = <&iris_resv>;
> > > +			};
> > > +
> > > +			iris_pixel: pixel {
> > 
> > Unused label.
> 
> Kept it for consistency with others, it can be dropped though.

Consistency would be to have only the useful labels.

> > Also, shouldn't you specify the IOMMU region for this one
> > too?
> 
> There is no iova restriction for pixel domain, hence region is not needed
> there.

Ok. I was under impression that SIDs are generated based on the address.


-- 
With best wishes
Dmitry

