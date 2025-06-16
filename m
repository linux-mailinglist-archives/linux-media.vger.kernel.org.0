Return-Path: <linux-media+bounces-34910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F100BADB0E8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730A43A3E4F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A0729B78F;
	Mon, 16 Jun 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJ8s8/G7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73E1A0BFD
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078823; cv=none; b=u4/FNwq9qcVHYDmvls2orrG1250gktAB/ed6fMY8Le4W97O8bZk+nB/5zmUoiEbKRxt41lNqgePUAJAI+bxvjufp8DrQzwDWwuImtEC+FVxX62oGp1PEt+F7+b70lQES6ypT9ZUzw8AImsmnyMERIFD6lVvhTAvTb+ITs3aafUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078823; c=relaxed/simple;
	bh=auZ0yWuSuNTN90Mbhfz0CZ6nReOk3BmOLC4d3+rrjQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOop5zHShqGKdi0keiJh1TK1T4Bx0zbvwaQS1D80RjVp/ob2fIfS6beuuoh06LOFGauGiXWjXjdom+w/LQO60fd3i4WIR0s65nXxDbJOt5oUNBkvSKddcG9BNv1DC+cgyTY12Tb+dg9WbGTeLWz3VzMdUvrRT35hxoEHcSbZukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJ8s8/G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TZlE007651
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 13:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Zpam38ASYSr7xQnoqo9VopR
	RvFRhEcoJAeLiKpm4U8=; b=PJ8s8/G7vuPYt/KKRBVtIMKfxA71IsdLGshcegsM
	/oBtRUcDi43m4HOJzcAtpvXvFP6qo7ebwaxc2ayZiPQ85I/sBGtrIDaE4NcVVnmi
	YuLmSFMzwIsgJeWH8f8d8CLTUa3mhYZGvJbv/1KcVkGCvjK2AxetiOFzBlw6uzwB
	7HpCDVKytPFZngwQOzK0Ut5ttHiCKMPIZBfne+TosxHsisHsCjX5co9zjvrSFOsT
	AVmRrOzPsQZNBKJLk1OlSMhizIvAnmNJ0iTs+UZwJO3g2J4SE6dHGI0BcvsvIjK9
	JAZTpyCLAwyUfaWbRxplBmUzVFsHHxayuQ5Pxp9UV1KWCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfckb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 13:00:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so824210485a.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 06:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078801; x=1750683601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zpam38ASYSr7xQnoqo9VopRRvFRhEcoJAeLiKpm4U8=;
        b=ATj942fDT8naSL8N1KmXOcclza8H89ZCDQ1Hlpx72NeUanB5gVqHPJG5rTxmSo7hEk
         voNedg3Lg3ajS+2RD2S8oHzCCBFpkRqRAw48E3kaFo8nBxPhgLuX45CgmTslbklsS5vv
         L6LSuzGYwJYxZdr35sGpnLorpIW+A89LmZ9so7Y+w6mwrHT6UgBGScUm84dheEYOvtoU
         W7DShK9R4zuuQDmLyp2ETbgxJO+KPWNVgAvnhhj/4NWSP2+K+B+/Rvp+6hADqWVLiTUx
         o4FrV5N/Y+ZMqR8QVqRprq2IqBHjIsH5S1FCykPzu/SUg7IcwnOpU/nTDPZTKTHYuGKO
         4vSg==
X-Forwarded-Encrypted: i=1; AJvYcCWghkyOAStde8Gtqv4R9miC6xz9H3kBci0bTrhd1nJ7iHK+fxzA8zgJgR0p5UrV3KEMA8yox+NILQ7RyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ZLsj+AOH3v1/j9nXo6nailP2HaGXUFpFSQ7CaZGUFpiM+Hgw
	EV1XCVz5+7F9NAZEQ4XiWOMxWu1hrAPiNbNSAtdczYP4dsUsh0B6Qk7SgYJKmkU4sjHzI1E0CWq
	+haf/iALZ6dNu/ROwmtOqabEu+QC6f+XWk15FRL3+D6n1EzsTVd87nOt7/rkSo/ka8w==
X-Gm-Gg: ASbGncuvF0GgBpckEHaENqpbpL+wmiGfYqu3dyzZxkC7JrFoD5eGF3UdMN4c2gwMEhw
	n5nyeNN3jGFguHdbWvYqUW109F+7eGomYXjlokrXMsp3lVogJx8Zk3u/4E2ywpVH0E0eL98pNGO
	TIBn5SBLacE2I4TNurrDC1PyH1B69uXjaAlTR2etYXzFz9nkkBkEX6aJsCxGYJ8JEPrcf9C3u6L
	qHBGEO1LXbjxWi48Zj3KzJ7ZfVQtMkQnAHN8dz6KmzzEqxQzhozM6fKrVXptuoCHMkz0GmZeZlI
	7mvkIOcg22sgHGldqtXGCEFKWSJXdPS2wickuKzqPHCqGUjSkmRozRlRhw==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342353385a.0.1750078800979;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4SDTgRhUH5YlbN1cKQ4MXmBOOryw7h3rYCkgqVUR9Af7Zp8Rwpz3qnCpmkW6bIWwziiMuw==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342349885a.0.1750078800532;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm142656695e9.37.2025.06.16.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:59:58 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFAVTvsDc8xvwBme@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MiBTYWx0ZWRfX+lVbbskr1aHu
 j75euQlA/43LhqGUTomFiW+/nqxi3GJjdQ8o6oA+rZvbx7gHKxk2HrbEKXpLV3kNyvOOg9Ezs4b
 Ku5aMyI4Qk2uhBG+z8s8+p2R/uVTzNhzEAWg+vyAiJcYx8wSXx0Whdgpd3ktlC1+cm9G6cXUGfE
 GUUc0mDfyhOhj+WdKGcC+igRFRV9KFyWuu7q4I7u4lo88CK8L3qANdvgqLMqYIH6a/oNU7UGHsn
 EN2Wbw9dckjaHbXtO3B2mhF6cZuwJDGJIchY3xkA1Cv2nbMUXTxXgF4vR3RRswo/ZxAJ4xWOWyw
 SV9ShtZCErKVNo20IVKt52D/wl/BR1EO4HNu0oYjDGtIDjBpHkmL2EsZUQE3wM//ugJHlsxcrGW
 4DimnzKOCTaI/7RkCAFy6WHR7UZxp2mdVF+fdxyFKzC+WiQ0vaFpExLHq5/EgO+T+8UBmZOz
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68501565 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=5yDEq8l6dJnGzMHSUIgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: bSGxdUK1Qn1CGYGRk9acYPzUX7aR3KJE
X-Proofpoint-ORIG-GUID: bSGxdUK1Qn1CGYGRk9acYPzUX7aR3KJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=915
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160082

On 16/06/25 17:26:24, Vikash Garodia wrote:
> 
> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > Ensure the IRQ is released before dismantling the ISR handler and
> > clearing related pointers.
> > 
> > This prevents any possibility of the interrupt triggering after the
> > handler context has been invalidated.
> > 
> > Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index b5f2ea879950..d9d62d965bcf 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >  	venus_interface_queues_release(hdev);
> >  	mutex_destroy(&hdev->lock);
> >  	kfree(hdev);
> > +	devm_free_irq(core->dev, core->irq, core);
> Could you please check and add the handling here [1] as well ?
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427

hi Vikash, sorry I dont get your point - what do you mean?

> 
> Regards,
> Vikash
> >  	core->ops = NULL;
> >  }
> >  

