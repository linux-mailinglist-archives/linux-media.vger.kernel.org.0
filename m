Return-Path: <linux-media+bounces-38950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D13AEB1BE65
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 03:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CC4A3BE3C1
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 01:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FA1192B96;
	Wed,  6 Aug 2025 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar7upmIc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2AE15B135
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754444234; cv=none; b=d6nJJEDEFbu0LLKYOqkt7jpQP0OsWUHckmyPPKpS9V32j2Ww4AHCV42q8Q1nKA0Mk1oVBFXo6MdsBuX8TEsMbqFTtN6tnGfeqqOkM52MQcjTbXleEz4DIKjpmiYyoTXBdHPZift21IrjggdNM9hV4XXEsoRXgG2ReDHEDCUdCPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754444234; c=relaxed/simple;
	bh=RRE7SubbvLGoTInPGjBxocoPugbap9T5IPFdYvgN7rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSSE9ziyhaoeZyv+MprCCPfW84FWTX3RKPEAeZKI7v+WqMZQpHqUi/bg1MYRiAByZGVW/FN8dpqstKUlI9AywOeXImWq15vYsYktaHfFIUVZKtw2qnqmXg+f4yLfWRlWgDiMp9/R5eVpTG7yiHRADxrSLnaKtsOH3d4rFiqvxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar7upmIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2kAx020209
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 01:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y5BGHsX5GwN0R/WPVZybiA6n
	q6pOn7ZZQtqZPvsh1ZI=; b=ar7upmIcTc761VOtLtdC7DInUh1WzBUWngqNPJef
	kyutXZ7bURFerkcVxvAMZGYzkJgT2d7x4TgcfZtmBbXxii3bCXoSflUqV4AIohc/
	Eb0uYZCcKhXcS3mJ/DSTrX8MwVPrpLpgSIg3NGKkY2GFV/y6fHluxEbM03nJgvde
	gmyEAPkDe0iPP/31TCgrn24ytFI75NFKZZDLFwImuW+YUzblEHFpio/LyiMHVxnR
	6qeO0pvhdPqHhi6GnkOIjo6IMlRiS0ZKpeNOTbVMsxBMMjthMXVOLJhOk06Hd50f
	+kmQIGTqvsB1pIOBT0mNNJ6ZDwiExAMt0OfJRgaUkzskLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvryys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 01:37:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af2237e4beso9412271cf.0
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 18:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754444230; x=1755049030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5BGHsX5GwN0R/WPVZybiA6nq6pOn7ZZQtqZPvsh1ZI=;
        b=aB3fmLlRsyjI3wIEQEvw50nQaQMZuByA2nY3dtZLoFhqG7KNtSamOkro9W2at+GAdg
         KYJVk26n6tTaSMReM9tL6vHel85zqivLnc5f1q2IxyxNj6CwoIcuMhkCUVUV0W4souo6
         aV4iXHnjlAvK5dbuGVYbZtQVvCvJHaKvjExPVZvgu8pNPRhDOcrsvDVrsIyKU3fDPTwZ
         hFMaP5p33FMIu+4BdyqGxdIvU7udWAcTjIQrrV5o5hJSX4HX9yKHAX0G0KVQRXTARAs6
         am7Nbx4OG6JKEkSZ3NwvtbEaR/p+evQDxtEr56+PpV3bkBvLKi4E59SXKhzTANuNZ87W
         1B0w==
X-Forwarded-Encrypted: i=1; AJvYcCX8x/EmdRqQu2/Q8oDa082PEoQ4Le7YYOvesaPSM8s9lvjGLG6N2kkuYRQsnYVr4gYGJfwnIOaSr4W7qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwCNXLb+TzXEMjQCBda5eg1lmldz5ThQsveRXmKspZ7NhmgEs
	HRkEpOVs1piI3Cv6ZgEcXlgwgLbKdN0LAJTBrKpRFE7Ydlr9WFOLd0yX4RxbPhngXdSQ8QUD7iK
	jff/6q7a5D9uVY2AB+V9iQdPA4LGXHSgdA+ETQ7M5YpuzSO2WzmlxjHK2GhPRNymrqQ==
X-Gm-Gg: ASbGncvmSvPCwgjl0e1NvJo97tfkqu9AyQPSmEqSoxQKXR4oC+XtK7L8j5epr+A3L8Q
	XTIfrBUUahGmUWHJAMIIOFt6lQ84ongd3fcnbULk1M95Ld8wAM6wvGYcIFudax52yjwgJbP27bB
	0rmKgEuv+rfDoK/c3BtQuD8z2hQqAnaF+SRMpxlDZb6XNfbTJAnoRUDE1TSdRHzBoVPAvFSGUmZ
	8zqfstD9/L/3KeqpY0jyLlZjsA2WwWTDucqrz0zkVHZAEwc9AvA4q0omi1GHVFn2tslYZLM/8Gj
	0KJJuPhM+Dloi4OmecRbibCOe+meT5k1CcNwbyeX+TQfuDouUSp4Sv87jJPL830VAAe+cA1fmyt
	tu5Sxpll6Gxozlx4GiJTZC8jrGeG99UAJ3SKPgcifq0qqeixfqln9
X-Received: by 2002:a05:622a:178c:b0:4b0:6ac0:c768 with SMTP id d75a77b69052e-4b0914d50e1mr16270641cf.30.1754444230379;
        Tue, 05 Aug 2025 18:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRPy+CB7VNKZJKeGujjW/TC3XEhIKX487sXoFYQjy1GNxVzzWwyH5iYaG7LsA4AjRzdpZUzg==
X-Received: by 2002:a05:622a:178c:b0:4b0:6ac0:c768 with SMTP id d75a77b69052e-4b0914d50e1mr16270471cf.30.1754444229806;
        Tue, 05 Aug 2025 18:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bd6esm2197151e87.6.2025.08.05.18.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 18:37:08 -0700 (PDT)
Date: Wed, 6 Aug 2025 04:37:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <to2hrxml3um6iep4fcxhkq7pbibuimfnv4kfwqzlwdkh4osk5f@orjzbuawwgko>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex>
 <aJHqpiqvulGY2BYH@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJHqpiqvulGY2BYH@trex>
X-Proofpoint-ORIG-GUID: vkUjwB1XltKgZxAE5LO7aK3645DO1jz5
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=6892b1c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=2yNqk32ZLtqgZHoNgFQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vkUjwB1XltKgZxAE5LO7aK3645DO1jz5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXxGfRbGYSnCU0
 mvnqVKqVGAKW0VfN6mV6c9OIhaaJGV7vjo/Cd6dvRxO/tKv7XLWyXS/tu/+dIw2bEt0bTAjBe1e
 6Y5UcFdltCLBKsKXhD5EynzGjReA+9g0pGZvLwuHfAyJkh0yauDbImTwVIoogHRvsoTFoNWMXA/
 G2HJ3ICB4ZP248NkJ3bR4uZmJgec1xcITaRgTFfmpjUjTijIWRc4wlIrW5mhw1DiDzI15O8NTkX
 FVgAF4PrjxnvLZNn/Tk0ak2ysnSkZNA7x2P8e3ZK76NgL2G2Azk1XCYBa21g+UGg0h5EZSmo1kI
 qntj/UwLpr9K1WpRRBgv9aB/PM2wQVI/LDctMEwgm6jn5iM8oGHHq4IORQtAMnxVsemUicVhVrg
 5/VDkXVQP7EKAydXC4K+y+5+wPyD/8IQnIBajwWmPqDBK6SU5eRrBF35xxn9aTv+3PL3c53c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Tue, Aug 05, 2025 at 01:27:34PM +0200, Jorge Ramirez wrote:
> On 05/08/25 12:44:23, Jorge Ramirez wrote:
> > On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> > > On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > > > Add a qcm2290 compatible binding to the Cenus core.
> > > > 
> > > > The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > > > encode at 1280x720 (HD).
> > > > 
> > > > The driver is not available to firmware versions below 6.0.55 due to an
> > > > internal requirement for secure buffers.
> > > > 
> > > > The bandwidth tables incorporate a conservative safety margin to ensure
> > > > stability under peak DDR and interconnect load conditions.
> > > > 
> > > > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > > ---
> > > >  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> > > >  1 file changed, 50 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > > index adc38fbc9d79..753a16f53622 100644
> > > > --- a/drivers/media/platform/qcom/venus/core.c
> > > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > > @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> > > >  	.enc_nodename = "video-encoder",
> > > >  };
> > > >  
> > > > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > > > +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > > > +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > > > +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > > > +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > > > +};
> > > > +
> > > > +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > > > +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > > > +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > > > +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > > > +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > > > +};
> > > > +
> > > > +static const struct firmware_version min_fw = {
> > > > +	.major = 6, .minor = 0, .rev = 55,
> > > > +};
> > > 
> > > This will make venus driver error out with the firmware which is
> > > available in Debian trixie (and possibly other distributions). If I
> > > remember correctly, the driver can work with that firmware with the
> > > limited functionality. Can we please support that instead of erroring
> > > out completely?
> > 
> > yes, in V7 I did implement this functionality plus a fix for EOS
> > handling (broken in pre 6.0.55 firmwares).
> 
> just re-reading your note, in case this was not clear, the _current_
> driver upstream will never work with the current firmware if that is
> what you were thinking (it would need v7 of this series to enable video
> decoding).

I'd really prefer if we could support firmware that is present in Debian
trixie and that has been upstreamed more than a year ago.

-- 
With best wishes
Dmitry

