Return-Path: <linux-media+bounces-47696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65795C8505C
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 13:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46CFF3B1FEC
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE98A320CBE;
	Tue, 25 Nov 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEwdvki6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWM/Wyrd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBCD31C56A
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764075140; cv=none; b=Z/5iCwLWuB7PAQdpQIzDL/RPTE/fmLf+tX6XcUqWNK2NCgV3NUSIhVEzIXmCKohD+WckdYSsJcoZu7PfqU9Elk/KBGTSP793B1DDFoUg40d0V7u/zS6DBJcLYswJl0j6Adjag42PAva8rKy7yu1zcJ1X1MvZNdafqjCsT39Mf80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764075140; c=relaxed/simple;
	bh=vIIA4mGVLl8jc/UPq9XG9j6Ah4loj0+Tur/++NhByww=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv9eJCFPXHUclanPs/ase2EUHbqDzmHP3e6SEuF95Q5AbEmzc7+r4ZbkZuio/z09x8BhBAGzj2FLPcJEKZEszPwH4fFBMToI2ESfva8dsVDcfT5DcbwnaRezQXfes4ux6zHO+kDYvde/GKaF0cAyJL/T47VtVEX1vcHDZmrlmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEwdvki6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWM/Wyrd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wKng2659000
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ScsI51p3RWiGpmzl/Y8j4lB7
	RZh14EyXHK9ApFQwIe4=; b=QEwdvki6JE1nnKvi9Yh4vrMtgDgaAtvL/NipXHPw
	wAmlsqyOgXI3fhNfjajdVEHWAxK3F+K8ipISqIID92tMVjf0EqseAppM9pH0w9Q3
	wQaBvtzN3ltHeiGdvMMDuoFR5wBLaV+zdpdAVmPT5epttk78/omyvWS8SmLHZg8H
	I0jQ1e43W4GZ/2jCFaL9jF0ViiZEEGzjvnCKgx9v7VmQ0MuWXbLNdDaVKQHjytJO
	GEMp3HZMBdgSp5eD30gMzE8NR1VG+uQ6GPKqmoczrWFgndbNOYnKD6zTBCgmRpj/
	uKey5g5MfmdpEaeLoUN/yXcq1kPITyp6JeS4Q6FcNPdheg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x8fd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 12:52:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b4f267ba01so90218385a.1
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 04:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075137; x=1764679937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScsI51p3RWiGpmzl/Y8j4lB7RZh14EyXHK9ApFQwIe4=;
        b=VWM/WyrdRbRXvZr+N8RBz8hLJSjGxj+Tb8KvYvxUACj1fOnmOis3Twm8mYf/A3uyq9
         O6uzz3gStkl5/uTDp8InzXTh0uKklbARyAjZrVnj47bi1GFy5F32B65ywMQ4/5l3THpr
         LpccoGumDisaOIQygyN7d6+11385JJAtTO3Oy7l6PnwMIZarEUARXnKe6iIROY1E43Pz
         OklGgMRyFQKUISqpKfT8RXi/w2FqyxbSAzu71XJI7JIbWwjA2vuoKjco/MUhBwcrFf6d
         iZTdS6eV4dZUnWfFVhsolBUifP2OXqXLtAP35OmA/c3JWqd5XX183i9L/fBfaZ1VOX/0
         +/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075137; x=1764679937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScsI51p3RWiGpmzl/Y8j4lB7RZh14EyXHK9ApFQwIe4=;
        b=WRRNPcJpFgp5fvw83ExTVb9rbucx1G8vKFBkbySMVjLyvcssuK7JK0KGJCzQ7I4FeU
         lgCZ5RtItt4v091LolUZQNTguJKxf6PktzLpkn5KNsuuq1I970BJpmnlu9ZXlknv4y22
         6xUxQdN7XsN8/xaAPPBwKavlqy2JeLasFDFvnxlvjHvcwGxUX6KRXEqWMF0V8Jc9tZ1W
         0fxGzq2WfShsS5rGM+WYKWyBVpXCXKrWl3CrbXqc5J1IweBbKBAcNk9wTzdGMHlLvmYq
         yP69QDc3OZ7FJq2Y1um+/hKfJ6eYYyeEmMyVBLnCIO7n7QYUCue8YrfuRbf+L/VfHbPP
         nj4g==
X-Forwarded-Encrypted: i=1; AJvYcCWdzIQiMwScfovvt5I/1UdCXYVu3DlT9YLB5gdFbuM/IgUebT5IAIxthaumDn9WddsK80USD6G1oIOj/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Bo6enyZhmlkeQQz9FovBPC1Mycpqm/aEWOT3lf7nQVFpQ5i/
	/ZrpRJbV2xCYcTE3ye9Ey/mCNyrmBri0fz0mYqu3yS4PPZikOidy8pT46UsWLWmu3Ykpt99YR+S
	LBwgfk5hTfGfxZU12NWiTwC+9xbRjsQEMpz8juycbKt0GR1DXSqzwWZdgkqaF1DJUqA==
X-Gm-Gg: ASbGncvMPnt21oLuv9pcrGmrAazvRIFoqXK8KcBSUr0ONX0MfQ9EclBDT+rPhflcgEF
	iku31fS72gl3Z4owVZl9ul17s+GyZfLWocI2JTNPzxeTp65Ujllomra0OnCLlWHmueazop6rRIk
	+W2s6ATKLrnw98BTe1kYvyemAx4i9XEw9ihOHtQkiCFo+Tw5FEu14zV4vjp1cojLv2x95/YCKnV
	8NwaiF9C6y0DeYQrZwonhB0AgdJKfgfeGtkE/ST4xvgXyaXaEg7YYkOPwCRrTsK+ct0sQveu2I4
	3R6APfsEYzXg+VnfpYU/+ADziI0pfPqYCJpxWvwClYIdNogjHlr76dALZ7TzEcWfkq2AWtcAjoa
	n5VvebULfQDuxDfEDIaGAZXHF3fXNNy42x+7gIpEfzx+Z
X-Received: by 2002:ac8:5dc8:0:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ee4b418901mr258840741cf.4.1764075136696;
        Tue, 25 Nov 2025 04:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh976qJxsmgG1mRA1z6ZOeIgC3zUggBSkOeolUKxGfDS9bMppxdScyvFcId7vgKqtNNtwSgA==
X-Received: by 2002:ac8:5dc8:0:b0:4eb:a715:9aee with SMTP id d75a77b69052e-4ee4b418901mr258840511cf.4.1764075136248;
        Tue, 25 Nov 2025 04:52:16 -0800 (PST)
Received: from trex (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e872esm249357255e9.5.2025.11.25.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:52:15 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 25 Nov 2025 13:52:09 +0100
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Message-ID: <aSWmeZHmeUWs1NwY@trex>
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
X-Proofpoint-GUID: EmgFsyJtIcur3n1sA3Jhlo8uTLgqcx2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNiBTYWx0ZWRfXw7qyOzMcq985
 bflOFDoCMm+Ah5o3JuFzfwr1LOku/dYqX9SmnvZFPPW7pUZnuBaZ+1UT/GeaIyNpXlO1zV0J60A
 KPvPWdVMDrh/QxjpPA/l5m/YTcza4Bwc6oYiJV1sEarUNudimT+rEeT3nnT1S/fOtOwDsC9a6vI
 7URlvXUmSFW80+/q4IU9xB/fP+uIm4ods/rro1eCI8VICDedPJxf83WDGlGH1BJq3MAkZ/rveo5
 FeqlWXMiSTQKvYysqlJQVBgN0+/ME0H6bMUQTxW1K4AQnws7igaep056w2Nm6JkTc6B2lbn9paR
 yK+m8aaCBpUq4MVPxYwKvc01iYuw1Sfy3tk70hBh5GawGz9wSHx0ARiqNbAz/t6RxCdxjZMKS+5
 TAdMmNg26Gu4p5RcKoSObcZf6W4fkw==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925a681 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8RCVjF8-wm2c15ljX7YA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EmgFsyJtIcur3n1sA3Jhlo8uTLgqcx2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250106

On 25/11/25 13:59:56, Dikshita Agarwal wrote:
> 
> 
> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
> > The Venus encoder and decoder video devices currently report the same
> > bus_info string ("platform:qcom-venus").
> > 
> > Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
> > parent device name. With this change v4l2-ctl will display two separate
> > logical devices
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
> >  drivers/media/platform/qcom/venus/venc.c | 5 +++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 4a6641fdffcf..63f6ae1ff6ac 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
> >  static int
> >  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >  {
> > +	struct venus_inst *inst = to_inst(file);
> > +	struct venus_core *core = inst->core;
> > +
> >  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
> >  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
> >  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
> > +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> > +		 "platform:%s:dec", dev_name(core->dev));
> 
> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
> The second call to snprintf() seems to overwrite the value set by
> strscpy(), making the first assignment redundant. Would it be cleaner to
> remove the strscpy() line and rely solely on snprintf()?

argh, my bad, you are right. will fix.

perhaps we should just have instead

decoder:
strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));

encoder:
strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder

I suppose the additional info provided by the dev_name is not really
important to consumers.

?

