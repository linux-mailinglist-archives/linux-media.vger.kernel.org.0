Return-Path: <linux-media+bounces-44015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8151FBC6785
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 21:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F499188F6FF
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 19:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A253267B9B;
	Wed,  8 Oct 2025 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW2qTIbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062142690EC
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759951547; cv=none; b=i/6x78nXha6OIhnA6PInC3zK3Hq+a47/50iiALe71Dg0ixHL/lq5SXKbBmrpn9znZFHYdaMcyB5cSeSVyBO2mh9wpOTFefSIB7ScJzmYX581VItzgz6ripM9l04COVjndBdjrYE8VpA8UBuVlgSdzDHS/rBE2BfHTWSKDTJNUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759951547; c=relaxed/simple;
	bh=wF7FX+MKooFKcpVioZvIboqah4uI93BiDIm8X3C/Fak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuPA6DHd+7vPI1bl6DBDndcKMYEBAwlvcNJ6tgJB/9BpcAi08QzjgBYSm/zDi6kOVg0xUx+KG/7h01S8/oyA9mRUHJMfbgSk0XvEFSy3b0ZjfTuC2RfQRI8tT+cBaNWN7XH3Lu4nyWtfmbj1poG9NFDKjt1ildG5jk+WWqBy5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW2qTIbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5NDZ006866
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 19:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5FFib/Un+fm0UChWoIvNR/aK
	HufV+fCUOptgdpGnyRE=; b=YW2qTIbPM4p8KUQBcJY1WJMKL43qYmd535U1G/WF
	mseiN7BiirF8ANGeqv47gcT3qbLQYJThX+/gzvelgLrwKT+0vVSHgVkjh4FZVTVR
	CDze0BgKqdSgwlFpyfjgzXDbuzZuryRSwMQKYow62gMAqWVe9L7O4W5nqHyT8dkE
	55s2mpQz+YIqyvNJMgZRbRB16zGB8Rdw9C0jnLPlpfnsOR8LLyb1rQj9ulbXgXFn
	qPxdpndBmFxP6fspbbQl9Hr+MhLXCRNQr+JYGf4e/Sgtk16z0m2LaIm4uaglcx/r
	MF31s1ME7JLVTTg5Hk9/O/I4LoiGrubD+Q70ykQSVvgiNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ngcuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 19:25:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e5739a388bso4815171cf.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 12:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759951544; x=1760556344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FFib/Un+fm0UChWoIvNR/aKHufV+fCUOptgdpGnyRE=;
        b=FbXBZUpjXfg/mYTEJi3eyDPiGHUvxYLet9DM7D/TqtqH7VJxXFGhZVWS/TALkQwHs2
         cyy/YvjeaLlBGUJjnJfoP/J/fMcQhgxpy9I355Kn/4DQ88nXgq8vPC51ZadBGAJtJ5ID
         Dc4HYQId75TyuoheDZuO0a/wAYvv2EX7yU1hKamW5Ehs3+cTc7gsrfwtpyPwnIunSPw+
         ahJ/E5Izjmzy+/Bedr/bR7lj6vUt7v0WcUfxB7H3AqCzoJhPbx8tDDnC2FNa7ncc+sAr
         /fo902S674RxZGqPLkr8oI1/VUuA6ARsaZYtE8Jn5ejeS8hj0AtoA8tTu3FA54EiFPN6
         3lRg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Old9yd3yNRLIJCoMVQyMvV4RLEA9VKBcKT0R3F/OzW0vJo7RLCM5LkM6XfkxZcb31Em5mn9jvj56Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSw9UGkUSo+BRctXTqolVmMxLq81OWQmbFyvGPuIc0YoCVmMU
	/GJyFCpVPJIelkdw3pnyw02avsdaxriRwzM0qZ32mHQE/sx579q+nzp4lrZLn+3H3nagehVNzbH
	F8rzsyFpxBRRVGLKFQYsbRDYgEW2pqLefSaaNQwLLDC11ML/BlbzaQER49YU8JEvYVA==
X-Gm-Gg: ASbGncv9Rj4H1zen425oFfZxTWmlNv0IkwZ0ta2NMw1q8zR1jF982AWkrQ/qmqmkXnn
	DuFPFZU9V6sNUMqd1u2rkgR5fhmESDGq1ciyEMmBP1GRq1i/gfV4AxEAe0wQxfp8fRt2CgnR/Uy
	yrXaqVJ4xUVHKS6AnrdINH8S65wURGNlkbw1T7Wj0jMkh/y+cq0pu4rviGbOUmBPtHzyxXkKYl0
	w1qEm0URXrcyA9jZOAbp2Pz0kZfPA/RLP+Ct6XSv/Mjb9fjB4uA8HWXgBrL4/yDs+fmb5Pu/2uQ
	8b8+XHem7pOUn2uKUV/EKD4aitvuN4Bu0+yVrs2QyAOh7PSZUS7TuvAsYzLtuUXHgMe9kPGr8oI
	az42yEZ5b5XidAs9EzDqXEk60w3ClMuTF1dcrWnoyoFJK5XKC6hz6ELzyjw==
X-Received: by 2002:ac8:7f81:0:b0:4dd:e207:fbe with SMTP id d75a77b69052e-4e6ead63344mr56475191cf.68.1759951543920;
        Wed, 08 Oct 2025 12:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFvT6+SeAUZgbncIUVE+m9s6rkb0Hrmb/CnGS8ndTfP4LoIjq+9senbSZ9FFieCiiwryrGkw==
X-Received: by 2002:ac8:7f81:0:b0:4dd:e207:fbe with SMTP id d75a77b69052e-4e6ead63344mr56474481cf.68.1759951543152;
        Wed, 08 Oct 2025 12:25:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adaaff0sm272423e87.88.2025.10.08.12.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:25:41 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
Message-ID: <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxOH/ea15+GSZ
 kOcQfZmUzDHETXc7esb3atcWIgNSwOZxx+smr3UD03fmOVxBkddWI/4VNN2UCYHkXZ9zSbwU6Bm
 HdUlBkeOzt2qusrp1eH6P1OjFxcNns34Zg3BF9y8iW6y1gAzcMLGdZecQ+NQML2ewSm/dXErOHR
 gBj3+zBHb+C5dCsO1flkaKGVuuH1FVyKFofCZpu5ZGUTCBDVLmZ7gC89FmZcoCOiqdXfxTKgExg
 2298EVkhPx11q9nIwdnScwhSsLVRdt7LAoYS4Msr/RD8k00zS7j1ECJ5eJjfCyZTR7uS5rFVjMY
 SPSMZF6kQ8FBl1zobNZzzTXNetEPjCFhSztSG30HmOayT2oaZ4UDpp5k/ncw53yPxl0uXsRph7/
 RnWYJ1MDTrZnHphCkdAFsMHVcyptSw==
X-Proofpoint-ORIG-GUID: fHfYW_x8deFmuuyYwRf-L3HG43qJFzIV
X-Proofpoint-GUID: fHfYW_x8deFmuuyYwRf-L3HG43qJFzIV
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e6bab8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=-ppHQGl4qNkU3gb9WSAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> > As a part of migrating code from the old Venus driver to the new Iris
> > one, add support for the SC7280 platform. It is very similar to SM8250,
> > but it (currently) uses no reset controls (there is an optional
> > GCC-generated reset, it will be added later) and no AON registers
> > region. The Venus driver names this platform "IRIS2_1", so the ops in
> 
> Which we've learnt in the past is "IRIS2, 1-pipe"

Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?

> 
> > the driver are also now called iris_vpu21_ops.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../platform/qcom/iris/iris_platform_common.h      |   3 +
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  |  66 +++++++++++
> >  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
> >  drivers/media/platform/qcom/iris/iris_vpu2.c       | 130 +++++++++++++++++++++
> >  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
> >  5 files changed, 204 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index 104ff38219e30e6d52476d44b54338c55ef2ca7b..36e33eb05a6918de590feca37b41c07a92e9c434 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -42,6 +42,7 @@ enum pipe_type {
> >  };
> >  
> >  extern const struct iris_platform_data qcs8300_data;
> > +extern const struct iris_platform_data sc7280_data;
> >  extern const struct iris_platform_data sm8250_data;
> >  extern const struct iris_platform_data sm8550_data;
> >  extern const struct iris_platform_data sm8650_data;
> > @@ -50,7 +51,9 @@ extern const struct iris_platform_data sm8750_data;
> >  enum platform_clk_type {
> >  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> >  	IRIS_CTRL_CLK,
> > +	IRIS_AHB_CLK,
> 
> Interestingly, 8250 also has an AHB clock, but the clock driver keeps it
> always-on..
> 
> >  	IRIS_HW_CLK,
> > +	IRIS_HW_AXI_CLK,
> 
> This exists on SC7280 and SM6350, perhaps as a result of the bus topology

These parts are still a bit unclear to me (as well as resets usage for
sc7280).

> 
> >  	IRIS_AXI1_CLK,
> >  	IRIS_CTRL_FREERUN_CLK,
> >  	IRIS_HW_FREERUN_CLK,
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > index 2b3b8bd00a6096acaae928318d9231847ec89855..d5288a71a6a8289e5ecf69b6f38231500f2bf8b4 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > @@ -364,3 +364,69 @@ const struct iris_platform_data sm8250_data = {
> >  	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> >  	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> >  };
> > +
> > +static const struct bw_info sc7280_bw_table_dec[] = {
> > +	{ ((3840 * 2160) / 256) * 60, 1896000, },
> > +	{ ((3840 * 2160) / 256) * 30,  968000, },
> > +	{ ((1920 * 1080) / 256) * 60,  618000, },
> > +	{ ((1920 * 1080) / 256) * 30,  318000, },
> > +};
> > +
> > +static const char * const sc7280_opp_pd_table[] = { "cx" };
> 
> Wonder why this is different..
> 
> Oh, I can bet good money SM8250's Venus isn't fed off of MX alone..
> 
> Let's check the sauce..
> 
> It was always supposed to be M*MC*X with MX just for the VIDEO_CC
> PLLs..
> 
> [...]
> 
> > +/*
> > + * This is the same as iris_vpu_power_off_controller except
> > + * AON_WRAPPER_MVP_NOC_LPI_CONTROL / AON_WRAPPER_MVP_NOC_LPI_STATUS programming
> > + * and with added IRIS_AHB_CLK handling
> > + */
> > +static int iris_vpu21_power_off_controller(struct iris_core *core)
> 
> This is 1 : 1 the existing sm8250 code except...> +{
> > +	u32 val = 0;
> > +	int ret;
> > +
> > +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> > +
> > +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> > +
> > +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> > +				 val, val & BIT(0), 200, 2000);
> > +	if (ret)
> > +		goto disable_power;
> > +
> > +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> > +
> > +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> > +				 val, val == 0, 200, 2000);
> > +	if (ret)
> > +		goto disable_power;
> > +
> > +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> > +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> > +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> > +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> > +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> > +
> > +disable_power:
> > +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> 
> ..for this line

Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
iris_platform_data.

> 
> but this could be added to that one instead, since both clk APIs and the
> Iris wrappers around it are happy to consume a null pointer (funnily
> enough this one returns !void and is never checked)
> 
> similar story for other func additions

In fact, initially I had them merged, but then I couldn't find an
elegant way to handle AON regs. I can squash them back, if that's the
consensus. Any idea regarding AON regs?

-- 
With best wishes
Dmitry

