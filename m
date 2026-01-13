Return-Path: <linux-media+bounces-50577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D122D1A637
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5C1030087A2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02FD34D4E8;
	Tue, 13 Jan 2026 16:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5bbx3dG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWBxEpoh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18F734CFDB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322912; cv=none; b=DmdV58EJS9cyakj32BgPtoRl+llm7IcjPP2Aeu3eYGDsI9V9wR4vU8z0W7Mu5wAxIeBOMa/MUwpQRfmrTWgyWm635u0lAJCDXA41fub3nQIy6gatNh1CBVfgeRZGuT0P+ik2mfqYQ7HHe5kuujjNJ9G41RqClyia/F2JGykpETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322912; c=relaxed/simple;
	bh=YHiMO5F507dpIG+8zwnWeE/3fkt5/gFrTcCnfb08TDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/xA7JKu//AqZ0jg8wOsYbYWGr4lXSrSOAYvY5BW0O2eUQEpUtviInzf+U1kDbKiDr2HeHxmAEvb9i4eBHl3I4UvHDveQnCZrx5beUIGrDSDbm16BIncsK6tLponkk/cU/rKok6YwLQ/YmWUS7dql/bO8vlYlPvISc4fjFhMiMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W5bbx3dG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWBxEpoh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBsvd03810617
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zm7s+brPb7rRGSHomukVRPI+
	rYMqYiyT8iaPOnZMWIQ=; b=W5bbx3dG2qXfoxB7cJxfSLufnzaPPNgVXFq+Pisp
	v4pndINFnaelkUcTYOVdts80yFSQn6g4PDQjlxYCIJAvoc79lTP6qaZsjDSDECrG
	AnWN72V8+fPS7Fj9DhTeu5ZHVmmZuvM0ucQccz+R3BRFj5lytJczohI36J6A2l5L
	j3GQ0+zsp2Y99eubmRmKjQ28QRtP8ZQ46hjLmqEAosIjDaM0ZERMQ8zjs+Z7Bu5H
	stKto/GQjnhtglQ38B+VmEjHGGqEc36vera5I2s1eVCO6vvvbshu3K5eEzyhlFtu
	MAD4zrPSxPFiKoQRhxt9qUUkKzLzSgOhY4youiwHtiXxdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t6cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:48:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52dcf85b2so98931785a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768322908; x=1768927708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
        b=RWBxEpoh7sDrb4ugKwekdl5VHLjuZoCtk9aB9Jry73KIiMcP3VqR/SWy0CJOA+kkZZ
         O1qkYI8taZaSlO1kzOx/RHEWRNayJGd7rLY0Oelb++NtPQI78rUU+IUSuHjDSgooNiEb
         PeJMIZOlZ0cg7uu1E0CbIlQKHpavjB9TDdx/fX7WbDWeGAPrvQfd/YxaX8D+W+jsAy6o
         Oy36D669dGhrm3dbhJPnpsqJ7nBp3JMBygJipEesmqO7FaB1FW2XXjq5I6jfM+V/JS2s
         QPAlrdhjeb7bxSJyy2tZA9egjsJR3wqgEM2+Y4reN+jMfxMEVeVs11TVa1JtF6FE2Bth
         PR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322908; x=1768927708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zm7s+brPb7rRGSHomukVRPI+rYMqYiyT8iaPOnZMWIQ=;
        b=r0JGHbwL7gPEkW2wvckZzMhmHQTjHWul3BHg36Z8yiB3fP/nLyv18Qagukggtc2uXh
         o9yexUCY4wrXPf6LJMZEnCY0CNOdayip2RRoBP7fUIRPAa2ZQpd+ekTVUrumhKAv9yPy
         aZdE6LqMjsx+LN36oJ2e2UAve09NvQXoT49vK7wjLXrgv0RzgmAZphYnx7Zw2duF6TRs
         d9aV/S0jLvDvV5j9i49lAFpPM//JCphqRM65Chu82jjhXgKlPlCXQFWkFaYxa4QC0Vvd
         mTWFpYiMaMNVwpFonlIzkEaEPgD85AGpjdyYl+MyUpaurUSDF8NcNW5ExdWOd31BmDUe
         NBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEmF3fM6gXkNpOPlhIe7Gffb+2hb/0LOxGyrUUg78/2j+mcQw3+3/h507NZuSWLTPqko+BjRqGPc+k7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtUQ5S9K8qNE3QtTt7rjMRduFvZXOCb1yk5q+KTO0CKI4yf/yY
	AU4mSrml9PMaeoDSbIGB8HaVTlcXyCDEHkm6U3S729ag3x9RzRvpeSDtFghaN9VbOnNijoOQXZm
	momelxUhD3vJLvghklM6KirmBORjD/XtpbBhRprUylGToI55YS6uitPwRLLiPNSvnQQ==
X-Gm-Gg: AY/fxX6/9SOLOc5MvzycH+oP8EgihLO16y7Zp8rqnrTN6XT93TExoe7xTBqwVGzzS3L
	LFw7uv3dybzG8P/AguKhBKWyYfcsud0ZUXwL4ZqXvhisqDutP8cb2F6QS+3PtSB1aZfzxnIbzvp
	4lK+TMgyMMR2Wb8mGN4ig0vmQuwnrL03ygn58s92BPiN1tv3dpOpxYW4VHculNc1XTP0ub7B7ew
	Mzj4tWy94l1CDIU3zAkgHx6iFI9eUqVtjZ+jNyMlsAifoPAC2gl4PZ6YVx57kdbu1HBHzkrU0lI
	hN43+ei1LznOuFAE9guXBZsGzRTDT107Squuc0sfMnLjuc/NQeLuL1tj/9qVaSa9Lb6DOLF6XSM
	G1jTrwGoL9dWGGuqVrxl0332cbq4NxbKzhNa85aGkADBRAu1hyuI+lwZ2Zf2xXjhPsiX13bvuPu
	1bPsKSn/3N5QDouSJRvxZl46o=
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id af79cd13be357-8c389395469mr2988545985a.24.1768322907953;
        Tue, 13 Jan 2026 08:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/ExUCSPgVzvvxOPEhYjHCLUFmb/vE/0vCZKgFAvf8K/jL9x4lsy+VV+V3Q1Gxgy8LEW6xYQ==
X-Received: by 2002:a05:620a:4443:b0:8c0:ddb4:2141 with SMTP id af79cd13be357-8c389395469mr2988542085a.24.1768322907555;
        Tue, 13 Jan 2026 08:48:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75ad8b46sm4370152e87.79.2026.01.13.08.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:48:26 -0800 (PST)
Date: Tue, 13 Jan 2026 18:48:25 +0200
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
Message-ID: <jimbmen2n3vdlghrnnuyexeeqwirjxxxye5joh5vvjgggxwg25@yal5suwpkh64>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
 <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
X-Proofpoint-GUID: 4yUPo0FgVLdrnqvqx25zsuhgBE_QLsyK
X-Proofpoint-ORIG-GUID: 4yUPo0FgVLdrnqvqx25zsuhgBE_QLsyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXyO4spxziGjQs
 KBWwCddbZ+BzwOC7tjoJhxYqvYbKN+5m9ykTHwCQngbJnXuCBNxSZNg7siaGtBzGw5Ieor4NihH
 ht6xJmiFBlj2Ziu6L/1WjzTfcta7jXipj/my2/ggat9hnY63DpOwX9GRT2QWlOtU29WYnU7BQj9
 +J9cUWVSccNVPdG4HSuOlXBkpdCDhg4lBsA7HfepDQhZ9RCJDUq7bJMbPVJRN2QVKOcuHs410Xr
 pZg1WLG1ty4pCIMOjbPaw6nD4TauUoRC1FIsc3oJdF2OAgW50dQBCB9LrC+4TRAdw0xTfW+oM4n
 fbijjcfrlx8dAYkmHBfTEUcx766jXKU6rITCTlxrGyUcuhrMqClIg8l5xuciVFfq6B4q2Dg9Vw8
 SoHT+0nYimoCNLG9h7mM81NR1GRpBSQ5PncAMrNk5mufAFgnfpsIKcOsS2yoYi6Hsv25m/3pps3
 mgOzIv4T2M4JtlfTLaA==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6966775d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gylY1NlVxpGO7Vunac0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

On Tue, Jan 13, 2026 at 04:26:50PM +0100, Konrad Dybcio wrote:
> On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
> >> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> >>> MDSS and GPU drivers use different approaches to get min_acc length.
> >>> Add helper function that can be used by all the drivers.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
> >>>  1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> >>> index f052e241736c..50d891493ac8 100644
> >>> --- a/include/linux/soc/qcom/ubwc.h
> >>> +++ b/include/linux/soc/qcom/ubwc.h
> >>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
> >>>  	return ret;
> >>>  }
> >>>  
> >>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> >>> +{
> >>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> >>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> >>> +		 cfg->ubwc_dec_version == UBWC_3_0);
> >>
> >> Are you sure this is a correct heuristic?
> > 
> > No, but it matches what we had in MDSS driver (and I think it matches
> > the chipsets that were selected by the GPU driver).
> 
> Should we keep a comment that this is a best guess that worked out so
> far?

Sure.

-- 
With best wishes
Dmitry

