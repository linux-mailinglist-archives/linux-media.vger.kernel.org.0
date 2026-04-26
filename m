Return-Path: <linux-media+bounces-59627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC7FAggE7mklqAAAu9opvQ
	(envelope-from <linux-media+bounces-59627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:24:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB00469C90
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E481830031FE
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 12:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75837274FD1;
	Sun, 26 Apr 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBdSkHvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYcNYrws"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0B343D8F
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206275; cv=none; b=jBtdEd1Jh4NcwC1Po2qZUt8r8vdp3T72sb/J2T9fDnqTX58ektjgfscV+da5B1jSF4LcuNF92p2MqFlpC4vQ+j8Z7g5NfPUVuih3iUFKVao8O6Xv4Sc1PAS1kV21YpOr9tVBfXNMH4GS9dyQuvPwPK7c+1Mq3PkfwtQ7Oc4B43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206275; c=relaxed/simple;
	bh=M8+16Tj1x6WZs0f2AbNxWFKqP3GGmOYuJQcsOgQ1kHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajEZg4O6AnmsH9JPFS5URe5FGa7UNA4e3T8eXVZvGFyqngVREkud/foh3hekT1/CUkHigHrqOP6os4ukMf41jAf7441DPVBWOANiy5mAPC1D7+S31XSvLWzvFl7oJrt5NvnsMtMt1G59+pMuseB71l4FterReDTQMT752zq/BVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBdSkHvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYcNYrws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QAvXX0969651
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbAF95i14HhsfSGXuY/tMJx2
	G1OOoMWvPHHUcpNBgbM=; b=UBdSkHvT9cBi2Jo8+qaSxIm3tFuFv4IjHRt4Defp
	J1pcgUKQsRlyAI6J6Y71om7S8eqnhHQVTuFCkx7ptJ7QA27qU7S/VyQUp9UcWtnT
	Y2IgVf4CRsOsO2xc391JW3oeaeZ3NhFzKUZ3gYWSh8cI67CjqLoauKwTlSZzSf18
	2m0BOY5JtPHm6EupG3ecLOWTCkKtN3KB0P/tBimb3QzkU11Zsc3ALX+aPIo4cRcx
	nGQvgRP5s1+nh7TQd8F/p5FV+C+eWZm32aB7u1/uuve1j2Awgs0FBtC1Oh7DGAME
	Tr11On8xNfWYgPnHwc7pgX7y17VyheojbE6BvrM+zyD9QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07jtbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 12:24:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so162849671cf.3
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777206270; x=1777811070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=eYcNYrwspCh0fuhbjGM5byEs1FMSjMtVVMNuYl6Wcg2BsOSkHHlBwM5cyPYc2V7zVE
         xuvjfwz7K2evYX8Aw4QioCVE6fRdj83KVFzdZ5IySUYBpzVK+5IiVQk7qKkRz4L4cFni
         igKCAgDHYF39gCIafEL1fA7LxGo3KE2WBTiXlZpOV6KQKdW6KKI2wWW+LTZnfrXt6Lvk
         wjVtM5j5/xspjttWxvASgiF4gewbv5Wk1RfC1lt2lXJ59z9PipKRC+zZNJn7lsU+Vjzj
         dhStSOsTeZQXXlO8bg2hxSzrHr7oABDuZ7QnaCd8jrsPBlktfQwDFjScJ4diE7jR6xBW
         M6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777206270; x=1777811070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=camK+YiiMBkFRaGre4cFK+FzYQyYZb7/vz3eEh8Q9oRjV9tJb5iBtn/tdCcrbbJ71Y
         Ao4MGKzBePws28V50EFuz1tX4EIprmyH7RXbjkm/Pam5h8e/2xn8ZGw+pNh44OKoHlyR
         8CeXxh9JHnYFiU9EC8MtZLhxMZw89GT01DYJ23JXuuVcYkOeyKL1MD7LMHwKa8Ng2Q4E
         GXmxAtWLwbspbvMsKJ845jxu/cnLk1zXYQBLccAB/GkS3ioe2CZdIEJNdr3bdhaVteFw
         DkxIL3EZHL4XapEepaWGG2L2JpAbjexUvE2aeiNWH94rocHtsbj1JVP24kjnrJTDh6iO
         r9cA==
X-Forwarded-Encrypted: i=1; AFNElJ/2uyxiaxaD6igD7bsAvsYEyjerpbZmSIUxortFNzGsi7i1YCqIhQpahOROOzmVeZTvt7A5j6wzh1/5/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpiuZDASxRxTcY00Fevje4Wv7Fp2dO5kYmhBdJOvLGXu2eDEN
	vYkn/YA9AekIXK81K3+PaI+zsw6Cq0fLqe8SC23EtfQgr32kK/gDkueItLRTYgJdvyntfpAhTFz
	YS80WYp2Dw0gZes3j4xen1vKzD6evMcE56uRWymIfTXhcvi/2w9VfWGzPDiEft8yU0GAqYDs+qX
	gve6o=
X-Gm-Gg: AeBDiesP9UrfPS1L8fl5jOd4sliT+JFF9/8gzlzR8AoZwmWBbsAyI1x+pSzAWdWKgDG
	s19fVhErxlmRoyzB8Z1MVGKohEPnuCP0UpsYyFpHGdlym90L0Pv8bx52HGRTLvyscEiNSZSJrgc
	Npg6Ne8wSqUpD+CiSUsOT6eIrUNRpzvsEn566WBIzrkfjeAJ0dr7DmWIxg4inKUcSH7IbsrVDQc
	ZjhpNtWEGr5erA77hAQ1xU9xEVuVkSTreoiT+k/JrgpxRrsRlnEwsI4Jhlc2GA4X3IE7TKMWmL0
	w7/FF0jzmWfQVYXb3jMANDpBb6KZf5ctsqETQCGxG77hh+7cER5qLxkZ+T/5shbIpuHxos+yLmF
	9TNqHco723pvAzoWYEA3q1OXKgssV5dheYFB6AzeTr1XJgMlnHB12niom91Rx9BCDX82lORs4Zm
	CAb1KTp1rgWSIR90VCusyGnSpmQFFAue7j2GxP9SsMKT5XEg==
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549145141cf.50.1777206270010;
        Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549144771cf.50.1777206269618;
        Sun, 26 Apr 2026 05:24:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm7396347e87.59.2026.04.26.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:24:28 -0700 (PDT)
Date: Sun, 26 Apr 2026 15:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 12/13] media: iris: Add platform data for glymur
Message-ID: <x5kuf3n4z4jn6qxkqshzzwofitz2wsh5ayjlpz24cm5weo4nqg@smtwh755sc3z>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ee03fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=54w5cVOzKzMHq45Zt3UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: izAmGZp7tKz4FbbcBMdAMbMsxo9eD76d
X-Proofpoint-GUID: izAmGZp7tKz4FbbcBMdAMbMsxo9eD76d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEzNCBTYWx0ZWRfX/WDR8JH3NmIu
 G5eLvxozTBsofH1WPxC+I6fmJs0ttj6NlZpVV80218HKL+QZVzZ8AWe5WJcWyDL5fT7c+RLM+g3
 /2ftQh2f46UWl5XRnDfu1bUAiWXs5piuc27zc21I3B8I0a17m/0nhhUzIniSuTIkca68C+utv6i
 LEKivRRpNNy0Ox5WscpG+mmNCv2y68+UXdJalIzzS2dq+hV8F3QcGXzngFeKQnZMNCiXqZ4/qsz
 L8OL3n6dON6rzABgTRyV8ZTXiFImXHMBiQGXVYKD3vZaMlAGNCti6e66sqUtW8d3BvRTDRVrmnQ
 FMJFbNjpKFGQGaTdFc+gXqg4MoJyKcuZcdq5GObdsoM8ue2hMzgtXJiksaBEGqjnE5O18kGXmgn
 kcHZm/2sBvogp9v7vP3xgaDYvfPNyoDv4N9sRto6a1+C6FY2Tr/M5XX2/NK0+Ao97A3Nyvckm0+
 UY42Lqm1IZvmWupeHvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260134
X-Rspamd-Queue-Id: AEB00469C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59627-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 23, 2026 at 06:59:41PM +0530, Vishnu Reddy wrote:
> Add glymur platform data by reusing most of the SM8550 definitions.
> Move configuration that differs in a per-SoC platform specific data.

As a continuation to the previous patch. Compare your commit message to:

On the Glymur platform Iris core shares most of the properties with the
Iris core on the SM8550 platform. The major differences come from Glymur
using two cores, wile SM8550 had only one codec core inside Iris.  Add
glymur-specific platform data, reusing SM8550 definitions where it makes
sense.

Even for such small change it is much easier to first describe why you
are going to perform your changes in a certain way.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

-- 
With best wishes
Dmitry

