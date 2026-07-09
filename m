Return-Path: <linux-media+bounces-67155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id foTjFlaeT2qklAIAu9opvQ
	(envelope-from <linux-media+bounces-67155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:12:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A244A731716
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iCWIkrb3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HWQ0OwGM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67155-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67155-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B47730557D7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1A926A1C4;
	Thu,  9 Jul 2026 13:10:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38625B09F
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:10:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602628; cv=none; b=FVt/HIgn1i2NJqm8RCmO/Q95uHyR09imKdIc/bLUT3Y9s8US8R/MEgxSVrvdTd2PpRiyjeJGgfU2FleAQ6kJumLaKi3jE2ttSlDG99frStvu9n784kpN8CsrVyid0cUSrLUCcPctNe9SIVLRBPkyt9poGno5DIOspj1DhpQKLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602628; c=relaxed/simple;
	bh=Dsq3lEQKe/H1TDvpwIi8p3lkCA8eeKfJkYNghRMhTCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRCGkFd2cnyIIZg+Ov37LNPyqirvxcAGieVU2M8zMpFGzaX0upCjMw8VcHRnq+L3XJNpURAo6v+c38PHbmkOV/JdX21nxE0LYY9xpxo7KW3V+ftOFSIf51LT+r5sWTOhracIl6gdhVt+RDs2rhddsYj98s2jVm9I8/FYUPTek98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCWIkrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWQ0OwGM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCO31450485
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDWMTGf7KjZRGusHUDteshd4
	8q+Vr4jRLBjONU3KsoI=; b=iCWIkrb37PF266Ll3VPm3Lwu03ymhFV0Ruct3V3R
	GA26/ju0bPQeN6Ojo9NlDVVz5FNBs1ih+eJTSquZIXOcTR05UYGG+Kqq5RwAzc4X
	ZovTlkq8DnJ0apRPykWox8tdWNArujDMWABNaZvEZSG6DElnHq0PrFamAWuf2a9X
	IjUtmTEIEyTp/nv0kqYFSL+sHRvhUFNIWQb/23+2tKZIvBfyfTbUUmvYllQPTMYC
	0FBx+AtugCPwb5Pic48xqpCCU4RSVAmNYw5UnVVjPt8N91uw4r7Z1khgmkKJr5mU
	U6ajA0fv/96xVkgGzAvakX2hircCWvK3ORWWk4tfaQs29A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj38n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:10:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7377e2f1a62so541817137.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602626; x=1784207426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=HWQ0OwGMdN3fiWVsxHkR4fhfhi7/GAl0XBzB2R3jA2gwsRFR9XMYxTRNaJgEnCM8bj
         kL3aKpQTgEiAGjKkmA9DezeCM/HoZtrcppAd49VEwuHgoGvd75jbusSq26Dc7u/fkc47
         jMNlQWxfUYozxH+NnJX8/nUxhkBJIejfyOECLORL9bPczBaUV9vdVgj+hJKAhjzbInmy
         CTPv1GWlTDD5gdfb1tJ3oA3lqJTCUOwuaOS2E3nEydfmm6j4axKf/0eCQhwB87zUZ4bI
         Cw60TkCailw2JBR7COMsv1lW3tCstRkRqpogDD38LabygFsCNJPUGaSlqYAebIL0aXGj
         QFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602626; x=1784207426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDWMTGf7KjZRGusHUDteshd48q+Vr4jRLBjONU3KsoI=;
        b=UKlYso/U93XslIDWQTqH1B3jPs2971Ty9MkQae80obzmf+qFe0SB6ZpQ0PNE8GMEDz
         CIKUxUBe5p+XlNTEk7hIsGWtHZIpcwO27ezu3ha7rINF6fai78H9vJQEg5jzQwMbrXGA
         l/tQRbJKmHKC81ZObX3wcWFkQuc7+dWniPmgf9nxg7kL/6w/Rb3HP2hf9gzuP07M+cU4
         CDxZq2XehTXhcMOabFKLQiOVEUudECtWtE8NmPfWE3R3F8vT/Fkkq+TZpV/RCxkwK77P
         DwHs3c1z9X169zZ/yJC4iUY94tJmjbaPODeW+Qu7zyOlJCeQiVVKkJoZCGr+hgIJgI+0
         Vreg==
X-Forwarded-Encrypted: i=1; AHgh+RrEk+zw9hYR0B3jqhd7BDx8EX85b7zXaFpkFWNuEuJlbfHwp69a00+Cg4kRXPnPETFfz8AOmCQMxKdalQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4o3WDI9dIw+3RGEiksEr+djd8EJ87y3szENvO/wgZ3abf22gU
	K+MdosYE6Ed1h+2eZca1Uaf0r2DmVvAn8uF99wuKtdY7omxCT+ewwcqBxHoB4R1HmfmDczrJ65g
	l3VZlGMUqxa9fUyTnIB+/+1vvG89PRz1VKvYcfUGczUhcc3HNv4lYurE3JveOKjrd9A==
X-Gm-Gg: AfdE7cmhmExSToQPvNdkxAPTYTk2iQwSnZmSK0hURupMnKAzPPbxgtG/HFQivG1u7Ty
	bFzpcvR0KgQ1L+bjGfhgXroL0mlwXTCMCszsxl7TWQUoxJSzL7XFaPlm7i1GHxo1y7mpuPqp6My
	mGba3Tj+TNM/BFrv2tx2Sr1OzfB6mMDCkcSHC8zZ+rTewwPt7ZF1C8RCj4NBEblTvyFOqf2H7jT
	MciHAyePx+apJvZdedbCAEuwrbjKyEGNvPE16awWDY2JZfoHp9Qvnk6UOPxfwXh2E8ICh2fW9a4
	jgBQSlpzrXmIBniUJyERtuUthRqioaSQW84fKZC9ZBVYry71rk1IVEH7LOBCZoaqroczai7wv7l
	ywGHTQWyy9hN5Tkz5KfJ3rivX/6jWndNisp3tU3rcyhHfuSei4shR+i5UrO9bPc/n0hdTi/sE4o
	kXCa6w5/7WrvYgie0LTneGuIfu
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4185829137.10.1783602625750;
        Thu, 09 Jul 2026 06:10:25 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:728:4383:c831 with SMTP id ada2fe7eead31-744dff87b7emr4185807137.10.1783602625267;
        Thu, 09 Jul 2026 06:10:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm5284238e87.37.2026.07.09.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:10:24 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:10:22 +0300
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
Subject: Re: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Message-ID: <v7bvga2bnfqkqjqw2yz3u2jdkm3virvbmk53xpfs5podc7ulcc@m52gmkxxdife>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX5Z2TqeiOtLF+
 JzieV3G/lM/MAq2jxg054aOTR3W9Ct0fdiBMKqJN7M2Ie2ffv31VTmRIhAohSu5kwzyVFw4iGjy
 wtBxbox8BSVbxb14uaFR2yv6DoFBKhmHAKL3ztL+X0WR03Veo1alJZkDUFE02LgBQEdcaTBq7PK
 Ia5u6aheYLJXXW3r3LpHgkB7kAe4YE+CrUvWOf1OHFRXoMqC6eGQEeBbWRg0SXSLPjhEsCwsns7
 IvwWWlZ4gUK6ASB5ohB7oqsC3sRdTJnv+xoAXHu0uAolryHdH0nC6vKkuh90LuTOIFc5Wz1Xa14
 pW3MAGSX/hq265uHLUm0fYfZTIO2wN/loEuNFbV4RUQ2N7dYgdVs2EbYoYdyxvGjRxWhZhDjxT7
 H2i0OczEQb1mOcNYTJ6EaMV8dwisgKGOx9BHC19ERfz54e1vhDkFNmiMGVnFjzgqTymNBvOMNBc
 l+XYNEfGoJLhtDCYQHw==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f9dc2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F3pHQiHvqLgxLLu4WVwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX2MGumIg3oykd
 hgISg9vB1bOaBhFe+f7vEhMHzyf08GcZCs13DTL7C+ehWNsTO0CK74kJUEt8KmkMKqGe/tmF9kN
 h7As5Ge4oC0PNZ40du8+HYuVsGr2Jhw=
X-Proofpoint-ORIG-GUID: O-PlFGMPzyeqkcKYQl0orytgdvfjsxw2
X-Proofpoint-GUID: O-PlFGMPzyeqkcKYQl0orytgdvfjsxw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090128
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
	TAGGED_FROM(0.00)[bounces-67155-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m52gmkxxdife:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: A244A731716

On Thu, Jul 09, 2026 at 06:05:51PM +0530, Vikash Garodia wrote:
> The non-pixel and pixel subnodes move the IOMMU streams away from the
> iris parent device. As a result, the core device may not have an IOMMU
> mapping, and setting its DMA mask is unnecessary.
> Legacy platforms that have not migrated to subnodes still associate the
> streams with the parent device and still need the DMA mask setup. Call
> dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
> core device.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

