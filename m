Return-Path: <linux-media+bounces-37553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B62B02FD3
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F87189ABE7
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD5C1E51EA;
	Sun, 13 Jul 2025 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7hkrAmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDA1D86C6
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394765; cv=none; b=IvLgaegjmI3aT0lKS2f1eoK4oYS15r5WPY6sjhVdmSjFBvqMyRugfEkpeon+G1qHGQcl/5exQc10+yaVF/VfgaQYc/DGX9Xadpd73Pi9+yMlEMuIgePveKvVUm4xZaR2s6FeyYvTzdEE7CENN2Nn0s6nHj4rvqNwyVuOL6Hg7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394765; c=relaxed/simple;
	bh=ygYuN2TTNL2SM/3Pw9NF1EZYs4Jmwm183kP3gMiksRs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLV7W+ZfP48I/CSuDJJsQmnROZzw2so/1FSwKfsXsORRWUM/RrRyUzQqXN47uIdFLwYyryOvREYYTghYWbBQYSV2OsA55MsXo+h1rh/GOyt92J6rS1W0Hgq7xeL1xOiir/LLmVsDYnjQuuWSWpKsbmE78bieKs8ZAeoVdyCyonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7hkrAmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56D2YmeC006712
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 08:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvVyW4KQM51jowUkrrNklb/y
	GAEEPyAbTimsRfsNU0I=; b=o7hkrAmtc9G/UYbo+0ybUftp2vIyXp9rMQE4bEUC
	ftGXDVsM+zZrCtIVZGGsbEK5aCY1QJZGZBabNqx8lwbpZWvWaQdMYUvl6dWAyujU
	nSrh+eD6k5q0B+8vExwKLhW4Bswc1X/oew6MwVZIDchM/i5qE01VwcjNHKA8ZLXT
	WUXLXIfyqJYZ0KqbDF9kdw6XKTCN7ijd3NKrAtkNq9Atu1MndkaRw+w0HuDCc56a
	1QjiLsrKi9/rBOq+SEAGI4nn4CR57NKyInrs34d4NWEQ+2r4M0FvzE42WxwFLDMt
	SYzwbDP5sNnJBRm9+VLZ+F8M4iw/ojKrYLRZELF58/HgDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmsr3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 08:19:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so654365885a.1
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 01:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394755; x=1752999555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvVyW4KQM51jowUkrrNklb/yGAEEPyAbTimsRfsNU0I=;
        b=DD+oVcCVY34eji14/8FdaCWChacBx7XrBViHZmHXnBKPAoIOC2yEGKAOONJXnb9vZP
         WBv5Yb7tHZ8tp2CWPx3n8BtMIRj5WTRlVaWEqMYSiJ5X/RVkFD3Pe868h/DqYFTHJK5W
         IZDtUPXfjRNR//ep2uuSBBUnms62PE2+BR+bZ0edLterDGf9UeGGsLFnDQI+YDeXy62T
         59LTgmdwygkNuKd9Y/PpCMNV6X/URSlbN95WLqzRIk5aF7uc1PwfuGoCcfxdqwMDRutx
         +qFvoVvwQO7sKuO3/qauIVGNzWdT3LX5DE41OgiEIZc/pRRfiI6ph8TQL0G25oXS2l0z
         nyBg==
X-Forwarded-Encrypted: i=1; AJvYcCVzxadJXcNbbuvZ7oCy2P+nTxsEAHBm3cae5Uf2Xb2R02eMKYZkFabK3j90rEPr8CUg9sIMf0DoqGPO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMVNri76VkIQYDMLxyJbVC3Z4qb3M82WZAiVdf5OMgaFUwOTQX
	9NGZA8MQ+USvsMwP/zgkjtsLvxX9JnX6Ejlu250YHIzdpzRA5TFb3zapw1q8tDVHSLNeBgqaE4v
	lq45PdLdvscigm4tVLPpUV/oWasiviI1NH7HtlAJyIzULjSgd4jM/zqgRDWWmBQwskg==
X-Gm-Gg: ASbGncsvjOzsOhuDox9RABvBkmgt4gA38pgjk+3KQe71xKMRRWE7ylcU7p0MN2pYuhw
	lXw8e8RkH2wcLNvVoZiOAr7GVxufizs9AHwPkUvi+5gZlMWBQP1FTHJO0WWfKJ7VSMuohVb2K+I
	QMF8l4eLCQFupwWU+CT3AYJTa55DcFQ5WTstW72FmmR8ibSUAFC+/7nAGeX6UgpIBKQHCqrkl4N
	oug7FcL6Kqqgi3oHWtXZBsP/hNh87qLW4eJOPkSd6I0ziN2AbnPXK0usi1k5WqWvQx5u/C7OoPS
	sULPLuqnkbk7BSjw7wd6uCEBznJQE3xzBX9nEcLmiLMH3Jif/tGTQjlbKSx8K0zWJMuflVrCJtg
	=
X-Received: by 2002:a05:620a:4056:b0:7db:94e6:4929 with SMTP id af79cd13be357-7de050a6b69mr1148779485a.20.1752394755298;
        Sun, 13 Jul 2025 01:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAXMY4Nu22oS4iMPfYBCmtTx31uTknxbB52WB2wjHLaXr79YWw1L0N7FvVH1enfsTZncgitA==
X-Received: by 2002:a05:620a:4056:b0:7db:94e6:4929 with SMTP id af79cd13be357-7de050a6b69mr1148776985a.20.1752394754876;
        Sun, 13 Jul 2025 01:19:14 -0700 (PDT)
Received: from trex (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d758sm9002937f8f.49.2025.07.13.01.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:19:14 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sun, 13 Jul 2025 10:19:12 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aHNsAP6Q6mvc6jX6@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com>
 <aGuOzdCu5UmKDF94@trex>
 <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
X-Proofpoint-GUID: r8EJY_2Csyw5iccoYSkDcdrU6T7nMHTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA1NiBTYWx0ZWRfX8ZD2sAGaWX8C
 YVF0IgKKCtbOm8Xz98sms/M7On6O+9pprJf9FJDBAPTe7+T9gN/uF8Q8cYSAMBIYxtwA/+GGLic
 mXCfiMQPrWv7C7tOL5wLlvbiG6Rf0cGMWBWOjEAhEnxW6A0gJHt1l5mE31mPAPK3iy1sJ+rzuUF
 2ibFowMOJfLO+yOPa9AkPG4y6erS/mRdKq8MEUbmWKuHp+EcmnFX0ygdX+rKf+8Xxj/hHn7LBSI
 s7XRSbcc9zbiQy3B0QUcEKyZ0OBpz/wPdB32KObF3LqKCSfR9JWLfuevj9V80Q1Vmr/3Qv7KQyt
 1kDW5NK3JiV4dZYqPExfoG9+twlc2IZr/z9zhvTc6vo2O6DzqIoNmUdzJWzJnTJdQkMhmXd0jTn
 8dcfU4uiU963kZXmWoku/OXFi1dXxfuv7wwnNRdikDc5pXs3esur8kIXyNVC+nK2aj+iI66K
X-Proofpoint-ORIG-GUID: r8EJY_2Csyw5iccoYSkDcdrU6T7nMHTO
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68736c04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8
 a=DVtxpjqVNlKwMNJ2E7kA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507130056

On 07/07/25 11:19:33, Konrad Dybcio wrote:
> On 7/7/25 11:09 AM, Jorge Ramirez wrote:
> > On 27/06/25 18:46:10, Dikshita Agarwal wrote:
> >>
> >>
> >> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> >>> Add a qcm2290 compatible binding to the venus core.
> >>>
> >>> Video encoding support is not exposed until the relevant hardware
> >>> capabilities are enabled.
> >>>
> >>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >>>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
> >>>  1 file changed, 39 insertions(+)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> >>> index 736ef53d988d..f1f211ca1ce2 100644
> >>> --- a/drivers/media/platform/qcom/venus/core.c
> >>> +++ b/drivers/media/platform/qcom/venus/core.c
> >>> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
> >>>  	.enc_nodename = "video-encoder",
> >>>  };
> >>>  
> >>> +static const struct freq_tbl qcm2290_freq_table[] = {
> >>> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
> >>> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
> >>> +};
> >>> +
> >> fix this corner.
> > 
> > ok, will wait for Vikash to confirm the other ones.
> 
> Actually you can get rid of it now, I think:
> 
> https://git.linuxtv.org/media.git/commit/?id=b179234b5e59013f8772da17b273f463f9720bdd
> 
> Konrad

yes, thanks!

