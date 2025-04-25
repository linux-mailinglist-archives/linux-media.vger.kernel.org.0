Return-Path: <linux-media+bounces-31076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA6A9CF89
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 19:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1039C9A37B2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74431F91C5;
	Fri, 25 Apr 2025 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSFUQ4ki"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBF1F6694
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602027; cv=none; b=g5f15uoUEweCxSQEQtx/XN2C5CPDbFhi8E3N0UalqCpKJHwsT26BbEuXlv6mUv0Pp/4E9MgqP8jHvPICg/CCdlQ4TQypEyApCj2gyRE40nfcE3xXLbZ8RpM9y7NpBAON2Wt9S8WTrhe5lviiNhKyp1uWNPANh1GYvH4cH7RrpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602027; c=relaxed/simple;
	bh=YE9G8mI28GW/5ukb5vBgVbGkCs/8fgzDRlzPwIB3S2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czi3KDq9+HdEDKxO55AGVWtNSQj398/2c3sPyntSWaoy5O+cswisB9mzhAWnx7v6G0HxK19XUL4uuQ9z9eAZ1NfiHJa5it0PW+oNho+R9O9G2ljXb0sVGF2BHphEvvfduUJr+EHbAzknkQYMmAsLgfQTVKknxaqr1BlTFQIrFBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSFUQ4ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKHxV011987
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6atleiqSWOqhZ6HNJhi955CI
	NiLi08p3xHpsze8E6/o=; b=lSFUQ4kiv5h9xhe+e2zaqVS+TZXDcDsPQT9rkiay
	RUs0FJO7vPvjDt7Y/0NtkjwV/FJApSnlcGB+D5YcHMTV9ueUF4yldArVi4MnyHhs
	N3Ig5QOrMcR6VGl7jz/SkLxBNjMsBsfdZ46rRKaBvRj2rMIcTFSGTJ+9gpKiriNe
	a/MGg5JI629x0RdjzHWeTTynjPBMnmv/C1kyKYrwWk+rS9PKcxUi3V4Lrb8NqCeX
	W5rJ3lROmLD+PR7fjm8sIM7RYPIrnEq6WV/9TlDeghDR111AQ+VRhuM7nJXs8CAT
	MgRrEoRwJdYAS/+bmPtT40b113vxZF1x1JMxbHNaEcHBhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3srt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 17:27:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c95556f824so268616585a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 10:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602024; x=1746206824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6atleiqSWOqhZ6HNJhi955CINiLi08p3xHpsze8E6/o=;
        b=dwMV3estdJm8vwssYcsRMASN15hXibzPXapJQnjxcJz2wE3cLUDkejslYD9/bMlvTs
         +bZ7t0CaBEe8d4xaS9mKbuo2PmqiQtcGU3G/TSnc+rtJUIRUezu1bFfi6s08Oo4Hnf21
         BupYwtD0Vd5anuP5KoT/PkAEoWTQCXR5k8CHOriFDaLsXvTLNdisHMcb2haYVx5iD2bx
         ihFqHYR9Nt3zBsftuF94HwVwKM4LlbY3yPVS5atyEpn9XTY4pA5u9Mba4rflnvyMCeYX
         g6gWyE2MYrlJQe/FIG3quJkfBPuFqO5q4qQj5gudc7dyeCrtfue1i1Ggk6t7T4dgvud8
         pTcA==
X-Forwarded-Encrypted: i=1; AJvYcCUtrG8ep46SaiuiY+2wYU1PtRIcyzX7rqkvF6t0ImTP5q0AMcdI9oCfbReLA6/XorlzQTYGjw5EzlmX1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqS0rpjLX3dq0gedTFXKXmR5PLLT9+qs4DGBosMXtu68YUiCa
	ke3gQ2LFOgE1iinSGekVicJw/rDEtzYR7B/neM+aI4ClQ5wA/f9X7zILWcEWjQM+x9fLOO0SW+E
	dLeC4EpMjjdkulPS/0KBuEHwiRC2UaEMgGo8OcukaTAGNadjR/VU8Fh6hNMInjg==
X-Gm-Gg: ASbGncvM40QeFpPo1ihYSgYRpkR0EzHPKAQueiQp55v/3ELjVflTcUd4zi1/W10boOC
	HMT/255+Fow8p2Fr89OuGoIX/TnR9Fw4wmZSmotcm6OZkESvIZNqhw2dMyS3Cxol4CXpa1fstOR
	C8ThRmHVBg9Uu+Wq/XshcYh0CD0tjZcY5HMlbrf44RqIZWFaN7SsRZmfTk46BxfnIAnGhd98E4e
	wu4ZU4PHecOLliRf7xgrIL19sgqO86v+gJcfeewk3fdn9geIAIELUPkFGUWn+YjD6J/NNFpCQbJ
	hW9smzUwmYW5HmQWywYDt2lm8KmdXR9pJkB0WBtXFCtyyAQ5wGNTEDFBnwVNnEVRKvY+C64SGJM
	=
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452397685a.40.1745602023686;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfcY2I+rhTM4dIprfVROD5tVH+EAafw13oZ005cpJIfKjET5O8mPgkhb+t9ebqxFtJj9FPRg==
X-Received: by 2002:a05:620a:2a05:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9607971d1mr452393685a.40.1745602023298;
        Fri, 25 Apr 2025 10:27:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d90sm8189881fa.93.2025.04.25.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:27:02 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:27:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Message-ID: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
X-Proofpoint-ORIG-GUID: Ewc-aC2HQnLVBozCTXVvnUuQAanrt8MD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfXwlIHaU6LI8E+ mY0vqMjR88u5CB5qZhacttJ22B07SjyaVdXR/WX4vdc552z+GFMpEEq6judfc01OsMYgxIbYgQs 6i3N1WIEhZoFxOXte9YwXo5VFxMtwJP81e77UOSn5zyatvim1DF2LmXmvaAf6xehXScBbieL8IQ
 hraDuMbhVd5jobZcYqM0NqRd/6JlSFrvpVyfStQxsA8VSe0QCD52RzEtPqsg5UC20DpKiPFTESq R9Y7HD7vRAzP7CwARKJvckYjLkwfxCrL6fhDk72a1oD5FoTAv2lXvRdwqNhlM2BJ4YXF00ZllNy HX8aJuSiW0smVfDqq50HFxOXRxxODLIQvNIl3Y9vOynFW0ydp7R402MsFpFj257KhgKeTyRxjdt
 RWjd2p9hOilpxf5hGnD97fpdAhT1aLutGSfeOeaXjBJzqpyyZuYMCA1sc4linqoJnQnKUpN5
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bc5e8 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=QtrjCutIs_zDAuGvUncA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ewc-aC2HQnLVBozCTXVvnUuQAanrt8MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 04:17:34PM +0100, Bryan O'Donoghue wrote:
> Amend the names of the csiphy supplies to be specific to each CSIPHY thus
> allowing for the case where PHYs have individual or shared rails.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>  	/* CSIPHY0 */
>  	{
> -		.regulators = { "vdd-csiphy-0p8-supply",
> -				"vdd-csiphy-1p2-supply" },
> +		.regulators = { "vdd-csiphy0-0p8",
> +				"vdd-csiphy0-1p2" },

This is an ABI break. Please mention in the cover message why we are
allowing it.

>  		.clock = { "csiphy0", "csiphy0_timer" },
>  		.clock_rate = { { 300000000, 400000000, 480000000 },
>  				{ 266666667, 400000000 } },

-- 
With best wishes
Dmitry

