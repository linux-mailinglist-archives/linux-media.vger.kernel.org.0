Return-Path: <linux-media+bounces-55739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAe2AxU3tGnTiwAAu9opvQ
	(envelope-from <linux-media+bounces-55739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:11:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0A286BBB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F4061306619B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8623C343E;
	Fri, 13 Mar 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaRhH4JZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibuj9w7C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B83C2793
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418107; cv=none; b=g9E5l/UHDxFESrbnrGgnVk0Gw3OYcN5a/BsX7AM6RpXnSKhG+KNsQIUbKnbrvtQaTzsf8NMljWqkfk2/P63PavzlW1L+b7f5jWPVrjOecgQy32RCYCgUBx1bkZx3KoT1Vvj55tYGXuOkZqTo/QgW+IhQuHv++F4BWLRb12hpIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418107; c=relaxed/simple;
	bh=//foCvGf32tO1uFsVr8EkUq6JFFaFUrCi1tESqJHBnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C81t1PKQTzzAgj0/AkjzrJ3edJCXqlCPQU3NRvA/XwaK2uX3SoTbbVqpF/2iK4HjYfFPdHSqJUHPSqJoQVFZ3f8fpMJYw0jpV+PWiYe5x/MutajTcNzky2VjgTis55ZOQjSa9tjrp4ulzT0xJ13I0P0ASvRMeimlYXlhZl573hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaRhH4JZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibuj9w7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DD8oKS793568
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIvbYZtvAChdVd1Tmy62djofOIqMZedQEN/EyLMxhMc=; b=QaRhH4JZ1EP/glAc
	f9AQ4UMPXWO09OYyujbm702NoZdnUPnM0Rlm54TcTJET9JUEOu55RzzXcHgDQSCb
	xD+YMOAxP6w7tuSer+B0/+aI6FCM5be1QLguxIFIANEilQADtkopGQfzWGQxVDmc
	Hw8tkiUn1lRBMXllyAP+DQiOnZgmJD2xslbqORR/s352tC4oiHl/5jUvbQS2FXRy
	7ui243P+ojsD+JsjEqTpT0sUhZCZqtiG7OuhZ51oRcGel2aSgp3lyB93At4FpBQd
	TAAoX9mhaHp6ONF1wbAKzeHy7dtFqtKqQD0ttkMJZzzVc5ZB84SlFV11UWhUyBes
	I9C80Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvdnt1y48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 16:08:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso643113685a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418104; x=1774022904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIvbYZtvAChdVd1Tmy62djofOIqMZedQEN/EyLMxhMc=;
        b=ibuj9w7CyRI13LY9EMsIK27LHuDvwcjZgJDeoq8SrH4bcJF+c6ATvTWmnJ+QLNuWtA
         wfldet+i1UFvJ85a2KijoeJgY31Z+maGLmdhCsP7mES5Pr7HjBG4IPICZNhhK0XIpx/v
         PKvrcVHycccGFSEwKCLib9VC/BugosbX6ec+pKLK3a43RCK4jXViBrUfghudTMwHS5NB
         fgpJF4K68r7Ey9v0qSzOW0YcMJ4IAHy1p2WFPgroMKiqqinZgoONAIAOUi6//pJdKZVO
         3JwPbK3N7XM+mhme59ZopqJf1k0F75JxgqE+IPTDY4crMZ2KlyboijW3zqL43Cz2XA9T
         j8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418104; x=1774022904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIvbYZtvAChdVd1Tmy62djofOIqMZedQEN/EyLMxhMc=;
        b=a56VapZy4LuFLLom9SpZiJJpaySD6OwLwPG6CASQmG2oh3Xz3cbti2eXdX6tP/nIxZ
         dbHMwv5HD2yBj6OKIBecs+lKsH0MviKXIPjwlUZJdI9Vlh04gkwaG9omaHOUFzQnRUT0
         IR+YbnwJNsi2V0FVU8MiYjNsG3I/Xf/rrOsABERknJzRVL6L+QuHFWmvcSfJRy7II2Xy
         X0RqiLQ+VfUJhViNFaCl6tTKK5ldNOX++M0cqB9scW37mm2eFL4eO5sbYo7dihtha0wM
         wQtFrHdVFBvn/H4P1BUmPs90dfRQjEneeH+9LJ5otw+m3ek9NNVl3l5XAixnCPsYCcDj
         vdyg==
X-Forwarded-Encrypted: i=1; AJvYcCXw3eyBUpC49LqDLIORkXMUKuG6eQ65NVkvG65DcuMMpZwi11PlOl1ewo5UokEPFTeBwllJui/1a4VIuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Qpr5EsjLwhizncfBhGgfWwaKa3z5mozahrPrKakfwJo1+842
	bVqi8O/BU0kVQQAGrAKqSVqZ/EqPA5LDBAwDkCtFdqdDtU4aIJugiHylUc96XzFaUbuzlom/fKE
	adehqLPkUzH9jiHmdZBMdvuXn9AFsMm5hJo+W5vdfFYgmPomfl8U/bER9qPqk1I0rWg==
X-Gm-Gg: ATEYQzy5ERsM1yr9bhivOop3DZa3Jbh9sf9pbseDBxF/insmogCjQeONFrrKDHOFI+A
	jkZ53dBiV2sl6NsPVSPEGxM78yMgaMHXBHDXSlrObIzTcF1mLNAQApHybr5Faj45m7JpIXsdaJL
	40yJtDKorvPfdwlTvSv32NC9ezU4VPDmdKtmUsgayaIR2rzh4JGSmX2DtNnpgP1B2dAeL1qGq/w
	ee/khUsAT+C698OYF+Aj9zuUnsjK+P5hCg/Iv2Xj/W2P7i2KYNykabR1M4fRwI/Y26rzlvCrRjg
	s6YYf6jevp3Id84S5GiqCWUZ+RfflDqvmxoqQOkCMbleBbNvueo38fOOMq5IBI89myo5v7CUvI+
	GemwzqHzpcfTD1SzmaVfXaGt2gCSwU8kvZBsZR7Pf/+GVtJAqxK1zLmZodNsIeaLS80EsZpARrh
	2gO4Cg/7nBPsSexPexZbfIUFRk6Owqlmib6kg=
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr541429385a.47.1773418103838;
        Fri, 13 Mar 2026 09:08:23 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr541422285a.47.1773418103286;
        Fri, 13 Mar 2026 09:08:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33e51sm1567056e87.14.2026.03.13.09.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:08:21 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:08:20 +0200
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
Message-ID: <vpri4zuioxvoomjjl5rkb54fi3wipi3shho2ezq53phaftj54g@vg4swwuwnn45>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
 <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
 <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
 <hzltrmeqf5oeh7o7xj7vtzhyaldyoep6ngmcwk6jqmiwdqszdp@raogozbh3iap>
 <61ae9967-e848-5f8d-c154-5022caf0799e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ae9967-e848-5f8d-c154-5022caf0799e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZrfcAYD c=1 sm=1 tr=0 ts=69b43678 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=vAhLNi6rj8_hoSnI:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QvLyAiXc57lcVSl2OHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2S30KtosqJF2IBbTawWWJ6rFmuCyWcdF
X-Proofpoint-ORIG-GUID: 2S30KtosqJF2IBbTawWWJ6rFmuCyWcdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOSBTYWx0ZWRfX6jhhnhPY5R42
 yWgFEeBr2aj3259ztDrweccLI9Uwq1CPG1fBrHuePUvw1JASJLH1sXSeeL2njzMd05al0xSpNob
 Jj7fg7SOojZpJN4OTJ+Bff+MLeunM5lhDsEbh733qkJrtm00dp+qOTXd4tMEEKiG5SJe6nRHViL
 OWt+x0yd11PPe2uDDRH94u5u5ubEIpEGTDvreYiWrOUZNclBx9ISifYmDT7o66P2OhD/PPXYWh6
 NoGCKVwE9Zjd7UiJ3Ny+Sp7MaLiUCtqJO5Uk+X7JQYGe0ebb4EvT9Gxbt1octEaolO31CmSutg7
 /EO9B524Dj7tOyVifAQCNb+EZ4MggI+ykBWYcJRhiDYa+cHzqffE/jZnCwFM5aAANIua58FyZ8i
 x6YR759gNhIJ6LesaPwWtymQL/PgZbaGWDC2Ir1qQYcw+tisuQM9/ofAOtPRW3PKJTpCfuplyFN
 Pp8LBG33mkDgbGLH2ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55739-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63C0A286BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:41:07PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/5/2026 10:27 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 02:56:16PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/27/2026 5:48 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
> >>>> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
> >>>> dynamically, update the firmware loading mechanism to prioritize
> >>>> Gen2 availability and detect the loaded firmware version at runtime.
> >>>>
> >>>> The firmware loading logic is updated with the following priority:
> >>>> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> >>>> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
> >>>>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
> >>>> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
> >>>>    the default firmware name defined in the default platform data.
> >>>>
> >>>> Additionally, introduce `iris_update_platform_data` to inspect the
> >>>> loaded firmware memory before authentication. This function scans for
> >>>> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
> >>>> matches "video-firmware.N.M" (where N >= 2), it identifies the
> >>>> firmware as Gen2.
> >>>>
> >>>> If Gen2 firmware is detected on SC7280, the driver switches the
> >>>> internal platform data pointer to the Gen2 configuration.
> >>>>
> >>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
> >>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
> >>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
> >>>>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
> >>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
> >>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
> >>>>  7 files changed, 171 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>>> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> >>>> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
> >>>>  	.dma_mask = 0xe0000000 - 1,
> >>>>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
> >>>>  	.pas_id = IRIS_PAS_ID,
> >>>> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
> >>>> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> >>>> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
> >>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
> >>>
> >>> Why?
> >>>
> >>
> >> SC7280 Gen2 platform data relies heavily on SM8550 data structures.
> >> However, unlike SM8550, SC7280 does not support AV1. To address this, I am
> >> defining a dedicated platform_fmts_sc7280_dec array that correctly lists
> >> the supported codecs (H264, HEVC, VP9) excluding AV1 and using for both
> >> gen1 and gen2 platform data for SC7280.
> > 
> > Why can't we continue using SM8250 data? Also please see the series I
> > posted few days ago, it might simplify this piece for you.
> > 
> >>
> >>>>  	.inst_caps = &platform_inst_cap_sm8250,
> >>>>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> >>>>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> >>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
> >>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> >>>> @@ -15,6 +15,7 @@
> >>>>  #include "iris_platform_qcs8300.h"
> >>>>  #include "iris_platform_sm8650.h"
> >>>>  #include "iris_platform_sm8750.h"
> >>>> +#include "iris_platform_sc7280.h"
> >>>
> >>> Don't you end up with two copies of 7280 data in the object files?
> >>>
> >>
> >> You are right, there is a duplication.
> >> The header is needed majorly for above reason to exclude AV1, I can have
> >> only platform_fmts_sc7280_dec defined in gen1 file and extern and use in
> >> gen2 file, that will deviate from the design we are currently following for
> >> platform specific caps though.
> > 
> > Then the design needs to be changed. I've posted a proposal.
> > 
> >>
> >>>>  
> >>>>  #define VIDEO_ARCH_LX 1
> >>>>  #define BITRATE_MAX				245000000
> > 
> >>>> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
> >>>>  	if (ret)
> >>>>  		return ret;
> >>>>  
> >>>> -	iris_session_init_caps(core);
> >>>> -
> >>>
> >>> Why?
> >>
> >> Movin iris_session_init_caps to iris_open because platform data this
> >> capabilities may change after firmware loading, which happens after probe.
> >> Initializing caps in probe would result in stale Gen1 capabilities if the
> >> driver later switches to Gen2.
> > 
> > Is there a window where devices already exist, but the params are not
> > yet initialized?
> 
> The device nodes exist after probe, but session caps are only consumed
> through ioctls on an open fd, so there’s no user-visible window where caps
> can be queried before open().

Ack

-- 
With best wishes
Dmitry

