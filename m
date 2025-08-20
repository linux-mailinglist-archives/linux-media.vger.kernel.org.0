Return-Path: <linux-media+bounces-40402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD50B2DC74
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 191C81C468A1
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7D22E5B3C;
	Wed, 20 Aug 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3gOilB5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2B42E4242
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692899; cv=none; b=CtIDRzU4yFv3VrHiXxnYeyV0r8+0nbk1ltDNcuga8DoEBaZ4riK8jR09een8cz+maWaaAnFXiIjeSq5zMq1WsRIEkXQ113945vOUcCbC+ByXQtotOq17p2ZXcrkGKiV0ZlY0t7Bmi3ETsTav/bt5BFaMaJ7DetI9Gih9KhEFayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692899; c=relaxed/simple;
	bh=rJdlCHBrlZ/o45yDrigphA7AjLNPAeczhfu0gO1zE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrtXCQpF1p5N6iBpvUMFHsOEYfsKHfAy9NcRArqwHdZixDnipe+VfX81G/1v9NkCpKjFylKLL6ALrGMBBm43sai7tfFJih+L7TcuqAcn+EGyQ75t9+uF/d7KdoQtB/iSQdeZ7jrG6HWxx2criY8kxquBj3WJoMdxazG0Bl7L390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3gOilB5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9ZDa8025135
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ce4VLkPKV5TZEb5EONN8uvbG
	X/xFYWgwLomRh5TEyEA=; b=Q3gOilB5j6uFHYhlktP2wPWAng6fP1kJls6t4R3m
	RWjdyegmyc4E7/0MKvD19u7Pmvv83XJeuCWVhYMolSeT3CGDGMYMMEN29cgjr4GN
	MC6wnBWSB5fSkbyMWFVFiojfN8pINbaJpmB9GgEmAA0LMwSskT3RUF6saGFaZbcW
	vQsRp46pvmiu4JQbmZOk8MXaS62uVbl2IMc5hsFynoDtMNUjxawpELmMTik0ow4I
	yhf0QnOyM7DMk8Km9x4sNPozse6cwcXX2PsCDS/jV1FCwaYmld6DvpdPxRaeL2KE
	2NGQ1B+VvAwbuwn3fIJqUCd2CUInTc+FNBmKdMb87tfG7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9q5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 12:28:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2ea91aa9so10573101b3a.2
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692896; x=1756297696;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce4VLkPKV5TZEb5EONN8uvbGX/xFYWgwLomRh5TEyEA=;
        b=mQRfv7b7SNLOaLfmyzvm1BNPU1cyyICZTR//Lk6uJd3rOZl5hf8CKFqLFY4Xl402uj
         b83hRrnsTB/TbqaYi9935ckOeds280yP43GabCmqEUJpuBRP+czqFUVUdIlc6JvWDM+Q
         WUHvc5rNbyU0M2+6EVBXnXrX/tur4R4m7MssKp1BkQwpbLuhLmprxUOBuiKdNo62MIUn
         0sZIH2j8PkoZ5hu/rliqgIVYKQFy31hnPGlbRd3YtTq3VFpjA36NmFW3cMkwI0ZYsRKD
         DUc92XOyWUGiSdBokyfL0y9LFZVUJ2ZanxgLnZSLAZo94rVvcUA6HFj1Ji5+AJg0Ict+
         hmWg==
X-Forwarded-Encrypted: i=1; AJvYcCWv+EHmbDC6QlmCjerv1DxsGmpxi85g1JEwvSkCysy53n9zUuWJpybc7rKKbZGPaRXSrVEcpOmtbIcONQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRMt17glHPttlD1jtjbrPQSkK/fVT6r2j/oQvvI3ExtjaItQXP
	hNB6LJiyCVjDmiQmWEFBtFaFe1aDkoHVcSAyJ+OOrHocKRUlM4XuS2WEyj/wdBfIzuz9tMdYWcv
	UMZniq0hmyYaSXPXrMsniaSMSHh5C0IuWF1Ot+k8YBeGzogkDbNST2yKc9TdKpTZnJw==
X-Gm-Gg: ASbGnct7xyOYYDz4JIajtF+kXj+IAYaYd4Rb+TaN6PlgCLI8Kvrl3j1ulZ+eG05aDMP
	ium5TngWOTQyRlfenZuEYCMIH3XcpNCcXBE3lULWyNm2wKGNfOfRwtyMzzJ/QTTK1C37HklHv8l
	wiPJFfuxGPhNa4xC6ZmmSqrR/2imb5UfNC+avX+RF8HUM/2ExK2aXb6do89UlP9w33yREMkqnWH
	FVHmVcBrcLLgAxAQApFW3Y89mZoJp+6gazZtXv1AN13ZCmzkn5KwbRdqxb6RZslRDExbx72QP1H
	SgSxiYv6OhvFzl2wNuY+pg+dLtYfQd70DbJaTp1fLvoGgfIgyzrFHN/eq9IlJS4zVYY=
X-Received: by 2002:a05:6a00:9a5:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-76e8dd28c76mr4061004b3a.21.1755692896263;
        Wed, 20 Aug 2025 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENuG0ujSyO2XRCgCMev8QpXq7lHdpgJcPk/1/3NKxVVqhxwvXVT5ke47GbaJlC5AglhLJvTQ==
X-Received: by 2002:a05:6a00:9a5:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-76e8dd28c76mr4060972b3a.21.1755692895833;
        Wed, 20 Aug 2025 05:28:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8ab7b100sm3007322b3a.40.2025.08.20.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:28:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:58:09 +0530
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
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
Message-ID: <20250820122809.unhhusuqks3phtji@hu-mojha-hyd.qualcomm.com>
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
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
 <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
X-Proofpoint-ORIG-GUID: Yygv6IPmUDe1bAgYWQ_5L-hKF-q3iEEp
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a5bf61 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s6mQ1NoBmtD1KJKpJbMA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Yygv6IPmUDe1bAgYWQ_5L-hKF-q3iEEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxuvNZFZeu7U+
 6YkDSViv8QtX4h8zZXejNFtKfSmeMaeOd2sCvw1rcYekJZF8a6XTOtFJW3efaUgFhzxGf8k5gP5
 e3SyBPK1npc4HVsH1qfNNg2AVZmgP5pvI9O+kQrmY+duNnfxArqHbXyRSKa/Zo3fkMQi3etu0Aa
 ceHrH6w2xP6Uv7IE9R7hCLf2JcTTX4Z/0IlXJxkSz96ZJjm0MG7JZpbJqSG6EfVQUXMhKs9vCw2
 E8Jp0lsM7A8iuTUhap2o/Z0YzTiPtj+TsacyyKEcwSsZzoVN8aIFEGvPn9KlOEMKfdGTh/NtbMW
 GHL6VnbF9XeRUwsUre2O8l+gG9O7gQS0ZBMUP7W/rceWckSH/eu49yshOzN3upCdmsMukP2IPeb
 Q0Du3Tno44zaZX/6M4nL3fFtSZPRBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:40:51PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Unify the metadata loading process for both remoteproc and
> > non-remoteproc subsystems by introducing a dedicated PAS context
> > initialization function.
> 
> You've introduced what PAS is in the cover letter but you haven't done so in
> the commit log where you use it.
> 
> "Peripheral Authentication Service (PAS)" should be defined in this patch
> somewhere so we know what PAS means.

Ack.

> 
> > 
> > By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> > across subsystems and reduce the number of parameters passed to MDT
> > loader functions, improving code clarity and maintainability.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
> >   2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 96d5cf40a74c..33187d4f4aef 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >   }
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > +			    size_t mem_size, bool save_mdt_ctx)
> > +{
> > +	struct qcom_scm_pas_ctx *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return NULL;
> > +
> > +	ctx->dev = dev;
> > +	ctx->peripheral = peripheral;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +	ctx->save_mdt_ctx = save_mdt_ctx;
> > +	ctx->metadata = NULL;
> > +
> > +	if (save_mdt_ctx) {
> 
> You could check metadata != NULL and drop the bool ctx->save_mdt_ctx
> entirely.

Ack.

> 
> ---
> bod

-- 
-Mukesh Ojha

