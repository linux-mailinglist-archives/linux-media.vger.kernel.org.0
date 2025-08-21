Return-Path: <linux-media+bounces-40640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB61B30005
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32F047B0A73
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221952DECB9;
	Thu, 21 Aug 2025 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqDZeuO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FEE2D027F
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793790; cv=none; b=qpztYqfNKqAWix2WXXUG5AwLALLLIQFgQUcUxk2CNG39cwk94rhuqH0nOuhOBa9TZvKMUizjfOO0RLZcQTYE/d+6q80HHtx7bRquUUy6+EMttZPcDotwlcp4CVkLXYhLVRlHQi265mjuTAB6iSBUDLUmBXpnZttPX6LCkbj6raw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793790; c=relaxed/simple;
	bh=/tbXBa6r0uSu+NPSmXQFYhFY4TeDHvKdeP7yIapjbxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnZt/TlYDWRbneatFEYZFMC8DXPLR32EWIY8aafJR3Xcm+7VJQk2wxlMPAvvnqT6ZHPpP6R8RXNIjy2W5lUb9wCpZxbtoGNmoZ40ishp4XPZi5Hue0LzXBf2+89B/57EYE1ds6aMzz6Ymq/WdPrOnirfrazPI32WwySYV4+MII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqDZeuO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bD0T007125
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 16:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIhKFueIyr4p/yFGjoDpxYA4
	IzoEZUqKsKS0QB3Gip8=; b=gqDZeuO/ilYuppctcwwO5szg9iQ/C7BbwZfK15xn
	m0e6SqLB4lHcjMOIGXfvwxLAqO7lvJOftrIxqwRvG+NizFhk2p1639VdEoXeOJ6Z
	Vl+8QnMjfKyqM3lMiE3LmsYMQuomxMcutivszXLLB76ZveRioNXJy21eKp3rPizx
	VrUZ3rtxp4bC5QMsHZXiN/JuJXaKplsSQgqcjx3JCrDDHOhqteFSwRUD/h3TnhKB
	0H3+FlLLaPkbMoM2PUHuPARZtDdDiBe5Tncjhb7JlWOrbNNA3bovvbbRV6PLyqoN
	1tpq11IPpyEl7Q3ruLhzFAUIvVxyeEuU6VQImJdKYSJZwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296540-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 16:29:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806b18aso15022665ad.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 09:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793787; x=1756398587;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIhKFueIyr4p/yFGjoDpxYA4IzoEZUqKsKS0QB3Gip8=;
        b=Fm1IJYiNVBJi5dvy3T4p9N1pOi7XgFDa+rhsUrCBW59u+I9gB+/+palOK8RNWOEkFA
         f8soVP+RpLbjtTFgotnr2Ea5ULoYXwnZ6UtpcIaEIFrcLP9jSj+XUSA8pMK5b6ttyigz
         9hJWDTDKexTtDbLglY1x5FSAxsagSG9+w/smN1u+ssNuQO2WG+iUV2ytUouPAEHpJw6x
         as9yoIttaKqQ//njCMeWCZPlgrzaSx9ziVFoKH0WWDzTxIyWv2w7prjLQydod+9iefMU
         0352t5fQY4ul1FiHtkMrPYm36cfvEyyQ1oNfzwFbpHxqh84TgyZFChd+aajdha2yNIBY
         yd9w==
X-Forwarded-Encrypted: i=1; AJvYcCUFc3TLcDCkrYcUBYN1+UwTarYSEYSui3FlxLmzQt/sjZTTMXnWYntA1MEojLUXi7rqzz6o+PRst8hymQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztgTa4vauRF0WI1pIEmBrdTB0wvIFEqPKQDGC45FcY6CbVTinl
	JAUErU13P1JsshH5vUDLCxHqxJhNVxHDKw4NM6YBRqpcWbO1kHPe4Ijc8iV8/39u7JWn/N+Q5hM
	MCdLsTxqpgBx64Q/BKV9G1k9Ok5r9HPYuPHnGaGZJzxIat679FFG4zjlqfmdMBi4Xww==
X-Gm-Gg: ASbGncv5TMlZ4m4c1DYKTqCuHkLLNPT+w1zkMDH6B/0j7CQj7K5laAc0VXMz+OeKaLZ
	mDl8ONKk61PXM12QGKc0dy6a/kEA3hSW7OWnppNj24g0VtyXcwWRmAMCwcVoEBJuvbGvfkslgpD
	2WtQwzB74wRUSJbHb9O3Yo+h2/hXd8vOlrY/4gV0MRFo8oB4s3OkiTjcUSxBS0CdHZMLq62l8rS
	7f1txhESwzaTtF/Ta5azs79VihAUMcQHkPXA+durx4/PobF+cWr+dZI1lLIB7KcQrybTEzap5qk
	LZ8wM5QPvDP8ni0F3CDUjYZqKmONvR6hWWQHjDQSoSReVFA1A1+CGa1GNEabv3/TB58=
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47644435ad.40.1755793786770;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFztsB+0vyvGfd9GpFN/m6bhvsalSkka7TFzQDwuhyvsOAKhMpUjb0k8uC05DSbFLMBUCGz9Q==
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47643755ad.40.1755793786041;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4e9bc2sm59691575ad.113.2025.08.21.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:29:45 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:59:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 04/11] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <20250821162939.6s5hjsc36bmelmvl@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
 <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a7497b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=oHMyjcGywICXLiFiIg0A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qd9VSCWLfB7NYgp8e-VMUAO_NemqbrSS
X-Proofpoint-GUID: qd9VSCWLfB7NYgp8e-VMUAO_NemqbrSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy3jxj+edZmyE
 sFWFIQ63cWKGQ1XkxoOheF+c8KmWAa1xXup1r/zrxk/sTX/T+zB5WlznYdB01b+ixvhf+CSE9iN
 Ia+yxyGc0/K3rOTiGKljBa8uxfCKm8EG4Iz7pFmoE2f46OZXzo0m7oS3G/2feW7YheoaNosYFBx
 1sZbjsm1Za/FUEVr/fKse9xQecEZXETYEurh5mjyXcIwXLtP9V9ysoZAvQfiSeZfq6Brl3c2sgq
 A63wO2J3TgytdnLKIMGvdeCFEzv3mRhB0IeBp3ouuDCFcXQruyGD/cXB3CLJ0zQ0XjOq2/8phne
 dsYpkSnPzcDxfuJgyRxhfke6K+qtCNHtYRTqrPQzxdw+XiJTH3yDaGyA5WvBtiEDDbO9fPNiaOg
 wWdDrbN/LueYidOsAQqABuylFOIWoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 03:36:26PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Simplify qcom_scm_pas_init_image() by making the memory
> > allocation, copy and free work in a separate function
> > then the actual SMC call.
> 
> then is temporal
> than is disjunctive
> 
> you mean than here, not then.

Thanks, its a typo.

> 
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
> >   1 file changed, 34 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 9a5b34f5bacb..7827699e277c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> > +static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > +				     void *metadata, size_t size,
> > +				     struct qcom_scm_res *res)
> > +{
> > +	int ret;
> > +	struct qcom_scm_desc desc = {
> > +		.svc = QCOM_SCM_SVC_PIL,
> > +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > +		.args[0] = peripheral,
> > +		.owner = ARM_SMCCC_OWNER_SIP,
> > +	};
> 
> A minor detail but please reverse christmas tree your defintions and try to
> make int ret come last.

Sure.

> 
> > +
> > +	ret = qcom_scm_clk_enable();
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = qcom_scm_bw_enable();
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	desc.args[1] = mdata_phys;
> > +
> > +	ret = qcom_scm_call(__scm->dev, &desc, res);
> > +	qcom_scm_bw_disable();
> > +
> > +disable_clk:
> > +	qcom_scm_clk_disable();
> > +
> > +	return ret;
> > +}
> > +
> >   /**
> >    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >    *			       state machine for a given peripheral, using the
> > @@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx)
> >   {
> > +	struct qcom_scm_res res;
> >   	dma_addr_t mdata_phys;
> >   	void *mdata_buf;
> >   	int ret;
> > -	struct qcom_scm_desc desc = {
> > -		.svc = QCOM_SCM_SVC_PIL,
> > -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > -		.args[0] = peripheral,
> > -		.owner = ARM_SMCCC_OWNER_SIP,
> > -	};
> > -	struct qcom_scm_res res;
> >   	/*
> >   	 * During the scm call memory protection will be enabled for the meta
> > @@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   	memcpy(mdata_buf, metadata, size);
> > -	ret = qcom_scm_clk_enable();
> > -	if (ret)
> > -		goto out;
> > -
> > -	ret = qcom_scm_bw_enable();
> > -	if (ret)
> > -		goto disable_clk;
> > -
> > -	desc.args[1] = mdata_phys;
> > -
> > -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > -	qcom_scm_bw_disable();
> > -
> > -disable_clk:
> > -	qcom_scm_clk_disable();
> > -
> > -out:
> > +	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
> >   	if (ret < 0 || !ctx) {
> >   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> >   	} else if (ctx) {
> 
> With those changes.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
-Mukesh Ojha

