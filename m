Return-Path: <linux-media+bounces-45388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F0C016D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A63E341778
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CCC3191C5;
	Thu, 23 Oct 2025 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Isv/NH1S"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABE316191
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226028; cv=none; b=kTxds1nrib91xkXhn4/jeTqKLzDpwRulFvqespvzFOq01ZGKTnuqwaPJQ3xdSqYXjnWI72yHweaRJnE1cC+PtnC3A5KeQ405yQaEfadhjV2Nav4cCjy26iT60IkLl0EEAzD6ENuxWfuqwR8LybC91+geZ9NR0gj+Mz0f3Mn+z8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226028; c=relaxed/simple;
	bh=g+Rv1AjpSsTCKZOwQpgnDI79Ij1e7QTYDmKCsA8cuds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsyCoBPC+0vlyl1gQ1jFQ9iSUZLEfDgHtMTgWl0zUoZ09JhkQRQR40hTla5VO7TufmfRnIS40SmQM0olXGjUPW9CZcGN/3JpAt2TCOi2jrpFkCV0YVoIlvsiSmoXhgMadjZzHz5QVuygZSoo5vZIRB0FQ5FnV3NUM0zX+QZwg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Isv/NH1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6nmiK025826
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zT/v/9VMVWiK9/shfJzJr3Rj
	xsz494Ezk/EBK0cyjeg=; b=Isv/NH1SmSzG1p6Qccm7OyquMrKA9YbgTBmcbf3v
	pO+PgWznCSHvDXc07zZxcJYODtpFDsaI9pMyvoRcSx4UpqEkW+UPPjSjjbogOcAn
	nzvgxtBHK1M3wssZOnCGw/yNne1LhqvqaTTHVajZQqCjx9IW/xSCCrHlfNzd66LK
	6zBJuPyhXYKmnTECmYAraKllOLgWNPy1R6IHB9L1+HxRfHmak+/RnwduNsSCs/cv
	ec1ljypNmw2wjcuxiEAiNAMjM98uxGmHjjPDEANsN5y2O75lqwvi6Ev22M83wWyL
	X4HCCfdDkR/i+ZDiOKsKGoG9LIaA4yLtLqSx3uKgcJoqyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kgbr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:27:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e895a6ca73so6363851cf.2
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 06:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226025; x=1761830825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT/v/9VMVWiK9/shfJzJr3Rjxsz494Ezk/EBK0cyjeg=;
        b=vpXjwH7DU+H9oeJQ/y3WsSXkvqHbJyGnINV0IltVq2BY/HT+IID+j1DvtrLwQc8Q1P
         gdJ/ZI8ngOZ3TUZCec4idvG2ldFReOLBYqCXKM3iO2MbBx5sVXQyVzbvDJtMA7VeYnH8
         IpqWmawdUZFu7ANyhasZfhd8sjD1jR/xyjI3DVG6a7O75kf9c/X3wYEyGe7ooWrmDZgY
         nq+g0a7HGLjNQQkIrnF1e83TAzcbqK1XYxMAAbjAEt8JJ2orHRvxdVK4ZsFM2gE/NX9i
         ltmd2pC9WiE+7r0r2TRYbrOusQ4wArwF8jTEywJ/yNjIrTpXZWeeVXgex+AF/snfN2GO
         t3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWg9GoS+xc66RJ4uvbFnrBMhy/4xk9rX/4mnztLYARXSR68n2Ppzcs8lxXGFAOTMOwN5iiK3XCdGoAaJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsSl5lvpCYSMPmnXYBAK6YLf37QNHyZ8ftG3EY2j4GWsOejw2C
	aAKYoMGPnWJAfdS8mSrNPm7jiDv/xONFsuVSfZsp2ZD6x+9crY5OaTD5uQgDc1bs6+OFBOtA/dZ
	buzq8w3R2N5Ny9FGdZPC+XR6oKkztup9yhlxNzIFYX8NRVOT64lqp+FSiWccWN/ql1A==
X-Gm-Gg: ASbGncvYNJqZgYy7VGA3ggcEaNPilrWt260JVcfe6VYASa5UmLnJQ+NHiQx/mvIp10u
	5GrhjPj3eXPSmH5MJigTXt1x4y+iCmfxIA1JbmmgPtn0GyfjLczwYV0AxFyo4WzJaTW0T6AXc4T
	YRys+Bl4D2EPaq3AKSuAXWdmGxIOS8EeavPr+8j9pSDEhyHmPlm/Ykn8XKBl9b4cNoKGqVygf59
	FYiaEKOO7/WlW0CYoBAstZNfowW3umN8cEUGDhCkrjOygOUjlKuO1PBdooHX6gwFbWu5JjH5cOm
	laD6jC5g6Bv9AL6dnBew52n7VEdL67SUs/lrLvtwK4iErp5kp25yEUi65I4k4VdtYIY8dmoZRB1
	JUtDEyaqpYbkztVI0aakK3MwEo+ugn6Ie5CV9Q+LYgA/LybO2fax3ivdVmL/6YMYFMmu3nVbA3C
	89h3/0MGTDDy2O
X-Received: by 2002:a05:622a:1923:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4e89d2aa827mr271838121cf.34.1761226024532;
        Thu, 23 Oct 2025 06:27:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGANmpmamIIGJzojFfD9uGQMnLDoNMf499KeF+uSksNrzxNT9z5RsW0fShxZyAoOgvuNuO8rg==
X-Received: by 2002:a05:622a:1923:b0:4e8:9ade:108c with SMTP id d75a77b69052e-4e89d2aa827mr271837751cf.34.1761226023947;
        Thu, 23 Oct 2025 06:27:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc6f5sm4594971fa.44.2025.10.23.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:27:02 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:27:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: iris: stop encoding PIPE value into fw_caps
Message-ID: <pcbpoilqcqgidtbnji5ntzdqrk453msfmoccs5ntlustiqdomx@ekatz52c4f2u>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
 <20251019-iris-sc7280-v4-3-ee6dcee6e741@oss.qualcomm.com>
 <8c75296f-2cd7-b0cb-f7ae-d433d2834bdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c75296f-2cd7-b0cb-f7ae-d433d2834bdd@oss.qualcomm.com>
X-Proofpoint-GUID: TSSnWxoOXllmh0ng5CThXMY9lG-hgk4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX4s3JnNyVrP7E
 r0Pfxa7wIZUzHnf4kVMxgPX3l2Rt4f0gzCDtfJnPEGw+yIpi+kldJaZVia2jMdW3irqu2lXYUkN
 V8+fKXvKg3jnehmoJ8mX1wv0kkSh99o3i5gb6LbR/DW9wn1hCSDj0WRkDhaCimPHzMEZqYTtkar
 4MOw+3G/W1A24DVa1Bo3Okxsww0OKfg3xwxPBpeKmjHU9laQYab5Wtaw7yGW1RauY/8EC+LPfmW
 VtkGOYXxI7061y1Q4eI/vqwmqPIGYsYU1KWL8QkHTV0HNxAKrICIOFzpTCv7ddsK5EUJcFtpaDB
 81jWLb3COFXT4Sd80M70pzf11IAJZvy3UaETOpyJ3OR5aKXvE27cpxKV/J12yjYH3FLUSvMcL56
 vnZXqJ03LBaz6k0ZGR6wosSZU9ENmA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68fa2d2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=q52pqm9MKi6dhOjivlsA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TSSnWxoOXllmh0ng5CThXMY9lG-hgk4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Thu, Oct 23, 2025 at 02:20:36PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 10/19/2025 1:26 PM, Dmitry Baryshkov wrote:
> > The value of the PIPE property depends on the number of pipes available
> > on the platform and is frequently the only difference between several
> > fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
> > iris_platform_data rather than hardcoding the value into the fw_cap.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  3 +--
> >  4 files changed, 16 insertions(+), 9 deletions(-)
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index b444e816355624bca8248cce9da7adcd7caf6c5b..03ce5c259c8491ae6882128795d18569baea6241 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -161,9 +161,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> >  	{
> >  		.cap_id = PIPE,
> >  		.min = PIPE_1,
> 
> Do we still need min here?

No, it should be dropped. I'll do it in the next revision.

-- 
With best wishes
Dmitry

