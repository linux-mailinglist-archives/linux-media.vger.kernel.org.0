Return-Path: <linux-media+bounces-43073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611DB9ADDC
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 18:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9B4E2E5EF9
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D33128DE;
	Wed, 24 Sep 2025 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jj+rhc+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A311185
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730948; cv=none; b=sMa5oWBdgW9W9qjd0b9v/M1stb9n/S3xuKYRm4Znze99JcHtySm444iezdcgJMcQLBFeGzWnpuSJIUB6bAZ/J/7ygUfVXh4o7GTlydp4Kb+DC6FFJQPVFmDNDEjkJ5FxyNkCD0wQe3Q+TjSj14p85p1wc/NWWYqfs6JhwjnFPos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730948; c=relaxed/simple;
	bh=DAcue6yQ8Xi9g+Q7UxxEAlyT6IDT3RwADLx9y8A0VnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG0RRGvd/phXGOyyFg3kofbq16RDzXYmgv41QpRUP0Clqi27SZaDFTsBhH/sajuwLTqkNilzYC8LTnuwMdoURdSOJ41rMXQi3DISdlPAzphNZhxjY78fs5kMQ65VeZED7EMyY3qD2OzxfjGJOUubBj6xaETQP2YDA2bauS5Lg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jj+rhc+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCcBZB025518
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Krw5evwTP6CgXjf5nCLoUUjA
	pXNraiDAcieXjVUyfng=; b=Jj+rhc+ILcD5O8wI97yHSD9RKgONPFVmA1AJvOKa
	Z9vzQPNgdIU/R3f0eXekzODqBGmqDaWk9sn2CKyS/dEh6lVFRifvCPruNsQJ9+23
	NA6XtYUKepqPwUOBFg5l7aswh1Tscg3WT1YFc6rK+S2cXD3MZOF87jBvORtn0v/g
	C18nNrGapGCMDBR+FH4DL7GlGmsz2usydtlygRnuna5sD9DUZI1rU8exixz5yuEP
	TSc4xBUjhGQO5dVe7RIdHeg0DoSI/59Ms6pcwG89elEW+rS0smnFfo1AnlxjERI1
	Q/xUqaOb9J3uLZuxCgUR1gc31GxHQVxc/OxhBZe6mokxMQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyewc3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:22:26 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-63a2f1be034so368242eaf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 09:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730945; x=1759335745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krw5evwTP6CgXjf5nCLoUUjApXNraiDAcieXjVUyfng=;
        b=snFCW70v8bR9HM5PcmdOYGtXzR2eTIraoaJCd04aiVyRuFozkDDcykqBYMNHoheHvV
         Q+ZcblIv+EuUZ0YlflGqS1IvB/VEVl3cD2y7/hCtsNHys0intdhQxMGW3XvDGNWW9f21
         yzVsHTv1fkhxmq6G7uBdBvNY2BhBwhl2zp7tbNwqHG17KJKQqnqwmhZvAs2Mn36VVlGr
         SZGx7MoA/vCWqxwXT0s/WsRh2Brp/HsS7jAbpPPO1jO8HGcBFr7gc8XKykG+uz2L0GF/
         +PcBOZXDD6aAZ1GqPd5XBf4BiRXFNiJV0o1D+eASNJysigI5N5jjBpk8WIlY7gvYMrL+
         nlsA==
X-Forwarded-Encrypted: i=1; AJvYcCXwDAaEHXWSBcdfgzWrg379bKTm0v0FqgYFaH48A+WQKJ6BM9xdHyaln2J04ONJwHwvOtmKpa9Wf41Dyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkSlJq2p4zlQK8E3ML7gXTtYguRtwptXfZX9t7AwOlUDlYDiG
	+70ziM/G87RltgZudrAScSxaa/fMVrcUo2ZC4LLhiZaQcUlHgg/uqkhe9s+KUYAO1fh/ifG864V
	5zZTS9oXHonTOHtiNUT5nvM9XxBFWSbFHFbkct5XMknvijj/LvINLafFQl0hMKyc/ng==
X-Gm-Gg: ASbGncu3aQ7yQ2lurI05I/NTRuZa1ko58NHRv9Zyf6/+2VzX2VBvt5sX2aJx2PhJgCJ
	l1xoEiYAKHZ4OdVmQhTLFqiZtJoL7vV1lC/stAQ7oP76keVxEZxs5sDtTbRFu83O1V61WGKPZIS
	bnIbVf9z/uY61wvuhY/OAj+V7R9YM+VmldIyf9fQeNPxalb4NGJ6MTw2h9RaP74FBdImBsUnKTB
	EjXbXQjQkF+GE2r/czEvKeVbl4u2Geexkvgpkp3gtV/LDCQqZvlnCU7AVpT40T7ZnpB+0aGFI18
	LO71NuXlUHhG6kuCiKYVycFg+3l9SSJvagKLfx0gAWpk/TTesiqbzunfD3/BU+zwQMeDwZfcdAO
	Y8yEkqtBDL/UiHav3jxo5ZqwzNEo79EIozOgIemM8oftSZVM204sK
X-Received: by 2002:a05:6122:21aa:b0:54b:c417:4d7c with SMTP id 71dfb90a1353d-54bea1be7a8mr259667e0c.1.1758730580167;
        Wed, 24 Sep 2025 09:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUHWPIM5Of4Y0TAGDS15oBqglcyuMuFvGPN4aUuKS7ElrCivlZ1M3UXbvxt6poQZ+/tCrU5g==
X-Received: by 2002:a05:6122:21aa:b0:54b:c417:4d7c with SMTP id 71dfb90a1353d-54bea1be7a8mr259623e0c.1.1758730579478;
        Wed, 24 Sep 2025 09:16:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-580d028dd53sm1370569e87.122.2025.09.24.09.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:16:18 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:16:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
X-Proofpoint-GUID: 8Y-BSU65M00r3zs58qrhzY9tCGTf-zS5
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d41ac2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=j39FK1liLGs_1Rz8EMoA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4SvJJGyWJCaO
 RUHLFe1aHz/TkN/0cPsVUkJQjAiJdIpYcQo+FA0wAYoLVFi2l7DZdEO3ZVxottJqUE6MI22Sq/5
 a7BN2jMGNvzPUo1rCbbPDQ5BiX1ymLsvMXBLtBt+UD7ezC7gatqQqLvQCFo8uzw3ucICNojLxYU
 gic2cdZ88uwOM/Ao8KSZCMtOMPUqnL8Loj9BcntEIFIVjUyYxSGPzpXq3+As2/xwfkWs6KTq41a
 sg2lDCfTZETV7ojky8EKck9s4hZTJL3PRKGUimFb69EnrRLCMucURTKhQvl729EV9d9tdcmC+XI
 QCrXGnQOz/HDDaXNbvm+XZDmlNXokffY5F4XJSjsy0G5F1q9JL7XasOvKY6DHNZjEvAMPzFm7Se
 9W2uzygl
X-Proofpoint-ORIG-GUID: 8Y-BSU65M00r3zs58qrhzY9tCGTf-zS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Wed, Sep 24, 2025 at 01:55:22PM +0100, Bryan O'Donoghue wrote:
> On 24/09/2025 11:43, Dikshita Agarwal wrote:
> > > > I understand your concern. To clarify, we are not removing support for the
> > > > existing Gen1 firmware, so backward compatibility remains intact.
> > > > 
> > > > We are simply adding support for Gen2 firmware for this architecture. As a
> > > > result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> > > > Gen2 firmware (via Qualcomm's video driver [1]).
> 
> I agree with Dmitry here.
> 
> Its not possible to disjunct upstream HFI6xx @ the firmware level between
> Venus and Iris because the DTS would have to point to a particular firmware
> depending on which driver you wanted to run, which would make the DT
> dependent on the driver, which is not allowed.

The only possible way to make that work would be to:
- make iris driver detect the firmware interface and then use either
  gen1 or gen2 interface
- make that into the upstream kernel
- drop venus support for sc7280

> 
> > > > Additionally, as part of our plan to transition all Venus-supported targets
> > > > to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> > > > to maintain backward compatibility.
> > > Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> > > interchangeable for the hardware they both support, until the venus
> > > driver drops support for V6 hardware. At that point it's expected that
> > > there will be no V6 support in Venus driver.
> > > 
> > > You can not simply upgrade to Gen2 firmware as if nothing happened.
> > > Consider a device node on SC7280 / QCS6490 with the firmware-name
> > > pointing to OEM-signed firmware. Both Venus and Iris drivers would
> > > happily consume the device node and try to work with it. One will work,
> > > another one will fail. This is definitely not what we have agreed upon,
> > > when you started adding Iris driver.
> > @Vikash, could you please chime in?
> 
> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a new
> SoC that doesn't appear upstream yet but, that's not the case with
> 7280/6490.

-- 
With best wishes
Dmitry

