Return-Path: <linux-media+bounces-30385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0422A90EAC
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 00:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478CB3BAD92
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 22:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E264423F409;
	Wed, 16 Apr 2025 22:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PREP7BRI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356C23E333
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843004; cv=none; b=d0XDSVtB/qGqEVD8gfYfaEKjsvPdksll9Sz9Kydm09qYKDa7eBd+b0bQK/SKTkxD7hrASRFNRhdEpxJUMXxVLYmqa3JfYka7W4e1nogL8kgf4ltowJP30DCpIzdOxp1yQQFPENvwbMPJ853zA7TWT/LYSGAhrpd/TbEh06dCWM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843004; c=relaxed/simple;
	bh=Wuf+YO5j7Xs74X62PNrvu/N2fyVlnH3EUykZEmoOJnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cwnl6ULeXjg3LMyMV2nTKT3+GsyLB3GyKb6jDUQY6pCoxCbgJtHXIAJy5bYupzlf+kkMSHP0eT7workgeR+d9ezMG7T6Hv1KBAxHBUGwlDxkR+Tg3cObuO7NOkqhm34xUlXuWnuYRM3oheTKK9f5nOPm+13voAeV/DFGVgjrzH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PREP7BRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GM8T6w026240
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pg3dPe7RJgCdG38kaPZfjRgD
	KXTAgDAiJeAKXzRN8OE=; b=PREP7BRIWMaCKFvQDDtXfxWa4KvgWjna3lnp5U3U
	j5sl77WF2j/UDLAAMXJMrYzPvsg3jWL0xZoNc+M9oKMmMJGoAh0Fqqak1AaNMRtj
	4bDbVfHO03DnVxQ/zCSDgP0plKwNOXy2grWzYyQyOuzoqvQM7OOWHFloVDivcTnG
	6nArIJbitT/IVaS87cPBUsCB/Kj6rmmuiTEY8JoGg7y+NjZ95Wuc4VvfsGawdCEK
	P9CEnVoRpioi7BLK1f+N8UzOAV+Tp0qMv0ftlCIzs3UIXC/epntp0TKARN8ttn2t
	+UVp2K0txggRNEj/3aoubKtbTALmWXdK70EW3JZYGUwygg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1cvqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 22:36:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b0a75decso4615446d6.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843000; x=1745447800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg3dPe7RJgCdG38kaPZfjRgDKXTAgDAiJeAKXzRN8OE=;
        b=RexlPCu1wnttGMzIvGHMu+uLcfI6oW1VQc74b5qwxFWBuqkwFjvHRHznlh74Gv4sIa
         9x+tOZYw7pk+SGgIagUdiyPsVTaSRvT7UAUsJKHHyxGc3RYubu4khxqORS5TRzZfJU9y
         6tCkF5N+n3NER7O9P4H2Rq+MJ8NmNl5eKN9pQUBMyjTiopIYc+FbzO/A+LOgh68+4E16
         6j+xVXhH5krVSE8lYLU3A+8W0Hi2LnPea0zhhKEwj8FMmI50M0DjqoJ63GuAl0CBgO34
         TqOyz7LIBMus2TMGmwjF8Rp8Kr6rPiK78Pp/SvPhSvXsu6iT9yGhLX9D1kmkFeGIEhLF
         YX1g==
X-Forwarded-Encrypted: i=1; AJvYcCUj6P8Fx3jF2EtoWvUyLu3mpluCX5CztrS9QEyC9OTDP1/ALuAs3KPSjL14KBs/XE4AkZrx/55on1iKZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9bUUBDTMqw4dr1ShX3ecqdQmRRimWLSzX8dtchd7B40VFH2L
	TjdnKaQXC6YmDDyWpu+UvlbzqYPZBjEFB0Nl0udQtqB7jeV3GM506lwTCbye1AkTEGeStR9vnkw
	PFNDB7wMnJgP39MmItd3L3PmX7ZHhRmijT3GMqHkQjrHJom3B4nVOue/gWxE4xw==
X-Gm-Gg: ASbGncvgAF7+w3NCONWw9KPbU8H3/WoXP8MNyKrYjYLk3R+0c5Y6cwrp++f0ruS+PIG
	G85d/AbOZrWKN645TrPwIafwjOwYfrr/w1gDfpvOGK1hRDA+E8ukusHvujFtdbmYYge0kPBQPeD
	ZZvH7H1D/Iwh0udcekvbKTkyTlUMg7QvJXjfy991dsYC2WsSlH04UUGpEqoqZJZFQe/hETwldDs
	Y7g5bPXJhrj2frpp8dK9NiHO0TPtWvw5ImpMrcsLf3XHHEWILtB/L5xC1/Y82bVmyXs/C62mqrG
	gAiilj9pj5cux05sp4Dcuolsk1I28qY0eAaOJKTs7bYjc3eAibUMZYCGQ3aWNpSD1JD1u2FQbZg
	=
X-Received: by 2002:a05:6214:4012:b0:6ea:d033:2846 with SMTP id 6a1803df08f44-6f2b2f656fbmr58883006d6.25.1744843000288;
        Wed, 16 Apr 2025 15:36:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECqbAAlxVDt6QZrVPtHvTpaXap+i/XG5/D0OeVcHNnv99ZRLCW4yN0DZTGEpl0r3rZcMOpJg==
X-Received: by 2002:a05:6214:4012:b0:6ea:d033:2846 with SMTP id 6a1803df08f44-6f2b2f656fbmr58882646d6.25.1744843000019;
        Wed, 16 Apr 2025 15:36:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510b66sm1789872e87.203.2025.04.16.15.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:36:39 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:36:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY
 v2.0.1 init sequence
Message-ID: <z5bemevabirdh5qhj6fajdihcucnoa5gxjkjv6s4aztruffn6u@w5rvy3sxeln3>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120908.206873-3-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=680030f9 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=qmk_QMiZca7AS3gWk0IA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kG0XNE0Fv1UthvtFezZ20bPPpdU79yTW
X-Proofpoint-ORIG-GUID: kG0XNE0Fv1UthvtFezZ20bPPpdU79yTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160181

On Wed, Apr 16, 2025 at 02:09:05PM +0200, Loic Poulain wrote:
> This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
> The table is extracted from downstream camera driver.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h     |  1 +
>  2 files changed, 90 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e..0e314ff9292f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>  	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>  };
>  
> +/* GEN2 2.0.1 2PH DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_qcm2290[] = {
> +	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},

lowercase hex, please.

> +	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},

-- 
With best wishes
Dmitry

