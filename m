Return-Path: <linux-media+bounces-61414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBnGAglqBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:09:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C61532C87
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0254D313D8EF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AFA401A1D;
	Wed, 13 May 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asINPBQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W48e2qI1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD23A1A59
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673887; cv=none; b=ZrKFkduTYbAvU48PKB7vx0zmT+sPBPo2UTyvJGWFUgfAoCG2V7aEYmijCbadEa+LCiozWD/JXZAgATp/DsmweUJEF4Jelzavq4REPJtvKxyBmGzWrOhBHdCs3hQnP3PQLU8azuHg/IdTP38FO5FL4i3qxRFLWvavCBLOx8t2/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673887; c=relaxed/simple;
	bh=tqCCVX0A8ke5fuw5h/eP4tuRPMytSvYDOvzyW5IOZaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhvALUMnubGaPkg+dGRTa9WeYYppDgUdSI8O6kBkaiJ5qsEZY21OBgIDd6rIDLUWB6tM3od1lYLG5oAiOwnCLco5bt3LJNJ63wBiUPGqa3eToRtVCYh6FaY5/R1WusJ8+jECrX9p5kDj8KSBx1Hkm5IZHiehvBTXY8cSuD1IU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asINPBQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W48e2qI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nI702888316
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rzF61yFomnoQQwZ22tqWEqCd
	XzrFDQbOBTeRX9i9UC8=; b=asINPBQeWib2E1kjQelqyvIQGYFUm+NcQLpXwOpE
	3t6x7mBhY7AeGn+j3CsQ1J/kHWraUSNIAwVVl3fM8d9TtXqZ/XTyH+OquMQhoMuX
	kmASxxDnNr+vCzphgZkLI6te4gtqPn+3DA5o1UhcDY0HUP6bpyhmL8Nb2KTCmmjf
	0cd6z391rbc3n+U8cjcn5qz6elu8/UGha0G686b/jtoO77IPIVw7O4dr9LZRWaLr
	q3cg5fk7y/xHE7BP+I6rI7CWBTSQgiV3Y8AhcEYpUMxhM+ovUdIRudSfhODqA8t+
	d53H6NvN4TVdk+8YpDjPgzySH4tGjauHKNlSeeYK3H0/XA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggqhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:04:45 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6327b45f59dso1621868137.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778673884; x=1779278684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzF61yFomnoQQwZ22tqWEqCdXzrFDQbOBTeRX9i9UC8=;
        b=W48e2qI1YTvuBEufylQ7dor7utnbhfdzPwkJUFeWTN5TQqhxjuN5dPIRG6XJNVP+sb
         5QTYJE1q5h6gFYreTXSeGZbQxi8gV3+f7P8FLAnO+JXnnlr/S4oKFWOk4GnQAgOa0Db3
         0KWVWZIX7pgyW8U+765Uo4bibcsTMu7KSwaz1gVuiHoz5XWEDrudJi/iszrwbt9ucfAt
         kvaEMUTHsxn2th9IXu+YI7Hxr4Mo0B05EAl/0JCDTh2N9aDl+JQddceCoBSJAdtIfaFK
         l7sphn5CAR13O7mk4+AY59JRGG9hCUWCRujdIeHP9EAd/9qs2kHRNwGB0nDFDkYb3zUy
         XlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673884; x=1779278684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzF61yFomnoQQwZ22tqWEqCdXzrFDQbOBTeRX9i9UC8=;
        b=mHbE3doze0lVmksaePbjuRXoTMcNWsy1OvP79Gcv7jBUjDrydKvaRdAWLpeaDp7Isp
         12QongdYz93L7FZLYkMSe0wjMUMJnrC2TOuL+vcy/qPACuzqzEPJdn9FMrce+G6Uz84T
         r66v4tij8xHlsG/m6qz/qbRumoRvG9O1i2Q/EtYMuza1cQwMf7Aj8q+84uJ+01NlsN02
         GHv8Pztg72uU8mQy/dUhGCklYHlmgv5BC+xvuj3jl7Ig4lbvGh00+a2Nl2N/yW/Ydw3Z
         0PQRp/IS4iAwCV0g7iUfeo7ihNqcOxV2gNXLhMtCAOjEzBYmS0XImKRTVdExwFLNOTlN
         iwpw==
X-Forwarded-Encrypted: i=1; AFNElJ88R9fHQGWvNVWkRdQO2PUogSe+jS8ryU1uYuFmmAKbV86/fzjxYSBE4bHj955FkMh2+uQL9xu9dXSnBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41KzuS48E0WRYOuFa6P4zlrNdV70lT8C8aujJPPhymZ7RFH+f
	+8hTCC0BNESuQtnpf4/9Ls946crxs4HZH8CINJagCwR+zkNSYId0b/1UJUKzp9ovOhqoGpVIwiH
	McWRDqATiNqf/yDlDMqshRhEQoPgtU3P6BM8LNo6VbmaSlx5IK0XC0VkTxfLEnIBeMQ==
X-Gm-Gg: Acq92OGdP5dxxcjBD7ic1YMDPvwCKAoOHfDI2ImT3bFUmE+1GwuMZR9F4f4bZBbvWbh
	nQcTpEgvvwpPvLPwngwx8gL/V6yzvXMjLAFQJgsOzekYfbt1yPvf74GMVnqbhrPB+VhFBbNOzgA
	RzJSjDVs9JDc0alPSh0Qnqp09GC5jwo4CuQ1Xnqmn25y1B0geBZ6cetfZqKKquJA8tgI5HJioxv
	P1xF4bRjwrEzdx4mB1omZKdGa9VKil83qQ9WA2ILZWjDLgxBrgZIcNQJpm3qarU9oVOG0LFfbAB
	1We4U06jyMQit8TaUw5Y+vY32heTOHE5MEu3fXV/brQTvYmzoVkjnM4ttfrlPkiKlueR6piVpZO
	I4EwMJYcJRmMJMGoq2xmEsqI8hvXpR/uf9bgqN5cv1KCBwZLF8A0Xc6t8p09IJVg9fOXG37Gvc1
	WF7eIVHTNl02hklhW5J1pgWaf9m9q2hbuvHyc=
X-Received: by 2002:a05:6102:6f06:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63774032af6mr1009480137.21.1778673884222;
        Wed, 13 May 2026 05:04:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6f06:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63774032af6mr1009400137.21.1778673883671;
        Wed, 13 May 2026 05:04:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm40077251fa.24.2026.05.13.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:04:41 -0700 (PDT)
Date: Wed, 13 May 2026 15:04:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Message-ID: <26kycrcyytxevu62rzxiz3o3bwa7kienhb7sji7viwy5xtwvas@ukhd4meh2v2p>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
 <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
X-Proofpoint-GUID: IJINxWVMY9f3Qc1thHYtX3GoLeShuZat
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0468dd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PjdSA2W4mZ3IWh9d2u8A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IJINxWVMY9f3Qc1thHYtX3GoLeShuZat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNSBTYWx0ZWRfXwqsSBfSabeTg
 T1W5SnlGjfo6WvQbYvOPkApgeOAIcvyqKBITqvuX5AYktJedf4trjMeV069ATkjmVYZ200r48Wp
 W12JqbY18LfkYIjAkBI0lmN9KZ4KAyQkY5wPUn9cY1ZvRjtBntSdEUHj6Bw+IySZqP2LwqU5ek+
 k/+fPU6SsUjGa4WoTN4r9q/Ea1RmVBvmDuIn2rFxhBAeothcx15lS9iTFC39/AbWxJodoLgQGdr
 qSrRO+dyBdg+ZEqRLsiqh8apSLG7X8EnGv3p/SFp+TQ7IoEKCQ21ddodn+RlmNrWjr0cyKte0+J
 oIM5CTfksEcIdfFL6f6BkyAX9LCFLV0jAD0LNZ52Ip84RdoVbrsnbpTa9XO45/5jCsYeCRnybSo
 Yngb0rF6jp+d12gEEmJ80FUvaEUXagRBB0io37ZpiX0pUReZz3hScAzO9xeL4FOu1/LqGfGIsiX
 lIIvixTYmDBzRcfIT1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130125
X-Rspamd-Queue-Id: A6C61532C87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61414-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:59:19PM +0200, Neil Armstrong wrote:
> On 5/13/26 12:45, Dmitry Baryshkov wrote:
> > On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
> > > Add the necessary bits into the gen2 platforms tables and handlers
> > > to allow decoding streams into 10bit pixel formats.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
> > >   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
> > >   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
> > >   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
> > >   4 files changed, 30 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index 0541e02d7507..b6d815c01f1d 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
> > >   	pixmp_ip->width = width;
> > >   	pixmp_ip->height = height;
> > > +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
> > > +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
> > > +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
> > > +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
> > > +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
> > > +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
> > > +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
> > > +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
> > 
> > Do we support decoding of 10-bit videos to NV12 buffers?
> 
> AFAIK no, I found no sign of that in the downstream driver but I may be wrong.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

