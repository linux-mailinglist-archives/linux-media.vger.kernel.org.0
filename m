Return-Path: <linux-media+bounces-40741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B9B31394
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 11:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7233BB02D32
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35B52FC87B;
	Fri, 22 Aug 2025 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWVpWQk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D133B2FC875
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855025; cv=none; b=P1P4QrZygARUJVphVSKqKBri73OetwElvBomIEAfO3jK0lNQZJCpt1mH0vZuVaCyp+SuBMyKc3yXlmTegT7fElV7v2cfuzZPiWKBWTlkkKRBD2BlRm9LWUxxSEIsdMR0Q/OqcBzpBNDl6RKYVSfmj1RCQT963NuiFd+fJ5pXXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855025; c=relaxed/simple;
	bh=DDOINDlN4zJfXeUV+i7J2/ny9DQpMWb+X2z1LIO2v0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJfuZjkQjAFe6+tXUiiiclRW4f8l9tHZIJlHPh9S09KiLzvbG/Wvj543zHrApqTC7H1GEiqGQNlvYjLIH0zk4No/pHWhmWqgOTXpPZ2ycxd3RwKG/wDXKiVp+0wRSNj1MqBQns2oLzFfbJtraL3LeWmQkHMJJZ6X9nIKTzMC490=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWVpWQk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UXfb024715
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apgzY6IIDslGxm2ZxHxgxxLn
	8qHnWA9Q7ouAHkWulDk=; b=PWVpWQk1s5S5VH+XVqgN6h5G1JwLdtQQbiOc7xJ+
	0avKZl8+BGCTG5VQkt+ZbnVhRAOZiNxwELWjL29adVz8OGkSCuSHBIkMRw8wQApy
	0eg0Rr2mA3MFwnDGdV/0on3OB6DgBwxkGBj7pRVprDS3N9GEvcnuDFpCxmYMztt7
	b8hbsSnIaivhLona9IzshfMvX4h11oLDijqNfiLDG/m2vPEGDLxgTtvQ/dqZ09z4
	W7L8GDZh0tsDNpQcc3i4ohWSq/4EdqArFvBi69DeK5WZWDwPF0+ez9SoHCFid/of
	F8yDHBND57vBPkqDmB6Vk9BFAT24AZn+D7inmHA4neCUMg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agrrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:30:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e92b3dde9so1940938b3a.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 02:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855022; x=1756459822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apgzY6IIDslGxm2ZxHxgxxLn8qHnWA9Q7ouAHkWulDk=;
        b=laRhr7ou6lXz6T60MnFdhHj1lTSoMNEnLarM5vx9tBJFcIEx6Lee1dQjmoizSz+q2j
         Pr/DiSztklgkiINe1Iu9OkuPlhLLuaikC4PfkN8SY+aZ3oVwnYdrIT86dzkhQCTXZ+6j
         0AXKUITlPA2yNXQU0VDI4HN1NZp+MT0LENWmTVKeYVvDQrssdFE+hE526UMvbijDkTwd
         xU8Vb/OBeR4fqHPVUu8CiNMaThWVr5yGyRQPZYePv6Hh6+b9uGaDMylK1uFbP+Te3W07
         LjpaqC+X6NKnkB/+1zppQVz+cws22dVsCqqh3SDr3qy/P1h5jozxB4yrYo4l9L5FUq6Q
         qtrg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQMFXAiIzruJEvPBnbaTkRG0ZSuYLwQ91VJ80dbhpUeZd86CtAzsJyr+qiJMNOktIf4+1nOHV92DWnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjvNSSPVJFGankpxKi6ANGEn7dy1Zs/KrI9McOkZtP/LaSWoD
	jDBOrWo1tF1QDp/woy17VAj9afvRbZzDghhElOuW4IUz6rQYHZMlG9EC8/gJOurT7uuX8RsWv/J
	OXWv46fQtMWXtha1IIEahlpRh+y+2ZuhMPMQa756SH0pbg51IKT2DkRVfmJeHeOhEFw==
X-Gm-Gg: ASbGnctGjZHzSCR3o060SrbdiAXmndaAl+ZVVEYZjtoZRIbwUniw5/T8t3f1GWgDRcR
	617e4PCbwU5W9cRvATDmeHg/Jd881vyWcMcle5yhCt9+p03WRbl714PHtkBY+ntRox3gAttyjD8
	f1Zd8Kd3rzaWfcLGrlg2PCfMs47CFpv+bGZHqXQcUT7CYfWAHx0eQ3XqPvmTGm82LKxhY9RbJeI
	uEFU/BGfOxxw5DqvH/vH7hrEwe2xKbcnz0g78gsx7mQbB9q6svSYPik47CA4vIt5vYkjo0hJWHj
	czR8mAYBvVfjtz7JfIbcf1G2kDnFfTuoAawwmRCYyR4blGYTDXWMsRkLfep5MktHw34=
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910840b3a.30.1755855022159;
        Fri, 22 Aug 2025 02:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPjl9du6NbhNGBRG4TzW7fpJP7yr3XTt7Akf+uqRroowTWYPJrBk6a36wmJwTgWdjLdbhyxg==
X-Received: by 2002:a05:6a00:2350:b0:76e:885a:c3f2 with SMTP id d2e1a72fcca58-7702fc2d339mr2910802b3a.30.1755855021746;
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e894bc4d2sm8255639b3a.67.2025.08.22.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:30:21 -0700 (PDT)
Date: Fri, 22 Aug 2025 15:00:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <20250822093015.snkxlspg2czzrmgz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
 <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a59da8d7-4e35-4af5-8b9c-96aaf1597271@kernel.org>
X-Proofpoint-ORIG-GUID: CwBYlDZXm_IMsVAA4fMZyzbS_wX3z6BT
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a838af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=DtrYIkIAubBs6YGxpE0A:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: CwBYlDZXm_IMsVAA4fMZyzbS_wX3z6BT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+Z5VTHIGqcD2
 9CJpMhBXZ/G98QJkgWAn98WZJRkZEnGeE9qIqGjMAEKwViXD6Soxj7CophLPWpN0GdrnNinO2o9
 2k0CYLpV7zeVQ9mNNDzVvcyI0TEMoSKGF7Yl0tZudAzHUnRUvUL4Spe/S0icLe3iCVCIkSOVBtQ
 PPFP6d4JbtA7Ck86haK3Bc2SRb9l/FaHZjx6Nhj7NPGihXVhSGeu7omXKQsdOparK4d+SVgeiLf
 xVvR/mQurqOsIUFTW70QJTsZhXYkpl3LPRY2TSBrPRhBbmEUhrVtkg/zumV7wgfZFZTOKG7LSOc
 t6O1zJboosEHv546bkn5f/CMD2Wi2CCsprN5Fu6b0QKPDNxVrImSiar8g1yvMz3ovjU+Bl/lLjy
 mKD51fkoEyTXnan/d5O0Tdz135AEkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:35:42AM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2025 18:32, Mukesh Ojha wrote:
> >>
> >> -- 
> >> -Mukesh Ojha
> > 
> > Since I am not subscribed to any of the mailing lists to which this
> > series was sent, I am not receiving emails from the list. As a result,
> > your recent messages did not reach my inbox. Additionally, it seems your
> > reply inadvertently removed me from the To-list.
> 
> 
> You decided to remove your address from replies via "Mail-Followup-To:"
> header you introduced. It's on your email client.
> 
> Just like you will not receive this email (surprise!)...

This was not intentional and just a switch from mutt to neomutt where I
have added stuff unknowingly to filter things and showing inline replies
correctly that may have resulted into this.

> 
> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

