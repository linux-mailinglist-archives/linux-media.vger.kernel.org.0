Return-Path: <linux-media+bounces-66991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xQyuFAhRTmqNKgIAu9opvQ
	(envelope-from <linux-media+bounces-66991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:30:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B93726CE6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:30:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a0y8Jf6S;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kj1kKOa9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66991-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66991-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D191301BC2C
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3E533E351;
	Wed,  8 Jul 2026 13:26:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E930C16B
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 13:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517169; cv=none; b=je0ZAWShFS/Ozf9XuST8o2I27xIoUxlAVAAElKOAPwn9M6s9bJHvHK0zWQIeXBbtYaFu2N4usm/ee2rIdRYpPAUITZOPtg0Fl7N4fE2RYIeaTxuoGiuviFqnfJVhxjl1+vX9Mwnxhwm3tFvQy5tCBRWJkiZHDMBl+xHgaI8RRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517169; c=relaxed/simple;
	bh=o9uqGovHhrlEqeaZdyL2OR0Evb+CE8u/OGNRBj0uDGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTHbmeJyXDYQAmKTrdg+lAcDHKnbFGt2OcAOvC6c4FLwoR/oGGytoHTV5h2Gx8WXMeDPjtZguB7+rX/iZGHnJb/vC71Tu8BKyW00MCu+TSNJw1plG2oPGYFzUOJNolMIv6PqQ4IDKoZ1N1frtvQ5DkD6HQbqds/Ua3lz7IavMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0y8Jf6S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj1kKOa9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3h2x2727692
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 13:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lmMP11JfIfdzuQv/xaCabcqR
	nVyTBMSAMXAc7fCTQk0=; b=a0y8Jf6StwKpJloQFA2jZmBUsRCnIFjkZzYeEdxl
	fmh7UuQ/Co/q7qxl+1oSXqWFPwxWJg1Rc98o+uD+rjUPBX8iIawNT/d2yO+0poyM
	7LTgGL8C1y3hSS2761QVPuoVlrYbhvzyxupfz1xgQB8heLWSKMKOHkARdHn5xPoO
	x/irooOxTaEXquZFnYLN2FzOGVaY6SxtAkHNeGWF0Ah046UqwjE7JEuSJEO5POaO
	jxMR5alTnOq/8fWbTJQsU/EgQmPu0ptGiFnM0ceOSkYzwi2GlQD+Dv48fs8CxSdV
	Hal9K8ueUwOHGHkyyogDctbNR+NUqm+egTjDwZc8K6g8hA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6aarvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 13:26:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737bcdb48d2so201288137.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517166; x=1784121966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmMP11JfIfdzuQv/xaCabcqRnVyTBMSAMXAc7fCTQk0=;
        b=kj1kKOa9dF2NYRS8WQWx6dnbH68w3GvRMKGAkRJ15exSCJ2qNIK1KDRMj5PF489vxi
         ipUns0ZDqffDfSJXJZAi/RKymmIKZ7CVEI6bQ3ZxbmI1nEOY3701zTgg9hHl3vxM1UEP
         jBRDgcVNVMi5pA5sIUvE36Uy98VeMMbeQXi8lzu7/Z5wtnbQOf7kFrT0SkahsPlhrdC7
         u2HAnssqpOz7JV130doFSS/3yAlWLWYPmjeYrc5nV6F+8eh7NsRiMRFOd9Iqn1pBmTxD
         zb3bI60AzwlKmOgROFznL0x/oD56X/uMiNAck22K4eS16a+TXdbbpmvwsQdC6F/q94nW
         nO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517166; x=1784121966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmMP11JfIfdzuQv/xaCabcqRnVyTBMSAMXAc7fCTQk0=;
        b=OyvlhP/rwJt00EBukK6OBB+XGaDBOeVI1k7lD/RS7XRsqOV4WNKufZoK2Ayo60iP1P
         bP8jBs1OrjYlZn5JTntG78D8ph19pgBpVk8TEQog0wOCKQhy1jgdXRBb7EDKxEKNxOjp
         +Mcg071njVH/wL6OSnFtUEz1/iVeB5AEn8US7K9DtGcx5UGxacfybwHKOSB365chX8CX
         pg2tivPmckNq7H0ADmmAHkq8t7uPXMWpSpRh90EcceBMDsdw87aH++KeRl3j3tbMNnA7
         p+xLvtdAziHt+W3Tu20J0K/oJYnmrEFS7vBdsLrzxOtXBLT/nJgV7m3Hpzx3ikSnzFVe
         sYmw==
X-Forwarded-Encrypted: i=1; AHgh+RqTgvEiD71PjUZhQCY0eV+eui/VW8YysMFlK0125Ps33BoTNSucJNe4pSrWzYa8MHPySzMmzAmGA/RPQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqkRBvhKxEcsQlynT3j+w4XBWpzIqF4XCTN4MK5QJ5gwsVQxZ/
	M7Yl9hQZPg3vmzW+MsSawJeI/9m/wP+uOlRtkgbY0pWs3Lg721IGonxUCfjF52WkdyxYnl6XQlh
	Qz9bExZaKj8lpbHqh2bPiLcB6pv4uMLsskk9l0oa5gEcTgyol6sgS7YuzzOX7Fz056A==
X-Gm-Gg: AfdE7ckblYMtu0Px0MHDMmOHp6Cf/n/TMiiZjoOJ9v2Vpw38mLdPwiCqDxmrhSKzaDR
	7WLVkNLCq86JVyuhbsf4EZkRhz9QLBwp9p2VSE9DeAka8DmWnhTTBszRoZDi1YThd1DjcSyZDHP
	vdKIetzBpNHNB31PLnfP+NdxMyP4TsciGTlTnOBxxzm0BE37mlEn/DK7yf31GXH2v47yN1pDWhF
	cO0IH1XeEoh2SlEJVQO52ZQ33gRDqMubH/5yGCgPAcHImGTn899ussuSKCkx40HkqLvAzzkZwYK
	PLmssnROuNRt7baeMWaO79ib7/AusQZlvlUrP35zLrpo7BxRLPAhByEilC+5uv4Y737HiUjm0Ag
	Aqu9Htf7FljMLzY7pLHmgX+1PRfUHv1LYg2XKkwvQV9eyW+MuP4FjEcebztle5hCaXWXM8Hlhfb
	mSITbCEL2nG50+LTYiJZBc2NCo
X-Received: by 2002:a05:6102:370e:b0:737:d2e8:d640 with SMTP id ada2fe7eead31-744dfed04c3mr1144593137.5.1783517165866;
        Wed, 08 Jul 2026 06:26:05 -0700 (PDT)
X-Received: by 2002:a05:6102:370e:b0:737:d2e8:d640 with SMTP id ada2fe7eead31-744dfed04c3mr1144572137.5.1783517165338;
        Wed, 08 Jul 2026 06:26:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c1c4dsm4460901e87.66.2026.07.08.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:26:04 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:26:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: guard sequence change packet size
Message-ID: <5uu5k62pcweeomqnvna6b5rpfhfm3vcllhhkhkxk7bujj5av4u@yr76dhhmcbqq>
References: <20260708112333.751480-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708112333.751480-1-lgs201920130244@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMSBTYWx0ZWRfX7Dk9PSGG7j4a
 d8l+HJaI2YB7cZs24ZCNMOEYPRHQ5YL1uvFR7GYzbSXBVp5CJkaiHs80o40TQiOByma6VrHmc24
 b6Ekw7HC8ZnUNDzdpQYg35Anqr9/+9TijkwWrzvKzeMBgdESbbbUoFR+iOZqLzSqIQfi6eZyeZY
 kErXSbGYXTWFglTNi59rk0hg3Vi/51yJbADn47rzdKC3z0wEpSaIgPHCN4E8cvG9a8NfO6iT/kU
 0sImua/ByNeqLJEMawQx+j5qrWeBYAWqJ1c/+xGUr16NIWJFkM5swngEasQZUQvsXiCIat7jz8z
 zczQqdxtN4KUKceGjM+lA7MKHn6ht6+83Ph/PvzoQw8aH8Aj0BGsmQD7ervw1gX9Nm1tJkReAnE
 1Hut7QCY2Z66dAmPEDTwQws6nkeAjhCQWF6U1MAxSPtZjWDuXwmvUXwJD4h0EIcCxbNQ5NPGnKj
 ntBDCvmy8SZ57RZTcdQ==
X-Proofpoint-ORIG-GUID: xflmkNvM3aGbIk8-WpwTrGtfEL58qju6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMSBTYWx0ZWRfXxe5JB6KxRrlk
 4t2r+O/9TE8btr7adPGOFRwIMgK6c2jWR4MAJ6U0BavAK/R2yankZozsLcMmDiEobvVo+j1ulWh
 L/7UfzFBLvq3PLU231IoyZo+xPmh4OM=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e4fee cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=RkvSwIbE1DNZAbE4hAwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: xflmkNvM3aGbIk8-WpwTrGtfEL58qju6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66991-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgs201920130244@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_vnagar@quicinc.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97B93726CE6

On Wed, Jul 08, 2026 at 07:23:32PM +0800, Guangshuo Li wrote:
> The change referenced by the Fixes tag added remaining-byte checks while
> parsing sequence-change event properties.
> 
> However, rem_bytes is initialized by subtracting the fixed event packet
> header size from the firmware-provided packet size. If the packet size is
> smaller than the fixed header, the unsigned subtraction underflows and
> rem_bytes becomes a large value. The per-property bounds checks then no
> longer protect the parser from walking past the received packet buffer.
> 
> Reject undersized sequence-change event packets before computing
> rem_bytes.
> 
> Fixes: 06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

