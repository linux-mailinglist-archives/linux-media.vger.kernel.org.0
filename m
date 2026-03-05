Return-Path: <linux-media+bounces-54565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKXAJFUNqWk20wAAu9opvQ
	(envelope-from <linux-media+bounces-54565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:57:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA220AEE9
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB10D3046D97
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 04:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7251F286D5E;
	Thu,  5 Mar 2026 04:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClbDpE6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eds56t5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495813AD05
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686668; cv=none; b=NEYTD632rJ/lwwHFEj0ssASXE2FRH+PkpRfDtflAhJ/ajAR05lcvyQQlylmPZjc3EiUq8DHL3qMhoo3blKGGYxzBHMS4Bbrf4pjoRCSzitl4lRwsOATqrEPbqbxtdWn3ly8PmIkkZAmHgv5WWdt/SLFWtNFDJXvbkCQbY6vlFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686668; c=relaxed/simple;
	bh=cQxMEXOTDSY6aXRXvIRUS5pAJH15yAzyWCGScn/5Vyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBymJU7sH0bIbTrH+LL+ttxyboMnckWgfYgniGNSAwO+Qz5jp+Ju4PlfbnPlVVAngXXUuyRWfmp1MOP045xAau43THCjTmhSqej5MyhtYweF853BNoU6ti13kw41AO1HItD+LfFdZMfJz1E6mIrEqVXzifD4XMBZV+x7gGFKvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClbDpE6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eds56t5B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251C0Gq3160488
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 04:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g9SohA056+54xULbQ3QTWZf7
	S/3inMkI7zc53tCPOWY=; b=ClbDpE6T4f+bRNN94enu93yrQR6DZmIzap1Qgrm+
	6eda5YnbHEUCMRL58BHBMw8z3FeY/L6oc3oCrTd9rFQcJ/8jPnl6f0U+/iRwK5dc
	P66jMlpo6I8MNog6taDESs1RVTXSoljoF8pyO/9XjVACiGoKVhmKXKjyqs8xvWtM
	m3iBbN02M65D3vW6sXdOi5+L2aBx+NI6W7bTkLC/yDaERSRExTD6rgKoG3rD/30h
	a/35kPf9VNH/wTDA0JNHgOdcfDYY1nhxXqKeTaIiRtYTLgrNkYE8irj0hIT605m7
	lC+gXlPTxBviDdUcKiIAXpY585uBM5u4JLq83dW17CVsIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5u5ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:57:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so490107385a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772686666; x=1773291466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9SohA056+54xULbQ3QTWZf7S/3inMkI7zc53tCPOWY=;
        b=eds56t5BUdtLB8QmEETLUyepvcpfiNvGPvFbr+ADIwsy5BF354Qf805geIZd7h205L
         Hu8ReZlguEZPzxFGaF0hzlazGrRm0bQYwxxLfzjlpNiMeJFpJIAWLIUT8E+R3qawwYp/
         rJjfRKO4+S89rA28SjOXj1rDt8YTgG/NIUl+LVCtbkAbp87JaoyfUMJot+lHAgf88cfE
         dPcojJp9f4IH2DQle43qkb+nEp25TLc4aYfzjLMapaXjjdyJIHglbgT/AWH6fkhkZofY
         2k5AMPLEKRFGJN03BjC/5b0cn5X+/7a4GrjGiBYUTelrw7dulgizYnNzDUFH34p4Y7Fh
         kjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772686666; x=1773291466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9SohA056+54xULbQ3QTWZf7S/3inMkI7zc53tCPOWY=;
        b=aDBl2giMYXPOksv2HlTyrjic3/2wll922wBEPHvIfHRsz0I2X2RgFuyK4BFSbc3eds
         jDOeOe5P1TWxGOd3g87anr8zKoAfebHFPXUMYK+7ks2ebMJ6qEMjKXgU71iqhVg7zJMl
         9ZN0ELi8MzvOi35yT/qV+KIw92tjHp/A9aLTM2USAlahm67HauS7gdScVIvU3mFbQUFZ
         hFjgRFdghlg9mSjZ9+WAjeippfEEdKPOdg5V5Im0jMcT5/Dk1fICIvJW/5d8hU0Nif36
         vXE9xqYphjSHRNhNMhtxUOKqIpNw/imRTuykHnXy9R7RgG16gsq3TT9G3nrk8SDbUCQO
         hi7w==
X-Forwarded-Encrypted: i=1; AJvYcCXclWBd+w0KtFsailJm95P41TTigZ3ZA35KXfHdD5qR+DmB0T7hEeYioUXrD1V8t8fHRX+1iY470YqDyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn21fHR0FxuSy6J1GoR3p3t6cOPY+vA+DgnZ5zGqIZyZILPf1B
	5wL/ISLGEv0tzFr9edoqPC1An9ctAT2psqY3KBGiJbNdYValm2t7YPkjdeVSdyx4JhLp2so4YVr
	Pl8zOuSWNZNtPHjbFNwI/Y+bX+PjetaC2eWWbAmbXV1b+iK/SWqi28PJz1w6mRjYYKg==
X-Gm-Gg: ATEYQzyT1KZKFYhPwXd9GJL0kp7LfT+bZ3neESYB1Q6sFoPLkCoYCzsjkmbGVGTeZ4k
	ttN9S+uTxa2pvfkqHUlpqe5s1FQ8RY+8H80pdM4/ig7VSpp7BgLUUXv56cxD9tKcVN4YW6Q0CRy
	57+y6pxYdX5JNfD3dqFvnZWO29sGZcO0/Pv3ebp6Kt7YrMnzLL8PefPoXf92cFUto9Pc25bAPre
	f9M6kwVKiiDJwNJJqqLPiPNIj0f++yu6K6vjqdVjDtBJQouDVWouITdVlRxLD8kUwVhIum2Ng6d
	4oTeaoAmNcTesyDMN/hSBTGa0aiyG2CdefN2v0UXISeG+x61mNFf2swoE8dUKHa71qzyJCeg4V0
	37gt/FN/rNaAmgTnmTVV/9tb+mwnYIxYQY6iNmHHLiKfvsMUh762vUYo35etLz5RWyeVOwrpapF
	5C6V3WfR06f1/DrPiemk4lHP+fh9Y6Xd6U69c=
X-Received: by 2002:a05:620a:1918:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cd5af73b54mr533071685a.39.1772686665736;
        Wed, 04 Mar 2026 20:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:1918:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cd5af73b54mr533070085a.39.1772686665192;
        Wed, 04 Mar 2026 20:57:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a337a930csm2523791fa.8.2026.03.04.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:57:43 -0800 (PST)
Date: Thu, 5 Mar 2026 06:57:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Message-ID: <hzltrmeqf5oeh7o7xj7vtzhyaldyoep6ngmcwk6jqmiwdqszdp@raogozbh3iap>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
 <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
 <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
X-Proofpoint-GUID: PYJHmh_-6tooWC7YE-Koy-NFDSJsrlN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMyBTYWx0ZWRfXypAs5lTtd5Ry
 Lue/cG96DpH0yx558cqaJ1sX91o24WT8Pk4MlAoL0iePwYjfmqSMhreAlwpTVf0JOyWBYYqUVLO
 A0xFSkBn2EE2pD3NjmTVh/DeTZlhGP8IRYNMWbZa2ygRLSo64Z86GMDMbCbS6zH6tBF2EOnuv7B
 qmCPt2PI0iWqwUgdn3dcgn7vEibOQneWizTTf17pEj61ZRVMOYEbwocuwB0dup5PfL6jRragDpE
 sl1uqTGUHVgqPj9IdvCcEzXJuTLBi0Q/h+lFoAfKWvX61xRBu13MDvypv59+HTORG1dUT7QN9tj
 96TkzgfUUX2c8RS81sQvGbVSM1iAHHGB7DCLEZ91pgio0PQOCKzOg0eMXsmI69eAEuFL/qNYLJ2
 6tpzed841SsZHrxrdRCJt6QuqQRQaihUzlf39v0qadtxvL0Chg1SwMxEY3WICV6dPv5h+FBRa7U
 BSfOylOA5NaUWHqgB7A==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a90d4a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=vAhLNi6rj8_hoSnI:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vAeqaJklcl7F9IkrpN0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PYJHmh_-6tooWC7YE-Koy-NFDSJsrlN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050033
X-Rspamd-Queue-Id: 0DCA220AEE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54565-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:56:16PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/27/2026 5:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
> >> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
> >> dynamically, update the firmware loading mechanism to prioritize
> >> Gen2 availability and detect the loaded firmware version at runtime.
> >>
> >> The firmware loading logic is updated with the following priority:
> >> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> >> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
> >>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
> >> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
> >>    the default firmware name defined in the default platform data.
> >>
> >> Additionally, introduce `iris_update_platform_data` to inspect the
> >> loaded firmware memory before authentication. This function scans for
> >> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
> >> matches "video-firmware.N.M" (where N >= 2), it identifies the
> >> firmware as Gen2.
> >>
> >> If Gen2 firmware is detected on SC7280, the driver switches the
> >> internal platform data pointer to the Gen2 configuration.
> >>
> >> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
> >>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
> >>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
> >>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
> >>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
> >>  7 files changed, 171 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
> >>  	.dma_mask = 0xe0000000 - 1,
> >>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
> >>  	.pas_id = IRIS_PAS_ID,
> >> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> >> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> >> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
> >> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
> > 
> > Why?
> > 
> 
> SC7280 Gen2 platform data relies heavily on SM8550 data structures.
> However, unlike SM8550, SC7280 does not support AV1. To address this, I am
> defining a dedicated platform_fmts_sc7280_dec array that correctly lists
> the supported codecs (H264, HEVC, VP9) excluding AV1 and using for both
> gen1 and gen2 platform data for SC7280.

Why can't we continue using SM8250 data? Also please see the series I
posted few days ago, it might simplify this piece for you.

> 
> >>  	.inst_caps = &platform_inst_cap_sm8250,
> >>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> >>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >> @@ -15,6 +15,7 @@
> >>  #include "iris_platform_qcs8300.h"
> >>  #include "iris_platform_sm8650.h"
> >>  #include "iris_platform_sm8750.h"
> >> +#include "iris_platform_sc7280.h"
> > 
> > Don't you end up with two copies of 7280 data in the object files?
> > 
> 
> You are right, there is a duplication.
> The header is needed majorly for above reason to exclude AV1, I can have
> only platform_fmts_sc7280_dec defined in gen1 file and extern and use in
> gen2 file, that will deviate from the design we are currently following for
> platform specific caps though.

Then the design needs to be changed. I've posted a proposal.

> 
> >>  
> >>  #define VIDEO_ARCH_LX 1
> >>  #define BITRATE_MAX				245000000

> >> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	iris_session_init_caps(core);
> >> -
> > 
> > Why?
> 
> Movin iris_session_init_caps to iris_open because platform data this
> capabilities may change after firmware loading, which happens after probe.
> Initializing caps in probe would result in stale Gen1 capabilities if the
> driver later switches to Gen2.

Is there a window where devices already exist, but the params are not
yet initialized?


-- 
With best wishes
Dmitry

