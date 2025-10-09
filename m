Return-Path: <linux-media+bounces-44108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C06BC9AAA
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA01F3A32A2
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526322EBB86;
	Thu,  9 Oct 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISIQh3tL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BB4A06
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022022; cv=none; b=R7Vk0OqmTccLcpLQXcUyDcjdt6ePekn73jwwHaMtrYsq3C1jswMnyniaNh2aEVrHBVlPbZqLO3RVfRvqytIYfdW+ycWUCEH3XNsHPC77YDM3eo1ZwdZiWPFAENUpshwfNHXppI2R3FapOgDVt60dqww3aIOaEVWCezLXFZ1rk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022022; c=relaxed/simple;
	bh=oQjcIWctgbJPLlW8Qg4pVgJmyLYFTvKpb037ktt4Fko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLkfqeu3HTydasYsZLH+ojPIlhntGG4tSSdxApTTaU4wRACntoTDydQeY+6Zhq3HtkRk6KjWJ2exzcSpjrEbF6UDiu+a4v6MZDAb/IGydQKRmSxVDzoEWLt5PdwTyymyiheSeA34MqzZm/VDDfxCi5EHJWN6NytKPO4LeDughWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISIQh3tL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EXTpX029042
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 15:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q17C80Ek5kynBMl4n0c/KacH
	qLIjQzsKeaXbG1eV2Mk=; b=ISIQh3tL4s9eemvobK7JjzEVY/QbQpAflx+FeLTJ
	6AUcZL9jY4sHR6XDh91v2gz8rgJDPTnzQRAYO8+t37GqyLFHQ2IgtajG36qQ+in+
	Dt7sHEV/mJlp9rGzXv7XenVhYeqVwP1Xj5m4YEGSkEMAAOBe6teoEz8QVxIPM0pB
	wjGeuUgDXcAueSDHxxm9V9Si+H04qOHyzbapT/z5jo0KX9jOEOU6Slux8RsOLQzl
	KZ/Pk9TlKDlAICW2YAEydpTUHE0WwuIUZpvnCdZJA1mBc2rctMaf0DhGcK4s3oKO
	+tEI0zSwzBk5uovQpZ1/tsRGljcyy+GAiIdFkdc+QrOu5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kuanb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 15:00:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfc05dec2fso56667601cf.3
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 08:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760022019; x=1760626819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q17C80Ek5kynBMl4n0c/KacHqLIjQzsKeaXbG1eV2Mk=;
        b=jfo7/i3cbf8kdqYgrU6gBZ/aFIdnaK7ZNaePgTKto/1mmhGTzwOssPgZLqMAdoMbyB
         Bv4ECP4pTgq4c4bLuyBoFiD48/2MHO2GomSdGrFPi6NzFEhmCbTncM733x22hIYG2KRM
         ftfnNF8SEUJm0HZYhAIJwQHnkrn+osltjVmqLz5Z1VtCZMJf91b87J4Y47fW9jvwem6a
         xyxeZtWLxYDgbBEhYbiXu/wjHMsIMR8C/peMNGCrdreL8n4+X+nhLWrospflPD2kysez
         2xPWf+qsAKDQ05Qi3nD05hM3C4uJoGS1kB+H/xjXHsCkP3ITkiSBaqGUXcL3a+4FAfdk
         rcgg==
X-Forwarded-Encrypted: i=1; AJvYcCUNJVqcbhP1GBtGagqM21zPIlEyK+X7c/AkH0BrAx88GE6FPcuibrhKdOJT/qEpPai7ZOrOLytTSSsztQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmcFDD4CbTjGL3Jarlj4MpxBayTm1DzJAwO3Vpxmu03z4JR1vu
	wMZW4NW+MMODTx48dqFsZrj2q68Dw3rIbSl7YC1nH1yoCd/D5SxBXfiWUokOXTfuOAdy2DHS+x4
	R5sVfvv3HhVXUVNEUHaoAtNlI8MlmCIWxhud5ft9oGO9/8/HywfOAa04N578BUzYkoQ==
X-Gm-Gg: ASbGncv6725Ywk/g2dZAXCfVj3mriIhlmOwecZppbfGIF9HCmnu2cCV3+XBvuNLoZeW
	e/2pb1xjPU3YLt5HAbQ5h4nftj6uGgN3rLz8rLJLQSGwwniKjawkVRpu31xu985dHf5BMswQtBv
	jrbSeLoHNSeNm03NPkfWmP1Kt4n4oQ8xDLpbG1OKOqr3PgiKvf0z5gmW0jq/hwnwBM0R6ch5nj5
	NLdKvIfQ0gZRzYF1Hx1vvpIx9M2eKQDO8swV3TaxYpTN/P0Zysz9eGnNpSo+7zzVTaBtTE10auq
	xmSuIwEbfp+6oIg+8PRyoKQv7siI88/uddRtHVS6vw6tHjra6C5SRPJSduzNDwfz5l2gZNCIx0V
	6BSEVq7v3uHFtXvgAJ5KfY3wuvjtvpAUWrfLDyM51xgGioXewwLj9Ogn4Kw==
X-Received: by 2002:a05:622a:1e9b:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e6ead67a78mr117796421cf.69.1760022017649;
        Thu, 09 Oct 2025 08:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOLeCo/4yfzg4V3OpdNjM0GOglus/bZmIC2kvT6XMMcZnOmkG759gy5ztQPjqbV2UhQiLkHQ==
X-Received: by 2002:a05:622a:1e9b:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e6ead67a78mr117795121cf.69.1760022017013;
        Thu, 09 Oct 2025 08:00:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d2cd8sm28630461fa.7.2025.10.09.08.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:00:15 -0700 (PDT)
Date: Thu, 9 Oct 2025 18:00:14 +0300
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
Message-ID: <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
 <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3PJU4PvVvej8
 Sq/PgBNXCcdqrxiAUFJrSWxu0ex8LlHa9OhW097Jq4ETp8VjvBD6VhWYcr4eSVDGbBDdfjQ3sc9
 vmPnwVvqjDgx6LnfxTtddymFZVdrdAB09+sjDypa5I+YpH57gNjYMe5WNu9yjMHQT8jjLjuMTY2
 5SMuCCWPCKIi9pU9DhQ5DrYWAQenXnpncJF9ZjxWO+q6k9J/QGLnUSVPMD6tbwB75VXHLt4v7DC
 5SOCiRWpmP3e4ilPz5jQap4H9YxbU/PTWURf2/ZIoD8ylHk9M4n9++LeDVcHwozitlOF9dOe/OS
 r6hrs86jbBzcqL5eg80SxtewX4ezkiPou6CYWccTpS8FnKDO1k/DvoWe8plKCHmuZtn9UVeDDvm
 ZASg94Hxtk6U9ViCiHRtS3LmaCaL5Q==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7ce04 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=_mRl7PyFU19oPcLm8DQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: SUmqPcAuFa8TMwgKqTmkRSD3M86Vrqcz
X-Proofpoint-ORIG-GUID: SUmqPcAuFa8TMwgKqTmkRSD3M86Vrqcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:19:31AM +0200, Konrad Dybcio wrote:
> On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
> >> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
> >>> As a part of migrating code from the old Venus driver to the new Iris
> >>> one, add support for the SC7280 platform. It is very similar to SM8250,
> >>> but it (currently) uses no reset controls (there is an optional
> >>> GCC-generated reset, it will be added later) and no AON registers
> >>> region. The Venus driver names this platform "IRIS2_1", so the ops in
> >>
> >> Which we've learnt in the past is "IRIS2, 1-pipe"
> > 
> > Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?
> 
> [...]
> 
> >>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
> >>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
> >>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
> >>> +
> >>> +disable_power:
> >>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> >>
> >> ..for this line
> > 
> > Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> > AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> > iris_platform_data.
> > 
> >>
> >> but this could be added to that one instead, since both clk APIs and the
> >> Iris wrappers around it are happy to consume a null pointer (funnily
> >> enough this one returns !void and is never checked)
> >>
> >> similar story for other func additions
> > 
> > In fact, initially I had them merged, but then I couldn't find an
> > elegant way to handle AON regs. I can squash them back, if that's the
> > consensus. Any idea regarding AON regs?
> 
> Digging in techpack/video, I found:
> 
> commit c543f70aca8d40c593b8ad342d42e913a422c552
> Author: Priyanka Gujjula <pgujjula@codeaurora.org>
> Date:   Fri Feb 14 13:38:31 2020 +0530
> 
>     msm: vidc: Skip AON register programming for lagoon
>     
>     AON register programming is used to set NOC to low
>     power mode during IRIS2 power off sequence. However
>     AON register memory map is not applicable and hence
>     skipping AON register programming for lagoon.
>     
>     Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
>     Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>
> 
> 
> lagoon being a downstream codename of the aforementioned sm6350
> 
> Meaning yeah it's bus topology.. so I think an if-statement within
> a common flow would be what we want here..
> 
> perhaps
> 
> if (core->iris_platform_data->num_vpp_pipe == 1)
> 
> just like venus and downstream do for the most part, and kick the
> can down the road.. In an unlikely event someone decides to implement
> IRIS2_1 on a brand new SoC, we can delay our worries..

But this function is being used for VPU3 devices too, if I'm not
mistaken. So it becomes a bit ugly... Also I'm not sure if this is
really related to a num of VPP pipes or the CVP.

> 
> Konrad

-- 
With best wishes
Dmitry

