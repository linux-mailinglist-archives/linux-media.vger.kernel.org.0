Return-Path: <linux-media+bounces-35129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8FADE43D
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1827188F6FB
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 07:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E150127E078;
	Wed, 18 Jun 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzuWIL2R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1A277CB8
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230447; cv=none; b=ckm3TuPe3qF6sajosCtgYSGg/xyUOWlovVLy9KvycWqBlnqSuYluy/hbKW4nev0pqMPCcBuLrlcP8ypUNKTOPrMgkjFTxlNfFFgk7tDMRkYnf5lwARHoRCvUVr9HdViRNWraygsBF0kVyDvK5d2JyziinIJkPd4SZbwtUI/hMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230447; c=relaxed/simple;
	bh=rlU2zGwFM9YmTQYQGyrp7lMe42gtVScoKfb5K74Me9g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNJF2uBfW3TcMzfpdJoRLh4MSroM23wjUhM0yCJ5mupbQo1XhLh5mLTc2rEhYUbCpB9Vg1nD9Fh0SWn6Rncj6jANS/A/R+4gnXvWoX6PFVrkNFoeZ4URd+d/L2aBuUhCUa+ndRYwm+HJaJ3JeImFrBLLHKM44fvlCHWCH2xHA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzuWIL2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I2hbCA027438
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 07:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJAn7hBjJyszdrESORg2V/IE
	9MPVgEXDSCugj4BSJ8Q=; b=IzuWIL2RK2F0qCMIDOqO6WaCqAy9z2zh0cGcVXTq
	ah2C4p1mcECmCtbXmuWkomnmMTLrt10DOum80uF+YdHDwMH0b8BHDmUQoNakL4bM
	PaCm6D1C2GANqaHb6ATVVUi8DT5ecdK6/ELxSjIuOWN5/xFK7W5fYOsVJDj+LKPD
	ffItu6oC+ANM4dgWK0AXENhswYbXVZ6Lcpnxg4vMnrYa7wX9L0yWys9CLHBCxurF
	xR8aU70OgaHdEpIOoxIuvMvM3W6nHh7eEhYErkKgTjmVDdgNDfrmng/lkaRIhkd6
	gVCBYx2p42a5uVyCDzIG+R4CEVscpHa9vKZf/87RG5T9gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd364s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 07:07:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3d3f6471cso526220985a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 00:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230442; x=1750835242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJAn7hBjJyszdrESORg2V/IE9MPVgEXDSCugj4BSJ8Q=;
        b=CgYA1G6mFR8JouZg0nXR/nED58nmfnjrMANL05vZA+QRqdZTzmOKI+q9I6T5dc1UkS
         bS1xZYADRlgUquApoa/xo81oIq5xg2SQ0ipZb70FS8qirgzC7mH11lhrT+Th1V+v9E2I
         5k108u9YDZWr7HFqe07mSEmISM8UyN/fzG1/6BqeYR0YIkLo0EXHHciEgRXALi1fbPFV
         OpfyqyHVAASCb0wRVFky/56zcODDFw+pwtR2UkpMAo6rKhy2YBrTBhFyLgN4F3yejYRx
         vQAlX0CsJOxnWvdV3eJOfaEzrlpkVSHwlJVnfvm6ElVFdRKvmxoxhytkFmv96PS9Yw3S
         DhAA==
X-Forwarded-Encrypted: i=1; AJvYcCVB8kVeSSyO5I/cl2lbJ49XyjKU053vP2J+7RMh+HsPMl+lQHfkjqaFcljQwBjT12MY73uERTTF6A7ZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJKANFwoym+zShHuQkwZ9BFN5siIwW4Jc5YDths7tRE41Ozvs
	VkaT6a2Kz77RiXdcr7w0nQBeVP8XLM+T0rQCAyigzqy0m+4c+/mHfLK1iPtDMROxiDyfQrSQefn
	DUllFh0uzdN5/V0eOWa82e38ZK80ZRfjI9iEgqOWFokKC3yvvA9C0E+06U27gcPV9fQ==
X-Gm-Gg: ASbGncsOx3puJOOGoxFyK63wjjuW2JAZCVVvSqiRCUuaVAZqOpOyMcx5QMByVFo0Efc
	gwtVOR9pIPWqRNqtvmjEv749Q3LyfIJ1SYUv49wFQG9AJjKwPS4lQeRt4VuMB5mLo5SbF6f/Fy8
	vM7WOSrpENX0MleRSd/cxVhclCZfYEy9/0eNZhhKAC+IHGikZM3OcjGeWYdVzKc0uStkAjfV1gS
	ELSPs6RAWW9SuWc2Qj3lq8S4ZBB6zrLI6QIikzBeHqtU/94Ay5yM31yPzvFdPorHEgk2LVTpEMe
	9gRyV5K33DR8Qqk6WWu10euezmMIggY7hawfkaNFMr3qwe8DTLcdaxIzjw==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504558785a.46.1750230442568;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY6o0WAdvfBZgPNZCEmNmaQwkZdoQZkElGREQd18gcW9CllYz/e7O1a74nEW6hnb6uLLeBIw==
X-Received: by 2002:a05:620a:4611:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d3c6cfb967mr2504555185a.46.1750230442127;
        Wed, 18 Jun 2025 00:07:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm16165076f8f.94.2025.06.18.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:07:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 18 Jun 2025 09:07:20 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFJlqGFPrO9Hw4f1@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
 <aFAVTvsDc8xvwBme@trex>
 <1bdf289b-5eec-d5de-a08b-6c7a772e15a3@quicinc.com>
 <aFA5FpJPRmJ/ltI9@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFA5FpJPRmJ/ltI9@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MCBTYWx0ZWRfXwEB9cnjL7FaX
 p7rVt6zmswtSEomcI22ks41eg9LU9kVyoqEysmQc6QLf9cPtk9anQtI7KtUG9ffRLEKtHi/K0Of
 nyjXqbezxB/gAceZ1sejVhcBBtoIuIZdBTe6KcOdII54SBqslUe3OOfDPsXWxsjUSh1eDaLllwU
 vAuhnguY6nWX4u9000A8y+7nMpNnrwwqBFwkSVlMWADP3fu0jZ4iuXIVE2HkVG9aj37ojcxdZ/Q
 yP55AsrAYs2eMhbNXi1Zn50co/uy3I+P+5P4KPL+rHMqJdhiUoutdTP6i/fKBjfu5Z3JkoQfSL+
 D/B6lHjSImjC+Y2PFKUL7LKf15mThOMYZSpiMak3cQl//Q44zAtgUDjlI7cPwPfxP9mYWHzNLqw
 Ut1FwDIPbC+6shSSmzdlVMBbKpRr0jnvF9+7+pMb+8iVYoA9kk38hC6GRywsJaNAc/SbeoUb
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685265ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=X3RmICvlrzrKrH2AD7gA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: ItO_e8WDAoOz72bCCwgxXqXkzxmwvvGZ
X-Proofpoint-GUID: ItO_e8WDAoOz72bCCwgxXqXkzxmwvvGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=955 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180060

On 16/06/25 17:32:38, Jorge Ramirez wrote:
> On 16/06/25 20:14:36, Vikash Garodia wrote:
> > Hi Jorge,
> > 
> > On 6/16/2025 6:29 PM, Jorge Ramirez wrote:
> > > On 16/06/25 17:26:24, Vikash Garodia wrote:
> > >>
> > >> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > >>> Ensure the IRQ is released before dismantling the ISR handler and
> > >>> clearing related pointers.
> > >>>
> > >>> This prevents any possibility of the interrupt triggering after the
> > >>> handler context has been invalidated.
> > >>>
> > >>> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > >>> ---
> > >>>  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> index b5f2ea879950..d9d62d965bcf 100644
> > >>> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > >>> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> > >>>  	venus_interface_queues_release(hdev);
> > >>>  	mutex_destroy(&hdev->lock);
> > >>>  	kfree(hdev);
> > >>> +	devm_free_irq(core->dev, core->irq, core);
> > >> Could you please check and add the handling here [1] as well ?
> > >>
> > >> [1]
> > >> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427
> > > 
> > > hi Vikash, sorry I dont get your point - what do you mean?
> > IRQ need to be freed even for error cases during venus_probe().
> >
> 
> but  this is what the current patch does (venus_hfi_destroy is called at
> the end of probe error handling as well).
>

for background, this fixes a null derreference in the Venus driver -
reproduceable in RB3Gen2 on a particular error condition during probe.

> > Regards,
> > Vikash
> > > 
> > >>
> > >> Regards,
> > >> Vikash
> > >>>  	core->ops = NULL;
> > >>>  }
> > >>>  

