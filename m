Return-Path: <linux-media+bounces-50065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 759AECFA92C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A943831A6265
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD4E352F8C;
	Tue,  6 Jan 2026 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcsvUPbO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZr5z+7P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109A27874F
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724174; cv=none; b=lHF9uK+VVsxP9luAtz1qm1HAS5Zj5LalrC0qThG2EL9giXnbMmefDBMLdZGl/AyUT/AqZteJzW5yOlJelLOE/Zrd2ppKUN+REL1EMJ/ncd1iLmTxxK7bDRK1dREZOXKjdOPm0nSMNuUBvNCc8hsvLju+XhCHxvnUh3YJIsz9nJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724174; c=relaxed/simple;
	bh=EKwgbRjyFc0r5AWUEnHVthwLynoqvUWqfKVMs30yVYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kquXIL0n+DCssg1EzK/DGjAtanLlSMnzyPm/HVgA+rZHqBl38EAA/ioFyzSaY6XcUsk7NM8hkdHdGX23ZJn6B5yP7n3LI6oyBHl9MXYduLOdb5juyUk1wlrNh5WqOar9wMTR+S0+ToED4dbNLKZookv7G5vIuwuhL1jxjapIfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcsvUPbO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZr5z+7P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Ghwd5364880
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=df7CCdKJkxiAg99DIee87WT6
	5pqufwMeHAjkXo8qe+o=; b=hcsvUPbOLiqzS7Mn7GRcL2+0oDRo3kzwSl9vzTHx
	NCgsZoj+3HjQN1SYvAAwtYk3pE4y9EB9xRyiXWIs9+dko0cg5c/BJ25Tp2dMZ5qG
	MPlS7diJQvn6PwbfIKL8LhSwgKdjcd8GAZLl5fknjn1HnYBbg7RhIuIM5ibtn8P2
	wl1umhZ+XK5lvfFrAptRjQ9aYlNAclJAz/eu4xifLVFznbLUDQYiZmhUHGV44h7s
	JFmLVY6P4lppzdtbjV6v7Y8jfF+0lo8URmOL+uKT1gLTq4/S4ehyWgfIhMXRdytw
	ceUYdYRGYMKhVQFbr2afQyub0OQTHS2PUbfGM8Jq3wVMvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660raku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:29:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso36585761cf.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724169; x=1768328969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=DZr5z+7PNAdYSKAfJ/SfTbqUyIlp/xohcLw6yLktveFOrWxfIWzCI9eZO6ruz729+E
         Q8ilJJMQYAOXLsWuoxzHcnozHuDVAo6rNzK7wVkPnr7woF3WjAExA90yoPpycLxNb6mh
         3AgMKH9gMavMPqGMzcmg8J+DJ0QxSIyMF84/d29dEWApTW8PHEmUYgdI9Z3hhemmTykO
         /F4xRbYiQP0tKt9cXATfQY+2WyQSEV313nFKGp+h+35A4vRkDqgXR3C64FlvH0EAHwhk
         mpOsBZiLjxm6Kuk8oZij1qoEzi5gLm2YbflifDEEGbE5vTvblvQFkzQV8sypMPZ27mxG
         TCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724169; x=1768328969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df7CCdKJkxiAg99DIee87WT65pqufwMeHAjkXo8qe+o=;
        b=MF8lStkvDRpkZOwilOlAcDJje4XZzJ/H623TPtqtp5T1KTMo9txZpcOEk6+UNRJdF/
         mNFsOUw/9lfbeu9qhcVbv+PwXveEmdaBvc6hyiq4PDda6GUB8g26pV/OxYotsnBDfxOU
         Q6HoYeVrebHThkrFY0oH3rME6oXJeoZmkP4ohoLEuduUY6TDy+gEwKMrjAxf7lM935Qd
         0Bcla9fU3ndemcqW3s1D6GFpAN/Q9vih7x4h99LI8VzyD0ty//kAdFcUIJCwcvda+tFv
         RRLuJnZ7732tp7Ip/VsnPjmO9uTuruRMatPx01WkMf5bYW44B5YEBQ1WRR+XfvkNlgH5
         A6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX+aYcXIaJ8Vhfl5ojEWaDxaX8hBjpzNq4AgBIAdmloMn2Cw3JH+QboBmvab+mhQ+wo/580f1Pivxu09g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLNITnKxMk3YySnoncQWqyDVSclODhcfOcWgh8uVskCcQgg+X
	D8Ze9FCgh9NmzRB44GHeN2TND4w06yDpq8rDZAB1pvC8xH7zDgbuyLEtMkG+hM5yIXH0FG+TSPb
	EahlLiEfzEuHFfJ/FBIEKXmUo3wf+gD/7nmL+aagnPu/Qk66yQV3lFS555UTTkcO60w==
X-Gm-Gg: AY/fxX4hgiEYEoDqBys2uW01wSGzs7bnpCbFK2qGOMzIFZWI2zJGamz15LGPY+A/Psu
	nvgFwv26Qhz3ORQerzxP4GjldYPMvnFr7t8W94xdKBMoXhewfnuKcUlaAXZMF/SrEV3K2DauTlK
	3Muu7yhWtFEu/GTJyhSxA4AgApOYFdwL8SJ+zyQgk/PEj7DFa5n6s+Tt75ouKdwSltX3s0jd3SJ
	Fs3V2M+hF1eC1obZoHil3z8HCkteecYiOCVAPfGDmKUu2g1v39VgK6vkHbjlIxdAOqnDIscTXSv
	HgWuj/ZichtIabRmStxLSGvtfCMvJbG53j7l6DbOtJxvJyBkQY7LKJdxFH47TsaoxsUkPd+Sfcn
	LyQQGEXDhflLqCs1e7RhSzUrQVaWxH1FfWu9kQVJ9dn6/u38gG1d/Ua5bGIsnGn0P7e2a4pn83p
	bTzW/impO++8hq+n/WsQ/OJlY=
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406671cf.79.1767724169080;
        Tue, 06 Jan 2026 10:29:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxJN/WZDh92ZrPdxWZQv073OHQmrZShWs/3kKOTTEht6iTJrhYMaZproAIKiVmgT1svYDhjw==
X-Received: by 2002:a05:622a:124a:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4ffa787bf6amr57406351cf.79.1767724168569;
        Tue, 06 Jan 2026 10:29:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dcbfsm739376e87.59.2026.01.06.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:29:27 -0800 (PST)
Date: Tue, 6 Jan 2026 20:29:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Message-ID: <ihuiw4yxk7zqffidhbaixwzxmqgn5xcnt7ernygiuzm6gphud4@tkcuyqzgl6vr>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695d548a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OD7J8LUZfBhgY_nOwAcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bcccRAfhv4LPtNuheMzfUIcclaDmM7cy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MCBTYWx0ZWRfX5sBHvoWFaAdw
 SzFuetggS1TAyRHxpEmqbQ6NSOVu4mklPVWZ5KJd4FlIRKOPp2As16zBHPwq4Fbl2NlgUANtxhb
 B925iqdA9nTCGKgaqtoEZViZa5Kg36PX7NLHaP902BTQ6A0/WSxn+6rNwBMN15EwsVy3kDG57r+
 4OhEbqRXsJ/HVsajrxlD4vA9XqfOWDY4szMgZ6thoL8dVyz0MupY8RzmMM+0ORZh/tewDGN7pMe
 xVfQyXU94UGp4tQUyLU5+0DXGeDvVqoOKN2LRcXtjwowp1qe42WU0Kx8NEPU3mS6Bbipl6MsIQ5
 K21IpjDmhMG7ppkOx405S2ye+SHkKYSN62GrN+ls8QDAyDztxToO/o5hmTvqNAbf7H0DJq4KMR/
 Li4eVTbo3owWkkSpOAU6pdPkE8uIZRueTX319lYCIWNpmhfOb9rXlltVXolmv9ZAFT+62DrV6vq
 9DX758KwTsg5ZnEYTGQ==
X-Proofpoint-GUID: bcccRAfhv4LPtNuheMzfUIcclaDmM7cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060160

On Tue, Jan 06, 2026 at 05:39:55PM +0800, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

