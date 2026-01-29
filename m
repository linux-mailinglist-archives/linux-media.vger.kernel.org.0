Return-Path: <linux-media+bounces-51783-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNFkO4xve2mMEgIAu9opvQ
	(envelope-from <linux-media+bounces-51783-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 15:32:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9485DB0F9D
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 15:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04200300612F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 14:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A013428688E;
	Thu, 29 Jan 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGlwRPKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igPU8t/+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2257A2528FD
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697158; cv=none; b=Db880IdA/eaTR0SJzU/v+hubU7lYEBMXJe15+LZnNup0xgN9s82rkAkScOsnPrZT64lGDq3klwZ1zj5qIUvzaV16pBDlybK2+iZ5BjP0cx+J144b254j/xhZLaLTpyUk0Ne7wEZPJcEGnC8nTxKND7UDmXiqt0ILSS+VFwZcB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697158; c=relaxed/simple;
	bh=QcCFpSrQxC2+hCfGGBoubJeFLr6JppgZjy63w38hP+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZqVrBW9SVwJnOjTUAvbDWJ5rTQRXGkxI5Eg5Bc4xNF3kIV/udoyr9layRyNaoEidJO3LhhwO0RMbLnCqoN4x4HC1c273GW+woB2T2K6+HSFOIwH35PgDGjj5hab2nU1MWrhXHgjQFJW0w43W+5TAMGr7uoR98BXPailH6VSn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGlwRPKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igPU8t/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAB06U2033390
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 14:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IhJHHUv/gD43tiXPoXmVcP63
	bLvok/PXpDDKQR4l0yc=; b=GGlwRPKrnpYMl8EzNKbmVeoXKQDF8FJQRWHn9XIA
	y2Gw3lR34b/6pXadEiar6GtaKq6UI+Oh/IdUu04GQXuF230MrldoeOE++crT4O/s
	tU1hrCXyFt7b7iWsa2aeavJjWXYgy++y4n9EDw4V83bgBVzuZEent2wcC5txLoS/
	pNO3ILL6eYmyvq59IFMPFVaCDwEmti9zp8IxksWoZXwPuMjOCt01XRai8bRSFuZG
	DVJBgfcbHli9fprH/HAzROSwrK0HwoBSdI/4ALJePQXK2XTt2YD3SD+GB7/R3UIx
	V/3TL943TvF2dy8ETaoP0/3AT0c7YzQdNl1drYDKH4Q76w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byna7kxw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 14:32:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94125ded3dbso3613812241.2
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769697154; x=1770301954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IhJHHUv/gD43tiXPoXmVcP63bLvok/PXpDDKQR4l0yc=;
        b=igPU8t/+i4TNrQDob3h59ZubHt/7T3EkszLQVBOprIxOy3SV1sB0C36k2InMrxPoIX
         c4RzQJr6BAObWDdsSt/eRv2DCOCR2Dt0oEhegbQ+hnpmfFXBqe2tQcidLhlEnacTu6FS
         4sJVkG+vCg7oRqbDKiZAdyjBuukGvaDtEr4F9Wn4btiGkEeEx9YRwfUTsX0tpZUg1lf7
         2NUTlwHZCEPQSExUiJrhukLg5/AQRzwnq4K4B1sQT3TsQ8Dz6ljGh0j3F2tySOJq9lbE
         UDCLf7TguEKiSbV1IcHwurY46T/5zomjJj8quRrtMaVR3ID3LDDlwe11KBpfMqLP2qs/
         UQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769697154; x=1770301954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhJHHUv/gD43tiXPoXmVcP63bLvok/PXpDDKQR4l0yc=;
        b=AML2m3hgJLj4JXbS8xBnKM0wvk/G7+ykF0S0FjdBc36Hk45jSlvZPkPnTXKWgRSPzl
         TCLTpGJnV+7VKgqHYKx/SyHRTZqbg6MLmIcDgTfCVcHh/j3/AFBgzB6M2Gdg7kQwvtR2
         3IKyLuvn3zOT0INT0ed6tTXH5073S9B+WmJTqyWgBi9V7Pox+3Qo6FCIpV1+eLSana+0
         4GW6nY+dAydouWfCwqzjemEGCXKa7RpRo4+k8UPSoiLirqCPmhFU6Z2zd4tt4PqkS/5h
         0rFSWGLg0GgQnmFWFLhgR+NGYhtAWIPoh+eSr9iC7g+DC5QXmJkbng1h2nv52aygRw3x
         jhLg==
X-Forwarded-Encrypted: i=1; AJvYcCUkWLiRkV8Rk0AqnfBbhrQ75X8vPveScaxFDsFRpXm8KiU9rCK+TmNG2fJeyu+jxrebn+Q6nNB/G3oQzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwiZ7wyZTQx17eF7bDYM8HjQ7JigM8eYyWDV4Li4J7EwxFsIR
	oOHzHf/MBcuAF2b0nj03Yt2xTtf7pbbwHTSaOaUjIakhFmr131WV0cZns4nVzvs6v8hn11hHsHx
	zGcjXZAAkpOc9YlKJRPkBOd/v7ldHo2uJV9oHNkJQE7ob/4rzEjV+wyJtoTuH5I3W+Q==
X-Gm-Gg: AZuq6aJU1ckYFUcUfNawTdod0xGOASQI+Zdx4l9dEDlX0m/92hIJpQm04ej+9B4vEm0
	Xi3KU6r1GAFFIvFul757TnR75CLIHV4Y5shNmI/wZfnQ2gJ9jnjYZM4okkAdNu0gU9w1rn6CCBT
	E0/tXFn7xobOmJ28iP8e+/3SBYOrf8u9S+AXpFSmbweNXi3D0ih3pPSytVKSbXCvXneP9+OceIA
	RrorfG8x0y81DuBADW/svHe5QB3kBqGkDAgpsL1JfDUJnVJEIWUUioCvMdLBAISljGUNzL16Y+7
	8vQXKezaESPY490lAdffAkrmlYmasv3q1F3kebks/uLNl2Lx+oDM050QIu50tazXjYNX4fxl9lS
	Q+2ozAVRiRXSSiZUqUbffsW5ibD9DgvzzjJkZjLzKvfGoyAlYYgulqEtg0V19Gya0sOTj1lF4RM
	Twqj8LEPO7IGQ7RcN9e8jJGbw=
X-Received: by 2002:a05:6102:b10:b0:5ee:f115:bbb6 with SMTP id ada2fe7eead31-5f723890961mr3319308137.24.1769697153361;
        Thu, 29 Jan 2026 06:32:33 -0800 (PST)
X-Received: by 2002:a05:6102:b10:b0:5ee:f115:bbb6 with SMTP id ada2fe7eead31-5f723890961mr3319283137.24.1769697152711;
        Thu, 29 Jan 2026 06:32:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0a491039sm890278e87.66.2026.01.29.06.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:32:30 -0800 (PST)
Date: Thu, 29 Jan 2026 16:32:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <i37aqxqtb4dovx3lpjm3xmkbcwlpiyfe7blzz4kirme7tegbb5@hgztyetld6lf>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
 <xyhl36bcpmjhav73ujlvbtwqixngr5vko75t335mlcebxrs7lc@t43mxhknuqtj>
 <5df59084-d19b-414e-a43d-8c5d26cb07e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5df59084-d19b-414e-a43d-8c5d26cb07e9@oss.qualcomm.com>
X-Proofpoint-GUID: zdQica3VXIhtmTKo7xG4u0thjZrDtj-v
X-Authority-Analysis: v=2.4 cv=J72nLQnS c=1 sm=1 tr=0 ts=697b6f82 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UOdPSrI3100sDzHww24A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: zdQica3VXIhtmTKo7xG4u0thjZrDtj-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5OSBTYWx0ZWRfX4UvZLVl9Idan
 Qgv9Ur0/JAYKAHMtBVo0hpPr2LZ/LBa4DB73OhyFipdCL7JG4Spg1henNVcR4LaURCedZEN6FJW
 udNtGd7hq7VZuvp4yr4LEsaTrHyM9VTWKQQODYM1HFoRfgPCDN6kfV7uKz5y6Rcuu1JY4+FKsV9
 aDgdI24PMI77bJkEbAD2gi6xI/vZt1Akn9yw9egoHJp8mkdYrMv36D2aa9Eh0B9JV3tZPbCOW8b
 pVobLf5PeweGUqwlHykDazwCoicKFlhDKQfFA9oFn/DgZ7hgGwltff02xoyn0XzuDzY9Bm4/UAT
 Rh3fuRnm+/Ytm/nWAHT+M3uP7ulyTJU873MjAHUiUbebJi89W8fPTbB7U3DB/SyiIIp3PZ1uLBR
 5ZyrzSeDPVrJrIAOrRl2+CZJAvaEoDxJXkiGy6ss5iEWak1F+bTkg4swrTWFd7ogmiZBpZ/616S
 WrTaTQIsdgRIcuyAgyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51783-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9485DB0F9D
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 03:32:28PM +0530, Vikash Garodia wrote:
> 
> On 1/29/2026 5:51 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 28, 2026 at 06:35:01PM +0530, Vikash Garodia wrote:
> > > 
> > > On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
> > > > As the Venus and Iris drivers are close to the "feature parity" for the
> > > > common platforms (SC7280, SM8250), in order to get more attention to
> > > > squashing bugs from the Iris driver, flip the switch and default to the
> > > > Iris driver if both are enabled. The Iris driver has several
> > > > regressions, but hopefully they can be fixed through the development
> > > > cycle by the respective team. Also it is better to fail the test than
> > > > crash the device (which Venus driver does a lot).
> > > > 
> > > > Note: then intention is to land this in 6.21, which might let us to
> > > > drop those platforms from the Venus driver in 6.22+.
> > > > 
> > > > Testing methodology: fluster test-suite, single-threaded mode, SM8250
> > > > device (RB5).
> > > 
> > > Could you run fluster on SC7280 as well ? Also please share the v4l2
> > > compliance results.
> > 
> > Okay, the SC7280 is a bit more interesting. For H.264 and VP9 the
> > results are the same. For H.265 Iris errors out for all tests except for
> > the one, WPP_E_ericsson_MAIN_2.
> > 
> > The kernel prints the following message:
> > 
> > [   82.573112] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:52ef2000
> > 
> 
> 0x1009 corresponds to HFI_ERR_SESSION_INSUFFICIENT_RESOURCES
> 
> Below patch would enable firmware logs and make it print in kernel logs, you
> can apply and share to know more about insufficient resource error.

Added it. BTW: would it make sense to land it in some way (I saw that
earlier you posted the same one for gen2). Would it make sense to land
it in some way upstram?

Anyway:

$ gst-launch-1.0 --no-fault filesrc location=/home/debian/fluster/fluster/../resources/JCT-VC-HEVC_V1/AMP_A_Samsung_7/AMP_A_Samsung_7.bin ! parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink -m
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Got message #19 from element "videocodectestsink0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #20 from element "capsfilter1" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #21 from element "videoconvert0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #22 from element "capsfilter0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #23 from element "v4l2h265dec0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #24 from element "typefind" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #25 from element "parsebin0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #26 from element "filesrc0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #27 from element "pipeline0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)paused;
Got message #29 from element "capsfilter1" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #30 from element "videoconvert0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #31 from element "capsfilter0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #32 from element "v4l2h265dec0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #35 from pad "typefind:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(GstTypeFindElement\)\ typefind", object=(GstTask)"\(GstTask\)\ typefind:sink";
Got message #36 from element "typefind" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #37 from element "parsebin0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #38 from element "filesrc0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #39 from pad "typefind:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(GstTypeFindElement\)\ typefind", object=(GstTask)"\(GstTask\)\ typefind:sink";
Got message #51 from element "h265parse0" (state-changed): GstMessageStateChanged, old-state=(GstState)null, new-state=(GstState)ready, pending-state=(GstState)void-pending;
Got message #67 from pad "h265parse0:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(GstH265Parse\)\ h265parse0", object=(GstTask)"\(GstTask\)\ task1";
Got message #68 from element "h265parse0" (state-changed): GstMessageStateChanged, old-state=(GstState)ready, new-state=(GstState)paused, pending-state=(GstState)void-pending;
Got message #69 from pad "h265parse0:sink" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(GstH265Parse\)\ h265parse0", object=(GstTask)"\(GstTask\)\ h265parse0:sink";
Got message #74 from element "parsebin0" (stream-collection): GstMessageStreamCollection, collection=(GstStreamCollection)"\(GstStreamCollection\)\ unparented";
Got message #70 from element "pipeline0" (stream-start): GstMessageStreamStart, group-id=(uint)2;
Got message #83 from pad "v4l2h265dec0:src" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)create, owner=(GstElement)"\(v4l2h265dec\)\ v4l2h265dec0", object=(GstTask)"\(GstTask\)\ task2";
ERROR: from element /GstPipeline:pipeline0/GstParseBin:parsebin0/GstH265Parse:h265parse0: Internal data stream error.
Additional debug info:
../libs/gst/base/gstbaseparse.c(3703): gst_base_parse_loop (): /GstPipeline:pipeline0/GstParseBin:parsebin0/GstH265Parse:h265parse0:
streaming stopped, reason error (-5)
ERROR: pipeline doesn't want to preroll.
Got message #85 from pad "v4l2h265dec0:src" (stream-status): GstMessageStreamStatus, type=(GstStreamStatusType)enter, owner=(GstElement)"\(v4l2h265dec\)\ v4l2h265dec0", object=(GstTask)"\(GstTask\)\ v4l2h265dec0:src";
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0: Could not read from resource.
Additional debug info:
../sys/v4l2/gstv4l2object.c(6253): gst_v4l2_object_poll (): /GstPipeline:pipeline0/v4l2h265dec:v4l2h265dec0:
poll error 1: Success (0)
ERROR: pipeline doesn't want to preroll.
Freeing pipeline ...




[   67.435274] qcom-iris aa00000.video-codec: 
[   67.435274] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SYS_PC_PREP
[   67.446528] qcom-iris aa00000.video-codec: 
[   67.446528] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SYS_SET_PROPERTY
[   67.629798] qcom-iris aa00000.video-codec: 
[   67.629798] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SYS_SESSION_INIT
[   67.641590] qcom-iris aa00000.video-codec: 
[   67.641590] <VFW_L:HostDr:unkn:--------:-> used byte before CreateSession 0xd77c
[   67.653538] qcom-iris aa00000.video-codec: 
[   67.653538] <VFW_P:HostDr:unkn:--------:-> Session 0 start 6efb871.
[   67.664964] qcom-iris aa00000.video-codec: 
[   67.664964] <VFW_H:HostDr:unkn:--------:-> HostDriver: HEVC Decoder Session Created
[   67.677381] qcom-iris aa00000.video-codec: 
[   67.677381] <VFW_L:HostDr:unkn:--------:-> Unknown Host msg 0x20006
[   67.688191] qcom-iris aa00000.video-codec: 
[   67.688191] <VFW_L:HostDr:unkn:--------:-> used byte after CreateSession 0x2821c
[   67.700213] qcom-iris aa00000.video-codec: 
[   67.700213] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.712232] qcom-iris aa00000.video-codec: 
[   67.712232] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x2002 received
[   67.724825] qcom-iris aa00000.video-codec: 
[   67.724825] <VFW_L:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE: 1
[   67.737551] qcom-iris aa00000.video-codec: 
[   67.737551] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.749590] qcom-iris aa00000.video-codec: 
[   67.749590] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1003 received
[   67.762131] qcom-iris aa00000.video-codec: 
[   67.762131] <VFW_H:HostDr:265d:6eea4000:00000000> Uncompressed Format bufType:2 fmt:8002
[   67.774789] qcom-iris aa00000.video-codec: 
[   67.774789] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.786831] qcom-iris aa00000.video-codec: 
[   67.786831] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1003 received
[   67.799382] qcom-iris aa00000.video-codec: 
[   67.799382] <VFW_H:HostDr:265d:6eea4000:00000000> Uncompressed Format bufType:3 fmt:2
[   67.811746] qcom-iris aa00000.video-codec: 
[   67.811746] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.823760] qcom-iris aa00000.video-codec: 
[   67.823760] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x201002 received
[   67.836507] qcom-iris aa00000.video-codec: 
[   67.836507] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.848512] qcom-iris aa00000.video-codec: 
[   67.848512] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x201001 received
[   67.861252] qcom-iris aa00000.video-codec: 
[   67.861252] <VFW_L:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL type:1, min:32, act:32
[   67.875954] qcom-iris aa00000.video-codec: 
[   67.875954] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.887981] qcom-iris aa00000.video-codec: 
[   67.887981] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x201001 received
[   67.900734] qcom-iris aa00000.video-codec: 
[   67.900734] <VFW_L:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL type:2, min:32, act:32
[   67.915434] qcom-iris aa00000.video-codec: 
[   67.915434] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.927439] qcom-iris aa00000.video-codec: 
[   67.927439] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x201001 received
[   67.940189] qcom-iris aa00000.video-codec: 
[   67.940189] <VFW_L:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL type:3, min:4, act:4
[   67.954713] qcom-iris aa00000.video-codec: 
[   67.954713] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.966721] qcom-iris aa00000.video-codec: 
[   67.966721] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1003001 received
[   67.979579] qcom-iris aa00000.video-codec: 
[   67.979579] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   67.991582] qcom-iris aa00000.video-codec: 
[   67.991582] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1003001 received
[   68.004412] qcom-iris aa00000.video-codec: 
[   68.004412] <VFW_H:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM DS Enable Width2 0 Height2 0
[   68.019492] qcom-iris aa00000.video-codec: 
[   68.019492] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.031497] qcom-iris aa00000.video-codec: 
[   68.031497] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1001 received
[   68.044056] qcom-iris aa00000.video-codec: 
[   68.044056] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.056063] qcom-iris aa00000.video-codec: 
[   68.056063] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1001 received
[   68.068622] qcom-iris aa00000.video-codec: 
[   68.068622] <VFW_H:HostDr:265d:6eea4000:00000000> Output2 Width 2560 Height 1600
[   68.080570] qcom-iris aa00000.video-codec: 
[   68.080570] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.092596] qcom-iris aa00000.video-codec: 
[   68.092596] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x20100c received
[   68.105313] qcom-iris aa00000.video-codec: 
[   68.105313] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.117343] qcom-iris aa00000.video-codec: 
[   68.117343] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x20100c received
[   68.130072] qcom-iris aa00000.video-codec: 
[   68.130072] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.142083] qcom-iris aa00000.video-codec: 
[   68.142083] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1015 received
[   68.154644] qcom-iris aa00000.video-codec: 
[   68.154644] <VFW_L:HostDr:265d:6eea4000:00000000> HFI_PROPERTY_PARAM_WORK_MODE: 2
[   68.166650] qcom-iris aa00000.video-codec: 
[   68.166650] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_PROPERTY
[   68.178676] qcom-iris aa00000.video-codec: 
[   68.178676] <VFW_M:HostDr:265d:6eea4000:00000000> Set property cmd type 0x1017 received
[   68.191222] qcom-iris aa00000.video-codec: 
[   68.191222] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_BUFFERS
[   68.203160] qcom-iris aa00000.video-codec: 
[   68.203160] <VFW_L:HostDr:265d:6eea4000:00000000> internal buffer size 13640960:
[   68.215080] qcom-iris aa00000.video-codec: 
[   68.215080] <VFW_L:HostDr:265d:6eea4000:00000000> persist buffer size 160000:
[   68.226750] qcom-iris aa00000.video-codec: 
[   68.226750] <VFW_L:HostDr:265d:6eea4000:00000000> bin buffer size  24576000
[   68.238221] qcom-iris aa00000.video-codec: 
[   68.238221] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO internal buffer size 136623360:
[   68.250788] qcom-iris aa00000.video-codec: 
[   68.250788] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO persist buffer size 160000:
[   68.262977] qcom-iris aa00000.video-codec: 
[   68.262977] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO bin buffer size  24576000
[   68.275041] qcom-iris aa00000.video-codec: 
[   68.275041] <VFW_H:HostDr:265d:6eea4000:00000000> Input dimension is 2560 x 1600
[   68.286977] qcom-iris aa00000.video-codec: 
[   68.286977] <VFW_M:HostDr:265d:6eea4000:00000000> Set buffer type 0x5 addr 0xdd780000 num 1 size 397568
[   68.300972] qcom-iris aa00000.video-codec: 
[   68.300972] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_BUFFERS
[   68.312899] qcom-iris aa00000.video-codec: 
[   68.312899] <VFW_L:HostDr:265d:6eea4000:00000000> internal buffer size 13640960:
[   68.312910] qcom-iris aa00000.video-codec: 
[   68.312910] <VFW_L:HostDr:265d:6eea4000:00000000> persist buffer size 160000:
[   68.333411] qcom-iris aa00000.video-codec: 
[   68.333411] <VFW_L:HostDr:265d:6eea4000:00000000> bin buffer size  24576000
[   68.350423] qcom-iris aa00000.video-codec: 
[   68.350423] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO internal buffer size 136623360:
[   68.368388] qcom-iris aa00000.video-codec: 
[   68.368388] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO persist buffer size 160000:
[   68.387805] qcom-iris aa00000.video-codec: 
[   68.387805] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO bin buffer size  24576000
[   68.407251] qcom-iris aa00000.video-codec: 
[   68.407251] <VFW_H:HostDr:265d:6eea4000:00000000> Input dimension is 2560 x 1600
[   68.420980] qcom-iris aa00000.video-codec: 
[   68.420980] <VFW_M:HostDr:265d:6eea4000:00000000> Set buffer type 0x6 addr 0xdc000000 num 1 size 24576000
[   68.437821] qcom-iris aa00000.video-codec: 
[   68.437821] <VFW_H:HostDr:265d:6eea4000:00000000> HFI_BUFFER_COMMON_INTERNAL_SCRATCH, Driver macro size = 24576000 vs FW HFI macro size = 24576000 vs FW golden buffer size = 24576000
[   68.458428] qcom-iris aa00000.video-codec: 
[   68.458428] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_SET_BUFFERS
[   68.480399] qcom-iris aa00000.video-codec: 
[   68.480399] <VFW_L:HostDr:265d:6eea4000:00000000> internal buffer size 13640960:
[   68.496893] qcom-iris aa00000.video-codec: 
[   68.496893] <VFW_L:HostDr:265d:6eea4000:00000000> persist buffer size 160000:
[   68.511749] qcom-iris aa00000.video-codec: 
[   68.511749] <VFW_L:HostDr:265d:6eea4000:00000000> bin buffer size  24576000
[   68.525563] qcom-iris aa00000.video-codec: 
[   68.525563] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO internal buffer size 136623360:
[   68.553110] qcom-iris aa00000.video-codec: 
[   68.553110] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO persist buffer size 160000:
[   68.566233] qcom-iris aa00000.video-codec: 
[   68.566233] <VFW_L:HostDr:265d:6eea4000:00000000> MACRO bin buffer size  24576000
[   68.579462] qcom-iris aa00000.video-codec: 
[   68.579462] <VFW_H:HostDr:265d:6eea4000:00000000> Input dimension is 2560 x 1600
[   68.592482] qcom-iris aa00000.video-codec: 
[   68.592482] <VFW_M:HostDr:265d:6eea4000:00000000> Set buffer type 0x7 addr 0xd0000000 num 1 size 135967744
[   68.605612] qcom-iris aa00000.video-codec: 
[   68.605612] <VFW_H:HostDr:265d:6eea4000:00000000> HFI_BUFFER_COMMON_INTERNAL_SCRATCH_1, Driver macro size = 135967744 vs FW HFI macro size = 136623360 vs FW golden buffer size = 13640960
[   68.616954] qcom-iris aa00000.video-codec: 
[   68.616954] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_SetBuffers(2017): Dec_SetBuffers, Insufficient 7 buffer
[   68.628259] qcom-iris aa00000.video-codec: 
[   68.628259] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SESSION_LOAD_RESOURCES
[   68.640602] qcom-iris aa00000.video-codec: 
[   68.640602] <VFW_L:HostDr:265d:6eea4000:00000000> Output2 Dimensions 1:1 : NO_SCALING
[   68.653195] qcom-iris aa00000.video-codec: 
[   68.653195] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_LoadResources(1392): Load Resources Command received without complete buffer set 16/14
[   68.665510] qcom-iris aa00000.video-codec: 
[   68.665510] <VFW_L:HostDr:265d:6eea4000:00000000> Load Resource with core id: 0
[   68.678699] qcom-iris aa00000.video-codec: 
[   68.678699] <VFW_M:HostDr:265d:6eea4000:00000000> cabac_direct_mode = 0
[   68.692300] qcom-iris aa00000.video-codec: 
[   68.692300] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_AttachInternalBuffers(1760): mem->vsp_buf: pty->size_vsp:461056,total_size:0
[   68.704271] qcom-iris aa00000.video-codec: 
[   68.704271] <VFW_E:HostDr:265d:6eea4000:00000000> vDec_LoadResources(1486): Load Resources failed with error code: 4105 due to internal buffer attachment
[   68.722196] qcom-iris aa00000.video-codec: 
[   68.722196] <VFW_M:HostDr:265d:6eea4000:00000000> Increased input queue length to 32
[   68.723970] use of bytesused == 0 is deprecated and will be removed in the future,
[   68.723984] use the actual size instead.
[   68.724030] ------------[ cut here ]------------
[   68.724032] WARNING: drivers/media/common/videobuf2/videobuf2-core.c:1821 at vb2_start_streaming+0xdc/0x178, CPU#6: h265parse0:sink/832
[   68.724049] Modules linked in:
[   68.724071] CPU: 6 UID: 1000 PID: 832 Comm: h265parse0:sink Not tainted 6.19.0-rc6-next-20260123-gcc2a9fa439f0-dirty #4136 PREEMPT 
[   68.724076] Hardware name: Qualcomm Technologies, Inc. Robotics RB3gen2 (DT)
[   68.724078] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   68.724082] pc : vb2_start_streaming+0xdc/0x178
[   68.724089] lr : vb2_start_streaming+0x6c/0x178
[   68.724094] sp : ffff80008f9b3b40
[   68.724096] x29: ffff80008f9b3b40 x28: ffff000091154020 x27: 0000000000000000
[   68.724103] x26: 0000000040045612 x25: 0000000000000000 x24: ffffc8eab4ae0cd8
[   68.724109] x23: ffffc8eab4ae8de0 x22: ffff00008fe51380 x21: ffff00008e15e420
[   68.724115] x20: ffff00008e15e438 x19: 00000000fffffff0 x18: 0000000000000000
[   68.724120] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000002
[   68.724126] x14: 0000000000000028 x13: 0000000000014e76 x12: ffffc8eab5f391a0
[   68.724132] x11: ffffc8eab624b418 x10: ffffc8eab52ca4e4 x9 : 0000000000000050
[   68.724138] x8 : ffff80008f9b39b0 x7 : ffff80008f9b3ab0 x6 : ffff80008f9b3a70
[   68.724143] x5 : ffff80008f9b39f0 x4 : 0000000000000002 x3 : ffff80008f9b3a34
[   68.724149] x2 : 0000000000000000 x1 : ffffc8eab62aa000 x0 : ffff00008f769a38
[   68.724155] Call trace:
[   68.724156]  vb2_start_streaming+0xdc/0x178 (P)
[   68.724164]  vb2_core_streamon+0xd8/0x1bc
[   68.724167]  vb2_streamon+0x18/0x64
[   68.724172]  v4l2_m2m_ioctl_streamon+0x38/0xa0
[   68.724177]  v4l_streamon+0x24/0x30
[   68.724181]  __video_do_ioctl+0x34c/0x400
[   68.724186]  video_usercopy+0x2ec/0x880
[   68.724192]  video_ioctl2+0x18/0x40
[   68.724197]  v4l2_ioctl+0x40/0x60
[   68.724201]  __arm64_sys_ioctl+0xac/0x104
[   68.724205]  invoke_syscall+0x48/0x104
[   68.724212]  el0_svc_common.constprop.0+0x40/0xe0
[   68.724218]  do_el0_svc+0x1c/0x28
[   68.724223]  el0_svc+0x50/0x2d0
[   68.724230]  el0t_64_sync_handler+0xa0/0xe4
[   68.724236]  el0t_64_sync+0x198/0x19c
[   68.724241] irq event stamp: 2164
[   68.724243] hardirqs last  enabled at (2163): [<ffffc8eab488e4b8>] _raw_spin_unlock_irqrestore+0x6c/0x74
[   68.724250] hardirqs last disabled at (2164): [<ffffc8eab48780ac>] el1_brk64+0x20/0x60
[   68.724256] softirqs last  enabled at (2074): [<ffffc8eab382ff48>] fpsimd_restore_current_state+0x13c/0x334
[   68.724261] softirqs last disabled at (2072): [<ffffc8eab382ff64>] fpsimd_restore_current_state+0x158/0x334
[   68.724266] ---[ end trace 0000000000000000 ]---
[   68.733181] qcom-iris aa00000.video-codec: 
[   68.733181] <VFW_M:HostDr:265d:6eea4000:00000000> Increased length of YUV queues to 32
[   68.744254] qcom-iris aa00000.video-codec: 
[   68.744254] <VFW_L:HostDr:265d:6eea4000:00000000> Host msg: HFI_MSG_SESSION_LOAD_RESOURCES_DONE
[   68.758898] qcom-iris aa00000.video-codec: 
[   68.758898] <VFW_L:HostDr:unkn:--------:-> Host cmd: HFI_CMD_SYS_SESSION_END
[   68.779049] qcom-iris aa00000.video-codec: 
[   68.779049] <VFW_L:HostDr:unkn:--------:-> used byte before DestroySession 0x299d6
[   68.795564] qcom-iris aa00000.video-codec: 
[   68.795564] <VFW_L:WrkDec:265d:6eea4000:00000000> Start destroying ...
[   68.795564]  
[   68.814913] qcom-iris aa00000.video-codec: 
[   68.814913] <VFW_L:HostDr:unkn:--------:-> Destroying Session.
[   68.830323] qcom-iris aa00000.video-codec: 
[   68.830323] <VFW_P:HostDr:unkn:--------:-> Session 0 end 7992d3a.
[   68.845802] qcom-iris aa00000.video-codec: 
[   68.845802] <VFW_P:HostDr:unkn:--------:-> Session 6eea4000 Thread Load Stats
[   68.861250] qcom-iris aa00000.video-codec: 
[   68.861250] <VFW_L:HostDr:unkn:--------:-> Unknown Host msg 0x20007
[   68.876714] qcom-iris aa00000.video-codec: 
[   68.876714] <VFW_L:HostDr:unkn:--------:-> used byte after DestroySession 0xd77c
[   68.892229] qcom-iris aa00000.video-codec: session error for command: d0000000, event id:1009, session id:6eea4000


-- 
With best wishes
Dmitry

