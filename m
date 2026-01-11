Return-Path: <linux-media+bounces-50377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA80D10168
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 23:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50BC43048161
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 22:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34802D5412;
	Sun, 11 Jan 2026 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4k2zhc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBWBlatr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6952D47F4
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171161; cv=none; b=SXs988DtQtikEq+HR6FajueYTHf+VUuW1aHbDGX5qo1yggQ4MizIANJfNdL+j9BYks4I7yRmZmROrESsWNi23JPkucqfIcLC1X+MesZcRfq6u6lIHp/jcuajOHoEmjXi23kGuHVAaGj1FIP3wifEa1q3Q4Q3pPzcnzcVRAGE1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171161; c=relaxed/simple;
	bh=SLxSfDP55Iow94sBZpDV3Jg7eEYC9ZFLPiE+FSF7ZZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4KbFzT5M21LsSbPSTJMK+Pc4rix1tBQl+KJY96iSu0dazudh6Uhq/ECpPxTRm/n+iab7phbpe213w7hNJoVqX9S6HuuLGrLonHxh5GJB4vUkMKVf1i9EHzUW2zrsJESUrk5P8M4pyHc9USNoyQQOaRSuszCPfZDu+QpD6t2knk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4k2zhc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBWBlatr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B5q1AK2070456
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+RPBAcP9xaNHoSSDkl3fH1Sy
	vIjRExAbikGPqzw/p/E=; b=o4k2zhc2QhydfBu0XHJiMVi8osO0npdSDP+BRE2y
	Ye7i4/4BI84xYxlOGsM1eooQ5OO/vCO6G3+mpQwbBM1HFU4bq8Eo3BGRIeV4QetT
	riugmai9Atjkya2N4+MfcOrB0PvcmNeDZ0mnzuWLmdFHCxBNPxpOGZm5kArEXshl
	QbjwIAtn/KQyYAFUUuaLwIue+gpMlIN/jwTlLJ05/MRzbPgC8VI+ZleoA1zUTXXo
	QYQLTlJbAMs7zKrcOoWIaU9t6iUhnz+2x/sAvLllwyC0qRLXwUCN8fZq0X9h71kK
	qNm2u5OiJL1XTe+P6gbOL7Xx8L1NsGQEMAwHruFJxls1zw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhajths-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 22:39:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2a3a614b5so1332637185a.0
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 14:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768171152; x=1768775952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RPBAcP9xaNHoSSDkl3fH1SyvIjRExAbikGPqzw/p/E=;
        b=LBWBlatrBY76GmlZAgjTrFKhy/IIsUDc5vMMiLd9jcWmI1nb5vMrbGeHLU3hkECyn6
         LHO2JCBh500pHTsHpZv1qROtCS/VsT50se/G3QavLhbgC+ZGeSbM0jCyD6kzR6XxdjEu
         9TM2G3jPB3cBj1SDOcDNfUFlA+QdYQaRCdAQvvL6MVHaGEj5uyJDp0fNJUHf7uy5MwnN
         UPSOnLvrrKPuV+351yQn0WUTNaSuY5r/sVbQyTCBizwlDgF4doBPkb2dcDoO+ajEiXwg
         geF0KIIG8YnLphw9pZztsVBymSPAo4XsqFHuhYmY2dxl0Kv6wZkoIl2l5GM+WP0AsELQ
         S/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768171152; x=1768775952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RPBAcP9xaNHoSSDkl3fH1SyvIjRExAbikGPqzw/p/E=;
        b=Efvq79Nr0xi4yx4l/Ix1uDM0aJfPDNWFMM+p1fKP+Et/SY0p6cMnA6fhN0pXRevFeR
         rIUGMxm9uT9wTSrM0+O2WTrM99BfA9+LBxkJy9zFwFIzr8+m4YfDKj+wbZ3hgn7n6D5g
         xUjiwGDq4zQ6OsAm4Kcn7tcGzXUMzciosNTjz2IabgSu+EAOmUecnWiUJIQ6FCDmzgTl
         NiZH4ybkSDra4d0LucgmQsKa2idyMQZ04EAPoILEdh+Cvv9SgM4vEhnPhBQhf3wYZGgT
         uGhTkWE0jdJb7z8dC+lSKHWdDlYW1Axf4M0vV1xqAnanOo6ZtfDhpFsH8xt8gGBYiInG
         jxgg==
X-Forwarded-Encrypted: i=1; AJvYcCWnNFWmcF+8hCX+LRXI23E+45RTniTXg9YhW276J7+jdHOJ+06GYBymbLalpDHv1TRmeqbZMq4LtapSIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWVDq8BSl2pyw1T9BmDkX9SUZ1PZ8AH4aLF0uz7GSwfb3lHH8
	85MTeuZziWlHRkIip0/NTJ05AfpuDTMpSYJxekhNnw8avs8pQ7Jpc7xfK6uDEPXAI6/DI+YfXX3
	Z2oyy9vmJMH1M3rdFrg9PJ7I3wjL9o/lhVMxjIURDsZs4xJCOzISkjqPFVxj2Tj6eSA==
X-Gm-Gg: AY/fxX4WSWugHk2yMZOfUhS3QTePWG50umCg+zNfQo3wpFN1CIDXDMa0KqOetK/hw7r
	Q3B0zwNzIb5GS2kPtPkSVCykp75QSkrNHFwfPi6gs4hI2m5BBGRqEtGBMjPCd5/B1URpcrVAMlC
	ZmNL9FRkZN6HaF0uRCnnmX6cb2wg/KgzAKf0cgveXttN6Ov41njjKTRzq1Pgjvz/wyzdlksMIbY
	33tPdSdzAFi92GmeTQUZwdXD1vvUVDG4B/tZNFpmE6kTdVpXlkPuB872G2DnVefODgsaDVIAnIV
	H/6bui/sdC+NB4xKnNGbqo49NbZkEVIZc+1CMKJtWRyPto7xI71YIWn/9Uc06+yrkMImzEIom0P
	/g9kbtgQQ7ZLzzRdPu/mQ5pFtzYUcx4WVE0tj4O+h6pFkXLPW8I/bDZyvcb6JuvmEqKlImGFkXa
	1wa2hSyJcgTCRy0GdKtELaLsc=
X-Received: by 2002:a05:620a:4081:b0:8b2:ed3b:e642 with SMTP id af79cd13be357-8c37f53760dmr2840811185a.34.1768171151571;
        Sun, 11 Jan 2026 14:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjxdmJgakn1EPp8Nr7AXb0meRMwEnhmDGjxOcxQ3/OAMRAeTXOCi00XDZHpl3r3/CPT5gJkg==
X-Received: by 2002:a05:620a:4081:b0:8b2:ed3b:e642 with SMTP id af79cd13be357-8c37f53760dmr2840807885a.34.1768171151049;
        Sun, 11 Jan 2026 14:39:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea275sm4270403e87.1.2026.01.11.14.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 14:39:10 -0800 (PST)
Date: Mon, 12 Jan 2026 00:39:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
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
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <hkmtcrf734vw6bln42uez2iqt24edmrxqplleh3ocbmwcvco5p@bo5qnf6vtdtb>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <s5qWCzqArtZJ__Z5g_Op86qPiA_J5OUkdeknnroNURmDWWR4-FvpsYpevQffI_wcobL40Rz9T71z3TBgVw32dw==@protonmail.internalid>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <bd95734f-5c38-46d0-a3f3-e88f85d384f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd95734f-5c38-46d0-a3f3-e88f85d384f5@kernel.org>
X-Proofpoint-ORIG-GUID: zH0KxR0Wwdor-6Y984WYqVfZj8BfrZAd
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69642690 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bOdX0WsABJpHto0p3fIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zH0KxR0Wwdor-6Y984WYqVfZj8BfrZAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDIwNyBTYWx0ZWRfX0TIgNuYn5FbO
 H4I/x4vzAZlSqQX183n8hJEcrpePxQSrzVyTielgzVsV97Ifo1S6qTLnbBnjik6o8pzQG965yue
 OqGnf/z0dIQMQpCMLedLTywqJ1e1XoACiVxo8hbRzV9F63s2A3Xs3XHV8Vuk6G6hph1t2ir9S+l
 zvraMhafQ7R1gB2+vf3rwDjFbkL1NjLeLs6+3rStjGL52CBgAp0mUMJvjaRMfKSqQcT2I4qkXFA
 ozoV50KU7Hx8oxf1/DVlgCCcosh3NpXUh3c2Z8sAfMQE/hAEh75PLOF/8zdr+b9ATSwCANngNKm
 FcLv3HKY9CE0xHJEo2xvVAijubP1PIkECFpHHG2A/p30/yMxFnnMG5+pAYhLwxXfKcqFM2EhthL
 NILamt9D3SXThV1KgpCk/kJEptZ/uoNOsthoxYlJltS8iPRfnUCvuP4zBaruasOxjNbmHh0KKY3
 9D61MyO98Ajs3Tz30Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_08,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601110207

On Sun, Jan 11, 2026 at 09:05:35PM +0000, Bryan O'Donoghue wrote:
> On 10/01/2026 19:37, Dmitry Baryshkov wrote:
> > MDSS and GPU drivers use different approaches to get min_acc length.
> > Add helper function that can be used by all the drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   include/linux/soc/qcom/ubwc.h | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> > index f052e241736c..50d891493ac8 100644
> > --- a/include/linux/soc/qcom/ubwc.h
> > +++ b/include/linux/soc/qcom/ubwc.h
> > @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >   	return ret;
> >   }
> > 
> > +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> > +{
> > +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> > +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> > +		 cfg->ubwc_dec_version == UBWC_3_0);
> > +}
> > +
> >   #endif /* __QCOM_UBWC_H__ */
> > 
> > --
> > 2.47.3
> > 
> > 
> 
> Why not have this function return either 64 if the above is true or 32 if
> not, then rename to qcom_ubwc_min_acc_length() ?

See, how it's used. We have several callsites which pass 0 / 1 depending
on MAL being 32 or 64.

> 
> You could imagine some function SoC having a 128b length for argument's
> sake, it would make more sense just to modify this function then instead of
> all of the callsites.

It would require changes to the drivers code anyway as they would now
have to cope with updated register maps / values.


-- 
With best wishes
Dmitry

