Return-Path: <linux-media+bounces-38916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632CB1B22F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9664188F403
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B52223E356;
	Tue,  5 Aug 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZxJetnW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE0223BD1F
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754390669; cv=none; b=k/I6L2zQnPxCMLAtwc/d9GJVpsB2QIJGMXiMO6d3Ue3WTGSf7kUxYQD7gCqFfYRsOBbVzKkqzACV9zSleJuNUPR8SzoiG1JJLd4auFGZMh/QyCbo95EKVyYvdqcQUSdvZQda53zIvhUb8/A/WCnTL3UWX+haLpclrbx2PSFtKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754390669; c=relaxed/simple;
	bh=xMNNkjuSH+3HYtbiIl/ollmFmRenFvaiHSjwqXnvo7k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AURw7P7tojpfI5DUK5cdERxKzHTDc+yRKeBagujfbfRmMmvM1lWl+y7biCH92kHjvECcXo95QYuO8VdmrLEWqauNV0QHydfFUoAej+2VpApI2jIbP+/eZVpU4f0zjj822xCw3DqjFVEAPWFuxvITG2f/HyBGbyUg4JLMHFIssNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZxJetnW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575787RN027493
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 10:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rxC9YEhF7HAygPUX1sY/MO8v
	Fp8TOmYu1uxrDnl8C1s=; b=TZxJetnW9Ot2Rc8/0i+mRkOdGAqLaeIOByVf09NP
	Xg0QjaSfXfPnI/SHy2TUb3bjnW+G9TGKzi7vSxIbpLM7sNFjHGhLwWGXBmV8MnWU
	VlrHfXLaU0wFsSu+nRbx0f3yxHpYvNlb9ycMKGcVoV4NTkvyOKD7eu4/0NnvNF2g
	lxOml6dn/SWpRVxG5c1lhyyByHlsKtIHSVA0vmTMVSNTUsAMqZcAOgx/KzFag8BN
	jlUeP6wk6zLu/pCB5r+yBcu4MRWEz6UGMJ9B80HPt7p9VT0G+CLjPIb7D3HlsyTv
	fmMr8DXKwnBJ4yBngQhZk7dYD/YimVORxcII3Xtr0D5UNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bd9w8m60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 10:44:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af22e50c00so58998331cf.1
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 03:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390666; x=1754995466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxC9YEhF7HAygPUX1sY/MO8vFp8TOmYu1uxrDnl8C1s=;
        b=PgDhM1gx/qlZRlNraOaHFJD+X3FDuQP5tQEHrcwdHgK673c3+kX+y3pEodpQ8aZsrv
         YcO2okBnz/SSQVePoqGOg5eizuGvx1U49HXjf0SnizG0RN6XVS9sgiBf5N930lnFDfKW
         7EeLC0F4/g9+OakEloQbG/dE4thwnsTwmy3Jj2DdKyIyRDGE7E35lnUOQfQ0S588hHlg
         GYeN5AGJ7GBKBkT3soE1H8k3LNYzGDcSYRzLyCrH8ZF8rcvKZUDPYKclyiDeQa4ADabw
         0vTf+/JzdMZMo5cp0wT0k8AZnP4aO9+2ihJwJ/1juGcjamfdihRKdNSLSkQcmbz3UHsT
         S1AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3FoDQQKp2EwguG04O6RsD7ZGAhNuZrGeDsShOc4fi9aV/a6FeC3BwYHBjQLVDezFX1d0fChd/PZyLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rNDcJqmLSSbq8cYH62oKs0W3sT0xZwrSHa77zZM6TQrw93SI
	w+hyD72GQ1/YeI3ZBbOj5uPJ0o8CVQCWrfWQeYcijenP2bPniJjGDvioWDfV5brkq6kUMKRl7z/
	UvF+d6EfxYcv4E3dXD2RcxkOvKUMtL3AIHNgghgfZ3dQC6cm9oJDT24mrjp83XaEwIukcMpbIaY
	2Q
X-Gm-Gg: ASbGncs9g/Nshq7CflAvkOx0wRwZOBpuM+YFfHEKgrbsorTr+vxttao1W96Ov/+tOuX
	FYBj/vKYXC+M0aN90CYSk2YFc0btjJK4MdUbYD3xUWy41T/OSWgwMTQcfK6m6F/zNEpdTiWk/mu
	LRUJNnUBTXX54547KGsCd1axjl5R120nxXgEQF39o7k1uVU1zPWhWxjVf35+1nZ9c2eeuvi3xs+
	VK1/Gwv/drDWqisAYIDTb8ArUigF+lzWy3s5yRgnw+OqBYPGutYDU0282ReRZYYRy6oNxnCuYl3
	qSO9PTL5pBtNMOdd2YmDzdljqlteO+1b8Ow/kI0hMUbXvQOBp0RW3N0NHIDVxpUY3phW0g==
X-Received: by 2002:a05:6214:dab:b0:705:816:6179 with SMTP id 6a1803df08f44-709362d810cmr182505106d6.38.1754390666042;
        Tue, 05 Aug 2025 03:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP9CTM5JXUtM9Z6l08Gil36MWqvJFmbSlsYeDtXThdsrHNGHHg9GP8BD/fDSOt/tjYpA41+w==
X-Received: by 2002:a05:6214:dab:b0:705:816:6179 with SMTP id 6a1803df08f44-709362d810cmr182504726d6.38.1754390665534;
        Tue, 05 Aug 2025 03:44:25 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459d7d722dcsm83892505e9.24.2025.08.05.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 03:44:25 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 5 Aug 2025 12:44:23 +0200
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aJHgh8mon9auOHzi@trex>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
X-Authority-Analysis: v=2.4 cv=NN7V+16g c=1 sm=1 tr=0 ts=6891e08b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=KpVMlk9tmVbli1cETwMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q8WzLI70DaAdSC5PRWK8k9KX3zFLMv3f
X-Proofpoint-ORIG-GUID: q8WzLI70DaAdSC5PRWK8k9KX3zFLMv3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3OCBTYWx0ZWRfX5i3dyk4SvYcg
 Q6DTZqdPEBG0J0fBZgtX/G18cp/q82GvDqEGmumEJQIxs+fAtRHFojzT8wVDjSrhsaJ7TeG2ypY
 LcWQFy3K7/sTpOflGSCBYQeNdK/arUMB09q+7v9GX9btbmKM+LMzNo3Hq9QU3Bq8rvKJVZju9y6
 gp7qy6CcyxAzVDvgQ3FmWKpVircmQ1mAq94QJHA+rl7wEe3FQrC4WaWyRhIcoeXiupO32sOKBtf
 nFRLr+jHTKEBk2ZkLJCV0xkTgyot+poQoGr5W5cfOTd7WsMi2lSd5Mm/CdOGox9bg87x6nTyk7n
 QDZ1oKnYXvZ1cPqiA1eWZAgiSWMCg9Hc0A3PIIaco+XtbmoEpS2tf2TwVc/8yKUTm+KWk7v2T5B
 QJxjxgKQOjX+hwZ5YpN3XygMGN/98KNW+rUV3PYRHbSg70gTOsniYWk4tAgx0aKN2KlxZf4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050078

On 05/08/25 13:04:50, Dmitry Baryshkov wrote:
> On Tue, Aug 05, 2025 at 08:44:28AM +0200, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the Cenus core.
> > 
> > The maximum concurrency is video decode at 1920x1080 (FullHD) with video
> > encode at 1280x720 (HD).
> > 
> > The driver is not available to firmware versions below 6.0.55 due to an
> > internal requirement for secure buffers.
> > 
> > The bandwidth tables incorporate a conservative safety margin to ensure
> > stability under peak DDR and interconnect load conditions.
> > 
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
> >  drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > index adc38fbc9d79..753a16f53622 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -1070,6 +1070,55 @@ static const struct venus_resources sc7280_res = {
> >  	.enc_nodename = "video-encoder",
> >  };
> >  
> > +static const struct bw_tbl qcm2290_bw_table_dec[] = {
> > +	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
> > +	{ 244800, 413000, 0, 516000, 0 }, /* 1080p@30 */
> > +	{ 216000, 364000, 0, 454000, 0 }, /* 720p@60  */
> > +	{ 108000, 182000, 0, 227000, 0 }, /* 720p@30  */
> > +};
> > +
> > +static const struct bw_tbl qcm2290_bw_table_enc[] = {
> > +	{ 352800, 396000, 0, 0, 0 }, /* 1080p@30 + 720p@30 */
> > +	{ 244800, 275000, 0, 0, 0 }, /* 1080p@30 */
> > +	{ 216000, 242000, 0, 0, 0 }, /* 720p@60  */
> > +	{ 108000, 121000, 0, 0, 0 }, /* 720p@30  */
> > +};
> > +
> > +static const struct firmware_version min_fw = {
> > +	.major = 6, .minor = 0, .rev = 55,
> > +};
> 
> This will make venus driver error out with the firmware which is
> available in Debian trixie (and possibly other distributions). If I
> remember correctly, the driver can work with that firmware with the
> limited functionality. Can we please support that instead of erroring
> out completely?

yes, in V7 I did implement this functionality plus a fix for EOS
handling (broken in pre 6.0.55 firmwares).

This added some complexity to the driver. And so in internal discussions
it was agreed that it was not worth to carry it and that it should be dropped.

I'll let Vikash and Bryan comment on the decision.

> 
> > @@ -1080,6 +1129,7 @@ static const struct of_device_id venus_dt_match[] = {
> >  	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> >  	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
> >  	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
> > +	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
>
> Please keep the table sorted.

argh...sure

> 
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, venus_dt_match);
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

