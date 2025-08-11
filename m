Return-Path: <linux-media+bounces-39424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD471B205D0
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 12:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B1FE4E143F
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5D1230D1E;
	Mon, 11 Aug 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+aF4Lu9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD4230BDF
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908750; cv=none; b=Gkc5+rL39dAPgE4g5bKtBJvTi+oCa+hF9uXBDXV3zaE555+NnkaZufC7ffrBP3LCMfUY+MJ8a8U1eOJEauXL5XaDyeE1GdhyHqeKxD+YETOlnVAw4VNxFeo22S638wOf3JucazGw69RJKBSCdJbmdsNycKCfPULGLDf4WvhPzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908750; c=relaxed/simple;
	bh=kdFYH1VYiSyu0VHOBK+SFNLLMYFqZVqZCDcvjsyo/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4tCurQrv/cUGNoZ9ADtAK9QGclAdvQjExmjKC50z1u06rUKzvy8X/T1cg1Y8hTq4O2tMAhilHqfVsR6ejTCSmJY4H5sci/VrdBIgytvsHtgRzbC8MAAUkzTCElD45BdDedggV3pQqVuKs0yit1Q6j4E6abKxiXzBYMrVMerkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+aF4Lu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dOrC000912
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8nAbwc3oA2Tcir9RuGi1mn2w
	n6rS+EOUE2odnraMql8=; b=c+aF4Lu9YR9hMl3bkVI8kdO0Ijf+TeNdiLOXcK82
	r6dwXmNds8EySKqC+OQ5+iTPrW7FioT63t1e6dq3DcJEsc0o83EdErJhDjE50WoS
	bKdl2P/S4IdhgAZokd7fZeMfUzkkYrgf49wdfPN6r7dvOnwZPV8oSOmpOpX8nyZ7
	aBpvT1hfYblJYzoRS2AigbHLtKYa2jJ2W05ze6cJS9NS0FfyXbqixk6wD01jLE1H
	pxwASbeP4pu4kcRBH4snHFrhykcNfIItJZtAsODFyltKDQJvP7dtiee/GFq2nPHr
	WxbkgW/M/V22qOO2B5999AV8mWb/1Cp18sa3wNZz8+0O0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9m06f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:39:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b065932d0bso129472451cf.3
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 03:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908746; x=1755513546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nAbwc3oA2Tcir9RuGi1mn2wn6rS+EOUE2odnraMql8=;
        b=AUk9gftYTVvp/M4CtaWs/IuTDfNqJzujP5gFDy5TKE9gdGC5n3bQm3i954OfRCufpb
         q27OM3vVEkXj6FkNYP7cBAX8UHpH1W3GRWNPPeEMH2nAGTYyvnZcsEWNUoAauWwoQ/Ee
         0idVXA9xvYsxwCnp/TYr9lsyFzIBwl9ALLSdhZ7/zNQAYTAlzqZ2+tl1Juwiccf7E7eJ
         DDw0GDnRuLmWbSb0iZo94gULlg2+CqzdTQ4PmGGgPW3ipIYbB+gXvZ1wx8VQFzezSs3h
         iuBi/whgho+LJZsMB9jofhTu6rB0zeDayuz+5JCeUsEbO8boEoZryFmBNIZjOvdH8JZv
         Vkpg==
X-Forwarded-Encrypted: i=1; AJvYcCXE+PrF8hcVefi+x4eAx/urGbrqNYMo+pgl7BuNGNyKxfYuGqOaBgB2+2YkxNd0921VzvBZWl/fOymIeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwehpJ4r/LmnqJXT12x5t2FhF6uNb2XNy2HkHsszE+/rhJWm49k
	tw/PVPjpUiNiFI1BdS7CVXZ4iPhi92XQ41NRnjC9TD/1ttHccY5U3Yrl+/6hgm92xDYwiwJnHCm
	0XKKTl0wp9gBAv5CqcWlGutlMLPy0KmsxXojgf3IHFt9ziPtLoQ7/pzPXw2g8FWjsGw==
X-Gm-Gg: ASbGncsMne9/v5sFeG2e9S/JNL0A+BgC/JXAHGe7KGvj+reydD2DkF3NfSWVsDFcHU1
	TUAiqW6RVTXMPOeWGLClfzn1nW/QY1nRH0bxIqI+5pCLICpyTko8S8pmImsaBk6oLFrdUg8/UVb
	eRtgVQetfOjhRI1NWVRdALA/sHwtZjLFy/D5087p7tFpnO7AZc/Ur97B+hRBShNBwGymXd/PbeD
	xVyQezegqyDuw2EG3oS6hrl6URVKyg6OemF0EnQZfRc6xeJnl7HrN8BcJk5uyHE6WkfGqcDAZ2t
	LiGZQUuG7P50oW+ICjKkclrs9dFiquz2g1iqKwHvYUsZvuPzNB9q6U0A5ngmYrTnZh7hQ/VxLmq
	ENGT4npY8DbZGpAQX0HKhu0aTvNHCZ1ZVcwm1O3QutcAHfd57IIs/
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id d75a77b69052e-4b0aedce1f4mr140012451cf.35.1754908745897;
        Mon, 11 Aug 2025 03:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiBFLWSXP9zPRYzgdj7IXxfYgyXaalDNulEs8SfPCYgfuywaH3NXBNE/AI22m/3gcN9RIVqQ==
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id d75a77b69052e-4b0aedce1f4mr140012231cf.35.1754908745375;
        Mon, 11 Aug 2025 03:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272944sm38386241fa.13.2025.08.11.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:39:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:39:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
Message-ID: <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
X-Proofpoint-GUID: -yl5jfJUP2w67s8RfPUVegsoYWcpiQKH
X-Proofpoint-ORIG-GUID: -yl5jfJUP2w67s8RfPUVegsoYWcpiQKH
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c84b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wkYRGT_rTjh0G9-bfQYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX/CpblcsQxzBq
 Z+ZKvuT5V0tGiQVK5/0DFYjAqSkXpyMZ1AvzGJD1O8+HLlZqJ2NjzxjkmdwZFu+8ku799/6nEGo
 SRugB0+g23I14V4/r7VOVXt0HpMD3UalfyK8N4ysU5iH7kNj3JrOXcekL/gkbbb6jge4E5AcZX7
 U44wHZlM4lj/wNPqdaCnhWr7TOM93AL3hKW6hubPRrmoSRYm4Pp55JSD4LM4rmTX5uNhIAu7hwJ
 MXKSyr7+2drSuRrAPEzDhj0stYeGKLa5n1YBXe5I6DN/T2sI7S5VWmEZc8455Pi0lDKNcjmru9l
 IdCchDgtep+D1mQrxaH8uPDtnGWJCrKQ6UJIrMkNdRaNo15yUGpIYX6CqP+dcxEYyz5uwtmhDTO
 TWPwffVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Tue, Jul 29, 2025 at 03:24:55PM +0800, Wenmeng Liu wrote:
> Some Qualcomm regulators are configured with initial mode as
> HPM (High Power Mode), which may lead to higher power consumption.
> To reduce power usage, it's preferable to set the initial mode
> to LPM (Low Power Mode).
> 
> To ensure the regulator can switch from LPM to HPM when needed,
> this patch adds current load configuration for CAMSS CSIPHY.
> This allows the regulator framework to scale the mode dynamically
> based on the load requirement.
> 
> The current default value for current is uninitialized or random.
> To address this, initial current values are added for the
> following platforms:
> SDM670, SM8250, SC7280, SM8550, and X1E80100.
> 
> For SDM670, the value is set to -1, indicating that no default
> current value is configured, the other values are derived
> from the power grid.
> 
> ---
> Changes in v2:
> - Change the source of the current value from DTS to CAMSS resource
> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> ---
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
>  drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h        |  1 +
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>  			return -ENOMEM;
>  	}
>  
> -	for (i = 0; i < csiphy->num_supplies; i++)
> +	for (i = 0; i < csiphy->num_supplies; i++) {
>  		csiphy->supplies[i].supply = res->regulators[i];
> +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];

Could you possibly refactor to use devm_regulator_bulk_get_const()? It
would save you from this data moving.

> +	}
>  
>  	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
>  				      csiphy->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>  	/* CSIPHY0 */
>  	{
>  		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },

If it's unset, it should be 0, not -1.

>  		.clock = { "soc_ahb", "cpas_ahb",
>  			   "csiphy0", "csiphy0_timer" },
>  		.clock_rate = { { 0 },

-- 
With best wishes
Dmitry

