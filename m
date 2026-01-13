Return-Path: <linux-media+bounces-50489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23653D15F9C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 01:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDEFB3008F6C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 00:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E03B2248B4;
	Tue, 13 Jan 2026 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnpIResj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3x0FbNc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CE2264BB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768263901; cv=none; b=oxNhBgIY32uaK3k7V1o76Xtf9i2+RiXleRXbEtxMpj5J/UTQ3E8x2of/iphIBbIcl1JrrbNVqqtVrBKZzgDhdgQ9x+6dajKX5ErZHMBq6zMNcGm/bJgyr6bjpzeYqnU0j4giSGmy/nj7wA0Zbo8138WJbg5iiYxnYoDfMqDetmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768263901; c=relaxed/simple;
	bh=ZV37RPsLbilt74163TknjtNQ92AsDBCHzeWzEQWPdbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ3DY5HLFMHUPKj/K6cSPO+HrWZ3nRt1zo/pV9oAHdF5hUIUxw/rd42/izcLD4aQDn8KrYJ+yXcQ7fpQxCEPSEIXIWlkOul2tFLH+pUBB7V6wBkCnjeMd/Tkk1sNGCqHELCLnVFf02MCqU6hgqi4eGujbu2QeO9HCRRILuj9vlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnpIResj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3x0FbNc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN4vkd2604045
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 00:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dzxkXozKtULhcUZuJh1MUOqg
	XLBE5AuFunSWmMnWvjI=; b=WnpIResjGpzemU0cGefeUfym+RgYNJJ4pdc3juM3
	DeeHYy7ACajDJoQxQAl9+ci16isOb7UB17G/i3lB3w+Lgez0c5cXN0uvrSNRRCTo
	ARm46dTkyaDL0+muCBT8RYs9LYwrWaexu8mWYjgIkyq19idWKZANZgqmbsKLaDHc
	BMTZcCn1ZyMxcpVJIHKFXb5LyQRjVttqZtxI8W/54kd6JrLFJ1SnWGzl9ZEz69Rk
	xTbOqRGEkDuentWxforWADOoBXBVXMCvdKAhfVvkl/c2FpSNxh6lZk///x3iYj94
	gYiGy4uHhLUM9m1D4S5mH+HIrdNWZkuN4G4OBAxhvar9tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uyrju3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 00:24:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb6a7fea4dso1731593485a.0
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 16:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768263889; x=1768868689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
        b=e3x0FbNcntKmsRnM++0OwfmxH/RLdxypTSCcF7cYqrBZl9Se9dOABnBuxBiRJ7AKtp
         AkCP4Q3njXXaw3bmz2SWd0NIm2uOzH0gcbA8DlXDC0nr7t3q2Ova4R3Rwmsbk0zYiU//
         hyfqvqobuB9Y6rNwF7xUZL2VIRU5D1MKPnqLISMpF3viSt3bs+olvgnMlBU4zzNWRY+h
         ao/HwGC2p/d0RJGPL4DskAmnTO4BW/Yi+FGBaJfXAcBz7sCCuGbxo6/KqfoeJaTVrrUJ
         togc3lDwTobd7C7pCnlWF3lWtpBqoRDshTDrNWGUBw0VIciJRnlVkCMs8zdnpKqf5Fuq
         LIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768263889; x=1768868689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzxkXozKtULhcUZuJh1MUOqgXLBE5AuFunSWmMnWvjI=;
        b=In1mtnzb6y1KsivrD6+xT7kz4T7fW+SyiFuZonOuJRq+WfXQOE4DeIz4gmeDPyzI/c
         mX6JPzisH47BqUtkUo/nw/TZn/mh4tM1Nam02JHDOYSjqjIQpLu6KybYrkHpZlGU0Y4o
         SIuakrgiica1NrfX8ZWC+oS9HlcVrz/6X0izHOYoCEYve3h1k9WXjZv0RggI2NYk4M1N
         uGx4q5Opjg18+VMIi1Uu2LDi6RjfUQGGvw6Mx9Ue5YsMp7ahUyL7gH5WWGPHDihDCAQH
         T9bIy1hpGPhJXlcuaaFXkC9JOMqBxHd0btuS7vPttbOi+8AODIdSvGxMoi3NZfKDdMah
         pi/w==
X-Forwarded-Encrypted: i=1; AJvYcCUWEoynmsoCuxYKgpwUAuAoC3g+jAIwgdt6x/SW8Ks7SGgaMjfldkBya41MfcYbL3ZLpYAnrbP1ucrQMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBnAa5vEyNlM3a7DdP/ZbgQUZxwCtEnz0PGDvaxGOeiu9d0fk
	jkQmpX1Q18z2vo46v3k/xjlkq6p3iLMyPPJfX0wDFFODJLuEsdHHdVa8vDTtcDavMpjocFcWgaD
	7spC5G/cuLVd7HfUw2wxiAI13P1b4IgP95AHfHJ+9x8+EaUrRBlFBTHvnI0pvb9MnBg==
X-Gm-Gg: AY/fxX4U7LxOphi7s4EG/1dkjyr5TfdcTNy2FF1cS3laaeyCEgJ9hx7t8Zy41vMpa6N
	JAXib0BTvQ5GiwjFWr+U7z4sFa1JhnJyG3Po6ANdFQ3y4odtyWTPuMOlJSOysUkGcklEHYBHzgY
	vENsvXH6zramvRHybs4BxN3paxsQbCetyWweP9ggQWeLf0hoJFlMg0adt/G/R4JrMf+u7ooAW/5
	x3dUqeNics80hLVXs/Mf9d3Sqlt+EDOsGqT0XStY5ITShqbXvtPokX5dzb4xuqA6ho71Ux16jRm
	39WeM+KdJvJcz/8p6gh73EmKE/MI6vK41onlAp0DIVqXi4KePE4wEMPQOhw0lbDyvkQxMrpyJbZ
	kFE9EkNnW25bpRGAwvC1knb9mXiAoa6ZhPeGvMNuditNigzmx2+URblj7vyyvNTUf29Z/hQmlU1
	GtQ3KSEmEzCSL/AlPcliOPlZE=
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c389368bbemr2941977885a.5.1768263889560;
        Mon, 12 Jan 2026 16:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyjpi+M7spreDJMit+P3ck5UUiEC5t+Si07Rff8PFo3t5TmSHbXB39Wl8TRKez4c9R2Z2VvA==
X-Received: by 2002:a05:620a:4802:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c389368bbemr2941974185a.5.1768263889102;
        Mon, 12 Jan 2026 16:24:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fc17b990sm33674221fa.40.2026.01.12.16.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:24:47 -0800 (PST)
Date: Tue, 13 Jan 2026 02:24:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Gb6GHsdZlrzMkjXi55JnyJSb1r5ZCa7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwMSBTYWx0ZWRfXwUY0Ax9yzMT/
 3uW/LKjb9OYsuNK0lqaGvL4NH2XsvR/knuePpDk/HaUkZ7pIK/TZMlzCOnI6T73H0q8r6MBTGbk
 TsiTnlRjLP2EQGDbQpaph/UWQNt9mt9jRdk+G9I49jChz7CuTwubqz/A/KseiykZQwXF3c3dB5B
 NR6GPAKDKjgFQdvvp5zHxcEk1tbbBZE5FS6mZLjyVyypK7MA9tBzpM1rAKcapQXcuFqGgV9Mad1
 pdVtrWcv7I8Hc3gyJzji/tmYRpfmVS9sUNYcOdpNLeJ5tBlRcxAnX43LpspR7WUkgDCq2le62PL
 edSY/aBXachVj2Ajr0aYGNsDemHW1ASB4uA7lSk53PK39PCrkM1wxi98crklZJYayATP0fMwva6
 l84uTpWFhX8jj7e6w0qvndaGqYvDo9meQ1ulp1hd2ood5gO8oHAGcK25gbK+CsB80DxzeP12qvL
 +KYInKIPLB59JI7AouA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=696590d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V2uskYJtpVaDOKukMOMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Gb6GHsdZlrzMkjXi55JnyJSb1r5ZCa7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130001

On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >  	return ret;
> >  }
> >  
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> 
> Are you sure this is a correct heuristic?

No, but it matches what we had in MDSS driver (and I think it matches
the chipsets that were selected by the GPU driver).

-- 
With best wishes
Dmitry

