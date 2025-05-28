Return-Path: <linux-media+bounces-33556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E900AAC7189
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 21:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD233BB747
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 19:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23ADF21FF5B;
	Wed, 28 May 2025 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hz7XNcFF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100121FF5C
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460621; cv=none; b=C51Oku1RuczMId0XryrsGowE8gps3TFAYKO4Xi9MGpzmU1WSlyW0Z2E7IX2tanPBR0422XK2rY/vY74LpcOfWg9n2CLmwyUm+lt+kiYLkHpbpOYBCTXeJSUyGroKxuEyE7TnUokIn4TRdvBNWesY6b3fahy9S9oQfzqBnL3eKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460621; c=relaxed/simple;
	bh=9a7taDi6YJsIEH9PJhW6rk1MO54NvLMSFZ/Si/C7zao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWWTij/DuNBJX/5TRDRUU09GR7FrS/Viw0UFWlTCgyjARYasTvZOGU4G3IK0nJXDaukayt9Tj/npfn9SdE3f1qO72BG+4MV7ATHbIu2s7K0egF8i94JoCr5McDiY5S5c2rbuYgT0Y1cr0b5ATh4hIOyL/sN2xtZHybIecTB67Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hz7XNcFF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9fZci018912
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dYek62dyvOVvt9xlqXtIG8N31i7/HWS2LPlC9nnWRs=; b=hz7XNcFFGf5nyAs3
	0+BiCcXznB4DBLoMtC7yp2+Pa8iTaSKCGYRLlu/+ROJNRVkGoIKeqHHxK/JEK8II
	NbTFEOXuJUj2OawRDDVDRLngOB1i3OxHmD0fGA9RWjB/BM7WpD9ncIZM6cXgjnxf
	hY+NjpVc2A7pj70RCSHs924GEXh2JsneJ1pkO58DVFjafmIpnl5JLm3Dd3WRBotI
	Dez5t3pg/0LlmF4G0Ah5sGIGrjUNirThmz9oqWZMWx20w30Ugr22h14MoRIceeBf
	oxaqzSAJSsKojaopGXE0SPQTiG01vqsq516/HB6yF08dmkDdPPmVdETU4EXksuZF
	HtmeIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549k9t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 19:30:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceb5b5140eso18382185a.2
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 12:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460618; x=1749065418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dYek62dyvOVvt9xlqXtIG8N31i7/HWS2LPlC9nnWRs=;
        b=AQq7UIfG+hIqKF/5G0NSsbqGYOT+safSynzdNgMmzy/f3QH6zKyeyoDwX0l/Bvh9Y4
         J/vnf6cTjfZUoecGxZ/uL6vrqYBkACWVfJ4WMkzNrOXN5ibM3UQ0Azvarqt3jj2n+fFR
         38mrvl7MGxC4131qvWGBZzgUpL6N01LBLO4VA0PKToLyS1Y6o29tXnNwnySlO+9rxBNa
         XHyCTSD5iq2EJM1/Eph/SdeXt37DlqI6ZyDEJJSGrwJBQjYgxhuw6lNyXuJvgiyHWe+t
         kYwNR+KmO2JsqVJixeEnis+P7qs3qSyCKtqTuW73yzkMKPZZERMOOePYvXCNZUZ9hjOG
         ASKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTI3jW9x+5YWG0KLkQTIcEV5zgXimlou70cNSXmdUouVmTCyaZ43RS91KMMphfPyVGrFjIwqZgGSTJwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4kwsGUU92ezQLwsFsdQGEd+G/gMNzW5+tztdLFGeYqfw5phkp
	MBuNvWkavL7EvqR6nf/m2lomnPk3VB52BG+rxWo/vXtSVraYTogdkYzMFbtH3QHcaOP2r6cYba1
	HUWxHg2DmuAO9ARqSt4/4HLqaoHj214o6h/KLor/li799Q+TWKOgXmceSWc/ces3EiA==
X-Gm-Gg: ASbGncthfna2yt7xefg2OItu27zP9B6YJefK1UqIDdQh/PqGYK/++6v9NDepp79oVoT
	jk0X2/+gNJnC+Nf5CdBns1vaEqkUJLQq99BqgWCMDFrrxt0hx/fUz45jGheHHzxXd451jSzBDqe
	WGbIUfT0+9rnYL6c1PBj87oCtbp+nIaFIl6KvYp20ZdcDglI1EnzgEmJMvi0jlcBte2ZNIkxRbV
	7616mO4icElHmnjb86BusV++C2qLv6TB94JQc5mUNKjo9PAFj8Ol9HWhOu513vXXsOvOnyzsCul
	Mi6017UZkSwFiUShW7mJc1UWJlHHLZgDgBqJMqL/XZhrFHXZQMkSES3cZrw8vwZI1jObiPz8rqU
	=
X-Received: by 2002:a05:620a:17a8:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7ceecc2b56cmr2504402885a.46.1748460617691;
        Wed, 28 May 2025 12:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfoSU4SaCfrPGg7RZkK/HaXU7Di8ga6qQaapDxAk5ayolH5wtQjI5WKNanYcHNN9iLNo+9fA==
X-Received: by 2002:a05:620a:17a8:b0:7c5:ee84:a575 with SMTP id af79cd13be357-7ceecc2b56cmr2504396085a.46.1748460617214;
        Wed, 28 May 2025 12:30:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm400477e87.234.2025.05.28.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:30:16 -0700 (PDT)
Date: Wed, 28 May 2025 22:30:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v4 2/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <6je6eryfahdmjspvouvgtaxtv5w76jll3sp4b6hel2syblathw@7i4lts7eoew5>
References: <20250218-switch_gdsc_mode-v4-0-546f6c925ae0@quicinc.com>
 <20250218-switch_gdsc_mode-v4-2-546f6c925ae0@quicinc.com>
 <cf244e11-96b3-49cd-8daa-df9c91435e6e@linaro.org>
 <0b188dd2-c0c9-4125-83b4-86fb35b237f7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b188dd2-c0c9-4125-83b4-86fb35b237f7@quicinc.com>
X-Proofpoint-GUID: Q-RnD3DTFb-TeihBZdmkhuKSalOUJsbk
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6837644a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=dtvwei4mXpa1ZmNgL6MA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE3MSBTYWx0ZWRfX0cFq+OS8HVM7
 mw5BoltUyCau84kVWk0b0VOc0TVHGbcJZJevCZ6cQVsMtHcTKk9u93WzWe75rsVGLKFEOpxIaAp
 paXM6cC152ov9g/qTPg+CA9Osn/epOU511xwxjcC/WUpQsKh2UFBytZduvfZXpjuD+p/UxINa78
 c0sT3R0mQDoP8LV3qEEFTXQ9WozTsgIdBYL5RMECeMdN+Fm7jMaEvG+2UeHX/NjKUKhGxe30t3c
 tQT7VbQeXK4zPUr/GQOrT+AoBg0PTX9/1gPPKXoJqHobBc/Lf7p3GnveXLvJ8AwdnvRfeCJ82WX
 R3zP1LZqg92QDekV7bXFWn/vlUULvaqDJ/Dhcn4EmKPPjQ7NH837XLVJ7oe6F0xyiKZwjT5cU4Y
 KtnEQy1MEQPRxwSDy7wETXUlVoMkgBTiXk5+sh+bnS2eHeZnBw09Y0g0/Y2J1X/95RjQyMUt
X-Proofpoint-ORIG-GUID: Q-RnD3DTFb-TeihBZdmkhuKSalOUJsbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280171

On Mon, May 26, 2025 at 04:26:25PM +0800, Renjiang Han wrote:
> 
> On 3/19/2025 6:11 AM, Bryan O'Donoghue wrote:
> > On 18/02/2025 10:33, Renjiang Han wrote:
> > > From: Taniya Das <quic_tdas@quicinc.com>
> > > 
> > > The video driver will be using the newly introduced
> > > dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> > > control modes at runtime.
> > > Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> > > Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/videocc-sc7180.c | 2 +-
> > >   drivers/clk/qcom/videocc-sdm845.c | 4 ++--
> > >   drivers/clk/qcom/videocc-sm7150.c | 4 ++--
> > >   drivers/clk/qcom/videocc-sm8150.c | 4 ++--
> > >   drivers/clk/qcom/videocc-sm8450.c | 4 ++--
> > >   5 files changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/videocc-sc7180.c
> > > b/drivers/clk/qcom/videocc-sc7180.c
> > > index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134
> > > 100644
> > > --- a/drivers/clk/qcom/videocc-sc7180.c
> > > +++ b/drivers/clk/qcom/videocc-sc7180.c
> > > @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
> > >       .pd = {
> > >           .name = "vcodec0_gdsc",
> > >       },
> > > -    .flags = HW_CTRL,
> > > +    .flags = HW_CTRL_TRIGGER,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   diff --git a/drivers/clk/qcom/videocc-sdm845.c
> > > b/drivers/clk/qcom/videocc-sdm845.c
> > > index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5
> > > 100644
> > > --- a/drivers/clk/qcom/videocc-sdm845.c
> > > +++ b/drivers/clk/qcom/videocc-sdm845.c
> > > @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
> > >       },
> > >       .cxcs = (unsigned int []){ 0x890, 0x930 },
> > >       .cxc_count = 2,
> > > -    .flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
> > >       },
> > >       .cxcs = (unsigned int []){ 0x8d0, 0x950 },
> > >       .cxc_count = 2,
> > > -    .flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   diff --git a/drivers/clk/qcom/videocc-sm7150.c
> > > b/drivers/clk/qcom/videocc-sm7150.c
> > > index 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780
> > > 100644
> > > --- a/drivers/clk/qcom/videocc-sm7150.c
> > > +++ b/drivers/clk/qcom/videocc-sm7150.c
> > > @@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
> > >       },
> > >       .cxcs = (unsigned int []){ 0x890, 0x9ec },
> > >       .cxc_count = 2,
> > > -    .flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   @@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
> > >       },
> > >       .cxcs = (unsigned int []){ 0x8d0, 0xa0c },
> > >       .cxc_count = 2,
> > > -    .flags = HW_CTRL | POLL_CFG_GDSCR,
> > > +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   diff --git a/drivers/clk/qcom/videocc-sm8150.c
> > > b/drivers/clk/qcom/videocc-sm8150.c
> > > index daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b
> > > 100644
> > > --- a/drivers/clk/qcom/videocc-sm8150.c
> > > +++ b/drivers/clk/qcom/videocc-sm8150.c
> > > @@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
> > >       .pd = {
> > >           .name = "vcodec0_gdsc",
> > >       },
> > > -    .flags = HW_CTRL,
> > > +    .flags = HW_CTRL_TRIGGER,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   @@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
> > >       .pd = {
> > >           .name = "vcodec1_gdsc",
> > >       },
> > > -    .flags = HW_CTRL,
> > > +    .flags = HW_CTRL_TRIGGER,
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >   };
> > >   static struct clk_regmap *video_cc_sm8150_clocks[] = {
> > > diff --git a/drivers/clk/qcom/videocc-sm8450.c
> > > b/drivers/clk/qcom/videocc-sm8450.c
> > > index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963
> > > 100644
> > > --- a/drivers/clk/qcom/videocc-sm8450.c
> > > +++ b/drivers/clk/qcom/videocc-sm8450.c
> > > @@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
> > >       },
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >       .parent = &video_cc_mvs0c_gdsc.pd,
> > > -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
> > > +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
> > >   };
> > >     static struct gdsc video_cc_mvs1c_gdsc = {
> > > @@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
> > >       },
> > >       .pwrsts = PWRSTS_OFF_ON,
> > >       .parent = &video_cc_mvs1c_gdsc.pd,
> > > -    .flags = RETAIN_FF_ENABLE | HW_CTRL,
> > > +    .flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
> > >   };
> > >     static struct clk_regmap *video_cc_sm8450_clocks[] = {
> > > 
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Hi @Bjorn
> 
> Could you help pick this into videocc?

This patch can not go if the venus patch hasn't been merged. Morover,
venus patch should directly preceed this one.

-- 
With best wishes
Dmitry

