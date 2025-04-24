Return-Path: <linux-media+bounces-30930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537ACA9AA75
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72B46194036D
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E030F22129E;
	Thu, 24 Apr 2025 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIzUkKFh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B722129B
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490492; cv=none; b=t40N5rsPwNKoNnPxk2OIpu5NQGucRR1LqrxYyw3ez/sNlxoMfrvqQSUGaZGfGz2DEercGyXhPg2ohQf/qGNEGCikO2R5+F5N/3Ue2a4IT9j/ReXtl7jduypDAgJIo39z5R6rpUrt0P9EhXfdYiZ79fmw4Lil1JbSUWonyqBP2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490492; c=relaxed/simple;
	bh=dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTVBz81pGgwbgvRLSkuifoM/StxOiaArFQ9tHIO4OxyfrYHTkp4QU2n6l4JMkXPDCdHtAMY79U8IYEPBac3UBsIBb+jMAcexJvTNYEv6PsEvnzWeqeRDpl3zZqYWxDcqCPhdLVTM0L2U50gesmilHAPOOCuKRAeTNNeEUE7RGvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIzUkKFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAFLce006002
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=; b=ZIzUkKFh0PKsZ2KR
	S33zbxVPl4+yLe6WLwHArPgXQhKTZ+Awl03fU4mcgrDGcklIGnvoQs4eOGRywuGL
	N2UWjJLGF+elFSuu148pWKuPgkhJJGmLCiMn/35a1gWjo+2mdxVMmjfmzouJxg9c
	lXyoHEBqqTBTLVLgsHdpWbTWOcmHN9xLxcQ18v9Lhm3sAnV7wyi/NutKuKMtRHCx
	lyr/maVu0Qh16ygkTrsAEaYDzcznjXcd2H5svQ7Jou4Fqe236PEMgMjM6lL+6UVb
	ek7I5MWgZ7OX3o/omaAJCSIksZjbeXyBVV2BN2E8Ujkfr+B0VIR9WoNHb6T3sVcn
	QTfjfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh056as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:28:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so133517485a.0
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490489; x=1746095289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxaNNaCb7wx8tJ7MXo6Th49dUK/WwBE1ivS8aRZaFnY=;
        b=i0zjHF6G5sy/Qi5bYhvbQYFxYGXkX6/wnEczC0FVFmmI8TNbjtDUBf3HXthyFRR2LT
         DwvDC9skEg/1cKPzrJSYTq810Iw2l0Ew312dXtjOvsr8wJc9EfXx9S5NxLTPobj8MZuv
         Sz8lQ7/XoP9rTt6mlb8aZhihH8BRn/qVU3qltIxCHtT7MV+YZg4iVG9FsYqaE1tit8G4
         DSUbDOk4fEuxhJHuZayEG4gnBB/GoI2lJHHG+7xJMNnH0/5DJNLg6sSOU1D7SffnU4UB
         /WAcYHm9CfI+nesfOwengaJX+iueglPGrL1aG11WPF5PwsTR+Z5ET93kbKH23PcnMKb8
         149Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRBh5nV9xef33n4QtRDPEJ4sM6yyWDerlglnIyzrgaCAVe3rUjbC3g1Vj7CBn3Eu6le2pm21yQCMOKuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwn7RunUbBdyTlGCbPzKFAtoPUb5QQ8dqrG1f3jII4T1eBoFYp
	tzXYGZLSMJ5V78p8PoeYdYDhPwz9IdwyVWQ92uAbEJGplLiGNUjAXTRBfRguGeDjQXNaekCyBCK
	4TtmNgBdu4M7FB83UeCGhmdyk0lVBYztZh0KbV8VDsHJeWg4xQQTgJuKwD7uVmzzinHUF4AZonA
	i72WOLIvfmnN2+9/CbAYkdILw+z5f6cAjmH2D4
X-Gm-Gg: ASbGnct5ODyylUvcMK3qbe0Ww7AENCzU7nwY15UpomN/6B7EBKpLs52bZF2M9GOQNj8
	o0QIBj1KA0HtyGmC4iROvNalT1qWctD4UdKz+U4kjjwS3hJlUPAkk1fQBEjc3ke1F6fpZApM=
X-Received: by 2002:a05:620a:3908:b0:7c9:2383:afef with SMTP id af79cd13be357-7c956f45eb6mr320451485a.37.1745490488996;
        Thu, 24 Apr 2025 03:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5BZlCzf2Zo1ugwuFPVTG43+W/s7bg/g7I+h0Q5YvLmNtAP024uFmveP2mjEmcoy+ivjTHrQbqnbWyp7aw5WU=
X-Received: by 2002:a05:620a:3908:b0:7c9:2383:afef with SMTP id
 af79cd13be357-7c956f45eb6mr320448285a.37.1745490488691; Thu, 24 Apr 2025
 03:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com> <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
 <hjaep4muhpl2t5hfajnmvaueq2m24rwbjkfggvhk7otl6naeoi@hqs5ejhp4sef> <2ab8e807-6fe0-4f59-8bcb-0870124021df@linaro.org>
In-Reply-To: <2ab8e807-6fe0-4f59-8bcb-0870124021df@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:27:56 +0200
X-Gm-Features: ATxdqUEA6-iL777V9qP2C6CLVQbLEBUOR3aB-ZkTOJXgCuPugvYUfVi5WAf4m00
Message-ID: <CAFEp6-0tDYScsFkHCwF21rCx4stB0P1An3QS1DvwisPooSxbgA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, rfoss@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfX2PGToHlSrYB3 Mb5pcF2Gs9foA9BIqM7jwiXbCSY4NiAi9drbe++CDRz108gSenVDyomx1QIfq6BH67q2w4loCYA Zo7PDJNWYUuEpXLbhvLHeLXb/JXveIWHC2zCQeB9vN2ChT7h1gvWGS24vwtM8YRsVx5/TTvU50G
 mLIFWDfR2aNiGWxagfv/TOEK/CB6C+Jz8Qfvpt0rkKwwXoZcZCK8vM+JmMuH7V/wglMsAOjis44 vRwb0CPOQ+3BF7ZHUqAF8GSc0AwmrTjXdlZ/UDJx1mmTeOqeUQtFYYwDCuaicZd7lljmJ4erEiM GwygGaT3dYqbux9bdVz4YvEXW153B2yyl5nmvgidSnrv9DUTPtXPRQLjKfHkeQB5fyGIDlzk6VD
 4i2BIe/VjJZ6sqJ0tSX83XcdikcZXimRXIGZsUVBbsLfeB5iAbR4VlBe7SnLGX3gX+jjZVFG
X-Proofpoint-GUID: 7rlPr6xRGSCcNGu3RGzAmU_u3-KipEI1
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a1239 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=zU4xAU1DtyMVwtNcgFYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7rlPr6xRGSCcNGu3RGzAmU_u3-KipEI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=906 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069

On Thu, Apr 24, 2025 at 11:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/04/2025 10:22, Dmitry Baryshkov wrote:
> >> Pins are called:
> >> - VDD_A_CSI_0_1P2 (for csiphy 0)
> >> - VDD_A_CSI_1_1P2 (for csiphy 1)
> >> (both of the above are supplied together without individual control)
> > Is this a requirement of the SoC or just a typical implementation?
>
> Its usual for each PHY to have its own external power rail/rails.
>
> In this case the PLL power rail is shared but, that is not guaranteed as
> a feature of these PHYs.

Indeed, Then I guess it is probably better to have both a
vdda-csiphy0-1p2-supply and a vdda-csiphy1-1p2-supply.
Still we need to agree on that voltage name, before I submit a new version.






>
> 1p2 - digital logic is individual on this SoC.

