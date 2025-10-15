Return-Path: <linux-media+bounces-44485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A7BDBE37
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E78D353760
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 00:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C76344C63;
	Wed, 15 Oct 2025 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dw5YYCqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF49502BE
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760487231; cv=none; b=EP5yR8c7f17hBthbwEPjJ/B1O4f0eGVYDwOCdVurL9mHG+PmKe8ZUAN9SWqMtHs/c3tFXsdGE/ivW1INmYibuQJ5kKAJH/FnbWW1EV5Qs/ny2OWw/IqUd2MgoaceEJLbcZ2o4wJJH7haQ77AQ8tQw6JtOshQ+pN1BeqBsSGCSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760487231; c=relaxed/simple;
	bh=cKDkNRbRQye9SCobwds6hQHh61wV4VK31p1ghM3oL0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWbOeWCqoEEe4ac4rlzjUNwAQjy0mvtwi+H756V9pgdOtMBBruXkeh9MFEY7HBouFxh7VZsglqsr/fslwZZdPnMOtvMG8tSa9lQLwGPzXYPXNiBDpiGR5R7t0IjbbsMuKQqkyLu4yu2rMkEZbs3cJgJ/rPeeH/B+gsWIH0Bs5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dw5YYCqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRKRE014093
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 00:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iARUFZXc8gCMdc7i/8Ow9Fiz
	sPpC/ZIAW4HsDsCSfj8=; b=Dw5YYCqxvnj3ZC2jc5aiKPIs+0jY0O2OQ3TIMR+m
	/DR91rsvOah5UhCyPSuBeADZeIgiCvmIRsfnGanoHQED4qVT/RDwCQoCU5S2oC1s
	Zj880rry9Kx985EuvkakShpPizAkGTMD3CVPBzIyKtPA2F9Id2nqr7N8vIr2cYh7
	rnOmMEW4d/GD9q7w90sjw/ZldAfHWxBLfjfbupk7DbotdZMw28zbUNLt3hHUxf0o
	jBeQ+c+Ma7ZKUkppd1iDeOEPH7SJmit8olHijGcffqCWl4R7nNp+zN1AfSTaam2E
	ihq4oRH4Qr3vVNfCc1ruwkjjmQJN61ZMSrtbNYZ6skzNDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkafee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 00:13:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-857003e911fso3010089785a.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760487228; x=1761092028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iARUFZXc8gCMdc7i/8Ow9FizsPpC/ZIAW4HsDsCSfj8=;
        b=Ay5XVISJGtd92jGjv4TzPUmyB+MsPGoZxFT1dVdeYbbOybJ6OhJBV4vzfiqiE0k3NR
         1O5Ya3Rjm4APVhvGYOmTOZfTtk+tu14hy5ktzJ1ABeZP5ZezMuRagJi23GdqFR7R1mFV
         EX4nyxseuiPSsyDLkJDFhL5edfKeT5BgON14vDnEvVUQ9M/eA3PBm+wcWWnkyoqVfDaO
         Xnyd5WBDCzh6+2Am1K2R/sxz/RBF0/sPoeNfRk6gnGjT1Y5fL+lssQcHQozqL4vuJ4sk
         fzVOG3e1ckKAYjXar7NrxE06HFC0ydjjhN5om93+nYkh/W6Fqdl4vZEkO/4XpPQ94Mk3
         7wVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLZYx/M3HQRX7fpW+kF1/HCoO54VZeX9GDz4cD0DRyo6IFF4hTS/OYx8TrfpDoptj5hGvyeYIOlmb8Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLct98Z62Dx/iGP8QKHFuGTuHPX3EZ0ViCAIqGlH5+AxDwHjX
	AIwpZMd78UezVdLqpI6YM3fKG8Gw5Hpx33mtRRB7VsGjYZcol+us89oUzLhG4UMHg0RIVNqel/b
	SybuUXVfOl3iTdXj2urCmluBvfelV+mDp/UyR/6CqSBdx9EOSKlTB25OKMu6m99ATtg==
X-Gm-Gg: ASbGncs4Gib4eMl/UzKCdT6JsWph7idu5FCEjDHgiwLI8E3nJxqWKm7QEgyeZAxMEO0
	dCsoYcSyDi1j+8XDm2r8aKH7qSHWp01OTkib6za6rEDG0syUTRto/lpQk2dksPmbiVrQKcUyTXz
	u5IHdNEhaIuKi5s0KnVQpfiz6mEgC0liEgXnj58b3OMsqqpgY8K+gJKjomKmeoAM0EidRIybjan
	xuWuqIKItU6+z8jxPfPrUQN32e3e15ALZ/VAbfce0uMXXLMFsHd9zewRVL7ExCF9YuXfeGupmEC
	5XPNHnBeKR9/TQsbn0xz99Mj+voQVJfMnodfjvXRcyAn8cysNRvsc99Aw9HXgTl0BYW9DH6M4GN
	oHNJZ/44gEErSTGty7kucbREtv61qVXEUGN49DdbJ5gBuSa53gFR2
X-Received: by 2002:a05:620a:710d:b0:827:e9b0:2761 with SMTP id af79cd13be357-883521db96dmr3761788985a.49.1760487227550;
        Tue, 14 Oct 2025 17:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdSyBkINIZUcXEQ2ol35aZyHvOmzevhJoA60ezIDdbGsbeJ7tDiBuc1768MTDcgexRTxuHAg==
X-Received: by 2002:a05:620a:710d:b0:827:e9b0:2761 with SMTP id af79cd13be357-883521db96dmr3761786185a.49.1760487227048;
        Tue, 14 Oct 2025 17:13:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3b31bsm43141211fa.47.2025.10.14.17.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 17:13:46 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:13:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] media: iris: stop copying r/o data
Message-ID: <j5za2knx6qmv6c7j6tszwpzawu5iugcnbgkfxptfxorm5zkzh4@ih3ylae7fngs>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
 <20251013-iris-sc7280-v3-3-f3bceb77a250@oss.qualcomm.com>
 <b97c5e01-f1d2-c3c9-8b9a-b5bb9a0c556e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b97c5e01-f1d2-c3c9-8b9a-b5bb9a0c556e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5M1faOcxwt9dzEFsHinGqQI2yAjQo09L
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eee73c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=F1KjMKo46gj8V_haTSgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5M1faOcxwt9dzEFsHinGqQI2yAjQo09L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzo+rGhPsI+Vw
 3Rd3gVhL9quIONyOwKWwLzhocO6LXCE8L4I/lT+5AjRU9Woiv8IClTqlzqlF7fC0Pcu3g+GXIsF
 jOaur4o3UFvwUj6+JTMwhkl8ICjd8fu+eeUJFY+l9BtklyP5JHIBDgXMQ/RgCSi4Qdo9R7Xd9jg
 PtXD8FsP5utJShgOwyB7MoYrzh1+nPKypqAaHR8ohEfQnEmai8azqb9uKb5BQTWvEOKL2yKsTCq
 WLAPeoi570jWUJLIM/LgLYl2eKfYnRdZrlJ35qw0PVe1gK+SKzgVsW99lnAAczeyLSk4DjdT6PD
 DECTC1XXDVpFUA41qRyu9gwuA23WXbiyElXJnXWWi/IpH9rMZCzJ4hj8lfzzHOwOmoDiZ5AfSBe
 +SNIzIoOkutQJiyrDcTEGWA1LkcgpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 01:34:59PM +0530, Vikash Garodia wrote:
> 
> On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> > Most of the platform_inst_caps data is read-only. In order to lower the
> > amount of memory consumed by the driver, store the value and the
> > corresponding index in the read-write data and use the rest via the
> > pointer to r/o capability data.
> > 
> > Keep all read-only flags inside platform_inst_fw_cap.flags and transform
> > CAP_FLAG_CLIENT_SET (which is being set per-instance once the client
> > changes any of the controls) into the boolean field inside struct
> > platform_inst_fw_cap_value.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
> >  drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
> >  drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
> >  .../platform/qcom/iris/iris_platform_common.h      |   8 +-
> >  drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
> >  drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
> >  6 files changed, 135 insertions(+), 128 deletions(-)
> > 
> > @@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
> >  		if (!iris_valid_cap_id(cap_id))
> >  			continue;
> >  
> > -		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> > -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> > -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> > -		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> > +		core->inst_fw_caps_dec[cap_id].idx = i;
> 
> Consider a case when one of the cap is not present for a target, then idx and
> cap_id would not match, and any further usage to map each other would go wrong.
> Please keep idx and cap_id in sync so that driver can use it as key to pull out
> from inst_fw_caps.
> 
> >  		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> > -		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
> > -		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
> > -		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
> >  	}
> >  
> >  	caps = core->iris_platform_data->inst_fw_caps_enc;
> > @@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
> >  		if (!iris_valid_cap_id(cap_id))
> >  			continue;
> >  
> > -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> > -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> > -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> > -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> > +		core->inst_fw_caps_enc[cap_id].idx = i;
> 
> The above comment is directly seen on encoder, where the cap_id in platform data
> is not available in serial order for the given SOC.
> 
> For SM8250, the cap_id 3 is not present in the platform data, so when idx 3 is
> used as cap_idx to pick the cap from inst_fw_caps, it returns 0 as the cap_id,
> which is incorrect as it points to first cap in inst_fw_caps. This happens for
> all cases when idx is used for cap_id which is not defined for that SOC.
> 
> [ 1234.157453] iris_session_init_caps: cap_id: 9 idx: 0
> [ 1234.167761] iris_session_init_caps: cap_id: 1 idx: 1
> [ 1234.178240] iris_session_init_caps: cap_id: 2 idx: 2
> 
> ===> cap_id: 3 would have idx:0

I see. And this is the reason why cap_ids starts enumeration from 1:
this way all missing entries have core->inst_fw_caps_*[id].cap_id = 0
and are ignored by the rest of the driver.

I will see what is the best way to handle it in the driver.

> 
> [ 1234.188498] iris_session_init_caps: cap_id: 4 idx: 3
> [ 1234.198734] iris_session_init_caps: cap_id: 5 idx: 4
> [ 1234.208954] iris_session_init_caps: cap_id: 16 idx: 5
> [ 1234.219354] iris_session_init_caps: cap_id: 18 idx: 6
> [ 1234.229735] iris_session_init_caps: cap_id: 20 idx: 7
> 
> >  		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> > -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> > -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> > -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
> >  	}
> >  }
> >  

-- 
With best wishes
Dmitry

