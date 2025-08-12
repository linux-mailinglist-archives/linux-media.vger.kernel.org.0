Return-Path: <linux-media+bounces-39570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A92AB2240B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A92FF1AA3C4F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193132EACE8;
	Tue, 12 Aug 2025 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICbAEpAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60FC2EA753
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993206; cv=none; b=kaqFhTWEaNFUjEruAdtK/bfYmX1sBMyRVCeuRYL3VOvnp8n0Fge4q9x0oaBhzLnqYKfC7dsKIT4c0UPWgOSHgkfH2abgQAxRiGIdz47NQc2cqKjLesAVrhB4S4pG/qSNeypyvM5tPv2Z/r+NehvBpQxyGW5RPJ40pGDA+G5JcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993206; c=relaxed/simple;
	bh=p86wGcuXouV66IvwXNLN1S5SQ13PEZX8gi4dx6Jnpzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/do1ZSn+yc9JpMbxZG5KPQOtsxxLHB4I0jlwQWgMj0zQlQF3luHL9tPIiImSJg3+PVNMt15N7RaBxLrBziGf4PiACa0ZgvkthKvC1irzsblTHaceuorIX3R7Qxj41nktli6KydE0nWVrhHiDvtKb1yZB/M7SZFhljyP7UNkYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICbAEpAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4oMxJ019083
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 10:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8T8ZatYaGf8wMEcyEX+SVkI
	kdVBoSOYx1hxOAACmEE=; b=ICbAEpAuy0MSvABsrlO/4K/W8IleGPdGZWCoTe7x
	AYKCE2rZpFDnGwb7w7DsRmJuF59YhjkCtvT8AeGwhD2EZJiHUCOpCSvQ1NFTeY97
	NWX4MCIMsSx4uaGbnFSP8PCGVHNSN1kghrClnjR0NwxYRfaLBXDU23/edu3anooI
	dNCHDQLQmO2iOWlQdQO+gvcQWMwURez70bn2FuDqnZJxk9WldZj/jLLAh99bletX
	h+q3vXQ2fgJ59T5QQmfP7tBVqcCDvdh6FQ+rFwWqq09cveP2Xgl8r+SNyrBvdDdu
	f4xA0WEa68Hv0Wp+YDgmp4wP8J/Yp/qHD8tOL/QpKrI0yg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduypvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 10:06:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af156a27b1so200704231cf.3
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 03:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993203; x=1755598003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8T8ZatYaGf8wMEcyEX+SVkIkdVBoSOYx1hxOAACmEE=;
        b=nDJmT9B9L+sWRcA9ZoM3mezXAvE6fUSSgYyKPZuf4Tz07lBhGErYbe5kDhWZQhSqG5
         sxhpZAZHHzvPMPQG+9stXeWmsxyLvDKBv1csLAlrLbTeY1I7OwOgaHT8uHE71GDTATG2
         aUN6ibqsVdUJv7h5zG010hZ3g1fXbAHwImeT75jCqudbLSPVPMtrgmpyx5hgQ2mtAWJZ
         YLGmwzPxMkgW7yUJlHm/IXX1fW9OmP6nmXzoYs/NkmLDwYflnLLLtv71oInptEJxEKyD
         jDbOt/azvxdq1ugK1EPkM+Nk0UElLmo3nHm17DlRozXx1UPvZZj0aDnjKmRVEFk3mzA2
         oDTA==
X-Forwarded-Encrypted: i=1; AJvYcCXZXLaq6IuW4+DndDRgMKP8QTWB7pvQP3moAZ2CIfMBO3CuAH50lHP2erwyh7jwOsSVYF0IA+sMckpd8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbgy9Njd1E7uo6M0J3/PzwD/ZJ22rzTT11jUOF27LBIt2kNJMq
	f1MIIhXTNcdz/nwLBr7tmc3/tAMFpWp6+uk5M0IySz4HIx2r0f7QYogt8GgCz8jKanxQPt2mPuK
	a4tgSJsGKHDMAQ3am99IH1BeMgJ5oI/zRodqbMcr7DoLbjqYXaA4bjzPZTLcDCJ/QtA==
X-Gm-Gg: ASbGncuVUlXYKIWwnwGFKRGqenJeCi2Giqp69hlAuyy32sPFd/2u/6ZX3vc19lgwCq1
	0UWsiCJ0bl3BXd3W/z7nmZggfRN4aNeCIMKNu9Pr1fLx7M+U6pBrAPI8+DRjm2YeRf6ER7I2aPS
	KeCdyvnQE4ez1XK97PPDC1YtmoYWPaUQVmv2/EMBjtCx8p+K48pZkI6RWjG6MJBQ3fzfPu2+ww2
	j0AOO2kEzteGLcwIHbKW6StGaA7e7S8C7A/yuRIJbXe4YFWlzja6VPguo4vB2+ZL97LrurHhwJt
	5sXRLBBdRaRdJxyzw7Lqc+HYiU4eqRRPP3y/v16sI4k07+TMf0OO8d4L/3Wfs9dpOd09jrEJGl5
	qIrPM7jgDhV4G3fTaILWvjX/e7wZK7ycvUX8WYpa2itEaxxvbMqj6
X-Received: by 2002:a05:622a:993:b0:4b0:7b80:4759 with SMTP id d75a77b69052e-4b0ecbdfb41mr34851961cf.20.1754993202569;
        Tue, 12 Aug 2025 03:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMlxzUMM54lZpUCjMGfkRuTDxqeDDulNqKujbwTvnh1hN5pHNNiRG8zIikUZyWOyfTNB5HMQ==
X-Received: by 2002:a05:622a:993:b0:4b0:7b80:4759 with SMTP id d75a77b69052e-4b0ecbdfb41mr34851841cf.20.1754993202166;
        Tue, 12 Aug 2025 03:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bb4asm4657815e87.16.2025.08.12.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:06:41 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
Message-ID: <hosfuvk34iolc4ylzqu2pyoozomw4nzirlfdj54x3777eyuok6@renjfbqznl4r>
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
 <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
 <e08cb2a3-e96b-4b06-b56e-0b630cff38fa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08cb2a3-e96b-4b06-b56e-0b630cff38fa@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b1233 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=SCioppmI-r5X7Irv_ikA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: koh7U0YstoY0I5Yom8zaAlyo4xJooLSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX9fcFLxVpRnLs
 SuQrWH4NPHQPcaB6A+mFbrVXk0ZeUvppsHN9KvOKZn9KlgAiSLwTYnRMlhqxC3kula8CXedxLof
 rCM3qM0h4LKTIihhB2rlzct9+fVk8G+nP10+6ddNlB5TdFC3bu8pTpniD3uul5H+g3Jg5Z0H+Qu
 pLJyE7GcIXqbeF0G1fOc+Z0o/FAd6eDscLIv9ee/WTubfNkQOvKuYNyHp70Odb6DHzdjDMx3VtU
 aCZCVf9PTuBhS1pWdYKaVwB34vv6PZLpJbNozthEpZKJo6EQgKpbaUYux9Z/bOEabehjwVADOuH
 tLCABbHeCeD1iMflNqJN+BsJo1IaStNW53MM4NAHsncT5eeQRsg7mNn1NYvT6aXUPmqEG4RIfAv
 +PT67y4a
X-Proofpoint-GUID: koh7U0YstoY0I5Yom8zaAlyo4xJooLSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Tue, Aug 12, 2025 at 02:05:55PM +0800, Wenmeng Liu wrote:
> 
> 
> On 2025/8/11 18:39, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 03:24:55PM +0800, Wenmeng Liu wrote:
> > > Some Qualcomm regulators are configured with initial mode as
> > > HPM (High Power Mode), which may lead to higher power consumption.
> > > To reduce power usage, it's preferable to set the initial mode
> > > to LPM (Low Power Mode).
> > > 
> > > To ensure the regulator can switch from LPM to HPM when needed,
> > > this patch adds current load configuration for CAMSS CSIPHY.
> > > This allows the regulator framework to scale the mode dynamically
> > > based on the load requirement.
> > > 
> > > The current default value for current is uninitialized or random.
> > > To address this, initial current values are added for the
> > > following platforms:
> > > SDM670, SM8250, SC7280, SM8550, and X1E80100.
> > > 
> > > For SDM670, the value is set to -1, indicating that no default
> > > current value is configured, the other values are derived
> > > from the power grid.
> > > 
> > > ---
> > > Changes in v2:
> > > - Change the source of the current value from DTS to CAMSS resource
> > > - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> > > ---
> > > 
> > > Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> > > ---
> > >   drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
> > >   drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
> > >   drivers/media/platform/qcom/camss/camss.h        |  1 +
> > >   3 files changed, 30 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> > > --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> > > @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
> > >   			return -ENOMEM;
> > >   	}
> > > -	for (i = 0; i < csiphy->num_supplies; i++)
> > > +	for (i = 0; i < csiphy->num_supplies; i++) {
> > >   		csiphy->supplies[i].supply = res->regulators[i];
> > > +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];
> > 
> > Could you possibly refactor to use devm_regulator_bulk_get_const()? It
> > would save you from this data moving.
> Initially, we were aiming for a minimal-change implementation.
> Consider refactor for save data moving, will be refactored in the next
> version.
> > 
> > > +	}
> > >   	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
> > >   				      csiphy->supplies);
> > > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > > index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> > > --- a/drivers/media/platform/qcom/camss/camss.c
> > > +++ b/drivers/media/platform/qcom/camss/camss.c
> > > @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
> > >   	/* CSIPHY0 */
> > >   	{
> > >   		.regulators = { "vdda-phy", "vdda-pll" },
> > > +		.regulators_current = { -1, -1 },
> > 
> > If it's unset, it should be 0, not -1.
> I considered existing implementations as a reference:
> https://lore.kernel.org/all/20220804073608.v4.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid
> 
> but based on the implementation of regulator_bulk_get, setting it to 0 seems
> to be a better approach:

Ack. Also please try to provide a sensible value for all platforms, not
just the most recent ones.

> 
> drivers/regulator/core.c
> consumers[i].init_load_uA > 0
> 
> Thanks,
> Wenmeng
> 

-- 
With best wishes
Dmitry

