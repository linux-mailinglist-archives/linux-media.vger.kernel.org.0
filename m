Return-Path: <linux-media+bounces-61652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEjkKwL5BmpoqAIAu9opvQ
	(envelope-from <linux-media+bounces-61652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:44:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783854D97B
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D46BD31BF51E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74153D25BD;
	Fri, 15 May 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl4Jxtr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj9i8G4i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB83CEB9C
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840697; cv=none; b=PAcM18H+Mt2eqD8wkRRMuUUam6N3GotxW0NIJLlSSHGIevJLkayEOTi1NfrBKy/1UNKSOFyAvcApYKPyxMt9/bnLFtUgxjPSFu9FW0VRjHFgRFRrvlV/UYxKPQvVgdkq0sZpV4AKr+SnZ2bgogOw5qNnF9E0208+g477rSLe7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840697; c=relaxed/simple;
	bh=mvPinM/tJfxm+rmtDR2dA6pZP2MRjfXid39J0izyZb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoA/E/V1SB7TwYz/CLDp0xaf6yArTxC9zn/w7/vP9t6rHKhXdLTfPPkWZe86W9PrNEzYkitXSrn0WDCbt165yf6Dr2ygmtB0xOjj3381tT+0YrEqCTjXBt5tALZHllwWClwqCt7EyFgIC831IXmLbCeZCMx65fuheuEK1hY/0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl4Jxtr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj9i8G4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F92nET1716815
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpt5WSbFp/AI9TGMZc5Fn3Wa
	uUNLzeYaoqSqN1ldUj0=; b=Gl4Jxtr6THbDhk0GkwCs/cA1T6ZBL/U0XFNZU/59
	GiQoq46MVjWHu3oqE/QeIXTwCBDJ1X9XlYgj87MtlGPCKJ3KqaCTx99E5URHvxRl
	v5bXBil1TomMyFxqKYNfsRnkS+6PiVk8ynN1mWnlEPDO/XpZkUA0e8p7803qA9Y6
	HBVIAvXgJY0KJcIG8089YndMFoIDrJcTKwWhKaum1LwG5Sm/dxU/WNLLs4hPaByf
	CO0E9rbuqN7dWcsRZCwCvGItOqYdzFIWzCF0uofaeGIdzk1DLqedqrm4aX2UCUkF
	P59Mx9owC63TMiJYOjhvFNIOMKwhI2/FNVMSx1SUPyyKhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxskyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:24:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso181341671cf.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840694; x=1779445494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=Nj9i8G4i9oor+fFw9GIZ+N7cv7UKySrQwM7aNRWctfNNkdTULmP9T6TZdC/eynkcEX
         cFLX1gus94MakHHN6F30C59aqhdnhD3dFwSlvEl9nf5cVFx29ioXGLxVZjOijNlET+AC
         qf2Vyrey09HzR4iJDQp7ou9R0ZMwSsVOzVOYJwocMHf7BDGebKYGyW7QY3BWXWq5ScKy
         HWoZiaZXdb7q9ye1/WFcqfijPbOgTr9H5d17iAm94qOk4DmU45OdzY7E0LYmvi9AG3Vm
         8ZK/HsfkkLGKiKrY61ND35VjJRW/bwlHOz14gFgJIZ+DhIVAb2aKY2sooni0Tep4XkkT
         xe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840694; x=1779445494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=Ti8NIZt0r8IOZ+5z2CmfkDEtu9SHIGXWjQCtXjKoJLhqG3RuI1op8V8VRWG2BhXiJc
         eqXg+X4E8/Wfr76Ja96hNOclrbpr1LXVP7Y28CK8uFtLJuuiqOACRAUiKfE+dXBMrskt
         Smb98OBuqwXH1WNZSDLZOEJctwtx98e0XFp88vn1xVhDIWH1PyUOsYU4+v8v5p/AxlYo
         lZRytX+ucDqKEVJ3nYl1R98HDWK/RnLPH0a0bOwF8QuNsYBJr5zPUCEAT6B2MIDDXk08
         9IrTs8phYhW1EIpYqVdnkKKJeRHT1HZPKgoQU5cMIxlmiwHWMyZ9LxW/LzTc33J8vCN7
         UgbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QGD4T4Iz2i6J6N/n0Sgxcdqk0K10xPdSJ/R+KiG4P8d7E8TH+EVL4pkNRmxxSMDTmJlPgp+BvnA9T9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCklJ7ikdSX1sBWaXH3Ma22E80kG6Y293g3mgp2L8k8XGMm5l9
	LebdaGm8aBoTEhlXhmCKSljMOk4hHjMtSH8r7P3zbjTsrNOi/9Rc7rZNHaMQxOwfK4jrWme+1p5
	5g+9Iog3Ae+AMf2wpKRN1QjcCbOD13uz3FYqgcEZxy8YG+78vT4zr7oUEDzRXDjjbWA==
X-Gm-Gg: Acq92OGh3A3USPyB7WJGWUulj4XkBdvpZY7JbX7SMvbANJk+pJyennQEA0OjiW12MrR
	24p+WYo0xJxdZ2hFXVvIS3HnQnakvlI8+Bis9R2/DBVEjpQ1nLBae5IXFcllIJFOMy2NkmkriUP
	eZs/YU4pRfKNtKBo53OM7IDZ3Qaa8EpmN3X6zDzjvsgBf8kJiwpbaC4pVRwKjrYwOt0A5TGkGmv
	fvGSjlXVwQliezfl/wHtwtVsjXBuTC8BSDwxWgq2uF4T//shd9PoFR/dbMfvWUE6KPygm/Hh24+
	gtfoJdUZM00TUuw0a/x5wbHruRgNfl+vEIrVp7c8tIb4Cl6A1lO2naFARtDK09y2ggvQS/iOJAJ
	2xlZqUn8drHSGbIiFLEmn4QFXK3Tl2rMRYbxsRf+uhDR02Mr/5tKPK9zNpl9NC5NcAS2y4EcLxq
	gzxMOeg9mXBbkqO6FrUNQ6qjl1wVfDwg++tKE=
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185831cf.3.1778840694140;
        Fri, 15 May 2026 03:24:54 -0700 (PDT)
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185541cf.3.1778840693695;
        Fri, 15 May 2026 03:24:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8dc7afsm14585621fa.14.2026.05.15.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:24:52 -0700 (PDT)
Date: Fri, 15 May 2026 13:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <biphbzvvy55qz6rnqpw77taxczeuitmkrodepyfosnoxafvsxb@swme7xerynlz>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
 <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a06f477 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JLCR6Gb03Lu4_UV5QcsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: axZ_UVRzqXuawBLEFSaPlioMf1cR_Ynm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfXyVNt8JziSTp3
 5dcxS38XnRmXPIbLQ+eCKZpFk+5untx+oUorDMfQaDHglLcOR6DcW/RV8UZGmwExUvA/yTQEDAj
 oaI3CGrB8DKCRXjb13YYIZ3qIsVGL4WHpbEejRO6zkyb7HYBr1Eg+YWbjRt3hPYUq5yyYES6kBd
 U7AROBp3BOpWBxq1djkeL8otbFSL3Px4vxPQ+JRXcvZT1iqwjPkIcv+eHsjugK0E1wzI/HzPX3X
 3MaUOim32KzmKzV1W1sDbyBt5qgjH4RySWRouANAZ7eNlUPtnxljPWudGUr1I3qajWNYEzgkEd5
 OXpRIQOFnAVgDmp2oME2sqRb+y74D1p+122wkH5X7RAVTVLqh1GaWr2a6vxQbYzhW7zNYvBXiCm
 oJHd7413s4lJGMjqXd1hfFCSGPPOz4n6M3Z7KopvAW8or0CFhHcLaj3OGlbFcZvl2WuYTMFh9EQ
 9r5ygO62E9DdoR/9D2A==
X-Proofpoint-GUID: axZ_UVRzqXuawBLEFSaPlioMf1cR_Ynm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
X-Rspamd-Queue-Id: 5783854D97B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61652-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:15:39AM +0200, Konrad Dybcio wrote:
> On 5/13/26 3:47 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> >>
> >> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >>>> The current clock and power domain enum names are too generic. Rename
> >>>> them with a vcodec prefix to make the names more meaningful and to easily
> >>>> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>>>
> >>>> No functional changes intended.
> >>>>
> >>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> ---
> 
> [...]
> 
> >>>>  	IRIS_CTRL_FREERUN_CLK,
> >>>> -	IRIS_HW_FREERUN_CLK,
> >>>> +	IRIS_VCODEC_FREERUN_CLK,
> >>> Can we at least group them too?
> >>>
> >>>>  	IRIS_BSE_HW_CLK,
> >>> Is BSE a core or a codec clock?
> > 
> > Unanswered
> 
> Is it the same BSE that requires a new clock on Purwa?
> 
> https://lore.kernel.org/linux-arm-msm/20260507-enable_iris_on_purwa-v6-2-48da505e23bf@oss.qualcomm.com/

Yes. But not that BSE question is simply an attempt to find a better
approach for naming the clocks.

-- 
With best wishes
Dmitry

