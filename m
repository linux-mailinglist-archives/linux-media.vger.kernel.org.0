Return-Path: <linux-media+bounces-35175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BABADED88
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23D13AA6F6
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 13:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D32E719D;
	Wed, 18 Jun 2025 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MG7VsznX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C23295DBD
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252390; cv=none; b=mV4byp8ZuPs69OMgUDk1YrMKSVdLiUMLd9oI3ZeKx/fHXkIJ8VyM1aFLFetx3dQs+uK7EodJVKYpUB8Xmd02Uv6OUBp/RA529O3qWsd8pLnk+CE0r/WKoKiHDJu8p0F9iuIwbqaVqY1a7Czf8wxtNIlqGfb3T04JeUm2/akjvaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252390; c=relaxed/simple;
	bh=xQfxH+J7si2Jx+1rL1OLwZA58hEdu+osP61mQ2g/iyc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLJhKANbJ7XI7LkTWCpb+IfHAGTi9l+fpMcg5NsZfvDK0aSxHF2EoAuLOE7fpWTe3y0h1MELE1JuI9vGrQDZlav+LYufgnWwdB5WIITl+9kah2ctGjOV81j8smNgTnrTm0ZMl6aWK4wItC5o9zhx0qVH5ci4vamJt8nrQhO6O1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MG7VsznX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAoaei003033
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uOCr5QjdkY5jetSDiwM7myto
	B++DKJWhFOYd4AnCVW4=; b=MG7VsznXxry5HmQKa8E+jEZlOMlU+YvAQTXIg81v
	1M32ivImqWOBWQJUBFoEZMVDrrFjcy7TeDEGtXLD13ejTW0X1DRDZqXVUpqtaClP
	gCz2tcFk4yKihafDhdWx/jkjuEOAXbsnBqbG/FGB0zUidVEvzPtk61OgqOE8lrPk
	ovsiCvshRGC4CAjfzP23Q1Lxowyex8D8HIwFXcUODwVMmqLAfrf0DJslNhtM96y8
	cqmHa8iFZ8vCEkQg+5P4WU0Hu8YR92BaTCx1MZWPFQRJck0BA9uS0BzpzEOX4DPL
	/UY466jhzCrqGof9Zt1stQZZGP+C6cUzPc7q7MvDL/+fUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crv1c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:13:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so1208373785a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 06:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252386; x=1750857186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOCr5QjdkY5jetSDiwM7mytoB++DKJWhFOYd4AnCVW4=;
        b=tMiNWBF38mjjehhBKk0reY6e3u6WNsb/8N+2KS9hFoNjyJFVlJviny7hrP7NA9d2oI
         VkP0RIgAByUyGW6Gaamn/n8NoaaZHkHhyKcYS2GLdc+0KekHcjJNFpgl4JKfxw7GyuvA
         Esn38QdS97J1eX1dbWClZwxrpqtJmJHTDx4PqyryhMB3ws3FAPZblZkMIJCl6YeZurUu
         2k7Nlvlz9tMyu0P/fWy1qosf7Dno4p0mDZ3oEhWCTzJBiY6tg5zP0J5DXHzM+mgS+3Se
         0YLiwp6XHjejzzR4mp/42avHvLFAd2mC7tBvQKRT5PCEDMhwAtO+9rVVl9AQVSnvhoQB
         kxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ypm29mKu06APl5rqyoPlt5KyJ9m3TGgxEIo0OBomjpPXZCLTm11YkWS39PS4nl19bGvBTie4IuxXOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAS48W3ddloNvmLHuGKuLQj+lKfx37bFT9iPh/gLJ0Kyb3xLt6
	RGlu+VmK6LjoiTn0QrL8O5IPJ5rbq0Df3P9NwdM9pyws9lncOk1soQ5G6gtYJvfOaZa411TLg4R
	YjVmP0rLzFSTUsDeucmnnYeyXM4tuNcGiXpb83trsvGWjOO7/x884HQkd8SN64I90Pg==
X-Gm-Gg: ASbGncsufxzKA7thh8rBdlKE1JFoXGFzFmliOqI2BlOEgZZkNh9Oo8/C3goM4BE93a2
	WgRVzynIkPzaHhoBS4Hu44ijaDkkv91a2Zix1VtlZQf+jFtXAY/yorMLtyhZQ200F+myTUABNs/
	+e2pr3dEDxa/QHcJuPmkfWj9hXQh8PsYs4fj3CN4HlWr4gB+qOkojHnD3Cg+sdPCADmHF/h74Uj
	vsJoYVC7ZQyJSDNeDMZJDrRHwpMlhMOyWnNP8IOnLL6MMVeLUcdrRczyihqmuNyw62AwoQi2Fc3
	39OuGU92jBQGSU5DPMLly2cR0Se71RIrPpJzi+MjqP7y5qOw0WrzohzQ7Q==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr2372975785a.0.1750252385787;
        Wed, 18 Jun 2025 06:13:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjJue89Rmli2K6Y2pcfc+hi4K9H56GD3PAu9OTXQAnTMz/vuG4sPfRjvsoylnL7i4Da5na3Q==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr2372972985a.0.1750252385360;
        Wed, 18 Jun 2025 06:13:05 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60f5asm16671499f8f.25.2025.06.18.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:13:04 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 18 Jun 2025 15:13:02 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFK7Xo9xgQ2gfo6u@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
 <aFA5FpJPRmJ/ltI9@trex>
 <aFJlqGFPrO9Hw4f1@trex>
 <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec3defcc-f19d-4224-9029-14c1e95399b7@linaro.org>
X-Proofpoint-ORIG-GUID: 07MC34BPu53w3iTe649epedhXdOJXhdB
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6852bb62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=8tBtA4GtQrU4Ei1tFs4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 07MC34BPu53w3iTe649epedhXdOJXhdB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMiBTYWx0ZWRfX1x+2cgbppHU2
 /l7eob9Kzf+LLMr7fQNGg5p52mLCPnbk5Dj+TCnz9MsTVLDxF3OjfvkcIUezfWGtTyCh63iLeRt
 8oDgKvXTBc9itPHk9oWmHFuN4PADUMuGQw6TcW1amS2ZcaMmhEj7nGlN+XYqeMUJqYmmqfoD0vC
 VuCycGhrpUQslaUJL2hfD3huoYuGbEFIppS/CgfGHd9FDNynaIzWlKlKm6oSaJFg3gPsr7zP8q5
 XM0A1REpXs1R2AKjzSD87tCPz6ou8W0VGT73ylr8ypTZEj6EaiWqKPMZlMigJwx/BL9ovThirvx
 EeWsqTqD8HNBGXeJZKwMPb6z4Zw7LBDO8gB3saRw/bU3BxtP9zZRvr9wbCQQ5qVtYSxJCMyjZD1
 w4ZJvsCxko760VT1TjQKwG2fU7Tmfo2gGoQ2GuomYbU7m1wLGneo+QFlDPZ/MgAUKtZEcgG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180112

On 18/06/25 12:08:28, Bryan O'Donoghue wrote:
> On 18/06/2025 08:07, Jorge Ramirez wrote:
> > On 16/06/25 17:32:38, Jorge Ramirez wrote:
> > > On 16/06/25 20:14:36, Vikash Garodia wrote:
> > > > Hi Jorge,
> > > > 
> > > > On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > > > > On 16/06/25 17:26:24, Vikash Garodia wrote:
> > > > > > 
> > > > > > On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > > > > > > Ensure the IRQ is released before dismantling the ISR handler and
> > > > > > > clearing related pointers.
> > > > > > > 
> > > > > > > This prevents any possibility of the interrupt triggering after the
> > > > > > > handler context has been invalidated.
> > > > > > > 
> > > > > > > Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > > > > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> > > > > > >   1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > index b5f2ea879950..d9d62d965bcf 100644
> > > > > > > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > > > > > > @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> > > > > > >   	venus_interface_queues_release(hdev);
> > > > > > >   	mutex_destroy(&hdev->lock);
> > > > > > >   	kfree(hdev);
> > > > > > > +	devm_free_irq(core->dev, core->irq, core);
> > > > > > Could you please check and add the handling here [1] as well ?
> > > > > > 
> > > > > > [1]
> > > > > > https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > > > > 
> > > > > hi Vikash, sorry I dont get your point - what do you mean?
> > > > IRQ need to be freed even for error cases during venus_probe().
> > > > 
> > > 
> > > but  this is what the current patch does (venus_hfi_destroy is called at
> > > the end of probe error handling as well).
> > > 
> > 
> > for background, this fixes a null derreference in the Venus driver -
> > reproduceable in RB3Gen2 on a particular error condition during probe.
> Shouldn't it be the case that devm removes the handler for us anyway ?
> 
> Why not ->         disable_irq_nosync(core->irq);

I agree, this seems better to me too.

I guess disable_irq() is the safer/more meaningfull choice since we are
calling from non irq context.

will fix - thanks for the suggestion!

> 
> i.e. disable the IRQ until the normal/expected exit path removes it.
> 
> ---
> bod

