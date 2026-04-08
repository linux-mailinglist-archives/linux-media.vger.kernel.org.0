Return-Path: <linux-media+bounces-58291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEv5DxXs1mkeJwgAu9opvQ
	(envelope-from <linux-media+bounces-58291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:00:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA83C4DE1
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 02:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C396302F723
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 00:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37C038910E;
	Wed,  8 Apr 2026 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZg4ZS65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hejot2JF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAF2DEA8F
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692798; cv=none; b=kNrrS46HrhUxBkOaYkP4C3q/+zCgDmtVJYmCfPwfw9F8+oQze9yiOi9UQQWPZDAG9nNI0N3M8RjApf+I+kUx8WQLdBNtL9SJP2PHuxey2LWSDUQspxR7wnngSS++nIQa1x3ZrQKPBchQIYUxBYefXjr1MfzeZie7lYGjrHAu5xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692798; c=relaxed/simple;
	bh=EAKAg5hD3Vv7ZWzxBMtSmifevzxSKLOq6V7r8WAHoTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TisNaxAvSEErHzEaJ8+GCNDtf+Iej1cOwtmKBfOPehgcYL3cYbTb815+dYlPmjjuS1ZHXEanT0mozsaPJ26WXScthybVNTWYYrppEW0Vaz2ydp5L148rd2syJuFOxr+jK6prLEQSAlk3Cva9Lv670xzlT8pHT1YNmHLB2y5MCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZg4ZS65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hejot2JF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638Nooph1072656
	for <linux-media@vger.kernel.org>; Wed, 8 Apr 2026 23:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ly5ShbBbsn8Morpo/AAHgSWK
	s29jkJCIb6xE3+Qy6j0=; b=KZg4ZS65ARTWeOYXOLUtTYgWRGb1zOiEWup0h965
	9P8UQlz6PccqrxRmruM/f16DGnRICh8Apkle+2fwr3dXNmrQnGW70m6aGNEMQuIF
	QN7b8s6moOHKeWKDPhVxuzHqiCqUhAVM1+lVwzQv2Iu9g45aSieVruTOMUP87N6p
	uH2I9kntKtsw0SFWXNkN78dI7UoTlpkEuqgos4wvLe3E4QjdjAcAIDTP1EpdPFlj
	gnuqTB3Dkomvsi92QqebxOeuqMi79B3Lw+j+SxvSDdb3rUKiXtVl+hiv7a2milqI
	OZb5pM7ogpsHofcyoG5YO3NX/C15ARlz7KwIXQVnvSviUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb39m3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 23:59:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso14654631cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692794; x=1776297594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ly5ShbBbsn8Morpo/AAHgSWKs29jkJCIb6xE3+Qy6j0=;
        b=Hejot2JFp8/TUozO+pzTxy1CHaqfXawPmFVZuWZitNCjbuy6fzQ90VfSfldPYTu+l6
         jb/S1d9ZTN/XQlX0toNNGvA1/Pomh2G2o+ou+oCQou5uOs1tvSjapOf/QCYBtJmqHXPU
         nqzIguvnGKeG4fkbDyE3GIHE3MDPLNuv7joIEp6dJiLWzC8z7gd9oRYJBW4o9iSWmbbq
         iLsTJhkiJVDipJVf9V06AtGxDvCeBjGWR0lTuHsIfaMG8+TcZcoyMQ9xVHRDIq3N+jUr
         USCzgRHJNzbMNuUATkXN/OlEEFJU6BWFSW6gJSwL2G6W0Gm3YOeTinjusF3/LpE82tFi
         1KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692794; x=1776297594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ly5ShbBbsn8Morpo/AAHgSWKs29jkJCIb6xE3+Qy6j0=;
        b=BLOHt64X+txHW/1Yv7jF5/Q+wsD+JVxrIVcVHcS6cujMJFGGlSUKPhpWY0HK20EPXB
         SYxoVNsPvC47mXRzwuaTR01TQ4jeYpEPOdsiNkp2ExVqCZDD9ssnqg6rAWNYPR4saG1q
         Ny+G4Xz7SE1qR2Kk2nJPYPu5Tsvt4f017ICvsii/ewRyFsg6m5PzIYAs1zrpmGPJ6Ta1
         P69Gsdz8LeVhVcoXWOZzg7Taz315zZzXizWglVac+C89I10q1GLqGPCCNge9cnuFJ0Io
         NfWL6DaplD+czlJ2LMsH3lMbVPVdlPi6UEe+V4pLF0euEa/TVDnD6bTvOKdvuXFI0msw
         1rbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOLedAiigo9b5iQca33Q+hKP+530G97pypdJwWw88afMOQeQBS1978bRPWaijaqnbEi4V3mrq3vj6zqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEmlmorRH2JM9LbN3IZq4iOOHFLqnQNLAL5ED0zdgkj+SXIQf
	2ZfSQK5UFpBeg5I9J6rX+YqOQPI03xZ58d4DH3MIGE3S7PC+r2rfDCXhjN0/AOZuL2JnXIhAMra
	Ib9Wje/xbvU1Nu7dLsAU1iVfA86NYEQRpd8SzZQYuTpxmnEkXzhShyfY10/QFhKppVVHcuAy0Xg
	==
X-Gm-Gg: AeBDietGW/SzkCTFWfsyAYf3H/vEtIV5CWQicpGTA0m6b7mMc7pE47ywR34YSoOUlAB
	xNtRxAiDOIsSY4ufNrmDQBTmu+PKvGXyuARkXTfM4sMN8opoHMvjI5K32dfbrnalpOAxoFBNhIy
	5P7Ub7ugA3CXVvMsaBZi8lErzeCl1IKi2qAb7VL+HbaDfYivYZfwqtDamEmy08JaWpZ62KbwBW2
	E4TnujNQs8awO2GZUPyjxrYIKgW/yrwpMUKc2elm8E80enu0+gGtCUR90Aon4of70cIAIZ7SIMk
	l5Ixs8laRexcmRbFXjtXGaJrpPBm2++vfSCwqMqM9wR424kedHxiV503pf/mYtSPP3kDH/2k052
	/xjLZ9kMgcX0S+Y3EWavpdp5E+eEJjrFgSlVOVR58QvNVENVgsiAMCwFCf5CCjJHIESWssk/I2r
	eA3OltEPwf+odMaMX8QQVR5bRjbard8svSiPI=
X-Received: by 2002:a05:622a:13d1:b0:50d:8727:b1da with SMTP id d75a77b69052e-50dc2221113mr22465551cf.39.1775692793887;
        Wed, 08 Apr 2026 16:59:53 -0700 (PDT)
X-Received: by 2002:a05:622a:13d1:b0:50d:8727:b1da with SMTP id d75a77b69052e-50dc2221113mr22465141cf.39.1775692793353;
        Wed, 08 Apr 2026 16:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9c3b6sm4987647e87.19.2026.04.08.16.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:59:51 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:59:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Message-ID: <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMCBTYWx0ZWRfX+yIoGw39dUEs
 /JOk8nTcAeOkx1sApwZqnFuz6lgEgu3liJoSDY8a7nAcvWi3iCqM2ujkn7aBD+yHN4XbEvwfm9I
 Y3k3ZXfEtPuyQLLTxa/4vZ+MQtWB9LFNkDyt8BuJHzHQ9DVOcGbpLnPBx0QFEjja3dFofYXWqzn
 z44JSIjSyciLaTocfRg+4KxLrPqJrc0crmBJlmEsV6rl9FlVs3BDaT8DmKJ+1t5UvhJUtBbRG/7
 gmrZP7pwHqxpwuQe9KwaXrhg4Hh+wEcgZLZs68EEjYex+yEZj3wT5F8B9xUOXcxiqP0uAdJBoRB
 ue1qKU+6ERs1aL2bJT6eTxSbTV45Rm9gyTh+qVcy6YmTOi7vriaAg4dqzR+Cuekz0CaxixEY+7o
 YC1ttPtsZdf8n+ARSq6WDBb4mawEC0N3oirZRFuUG4eNqVf1OZGGwUoyVEo/cire218lGjGiFMA
 pnrHLtSiusqwr3jEYPg==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d6ebfb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=dUrpdcx2ztF4zUj74WUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qkN8w6c1i1XUUTyteCkFDUX_A66zp0km
X-Proofpoint-ORIG-GUID: qkN8w6c1i1XUUTyteCkFDUX_A66zp0km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080220
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58291-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93BA83C4DE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:43:54PM +0200, Neil Armstrong wrote:
> The P010 (YUV format with 16-bits per pixel with interleaved UV)

10-bit, but with 16-bit alignment

> and QC10C (P010 compressed mode similar to QC08C) requires specific
> buffer calculations to allocate the right buffer size for DPB frames
> and frames consumed by userspace.
> 
> Similar to 8bit, the 10bit DPB frames uses QC10C format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)

> @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>  }
>  
> +/*
> + * QC10C:
> + * Compressed Macro-tile format for TP10.

UBWC-compressed format

> + */

-- 
With best wishes
Dmitry

