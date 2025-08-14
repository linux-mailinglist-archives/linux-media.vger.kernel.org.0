Return-Path: <linux-media+bounces-39867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB769B25C81
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483C156176B
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 07:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8091225A659;
	Thu, 14 Aug 2025 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTt6dHxM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F78258CED
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154934; cv=none; b=gezCeKbB1SbXD8e7ip0ZzwRI6P1xfsW8TaP80ZmoXiBQX7ZhqCWnnkLLrLufnMTMbCQWZVgXeKkW4dYO0HfjyO1sHhj1TC3PjyOR12EP2rSP2COPbuG/uEQy/O7uMvBOxm4emh9Qn5CRzLH8P2dO46AudDamlB/trLCRfsQFx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154934; c=relaxed/simple;
	bh=Lyxa5/1zntq0dfVNk4rbh9qz47lC1ZTh6Pytnc+GsqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpvTjh/LQAvjtW6qmY8Zd312tkPejaQGYXz/wBAcswyo3JZWaY0ktVxfv72N5687/P+jq1msShM2Oeze7g1EaLOsqYN4IkooI/RHfYm6odcM1vBLOdvnB+ZJ9usgv7uolUDsWVbGyDKXoVng4X+ZAjCE06FZ9JcvWSjenYnq0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTt6dHxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLJ9Qg020736
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Iy5XjLJ55RnUenJqnrBHZVwS
	VIhZcPvSxAiSS+k4+Ww=; b=VTt6dHxMQ5uJCZ26BA7BTEZ8Yb5u5ySn5pbhKa9C
	w0GVXirFEI2J9FgwVdQd562ooU+7hjBn2SHIh5nyOgyaK+P21VQikgA0r+mmejbU
	W3Kg5AvMNxsZotpCQ/x63kbx7Zon3nl1+SzElpFWiUO6vmRxnmAPz8doYLwIQ5Y9
	lViJIdCsasV482a4StmPS5QcDNCiMxHkVTYYGqnyWPkInqIMSgVBRZF4PixGfmoU
	WSWT+lQw4IIBiVoX7NCaIQ38D8jBRzz6yJEOejA7KwePbZc4YivFWVc/drlj0BRp
	UsyGclWX07v5EVC84OWJeqQcRwBXoznhdkxqNpzQypv4sw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sxwph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 07:02:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109a92dddso18382311cf.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 00:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154931; x=1755759731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy5XjLJ55RnUenJqnrBHZVwSVIhZcPvSxAiSS+k4+Ww=;
        b=Gf6utKPrmOSYnnuy5ggoc6hhV/ELCDNOwOjr/B810TkA7VHFUKpx7Nhst77nWKoVDz
         o/rXxDc6Nq2dNLK4MBUIwEqdxuVDslhotq3RmHuxtj5IldRquQnaXqmJWKbg5BOxVzHS
         hvgarNwEnUKeV6eYzf5c4Qhabg3r2kF452XctpFaLYjqGbwm9zg8Y9iZgzJ4/zOtq9/F
         id69Ubit08jmQXTU9RTVqhZV7FGWDxymI34mJl4iERbtWMn6+nmwi3TEH0IqsCGlwWZg
         w0xqR7RegZxvoH682lWz3wdfuAuy8Ro0ITxDjBAaH1UUIs2a0MGR/bf/nN7O362ujTGu
         +B0w==
X-Forwarded-Encrypted: i=1; AJvYcCWzfUBjWGMbiVw/DyJfjpZOVKxcSFVQwgNGflLU+GM7uSCpOVZJNcwMGuXDJ2JhQdFivpvsvuc5aeYV+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQs5Aqc7UJJ5XwaVv9Zlwox4WvkytkjDZd5QAxnRFU1xpeUi8
	CtN8Tbeu0PJAWURkJSleShKAHAB/IhSUWyzc0O45aPoHV/dtoW0J3rkUGQldDSWWAEEuk/8qfWl
	UXc1W2+kN/do0WwWcKgjWjx+2KdrwbuSDVxHMraCN9PZTcLxJZq6ciyi42i3G6e6deQ==
X-Gm-Gg: ASbGncu+StFEFKeF4hdovfv9J2jdNm2YLrQJeDSDdHMddIQNnY1M8sFBA43LFr5tgQw
	xaolv/96mg3a91qxzLHUzTXIoIMfutvVZ628lVyfIsiRmi8a0lv1iANkUhze1kLuhJfYO3Km1Rk
	7RI+9DX6VtQyQ42iF0RlmOlHCAdoh/wldbs+EDOp07TfSt5hwNuKUucgzEu5oL8nYJJEBzqLbmw
	yh+7tciwAAB1FKuy1O8qowAyo+ccqRDzeiqc4Q36m/MzoQCpYxgQHFoSgZxc6xVZOKhPkOuT51B
	SVJGd0FBR8mAgfbhvRbXMYVrIQf4k5gxjjiHvDEUae9yr4B9ggNli9SRWTFQrgqpe5TohcP+KqT
	lHJAX4jQgR8Vbm5buOI7AOYvSbzQ7lItepLUrvnFn6MWTT4VDbbOL
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id d75a77b69052e-4b10a920d45mr22489011cf.11.1755154931333;
        Thu, 14 Aug 2025 00:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNJhcD6JQ708YwPrqw+PAvDxzp0+x7FgcO77yGZpD5y7vEB02eM4qqc2J0t07nBTkfxfSOA==
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id d75a77b69052e-4b10a920d45mr22488551cf.11.1755154930800;
        Thu, 14 Aug 2025 00:02:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm5481193e87.102.2025.08.14.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:02:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:02:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, thierry.escande@linaro.org,
        quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH v3 3/4] misc: fastrpc: fix possible map leak in
 fastrpc_put_args
Message-ID: <7gen36c5as6fxpgeinc6if7ysex4ieswh2uhqqjtqlt37tj7or@ngpiqfyg2p56>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d89f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: flM1XuEpVveuGzDJSnUBBfpwZZuy1_qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXwDqD5Nlmy6AX
 Bynn6O4Asg2cK+jt+hqqbbpG6xWW2QW4MAZArLrTxDGCsBN5/hKf3tF8FxMX+0+9t7iCKvUnEfu
 22pRQy1QqNs9HvB9k0NcAzTrEBTiIfof7zlNuyJkYzU8F0P+j3NfceBiVuaAhNaBS8iwO2ySMvY
 hIQZsl95uQq7dqkU5DdETAEb66i7bbulsZhgvSZl/z9LQDCNz+wRafhwGQPG+XHIQnSxwBW/Csk
 mQ9qCqxcG87L3xFJp7AZAvJOfxutOE/XJW9/N2lr0twbt0YCGWFP186C0rtiMemgpU7uuOv0Ijd
 sLpA5jWJB2nsApkyaJJS9yaGDYDoYnN4weHBPdDZMu9wwj5/GuLpOkDDGOx6soxEm4lWRZZSJ9c
 7TUPk8/7
X-Proofpoint-GUID: flM1XuEpVveuGzDJSnUBBfpwZZuy1_qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Thu, Aug 07, 2025 at 03:34:19PM +0530, Ling Xu wrote:
> copy_to_user() failure would cause an early return without cleaning up
> the fdlist, which has been updated by the DSP. This could lead to map
> leak. Fix this by redirecting to a cleanup path on failure, ensuring
> that all mapped buffers are properly released before returning.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

