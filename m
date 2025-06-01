Return-Path: <linux-media+bounces-33737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA2AC9E14
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 09:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1EC63B51B2
	for <lists+linux-media@lfdr.de>; Sun,  1 Jun 2025 07:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC306198E75;
	Sun,  1 Jun 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fra72wAX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6718C002
	for <linux-media@vger.kernel.org>; Sun,  1 Jun 2025 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763969; cv=none; b=E5Buce4KFE1mNuFN9/uEczoM/YxjAmTglnwhq7KEWOnyG/YrMsGWfVZQpHEokSQztvW+U0T9GyUGgFgvwWZucNpfCSpLjPMiFmP0hovx+xY7cbkzsq/I74covGN+WTweWVOLatc1vQHlacAlSN1iTZMGlHPdqR/Gi5eGT1hcJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763969; c=relaxed/simple;
	bh=ANcChlJr9eoaI0yTEGrqLm3beJYnUN4pKAwlg9p5Su0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwpHNh0POHPS9NDZjRG99muS0hYJ37CM8an3Fzj/roHTVNsRf6uU5rHNk5Oz74QjkeZzZD4sq4FOf8de0FOj164dTEo0DSFXI+mM8f8lJ66PgTrxUO2FQjP+noCuh+4gMX6mzuUJXbHhivuoP8AzsBv9un+zmayZWjoddjfmjD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fra72wAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5510s5To023972
	for <linux-media@vger.kernel.org>; Sun, 1 Jun 2025 07:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1AmXT5tapy+pVsFQFAdwuik
	ifdIdVK917nZ3Tym9yA=; b=Fra72wAXW72RhPq7x4RoSVc+83r3vxbY2pZR8Ipi
	m7XecjhnWUyo0qzEujb/TPpacESAjHSkzMc9kE9Bfnys4zPIvicTPX0i1UWTVuqt
	wjAnZ6ciZFXvJjbWebVo0lKcVHcU8iqb6Jk8glAdBrOm64tulaWKP+AuFKvlHZEd
	SHnQgFqLYCIeOyVM3AK4maEzuORAK1jvPV2xuPc7ocXsIpRmEqoJERBAJC0ECVdl
	u2GYDzjzGszeedCA1mIiztL7E/aGbifxdhqKBOCyu7ODO2LCSCY226iOSvtKX1lv
	ObujSHpN/Vg5UzLKEd/0gMp20YJQ2ZNCe8GwshVppuSqOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytp5t04y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 07:46:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so494504685a.1
        for <linux-media@vger.kernel.org>; Sun, 01 Jun 2025 00:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763966; x=1749368766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1AmXT5tapy+pVsFQFAdwuikifdIdVK917nZ3Tym9yA=;
        b=pUAe+Xh8Wy0zGqB2et3QVHAwelULwSDiN3pf6Iut0auFCIuICu+S4oBcp+Gs/ursvB
         GjDUeXIRpOXp7bQ6SToEjaE3hNqXp3pntN54zo4yNhVHpN2cu4ejxAJClF5LoynTpber
         DSdPkENdVovtW8/4o/RLJ2BuV5pn1o7wAsAHmH9DbUK5Sb+qJLZ0pevBcT9jejcEwZCR
         w7b0dxmZhZMAUc0HfCEcvE4dGWtzV3veUSASYxAFPnQ7UJssiOSAdA9Y8dzfbnvmFP/o
         gmkcIX77hiy+UzrXOntR6QiiL8uVGquli7B4vOxPBenqqPVH4aqAxqb/PKAdaj82wRqB
         sIoA==
X-Forwarded-Encrypted: i=1; AJvYcCXJk2Rq0r6Bo4wZWySfalsD9o2fyPy/qEBVIu6v9bTtMXW4x4P+zHMQw5uwmXwLxYxuFZgBuEzXPZwOrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKD2YH97UP8W736JvZIC7Ska0HbmmpEIUKvewkytP8w63xIOBT
	cCB5fmtVQIFPECjvpCyJl4l1zV8sbNQ4oyMlYR9zq5BPq+yy+pqLXWpeJXpLFKVuUjpsnd61H/o
	cJtkdMjpxAGgLlIV0X5F++tRQ/ez+kZchS+Lj2jkwcc/XDs/2dHIRxW51fEJs8arV4g==
X-Gm-Gg: ASbGnctvCxHKkalpgHkHKwvBed2+rPo4E4HxXZVjGE7Gig16FdclUHNggwDvFjTXsqZ
	YcurkK5JDw5eVEBPDtUMOsBZmLeftF8r6h2nwlpapqEQzEb8F9wq6G27oBR/nD++/UMEznYWhtF
	QtWErw5yRGf5Zl3EXZ5mbmepExpyTEByL8b0INg5u72FphCcBEhL9ltGU5EBEzvXUxEiAuWpLy6
	HTo2igmeBXNzdDZXaZfWAtDI5MfGcsoBA45KTORU7HE5QTnO6AFOy1GLNftEAwAkhw5Gl0yoI8X
	PjXLCp0QD4WLNdgLGqolecR5CccIAEuYHhlqshe0ud7uD/KMZfInay16GyW1k9NGUNwfkeM394I
	=
X-Received: by 2002:a05:620a:4554:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d0eac47803mr602358085a.18.1748763965842;
        Sun, 01 Jun 2025 00:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrA56s48pi50lZEFzKlxMpRpFDDPAnSmnts7OMgR3IXd5D7gPYqiUMgfLK1attjQg4WbU/4Q==
X-Received: by 2002:a05:620a:4554:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d0eac47803mr602356685a.18.1748763965503;
        Sun, 01 Jun 2025 00:46:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm1221377e87.244.2025.06.01.00.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:46:04 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:46:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
Message-ID: <btmzhyullmggev43b3syp3anxlm6o5mpz2mthaskuyl7kfx5gw@w5gesyaaytkh>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6fixLFgghbqo2e6JVi3dGnY2HT6U3gK-
X-Authority-Analysis: v=2.4 cv=FPwbx/os c=1 sm=1 tr=0 ts=683c053e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=q0N60QXNJ1_sxjtBk_cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6fixLFgghbqo2e6JVi3dGnY2HT6U3gK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MiBTYWx0ZWRfX5gf9Ihrn2aIc
 FV5wEjxHg7gF+xCx1EYD79hcl7HLp1bDPu/F47wQMn4pmu3GqCL+p/Wvwf+NjjzaMOjXoAZP0LY
 hC1IGKcOXcpNKK2flvP40ABXI+sVydfBzwl8464yUWOH2sxdsF0uvj1z1PnRfSxnndhxzkGS4Yo
 q9/BOL5Up7Zjq9VCWbFg2G9SGbUvYggkmM9GYzSAojfFDtXS0avo2mrzmdp7RMG8U30UpvSkjBn
 BYmknC/QJGqltm8oF2UvDDtpibUcUiGCj0QzwTwGu/a1NChnKERIgsRvQeju/vjddO9QEo03yg8
 G9qHRCfIs2enu4TYdEHTP8R4p7ClKSUxZJSDD4IJL6P1KI7KxvChKEHNfRq7OVuACmuabktRDgV
 9aoXRRZ7Hu6tvwCX1Rp2TUoJn44alDIvYbhEKtOMK4OD17rBpOYVVcpPIscdYnrqscqYu2Vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=952 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010062

On Sat, May 31, 2025 at 02:22:00PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill in the correct data for the production SKU.
> 
> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Verified against msm-4.4

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

